;==============================================================================
; Dragon Quest III - Bank $44
; Type: Dma
; Purpose: DMA operations and data transfer
; Address Range: $E20000-$E27FFF
; Instructions: 8799
; Bytes: 32768
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_44"

;------------------------------------------------------------------------------
; Bank44_DmaFunction_000
; Address: $E28000
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_000:
    SBC #$78             ; E9 78 | Subtract with carry (immediate)
    PHX                  ; DA | Push X register to stack
    ROR                  ; 6A | Rotate right (accumulator)
    WDM #$26             ; 42 26 | Reserved instruction
    LSR $F6              ; 46 F6 | Logical shift right (zero page)
    STX $C6              ; 86 C6 | Store X register to zero page
    STX $A5              ; 86 A5 | Store X register to zero page
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $8EF1            ; 0E F1 8E | Arithmetic shift left (absolute)
    AND ($9C,X)          ; 21 9C | Logical AND with accumulator ((zero page,X))
    CLI                  ; 58 | Clear interrupt disable flag
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    LSR $2766            ; 4E 66 27 | Logical shift right (absolute)
    ADC ($07),Y          ; 71 07 | Add with carry ((zero page),Y)
    ASL $16              ; 06 16 | Arithmetic shift left (zero page)
    BIT $2D34            ; 2C 34 2D | Test bits in accumulator (absolute)
    AND $2B0F            ; 2D 0F 2B | Logical AND with accumulator (absolute)
    ORA $19              ; 05 19 | Logical OR with accumulator (zero page)
    ORA $1A02,Y          ; 19 02 1A | Logical OR with accumulator (absolute,Y)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND ($0A),Y          ; 31 0A | Logical AND with accumulator ((zero page),Y)
    EOR ($1C,X)          ; 41 1C | Exclusive OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    LSR $DF20            ; 4E 20 DF | Logical shift right (absolute)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 41 6F 00 | Load from absolute long,X into accumulator
    BVC $5F              ; 50 5F | Branch if overflow clear
    PLA                  ; 68 | Pull accumulator from stack
    CPY #$2D             ; C0 2D | Compare Y register (immediate)
    REP #$15             ; C2 15 | Reset processor status bits
    CPX #$36             ; E0 36 | Compare X register (immediate)
    INY                  ; C8 | Increment Y register
    ROL $17C1            ; 2E C1 17 | Rotate left (absolute)
    CPY #$2B             ; C0 2B | Compare Y register (immediate)
    BNE $09              ; D0 09 | Branch if not equal
    BEQ $2B              ; F0 2B | Branch if equal
    ADC ($21),Y          ; 71 21 | PPU graphics register access
    AND $2B03,X          ; 3D 03 2B | Logical AND with accumulator (absolute,X)
    ORA $1D01            ; 0D 01 1D | Logical OR with accumulator (absolute)
    ORA $1E15,X          ; 1D 15 1E | Logical OR with accumulator (absolute,X)
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    ORA ($0D,X)          ; 01 0D | Logical OR with accumulator ((zero page,X))
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    LSR $84CF            ; 4E CF 84 | Logical shift right (absolute)
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank44_DmaFunction_001
; Address: $E28085
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_001:
    LDA $B5              ; A5 B5 | Load from zero page into accumulator
    BCS $DD              ; B0 DD | Branch if carry set
    SED                  ; F8 | Set decimal mode flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank44_DmaFunction_002
; Address: $E2808B
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_002:
    PHX                  ; DA | Push X register to stack
    LSR $4E46            ; 4E 46 4E | Logical shift right (absolute)
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    BRA $7E              ; 80 7E | Branch always
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    BMI $CF              ; 30 CF | Branch if negative
    PHA                  ; 48 | Push accumulator to stack
    WDM #$9D             ; 42 9D | Reserved instruction
    ROR $09              ; 66 09 | Rotate right (zero page)
    ORA $2F              ; 05 2F | Logical OR with accumulator (zero page)
    ASL $27              ; 06 27 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    AND $F200,X          ; 3D 00 F2 | Logical AND with accumulator (absolute,X)
    STA $FFC0,Y          ; 99 C0 FF | Store accumulator to absolute,Y
    STA $D4              ; 85 D4 | Store accumulator to zero page
    STX $CD              ; 86 CD | Store X register to zero page
    NOP                  ; EA | No operation
    BRA $4D              ; 80 4D | Branch always
    LDX #$54             ; A2 54 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank44_DmaFunction_003
; Address: $E280DB
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_003:
    JSR $C629            ; 20 29 C6 | Jump to subroutine
    BPL $EF              ; 10 EF | Branch if positive
    CPY #$EE             ; C0 EE | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    STA $7440,Y          ; 99 40 74 | Store accumulator to absolute,Y
    BRA $9B              ; 80 9B | Branch always
    CPX #$0E             ; E0 0E | Compare X register (immediate)
    BRA $D9              ; 80 D9 | Branch always
    BRA $A6              ; 80 A6 | Branch always
    CLI                  ; 58 | Clear interrupt disable flag
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    CLI                  ; 58 | Clear interrupt disable flag
    CLI                  ; 58 | Clear interrupt disable flag
    PHA                  ; 48 | Push accumulator to stack
    ADC $F715,X          ; 7D 15 F7 | Add with carry (absolute,X)
    SBC $B700,X          ; FD 00 B7 | Subtract with carry (absolute,X)
    LDX #$00             ; A2 00 | Load immediate value into X register
    STA $BA97,Y          ; 99 97 BA | Store accumulator to absolute,Y
    ROR $F1              ; 66 F1 | Rotate right (zero page)
    AND ($C4,X)          ; 21 C4 | Logical AND with accumulator ((zero page,X))
    AND ($A3,X)          ; 21 A3 | Logical AND with accumulator ((zero page,X))
    ASL $12              ; 06 12 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_005
; Address: $E28132
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_005:
    JSR $00DF            ; 20 DF 00 | Jump to subroutine
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    PHY                  ; 5A | Push Y register to stack
    EOR $FF25,X          ; 5D 25 FF | Exclusive OR with accumulator (absolute,X)
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    STA ($F9),Y          ; 91 F9 | Store accumulator to (zero page),Y
    BPL $B9              ; 10 B9 | Branch if positive
    BPL $30              ; 10 30 | Branch if positive
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    PHX                  ; DA | Push X register to stack
    TYA                  ; 98 | Transfer Y register to accumulator
    BPL $00              ; 10 00 | Branch if positive
    ASL $1F02,X          ; 1E 02 1F | Arithmetic shift left (absolute,X)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CMP $B7              ; C5 B7 | Compare accumulator (zero page)
    LDA $B7              ; A5 B7 | Load from zero page into accumulator
    SBC $7954,X          ; FD 54 79 | Subtract with carry (absolute,X)
    ORA ($78,X)          ; 01 78 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    DEC                  ; 3A | Decrement accumulator
    WDM #$3D             ; 42 3D | Reserved instruction
    WDM #$38             ; 42 38 | Reserved instruction
    CLI                  ; 58 | Clear interrupt disable flag
    CLI                  ; 58 | Clear interrupt disable flag
    ORA $0A              ; 05 0A | Logical OR with accumulator (zero page)
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    INY                  ; C8 | Increment Y register
    INC $0774            ; EE 74 07 | Increment (absolute)
    BCC $70              ; 90 70 | Branch if carry clear
    DEY                  ; 88 | Decrement Y register
    PLA                  ; 68 | Pull accumulator from stack
    ROL $00E0            ; 2E E0 00 | Rotate left (absolute)
    ORA #$0E             ; 09 0E | Logical OR with accumulator (immediate)
    ORA ($16),Y          ; 11 16 | Logical OR with accumulator ((zero page),Y)
    WDM #$1F             ; 42 1F | Reserved instruction
    CLI                  ; 58 | Clear interrupt disable flag
    ADC $3D80,X          ; 7D 80 3D | Add with carry (absolute,X)
    STA ($3E,X)          ; 81 3E | Store accumulator to (zero page,X)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank44_DmaFunction_006
; Address: $E281EC
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_006:
    AND $3E80,X          ; 3D 80 3E | Logical AND with accumulator (absolute,X)
    LDX #$E4             ; A2 E4 | Load immediate value into X register
    PLX                  ; FA | Pull X register from stack
    ORA ($B5,X)          ; 01 B5 | Logical OR with accumulator ((zero page,X))
    TSX                  ; BA | Transfer stack pointer to X register
    ORA ($DF,X)          ; 01 DF | Logical OR with accumulator ((zero page,X))
    DEC $9A01,X          ; DE 01 9A | Decrement (absolute,X)
    EOR ($CF,X)          ; 41 CF | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank44_DmaFunction_007
; Address: $E281FF
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_007:
    JSR $07A2            ; 20 A2 07 | Jump to subroutine
    WDM #$82             ; 42 82 | Reserved instruction
    CPX #$87             ; E0 87 | Compare X register (immediate)
    BRA $D7              ; 80 D7 | Branch always
    CPY $8E              ; C4 8E | Compare Y register (zero page)
    CPY $65              ; C4 65 | Compare Y register (zero page)
    CPX $94              ; E4 94 | Compare X register (zero page)
    BEQ $14              ; F0 14 | Branch if equal
    INX                  ; E8 | Increment X register
    ASL $8CB0            ; 0E B0 8C | Arithmetic shift left (absolute)
    BVS $1C              ; 70 1C | Branch if overflow set
    CPX #$88             ; E0 88 | Compare X register (immediate)
    BVS $08              ; 70 08 | Branch if overflow set
    BVS $08              ; 70 08 | Branch if overflow set
    BCS $1E              ; B0 1E | Branch if carry set
    EOR $7880,X          ; 5D 80 78 | Exclusive OR with accumulator (absolute,X)
    CPY #$3B             ; C0 3B | Compare Y register (immediate)
    STA ($39,X)          ; 81 39 | Store accumulator to (zero page,X)
    WDM #$1C             ; 42 1C | Reserved instruction
    BIT $A1              ; 24 A1 | Test bits in accumulator (zero page)
    CLD                  ; D8 | Clear decimal mode flag
    LDX $F400,Y          ; BE 00 F4 | Load from absolute,Y into X register
    SBC ($04,X)          ; E1 04 | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank44_DmaFunction_008
; Address: $E2823B
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_008:
    JSL $C642B9          ; 22 B9 42 C6 | Jump to subroutine long
    AND $26D0,Y          ; 39 D0 26 | Logical AND with accumulator (absolute,Y)
    LDY #$C2             ; A0 C2 | Load immediate value into Y register
    NOP                  ; EA | No operation
    LDY $47              ; A4 47 | Load from zero page into Y register
    CPY #$06             ; C0 06 | Compare Y register (immediate)
    CPY #$0B             ; C0 0B | Compare Y register (immediate)
    STY $38              ; 84 38 | Store Y register to zero page
    BIT $58              ; 24 58 | Test bits in accumulator (zero page)
    ASL $8CE0,X          ; 1E E0 8C | Arithmetic shift left (absolute,X)
    BVS $2C              ; 70 2C | Branch if overflow set
    BNE $18              ; D0 18 | Branch if not equal
    CPX #$0C             ; E0 0C | Compare X register (immediate)
    BEQ $0C              ; F0 0C | Branch if equal
    BEQ $03              ; F0 03 | Branch if equal
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    PHY                  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank44_DmaFunction_009
; Address: $E2826C
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_009:
    ROL                  ; 2A | Rotate left (accumulator)
    PLA                  ; 68 | Pull accumulator from stack
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    STZ $00              ; 64 00 | Store zero to zero page
    PHA                  ; 48 | Push accumulator to stack
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    PLY                  ; 7A | Pull Y register from stack
    RTI                  ; 40 | Return from interrupt
    BVC $40              ; 50 40 | Branch if overflow clear
    BMI $E0              ; 30 E0 | Game work RAM access
    INX                  ; E8 | Increment X register
    PEA #$F8AC           ; F4 AC F8 | Push effective address to stack
    DEY                  ; 88 | Decrement Y register
    BIT $40              ; 24 40 | Test bits in accumulator (zero page)
    BCS $00              ; B0 00 | Branch if carry set
    BPL $00              ; 10 00 | Branch if positive
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ROL $DA00            ; 2E 00 DA | Rotate left (absolute)
    LSR $8174,X          ; 5E 74 81 | Logical shift right (absolute,X)
    JMP $3552            ; 4C 52 35 | Jump to address
    SBC $A551,X          ; FD 51 A5 | Subtract with carry (absolute,X)
    INC                  ; 1A | Increment accumulator
    BVS $61              ; 70 61 | Branch if overflow set
    AND $67FE,X          ; 3D FE 67 | Logical AND with accumulator (absolute,X)
    PLB                  ; AB | Pull data bank register from stack
    LSR                  ; 4A | Logical shift right (accumulator)
    LDX $DE00            ; AE 00 DE | Load from absolute address into X register
    PHY                  ; 5A | Push Y register to stack
    TYA                  ; 98 | Transfer Y register to accumulator
    STA $163842          ; 8F 42 38 16 | Store accumulator to absolute long address
    AND $0458            ; 2D 58 04 | Logical AND with accumulator (absolute)
    SBC $02DE,Y          ; F9 DE 02 | Subtract with carry (absolute,Y)
    LDA $FE91            ; AD 91 FE | Load from absolute address into accumulator
    LDA $EE00,X          ; BD 00 EE | Load from absolute,X into accumulator
    SBC $AD00,X          ; FD 00 AD | Subtract with carry (absolute,X)
    PHY                  ; 5A | Push Y register to stack
    PHP                  ; 08 | Push processor status to stack
    ADC $132E            ; 6D 2E 13 | Add with carry (absolute)
    BIT $0E05            ; 2C 05 0E | Test bits in accumulator (absolute)
    ASL $0B              ; 06 0B | Arithmetic shift left (zero page)
    AND $2F00,X          ; 3D 00 2F | Logical AND with accumulator (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    STA $AAD4,X          ; 9D D4 AA | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank44_DmaFunction_00A
; Address: $E28304
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_00A:
    JSR $C0DE            ; 20 DE C0 | Jump to subroutine
    INX                  ; E8 | Increment X register
    BCC $50              ; 90 50 | Branch if carry clear
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank44_DmaFunction_00B
; Address: $E2830D
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_00B:
    SEI                  ; 78 | Set interrupt disable flag
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    XBA                  ; EB | Exchange accumulator bytes
    ROR $FE00,X          ; 7E 00 FE | Rotate right (absolute,X)
    RTI                  ; 40 | Return from interrupt
    INX                  ; E8 | Increment X register
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    LDY #$ED             ; A0 ED | Load immediate value into Y register
    INC                  ; 1A | Increment accumulator
    CLI                  ; 58 | Clear interrupt disable flag
    EOR $3C              ; 45 3C | Exclusive OR with accumulator (zero page)
    SBC ($0D,X)          ; E1 0D | Subtract with carry ((zero page,X))
    NOP                  ; EA | No operation
    BMI $F7              ; 30 F7 | Branch if negative
    LDY $89F9            ; AC F9 89 | Load from absolute address into Y register
    AND $F7              ; 25 F7 | Logical AND with accumulator (zero page)
    LDA                  ; BF 00 1F 00 | Load from absolute long,X into accumulator
    STZ $A3DA            ; 9C DA A3 | Store zero to absolute
    PLP                  ; 28 | Pull processor status from stack
    INY                  ; C8 | Increment Y register
    PHY                  ; 5A | Push Y register to stack
    ROL                  ; 2A | Rotate left (accumulator)
    PLA                  ; 68 | Pull accumulator from stack
    LDA $EB              ; A5 EB | Load from zero page into accumulator
    SED                  ; F8 | Set decimal mode flag
    INX                  ; E8 | Increment X register
    CPX $00              ; E4 00 | Compare X register (zero page)
    INY                  ; C8 | Increment Y register
    CPX $00              ; E4 00 | Compare X register (zero page)
    PHX                  ; DA | Push X register to stack
    LDA $630A58          ; AF 58 0A 63 | Load from absolute long address into accumulator
    PLP                  ; 28 | Pull processor status from stack
    PHA                  ; 48 | Push accumulator to stack
    PHY                  ; 5A | Push Y register to stack
    ROL                  ; 2A | Rotate left (accumulator)
    PLA                  ; 68 | Pull accumulator from stack
    ORA $F7              ; 05 F7 | Logical OR with accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    PLP                  ; 28 | Pull processor status from stack
    STZ $00              ; 64 00 | Store zero to zero page
    PHA                  ; 48 | Push accumulator to stack
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    PLY                  ; 7A | Pull Y register from stack
    STA $4A54,X          ; 9D 54 4A | Store accumulator to absolute,X
    BMI $EE              ; 30 EE | Branch if negative
    INX                  ; E8 | Increment X register
    PEA #$F8AC           ; F4 AC F8 | Push effective address to stack
    DEY                  ; 88 | Decrement Y register
    BIT $EB              ; 24 EB | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_00C
; Address: $E28392
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_00C:
    LDX $1E00,Y          ; BE 00 1E | Load from absolute,Y into X register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ROL $DA00            ; 2E 00 DA | Rotate left (absolute)
    CMP $03              ; C5 03 | Compare accumulator (zero page)
    CLI                  ; 58 | Clear interrupt disable flag
    RTI                  ; 40 | Return from interrupt
    SEP #$0F             ; E2 0F | Set processor status bits
    INX                  ; E8 | Increment X register
    PEA #$F8AC           ; F4 AC F8 | Push effective address to stack
    DEY                  ; 88 | Decrement Y register
    BIT $FC              ; 24 FC | Test bits in accumulator (zero page)
    LDA                  ; BF 00 1D 00 | Load from absolute long,X into accumulator
    LDA $03DA20          ; AF 20 DA 03 | Load from absolute long address into accumulator
    PHA                  ; 48 | Push accumulator to stack
    INY                  ; C8 | Increment Y register
    PHY                  ; 5A | Push Y register to stack
    TAX                  ; AA | Transfer accumulator to X register
    PLA                  ; 68 | Pull accumulator from stack
    ORA $DF              ; 05 DF | Logical OR with accumulator (zero page)
    SED                  ; F8 | Set decimal mode flag
    PLA                  ; 68 | Pull accumulator from stack
    STZ $00              ; 64 00 | Store zero to zero page
    INY                  ; C8 | Increment Y register
    CPX $00              ; E4 00 | Compare X register (zero page)
    PLX                  ; FA | Pull X register from stack
    STA $163942          ; 8F 42 39 16 | Store accumulator to absolute long address
    AND $0458            ; 2D 58 04 | Logical AND with accumulator (absolute)
    SBC $03DE,Y          ; F9 DE 03 | Subtract with carry (absolute,Y)
    LDA $FE91            ; AD 91 FE | Load from absolute address into accumulator
    LDA $EF00,X          ; BD 00 EF | Load from absolute,X into accumulator
    SBC $DB00,X          ; FD 00 DB | Subtract with carry (absolute,X)
    SBC $5E00,X          ; FD 00 5E | Subtract with carry (absolute,X)
    STA ($4C,X)          ; 81 4C | Store accumulator to (zero page,X)
    SBC $A551,X          ; FD 51 A5 | Subtract with carry (absolute,X)
    INC                  ; 1A | Increment accumulator
    BEQ $E1              ; F0 E1 | Branch if equal
    AND $67FE,X          ; 3D FE 67 | Logical AND with accumulator (absolute,X)
    PLB                  ; AB | Pull data bank register from stack
    DEX                  ; CA | Decrement X register
    LDX $DE00            ; AE 00 DE | Load from absolute address into X register
    PHY                  ; 5A | Push Y register to stack
    BRA $98              ; 80 98 | Branch always
    INC $7C00,X          ; FE 00 7C | Increment (absolute,X)
    SBC $FB9A,Y          ; F9 9A FB | Subtract with carry (absolute,Y)
    CLD                  ; D8 | Clear decimal mode flag
    CMP ($D2),Y          ; D1 D2 | Compare accumulator ((zero page),Y)
    CPY $07              ; C4 07 | Compare Y register (zero page)
    WDM #$02             ; 42 02 | Reserved instruction
    PHP                  ; 08 | Push processor status to stack
    ADC $00              ; 65 00 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_00D
; Address: $E2843A
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_00D:
    LDA $00FB00          ; AF 00 FB 00 | Load from absolute long address into accumulator
    SBC $FB00,X          ; FD 00 FB | Subtract with carry (absolute,X)
    BRA $BF              ; 80 BF | Branch always
    BMI $BF              ; 30 BF | Branch if negative
    BMI $63              ; 30 63 | Branch if negative
    SBC $1B0A,Y          ; F9 0A 1B | Subtract with carry (absolute,Y)
    CPX #$7E             ; E0 7E | Compare X register (immediate)
    STX $80              ; 86 80 | Store X register to zero page
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ROR $0CC1,X          ; 7E C1 0C | Rotate right (absolute,X)
    INY                  ; C8 | Increment Y register
    PEA #$BF00           ; F4 00 BF | Push effective address to stack
    SBC $4B00,Y          ; F9 00 4B | Subtract with carry (absolute,Y)
    INY                  ; C8 | Increment Y register
    JMP $3D00            ; 4C 00 3D | Jump to address
    ASL $0001            ; 0E 01 00 | Arithmetic shift left (absolute)
    ROL                  ; 2A | Rotate left (accumulator)
    PLA                  ; 68 | Pull accumulator from stack
    BEQ $13              ; F0 13 | Branch if equal
    CPY #$17             ; C0 17 | Compare Y register (immediate)
    BRA $09              ; 80 09 | Branch always
    ORA $0806            ; 0D 06 08 | Logical OR with accumulator (absolute)
    INC $FC01,X          ; FE 01 FC | Increment (absolute,X)
    STZ $1E03            ; 9C 03 1E | Store zero to absolute
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    LDY $0023            ; AC 23 00 | Load from absolute address into Y register
    CLC                  ; 18 | Clear carry flag
    CPX $02              ; E4 02 | Compare X register (zero page)
    BNE $04              ; D0 04 | Branch if not equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $3D              ; 80 3D | Branch always
    ORA ($E6,X)          ; 01 E6 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    INC $1800,X          ; FE 00 18 | Increment (absolute,X)
    BRA $00              ; 80 00 | Branch always
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA $0000            ; 0D 00 00 | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    EOR $02              ; 45 02 | Exclusive OR with accumulator (zero page)
    LDX $BF31,Y          ; BE 31 BF | Load from absolute,Y into X register
    BMI $63              ; 30 63 | Branch if negative
    ADC $1B0A,Y          ; 79 0A 1B | Add with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_00E
; Address: $E2850D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_00E:
    JSR $061E            ; 20 1E 06 | Jump to subroutine
    BVS $0C              ; 70 0C | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    ORA $0000,Y          ; 19 00 00 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_00F
; Address: $E2852E
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_00F:
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ORA ($2F),Y          ; 11 2F | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    BPL $18              ; 10 18 | Branch if positive
    ASL $20              ; 06 20 | Arithmetic shift left (zero page)
    ASL $2C              ; 06 2C | Arithmetic shift left (zero page)
    SEC                  ; 38 | Set carry flag
    ORA ($1C,X)          ; 01 1C | Logical OR with accumulator ((zero page,X))
    INC $7C00,X          ; FE 00 7C | Increment (absolute,X)
    INC $80              ; E6 80 | Increment (zero page)
    STA $DBFA,Y          ; 99 FA DB | Store accumulator to absolute,Y
    SED                  ; F8 | Set decimal mode flag
    CMP ($D2),Y          ; D1 D2 | Compare accumulator ((zero page),Y)
    CPY $07              ; C4 07 | Compare Y register (zero page)
    PHP                  ; 08 | Push processor status to stack
    ADC $00              ; 65 00 | Add with carry (zero page)
    LDA $00FB00          ; AF 00 FB 00 | Load from absolute long address into accumulator
    CPY #$CB             ; C0 CB | Compare Y register (immediate)
    CPY $C9              ; C4 C9 | Compare Y register (zero page)
    DEC $12              ; C6 12 | Decrement (zero page)
    ORA $2116            ; 0D 16 21 | PPU graphics register access
    DEC $2701,X          ; DE 01 27 | Decrement (absolute,X)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    ORA ($20),Y          ; 11 20 | Logical OR with accumulator ((zero page),Y)
    ASL $003F            ; 0E 3F 00 | Arithmetic shift left (absolute)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    LDA                  ; BF 00 FD 02 | Load from absolute long,X into accumulator
    AND ($CE),Y          ; 31 CE | Logical AND with accumulator ((zero page),Y)
    CMP $EC26,Y          ; D9 26 EC | Compare accumulator (absolute,Y)
    STZ $0302            ; 9C 02 03 | Store zero to absolute
    STA $17              ; 85 17 | Store accumulator to zero page
    BVS $80              ; 70 80 | Branch if overflow set
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank44_DmaFunction_010
; Address: $E285B3
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_010:
    JSR $10CF            ; 20 CF 10 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    LSR                  ; 4A | Logical shift right (accumulator)
    STY $5F              ; 84 5F | Store Y register to zero page
    CLI                  ; 58 | Clear interrupt disable flag
    CLV                  ; B8 | Clear overflow flag
    CLI                  ; 58 | Clear interrupt disable flag
    BRA $18              ; 80 18 | Branch always
    CPX #$0E             ; E0 0E | Compare X register (immediate)
    CPX $00              ; E4 00 | Compare X register (zero page)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank44_DmaFunction_012
; Address: $E285E9
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_012:
    JSR $8936            ; 20 36 89 | Jump to subroutine
    SBC $FC06,Y          ; F9 06 FC | Subtract with carry (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    ORA ($34,X)          ; 01 34 | Logical OR with accumulator ((zero page,X))
    BVS $06              ; 70 06 | Branch if overflow set
    BVC $08              ; 50 08 | Branch if overflow clear
    CPY #$0C             ; C0 0C | Compare Y register (immediate)
    CPY #$34             ; C0 34 | Compare Y register (immediate)
    PLA                  ; 68 | Pull accumulator from stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ROR $BF21,X          ; 7E 21 BF | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_013
; Address: $E28609
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_013:
    JSR $811E            ; 20 1E 81 | Jump to subroutine
    ADC #$86             ; 69 86 | Add with carry (immediate)
    CLC                  ; 18 | Clear carry flag
    ORA ($34,X)          ; 01 34 | Logical OR with accumulator ((zero page,X))
    BVS $06              ; 70 06 | Branch if overflow set
    BVC $08              ; 50 08 | Branch if overflow clear
    CPY #$0C             ; C0 0C | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BEQ $08              ; F0 08 | Branch if equal
    BEQ $08              ; F0 08 | Branch if equal
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $08              ; 05 08 | Logical OR with accumulator (zero page)
    ORA #$14             ; 09 14 | Logical OR with accumulator (immediate)
    ORA $0806            ; 0D 06 08 | Logical OR with accumulator (absolute)
    ASL $0C01            ; 0E 01 0C | Arithmetic shift left (absolute)
    ASL $0E01,X          ; 1E 01 0E | Arithmetic shift left (absolute,X)
    WDM #$02             ; 42 02 | Reserved instruction
    INY                  ; C8 | Increment Y register
    JMP $3D00            ; 4C 00 3D | Jump to address
    ASL $0001            ; 0E 01 00 | Arithmetic shift left (absolute)
    SBC $FC00,X          ; FD 00 FC | Subtract with carry (absolute,X)
    JMP ($3E80)          ; 6C 80 3E | Jump to address (absolute indirect)
    EOR ($98,X)          ; 41 98 | Exclusive OR with accumulator ((zero page,X))
    ROR $00              ; 66 00 | Rotate right (zero page)
    SED                  ; F8 | Set decimal mode flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    INC $F800,X          ; FE 00 F8 | Increment (absolute,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    INY                  ; C8 | Increment Y register
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    EOR ($38,X)          ; 41 38 | Exclusive OR with accumulator ((zero page,X))
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank44_DmaFunction_016
; Address: $E286C0
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_016:
    PEA #$F410           ; F4 10 F4 | Push effective address to stack
    BCS $04              ; B0 04 | Branch if carry set
    CLV                  ; B8 | Clear overflow flag
    BIT $80              ; 24 80 | Test bits in accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    CPX #$10             ; E0 10 | Compare X register (immediate)
    BRA $60              ; 80 60 | Branch always
    BRA $0C              ; 80 0C | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $DC              ; 80 DC | Branch always
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    ROR                  ; 6A | Rotate right (accumulator)
    TYA                  ; 98 | Transfer Y register to accumulator
    INY                  ; C8 | Increment Y register
    PHY                  ; 5A | Push Y register to stack
    NOP                  ; EA | No operation
    INX                  ; E8 | Increment X register
    ORA $23              ; 05 23 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_017
; Address: $E286F1
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_017:
    JSR $909C            ; 20 9C 90 | Jump to subroutine
    PLA                  ; 68 | Pull accumulator from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_018
; Address: $E286F6
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_018:
    PLP                  ; 28 | Pull processor status from stack
    STZ $00              ; 64 00 | Store zero to zero page
    INY                  ; C8 | Increment Y register
    BRA $24              ; 80 24 | Branch always
    PLY                  ; 7A | Pull Y register from stack
    RTI                  ; 40 | Return from interrupt
    AND $0EE0,Y          ; 39 E0 0E | Logical AND with accumulator (absolute,Y)
    INX                  ; E8 | Increment X register
    PEA #$F8AD           ; F4 AD F8 | Push effective address to stack
    BIT #$D2             ; 89 D2 | Test bits in accumulator (immediate)
    BIT $EC              ; 24 EC | Test bits in accumulator (zero page)
    LDY $0ABA            ; AC BA 0A | Load from absolute address into Y register
    ASL $15              ; 06 15 | Arithmetic shift left (zero page)
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ROL $DB00            ; 2E 00 DB | Rotate left (absolute)
    ORA ($5E,X)          ; 01 5E | Logical OR with accumulator ((zero page,X))
    STA ($4C,X)          ; 81 4C | Store accumulator to (zero page,X)
    SBC $A551,X          ; FD 51 A5 | Subtract with carry (absolute,X)
    INC                  ; 1A | Increment accumulator
    BVS $61              ; 70 61 | Branch if overflow set
    AND $67FE,X          ; 3D FE 67 | Logical AND with accumulator (absolute,X)
    PLB                  ; AB | Pull data bank register from stack
    DEX                  ; CA | Decrement X register
    BRA $AE              ; 80 AE | Branch always

;------------------------------------------------------------------------------
; Bank44_DmaFunction_019
; Address: $E28738
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_019:
    DEC $EF00,X          ; DE 00 EF | Decrement (absolute,X)
    BRA $DA              ; 80 DA | Branch always
    BRA $98              ; 80 98 | Branch always
    STA $163842          ; 8F 42 38 16 | Store accumulator to absolute long address
    AND $0458            ; 2D 58 04 | Logical AND with accumulator (absolute)
    SBC $02DE,Y          ; F9 DE 02 | Subtract with carry (absolute,Y)
    LDA $FE91            ; AD 91 FE | Load from absolute address into accumulator
    LDA $EF00,X          ; BD 00 EF | Load from absolute,X into accumulator
    ORA ($A7,X)          ; 01 A7 | Logical OR with accumulator ((zero page,X))
    SBC $DB01,X          ; FD 01 DB | Subtract with carry (absolute,X)
    SBC $AD00,X          ; FD 00 AD | Subtract with carry (absolute,X)
    PHY                  ; 5A | Push Y register to stack
    DEY                  ; 88 | Decrement Y register
    ADC $132E            ; 6D 2E 13 | Add with carry (absolute)
    BIT $0EF5            ; 2C F5 0E | Test bits in accumulator (absolute)
    STZ $6B06            ; 9C 06 6B | Store zero to absolute
    LDY $F704,X          ; BC 04 F7 | Load from absolute,X into Y register
    SBC $AFC0,X          ; FD C0 AF | Subtract with carry (absolute,X)
    BRA $0A              ; 80 0A | Branch always
    ORA $60              ; 05 60 | Logical OR with accumulator (zero page)
    BCC $9F              ; 90 9F | Branch if carry clear
    STA $AAD5,X          ; 9D D5 AA | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank44_DmaFunction_01A
; Address: $E28784
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_01A:
    JSR $C3DE            ; 20 DE C3 | Jump to subroutine
    INX                  ; E8 | Increment X register
    BVC $D9              ; 50 D9 | Branch if overflow clear
    SEI                  ; 78 | Set interrupt disable flag
    LDY #$EB             ; A0 EB | Load immediate value into Y register
    ROR $FF00,X          ; 7E 00 FF | Rotate right (absolute,X)
    ORA ($3C,X)          ; 01 3C | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    ASL $FE              ; 06 FE | Arithmetic shift left (zero page)
    JMP $13ECFC          ; 5C FC EC 13 | Jump to address long
    SBC $36C9            ; ED C9 36 | Subtract with carry (absolute)
    ADC #$5B             ; 69 5B | Add with carry (immediate)
    LDY $3F              ; A4 3F | Load from zero page into Y register
    CLD                  ; D8 | Clear decimal mode flag
    ORA #$AC             ; 09 AC | Logical OR with accumulator (immediate)
    EOR ($00),Y          ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ROL $00              ; 26 00 | Rotate left (zero page)
    CLC                  ; 18 | Clear carry flag
    ORA $5F00            ; 0D 00 5F | Logical OR with accumulator (absolute)
    STA $7A62,X          ; 9D 62 7A | Store accumulator to absolute,X
    STA $A05F            ; 8D 5F A0 | Store accumulator to absolute address
    STA $0772            ; 8D 72 07 | Store accumulator to absolute address
    INY                  ; C8 | Increment Y register
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    BRA $00              ; 80 00 | Branch always
    BVS $00              ; 70 00 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank44_DmaFunction_01B
; Address: $E287E0
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_01B:
    CPX $1213            ; EC 13 12 | Compare X register (absolute)
    SBC $38C7            ; ED C7 38 | Subtract with carry (absolute)
    LDY $7B53            ; AC 53 7B | Load from absolute address into Y register
    STY $A0              ; 84 A0 | Store Y register to zero page
    CPX $55A2            ; EC A2 55 | Compare X register (absolute)
    CPX $5D00            ; EC 00 5D | Compare X register (absolute)
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    STA $20DF            ; 8D DF 20 | Store accumulator to absolute address
    ORA #$96             ; 09 96 | Logical OR with accumulator (immediate)
    STA                  ; 9F 60 48 B7 | Store accumulator to absolute long,X
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank44_DmaFunction_01C
; Address: $E28817
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_01C:
    JSR $F800            ; 20 00 F8 | Jump to subroutine
    BEQ $00              ; F0 00 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_01D
; Address: $E2881F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_01D:
    LDY #$50             ; A0 50 | Load immediate value into Y register
    TAX                  ; AA | Transfer accumulator to X register
    DEY                  ; 88 | Decrement Y register
    LSR $B340,X          ; 5E 40 B3 | Logical shift right (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_01E
; Address: $E28827
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_01E:
    STA $5086,X          ; 9D 86 50 | Store accumulator to absolute,X
    CPY $3020            ; CC 20 30 | Compare Y register (absolute)
    STX $0071            ; 8E 71 00 | Store X register to absolute address
    STA                  ; 9F 00 FF 00 | Store accumulator to absolute long,X
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_020
; Address: $E28847
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_020:
    CPY $BB58            ; CC 58 BB | Compare Y register (absolute)
    DEY                  ; 88 | Decrement Y register
    CPY $5A23            ; CC 23 5A | Compare Y register (absolute)
    LDA $00              ; A5 00 | Load from zero page into accumulator
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    LDX $B800,Y          ; BE 00 B8 | Load from absolute,Y into X register
    BMI $00              ; 30 00 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_021
; Address: $E28861
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_021:
    STZ $01FE,X          ; 9E FE 01 | Store zero to absolute,X
    BIT #$8C             ; 89 8C | Test bits in accumulator (immediate)
    AND #$21             ; 29 21 | PPU graphics register access
    DEC $738C,X          ; DE 8C 73 | Decrement (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ROR $6481,X          ; 7E 81 64 | Rotate right (absolute,X)
    BIT $ED              ; 24 ED | Test bits in accumulator (zero page)
    BVS $8F              ; 70 8F | Branch if overflow set
    BIT $5BA4            ; 2C A4 5B | Test bits in accumulator (absolute)
    PHY                  ; 5A | Push Y register to stack
    LDA $00              ; A5 00 | Load from zero page into accumulator
    BRA $00              ; 80 00 | Branch always
    TYA                  ; 98 | Transfer Y register to accumulator
    BPL $00              ; 10 00 | Branch if positive
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank44_DmaFunction_022
; Address: $E2889D
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_022:
    CLI                  ; 58 | Clear interrupt disable flag
    INC $FC81,X          ; FE 81 FC | Increment (absolute,X)
    CPX #$1C             ; E0 1C | Compare X register (immediate)
    INC $FC81,X          ; FE 81 FC | Increment (absolute,X)
    CPY #$E3             ; C0 E3 | Compare Y register (immediate)
    SBC $FC03,X          ; FD 03 FC | Subtract with carry (absolute,X)
    SBC $03FD,X          ; FD FD 03 | Subtract with carry (absolute,X)
    PLX                  ; FA | Pull X register from stack
    INX                  ; E8 | Increment X register
    BPL $48              ; 10 48 | Branch if positive
    BCS $03              ; B0 03 | Branch if carry set
    SBC $FC03,X          ; FD 03 FC | Subtract with carry (absolute,X)
    SBC $01FF,X          ; FD FF 01 | Subtract with carry (absolute,X)
    SBC $FF06,Y          ; F9 06 FF | Subtract with carry (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    CPY #$0A             ; C0 0A | Compare Y register (immediate)
    TXA                  ; 8A | Transfer X register to accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CPY #$C2             ; C0 C2 | Compare Y register (immediate)
    CMP #$EA             ; C9 EA | Compare accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    TXA                  ; 8A | Transfer X register to accumulator
    ADC $F680,X          ; 7D 80 F6 | Add with carry (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    BPL $8F              ; 10 8F | Branch if positive
    STA                  ; 9F 00 8D 8A | Store accumulator to absolute long,X
    TXA                  ; 8A | Transfer X register to accumulator
    SBC $EBC1,Y          ; F9 C1 EB | Subtract with carry (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    SEI                  ; 78 | Set interrupt disable flag
    PEA #$FF00           ; F4 00 FF | Push effective address to stack
    ADC ($9F,X)          ; 61 9F | Add with carry ((zero page,X))
    ORA $0287            ; 0D 87 02 | Logical OR with accumulator (absolute)
    CMP ($14,X)          ; C1 14 | Compare accumulator ((zero page,X))
    LDY #$58             ; A0 58 | Load immediate value into Y register
    LDA                  ; BF 40 FF 08 | Load from absolute long,X into accumulator
    SED                  ; F8 | Set decimal mode flag
    SBC $9B02,X          ; FD 02 9B | Subtract with carry (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_023
; Address: $E28927
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_023:
    LDY $C2              ; A4 C2 | Load from zero page into Y register
    LDA $230C,X          ; BD 0C 23 | Load from absolute,X into accumulator
    STY $00DB            ; 8C DB 00 | Store Y register to absolute address
    BIT $78              ; 24 78 | Test bits in accumulator (zero page)
    SED                  ; F8 | Set decimal mode flag
    STA $E4FD            ; 8D FD E4 | Store accumulator to absolute address
    PEA #$BF0B           ; F4 0B BF | Push effective address to stack
    RTI                  ; 40 | Return from interrupt
    CPY #$84             ; C0 84 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_024
; Address: $E2893D
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_024:
    BIT $1BC0            ; 2C C0 1B | Test bits in accumulator (absolute)
    BRA $E0              ; 80 E0 | Game work RAM access
    INX                  ; E8 | Increment X register
    LDY #$7F             ; A0 7F | Load immediate value into Y register
    SBC ($1E),Y          ; F1 1E | Subtract with carry ((zero page),Y)
    ROL $544F,X          ; 3E 4F 54 | Rotate left (absolute,X)
    ROR $1F80            ; 6E 80 1F | Rotate right (absolute)
    BRA $EB              ; 80 EB | Branch always

;------------------------------------------------------------------------------
; Bank44_DmaFunction_025
; Address: $E28959
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_025:
    JSR $30DF            ; 20 DF 30 | Jump to subroutine
    INC $6400,X          ; FE 00 64 | Increment (absolute,X)
    STA ($0C),Y          ; 91 0C | Store accumulator to (zero page),Y
    STA $1F7686          ; 8F 86 76 1F | Store accumulator to absolute long address
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ASL $99              ; 06 99 | Arithmetic shift left (zero page)
    CLD                  ; D8 | Clear decimal mode flag
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    ROL $00FF,X          ; 3E FF 00 | Rotate left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    INC $4639,X          ; FE 39 46 | Increment (absolute,X)
    CMP ($F8,X)          ; C1 F8 | Compare accumulator ((zero page,X))
    SBC $5DD3,X          ; FD D3 5D | Subtract with carry (absolute,X)
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    ORA $FD              ; 05 FD | Logical OR with accumulator (zero page)
    EOR ($3E,X)          ; 41 3E | Exclusive OR with accumulator ((zero page,X))
    BEQ $7F              ; F0 7F | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SBC #$2F             ; E9 2F | Subtract with carry (immediate)
    DEC $06              ; C6 06 | Decrement (zero page)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $70              ; 80 70 | Branch always
    BRA $38              ; 80 38 | Branch always
    CPY #$08             ; C0 08 | Compare Y register (immediate)
    BEQ $11              ; F0 11 | Branch if equal
    CPX #$39             ; E0 39 | Compare X register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    BRA $8B              ; 80 8B | Branch always
    CPX #$E1             ; E0 E1 | Compare X register (immediate)
    CPX #$80             ; E0 80 | Compare X register (immediate)
    BRA $20              ; 80 20 | Branch always

;------------------------------------------------------------------------------
; Bank44_DmaFunction_027
; Address: $E289CE
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_027:
    BIT #$80             ; 89 80 | Test bits in accumulator (immediate)
    BVC $0F              ; 50 0F | Branch if overflow clear
    DEC $7F01,X          ; DE 01 7F | Decrement (absolute,X)
    ORA ($77),Y          ; 11 77 | Logical OR with accumulator ((zero page),Y)
    BIT #$3F             ; 89 3F | Test bits in accumulator (immediate)
    CPY #$3C             ; C0 3C | Compare Y register (immediate)
    BRA $7E              ; 80 7E | Branch always
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    BRA $3E              ; 80 3E | Branch always
    CMP ($F8,X)          ; C1 F8 | Compare accumulator ((zero page,X))
    LDY #$7F             ; A0 7F | Load immediate value into Y register
    SEC                  ; 38 | Set carry flag
    BMI $FF              ; 30 FF | Branch if negative
    LDY $5B              ; A4 5B | Load from zero page into Y register
    STZ $1B              ; 64 1B | Store zero to zero page
    SED                  ; F8 | Set decimal mode flag
    BRA $FB              ; 80 FB | Branch always
    LDY $5B              ; A4 5B | Load from zero page into Y register
    BEQ $0F              ; F0 0F | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BRA $FF              ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank44_DmaFunction_028
; Address: $E28A20
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_028:
    JSR $57DF            ; 20 DF 57 | Jump to subroutine
    TAY                  ; A8 | Transfer accumulator to Y register
    CPY $E669            ; CC 69 E6 | Compare Y register (absolute)
    PLP                  ; 28 | Pull processor status from stack
    CPY #$32             ; C0 32 | Compare Y register (immediate)
    BEQ $3A              ; F0 3A | Branch if equal

;------------------------------------------------------------------------------
; Bank44_DmaFunction_029
; Address: $E28A30
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_029:
    JSR $57DF            ; 20 DF 57 | Jump to subroutine
    TAY                  ; A8 | Transfer accumulator to Y register
    STY $0659            ; 8C 59 06 | Store Y register to absolute address
    BCS $0F              ; B0 0F | Branch if carry set
    CLD                  ; D8 | Clear decimal mode flag
    INY                  ; C8 | Increment Y register
    CPY #$25             ; C0 25 | Compare Y register (immediate)
    PHX                  ; DA | Push X register to stack
    DEC $8531            ; CE 31 85 | Decrement (absolute)
    PLY                  ; 7A | Pull Y register from stack
    STA $897670          ; 8F 70 76 89 | Store accumulator to absolute long address
    BRA $F2              ; 80 F2 | Branch always
    ORA $213E            ; 0D 3E 21 | PPU graphics register access
    CPY #$CE             ; C0 CE | Compare Y register (immediate)
    AND ($8D),Y          ; 31 8D | Logical AND with accumulator ((zero page),Y)
    STA $897670          ; 8F 70 76 89 | Store accumulator to absolute long address
    BRA $F2              ; 80 F2 | Branch always
    ORA $21FE            ; 0D FE 21 | PPU graphics register access
    ADC $FF86,Y          ; 79 86 FF | Add with carry (absolute,Y)
    BPL $FE              ; 10 FE | Branch if positive
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    AND ($DE,X)          ; 21 DE | Logical AND with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank44_DmaFunction_02A
; Address: $E28A72
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_02A:
    ADC $FF86,Y          ; 79 86 FF | Add with carry (absolute,Y)
    BPL $FF              ; 10 FF | Branch if positive
    AND ($DE,X)          ; 21 DE | Logical AND with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    LDA                  ; BF 41 FB 04 | Load from absolute long,X into accumulator
    LDA                  ; BF 40 17 E8 | Load from absolute long,X into accumulator
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    ROR $DF81,X          ; 7E 81 DF | Rotate right (absolute,X)
    ORA ($FB,X)          ; 01 FB | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    ROR $DF81,X          ; 7E 81 DF | Rotate right (absolute,X)
    SEC                  ; 38 | Set carry flag
    SBC $E7              ; E5 E7 | Subtract with carry (zero page)
    AND $FD              ; 25 FD | Logical AND with accumulator (zero page)
    CMP ($D5),Y          ; D1 D5 | Compare accumulator ((zero page),Y)
    STA $6A67,X          ; 9D 67 6A | Store accumulator to absolute,X
    ROR                  ; 6A | Rotate right (accumulator)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_02B
; Address: $E28AB1
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_02B:
    JSR $00F8            ; 20 F8 00 | Jump to subroutine
    DEC                  ; 3A | Decrement accumulator
    LDX $FC10            ; AE 10 FC | Load from absolute address into X register
    STA ($95,X)          ; 81 95 | Store accumulator to (zero page,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    STZ $0F9C            ; 9C 9C 0F | Store zero to absolute
    LDA                  ; BF 13 7B B8 | Load from absolute long,X into accumulator
    SBC $F4F0,Y          ; F9 F0 F4 | Subtract with carry (absolute,Y)
    BVS $62              ; 70 62 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_02C
; Address: $E28ACF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_02C:
    SBC ($63),Y          ; F1 63 | Subtract with carry ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    EOR ($80,X)          ; 41 80 | Exclusive OR with accumulator ((zero page,X))
    TAY                  ; A8 | Transfer accumulator to Y register
    PHA                  ; 48 | Push accumulator to stack
    ORA ($1E),Y          ; 11 1E | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_02D
; Address: $E28ADF
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_02D:
    JSR $F4FF            ; 20 FF F4 | Jump to subroutine
    STX $575C            ; 8E 5C 57 | Store X register to absolute address
    REP #$FD             ; C2 FD | Reset processor status bits
    PEA #$0604           ; F4 04 06 | Push effective address to stack
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    ROR $A703,X          ; 7E 03 A7 | Rotate right (absolute,X)
    JMP $1FC03F          ; 5C 3F C0 1F | Jump to address long
    SED                  ; F8 | Set decimal mode flag
    STY $1728            ; 8C 28 17 | Store Y register to absolute address
    RTI                  ; 40 | Return from interrupt
    SBC $4BE1,X          ; FD E1 4B | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_02E
; Address: $E28B06
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_02E:
    JSL $F7A8F9          ; 22 F9 A8 F7 | Jump to subroutine long
    DEC $60FE,X          ; DE FE 60 | Decrement (absolute,X)
    BCC $FF              ; 90 FF | Branch if carry clear
    CPX $BF              ; E4 BF | Compare X register (zero page)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_030
; Address: $E28B17
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_030:
    JSL $D700BF          ; 22 BF 00 D7 | Jump to subroutine long
    PHP                  ; 08 | Push processor status to stack
    CPY #$81             ; C0 81 | Compare Y register (immediate)
    LDA                  ; BF F2 F3 0D | Load from absolute long,X into accumulator
    ADC $FF33,X          ; 7D 33 FF | Add with carry (absolute,X)
    EOR $D5              ; 45 D5 | Exclusive OR with accumulator (zero page)
    DEC $77              ; C6 77 | Decrement (zero page)
    CMP ($CA,X)          ; C1 CA | Compare accumulator ((zero page,X))
    BRA $40              ; 80 40 | Branch always
    STX $F230            ; 8E 30 F2 | Store X register to absolute address
    CMP $CD30            ; CD 30 CD | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_031
; Address: $E28B39
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_031:
    JSL $133A01          ; 22 01 3A 13 | Jump to subroutine long
    ORA ($26,X)          ; 01 26 | Logical OR with accumulator ((zero page,X))
    PEA #$E02F           ; F4 2F E0 | Game work RAM access
    LDA                  ; BF 80 7E 01 | Load from absolute long,X into accumulator
    LDA $C27F50          ; AF 50 7F C2 | Load from absolute long address into accumulator
    ROL $88              ; 26 88 | Rotate left (zero page)
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    EOR #$DF             ; 49 DF | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_032
; Address: $E28B5B
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_032:
    JSR $42FF            ; 20 FF 42 | Hardware register operation
    LDY #$B0             ; A0 B0 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    JMP $4DAD            ; 4C AD 4D | Jump to address
    SBC ($1B,X)          ; E1 1B | Subtract with carry ((zero page,X))
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    SBC $E007,Y          ; F9 07 E0 | Game work RAM access
    BEQ $03              ; F0 03 | Branch if equal
    EOR $DCA2,X          ; 5D A2 DC | Exclusive OR with accumulator (absolute,X)
    ADC ($BA,X)          ; 61 BA | Add with carry ((zero page,X))
    EOR $FE              ; 45 FE | Exclusive OR with accumulator (zero page)
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    BCC $A2              ; 90 A2 | Branch if carry clear
    NOP                  ; EA | No operation
    CPY #$34             ; C0 34 | Compare Y register (immediate)
    LDX $D7              ; A6 D7 | Load from zero page into X register
    STA $C922BF          ; 8F BF 22 C9 | Store accumulator to absolute long address
    EOR $A453            ; 4D 53 A4 | Exclusive OR with accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    CPY #$3B             ; C0 3B | Compare Y register (immediate)
    CPY #$33             ; C0 33 | Compare Y register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    BRA $F0              ; 80 F0 | Branch always
    CLV                  ; B8 | Clear overflow flag
    BVS $3D              ; 70 3D | Branch if overflow set
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank44_DmaFunction_033
; Address: $E28BA6
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_033:
    ORA $85              ; 05 85 | Logical OR with accumulator (zero page)
    EOR $2065,X          ; 5D 65 20 | Exclusive OR with accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank44_DmaFunction_034
; Address: $E28BAC
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_034:
    ROL $2F              ; 26 2F | Rotate left (zero page)
    ORA ($8F,X)          ; 01 8F | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    CMP $38              ; C5 38 | Compare accumulator (zero page)
    PLX                  ; FA | Pull X register from stack
    STZ $C03F            ; 9C 3F C0 | Store zero to absolute
    ORA $86C6,Y          ; 19 C6 86 | Logical OR with accumulator (absolute,Y)
    BEQ $77              ; F0 77 | Branch if equal
    BVS $E3              ; 70 E3 | Branch if overflow set
    DEC $04C9            ; CE C9 04 | Decrement (absolute)
    ROL $85              ; 26 85 | Rotate left (zero page)
    CMP $7CDA,Y          ; D9 DA 7C | Compare accumulator (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    INC $03              ; E6 03 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_035
; Address: $E28BD9
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_035:
    JSL $9B01EF          ; 22 EF 01 9B | Jump to subroutine long
    LDX $F340            ; AE 40 F3 | Load from absolute address into X register
    CMP #$36             ; C9 36 | Compare accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    REP #$D1             ; C2 D1 | Reset processor status bits
    BVS $60              ; 70 60 | Branch if overflow set
    SBC ($F1,X)          ; E1 F1 | Subtract with carry ((zero page,X))
    BIT #$F9             ; 89 F9 | Test bits in accumulator (immediate)
    BMI $F6              ; 30 F6 | Branch if negative
    ORA #$77             ; 09 77 | Logical OR with accumulator (immediate)
    DEY                  ; 88 | Decrement Y register
    BPL $6F              ; 10 6F | Branch if positive
    STA $F18E00          ; 8F 00 8E F1 | Store accumulator to absolute long address
    LDX $D9              ; A6 D9 | Load from zero page into X register
    XBA                  ; EB | Exchange accumulator bytes
    DEY                  ; 88 | Decrement Y register
    STX $86FB            ; 8E FB 86 | Store X register to absolute address
    STA $77E3,X          ; 9D E3 77 | Store accumulator to absolute,X
    DEY                  ; 88 | Decrement Y register
    INY                  ; C8 | Increment Y register
    DEX                  ; CA | Decrement X register
    LDA ($07,X)          ; A1 07 | Load from (zero page,X) into accumulator
    CPX $DD0F            ; EC 0F DD | Compare X register (absolute)
    ORA $3FBF,X          ; 1D BF 3F | Logical OR with accumulator (absolute,X)
    ADC ($73,X)          ; 61 73 | Add with carry ((zero page,X))
    BNE $D5              ; D0 D5 | Branch if not equal
    CPY #$33             ; C0 33 | Compare Y register (immediate)
    CPY $A1D8            ; CC D8 A1 | Compare Y register (absolute)
    STA ($E8),Y          ; 91 E8 | Store accumulator to (zero page),Y
    PHX                  ; DA | Push X register to stack
    BRA $AC              ; 80 AC | Branch always
    INX                  ; E8 | Increment X register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PLP                  ; 28 | Pull processor status from stack
    BMI $1F              ; 30 1F | Branch if negative
    ASL $1F91            ; 0E 91 1F | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_036
; Address: $E28C47
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_036:
    PHA                  ; 48 | Push accumulator to stack
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    AND $37C8,X          ; 3D C8 37 | Logical AND with accumulator (absolute,X)
    BNE $3F              ; D0 3F | Branch if not equal
    INC $EF01,X          ; FE 01 EF | Increment (absolute,X)
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    REP #$41             ; C2 41 | Reset processor status bits
    STY $C208            ; 8C 08 C2 | Store Y register to absolute address
    SED                  ; F8 | Set decimal mode flag
    JMP $8778A3          ; 5C A3 78 87 | Jump to address long
    PHP                  ; 08 | Push processor status to stack
    DEC $7021,X          ; DE 21 70 | Decrement (absolute,X)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_037
; Address: $E28C6E
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_037:
    JSR $006F            ; 20 6F 00 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    JMP $70B3            ; 4C B3 70 | Jump to address
    STA $EF00FF          ; 8F FF 00 EF | Store accumulator to absolute long address
    BPL $FF              ; 10 FF | Branch if positive
    RTI                  ; 40 | Return from interrupt
    BRA $3C              ; 80 3C | Branch always
    SBC ($31),Y          ; F1 31 | Subtract with carry ((zero page),Y)
    ORA $8CF9,Y          ; 19 F9 8C | Logical OR with accumulator (absolute,Y)
    LDY $9F1F,X          ; BC 1F 9F | Load from absolute,X into Y register
    BMI $7F              ; 30 7F | Branch if negative
    BCC $1F              ; 90 1F | Branch if carry clear
    SED                  ; F8 | Set decimal mode flag
    STY $8E73            ; 8C 73 8E | Store Y register to absolute address
    ORA ($1B,X)          ; 01 1B | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    SBC #$1E             ; E9 1E | Subtract with carry (immediate)
    SBC ($CD,X)          ; E1 CD | Subtract with carry ((zero page,X))
    AND ($81),Y          ; 31 81 | Logical AND with accumulator ((zero page),Y)
    CPX $E1              ; E4 E1 | Compare X register (zero page)
    BPL $E1              ; 10 E1 | Branch if positive
    BPL $3B              ; 10 3B | Branch if positive
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    CPX #$06             ; E0 06 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    INC $BC43,X          ; FE 43 BC | Increment (absolute,X)
    XBA                  ; EB | Exchange accumulator bytes
    ROR $7E03,X          ; 7E 03 7E | Rotate right (absolute,X)
    ADC ($CE),Y          ; 71 CE | Add with carry ((zero page),Y)
    ADC $BC46,Y          ; 79 46 BC | Add with carry (absolute,Y)
    INX                  ; E8 | Increment X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank44_DmaFunction_038
; Address: $E28CCF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_038:
    STZ $FF              ; 64 FF | Store zero to zero page
    SBC $FD03,X          ; FD 03 FD | Subtract with carry (absolute,X)
    INC $FE41,X          ; FE 41 FE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_039
; Address: $E28CD9
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_039:
    EOR ($FF,X)          ; 41 FF | Exclusive OR with accumulator ((zero page,X))
    BMI $EF              ; 30 EF | Branch if negative
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    REP #$6E             ; C2 6E | Reset processor status bits
    ROR $33DB            ; 6E DB 33 | Rotate right (absolute)
    PHA                  ; 48 | Push accumulator to stack
    LSR                  ; 4A | Logical shift right (accumulator)
    CMP $5E1F,X          ; DD 1F 5E | Compare accumulator (absolute,X)
    LDX #$3C             ; A2 3C | Load immediate value into X register
    ORA $0D35,Y          ; 19 35 0D | Logical OR with accumulator (absolute,Y)
    ORA $32FC            ; 0D FC 32 | Logical OR with accumulator (absolute)
    PEA #$FC09           ; F4 09 FC | Push effective address to stack
    ADC ($C0),Y          ; 71 C0 | Add with carry ((zero page),Y)
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    ASL $07FE,X          ; 1E FE 07 | Arithmetic shift left (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    PLY                  ; 7A | Pull Y register from stack
    CMP $10C0            ; CD C0 10 | Compare accumulator (absolute)
    PEA #$A0A0           ; F4 A0 A0 | Push effective address to stack
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    CLC                  ; 18 | Clear carry flag
    AND #$A1             ; 29 A1 | Logical AND with accumulator (immediate)
    ORA $7232            ; 0D 32 72 | Logical OR with accumulator (absolute)
    ORA $E0E3            ; 0D E3 E0 | Game work RAM access
    CMP $D94F,Y          ; D9 4F D9 | Compare accumulator (absolute,Y)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank44_DmaFunction_03A
; Address: $E28D28
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_03A:
    CLI                  ; 58 | Clear interrupt disable flag
    STZ $305E,X          ; 9E 5E 30 | Store zero to absolute,X
    ROR $178E,X          ; 7E 8E 17 | Rotate right (absolute,X)
    PLA                  ; 68 | Pull accumulator from stack
    ORA $7F              ; 05 7F | Logical OR with accumulator (zero page)
    ORA $BF              ; 05 BF | Logical OR with accumulator (zero page)
    PHA                  ; 48 | Push accumulator to stack
    CLC                  ; 18 | Clear carry flag
    INC $F001,X          ; FE 01 F0 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_03B
; Address: $E28D3D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_03B:
    JSR $907F            ; 20 7F 90 | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    ORA $0DFC            ; 0D FC 0D | Logical OR with accumulator (absolute)
    SBC ($01,X)          ; E1 01 | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank44_DmaFunction_03C
; Address: $E28D4A
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_03C:
    JSR $6920            ; 20 20 69 | Jump to subroutine
    CLD                  ; D8 | Clear decimal mode flag
    SBC $CACA,X          ; FD CA CA | Subtract with carry (absolute,X)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    PEA #$C60E           ; F4 0E C6 | Push effective address to stack
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    AND ($DB,X)          ; 21 DB | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank44_DmaFunction_03D
; Address: $E28D5F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_03D:
    AND $DA80            ; 2D 80 DA | Logical AND with accumulator (absolute)
    LDA $00AF86          ; AF 86 AF 00 | Load from absolute long address into accumulator
    CPX #$00             ; E0 00 | Compare X register (immediate)
    STX $46              ; 86 46 | Store X register to zero page
    LDY $0201,X          ; BC 01 02 | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank44_DmaFunction_03E
; Address: $E28D76
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_03E:
    JSR $8076            ; 20 76 80 | Jump to subroutine
    CPX #$BF             ; E0 BF | Compare X register (immediate)
    STA ($3B,X)          ; 81 3B | Store accumulator to (zero page,X)
    ROL $0701,X          ; 3E 01 07 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_03F
; Address: $E28D8A
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_03F:
    JSR $3070            ; 20 70 30 | Jump to subroutine
    DEC                  ; 3A | Decrement accumulator
    BMI $88              ; 30 88 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CMP $80              ; C5 80 | Compare accumulator (zero page)
    SED                  ; F8 | Set decimal mode flag
    DEY                  ; 88 | Decrement Y register
    STA $37C706          ; 8F 06 C7 37 | Store accumulator to absolute long address
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    WDM #$00             ; 42 00 | Reserved instruction
    WDM #$00             ; 42 00 | Reserved instruction
    CPX #$E0             ; E0 E0 | Game work RAM access
    PEA #$FEF0           ; F4 F0 FE | Push effective address to stack
    CLC                  ; 18 | Clear carry flag
    SEI                  ; 78 | Set interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    BRA $FF              ; 80 FF | Branch always
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    ORA $8F              ; 05 8F | Logical OR with accumulator (zero page)
    BPL $F7              ; 10 F7 | Branch if positive
    ASL $000E            ; 0E 0E 00 | Arithmetic shift left (absolute)
    STZ $019B,X          ; 9E 9B 01 | Store zero to absolute,X
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($71,X)          ; 01 71 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$A0             ; C0 A0 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    STZ $64              ; 64 64 | Store zero to zero page
    STZ $FC              ; 64 FC | Store zero to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_040
; Address: $E28DDE
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_040:
    PHP                  ; 08 | Push processor status to stack
    INC $FEF2,X          ; FE F2 FE | Increment (absolute,X)
    XBA                  ; EB | Exchange accumulator bytes
    XBA                  ; EB | Exchange accumulator bytes
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SBC $33FD,X          ; FD FD 33 | Subtract with carry (absolute,X)
    BRA $38              ; 80 38 | Branch always
    CMP ($38,X)          ; C1 38 | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank44_DmaFunction_042
; Address: $E28DF7
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_042:
    JSR $20FF            ; 20 FF 20 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    INC $BF9F,X          ; FE 9F BF | Increment (absolute,X)
    STA                  ; 9F BF 77 7F | Store accumulator to absolute long,X
    ADC $637D,X          ; 7D 7D 63 | Add with carry (absolute,X)
    SBC #$01             ; E9 01 | Subtract with carry (immediate)
    BRA $57              ; 80 57 | Branch always
    BRA $97              ; 80 97 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_044
; Address: $E28E1C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_044:
    LDA                  ; BF 40 77 E8 | Load from absolute long,X into accumulator
    PLA                  ; 68 | Pull accumulator from stack
    ADC $3920            ; 6D 20 39 | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_045
; Address: $E28E24
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_045:
    JSR $AD39            ; 20 39 AD | Jump to subroutine
    STA $11CDED          ; 8F ED CD 11 | Store accumulator to absolute long address
    ORA $0F56            ; 0D 56 0F | Logical OR with accumulator (absolute)
    EOR ($D0,X)          ; 41 D0 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank44_DmaFunction_046
; Address: $E28E31
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_046:
    JSL $C80EC8          ; 22 C8 0E C8 | Jump to subroutine long
    ASL $2070            ; 0E 70 20 | Arithmetic shift left (absolute)
    ADC $12E9            ; 6D E9 12 | Add with carry (absolute)
    LDA $CF50            ; AD 50 CF | Load from absolute address into accumulator
    STA ($C3,X)          ; 81 C3 | Store accumulator to (zero page,X)
    STA ($C3,X)          ; 81 C3 | Store accumulator to (zero page,X)
    CPX #$E1             ; E0 E1 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BIT $04              ; 24 04 | Test bits in accumulator (zero page)
    BPL $F0              ; 10 F0 | Branch if positive
    ORA ($3C,X)          ; 01 3C | Logical OR with accumulator ((zero page,X))
    ORA ($3C,X)          ; 01 3C | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank44_DmaFunction_047
; Address: $E28E56
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_047:
    JSR $001E            ; 20 1E 00 | Jump to subroutine
    PLX                  ; FA | Pull X register from stack
    STY $EE              ; 84 EE | Store Y register to zero page
    AND $8F07,Y          ; 39 07 8F | Logical AND with accumulator (absolute,Y)
    DEY                  ; 88 | Decrement Y register
    ADC #$E9             ; 69 E9 | Add with carry (immediate)
    AND ($F1,X)          ; 21 F1 | Logical AND with accumulator ((zero page,X))
    CPY $7700            ; CC 00 77 | Compare Y register (absolute)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    LDA #$1E             ; A9 1E | Load immediate value into accumulator
    AND ($3C,X)          ; 21 3C | Logical AND with accumulator ((zero page,X))
    CPX #$E0             ; E0 E0 | Game work RAM access
    EOR $C6              ; 45 C6 | Exclusive OR with accumulator (zero page)
    EOR $C6              ; 45 C6 | Exclusive OR with accumulator (zero page)
    BVS $9D              ; 70 9D | Branch if overflow set
    BEQ $B7              ; F0 B7 | Branch if equal
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank44_DmaFunction_048
; Address: $E28E8E
; Size: 114 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_048:
    STZ $1F11,X          ; 9E 11 1F | Store zero to absolute,X
    CPX #$3B             ; E0 3B | Compare X register (immediate)
    ORA $3B              ; 05 3B | Logical OR with accumulator (zero page)
    ORA $13              ; 05 13 | Logical OR with accumulator (zero page)
    STA $160D96          ; 8F 96 0D 16 | Store accumulator to absolute long address
    BIT #$CE             ; 89 CE | Test bits in accumulator (immediate)
    STA ($7E),Y          ; 91 7E | Store accumulator to (zero page),Y
    STA ($FF),Y          ; 91 FF | Store accumulator to (zero page),Y
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    STZ $9B              ; 64 9B | Store zero to zero page
    STY $7B              ; 84 7B | Store Y register to zero page
    BMI $BC              ; 30 BC | Branch if negative
    BRA $7F              ; 80 7F | Branch always
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    STZ $9B              ; 64 9B | Store zero to zero page
    STY $7B              ; 84 7B | Store Y register to zero page
    BMI $BC              ; 30 BC | Branch if negative
    BRA $7F              ; 80 7F | Branch always
    LDA                  ; BF 50 FE 01 | Load from absolute long,X into accumulator
    DEY                  ; 88 | Decrement Y register
    LDY $1353            ; AC 53 13 | Load from absolute address into Y register
    CPX $1CF3            ; EC F3 1C | Compare X register (absolute)
    ORA $00FF            ; 0D FF 00 | Logical OR with accumulator (absolute)
    DEY                  ; 88 | Decrement Y register
    LDY $F253            ; AC 53 F2 | Load from absolute address into Y register
    ORA $47B8            ; 0D B8 47 | Logical OR with accumulator (absolute)
    ORA $F30C            ; 0D 0C F3 | Logical OR with accumulator (absolute)
    LDY $34              ; A4 34 | Load from zero page into Y register
    CPY $49B5            ; CC B5 49 | Compare Y register (absolute)
    AND $FFC1,X          ; 3D C1 FF | Logical AND with accumulator (absolute,X)
    LDA                  ; BF 40 FF 00 | Load from absolute long,X into accumulator
    BEQ $5C              ; F0 5C | Branch if equal
    CPY $4CB3            ; CC B3 4C | Compare Y register (absolute)
    DEC                  ; 3A | Decrement accumulator
    CPY $11              ; C4 11 | Compare Y register (zero page)
    STZ $9513,X          ; 9E 13 95 | Store zero to absolute,X
    PHP                  ; 08 | Push processor status to stack
    CPX #$08             ; E0 08 | Compare X register (immediate)
    LDA ($FA,X)          ; A1 FA | Load from (zero page,X) into accumulator
    ORA ($81,X)          ; 01 81 | Logical OR with accumulator ((zero page,X))
    INC $FF01            ; EE 01 FF | Increment (absolute)
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    SEI                  ; 78 | Set interrupt disable flag
    PHA                  ; 48 | Push accumulator to stack
    ROR $88FF,X          ; 7E FF 88 | Rotate right (absolute,X)
    LDX $8159,Y          ; BE 59 81 | Load from absolute,Y into X register
    ROL $C2AD,X          ; 3E AD C2 | Rotate left (absolute,X)
    BCS $86              ; B0 86 | Branch if carry set

;------------------------------------------------------------------------------
; Bank44_DmaFunction_049
; Address: $E28F2B
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_049:
    ROR $92              ; 66 92 | Rotate right (zero page)
    CPX #$F7             ; E0 F7 | Compare X register (immediate)
    INX                  ; E8 | Increment X register
    TYA                  ; 98 | Transfer Y register to accumulator
    BRA $DF              ; 80 DF | Branch always
    LDY #$BB             ; A0 BB | Load immediate value into Y register
    CPY $F9              ; C4 F9 | Compare Y register (zero page)
    ASL $FE              ; 06 FE | Arithmetic shift left (zero page)
    INY                  ; C8 | Increment Y register
    SBC $6FC2,X          ; FD C2 6F | Subtract with carry (absolute,X)
    BCC $EF              ; 90 EF | Branch if carry clear
    BPL $FE              ; 10 FE | Branch if positive
    LDA                  ; BF 84 CD 02 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank44_DmaFunction_04A
; Address: $E28F51
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_04A:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    INC $FA01,X          ; FE 01 FA | Increment (absolute,X)
    ORA $DC              ; 05 DC | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_04B
; Address: $E28F59
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_04B:
    JSR $401C            ; 20 1C 40 | Jump to subroutine
    STX $30              ; 86 30 | Store X register to zero page
    PHP                  ; 08 | Push processor status to stack
    STA $5D              ; 85 5D | Store accumulator to zero page
    CPY $E130            ; CC 30 E1 | Compare Y register (absolute)
    ASL $BE01,X          ; 1E 01 BE | Arithmetic shift left (absolute,X)
    STA ($CE),Y          ; 91 CE | Store accumulator to (zero page),Y
    ORA ($F6),Y          ; 11 F6 | Logical OR with accumulator ((zero page),Y)
    SEI                  ; 78 | Set interrupt disable flag
    ASL $04FA            ; 0E FA 04 | Arithmetic shift left (absolute)
    JMP $817F            ; 4C 7F 81 | Jump to address
    ORA ($BF,X)          ; 01 BF | Logical OR with accumulator ((zero page,X))
    BPL $0F              ; 10 0F | Branch if positive
    SBC ($C8),Y          ; F1 C8 | Subtract with carry ((zero page),Y)
    INY                  ; C8 | Increment Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    BVC $EC              ; 50 EC | Branch if overflow clear
    BPL $F7              ; 10 F7 | Branch if positive
    LDA                  ; BF 42 30 37 | Load from absolute long,X into accumulator
    SEP #$0F             ; E2 0F | Set processor status bits
    BCC $F7              ; 90 F7 | Branch if carry clear
    DEY                  ; 88 | Decrement Y register
    PEA #$F40F           ; F4 0F F4 | Push effective address to stack
    INC $0083,X          ; FE 83 00 | Increment (absolute,X)
    WDM #$00             ; 42 00 | Reserved instruction
    TXS                  ; 9A | Transfer X register to stack pointer
    RTI                  ; 40 | Return from interrupt
    BEQ $FF              ; F0 FF | Branch if equal
    INC $E72F            ; EE 2F E7 | Increment (absolute)
    REP #$FF             ; C2 FF | Reset processor status bits
    SEP #$FF             ; E2 FF | Set processor status bits
    PHB                  ; 8B | Push data bank register to stack
    CPY #$12             ; C0 12 | Compare Y register (immediate)
    CPX #$18             ; E0 18 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_04C
; Address: $E28FBD
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_04C:
    CPX #$28             ; E0 28 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    LSR $0F00            ; 4E 00 0F | Logical shift right (absolute)
    INX                  ; E8 | Increment X register
    BRA $F8              ; 80 F8 | Branch always
    BRA $CB              ; 80 CB | Branch always
    BRA $97              ; 80 97 | Branch always
    LSR                  ; 4A | Logical shift right (accumulator)
    STA $FFF8FF          ; 8F FF F8 FF | Store accumulator to absolute long address
    CLI                  ; 58 | Clear interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    SBC $30EF            ; ED EF 30 | Subtract with carry (absolute)
    ADC $5500,X          ; 7D 00 55 | Add with carry (absolute,X)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    INC $8000            ; EE 00 80 | Increment (absolute)
    BMI $00              ; 30 00 | Branch if negative
    REP #$14             ; C2 14 | Reset processor status bits
    WDM #$C2             ; 42 C2 | Reserved instruction
    ROR                  ; 6A | Rotate right (accumulator)
    NOP                  ; EA | No operation
    INC $EEFE,X          ; FE FE EE | Increment (absolute,X)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BEQ $FF              ; F0 FF | Branch if equal
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CPX #$FC             ; E0 FC | Compare X register (immediate)
    SBC $E0E0,X          ; FD E0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ORA ($89,X)          ; 01 89 | Logical OR with accumulator ((zero page,X))
    SBC $030A,X          ; FD 0A 03 | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_04D
; Address: $E29016
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_04D:
    JSR $2027            ; 20 27 20 | Jump to subroutine
    CPX $09              ; E4 09 | Compare X register (zero page)
    SBC $7840,Y          ; F9 40 78 | Subtract with carry (absolute,Y)
    LSR $70              ; 46 70 | Logical shift right (zero page)
    STA $4063,X          ; 9D 63 40 | Store accumulator to absolute,X
    ROR $00              ; 66 00 | Rotate right (zero page)
    BMI $00              ; 30 00 | Branch if negative
    ORA $E480,X          ; 1D 80 E4 | Logical OR with accumulator (absolute,X)
    BCC $FF              ; 90 FF | Branch if carry clear
    RTI                  ; 40 | Return from interrupt
    ORA $CF00,Y          ; 19 00 CF | Logical OR with accumulator (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    DEC $3EFE,X          ; DE FE 3E | Decrement (absolute,X)
    SBC ($9D,X)          ; E1 9D | Subtract with carry ((zero page,X))
    ADC #$29             ; 69 29 | Add with carry (immediate)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ASL $C6              ; 06 C6 | Arithmetic shift left (zero page)
    INC $7F59            ; EE 59 7F | Increment (absolute)
    LDX $FE41,Y          ; BE 41 FE | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank44_DmaFunction_04E
; Address: $E29057
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_04E:
    PHP                  ; 08 | Push processor status to stack
    INC $F801,X          ; FE 01 F8 | Increment (absolute,X)
    ORA ($50),Y          ; 11 50 | Logical OR with accumulator ((zero page),Y)
    BCC $80              ; 90 80 | Branch if carry clear
    CLD                  ; D8 | Clear decimal mode flag
    ADC $DF              ; 65 DF | Add with carry (zero page)
    ORA $7D9A            ; 0D 9A 7D | Logical OR with accumulator (absolute)
    CPY #$AF             ; C0 AF | Compare Y register (immediate)
    AND $1A              ; 25 1A | Logical AND with accumulator (zero page)
    ORA #$66             ; 09 66 | Logical OR with accumulator (immediate)
    ASL $00FF            ; 0E FF 00 | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    STA                  ; 9F 00 E3 7C | Store accumulator to absolute long,X
    DEC $6061,X          ; DE 61 60 | Decrement (absolute,X)
    STA                  ; 9F E0 1F 60 | Store accumulator to absolute long,X
    STA                  ; 9F 60 9F A2 | Store accumulator to absolute long,X
    EOR $807F,X          ; 5D 7F 80 | Exclusive OR with accumulator (absolute,X)
    ROR $60C1,X          ; 7E C1 60 | Rotate right (absolute,X)
    STA                  ; 9F E0 1F 60 | Store accumulator to absolute long,X
    STA                  ; 9F 60 9F A2 | Store accumulator to absolute long,X
    EOR $7887,X          ; 5D 87 78 | Exclusive OR with accumulator (absolute,X)
    BMI $CF              ; 30 CF | Branch if negative
    BMI $3E              ; 30 3E | Branch if negative
    CMP ($3D,X)          ; C1 3D | Compare accumulator ((zero page,X))
    REP #$35             ; C2 35 | Reset processor status bits
    DEX                  ; CA | Decrement X register
    DEY                  ; 88 | Decrement Y register
    SEI                  ; 78 | Set interrupt disable flag
    BMI $CF              ; 30 CF | Branch if negative
    BMI $3E              ; 30 3E | Branch if negative
    CMP ($3D,X)          ; C1 3D | Compare accumulator ((zero page,X))
    REP #$35             ; C2 35 | Reset processor status bits
    DEX                  ; CA | Decrement X register
    DEY                  ; 88 | Decrement Y register
    PHA                  ; 48 | Push accumulator to stack
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    ROR                  ; 6A | Rotate right (accumulator)
    CMP ($3F,X)          ; C1 3F | Compare accumulator ((zero page,X))
    LDX $B748,Y          ; BE 48 B7 | Load from absolute,Y into X register
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    ROR                  ; 6A | Rotate right (accumulator)
    CMP ($3F,X)          ; C1 3F | Compare accumulator ((zero page,X))
    WDM #$BF             ; 42 BF | Reserved instruction
    STA $BFF9            ; 8D F9 BF | Store accumulator to absolute address
    LDA                  ; BF F3 BA 63 | Load from absolute long,X into accumulator
    STX $F2CF            ; 8E CF F2 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank44_DmaFunction_04F
; Address: $E290EE
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_04F:
    LDA ($33),Y          ; B1 33 | Load from (zero page),Y into accumulator
    TXA                  ; 8A | Transfer X register to accumulator
    BCS $FC              ; B0 FC | Branch if carry set
    BCS $FC              ; B0 FC | Branch if carry set
    LDY $78              ; A4 78 | Load from zero page into Y register
    BRA $10              ; 80 10 | Branch always
    CPY #$73             ; C0 73 | Compare Y register (immediate)
    BRA $70              ; 80 70 | Branch always
    STY $E000            ; 8C 00 E0 | Game work RAM access
    STX $00              ; 86 00 | Store X register to zero page
    STX $00              ; 86 00 | Store X register to zero page
    STZ $FF74,X          ; 9E 74 FF | Store zero to absolute,X
    EOR $FF              ; 45 FF | Exclusive OR with accumulator (zero page)
    STX $87              ; 86 87 | Store X register to zero page
    CLC                  ; 18 | Clear carry flag
    ASL $FF7F,X          ; 1E 7F FF | Arithmetic shift left (absolute,X)
    PHB                  ; 8B | Push data bank register to stack
    PLY                  ; 7A | Pull Y register from stack
    RTI                  ; 40 | Return from interrupt
    REP #$FF             ; C2 FF | Reset processor status bits
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $68              ; 80 68 | Branch always
    CPY #$F6             ; C0 F6 | Compare Y register (immediate)
    CPY #$F6             ; C0 F6 | Compare Y register (immediate)
    BMI $FD              ; 30 FD | Branch if negative
    BPL $FE              ; 10 FE | Branch if positive
    ORA $00DF,X          ; 1D DF 00 | Logical OR with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    AND ($21,X)          ; 21 21 | PPU graphics register access
    ORA $2020,X          ; 1D 20 20 | Logical OR with accumulator (absolute,X)
    BMI $01              ; 30 01 | Branch if negative
    STA                  ; 9F 01 7F 01 | Store accumulator to absolute long,X
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($83,X)          ; 01 83 | Logical OR with accumulator ((zero page,X))
    ORA ($9B,X)          ; 01 9B | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    PLX                  ; FA | Pull X register from stack
    ORA $FF78,Y          ; 19 78 FF | Logical OR with accumulator (absolute,Y)
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    SBC $85F8,Y          ; F9 F8 85 | Subtract with carry (absolute,Y)
    STA $E4              ; 85 E4 | Store accumulator to zero page
    STZ $DEC2,X          ; 9E C2 DE | Store zero to absolute,X

;------------------------------------------------------------------------------
; Bank44_DmaFunction_050
; Address: $E2917F
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_050:
    CMP ($FD,X)          ; C1 FD | Compare accumulator ((zero page,X))
    BCC $8F              ; 90 8F | Branch if carry clear
    BCC $8F              ; 90 8F | Branch if carry clear
    STY $8F              ; 84 8F | Store Y register to zero page
    LDA $D086,Y          ; B9 86 D0 | Load from absolute,Y into accumulator
    CLI                  ; 58 | Clear interrupt disable flag
    PLA                  ; 68 | Pull accumulator from stack
    LDA                  ; BF 61 FF 10 | Load from absolute long,X into accumulator
    BPL $FF              ; 10 FF | Branch if positive
    EOR ($3E,X)          ; 41 3E | Exclusive OR with accumulator ((zero page,X))
    INX                  ; E8 | Increment X register
    PLA                  ; 68 | Pull accumulator from stack
    BVS $0F              ; 70 0F | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    CMP $38              ; C5 38 | Compare accumulator (zero page)
    CMP $08              ; C5 08 | Compare accumulator (zero page)
    PEA #$F430           ; F4 30 F4 | Push effective address to stack
    PEA #$768C           ; F4 8C 76 | Push effective address to stack
    DEX                  ; CA | Decrement X register
    INC $C0F0,X          ; FE F0 C0 | Increment (absolute,X)
    DEC                  ; 3A | Decrement accumulator
    CPY #$3A             ; C0 3A | Compare Y register (immediate)
    BEQ $0B              ; F0 0B | Branch if equal
    SEC                  ; 38 | Set carry flag
    ROL $84F3,X          ; 3E F3 84 | Rotate left (absolute,X)
    ADC $38CE,Y          ; 79 CE 38 | Add with carry (absolute,Y)
    BRA $DF              ; 80 DF | Branch always
    EOR ($FF,X)          ; 41 FF | Exclusive OR with accumulator ((zero page,X))
    EOR $3FFF,X          ; 5D FF 3F | Exclusive OR with accumulator (absolute,X)
    ROR $3846,X          ; 7E 46 38 | Rotate right (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    ROL $61              ; 26 61 | Rotate left (zero page)
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $8000,X          ; 1D 00 80 | Logical OR with accumulator (absolute,X)
    TYA                  ; 98 | Transfer Y register to accumulator
    CLV                  ; B8 | Clear overflow flag
    BRA $39              ; 80 39 | Branch always
    STX $17              ; 86 17 | Store X register to zero page
    DEY                  ; 88 | Decrement Y register
    CMP ($E3,X)          ; C1 E3 | Compare accumulator ((zero page,X))
    CMP ($E3,X)          ; C1 E3 | Compare accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    PEA #$E414           ; F4 14 E4 | Push effective address to stack
    BPL $1C              ; 10 1C | Branch if positive
    CPY #$1C             ; C0 1C | Compare Y register (immediate)
    CPY #$1C             ; C0 1C | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank44_DmaFunction_051
; Address: $E291FB
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_051:
    CPY #$F7             ; C0 F7 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    BPL $91              ; 10 91 | Branch if positive
    STA                  ; 9F D5 DE D5 | Store accumulator to absolute long,X
    DEC $0E19,X          ; DE 19 0E | Decrement (absolute,X)
    SBC $FE12,X          ; FD 12 FE | Subtract with carry (absolute,X)
    ROL $6E3E,X          ; 3E 3E 6E | Rotate left (absolute,X)
    ORA ($BE),Y          ; 11 BE | Logical OR with accumulator ((zero page),Y)
    LDX $EE15,Y          ; BE 15 EE | Load from absolute,Y into X register
    ORA $F01F,Y          ; 19 1F F0 | Logical OR with accumulator (absolute,Y)
    INC $00FF,X          ; FE FF 00 | Increment (absolute,X)
    CPY #$D6             ; C0 D6 | Compare Y register (immediate)
    EOR #$59             ; 49 59 | Exclusive OR with accumulator (immediate)
    EOR #$59             ; 49 59 | Exclusive OR with accumulator (immediate)
    ORA $474F            ; 0D 4F 47 | Logical OR with accumulator (absolute)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    DEX                  ; CA | Decrement X register
    PLX                  ; FA | Pull X register from stack
    STA ($FB),Y          ; 91 FB | Store accumulator to (zero page),Y
    BIT $A0AD            ; 2C AD A0 | Test bits in accumulator (absolute)
    ROL $A0              ; 26 A0 | Rotate left (zero page)
    ROL $80              ; 26 80 | Rotate left (zero page)
    AND ($88),Y          ; 31 88 | Logical AND with accumulator ((zero page),Y)
    CMP ($39,X)          ; C1 39 | Compare accumulator ((zero page,X))
    CPY $05              ; C4 05 | Compare Y register (zero page)
    BRA $04              ; 80 04 | Branch always
    ORA $8E1F,X          ; 1D 1F 8E | Logical OR with accumulator (absolute,X)
    STX $E3DF            ; 8E DF E3 | Store X register to absolute address
    ORA $77BC,X          ; 1D BC 77 | Logical OR with accumulator (absolute,X)
    SBC ($32),Y          ; F1 32 | Subtract with carry ((zero page),Y)
    ADC ($C8),Y          ; 71 C8 | Add with carry ((zero page),Y)
    SBC $E821,X          ; FD 21 E8 | Subtract with carry (absolute,X)
    STX $20              ; 86 20 | Store X register to zero page
    STX $20              ; 86 20 | Store X register to zero page

;------------------------------------------------------------------------------
; Bank44_DmaFunction_052
; Address: $E29256
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_052:
    JSL $410E80          ; 22 80 0E 41 | Jump to subroutine long
    STA $000B92          ; 8F 92 0B 00 | Store accumulator to absolute long address
    INY                  ; C8 | Increment Y register
    CPY $CB              ; C4 CB | Compare Y register (zero page)
    CPY $08              ; C4 08 | Compare Y register (zero page)
    LDY $D333,X          ; BC 33 D3 | Load from absolute,X into Y register
    STA                  ; 9F 00 CB AF | Store accumulator to absolute long,X
    CLC                  ; 18 | Clear carry flag
    BEQ $0F              ; F0 0F | Branch if equal
    STY $C3BC            ; 8C BC C3 | Store Y register to absolute address
    PEA #$F040           ; F4 40 F0 | Push effective address to stack
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    BEQ $1B              ; F0 1B | Branch if equal
    TYA                  ; 98 | Transfer Y register to accumulator
    BEQ $0F              ; F0 0F | Branch if equal
    TXS                  ; 9A | Transfer X register to stack pointer

;------------------------------------------------------------------------------
; Bank44_DmaFunction_053
; Address: $E2929E
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_053:
    ORA $FE63,X          ; 1D 63 FE | Logical OR with accumulator (absolute,X)
    ORA ($FB,X)          ; 01 FB | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    STX $FE              ; 86 FE | Store X register to zero page
    INC $DE6E            ; EE 6E DE | Increment (absolute)
    DEC $BF9E,X          ; DE 9E BF | Decrement (absolute,X)
    STA $07CD            ; 8D CD 07 | Store accumulator to absolute address
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BVC $81              ; 50 81 | Branch if overflow clear
    ORA $8840,Y          ; 19 40 88 | Logical OR with accumulator (absolute,Y)
    ASL $7B85,X          ; 1E 85 7B | Arithmetic shift left (absolute,X)
    CPY $FD33            ; CC 33 FD | Compare Y register (absolute)
    ADC ($1B,X)          ; 61 1B | Add with carry ((zero page,X))
    SEC                  ; 38 | Set carry flag
    STZ $8703            ; 9C 03 87 | Store zero to absolute
    STA ($C3,X)          ; 81 C3 | Store accumulator to (zero page,X)
    STA $7B              ; 85 7B | Store accumulator to zero page
    JMP $3FB3            ; 4C B3 3F | Jump to address
    CPY #$03             ; C0 03 | Compare Y register (immediate)
    STA $C314,X          ; 9D 14 C3 | Store accumulator to absolute,X
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_054
; Address: $E292DC
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_054:
    WDM #$78             ; 42 78 | Reserved instruction
    STA ($3C,X)          ; 81 3C | Store accumulator to (zero page,X)
    SBC ($33),Y          ; F1 33 | Subtract with carry ((zero page),Y)
    STA $7CF03B          ; 8F 3B F0 7C | Store accumulator to absolute long address
    LDY $3EC1,X          ; BC C1 3E | Load from absolute,X into Y register
    RTI                  ; 40 | Return from interrupt
    AND ($CC),Y          ; 31 CC | Logical AND with accumulator ((zero page),Y)
    STA                  ; 9F E0 34 FB | Store accumulator to absolute long,X
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CPY #$A3             ; C0 A3 | Compare Y register (immediate)
    EOR $81FD,X          ; 5D FD 81 | Exclusive OR with accumulator (absolute,X)
    PLA                  ; 68 | Pull accumulator from stack
    DEY                  ; 88 | Decrement Y register
    LDA                  ; BF 3F FE 7F | Load from absolute long,X into accumulator
    PLA                  ; 68 | Pull accumulator from stack
    DEY                  ; 88 | Decrement Y register
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    STA                  ; 9F 60 FF 80 | Store accumulator to absolute long,X
    ROR $8080,X          ; 7E 80 80 | Rotate right (absolute,X)
    BRA $EC              ; 80 EC | Branch always
    BPL $FE              ; 10 FE | Branch if positive
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    BIT #$80             ; 89 80 | Test bits in accumulator (immediate)
    BVS $F0              ; 70 F0 | Branch if overflow set
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    CPX $7EF9            ; EC F9 7E | Compare X register (absolute)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_055
; Address: $E29336
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_055:
    SBC $00FF,Y          ; F9 FF 00 | Subtract with carry (absolute,Y)
    ORA #$7F             ; 09 7F | Logical OR with accumulator (immediate)
    CPY #$F8             ; C0 F8 | Compare Y register (immediate)
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    AND $0D3F,Y          ; 39 3F 0D | Logical AND with accumulator (absolute,Y)
    INC $FF0F            ; EE 0F FF | Increment (absolute)
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    BPL $E0              ; 10 E0 | Game work RAM access
    AND ($F8,X)          ; 21 F8 | Logical AND with accumulator ((zero page,X))
    STA $FC70            ; 8D 70 FC | Store accumulator to absolute address
    SBC $E7              ; E5 E7 | Subtract with carry (zero page)
    ORA $012F            ; 0D 2F 01 | Logical OR with accumulator (absolute)
    STX $E2A3            ; 8E A3 E2 | Store X register to absolute address
    CPX #$99             ; E0 99 | Compare X register (immediate)
    STX $BA              ; 86 BA | Store X register to zero page
    CPX $E5              ; E4 E5 | Compare X register (zero page)
    CLC                  ; 18 | Clear carry flag
    CMP $E110            ; CD 10 E1 | Compare accumulator (absolute)
    ADC ($40),Y          ; 71 40 | Add with carry ((zero page),Y)
    LDY $7B03,X          ; BC 03 7B | Load from absolute,X into Y register
    ASL $6F              ; 06 6F | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    SEI                  ; 78 | Set interrupt disable flag
    AND ($0E),Y          ; 31 0E | Logical AND with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    ORA $CD32            ; 0D 32 CD | Logical OR with accumulator (absolute)
    BEQ $0F              ; F0 0F | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_056
; Address: $E29392
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_056:
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    CLD                  ; D8 | Clear decimal mode flag
    LDY $3243,X          ; BC 43 32 | Load from absolute,X into Y register
    CMP $0DF2            ; CD F2 0D | Compare accumulator (absolute)
    BEQ $0F              ; F0 0F | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    AND $3CC2,Y          ; 39 C2 3C | Logical AND with accumulator (absolute,Y)
    BMI $C7              ; 30 C7 | Branch if negative
    SEC                  ; 38 | Set carry flag
    ADC $7F80,Y          ; 79 80 7F | Add with carry (absolute,Y)
    ROR                  ; 6A | Rotate right (accumulator)
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    CMP $3A              ; C5 3A | Compare accumulator (zero page)
    CMP $C137            ; CD 37 C1 | Compare accumulator (absolute)
    ROL $8977,X          ; 3E 77 89 | Rotate left (absolute,X)
    CLV                  ; B8 | Clear overflow flag
    BRA $77              ; 80 77 | Branch always
    DEY                  ; 88 | Decrement Y register
    CPX #$37             ; E0 37 | Compare X register (immediate)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank44_DmaFunction_057
; Address: $E293C5
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_057:
    CLC                  ; 18 | Clear carry flag
    STZ $BB              ; 64 BB | Store zero to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_058
; Address: $E293C9
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_058:
    STA                  ; 9F E0 1F 38 | Store accumulator to absolute long,X
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    LDY $7B              ; A4 7B | Load from zero page into Y register
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_059
; Address: $E293DB
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_059:
    STA                  ; 9F F8 07 F8 | Store accumulator to absolute long,X
    SBC $F849,Y          ; F9 49 F8 | Subtract with carry (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    REP #$00             ; C2 00 | Reset processor status bits
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    CPY #$CF             ; C0 CF | Compare Y register (immediate)
    BVS $C7              ; 70 C7 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    WDM #$FF             ; 42 FF | Reserved instruction
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    CPY #$FC             ; C0 FC | Compare Y register (immediate)
    CPY $38              ; C4 38 | Compare Y register (zero page)
    SBC $FF02,X          ; FD 02 FF | Subtract with carry (absolute,X)
    CPX #$3B             ; E0 3B | Compare X register (immediate)
    CPY $FC              ; C4 FC | Compare Y register (zero page)
    RTI                  ; 40 | Return from interrupt
    INY                  ; C8 | Increment Y register
    INC $1A98,X          ; FE 98 1A | Increment (absolute,X)
    ROL $F6AE            ; 2E AE F6 | Rotate left (absolute)
    CMP #$31             ; C9 31 | Compare accumulator (immediate)
    CMP ($39,X)          ; C1 39 | Compare accumulator ((zero page,X))
    CMP ($09,X)          ; C1 09 | Compare accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    STA ($79,X)          ; 81 79 | Store accumulator to (zero page,X)
    STA $D3              ; 85 D3 | Store accumulator to zero page
    AND ($0A,X)          ; 21 0A | Logical AND with accumulator ((zero page,X))
    BEQ $CC              ; F0 CC | Branch if equal
    BMI $CF              ; 30 CF | Branch if negative
    SEC                  ; 38 | Set carry flag
    BMI $0F              ; 30 0F | Branch if negative
    ORA #$0D             ; 09 0D | Logical OR with accumulator (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BPL $01              ; 10 01 | Branch if positive
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_05A
; Address: $E29450
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_05A:
    JSR $0629            ; 20 29 06 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    LDY #$FE             ; A0 FE | Load immediate value into Y register
    STZ $7D              ; 64 7D | Store zero to zero page

;------------------------------------------------------------------------------
; Bank44_DmaFunction_05B
; Address: $E29458
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_05B:
    BMI $3F              ; 30 3F | Branch if negative
    LDA ($FF),Y          ; B1 FF | Load from (zero page),Y into accumulator
    LDX $3CFE,Y          ; BE FE 3C | Load from absolute,Y into X register
    SED                  ; F8 | Set decimal mode flag
    ROR $BF7F,X          ; 7E 7F BF | Rotate right (absolute,X)
    BRA $B7              ; 80 B7 | Branch always
    BRA $FC              ; 80 FC | Branch always
    PHP                  ; 08 | Push processor status to stack
    BEQ $82              ; F0 82 | Branch if equal
    BPL $00              ; 10 00 | Branch if positive
    BPL $F2              ; 10 F2 | Branch if positive
    BCS $F8              ; B0 F8 | Branch if carry set
    RTI                  ; 40 | Return from interrupt
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    TYA                  ; 98 | Transfer Y register to accumulator
    ROR $5FFF,X          ; 7E FF 5F | Rotate right (absolute,X)
    AND $0F7F,Y          ; 39 7F 0F | Logical AND with accumulator (absolute,Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_05C
; Address: $E29498
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_05C:
    RTI                  ; 40 | Return from interrupt
    BRA $23              ; 80 23 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_05D
; Address: $E294A3
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_05D:
    SBC ($E0,X)          ; E1 E0 | Game work RAM access
    LDA ($C0),Y          ; B1 C0 | Load from (zero page),Y into accumulator
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SEC                  ; 38 | Set carry flag
    BMI $FF              ; 30 FF | Branch if negative
    INC $04FF,X          ; FE FF 04 | Increment (absolute,X)
    ASL $1E02            ; 0E 02 1E | Arithmetic shift left (absolute)
    WDM #$6E             ; 42 6E | Reserved instruction
    LDA $B800,Y          ; B9 00 B8 | Load from absolute,Y into accumulator
    CLV                  ; B8 | Clear overflow flag
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDA $7E78,X          ; BD 78 7E | Load from absolute,X into accumulator
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    ROR $A1FF,X          ; 7E FF A1 | Rotate right (absolute,X)
    LDX $79FE,Y          ; BE FE 79 | Load from absolute,Y into X register
    ASL $FC              ; 06 FC | Arithmetic shift left (zero page)
    INC $2982,X          ; FE 82 29 | Increment (absolute,X)
    STA                  ; 9F 56 4F 3C | Store accumulator to absolute long,X
    SEC                  ; 38 | Set carry flag
    SBC $FE7C,X          ; FD 7C FE | Subtract with carry (absolute,X)
    ADC $0F              ; 65 0F | Add with carry (zero page)
    BEQ $BF              ; F0 BF | Branch if equal
    RTI                  ; 40 | Return from interrupt
    CLI                  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank44_DmaFunction_05F
; Address: $E29502
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_05F:
    STA                  ; 9F 9F 9F 9F | Store accumulator to absolute long,X
    BCC $00              ; 90 00 | Branch if carry clear
    BRA $66              ; 80 66 | Branch always
    BRA $66              ; 80 66 | Branch always
    ASL $2600            ; 0E 00 26 | Arithmetic shift left (absolute)
    SBC ($E0,X)          ; E1 E0 | Game work RAM access
    ORA $F0              ; 05 F0 | Logical OR with accumulator (zero page)
    SED                  ; F8 | Set decimal mode flag
    LDA                  ; BF 03 9F 02 | Load from absolute long,X into accumulator
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank44_DmaFunction_060
; Address: $E29532
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_060:
    JSL $E9EB60          ; 22 60 EB E9 | Jump to subroutine long
    ADC $7B7D,X          ; 7D 7D 7B | Add with carry (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    INC $7EFE,X          ; FE FE 7E | Increment (absolute,X)
    INC $FF07,X          ; FE 07 FF | Increment (absolute,X)
    ORA ($CF,X)          ; 01 CF | Logical OR with accumulator ((zero page,X))
    AND $BD00,X          ; 3D 00 BD | Logical AND with accumulator (absolute,X)
    BRA $47              ; 80 47 | Branch always
    RTI                  ; 40 | Return from interrupt
    ORA #$38             ; 09 38 | Logical OR with accumulator (immediate)
    INC $FFF4,X          ; FE F4 FF | Increment (absolute,X)
    BVS $FF              ; 70 FF | Branch if overflow set
    PHP                  ; 08 | Push processor status to stack
    ASL $0E3F            ; 0E 3F 0E | Arithmetic shift left (absolute)
    ADC ($1E),Y          ; 71 1E | Add with carry ((zero page),Y)
    BRA $50              ; 80 50 | Branch always
    BNE $1F              ; D0 1F | Branch if not equal
    ROL $38CF,X          ; 3E CF 38 | Rotate left (absolute,X)
    ROL $3ECF,X          ; 3E CF 3E | Rotate left (absolute,X)
    STA ($7E),Y          ; 91 7E | Store accumulator to (zero page),Y
    BRA $7F              ; 80 7F | Branch always
    BPL $9F              ; 10 9F | Branch if positive
    BRA $04              ; 80 04 | Branch always
    CMP ($D0,X)          ; C1 D0 | Compare accumulator ((zero page,X))
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $0F              ; F0 0F | Branch if equal
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    ORA $DF32            ; 0D 32 DF | Logical OR with accumulator (absolute)
    ORA ($31),Y          ; 11 31 | Logical OR with accumulator ((zero page),Y)
    BNE $2F              ; D0 2F | Branch if not equal
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $0F              ; F0 0F | Branch if equal
    BRA $7F              ; 80 7F | Branch always
    SBC $EF02,X          ; FD 02 EF | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_061
; Address: $E2959F
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_061:
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    EOR $41A7,Y          ; 59 A7 41 | Exclusive OR with accumulator (absolute,Y)
    SEI                  ; 78 | Set interrupt disable flag
    SEC                  ; 38 | Set carry flag
    CMP $0186,Y          ; D9 86 01 | Compare accumulator (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    BPL $EF              ; 10 EF | Branch if positive
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF DF E0 78 | Load from absolute long,X into accumulator
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    BPL $EF              ; 10 EF | Branch if positive
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF FF 40 FF | Load from absolute long,X into accumulator
    INY                  ; C8 | Increment Y register
    ORA $1CF9            ; 0D F9 1C | Logical OR with accumulator (absolute)
    CPX #$1C             ; E0 1C | Compare X register (immediate)
    CPX #$0D             ; E0 0D | Compare X register (immediate)
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BMI $CF              ; 30 CF | Branch if negative
    CPX $E01F            ; EC 1F E0 | Game work RAM access
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    STA ($C3,X)          ; 81 C3 | Store accumulator to (zero page,X)
    BRA $C9              ; 80 C9 | Branch always
    CLC                  ; 18 | Clear carry flag
    AND ($3C,X)          ; 21 3C | Logical AND with accumulator ((zero page,X))
    ROL $C13E            ; 2E 3E C1 | Rotate left (absolute)
    AND $A078,Y          ; 39 78 A0 | Logical AND with accumulator (absolute,Y)
    SEI                  ; 78 | Set interrupt disable flag
    LDY #$09             ; A0 09 | Load immediate value into Y register
    ORA #$FE             ; 09 FE | Logical OR with accumulator (immediate)
    INC $FDF9,X          ; FE F9 FD | Increment (absolute,X)
    BEQ $FD              ; F0 FD | Branch if equal
    JMP $CECE            ; 4C CE CE | Jump to address
    BMI $E7              ; 30 E7 | Branch if negative
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    ASL $F0              ; 06 F0 | Arithmetic shift left (zero page)
    BVS $01              ; 70 01 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank44_DmaFunction_062
; Address: $E29640
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_062:
    CPY #$C3             ; C0 C3 | Compare Y register (immediate)
    CPX #$E1             ; E0 E1 | Compare X register (immediate)
    CPX #$E1             ; E0 E1 | Compare X register (immediate)
    BNE $DF              ; D0 DF | Branch if not equal
    CMP ($DF),Y          ; D1 DF | Compare accumulator ((zero page),Y)
    SBC $0BFC,X          ; FD FC 0B | Subtract with carry (absolute,X)
    PLX                  ; FA | Pull X register from stack
    CLC                  ; 18 | Clear carry flag
    BIT $3C              ; 24 3C | Test bits in accumulator (zero page)
    DEC $DE36,X          ; DE 36 DE | Decrement (absolute,X)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_063
; Address: $E29656
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_063:
    JSR $20C0            ; 20 C0 20 | Jump to subroutine
    CPY #$02             ; C0 02 | Compare Y register (immediate)
    CMP ($04,X)          ; C1 04 | Compare accumulator ((zero page,X))
    ASL $E3              ; 06 E3 | Arithmetic shift left (zero page)
    CLV                  ; B8 | Clear overflow flag
    PEA #$F434           ; F4 34 F4 | Push effective address to stack
    LDY #$AF             ; A0 AF | Load immediate value into Y register
    CLD                  ; D8 | Clear decimal mode flag
    CPX $61BB            ; EC BB 61 | Compare X register (absolute)
    ORA $3CDC            ; 0D DC 3C | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_064
; Address: $E29677
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_064:
    JSR $5837            ; 20 37 58 | Jump to subroutine
    ADC $BA              ; 65 BA | Add with carry (zero page)
    STA $9C7FF4          ; 8F F4 7F 9C | Store accumulator to absolute long address
    BRA $FF              ; 80 FF | Branch always
    LDA ($F3,X)          ; A1 F3 | Load from (zero page,X) into accumulator
    PHA                  ; 48 | Push accumulator to stack
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    WDM #$43             ; 42 43 | Reserved instruction
    LDA ($0C,X)          ; A1 0C | Load from (zero page,X) into accumulator
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt
    INC $CE80,X          ; FE 80 CE | Increment (absolute,X)
    ASL $E7              ; 06 E7 | Arithmetic shift left (zero page)
    INC                  ; 1A | Increment accumulator
    ORA ($17,X)          ; 01 17 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $BE1E,X          ; 1E 1E BE | Arithmetic shift left (absolute,X)
    SBC ($E1,X)          ; E1 E1 | Subtract with carry ((zero page,X))
    ASL $C808,X          ; 1E 08 C8 | Arithmetic shift left (absolute,X)
    CPX $08              ; E4 08 | Compare X register (zero page)
    INX                  ; E8 | Increment X register
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SBC $60FF            ; ED FF 60 | Subtract with carry (absolute)
    BPL $1F              ; 10 1F | Branch if positive
    JMP ($B8ED)          ; 6C ED B8 | Jump to address (absolute indirect)
    CLV                  ; B8 | Clear overflow flag
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    LDY #$03             ; A0 03 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank44_DmaFunction_065
; Address: $E296D8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_065:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    ORA ($8F,X)          ; 01 8F | Logical OR with accumulator ((zero page,X))
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_066
; Address: $E296E0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_066:
    BEQ $FE              ; F0 FE | Branch if equal
    STA                  ; 9F 97 05 C9 | Store accumulator to absolute long,X
    ORA $DEE1,X          ; 1D E1 DE | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_067
; Address: $E296EF
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_067:
    JSL $E20191          ; 22 91 01 E2 | Jump to subroutine long
    STA ($00),Y          ; 91 00 | Store accumulator to (zero page),Y
    LDA $6900,X          ; BD 00 69 | Load from absolute,X into accumulator
    STZ $04FA            ; 9C FA 04 | Store zero to absolute
    SEP #$1C             ; E2 1C | Set processor status bits
    SBC ($5E,X)          ; E1 5E | Subtract with carry ((zero page,X))
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ASL $159E            ; 0E 9E 15 | Arithmetic shift left (absolute)
    STA                  ; 9F 00 FF 80 | Store accumulator to absolute long,X
    CPX #$FF             ; E0 FF | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_068
; Address: $E2970E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_068:
    JSL $F80A3F          ; 22 3F 0A F8 | Jump to subroutine long
    ORA ($66,X)          ; 01 66 | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    STZ $00              ; 64 00 | Store zero to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_069
; Address: $E2971A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_069:
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    AND #$09             ; 29 09 | Logical AND with accumulator (immediate)
    REP #$00             ; C2 00 | Reset processor status bits
    BEQ $FD              ; F0 FD | Branch if equal
    INC $7DFF,X          ; FE FF 7D | Increment (absolute,X)
    ADC $FEFE,X          ; 7D FE FE | Add with carry (absolute,X)
    ADC $61FF,Y          ; 79 FF 61 | Add with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_06A
; Address: $E2972C
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_06A:
    JSR $04B1            ; 20 B1 04 | Jump to subroutine
    ORA ($78,X)          ; 01 78 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    LDY $20C2            ; AC C2 20 | Load from absolute address into Y register
    CPX #$00             ; E0 00 | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    BEQ $60              ; F0 60 | Branch if equal
    BVS $F0              ; 70 F0 | Branch if overflow set
    BEQ $AC              ; F0 AC | Branch if equal
    INC $FE3E            ; EE 3E FE | Increment (absolute)
    ROR $0FFF,X          ; 7E FF 0F | Rotate right (absolute,X)
    CLV                  ; B8 | Clear overflow flag
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    LDA ($0F,X)          ; A1 0F | Load from (zero page,X) into accumulator
    PHP                  ; 08 | Push processor status to stack
    STA $000190          ; 8F 90 01 00 | Store accumulator to absolute long address
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $8E80            ; 0E 80 8E | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_06B
; Address: $E29761
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_06B:
    ROR $FFB6,X          ; 7E B6 FF | Rotate right (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    INC $7978,X          ; FE 78 79 | Increment (absolute,X)
    SEC                  ; 38 | Set carry flag
    ORA #$2C             ; 09 2C | Logical OR with accumulator (immediate)
    SBC $8196            ; ED 96 81 | Subtract with carry (absolute)
    RTI                  ; 40 | Return from interrupt
    ORA ($71,X)          ; 01 71 | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF 45 ED 0E | Load from absolute long,X into accumulator
    STA $F7              ; 85 F7 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank44_DmaFunction_06C
; Address: $E2977E
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_06C:
    JSL $0F0312          ; 22 12 03 0F | Jump to subroutine long
    ORA ($63,X)          ; 01 63 | Logical OR with accumulator ((zero page,X))
    PHY                  ; 5A | Push Y register to stack
    CPX #$FC             ; E0 FC | Compare X register (immediate)
    BMI $7E              ; 30 7E | Branch if negative
    CLC                  ; 18 | Clear carry flag
    ASL $031F,X          ; 1E 1F 03 | Arithmetic shift left (absolute,X)
    BEQ $C4              ; F0 C4 | Branch if equal
    CPX #$FC             ; E0 FC | Compare X register (immediate)
    LDA                  ; BF 1D 5F 0E | Load from absolute long,X into accumulator
    STA $00C101          ; 8F 01 C1 00 | Store accumulator to absolute long address
    CPX #$81             ; E0 81 | Compare X register (immediate)
    CPY #$F1             ; C0 F1 | Compare Y register (immediate)
    SBC $E000,X          ; FD 00 E0 | Game work RAM access
    STA ($1C,X)          ; 81 1C | Store accumulator to (zero page,X)
    PHP                  ; 08 | Push processor status to stack
    ASL $0200            ; 0E 00 02 | Arithmetic shift left (absolute)
    DEC $D1DF,X          ; DE DF D1 | Decrement (absolute,X)
    CMP $FDBD,Y          ; D9 BD FD | Compare accumulator (absolute,Y)
    BPL $F0              ; 10 F0 | Branch if positive
    BPL $F0              ; 10 F0 | Branch if positive
    AND ($BE,X)          ; 21 BE | Logical AND with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_06D
; Address: $E297C8
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_06D:
    PHP                  ; 08 | Push processor status to stack
    SEI                  ; 78 | Set interrupt disable flag
    LSR $EE              ; 46 EE | Logical shift right (zero page)
    CMP ($E7,X)          ; C1 E7 | Compare accumulator ((zero page,X))
    BRA $E1              ; 80 E1 | Branch always
    LDA                  ; BF 63 5F 21 | Load from absolute long,X into accumulator
    SEC                  ; 38 | Set carry flag
    STA $101180          ; 8F 80 11 10 | Store accumulator to absolute long address
    ORA $1018,Y          ; 19 18 10 | Logical OR with accumulator (absolute,Y)
    ASL $21DD,X          ; 1E DD 21 | PPU graphics register access
    INC $F807,X          ; FE 07 F8 | Increment (absolute,X)
    ASL $F8              ; 06 F8 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    BEQ $CE              ; F0 CE | Branch if equal
    BMI $FF              ; 30 FF | Branch if negative
    RTI                  ; 40 | Return from interrupt
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_06E
; Address: $E29806
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_06E:
    BRA $87              ; 80 87 | Branch always
    CPY #$F5             ; C0 F5 | Compare Y register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    INC $C000,X          ; FE 00 C0 | Increment (absolute,X)
    ROL $3A6E            ; 2E 6E 3A | Rotate left (absolute)
    LDA                  ; BF 3C FC 77 | Load from absolute long,X into accumulator
    STA $D844            ; 8D 44 D8 | Store accumulator to absolute address
    CPY #$DC             ; C0 DC | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    BEQ $03              ; F0 03 | Branch if equal
    INY                  ; C8 | Increment Y register
    ORA $183E,X          ; 1D 3E 18 | Logical OR with accumulator (absolute,X)
    REP #$D6             ; C2 D6 | Reset processor status bits
    RTI                  ; 40 | Return from interrupt
    TYA                  ; 98 | Transfer Y register to accumulator
    TSX                  ; BA | Transfer stack pointer to X register
    SBC ($F1),Y          ; F1 F1 | Subtract with carry ((zero page),Y)
    SBC $0AF9,Y          ; F9 F9 0A | Subtract with carry (absolute,Y)
    CMP $07              ; C5 07 | Compare accumulator (zero page)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_06F
; Address: $E29855
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_06F:
    JSR $2088            ; 20 88 20 | Jump to subroutine
    BIT #$EB             ; 89 EB | Test bits in accumulator (immediate)
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($36,X)          ; 01 36 | Logical OR with accumulator ((zero page,X))
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    EOR $C6B7            ; 4D B7 C6 | Exclusive OR with accumulator (absolute)
    LDX $3501,Y          ; BE 01 35 | Load from absolute,Y into X register
    STA                  ; 9F 80 CF 7F | Store accumulator to absolute long,X
    STY $00FF            ; 8C FF 00 | Store Y register to absolute address
    ORA $7B              ; 05 7B | Logical OR with accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    CPY $10              ; C4 10 | Compare Y register (zero page)
    BVS $48              ; 70 48 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    AND $936E,Y          ; 39 6E 93 | Logical AND with accumulator (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    ASL $F8D0            ; 0E D0 F8 | Arithmetic shift left (absolute)
    CPY #$F8             ; C0 F8 | Compare Y register (immediate)
    BEQ $F8              ; F0 F8 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    PEA #$F6FC           ; F4 FC F6 | Push effective address to stack
    BEQ $0C              ; F0 0C | Branch if equal
    CPX #$11             ; E0 11 | Compare X register (immediate)
    BNE $07              ; D0 07 | Branch if not equal
    CPY #$07             ; C0 07 | Compare Y register (immediate)
    BMI $07              ; 30 07 | Branch if negative
    BPL $8B              ; 10 8B | Branch if positive
    ORA #$0A             ; 09 0A | Logical OR with accumulator (immediate)
    ORA $1FFA,X          ; 1D FA 1F | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_071
; Address: $E298AB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_071:
    JSR $03FC            ; 20 FC 03 | Jump to subroutine
    BPL $F5              ; 10 F5 | Branch if positive
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $1EFB,X          ; 1E FB 1E | Arithmetic shift left (absolute,X)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank44_DmaFunction_072
; Address: $E298BB
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_072:
    JSR $03FC            ; 20 FC 03 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    ADC $97              ; 65 97 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_073
; Address: $E298C2
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_073:
    JSR $20DB            ; 20 DB 20 | Jump to subroutine
    SBC $FE01,X          ; FD 01 FE | Subtract with carry (absolute,X)
    AND $FFC2,X          ; 3D C2 FF | Logical AND with accumulator (absolute,X)
    SBC $3C00,X          ; FD 00 3C | Subtract with carry (absolute,X)
    CPY #$3C             ; C0 3C | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    ROL $FEC1,X          ; 3E C1 FE | Rotate left (absolute,X)
    ORA ($CF,X)          ; 01 CF | Logical OR with accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDY $3C83,X          ; BC 83 3C | Load from absolute,X into Y register
    BEQ $4F              ; F0 4F | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    LDA                  ; BF 4F FB 07 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank44_DmaFunction_074
; Address: $E298FF
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_074:
    JSR $DFDF            ; 20 DF DF | Jump to subroutine
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$11             ; E0 11 | Compare X register (immediate)
    XBA                  ; EB | Exchange accumulator bytes
    STZ $9B              ; 64 9B | Store zero to zero page
    STA $2062,X          ; 9D 62 20 | Store accumulator to absolute,X
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    ORA ($83,X)          ; 01 83 | Logical OR with accumulator ((zero page,X))
    BRA $C9              ; 80 C9 | Branch always
    BRA $C9              ; 80 C9 | Branch always
    RTI                  ; 40 | Return from interrupt
    JMP $ADA0            ; 4C A0 AD | Jump to address
    ADC #$8D             ; 69 8D | Add with carry (immediate)
    TSX                  ; BA | Transfer stack pointer to X register
    LSR $FCD0            ; 4E D0 FC | Logical shift right (absolute)
    SBC ($33),Y          ; F1 33 | Subtract with carry ((zero page),Y)
    CPY $A4              ; C4 A4 | Compare Y register (zero page)
    PHX                  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank44_DmaFunction_075
; Address: $E2993D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_075:
    JSR $30CB            ; 20 CB 30 | Jump to subroutine
    CMP #$CB             ; C9 CB | Compare accumulator (immediate)
    CMP #$CB             ; C9 CB | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_076
; Address: $E29946
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_076:
    ROR $00FF,X          ; 7E FF 00 | Rotate right (absolute,X)
    ORA $F411,X          ; 1D 11 F4 | Logical OR with accumulator (absolute,X)
    STA ($F1,X)          ; 81 F1 | Store accumulator to (zero page,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_077
; Address: $E2994F
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_077:
    SEI                  ; 78 | Set interrupt disable flag
    EOR ($36,X)          ; 41 36 | Exclusive OR with accumulator ((zero page,X))
    EOR ($09,X)          ; 41 09 | Exclusive OR with accumulator ((zero page,X))
    CPX #$13             ; E0 13 | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    LDA ($07,X)          ; A1 07 | Load from (zero page,X) into accumulator
    STX $CF              ; 86 CF | Store X register to zero page
    LDA                  ; BF D9 5D 09 | Load from absolute long,X into accumulator
    SBC $F3A3            ; ED A3 F3 | Subtract with carry (absolute)
    INX                  ; E8 | Increment X register
    LDY #$14             ; A0 14 | Load immediate value into Y register
    BRA $00              ; 80 00 | Branch always
    BRA $C4              ; 80 C4 | Branch always
    LDX $FEC1,Y          ; BE C1 FE | Load from absolute,Y into X register
    ORA ($4E,X)          ; 01 4E | Logical OR with accumulator ((zero page,X))
    LDY $1741            ; AC 41 17 | Load from absolute address into Y register
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BPL $9C              ; 10 9C | Branch if positive
    BRA $CC              ; 80 CC | Branch always
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    LDY #$03             ; A0 03 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    CPY #$48             ; C0 48 | Compare Y register (immediate)
    BCC $F2              ; 90 F2 | Branch if carry clear
    ORA ($79,X)          ; 01 79 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BVC $20              ; 50 20 | Branch if overflow clear
    SBC ($E0),Y          ; F1 E0 | Game work RAM access
    PLX                  ; FA | Pull X register from stack
    BPL $F0              ; 10 F0 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    DEC                  ; 3A | Decrement accumulator
    LDX $BFB1,Y          ; BE B1 BF | Load from absolute,Y into X register
    BMI $BF              ; 30 BF | Branch if negative
    AND #$0F             ; 29 0F | Logical AND with accumulator (immediate)
    BRA $F0              ; 80 F0 | Branch always
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    CPX #$06             ; E0 06 | Compare X register (immediate)
    ADC ($1E,X)          ; 61 1E | Add with carry ((zero page,X))
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_078
; Address: $E299D2
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_078:
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    STX $C2              ; 86 C2 | Store X register to zero page
    CMP #$C7             ; C9 C7 | Compare accumulator (immediate)
    BEQ $07              ; F0 07 | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    STA $E0DF70          ; 8F 70 DF E0 | Game work RAM access
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    STA $F10970          ; 8F 70 09 F1 | Store accumulator to absolute long address
    BIT #$71             ; 89 71 | Test bits in accumulator (immediate)
    DEC $E6              ; C6 E6 | Decrement (zero page)
    STA                  ; 9F 80 9F 80 | Store accumulator to absolute long,X
    CPY #$33             ; C0 33 | Compare Y register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    SEP #$1F             ; E2 1F | Set processor status bits
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_07A
; Address: $E29A16
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_07A:
    BCS $0F              ; B0 0F | Branch if carry set
    BIT $0F03            ; 2C 03 0F | Test bits in accumulator (absolute)
    CPX #$E0             ; E0 E0 | Game work RAM access
    STZ $7C              ; 64 7C | Store zero to zero page
    DEY                  ; 88 | Decrement Y register
    ASL $0EC8            ; 0E C8 0E | Arithmetic shift left (absolute)
    INY                  ; C8 | Increment Y register
    ASL $1ED8            ; 0E D8 1E | Arithmetic shift left (absolute)
    BCS $3C              ; B0 3C | Branch if carry set
    RTI                  ; 40 | Return from interrupt
    ADC ($80),Y          ; 71 80 | Add with carry ((zero page),Y)
    DEX                  ; CA | Decrement X register
    ORA #$79             ; 09 79 | Logical OR with accumulator (immediate)
    STA ($30,X)          ; 81 30 | Store accumulator to (zero page,X)
    CMP ($30,X)          ; C1 30 | Compare accumulator ((zero page,X))
    CMP ($F0,X)          ; C1 F0 | Compare accumulator ((zero page,X))
    CMP ($74,X)          ; C1 74 | Compare accumulator ((zero page,X))
    STA ($0F,X)          ; 81 0F | Store accumulator to (zero page,X)
    DEC                  ; 3A | Decrement accumulator
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    ROL $3E02,X          ; 3E 02 3E | Rotate left (absolute,X)
    ROL $0301,X          ; 3E 01 03 | Rotate left (absolute,X)
    WDM #$02             ; 42 02 | Reserved instruction
    ROR $FE3E,X          ; 7E 3E FE | Rotate right (absolute,X)
    CPY #$43             ; C0 43 | Compare Y register (immediate)
    CPY #$41             ; C0 41 | Compare Y register (immediate)
    CPY #$75             ; C0 75 | Compare Y register (immediate)
    LDY $8889,X          ; BC 89 88 | Load from absolute,X into Y register
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    CPY #$F2             ; C0 F2 | Compare Y register (immediate)
    CPX #$F7             ; E0 F7 | Compare X register (immediate)
    CPX #$F7             ; E0 F7 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_07B
; Address: $E29A6A
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_07B:
    ROR $047F,X          ; 7E 7F 04 | Rotate right (absolute,X)
    EOR #$12             ; 49 12 | Exclusive OR with accumulator (immediate)
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    BRA $60              ; 80 60 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $0C              ; F0 0C | Branch if equal
    LDX $0E77,Y          ; BE 77 0E | Load from absolute,Y into X register
    ORA ($0B,X)          ; 01 0B | Logical OR with accumulator ((zero page,X))
    STX $FEE1            ; 8E E1 FE | Store X register to absolute address
    SBC ($3E,X)          ; E1 3E | Subtract with carry ((zero page,X))
    SBC ($D7,X)          ; E1 D7 | Subtract with carry ((zero page,X))
    LDA                  ; BF E2 96 C8 | Load from absolute long,X into accumulator
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    XBA                  ; EB | Exchange accumulator bytes
    ASL $4E09,X          ; 1E 09 4E | Arithmetic shift left (absolute,X)
    ORA ($1E),Y          ; 11 1E | Logical OR with accumulator ((zero page),Y)
    ORA ($EF),Y          ; 11 EF | Logical OR with accumulator ((zero page),Y)
    ASL $C07F,X          ; 1E 7F C0 | Arithmetic shift left (absolute,X)
    BEQ $77              ; F0 77 | Branch if equal
    BVS $9B              ; 70 9B | Branch if overflow set
    STZ $A1A2            ; 9C A2 A1 | Store zero to absolute
    BMI $7A              ; 30 7A | Branch if negative

;------------------------------------------------------------------------------
; Bank44_DmaFunction_07C
; Address: $E29AB1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_07C:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP $DA22,X          ; DD 22 DA | Compare accumulator (absolute,X)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_07D
; Address: $E29ABD
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_07D:
    JSL $FF800B          ; 22 0B 80 FF | Jump to subroutine long
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BMI $3E              ; 30 3E | Branch if negative
    AND $01FF,X          ; 3D FF 01 | Logical AND with accumulator (absolute,X)
    CPY #$DF             ; C0 DF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_07E
; Address: $E29ADD
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_07E:
    JSR $02DD            ; 20 DD 02 | Jump to subroutine
    STZ $FD11,X          ; 9E 11 FD | Store zero to absolute,X
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    BCC $0E              ; 90 0E | Branch if carry clear
    SED                  ; F8 | Set decimal mode flag
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BRA $05              ; 80 05 | Branch always
    ROL                  ; 2A | Rotate left (accumulator)
    DEC                  ; 3A | Decrement accumulator
    CPX $66              ; E4 66 | Compare X register (zero page)
    NOP                  ; EA | No operation
    SBC ($01),Y          ; F1 01 | Subtract with carry ((zero page),Y)
    BEQ $0E              ; F0 0E | Branch if equal
    CLC                  ; 18 | Clear carry flag
    PLB                  ; AB | Pull data bank register from stack
    BPL $7D              ; 10 7D | Branch if positive
    BRA $7E              ; 80 7E | Branch always

;------------------------------------------------------------------------------
; Bank44_DmaFunction_07F
; Address: $E29B19
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_07F:
    CPX #$16             ; E0 16 | Compare X register (immediate)
    INX                  ; E8 | Increment X register
    STY $76              ; 84 76 | Store Y register to zero page
    BIT #$7B             ; 89 7B | Test bits in accumulator (immediate)
    LDX #$5F             ; A2 5F | Load immediate value into X register
    LDA $C341,X          ; BD 41 C3 | Load from absolute,X into accumulator
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    ADC $FD7F,Y          ; 79 7F FD | Add with carry (absolute,Y)
    PEA #$FE08           ; F4 08 FE | Push effective address to stack
    BRA $BC              ; 80 BC | Branch always
    WDM #$F5             ; 42 F5 | Reserved instruction
    PLX                  ; FA | Pull X register from stack
    SBC $A800,Y          ; F9 00 A8 | Subtract with carry (absolute,Y)
    LDY $FEFE,X          ; BC FE FE | Load from absolute,X into Y register
    INC $E4FE,X          ; FE FE E4 | Increment (absolute,X)
    CPX #$F3             ; E0 F3 | Compare X register (immediate)
    INC $DF97,X          ; FE 97 DF | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    ORA $00C1,Y          ; 19 C1 00 | Logical OR with accumulator (absolute,Y)
    SBC ($04,X)          ; E1 04 | Subtract with carry ((zero page,X))
    CPY #$04             ; C0 04 | Compare Y register (immediate)
    ORA $2000            ; 0D 00 20 | Logical OR with accumulator (absolute)
    ORA $F2              ; 05 F2 | Logical OR with accumulator (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_080
; Address: $E29B61
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_080:
    ADC $7331,Y          ; 79 31 73 | Add with carry (absolute,Y)
    CPX #$F9             ; E0 F9 | Compare X register (immediate)
    EOR ($CD),Y          ; 51 CD | Exclusive OR with accumulator ((zero page),Y)
    BIT #$F9             ; 89 F9 | Test bits in accumulator (immediate)
    ORA $00E9            ; 0D E9 00 | Logical OR with accumulator (absolute)
    DEC $09              ; C6 09 | Decrement (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator
    ADC ($0E),Y          ; 71 0E | Add with carry ((zero page),Y)
    ORA ($BE,X)          ; 01 BE | Logical OR with accumulator ((zero page,X))
    BVC $76              ; 50 76 | Branch if overflow clear
    DEY                  ; 88 | Decrement Y register
    INC $C005,X          ; FE 05 C0 | Increment (absolute,X)
    BRA $B0              ; 80 B0 | Branch always
    INY                  ; C8 | Increment Y register
    SBC $E5C0,X          ; FD C0 E5 | Subtract with carry (absolute,X)
    BEQ $FC              ; F0 FC | Branch if equal
    LDY $FFFB,X          ; BC FB FF | Load from absolute,X into Y register
    RTI                  ; 40 | Return from interrupt
    LSR                  ; 4A | Logical shift right (accumulator)
    STA $1BC303          ; 8F 03 C3 1B | Store accumulator to absolute long address
    AND $1B00,Y          ; 39 00 1B | Logical AND with accumulator (absolute,Y)
    CPX #$80             ; E0 80 | Compare X register (immediate)
    INY                  ; C8 | Increment Y register
    PHP                  ; 08 | Push processor status to stack
    SBC ($02,X)          ; E1 02 | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank44_DmaFunction_081
; Address: $E29BAD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_081:
    STA                  ; 9F 03 CF 0F | Store accumulator to absolute long,X
    PHP                  ; 08 | Push processor status to stack
    INY                  ; C8 | Increment Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_082
; Address: $E29BBE
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_082:
    BPL $31              ; 10 31 | Branch if positive
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA #$98             ; 09 98 | Logical OR with accumulator (immediate)
    ASL $1E              ; 06 1E | Arithmetic shift left (zero page)
    ORA ($77,X)          ; 01 77 | Logical OR with accumulator ((zero page,X))
    ORA ($C3,X)          ; 01 C3 | Logical OR with accumulator ((zero page,X))
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    BCC $E7              ; 90 E7 | Branch if carry clear
    STX $E5E1            ; 8E E1 E5 | Store X register to absolute address
    CPX #$F1             ; E0 F1 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    AND $3C              ; 25 3C | Logical AND with accumulator (zero page)
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    ORA ($E7,X)          ; 01 E7 | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF 7E 7F DE | Load from absolute long,X into accumulator
    SBC $C5FF,X          ; FD FF C5 | Subtract with carry (absolute,X)
    CPX $F808            ; EC 08 F8 | Compare X register (absolute)
    TAX                  ; AA | Transfer accumulator to X register
    SEP #$10             ; E2 10 | Set processor status bits
    TXA                  ; 8A | Transfer X register to accumulator
    BPL $02              ; 10 02 | Branch if positive
    ORA $050A,X          ; 1D 0A 05 | Logical OR with accumulator (absolute,X)
    AND ($2E,X)          ; 21 2E | Logical AND with accumulator ((zero page,X))
    ROL $E07F,X          ; 3E 7F E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    STA $9F              ; 85 9F | Store accumulator to zero page
    ADC ($79,X)          ; 61 79 | Add with carry ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    DEY                  ; 88 | Decrement Y register
    BRA $BC              ; 80 BC | Branch always
    BRA $C0              ; 80 C0 | Branch always
    CPX $00              ; E4 00 | Compare X register (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    STA $039606          ; 8F 06 96 03 | Store accumulator to absolute long address
    ORA ($19,X)          ; 01 19 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    INC $FE08            ; EE 08 FE | Increment (absolute)
    TYA                  ; 98 | Transfer Y register to accumulator
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPX #$F9             ; E0 F9 | Compare X register (immediate)
    PEA #$B0FD           ; F4 FD B0 | Push effective address to stack
    SBC $F650,X          ; FD 50 F6 | Subtract with carry (absolute,X)
    DEC                  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank44_DmaFunction_083
; Address: $E29C40
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_083:
    BEQ $F0              ; F0 F0 | Branch if equal
    ASL $3200            ; 0E 00 32 | Arithmetic shift left (absolute)
    DEC $CEC1,X          ; DE C1 CE | Decrement (absolute,X)
    BCS $BF              ; B0 BF | Branch if carry set
    SBC ($EF),Y          ; F1 EF | Subtract with carry ((zero page),Y)
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    SBC $3F32,X          ; FD 32 3F | Subtract with carry (absolute,X)
    CMP ($7F,X)          ; C1 7F | Compare accumulator ((zero page,X))
    BRA $3F              ; 80 3F | Branch always
    ROL $2200            ; 2E 00 22 | Rotate left (absolute)
    BRA $C3              ; 80 C3 | Branch always
    CPY #$DD             ; C0 DD | Compare Y register (immediate)
    REP #$3F             ; C2 3F | Reset processor status bits
    BCS $70              ; B0 70 | Branch if carry set
    INX                  ; E8 | Increment X register
    ROL $22DD            ; 2E DD 22 | Rotate left (absolute)
    ORA $3FCF,X          ; 1D CF 3F | Logical OR with accumulator (absolute,X)
    BPL $81              ; 10 81 | Branch if positive
    CPX #$92             ; E0 92 | Compare X register (immediate)
    ASL $7F44,X          ; 1E 44 7F | Arithmetic shift left (absolute,X)
    LDY #$BF             ; A0 BF | Load immediate value into Y register
    BCC $1F              ; 90 1F | Branch if carry clear
    SEI                  ; 78 | Set interrupt disable flag
    BVS $7F              ; 70 7F | Branch if overflow set
    ASL $1E01,X          ; 1E 01 1E | Arithmetic shift left (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_084
; Address: $E29C94
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_084:
    BRA $61              ; 80 61 | Branch always
    CMP $01              ; C5 01 | Compare accumulator (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_085
; Address: $E29C99
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_085:
    BRA $E0              ; 80 E0 | Game work RAM access
    BRA $88              ; 80 88 | Branch always
    BCC $00              ; 90 00 | Branch if carry clear
    ASL $041F            ; 0E 1F 04 | Arithmetic shift left (absolute)
    EOR ($E5,X)          ; 41 E5 | Exclusive OR with accumulator ((zero page,X))
    CMP ($F9,X)          ; C1 F9 | Compare accumulator ((zero page,X))
    TYA                  ; 98 | Transfer Y register to accumulator
    INC $7E3C,X          ; FE 3C 7E | Increment (absolute,X)
    ORA ($E0,X)          ; 01 E0 | Game work RAM access
    ADC $F0              ; 65 F0 | Add with carry (zero page)
    ADC $F0              ; 65 F0 | Add with carry (zero page)
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_086
; Address: $E29CC3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_086:
    ADC $7D60,X          ; 7D 60 7D | Add with carry (absolute,X)
    PLX                  ; FA | Pull X register from stack
    ORA ($67,X)          ; 01 67 | Logical OR with accumulator ((zero page,X))
    CPX #$02             ; E0 02 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_087
; Address: $E29CD4
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_087:
    CPX #$02             ; E0 02 | Compare X register (immediate)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    STZ $40BF            ; 9C BF 40 | Store zero to absolute
    LDA                  ; BF 80 BF 80 | Load from absolute long,X into accumulator
    BEQ $43              ; F0 43 | Branch if equal
    DEC $E029            ; CE 29 E0 | Game work RAM access
    SEP #$BC             ; E2 BC | Set processor status bits
    BRA $FF              ; 80 FF | Branch always
    ROL $1F09,X          ; 3E 09 1F | Rotate left (absolute,X)
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($DF,X)          ; 01 DF | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank44_DmaFunction_088
; Address: $E29D0B
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_088:
    JSR $205F            ; 20 5F 20 | Jump to subroutine
    SBC #$FE             ; E9 FE | Subtract with carry (immediate)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF 40 7F 00 | Load from absolute long,X into accumulator
    STY $07              ; 84 07 | Store Y register to zero page
    STY $07              ; 84 07 | Store Y register to zero page
    ORA ($EC),Y          ; 11 EC | Logical OR with accumulator ((zero page),Y)
    STY $03FC            ; 8C FC 03 | Store Y register to absolute address
    BRA $7C              ; 80 7C | Branch always
    BRA $3B              ; 80 3B | Branch always
    CPY $1F              ; C4 1F | Compare Y register (zero page)
    CPX $827D            ; EC 7D 82 | Compare X register (absolute)
    NOP                  ; EA | No operation
    PLX                  ; FA | Pull X register from stack
    CPY $150C            ; CC 0C 15 | Compare Y register (absolute)
    ROL                  ; 2A | Rotate left (accumulator)
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($8A),Y          ; 11 8A | Logical OR with accumulator ((zero page),Y)
    ORA ($07),Y          ; 11 07 | Logical OR with accumulator ((zero page),Y)
    DEC                  ; 3A | Decrement accumulator
    SBC $E000,X          ; FD 00 E0 | Game work RAM access
    ORA ($BF,X)          ; 01 BF | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    ORA #$48             ; 09 48 | Logical OR with accumulator (immediate)
    ORA #$48             ; 09 48 | Logical OR with accumulator (immediate)
    ASL $31EF            ; 0E EF 31 | Arithmetic shift left (absolute)
    DEC                  ; 3A | Decrement accumulator
    DEC                  ; 3A | Decrement accumulator
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($77,X)          ; 01 77 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    EOR #$A1             ; 49 A1 | Exclusive OR with accumulator (immediate)
    ORA $FD12            ; 0D 12 FD | Logical OR with accumulator (absolute)
    STA                  ; 9F 6F 88 78 | Store accumulator to absolute long,X
    DEY                  ; 88 | Decrement Y register
    SEI                  ; 78 | Set interrupt disable flag
    CMP $047F            ; CD 7F 04 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_089
; Address: $E29D8C
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_089:
    LDA                  ; BF 80 7F 40 | Load from absolute long,X into accumulator
    BCC $F7              ; 90 F7 | Branch if carry clear
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    SBC $FF02,X          ; FD 02 FF | Subtract with carry (absolute,X)
    ORA ($BF,X)          ; 01 BF | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    EOR $39              ; 45 39 | Exclusive OR with accumulator (zero page)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SEC                  ; 38 | Set carry flag
    PHX                  ; DA | Push X register to stack
    ORA ($A7,X)          ; 01 A7 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    DEC $B6              ; C6 B6 | Decrement (zero page)
    PEA #$B904           ; F4 04 B9 | Push effective address to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_08A
; Address: $E29DD0
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_08A:
    BRA $E7              ; 80 E7 | Branch always
    BIT $2CD0            ; 2C D0 2C | Test bits in accumulator (absolute)
    BNE $E5              ; D0 E5 | Branch if not equal
    CLI                  ; 58 | Clear interrupt disable flag
    PEA #$BF08           ; F4 08 BF | Push effective address to stack
    CPY #$9F             ; C0 9F | Compare Y register (immediate)
    BVS $EF              ; 70 EF | Branch if overflow set
    AND $FBE1,Y          ; 39 E1 FB | Logical AND with accumulator (absolute,Y)
    LDY $ACBD            ; AC BD AC | Load from absolute address into Y register
    LDA $2C2C,X          ; BD 2C 2C | Load from absolute,X into accumulator
    CLD                  ; D8 | Clear decimal mode flag
    SBC ($D3,X)          ; E1 D3 | Subtract with carry ((zero page,X))
    STA                  ; 9F FF A0 04 | Store accumulator to absolute long,X
    RTI                  ; 40 | Return from interrupt
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    RTI                  ; 40 | Return from interrupt
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BNE $0B              ; D0 0B | Branch if not equal
    BIT $D8              ; 24 D8 | Test bits in accumulator (zero page)
    AND $A020,X          ; 3D 20 A0 | Logical AND with accumulator (absolute,X)
    STX $A7              ; 86 A7 | Store X register to zero page
    STX $A7              ; 86 A7 | Store X register to zero page
    BIT $ACEC            ; 2C EC AC | Test bits in accumulator (absolute)
    EOR $4DB0            ; 4D B0 4D | Exclusive OR with accumulator (absolute)
    BCS $EC              ; B0 EC | Branch if carry set
    CLC                  ; 18 | Clear carry flag
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    ADC $1700,X          ; 7D 00 17 | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_08B
; Address: $E29E21
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_08B:
    DEC $FB00,X          ; DE 00 FB | Decrement (absolute,X)
    BPL $FA              ; 10 FA | Branch if positive
    BPL $FE              ; 10 FE | Branch if positive
    SBC ($F1),Y          ; F1 F1 | Subtract with carry ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    AND $2420,Y          ; 39 20 24 | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_08C
; Address: $E29E34
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_08C:
    JSR $0024            ; 20 24 00 | Jump to subroutine
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($83,X)          ; 01 83 | Logical OR with accumulator ((zero page,X))
    ASL $6900            ; 0E 00 69 | Arithmetic shift left (absolute)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BCC $F3              ; 90 F3 | Branch if carry clear
    BMI $3F              ; 30 3F | Branch if negative
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))
    BPL $FC              ; 10 FC | Branch if positive
    BPL $FC              ; 10 FC | Branch if positive
    BIT #$BF             ; 89 BF | Test bits in accumulator (immediate)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    STA $E00D,X          ; 9D 0D E0 | Game work RAM access
    ORA #$E9             ; 09 E9 | Logical OR with accumulator (immediate)
    TXA                  ; 8A | Transfer X register to accumulator
    TSX                  ; BA | Transfer stack pointer to X register
    TXA                  ; 8A | Transfer X register to accumulator
    TSX                  ; BA | Transfer stack pointer to X register
    ORA ($B3,X)          ; 01 B3 | Logical OR with accumulator ((zero page,X))
    BRA $F8              ; 80 F8 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_08D
; Address: $E29E71
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_08D:
    PHP                  ; 08 | Push processor status to stack
    ORA $0D42            ; 0D 42 0D | Logical OR with accumulator (absolute)
    WDM #$60             ; 42 60 | Reserved instruction
    ADC ($6C,X)          ; 61 6C | Add with carry ((zero page,X))
    ORA #$0F             ; 09 0F | Logical OR with accumulator (immediate)
    LDA                  ; BF A7 BF FF | Load from absolute long,X into accumulator
    BRA $47              ; 80 47 | Branch always
    BRA $0F              ; 80 0F | Branch always
    CPX #$97             ; E0 97 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_08E
; Address: $E29E9B
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_08E:
    BPL $D9              ; 10 D9 | Branch if positive
    CPY $10              ; C4 10 | Compare Y register (zero page)
    ORA ($CB,X)          ; 01 CB | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal

;------------------------------------------------------------------------------
; Bank44_DmaFunction_08F
; Address: $E29EBE
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_08F:
    BEQ $F4              ; F0 F4 | Branch if equal
    RTI                  ; 40 | Return from interrupt
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    INC $E7FF,X          ; FE FF E7 | Increment (absolute,X)
    BRA $00              ; 80 00 | Branch always
    BRA $10              ; 80 10 | Branch always
    BPL $5C              ; 10 5C | Branch if positive
    ORA $F860,Y          ; 19 60 F8 | Logical OR with accumulator (absolute,Y)
    INC $FE4E,X          ; FE 4E FE | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    SBC $FF43,X          ; FD 43 FF | Subtract with carry (absolute,X)
    CPY #$FC             ; C0 FC | Compare Y register (immediate)
    LDX $07FE,Y          ; BE FE 07 | Load from absolute,Y into X register
    PHP                  ; 08 | Push processor status to stack
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    BPL $02              ; 10 02 | Branch if positive
    ORA $B600            ; 0D 00 B6 | Logical OR with accumulator (absolute)
    BRA $DF              ; 80 DF | Branch always
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    BEQ $F9              ; F0 F9 | Branch if equal
    DEY                  ; 88 | Decrement Y register
    STA $EE6704          ; 8F 04 67 EE | Store accumulator to absolute long address
    ADC #$06             ; 69 06 | Add with carry (immediate)
    LDY #$20             ; A0 20 | Load immediate value into Y register
    PHP                  ; 08 | Push processor status to stack
    LDA ($00,X)          ; A1 00 | Load from (zero page,X) into accumulator
    ASL $70              ; 06 70 | Arithmetic shift left (zero page)
    INX                  ; E8 | Increment X register
    BRA $5F              ; 80 5F | Branch always
    LDY #$1B             ; A0 1B | Load immediate value into Y register
    CPY $A7              ; C4 A7 | Compare Y register (zero page)
    INX                  ; E8 | Increment X register
    PEA #$FF04           ; F4 04 FF | Push effective address to stack
    SEC                  ; 38 | Set carry flag
    INC $807F,X          ; FE 7F 80 | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    STA                  ; 9F 00 0F 00 | Store accumulator to absolute long,X
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    SBC $FF03,X          ; FD 03 FF | Subtract with carry (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ROL $3FC1,X          ; 3E C1 3F | Rotate left (absolute,X)
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    ADC #$83             ; 69 83 | Add with carry (immediate)
    BNE $A1              ; D0 A1 | Branch if not equal
    PHX                  ; DA | Push X register to stack
    ASL $00FF            ; 0E FF 00 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_090
; Address: $E29F6B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_090:
    JSR $40FF            ; 20 FF 40 | Jump to subroutine
    SBC $1A              ; E5 1A | Subtract with carry (zero page)
    LDY #$9F             ; A0 9F | Load immediate value into Y register
    STZ $9F              ; 64 9F | Store zero to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_091
; Address: $E29F7A
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_091:
    LDA                  ; BF 60 FF 40 | Load from absolute long,X into accumulator
    SBC $1A              ; E5 1A | Subtract with carry (zero page)
    INY                  ; C8 | Increment Y register
    BIT $E9              ; 24 E9 | Test bits in accumulator (zero page)
    XBA                  ; EB | Exchange accumulator bytes
    SED                  ; F8 | Set decimal mode flag
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    CPY #$E7             ; C0 E7 | Compare Y register (immediate)
    SEC                  ; 38 | Set carry flag
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    SBC $F904,Y          ; F9 04 F9 | Subtract with carry (absolute,Y)
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    CPX #$43             ; E0 43 | Compare X register (immediate)
    LDX $99              ; A6 99 | Load from zero page into X register
    CLC                  ; 18 | Clear carry flag
    LDA                  ; BF 40 BF 40 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank44_DmaFunction_092
; Address: $E29FBF
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_092:
    JSR $59A0            ; 20 A0 59 | Jump to subroutine
    BEQ $08              ; F0 08 | Branch if equal
    SBC ($19,X)          ; E1 19 | Subtract with carry ((zero page,X))
    CMP ($25,X)          ; C1 25 | Compare accumulator ((zero page,X))
    SBC ($31),Y          ; F1 31 | Subtract with carry ((zero page),Y)
    DEC $FF36            ; CE 36 FF | Decrement (absolute)
    INC $FE20,X          ; FE 20 FE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_093
; Address: $E29FDB
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_093:
    JSR $10EA            ; 20 EA 10 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    EOR ($5F),Y          ; 51 5F | Exclusive OR with accumulator ((zero page),Y)
    EOR $E0DF,X          ; 5D DF E0 | Game work RAM access
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_094
; Address: $E29FF8
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_094:
    BRA $00              ; 80 00 | Branch always
    NOP                  ; EA | No operation
    LDY #$40             ; A0 40 | Load immediate value into Y register
    LDY $40              ; A4 40 | Load from zero page into Y register
    INC $C5FE,X          ; FE FE C5 | Increment (absolute,X)
    CPY $FF              ; C4 FF | Compare Y register (zero page)
    INC $E6FF,X          ; FE FF E6 | Increment (absolute,X)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_095
; Address: $E2A00F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_095:
    INC $0041,X          ; FE 41 00 | Increment (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    EOR ($01,X)          ; 41 01 | Exclusive OR with accumulator ((zero page,X))
    STY $B68C            ; 8C 8C B6 | Store Y register to absolute address
    ASL $47FE            ; 0E FE 47 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_096
; Address: $E2A028
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_096:
    SBC $F7              ; E5 F7 | Subtract with carry (zero page)
    DEC $4BFE,X          ; DE FE 4B | Decrement (absolute,X)
    BRA $2B              ; 80 2B | Branch always
    PHP                  ; 08 | Push processor status to stack
    BCC $57              ; 90 57 | Branch if carry clear
    EOR $0310            ; 4D 10 03 | Exclusive OR with accumulator (absolute)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    BPL $80              ; 10 80 | Branch if positive
    LDX $C8BE,Y          ; BE BE C8 | Load from absolute,Y into X register
    BEQ $FE              ; F0 FE | Branch if equal
    STZ $BE38,X          ; 9E 38 BE | Store zero to absolute,X
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BNE $03              ; D0 03 | Branch if not equal
    EOR ($B0,X)          ; 41 B0 | Exclusive OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    CPY #$11             ; C0 11 | Compare Y register (immediate)
    CMP ($71,X)          ; C1 71 | Compare accumulator ((zero page,X))
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    EOR ($7D,X)          ; 41 7D | Exclusive OR with accumulator ((zero page,X))
    INC $7CFE,X          ; FE FE 7C | Increment (absolute,X)
    ADC $3D20,X          ; 7D 20 3D | Add with carry (absolute,X)
    BCS $BD              ; B0 BD | Branch if carry set
    SBC $7170,X          ; FD 70 71 | Subtract with carry (absolute,X)
    ASL $009D            ; 0E 9D 00 | Arithmetic shift left (absolute)
    ORA ($60,X)          ; 01 60 | Logical OR with accumulator ((zero page,X))
    BRA $63              ; 80 63 | Branch always
    ROR $DF              ; 66 DF | Rotate right (zero page)
    LSR $FCEF,X          ; 5E EF FC | Logical shift right (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    DEC $3CD8,X          ; DE D8 3C | Decrement (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    STZ $4020            ; 9C 20 40 | Store zero to absolute
    INC $F280,X          ; FE 80 F2 | Increment (absolute,X)
    JMP $E9D8F4          ; 5C F4 D8 E9 | Jump to address long
    ADC ($EB),Y          ; 71 EB | Add with carry ((zero page),Y)
    PLX                  ; FA | Pull X register from stack
    SBC $FF18,X          ; FD 18 FF | Subtract with carry (absolute,X)
    ASL $FFFE,X          ; 1E FE FF | Arithmetic shift left (absolute,X)
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ROL $3EFE,X          ; 3E FE 3E | Rotate left (absolute,X)
    INC $1F1F,X          ; FE 1F 1F | Increment (absolute,X)
    STA                  ; 9F 01 E3 80 | Store accumulator to absolute long,X

;------------------------------------------------------------------------------
; Bank44_DmaFunction_097
; Address: $E2A0CE
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_097:
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    SEC                  ; 38 | Set carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDY $60E0,X          ; BC E0 60 | Load from absolute,X into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_098
; Address: $E2A0DE
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_098:
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CPY $41CC            ; CC CC 41 | Compare Y register (absolute)
    EOR ($41,X)          ; 41 41 | Exclusive OR with accumulator ((zero page,X))
    EOR ($B1,X)          ; 41 B1 | Exclusive OR with accumulator ((zero page,X))
    LDA ($F8),Y          ; B1 F8 | Load from (zero page),Y into accumulator
    INX                  ; E8 | Increment X register
    STY $84              ; 84 84 | Store Y register to zero page
    CMP ($02,X)          ; C1 02 | Compare accumulator ((zero page,X))
    CMP $00F3,X          ; DD F3 00 | Compare accumulator (absolute,X)
    LDA                  ; BF 00 BF 00 | Load from absolute long,X into accumulator
    BMI $17              ; 30 17 | Branch if negative
    SEI                  ; 78 | Set interrupt disable flag
    ADC $3D03,X          ; 7D 03 3D | Add with carry (absolute,X)
    INC $E6              ; E6 E6 | Increment (zero page)
    INC $E6              ; E6 E6 | Increment (zero page)
    SBC ($F1),Y          ; F1 F1 | Subtract with carry ((zero page),Y)
    CPX $E0              ; E4 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank44_DmaFunction_099
; Address: $E2A10A
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_099:
    JSL $800724          ; 22 24 07 80 | Jump to subroutine long
    CPX #$FA             ; E0 FA | Compare X register (immediate)
    SBC $F900,Y          ; F9 00 F9 | Subtract with carry (absolute,Y)
    INC $FF01            ; EE 01 FF | Increment (absolute)
    INC $FF07,X          ; FE 07 FF | Increment (absolute,X)
    STA                  ; 9F 9F 8E 8E | Store accumulator to absolute long,X
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    ORA $60C0            ; 0D C0 60 | Logical OR with accumulator (absolute)
    BRA $71              ; 80 71 | Branch always
    BRA $FD              ; 80 FD | Branch always
    BRA $FD              ; 80 FD | Branch always
    CPY #$CF             ; C0 CF | Compare Y register (immediate)
    CPY $CCDB            ; CC DB CC | Compare Y register (absolute)
    CPY $1C33            ; CC 33 1C | Compare Y register (absolute)
    INC $F101,X          ; FE 01 F1 | Increment (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $8E              ; 80 8E | Branch always
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BMI $FF              ; 30 FF | Branch if negative
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    ORA ($DF,X)          ; 01 DF | Logical OR with accumulator ((zero page,X))
    LDY #$DF             ; A0 DF | Load immediate value into Y register
    CPX #$FF             ; E0 FF | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_09A
; Address: $E2A176
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_09A:
    INC $7F01,X          ; FE 01 7F | Increment (absolute,X)
    STA ($FE,X)          ; 81 FE | Store accumulator to (zero page,X)
    ORA ($BF,X)          ; 01 BF | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    NOP                  ; EA | No operation
    BPL $CC              ; 10 CC | Branch if positive
    PEA #$F44B           ; F4 4B F4 | Push effective address to stack
    JMP $E75CF0          ; 5C F0 5C E7 | Jump to address long
    CLD                  ; D8 | Clear decimal mode flag
    SBC $B7F8,Y          ; F9 F8 B7 | Subtract with carry (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INC $BFFE,X          ; FE FE BF | Increment (absolute,X)
    ORA ($97,X)          ; 01 97 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    EOR $6700            ; 4D 00 67 | Exclusive OR with accumulator (absolute)
    STA                  ; 9F A4 5B A4 | Store accumulator to absolute long,X
    LDY $7A              ; A4 7A | Load from zero page into Y register
    JMP $00CE            ; 4C CE 00 | Jump to address
    ORA $7E              ; 05 7E | Logical OR with accumulator (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank44_DmaFunction_09C
; Address: $E2A1D7
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_09C:
    JSR $F64D            ; 20 4D F6 | Jump to subroutine
    AND ($CE),Y          ; 31 CE | Logical AND with accumulator ((zero page),Y)
    LDY $27AF            ; AC AF 27 | Load from absolute address into Y register
    ROL $26              ; 26 26 | Rotate left (zero page)
    WDM #$72             ; 42 72 | Reserved instruction
    INY                  ; C8 | Increment Y register
    SEC                  ; 38 | Set carry flag
    CMP $20E6,Y          ; D9 E6 20 | Compare accumulator (absolute,Y)
    BVC $88              ; 50 88 | Branch if overflow clear
    PHX                  ; DA | Push X register to stack
    PHX                  ; DA | Push X register to stack
    CMP $FD20,Y          ; D9 20 FD | Compare accumulator (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    INY                  ; C8 | Increment Y register
    CMP $00FF,Y          ; D9 FF 00 | Compare accumulator (absolute,Y)
    BEQ $FF              ; F0 FF | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    CPY $C7              ; C4 C7 | Compare Y register (zero page)
    STZ $9F1F,X          ; 9E 1F 9F | Store zero to absolute,X
    STA                  ; 9F F9 01 F8 | Store accumulator to absolute long,X
    BPL $00              ; 10 00 | Branch if positive
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    SEC                  ; 38 | Set carry flag
    CPY #$E2             ; C0 E2 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_09E
; Address: $E2A21B
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_09E:
    TYA                  ; 98 | Transfer Y register to accumulator
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ASL $7E              ; 06 7E | Arithmetic shift left (zero page)
    BMI $FF              ; 30 FF | Branch if negative
    DEC                  ; 3A | Decrement accumulator
    STX $818F            ; 8E 8F 81 | Store X register to absolute address
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $08              ; 80 08 | Branch always
    PHP                  ; 08 | Push processor status to stack
    BMI $00              ; 30 00 | Branch if negative
    LDA ($08),Y          ; B1 08 | Load from (zero page),Y into accumulator
    BVS $08              ; 70 08 | Branch if overflow set
    LSR $5E5F,X          ; 5E 5F 5E | Logical shift right (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    BMI $00              ; 30 00 | Branch if negative
    LDY #$42             ; A0 42 | Hardware register operation
    LDY #$42             ; A0 42 | Hardware register operation
    BRA $3E              ; 80 3E | Branch always
    CLI                  ; 58 | Clear interrupt disable flag
    ORA ($2A,X)          ; 01 2A | Logical OR with accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack
    STA $FE02,X          ; 9D 02 FE | Store accumulator to absolute,X
    INC $FF80,X          ; FE 80 FF | Increment (absolute,X)
    CPX $FF              ; E4 FF | Compare X register (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_09F
; Address: $E2A272
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_09F:
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0A0
; Address: $E2A27E
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0A0:
    JSR $F804            ; 20 04 F8 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INC $FE7C,X          ; FE 7C FE | Increment (absolute,X)
    BVS $F4              ; 70 F4 | Branch if overflow set
    PHB                  ; 8B | Push data bank register to stack
    CLD                  ; D8 | Clear decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    ORA #$F1             ; 09 F1 | Logical OR with accumulator (immediate)
    ORA $C931            ; 0D 31 C9 | Logical OR with accumulator (absolute)
    ORA $0420,X          ; 1D 20 04 | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0A1
; Address: $E2A29D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0A1:
    JSR $0400            ; 20 00 04 | Jump to subroutine
    SBC ($FD,X)          ; E1 FD | Subtract with carry ((zero page,X))
    INC $DBDA,X          ; FE DA DB | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SBC $81F9,Y          ; F9 F9 81 | Subtract with carry (absolute,Y)
    CPY #$B8             ; C0 B8 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0A2
; Address: $E2A2B0
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0A2:
    JSR $0002            ; 20 02 00 | Jump to subroutine
    BRA $01              ; 80 01 | Branch always
    BIT $18              ; 24 18 | Test bits in accumulator (zero page)
    ASL $F8              ; 06 F8 | Arithmetic shift left (zero page)
    SED                  ; F8 | Set decimal mode flag
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    STY $9C0C            ; 8C 0C 9C | Store Y register to absolute address
    DEC $FFBF,X          ; DE BF FF | Decrement (absolute,X)
    RTI                  ; 40 | Return from interrupt
    LSR                  ; 4A | Logical shift right (accumulator)
    AND #$21             ; 29 21 | PPU graphics register access
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    AND $F213,X          ; 3D 13 F2 | Logical AND with accumulator (absolute,X)
    ORA $9E01,X          ; 1D 01 9E | Logical OR with accumulator (absolute,X)
    STA $0ED2            ; 8D D2 0E | Store accumulator to absolute address
    ORA ($EB,X)          ; 01 EB | Logical OR with accumulator ((zero page,X))
    CPX #$A3             ; E0 A3 | Compare X register (immediate)
    CPX #$A2             ; E0 A2 | Compare X register (immediate)
    CPX $FF40            ; EC 40 FF | Compare X register (absolute)
    JMP $CDFF            ; 4C FF CD | Jump to address
    CPX #$25             ; E0 25 | Compare X register (immediate)
    PHX                  ; DA | Push X register to stack
    BVS $8F              ; 70 8F | Branch if overflow set
    ROR $99              ; 66 99 | Rotate right (zero page)
    LDX $00FE            ; AE FE 00 | Load from absolute address into X register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0A3
; Address: $E2A30C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0A3:
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    INC $FF21,X          ; FE 21 FF | Increment (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0A4
; Address: $E2A318
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0A4:
    EOR ($25,X)          ; 41 25 | Exclusive OR with accumulator ((zero page,X))
    STA                  ; 9F 10 FC 08 | Store accumulator to absolute long,X
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    ADC ($2C,X)          ; 61 2C | Add with carry ((zero page,X))
    BIT $41              ; 24 41 | Test bits in accumulator (zero page)
    STA $EF8F            ; 8D 8F EF | Store accumulator to absolute address
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    SBC $DB12,X          ; FD 12 DB | Subtract with carry (absolute,X)
    BIT $41FE            ; 2C FE 41 | Test bits in accumulator (absolute)
    BEQ $07              ; F0 07 | Branch if equal
    BPL $81              ; 10 81 | Branch if positive
    BPL $FE              ; 10 FE | Branch if positive
    CPX $80FF            ; EC FF 80 | Compare X register (absolute)
    STX $E0E0            ; 8E E0 E0 | Game work RAM access
    STZ $88FE,X          ; 9E FE 88 | Store zero to absolute,X
    CPY $00FF            ; CC FF 00 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0A6
; Address: $E2A361
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0A6:
    PLA                  ; 68 | Pull accumulator from stack
    STA                  ; 9F AA 8B BE | Store accumulator to absolute long,X
    STA ($9E,X)          ; 81 9E | Store accumulator to (zero page,X)
    INC $FB              ; E6 FB | Increment (zero page)
    CPX #$F6             ; E0 F6 | Compare X register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    INC $BEFE,X          ; FE FE BE | Increment (absolute,X)
    ORA #$7E             ; 09 7E | Logical OR with accumulator (immediate)
    PHB                  ; 8B | Push data bank register to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $39              ; 06 39 | Arithmetic shift left (zero page)
    DEY                  ; 88 | Decrement Y register
    LDX $F811            ; AE 11 F8 | Load from absolute address into X register
    SBC $F802,X          ; FD 02 F8 | Subtract with carry (absolute,X)
    ORA $0C              ; 05 0C | Logical OR with accumulator (zero page)
    PEA #$0FEF           ; F4 EF 0F | Push effective address to stack
    ROL                  ; 2A | Rotate left (accumulator)
    BMI $FF              ; 30 FF | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    PEA #$F80B           ; F4 0B F8 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0A7
; Address: $E2A399
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0A7:
    JSR $00FC            ; 20 FC 00 | Jump to subroutine
    ROL $3880,X          ; 3E 80 38 | Rotate left (absolute,X)
    DEC $6E              ; C6 6E | Decrement (zero page)
    ROR $FF7E            ; 6E 7E FF | Rotate right (absolute)
    LDA ($E5,X)          ; A1 E5 | Load from (zero page,X) into accumulator
    STZ $38              ; 64 38 | Store zero to zero page
    RTI                  ; 40 | Return from interrupt
    STA ($48),Y          ; 91 48 | Store accumulator to (zero page),Y
    STA ($70,X)          ; 81 70 | Store accumulator to (zero page,X)
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    CPY $14              ; C4 14 | Compare Y register (zero page)
    LDY $1F17,X          ; BC 17 1F | Load from absolute,X into Y register
    BPL $6F              ; 10 6F | Branch if positive
    STY $FF              ; 84 FF | Store Y register to zero page
    AND $007D,X          ; 3D 7D 00 | Logical AND with accumulator (absolute,X)
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))
    INC $BF07,X          ; FE 07 BF | Increment (absolute,X)
    BPL $78              ; 10 78 | Branch if positive
    ROL $0081,X          ; 3E 81 00 | Rotate left (absolute,X)
    INC $0300,X          ; FE 00 03 | Increment (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    STX $7F3D            ; 8E 3D 7F | Store X register to absolute address
    ADC ($CD,X)          ; 61 CD | Add with carry ((zero page,X))
    CMP $19F3            ; CD F3 19 | Compare accumulator (absolute)
    BRA $C7              ; 80 C7 | Branch always
    CPY #$C3             ; C0 C3 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0A8
; Address: $E2A3F0
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0A8:
    INC $ED8D,X          ; FE 8D ED | Increment (absolute,X)
    CMP $0D33            ; CD 33 0D | Compare accumulator (absolute)
    ASL $8FD1            ; 0E D1 8F | Arithmetic shift left (absolute)
    CPX #$03             ; E0 03 | Compare X register (immediate)
    SEC                  ; 38 | Set carry flag
    JMP ($0390)          ; 6C 90 03 | Jump to address (absolute indirect)
    BPL $EF              ; 10 EF | Branch if positive
    PLA                  ; 68 | Pull accumulator from stack
    LDY $5C              ; A4 5C | Load from zero page into Y register
    CPY #$E0             ; C0 E0 | Game work RAM access
    BRA $E7              ; 80 E7 | Branch always
    JMP ($03FE)          ; 6C FE 03 | Jump to address (absolute indirect)
    BPL $FB              ; 10 FB | Branch if positive
    LDY $FF              ; A4 FF | Load from zero page into Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SBC ($01),Y          ; F1 01 | Subtract with carry ((zero page),Y)
    CMP $C705            ; CD 05 C7 | Compare accumulator (absolute)
    DEC $FDCE            ; CE CE FD | Decrement (absolute)
    PHP                  ; 08 | Push processor status to stack
    CPX #$FE             ; E0 FE | Compare X register (immediate)
    SBC ($FA),Y          ; F1 FA | Subtract with carry ((zero page),Y)
    CMP $C7F8            ; CD F8 C7 | Compare accumulator (absolute)
    AND ($0E),Y          ; 31 0E | Logical AND with accumulator ((zero page),Y)
    ADC $397D,X          ; 7D 7D 39 | Add with carry (absolute,X)
    AND $3E3E,Y          ; 39 3E 3E | Logical AND with accumulator (absolute,Y)
    DEC $F3FE            ; CE FE F3 | Decrement (absolute)
    LDA                  ; BF 20 30 92 | Load from absolute long,X into accumulator
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    AND ($CE),Y          ; 31 CE | Logical AND with accumulator ((zero page),Y)
    EOR ($E0,X)          ; 41 E0 | Game work RAM access
    CPX #$0F             ; E0 0F | Compare X register (immediate)
    STA                  ; 9F FF F7 F7 | Store accumulator to absolute long,X
    BEQ $F0              ; F0 F0 | Branch if equal
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    BMI $70              ; 30 70 | Branch if negative
    BPL $0C              ; 10 0C | Branch if positive
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    XBA                  ; EB | Exchange accumulator bytes
    CLC                  ; 18 | Clear carry flag
    BRA $C1              ; 80 C1 | Branch always
    CMP ($80,X)          ; C1 80 | Compare accumulator ((zero page,X))
    BRA $C4              ; 80 C4 | Branch always
    CPY $EC              ; C4 EC | Compare Y register (zero page)
    CPX $1C1C            ; EC 1C 1C | Compare X register (absolute)
    ASL $7262,X          ; 1E 62 72 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0A9
; Address: $E2A48E
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0A9:
    JSR $3F24            ; 20 24 3F | Jump to subroutine
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    LDA ($1C),Y          ; B1 1C | Load from (zero page),Y into accumulator
    CLC                  ; 18 | Clear carry flag
    CPX $18              ; E4 18 | Compare X register (zero page)
    INC $FF20,X          ; FE 20 FF | Increment (absolute,X)
    CPX #$F7             ; E0 F7 | Compare X register (immediate)
    INX                  ; E8 | Increment X register
    LDA                  ; BF 60 FA 04 | Load from absolute long,X into accumulator
    CPX $03              ; E4 03 | Compare X register (zero page)
    AND ($FE,X)          ; 21 FE | Logical AND with accumulator ((zero page,X))
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BEQ $EF              ; F0 EF | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SBC $6506,Y          ; F9 06 65 | Subtract with carry (absolute,Y)
    ADC $00              ; 65 00 | Add with carry (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    SBC $EB09,Y          ; F9 09 EB | Subtract with carry (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    EOR ($3E,X)          ; 41 3E | Exclusive OR with accumulator ((zero page,X))
    TXS                  ; 9A | Transfer X register to stack pointer
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    XBA                  ; EB | Exchange accumulator bytes
    INC $8041,X          ; FE 41 80 | Increment (absolute,X)
    CLD                  ; D8 | Clear decimal mode flag
    BVS $7C              ; 70 7C | Branch if overflow set
    BVS $7C              ; 70 7C | Branch if overflow set
    LDA $27              ; A5 27 | Load from zero page into accumulator
    BRA $03              ; 80 03 | Branch always
    BRA $03              ; 80 03 | Branch always
    RTI                  ; 40 | Return from interrupt
    BPL $C0              ; 10 C0 | Branch if positive
    BEQ $00              ; F0 00 | Branch if equal
    PLA                  ; 68 | Pull accumulator from stack
    ORA ($09),Y          ; 11 09 | Logical OR with accumulator ((zero page),Y)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    INC $81              ; E6 81 | Increment (zero page)
    STA ($81),Y          ; 91 81 | Store accumulator to (zero page),Y
    SBC $FFE9,Y          ; F9 E9 FF | Subtract with carry (absolute,Y)
    ROR $94FE,X          ; 7E FE 94 | Rotate right (absolute,X)
    BCC $F1              ; 90 F1 | Branch if carry clear
    ADC ($78,X)          ; 61 78 | Add with carry ((zero page,X))
    ROR $0700,X          ; 7E 00 07 | Rotate right (absolute,X)
    BRA $01              ; 80 01 | Branch always
    BPL $38              ; 10 38 | Branch if positive
    BCC $B8              ; 90 B8 | Branch if carry clear
    BCC $B8              ; 90 B8 | Branch if carry clear
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0AA
; Address: $E2A527
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0AA:
    LDA $CF81,X          ; BD 81 CF | Load from absolute,X into accumulator
    CPY #$F8             ; C0 F8 | Compare Y register (immediate)
    SBC $C4FD            ; ED FD C4 | Subtract with carry (absolute)
    BRA $57              ; 80 57 | Branch always
    BRA $57              ; 80 57 | Branch always
    REP #$80             ; C2 80 | Reset processor status bits
    BMI $03              ; 30 03 | Branch if negative
    TYA                  ; 98 | Transfer Y register to accumulator
    CMP $40              ; C5 40 | Compare accumulator (zero page)
    BVS $1C              ; 70 1C | Branch if overflow set
    ASL $DE16,X          ; 1E 16 DE | Arithmetic shift left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    AND $FFBF,Y          ; 39 BF FF | Logical AND with accumulator (absolute,Y)
    PLY                  ; 7A | Pull Y register from stack
    PLY                  ; 7A | Pull Y register from stack
    STY $168F            ; 8C 8F 16 | Store Y register to absolute address
    CPX $27E1            ; EC E1 27 | Compare X register (absolute)
    AND ($86,X)          ; 21 86 | Logical AND with accumulator ((zero page,X))
    CPY #$A1             ; C0 A1 | Compare Y register (immediate)
    ASL $8D              ; 06 8D | Arithmetic shift left (zero page)
    ROL $063E,X          ; 3E 3E 06 | Rotate left (absolute,X)
    ASL $4705,X          ; 1E 05 47 | Arithmetic shift left (absolute,X)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    BRA $80              ; 80 80 | Branch always
    BRA $81              ; 80 81 | Branch always
    TYA                  ; 98 | Transfer Y register to accumulator
    STA ($98,X)          ; 81 98 | Store accumulator to (zero page,X)
    ORA ($DE,X)          ; 01 DE | Logical OR with accumulator ((zero page,X))
    ORA ($E6,X)          ; 01 E6 | Logical OR with accumulator ((zero page,X))
    LDA $F8B2,X          ; BD B2 F8 | Load from absolute,X into accumulator
    LDY #$7F             ; A0 7F | Load immediate value into Y register
    BRA $BD              ; 80 BD | Branch always
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0AB
; Address: $E2A588
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0AB:
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    BRA $FF              ; 80 FF | Branch always
    LDY #$09             ; A0 09 | Load immediate value into Y register
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    CLD                  ; D8 | Clear decimal mode flag
    PLX                  ; FA | Pull X register from stack
    INC $FE3A,X          ; FE 3A FE | Increment (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    AND ($77),Y          ; 31 77 | Logical AND with accumulator ((zero page),Y)
    EOR ($47,X)          ; 41 47 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0AC
; Address: $E2A5B7
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0AC:
    PLB                  ; AB | Pull data bank register from stack
    CMP #$C2             ; C9 C2 | Compare accumulator (immediate)
    AND $1880,Y          ; 39 80 18 | Logical AND with accumulator (absolute,Y)
    ORA #$80             ; 09 80 | Logical OR with accumulator (immediate)
    ORA ($FB),Y          ; 11 FB | Logical OR with accumulator ((zero page),Y)
    ORA ($FB),Y          ; 11 FB | Logical OR with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    SBC $9818,Y          ; F9 18 98 | Subtract with carry (absolute,Y)
    ASL $191F            ; 0E 1F 19 | Arithmetic shift left (absolute)
    CMP $DA1A,Y          ; D9 1A DA | Compare accumulator (absolute,Y)
    JMP ($046C)          ; 6C 6C 04 | Jump to address (absolute indirect)
    REP #$E0             ; C2 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0AD
; Address: $E2A5DD
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0AD:
    JSR $2235            ; 20 35 22 | Jump to subroutine
    BEQ $80              ; F0 80 | Branch if equal
    BRA $F3              ; 80 F3 | Branch always
    REP #$EF             ; C2 EF | Reset processor status bits
    ROL $802C            ; 2E 2C 80 | Rotate left (absolute)
    BRA $83              ; 80 83 | Branch always
    BRA $00              ; 80 00 | Branch always
    BPL $08              ; 10 08 | Branch if positive
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPX #$FB             ; E0 FB | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    CPY #$04             ; C0 04 | Compare Y register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    ASL $003F            ; 0E 3F 00 | Arithmetic shift left (absolute)
    BRA $FF              ; 80 FF | Branch always
    INC $02FF,X          ; FE FF 02 | Increment (absolute,X)
    ORA ($E7,X)          ; 01 E7 | Logical OR with accumulator ((zero page,X))
    ORA ($77,X)          ; 01 77 | Logical OR with accumulator ((zero page,X))
    ASL $00C0            ; 0E C0 00 | Arithmetic shift left (absolute)
    ADC #$00             ; 69 00 | Add with carry (immediate)
    ADC #$80             ; 69 80 | Add with carry (immediate)
    SEC                  ; 38 | Set carry flag
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    ASL $0EFF            ; 0E FF 0E | Arithmetic shift left (absolute)
    ASL $1EFF,X          ; 1E FF 1E | Arithmetic shift left (absolute,X)
    LDA                  ; BF 0F FF CF | Load from absolute long,X into accumulator
    SBC ($F1),Y          ; F1 F1 | Subtract with carry ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $0F40,X          ; 1E 40 0F | Arithmetic shift left (absolute,X)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    LDA                  ; BF 0F BF 00 | Load from absolute long,X into accumulator
    LDA                  ; BF 00 F8 B8 | Load from absolute long,X into accumulator
    BEQ $F0              ; F0 F0 | Branch if equal

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0AE
; Address: $E2A66F
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0AE:
    DEX                  ; CA | Decrement X register
    CPY #$48             ; C0 48 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    PHA                  ; 48 | Push accumulator to stack
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CLV                  ; B8 | Clear overflow flag
    XBA                  ; EB | Exchange accumulator bytes
    RTI                  ; 40 | Return from interrupt
    INC $FE87,X          ; FE 87 FE | Increment (absolute,X)
    STY $1D0F            ; 8C 0F 1D | Store Y register to absolute address
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0AF
; Address: $E2A68F
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0AF:
    STA                  ; 9F C3 00 05 | Store accumulator to absolute long,X
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ORA $70E3            ; 0D E3 70 | Logical OR with accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CMP $FE              ; C5 FE | Compare accumulator (zero page)
    STA                  ; 9F E0 DD 22 | Store accumulator to absolute long,X

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0B0
; Address: $E2A6AF
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0B0:
    JSR $03FE            ; 20 FE 03 | Jump to subroutine
    SBC $FEC7,Y          ; F9 C7 FE | Subtract with carry (absolute,Y)
    STA                  ; 9F E0 1D E2 | Store accumulator to absolute long,X
    CPX #$81             ; E0 81 | Compare X register (immediate)
    ROR $FB04,X          ; 7E 04 FB | Rotate right (absolute,X)
    SBC $EC1F,X          ; FD 1F EC | Subtract with carry (absolute,X)
    BPL $E0              ; 10 E0 | Game work RAM access
    ROR $1F81,X          ; 7E 81 1F | Rotate right (absolute,X)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX $0CFF            ; EC FF 0C | Compare X register (absolute)
    BPL $E0              ; 10 E0 | Game work RAM access
    PHB                  ; 8B | Push data bank register to stack
    ORA $700F            ; 0D 0F 70 | Logical OR with accumulator (absolute)
    LDA $37CF4F          ; AF 4F CF 37 | Load from absolute long address into accumulator
    BEQ $0D              ; F0 0D | Branch if equal
    DEY                  ; 88 | Decrement Y register
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    BEQ $00              ; F0 00 | Branch if equal
    BRA $DC              ; 80 DC | Branch always

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0B1
; Address: $E2A6FB
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0B1:
    JSR $08F4            ; 20 F4 08 | Jump to subroutine
    INC $FFF7,X          ; FE F7 FF | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    BEQ $F0              ; F0 F0 | Branch if equal
    STA $810001          ; 8F 01 00 81 | Store accumulator to absolute long address
    STA ($02),Y          ; 91 02 | Store accumulator to (zero page),Y
    STY $01              ; 84 01 | Store Y register to zero page
    BVS $8F              ; 70 8F | Branch if overflow set
    LDX $E7              ; A6 E7 | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0B3
; Address: $E2A726
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0B3:
    CPX $E5              ; E4 E5 | Compare X register (zero page)
    BVS $7E              ; 70 7E | Branch if overflow set
    INC $CF6A,X          ; FE 6A CF | Increment (absolute,X)
    EOR $7FA6,Y          ; 59 A6 7F | Exclusive OR with accumulator (absolute,Y)
    BRA $9F              ; 80 9F | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0B4
; Address: $E2A738
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0B4:
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    INX                  ; E8 | Increment X register
    BPL $7C              ; 10 7C | Branch if positive
    STA ($94,X)          ; 81 94 | Store accumulator to (zero page,X)
    PLA                  ; 68 | Pull accumulator from stack
    ADC ($27),Y          ; 71 27 | Add with carry ((zero page),Y)
    ASL $11CF            ; 0E CF 11 | Arithmetic shift left (absolute)
    CPY #$C8             ; C0 C8 | Compare Y register (immediate)
    DEY                  ; 88 | Decrement Y register
    LDX $2E70            ; AE 70 2E | Load from absolute address into X register
    SBC $D102,Y          ; F9 02 D1 | Subtract with carry (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    BRA $C1              ; 80 C1 | Branch always
    RTI                  ; 40 | Return from interrupt
    BCC $BD              ; 90 BD | Branch if carry clear
    ROL $FF3E,X          ; 3E 3E FF | Rotate left (absolute,X)
    BIT $8EBE            ; 2C BE 8E | Test bits in accumulator (absolute)
    ROL $8242            ; 2E 42 82 | Rotate left (absolute)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    CMP ($80,X)          ; C1 80 | Compare accumulator ((zero page,X))
    BVC $01              ; 50 01 | Branch if overflow clear
    BPL $81              ; 10 81 | Branch if positive
    BRA $0C              ; 80 0C | Branch always
    BRA $B1              ; 80 B1 | Branch always
    BVC $78              ; 50 78 | Branch if overflow clear
    BIT $6E2E            ; 2C 2E 6E | Test bits in accumulator (absolute)
    STA $048D            ; 8D 8D 04 | Store accumulator to absolute address
    BRA $80              ; 80 80 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    REP #$4E             ; C2 4E | Reset processor status bits
    STY $07              ; 84 07 | Store Y register to zero page
    BNE $09              ; D0 09 | Branch if not equal
    BCC $4C              ; 90 4C | Branch if carry clear
    ASL $8E              ; 06 8E | Arithmetic shift left (zero page)
    REP #$E7             ; C2 E7 | Reset processor status bits
    SBC ($F1,X)          ; E1 F1 | Subtract with carry ((zero page,X))
    SBC $E4F9,Y          ; F9 F9 E4 | Subtract with carry (absolute,Y)
    INC $7A              ; E6 7A | Increment (zero page)
    INC                  ; 1A | Increment accumulator
    TXS                  ; 9A | Transfer X register to stack pointer
    ORA ($70,X)          ; 01 70 | Logical OR with accumulator ((zero page,X))
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0B5
; Address: $E2A7B4
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0B5:
    JSL $C6048F          ; 22 8F 04 C6 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    EOR ($04,X)          ; 41 04 | Exclusive OR with accumulator ((zero page,X))
    BMI $10              ; 30 10 | Branch if negative
    INY                  ; C8 | Increment Y register
    AND $68              ; 25 68 | Logical AND with accumulator (zero page)
    PLX                  ; FA | Pull X register from stack
    INC $FD01,X          ; FE 01 FD | Increment (absolute,X)
    STY $BC              ; 84 BC | Store Y register to zero page
    LDY $ECFC,X          ; BC FC EC | Load from absolute,X into Y register
    CPX $2300            ; EC 00 23 | Compare X register (absolute)
    BRA $00              ; 80 00 | Branch always
    BRA $01              ; 80 01 | Branch always
    ORA ($C7,X)          ; 01 C7 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0B6
; Address: $E2A7DF
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0B6:
    JSR $FDC5            ; 20 C5 FD | Jump to subroutine
    CPX $1BFC            ; EC FC 1B | Compare X register (absolute)
    SED                  ; F8 | Set decimal mode flag
    BEQ $CF              ; F0 CF | Branch if equal
    ASL $0E0F,X          ; 1E 0F 0E | Arithmetic shift left (absolute,X)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    LDY $3303,X          ; BC 03 33 | Load from absolute,X into Y register
    INC $FE1F            ; EE 1F FE | Increment (absolute)
    LDY $0043,X          ; BC 43 00 | Load from absolute,X into Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    CMP $3A              ; C5 3A | Compare accumulator (zero page)
    WDM #$7F             ; 42 7F | Reserved instruction
    BPL $00              ; 10 00 | Branch if positive
    STA                  ; 9F 74 FF 05 | Store accumulator to absolute long,X
    ORA ($73,X)          ; 01 73 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    INC $0102,X          ; FE 02 01 | Increment (absolute,X)
    INX                  ; E8 | Increment X register
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    BVS $FC              ; 70 FC | Branch if overflow set
    AND ($EC,X)          ; 21 EC | Logical AND with accumulator ((zero page,X))
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    BEQ $FF              ; F0 FF | Branch if equal
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    AND ($1E,X)          ; 21 1E | Logical AND with accumulator ((zero page,X))
    JMP $41BE23          ; 5C 23 BE 41 | Jump to address long
    ROR $FF81,X          ; 7E 81 FF | Rotate right (absolute,X)
    STA $132E70          ; 8F 70 2E 13 | Store accumulator to absolute long address
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    INC $FE81,X          ; FE 81 FE | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    STA $0C9370          ; 8F 70 93 0C | Store accumulator to absolute long address
    BRA $7F              ; 80 7F | Branch always
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0B7
; Address: $E2A86A
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0B7:
    BRA $7F              ; 80 7F | Branch always
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BCC $00              ; 90 00 | Branch if carry clear
    SEC                  ; 38 | Set carry flag
    BRA $7F              ; 80 7F | Branch always
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0B8
; Address: $E2A8A5
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0B8:
    BRA $C0              ; 80 C0 | Branch always
    CLI                  ; 58 | Clear interrupt disable flag
    LDY $41              ; A4 41 | Load from zero page into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0B9
; Address: $E2A8AD
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0B9:
    BRA $98              ; 80 98 | Branch always
    INC                  ; 1A | Increment accumulator
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    CLC                  ; 18 | Clear carry flag
    INC $FF19,X          ; FE 19 FF | Increment (absolute,X)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0BA
; Address: $E2A8C5
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0BA:
    JSR $0300            ; 20 00 03 | Jump to subroutine
    ORA $3300,Y          ; 19 00 33 | Logical OR with accumulator (absolute,Y)
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    INC $00              ; E6 00 | Increment (zero page)
    CPY $0843            ; CC 43 08 | Compare Y register (absolute)
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    STY $9803            ; 8C 03 98 | Store Y register to absolute address
    ORA ($F8,X)          ; 01 F8 | Logical OR with accumulator ((zero page,X))
    SBC $FD00,X          ; FD 00 FD | Subtract with carry (absolute,X)
    BVS $F7              ; 70 F7 | Branch if overflow set
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    STY $00              ; 84 00 | Store Y register to zero page
    BRA $00              ; 80 00 | Branch always
    BEQ $FC              ; F0 FC | Branch if equal
    BEQ $FC              ; F0 FC | Branch if equal
    BRA $FC              ; 80 FC | Branch always

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0BB
; Address: $E2A918
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0BB:
    STY $E7              ; 84 E7 | Store Y register to zero page
    INC $E7              ; E6 E7 | Increment (zero page)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    LDX $3A00,Y          ; BE 00 3A | Load from absolute,Y into X register
    BMI $00              ; 30 00 | Branch if negative
    BRA $04              ; 80 04 | Branch always
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    CMP $00              ; C5 00 | Compare accumulator (zero page)
    XBA                  ; EB | Exchange accumulator bytes
    BPL $0C              ; 10 0C | Branch if positive
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ADC ($FF),Y          ; 71 FF | Add with carry ((zero page),Y)
    BVC $FF              ; 50 FF | Branch if overflow clear
    PHX                  ; DA | Push X register to stack
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    WDM #$39             ; 42 39 | Reserved instruction

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0BC
; Address: $E2A966
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0BC:
    JSR $081D            ; 20 1D 08 | Jump to subroutine
    ORA ($2C,X)          ; 01 2C | Logical OR with accumulator ((zero page,X))
    ORA ($14),Y          ; 11 14 | Logical OR with accumulator ((zero page),Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0BD
; Address: $E2A972
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0BD:
    DEC $FF              ; C6 FF | Decrement (zero page)
    STY $FE              ; 84 FE | Store Y register to zero page
    REP #$FE             ; C2 FE | Reset processor status bits
    PEA #$64FE           ; F4 FE 64 | Push effective address to stack
    INC $FCF4,X          ; FE F4 FC | Increment (absolute,X)
    CPY $FC              ; C4 FC | Compare Y register (zero page)
    LDX $DE40,Y          ; BE 40 DE | Load from absolute,Y into X register
    LSR $8800            ; 4E 00 88 | Logical shift right (absolute)
    ORA ($71,X)          ; 01 71 | Logical OR with accumulator ((zero page,X))
    ROL $51              ; 26 51 | Rotate left (zero page)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    SBC ($81,X)          ; E1 81 | Subtract with carry ((zero page,X))
    SBC ($41),Y          ; F1 41 | Subtract with carry ((zero page),Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    ROL $0F00,X          ; 3E 00 0F | Rotate left (absolute,X)
    BRA $06              ; 80 06 | Branch always
    WDM #$88             ; 42 88 | Reserved instruction

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0BE
; Address: $E2A9AC
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0BE:
    JSR $0048            ; 20 48 00 | Jump to subroutine
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CMP ($C0,X)          ; C1 C0 | Compare accumulator ((zero page,X))
    BEQ $40              ; F0 40 | Branch if equal
    SBC $F765,Y          ; F9 65 F7 | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0BF
; Address: $E2A9BA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0BF:
    JSR $36EF            ; 20 EF 36 | Jump to subroutine
    DEC $F900,X          ; DE 00 F9 | Decrement (absolute,X)
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0C0
; Address: $E2A9C7
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0C0:
    PHP                  ; 08 | Push processor status to stack
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    ASL $0830            ; 0E 30 08 | Arithmetic shift left (absolute)
    BRA $60              ; 80 60 | Branch always
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    STA $F7              ; 85 F7 | Store accumulator to zero page
    BCS $FF              ; B0 FF | Branch if carry set
    BMI $FF              ; 30 FF | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0C1
; Address: $E2A9E1
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0C1:
    BEQ $01              ; F0 01 | Branch if equal
    CPX $06              ; E4 06 | Compare X register (zero page)
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    ROL $7D79            ; 2E 79 7D | Rotate left (absolute)
    ASL $98FF            ; 0E FF 98 | Arithmetic shift left (absolute)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    INC                  ; 1A | Increment accumulator
    ORA $0F              ; 05 0F | Logical OR with accumulator (zero page)
    ORA $1C00            ; 0D 00 1C | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $17              ; 10 17 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    INC                  ; 1A | Increment accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0C2
; Address: $E2AA2D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0C2:
    BRA $86              ; 80 86 | Branch always
    SBC $9FFF,X          ; FD FF 9F | Subtract with carry (absolute,X)
    EOR $CFFF,X          ; 5D FF CF | Exclusive OR with accumulator (absolute,X)
    BRA $00              ; 80 00 | Branch always
    BCC $00              ; 90 00 | Branch if carry clear
    BRA $FF              ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0C3
; Address: $E2AA52
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0C3:
    JSR $C0FF            ; 20 FF C0 | Jump to subroutine
    BRA $FF              ; 80 FF | Branch always
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    LDA ($FF),Y          ; B1 FF | Load from (zero page),Y into accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA $00FF,Y          ; 19 FF 00 | Logical OR with accumulator (absolute,Y)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA #$53             ; 09 53 | Logical OR with accumulator (immediate)
    STA $CF36            ; 8D 36 CF | Store accumulator to absolute address
    BMI $FF              ; 30 FF | Branch if negative
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BCS $41              ; B0 41 | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0C4
; Address: $E2AAA7
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0C4:
    STY $7C80            ; 8C 80 7C | Store Y register to absolute address
    BRA $60              ; 80 60 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0C5
; Address: $E2AAB2
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0C5:
    STZ $FF              ; 64 FF | Store zero to zero page
    INC $F310,X          ; FE 10 F3 | Increment (absolute,X)
    STA                  ; 9F 07 3F 70 | Store accumulator to absolute long,X
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    INC $DC00,X          ; FE 00 DC | Increment (absolute,X)
    DEY                  ; 88 | Decrement Y register
    AND $CE80,Y          ; 39 80 CE | Logical AND with accumulator (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    DEC $00              ; C6 00 | Decrement (zero page)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    BMI $00              ; 30 00 | Branch if negative
    INC                  ; 1A | Increment accumulator
    BRA $02              ; 80 02 | Branch always
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    SBC $FC00            ; ED 00 FC | Subtract with carry (absolute)
    SBC $F100,X          ; FD 00 F1 | Subtract with carry (absolute,X)
    ASL $26FF,X          ; 1E FF 26 | Arithmetic shift left (absolute,X)
    ROL $1200,X          ; 3E 00 12 | Rotate left (absolute,X)
    ASL $0080            ; 0E 80 00 | Arithmetic shift left (absolute)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0C7
; Address: $E2AB29
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0C7:
    JSR $6418            ; 20 18 64 | Jump to subroutine
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))
    ORA ($5B,X)          ; 01 5B | Logical OR with accumulator ((zero page,X))
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $59FF,X          ; 9D FF 59 | Store accumulator to absolute,X
    STA                  ; 9F 16 9F 1A | Store accumulator to absolute long,X
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    BCS $41              ; B0 41 | Branch if carry set
    BPL $0C              ; 10 0C | Branch if positive
    BRA $62              ; 80 62 | Branch always
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC $04              ; E6 04 | Increment (zero page)
    INC $2EFF            ; EE FF 2E | Increment (absolute)
    EOR $E9FF            ; 4D FF E9 | Exclusive OR with accumulator (absolute)
    ORA $10DF,X          ; 1D DF 10 | Logical OR with accumulator (absolute,X)
    PHA                  ; 48 | Push accumulator to stack
    LSR $3C18            ; 4E 18 3C | Logical shift right (absolute)
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    ORA $3040,X          ; 1D 40 30 | Logical OR with accumulator (absolute,X)
    BRA $78              ; 80 78 | Branch always
    AND $BC00,Y          ; 39 00 BC | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0C8
; Address: $E2AB6F
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0C8:
    LDA                  ; BF C0 FB AA | Load from absolute long,X into accumulator
    LDY #$E3             ; A0 E3 | Load immediate value into Y register
    BRA $EF              ; 80 EF | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    SEC                  ; 38 | Set carry flag
    LDX $28              ; A6 28 | Load from zero page into X register
    DEC $4224,X          ; DE 24 42 | Hardware register operation
    SEC                  ; 38 | Set carry flag
    DEY                  ; 88 | Decrement Y register
    BMI $30              ; 30 30 | Branch if negative
    BPL $30              ; 10 30 | Branch if positive
    EOR ($20,X)          ; 41 20 | Exclusive OR with accumulator ((zero page,X))
    ORA #$7F             ; 09 7F | Logical OR with accumulator (immediate)
    STX $6EFF            ; 8E FF 6E | Store X register to absolute address
    ORA $0900,Y          ; 19 00 09 | Logical OR with accumulator (absolute,Y)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $00FF            ; 0E FF 00 | Arithmetic shift left (absolute)
    RTI                  ; 40 | Return from interrupt
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    ORA $0003            ; 0D 03 00 | Logical OR with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $0D13,X          ; 1D 13 0D | Logical OR with accumulator (absolute,X)
    ORA $3D16,X          ; 1D 16 3D | Logical OR with accumulator (absolute,X)
    AND $3F05,X          ; 3D 05 3F | Logical AND with accumulator (absolute,X)
    ORA #$3F             ; 09 3F | Logical OR with accumulator (immediate)
    ORA $623F,Y          ; 19 3F 62 | Logical OR with accumulator (absolute,Y)
    BVS $FF              ; 70 FF | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0C9
; Address: $E2AC16
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0C9:
    CPX #$DF             ; E0 DF | Compare X register (immediate)
    CPX #$DF             ; E0 DF | Compare X register (immediate)
    CMP $DDE2,X          ; DD E2 DD | Compare accumulator (absolute,X)
    PLX                  ; FA | Pull X register from stack
    CMP $0043,X          ; DD 43 00 | Compare accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0CA
; Address: $E2AC22
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0CA:
    ADC ($82,X)          ; 61 82 | Add with carry ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    TXA                  ; 8A | Transfer X register to accumulator
    ORA $23              ; 05 23 | Logical OR with accumulator (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0CB
; Address: $E2AC2F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0CB:
    STZ $EF              ; 64 EF | Store zero to zero page
    ADC $FF              ; 65 FF | Add with carry (zero page)
    PEA #$FCFF           ; F4 FF FC | Push effective address to stack
    STA                  ; 9F FC 9B 90 | Store accumulator to absolute long,X
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0CC
; Address: $E2AC46
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0CC:
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    LDY #$01             ; A0 01 | Load immediate value into Y register
    STA ($F0,X)          ; 81 F0 | Store accumulator to (zero page,X)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SBC $B3FF,X          ; FD FF B3 | Subtract with carry (absolute,X)
    INC $6EFF,X          ; FE FF 6E | Increment (absolute,X)
    LDY $DCFF            ; AC FF DC | Load from absolute address into Y register
    ORA ($82,X)          ; 01 82 | Logical OR with accumulator ((zero page,X))
    STY $83              ; 84 83 | Store Y register to zero page
    ORA $83              ; 05 83 | Logical OR with accumulator (zero page)
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ORA ($8F,X)          ; 01 8F | Logical OR with accumulator ((zero page,X))
    EOR $FF              ; 45 FF | Exclusive OR with accumulator (zero page)
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    ORA $C6FF            ; 0D FF C6 | Logical OR with accumulator (absolute)
    STA $0F1D1F          ; 8F 1F 1D 0F | Store accumulator to absolute long address
    LDA                  ; BF 8F FF BF | Load from absolute long,X into accumulator
    SBC $FF              ; E5 FF | Subtract with carry (zero page)
    BEQ $FF              ; F0 FF | Branch if equal
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    AND $43FF,Y          ; 39 FF 43 | Logical AND with accumulator (absolute,Y)
    STA $0000FF          ; 8F FF 00 00 | Store accumulator to absolute long address
    BRA $00              ; 80 00 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($0B),Y          ; 11 0B | Logical OR with accumulator ((zero page),Y)
    AND ($E0),Y          ; 31 E0 | Game work RAM access
    REP #$FE             ; C2 FE | Reset processor status bits

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0CD
; Address: $E2ACB6
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0CD:
    JSR $48FC            ; 20 FC 48 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    CPY $E0              ; C4 E0 | Game work RAM access
    CPY $C0              ; C4 C0 | Compare Y register (zero page)
    STA $C980            ; 8D 80 C9 | Store accumulator to absolute address
    BRA $C2              ; 80 C2 | Branch always
    CPX #$E3             ; E0 E3 | Compare X register (immediate)
    SEP #$F5             ; E2 F5 | Set processor status bits
    SED                  ; F8 | Set decimal mode flag
    STZ $FC00            ; 9C 00 FC | Store zero to absolute
    AND $1C08,X          ; 3D 08 1C | Logical AND with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0CE
; Address: $E2ACE1
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0CE:
    INC $EF00,X          ; FE 00 EF | Increment (absolute,X)
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    STA $00              ; 85 00 | Store accumulator to zero page
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BMI $00              ; 30 00 | Branch if negative
    SBC $FF20,X          ; FD 20 FF | Subtract with carry (absolute,X)
    STZ $E7              ; 64 E7 | Store zero to zero page
    RTI                  ; 40 | Return from interrupt
    WDM #$00             ; 42 00 | Reserved instruction
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    LDX #$00             ; A2 00 | Load immediate value into X register
    WDM #$95             ; 42 95 | Reserved instruction
    PHP                  ; 08 | Push processor status to stack
    ASL $9E00            ; 0E 00 9E | Arithmetic shift left (absolute)
    DEC $DE04,X          ; DE 04 DE | Decrement (absolute,X)
    EOR $8D08,X          ; 5D 08 8D | Exclusive OR with accumulator (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    BIT $02              ; 24 02 | Test bits in accumulator (zero page)
    STA $00              ; 85 00 | Store accumulator to zero page
    REP #$00             ; C2 00 | Reset processor status bits
    BNE $00              ; D0 00 | Branch if not equal
    STZ $AD00            ; 9C 00 AD | Store zero to absolute
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    ADC ($08),Y          ; 71 08 | Add with carry ((zero page),Y)
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    DEC $CE80,X          ; DE 80 CE | Decrement (absolute,X)
    STX $FD00            ; 8E 00 FD | Store X register to absolute address
    SBC $FB00,Y          ; F9 00 FB | Subtract with carry (absolute,Y)
    LDA                  ; BF 00 BD 02 | Load from absolute long,X into accumulator
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    WDM #$00             ; 42 00 | Reserved instruction
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    LDX #$00             ; A2 00 | Load immediate value into X register
    BCS $00              ; B0 00 | Branch if carry set
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA $0400            ; 0D 00 04 | Logical OR with accumulator (absolute)
    ORA ($5D,X)          ; 01 5D | Logical OR with accumulator ((zero page,X))
    WDM #$20             ; 42 20 | Reserved instruction
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0D0
; Address: $E2AD8F
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0D0:
    JSR $FF9F            ; 20 9F FF | Jump to subroutine
    ORA $31FF            ; 0D FF 31 | Logical OR with accumulator (absolute)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BCC $00              ; 90 00 | Branch if carry clear
    CLD                  ; D8 | Clear decimal mode flag
    BMI $60              ; 30 60 | Branch if negative
    BPL $40              ; 10 40 | Branch if positive
    BPL $70              ; 10 70 | Branch if positive
    ORA #$C8             ; 09 C8 | Logical OR with accumulator (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BNE $FF              ; D0 FF | Branch if not equal
    INY                  ; C8 | Increment Y register
    INX                  ; E8 | Increment X register
    SBC $F7FF            ; ED FF F7 | Subtract with carry (absolute)
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    EOR ($03,X)          ; 41 03 | Exclusive OR with accumulator ((zero page,X))
    ORA ($67,X)          ; 01 67 | Logical OR with accumulator ((zero page,X))
    CPY #$23             ; C0 23 | Compare Y register (immediate)
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    SED                  ; F8 | Set decimal mode flag
    LDA $DCE7D8          ; AF D8 E7 DC | Load from absolute long address into accumulator
    STA $DFFF06          ; 8F 06 FF DF | Store accumulator to absolute long address
    SED                  ; F8 | Set decimal mode flag
    SBC $FEFF,X          ; FD FF FE | Subtract with carry (absolute,X)
    BEQ $7F              ; F0 7F | Branch if equal
    STY $7F              ; 84 7F | Store Y register to zero page
    STX $9F77            ; 8E 77 9F | Store X register to absolute address
    SEI                  ; 78 | Set interrupt disable flag
    ROR $7FFE,X          ; 7E FE 7F | Rotate right (absolute,X)
    LDX $117F,Y          ; BE 7F 11 | Load from absolute,Y into X register
    AND $3D7F,X          ; 3D 7F 3D | Logical AND with accumulator (absolute,X)
    CMP $DFFF,X          ; DD FF DF | Compare accumulator (absolute,X)
    STA $9DF3,X          ; 9D F3 9D | Store accumulator to absolute,X
    INC $FE9D,X          ; FE 9D FE | Increment (absolute,X)
    STA $1DEF,X          ; 9D EF 1D | Store accumulator to absolute,X
    XBA                  ; EB | Exchange accumulator bytes
    ORA $1DEB,X          ; 1D EB 1D | Logical OR with accumulator (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0D1
; Address: $E2AE1F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0D1:
    STA $E401,X          ; 9D 01 E4 | Store accumulator to absolute,X
    EOR ($F7,X)          ; 41 F7 | Exclusive OR with accumulator ((zero page,X))
    INC $FC0B,X          ; FE 0B FC | Increment (absolute,X)
    SBC $FD03,X          ; FD 03 FD | Subtract with carry (absolute,X)
    SBC $FD03,X          ; FD 03 FD | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0D2
; Address: $E2AE40
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0D2:
    PHA                  ; 48 | Push accumulator to stack
    BRA $D8              ; 80 D8 | Branch always
    BRA $BC              ; 80 BC | Branch always
    CPY #$AB             ; C0 AB | Compare Y register (immediate)
    INC $FFFE,X          ; FE FE FF | Increment (absolute,X)
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    SBC $37FF,Y          ; F9 FF 37 | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0D3
; Address: $E2AE56
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0D3:
    JSL $FF09FF          ; 22 FF 09 FF | Jump to subroutine long
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BCS $FF              ; B0 FF | Branch if carry set
    STA $03              ; 85 03 | Store accumulator to zero page
    STA $06              ; 85 06 | Store accumulator to zero page
    EOR $87              ; 45 87 | Exclusive OR with accumulator (zero page)
    CMP ($85,X)          ; C1 85 | Compare accumulator ((zero page,X))
    REP #$87             ; C2 87 | Reset processor status bits
    CPY $40FF            ; CC FF 40 | Compare Y register (absolute)
    DEX                  ; CA | Decrement X register
    PHA                  ; 48 | Push accumulator to stack
    INX                  ; E8 | Increment X register
    LDA                  ; BF 69 BE 69 | Load from absolute long,X into accumulator
    LDX $9DFB,Y          ; BE FB 9D | Load from absolute,Y into X register
    LDA                  ; BF 7F BF 7F | Load from absolute long,X into accumulator
    STA $FF177F          ; 8F 7F 17 FF | Store accumulator to absolute long address
    STY $84              ; 84 84 | Store Y register to zero page
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    STA ($01,X)          ; 81 01 | Store accumulator to (zero page,X)
    ORA ($C1,X)          ; 01 C1 | Logical OR with accumulator ((zero page,X))
    EOR ($C1,X)          ; 41 C1 | Exclusive OR with accumulator ((zero page,X))
    BRA $40              ; 80 40 | Branch always
    WDM #$39             ; 42 39 | Reserved instruction
    RTI                  ; 40 | Return from interrupt
    LDA $DCA0,X          ; BD A0 DC | Load from absolute,X into accumulator
    CLV                  ; B8 | Clear overflow flag
    DEC $B8              ; C6 B8 | Decrement (zero page)
    DEC $18              ; C6 18 | Decrement (zero page)
    INC $18              ; E6 18 | Increment (zero page)
    INC $8C              ; E6 8C | Increment (zero page)
    ORA $0500            ; 0D 00 05 | Logical OR with accumulator (absolute)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BRA $F2              ; 80 F2 | Branch always
    PLX                  ; FA | Pull X register from stack
    SBC $F900,Y          ; F9 00 F9 | Subtract with carry (absolute,Y)
    SBC $FD00,X          ; FD 00 FD | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0D4
; Address: $E2AEE0
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0D4:
    JSR $20FF            ; 20 FF 20 | Jump to subroutine
    BIT $FE              ; 24 FE | Test bits in accumulator (zero page)
    ROR $FF36,X          ; 7E 36 FF | Rotate right (absolute,X)
    SBC $FD13            ; ED 13 FD | Subtract with carry (absolute)
    ORA $0100            ; 0D 00 01 | Logical OR with accumulator (absolute)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0D5
; Address: $E2AF04
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0D5:
    ASL $0EF7            ; 0E F7 0E | Arithmetic shift left (absolute)
    LDA $03              ; A5 03 | Load from zero page into accumulator
    LDA $00              ; A5 00 | Load from zero page into accumulator
    PHP                  ; 08 | Push processor status to stack
    CPX $00              ; E4 00 | Compare X register (zero page)
    PHY                  ; 5A | Push Y register to stack
    PHY                  ; 5A | Push Y register to stack
    PEA #$F8F0           ; F4 F0 F8 | Push effective address to stack
    CLV                  ; B8 | Clear overflow flag
    STZ $9CFC            ; 9C FC 9C | Store zero to absolute
    LDY $B6DE,X          ; BC DE B6 | Load from absolute,X into Y register
    ROR $FAD2,X          ; 7E D2 FA | Rotate right (absolute,X)
    ADC #$01             ; 69 01 | Add with carry (immediate)
    AND $0D01            ; 2D 01 0D | Logical AND with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ROR $6F00,X          ; 7E 00 6F | Rotate right (absolute,X)
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    BEQ $00              ; F0 00 | Branch if equal
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    BCC $00              ; 90 00 | Branch if carry clear
    BCC $02              ; 90 02 | Branch if carry clear
    BPL $FE              ; 10 FE | Branch if positive
    CLI                  ; 58 | Clear interrupt disable flag
    ORA $00FF            ; 0D FF 00 | Logical OR with accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0D6
; Address: $E2AF64
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0D6:
    JSR $1800            ; 20 00 18 | Jump to subroutine
    ORA $08              ; 05 08 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    BRA $01              ; 80 01 | Branch always
    ORA ($67,X)          ; 01 67 | Logical OR with accumulator ((zero page,X))
    AND $FF              ; 25 FF | Logical AND with accumulator (zero page)
    LDA                  ; BF FF FF FF | Load from absolute long,X into accumulator
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))
    BRA $3E              ; 80 3E | Branch always
    STA ($0E),Y          ; 91 0E | Store accumulator to (zero page),Y
    STZ $ED0F,X          ; 9E 0F ED | Store zero to absolute,X
    ASL $669B,X          ; 1E 9B 66 | Arithmetic shift left (absolute,X)
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    BEQ $FF              ; F0 FF | Branch if equal
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    STA $F0FF,Y          ; 99 FF F0 | Store accumulator to absolute,Y
    BNE $29              ; D0 29 | Branch if not equal
    INY                  ; C8 | Increment Y register
    BMI $38              ; 30 38 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0D8
; Address: $E2AFAD
; Size: 115 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0D8:
    JSR $68B0            ; 20 B0 68 | Jump to subroutine
    INC $FFC9,X          ; FE C9 FF | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    BCC $FF              ; 90 FF | Branch if carry clear
    BRA $C1              ; 80 C1 | Branch always
    BRA $C1              ; 80 C1 | Branch always
    CMP ($40,X)          ; C1 40 | Compare accumulator ((zero page,X))
    BRA $C0              ; 80 C0 | Branch always
    BRA $40              ; 80 40 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    INC $FE27,X          ; FE 27 FE | Increment (absolute,X)
    INC $FF65,X          ; FE 65 FF | Increment (absolute,X)
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    LDA                  ; BF 3C 9F 65 | Load from absolute long,X into accumulator
    ROL $7FBF,X          ; 3E BF 7F | Rotate left (absolute,X)
    STA $7F877F          ; 8F 7F 87 7F | Store accumulator to absolute long address
    STA $7F807F          ; 8F 7F 80 7F | Store accumulator to absolute long address
    INY                  ; C8 | Increment Y register
    CPX #$7F             ; E0 7F | Compare X register (immediate)
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    ADC $FDFF            ; 6D FF FD | Add with carry (absolute)
    LDA $1DFF,X          ; BD FF 1D | Load from absolute,X into accumulator
    STA $8DBF,X          ; 9D BF 8D | Store accumulator to absolute,X
    LDA                  ; BF 0D BD 8D | Load from absolute long,X into accumulator
    ORA $9D67,X          ; 1D 67 9D | Logical OR with accumulator (absolute,X)
    STA $8D76            ; 8D 76 8D | Store accumulator to absolute address
    STA $CDFE            ; 8D FE CD | Store accumulator to absolute address
    ROR $7ECD,X          ; 7E CD 7E | Rotate right (absolute,X)
    CMP ($F7,X)          ; C1 F7 | Compare accumulator ((zero page,X))
    BRA $F3              ; 80 F3 | Branch always
    BRA $F3              ; 80 F3 | Branch always
    SBC $FD03,X          ; FD 03 FD | Subtract with carry (absolute,X)
    SBC $FD03,X          ; FD 03 FD | Subtract with carry (absolute,X)
    SBC $FDFF,X          ; FD FF FD | Subtract with carry (absolute,X)
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    BEQ $FF              ; F0 FF | Branch if equal
    INC $FFFD,X          ; FE FD FF | Increment (absolute,X)
    INC $FF6E,X          ; FE 6E FF | Increment (absolute,X)
    SBC $FBE7            ; ED E7 FB | Subtract with carry (absolute)
    STA ($7F),Y          ; 91 7F | Store accumulator to (zero page),Y
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0DA
; Address: $E2B092
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0DA:
    LDA                  ; BF FF FF FF | Load from absolute long,X into accumulator
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    LDY #$40             ; A0 40 | Load immediate value into Y register
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $20              ; 80 20 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    DEC $DAE1,X          ; DE E1 DA | Decrement (absolute,X)
    SBC $A8              ; E5 A8 | Subtract with carry (zero page)
    PEA #$76FB           ; F4 FB 76 | Push effective address to stack
    SBC $F936,Y          ; F9 36 F9 | Subtract with carry (absolute,Y)
    SBC $00FE,Y          ; F9 FE 00 | Subtract with carry (absolute,Y)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$E0             ; C0 E0 | Game work RAM access
    BEQ $70              ; F0 70 | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    CLV                  ; B8 | Clear overflow flag
    BRA $03              ; 80 03 | Branch always
    ROR $7C07,X          ; 7E 07 7C | Rotate right (absolute,X)
    ASL $3F              ; 06 3F | Arithmetic shift left (zero page)
    AND $320D,Y          ; 39 0D 32 | Logical AND with accumulator (absolute,Y)
    ORA $133E,X          ; 1D 3E 13 | Logical OR with accumulator (absolute,X)
    BIT $0080            ; 2C 80 00 | Test bits in accumulator (absolute)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    DEC $00              ; C6 00 | Decrement (zero page)
    XBA                  ; EB | Exchange accumulator bytes
    STA $87FF            ; 8D FF 87 | Store accumulator to absolute address
    STA ($E7,X)          ; 81 E7 | Store accumulator to (zero page,X)
    BIT #$FB             ; 89 FB | Test bits in accumulator (immediate)
    DEY                  ; 88 | Decrement Y register
    STY $DF              ; 84 DF | Store Y register to zero page
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0DB
; Address: $E2B11E
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0DB:
    JSR $FA00            ; 20 00 FA | Jump to subroutine
    DEC $F36A,X          ; DE 6A F3 | Decrement (absolute,X)
    ORA $4BBD            ; 0D BD 4B | Logical OR with accumulator (absolute)
    STZ $9CF7,X          ; 9E F7 9C | Store zero to absolute,X
    AND $B501            ; 2D 01 B5 | Logical AND with accumulator (absolute)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    INC $7F00,X          ; FE 00 7F | Increment (absolute,X)
    ROR $7C01,X          ; 7E 01 7C | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0DC
; Address: $E2B140
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0DC:
    ADC $F0              ; 65 F0 | Add with carry (zero page)
    BCS $72              ; B0 72 | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0DD
; Address: $E2B145
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0DD:
    BEQ $68              ; F0 68 | Branch if equal
    BEQ $60              ; F0 60 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    LDX $F6F8,Y          ; BE F8 F6 | Load from absolute,Y into X register
    SED                  ; F8 | Set decimal mode flag
    ADC $2FFE,X          ; 7D FE 2F | Add with carry (absolute,X)
    LDA $0FFF            ; AD FF 0F | Load from absolute address into accumulator
    LDA $7F877F          ; AF 7F 87 7F | Load from absolute long address into accumulator
    CMP $017F,Y          ; D9 7F 01 | Compare accumulator (absolute,Y)
    BRA $05              ; 80 05 | Branch always
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    WDM #$80             ; 42 80 | Reserved instruction
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    LDA $8E43,X          ; BD 43 8E | Load from absolute,X into accumulator
    ORA ($9B,X)          ; 01 9B | Logical OR with accumulator ((zero page,X))
    ASL $6D              ; 06 6D | Arithmetic shift left (zero page)
    ASL $1C2F,X          ; 1E 2F 1C | Arithmetic shift left (absolute,X)
    PLY                  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0DE
; Address: $E2B18F
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0DE:
    JSR $FF10            ; 20 10 FF | Jump to subroutine
    LDY $FEFF,X          ; BC FF FE | Load from absolute,X into Y register
    SBC $E5FF,Y          ; F9 FF E5 | Subtract with carry (absolute,Y)
    PLP                  ; 28 | Pull processor status from stack
    BEQ $C8              ; F0 C8 | Branch if equal
    BEQ $E0              ; F0 E0 | Game work RAM access
    BEQ $B0              ; F0 B0 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0E0
; Address: $E2B1AC
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0E0:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    TYA                  ; 98 | Transfer Y register to accumulator
    CLV                  ; B8 | Clear overflow flag
    BNE $FF              ; D0 FF | Branch if not equal
    BEQ $FF              ; F0 FF | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0E1
; Address: $E2B1CD
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0E1:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($C0,X)          ; 01 C0 | Logical OR with accumulator ((zero page,X))
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    INC $FE43,X          ; FE 43 FE | Increment (absolute,X)
    SEC                  ; 38 | Set carry flag
    EOR ($3E),Y          ; 51 3E | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0E2
; Address: $E2B1E6
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0E2:
    PHA                  ; 48 | Push accumulator to stack
    DEC                  ; 3A | Decrement accumulator
    ORA $8002,X          ; 1D 02 80 | Logical OR with accumulator (absolute,X)
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    BRA $FF              ; 80 FF | Branch always
    CLD                  ; D8 | Clear decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    BIT #$1D             ; 89 1D | Test bits in accumulator (immediate)
    ORA $9C              ; 05 9C | Logical OR with accumulator (zero page)
    ORA $8D88            ; 0D 88 8D | Logical OR with accumulator (absolute)
    STY $8C05            ; 8C 05 8C | Store Y register to absolute address
    ORA #$84             ; 09 84 | Logical OR with accumulator (immediate)
    STA $8500            ; 8D 00 85 | Store accumulator to absolute address
    PHP                  ; 08 | Push processor status to stack
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    ORA $0DFF,Y          ; 19 FF 0D | Logical OR with accumulator (absolute,Y)
    STA $FF              ; 85 FF | Store accumulator to zero page
    SBC ($03,X)          ; E1 03 | Subtract with carry ((zero page,X))
    CPX #$03             ; E0 03 | Compare X register (immediate)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CLC                  ; 18 | Clear carry flag
    AND $3301,Y          ; 39 01 33 | Logical AND with accumulator (absolute,Y)
    BEQ $5F              ; F0 5F | Branch if equal
    BEQ $7F              ; F0 7F | Branch if equal
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    STY $C7              ; 84 C7 | Store Y register to zero page
    ASL $F7              ; 06 F7 | Arithmetic shift left (zero page)
    BRA $DE              ; 80 DE | Branch always
    SBC ($07,X)          ; E1 07 | Subtract with carry ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BEQ $FF              ; F0 FF | Branch if equal
    ROL $0CFF,X          ; 3E FF 0C | Rotate left (absolute,X)
    STA ($87,X)          ; 81 87 | Store accumulator to (zero page,X)
    BPL $07              ; 10 07 | Branch if positive
    BCC $04              ; 90 04 | Branch if carry clear
    LDA                  ; BF 63 BF 60 | Load from absolute long,X into accumulator
    LDA                  ; BF 60 FF 40 | Load from absolute long,X into accumulator
    LDA $6E7F,Y          ; B9 7F 6E | Load from absolute,Y into accumulator
    SBC $E5DA,Y          ; F9 DA E5 | Subtract with carry (absolute,Y)
    AND ($FF),Y          ; 31 FF | Logical AND with accumulator ((zero page),Y)
    BPL $FF              ; 10 FF | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    DEY                  ; 88 | Decrement Y register
    BPL $40              ; 10 40 | Branch if positive
    LDY #$48             ; A0 48 | Load immediate value into Y register
    STZ $80              ; 64 80 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0E3
; Address: $E2B2AE
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0E3:
    INY                  ; C8 | Increment Y register
    ROL $F7              ; 26 F7 | Rotate left (zero page)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SBC $FEB9,X          ; FD B9 FE | Subtract with carry (absolute,X)
    LDA $B5FE,Y          ; B9 FE B5 | Load from absolute,Y into accumulator
    INC $FFEE,X          ; FE EE FF | Increment (absolute,X)
    INY                  ; C8 | Increment Y register
    CLD                  ; D8 | Clear decimal mode flag
    PHA                  ; 48 | Push accumulator to stack
    JMP ($3624)          ; 6C 24 36 | Jump to address (absolute indirect)
    LDY #$B1             ; A0 B1 | Load immediate value into Y register
    BEQ $F8              ; F0 F8 | Branch if equal
    BVC $78              ; 50 78 | Branch if overflow clear
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    BRA $09              ; 80 09 | Branch always
    CPY #$0E             ; C0 0E | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $03              ; 80 03 | Branch always
    BRA $03              ; 80 03 | Branch always
    CPY #$13             ; C0 13 | Compare Y register (immediate)
    ASL $2400            ; 0E 00 24 | Arithmetic shift left (absolute)
    ORA ($13,X)          ; 01 13 | Logical OR with accumulator ((zero page,X))
    BPL $DC              ; 10 DC | Branch if positive
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    CPX $EF00            ; EC 00 EF | Compare X register (absolute)
    PEA #$52FF           ; F4 FF 52 | Push effective address to stack
    ADC $2B6D            ; 6D 6D 2B | Add with carry (absolute)
    XBA                  ; EB | Exchange accumulator bytes
    AND ($12),Y          ; 31 12 | Logical AND with accumulator ((zero page),Y)
    BMI $10              ; 30 10 | Branch if negative
    BPL $18              ; 10 18 | Branch if positive
    ORA #$92             ; 09 92 | Logical OR with accumulator (immediate)
    JMP $0717            ; 4C 17 07 | Jump to address
    NOP                  ; EA | No operation
    SBC $F701            ; ED 01 F7 | Subtract with carry (absolute)
    INC $AFF7,X          ; FE F7 AF | Increment (absolute,X)
    SBC $FDC3,X          ; FD C3 FD | Subtract with carry (absolute,X)
    CPX $6FD3            ; EC D3 6F | Compare X register (absolute)
    ASL $5F01,X          ; 1E 01 5F | Arithmetic shift left (absolute,X)
    INC $EE81            ; EE 81 EE | Increment (absolute)
    STA ($3F,X)          ; 81 3F | Store accumulator to (zero page,X)
    ROR $71FF,X          ; 7E FF 71 | Rotate right (absolute,X)
    INC $B15E,X          ; FE 5E B1 | Increment (absolute,X)
    LDA $C099D0          ; AF D0 99 C0 | Load from absolute long address into accumulator
    AND ($80,X)          ; 21 80 | Logical AND with accumulator ((zero page,X))
    BRA $C0              ; 80 C0 | Branch always

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0E4
; Address: $E2B34E
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0E4:
    RTI                  ; 40 | Return from interrupt
    CPX #$F4             ; E0 F4 | Compare X register (immediate)
    LDA ($7F,X)          ; A1 7F | Load from (zero page,X) into accumulator
    DEC $EF7F            ; CE 7F EF | Decrement (absolute)
    SBC ($1F,X)          ; E1 1F | Subtract with carry ((zero page,X))
    STZ $FE63            ; 9C 63 FE | Store zero to absolute
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    SBC $9C00,Y          ; F9 00 9C | Subtract with carry (absolute,Y)
    INC $FCFF,X          ; FE FF FC | Increment (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    BCC $60              ; 90 60 | Branch if carry clear
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0E5
; Address: $E2B38C
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0E5:
    JSR $3600            ; 20 00 36 | Jump to subroutine
    STA                  ; 9F FF F9 FF | Store accumulator to absolute long,X
    BEQ $FF              ; F0 FF | Branch if equal
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    INC $FF03,X          ; FE 03 FF | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    EOR ($FF,X)          ; 41 FF | Exclusive OR with accumulator ((zero page,X))
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    EOR ($FF,X)          ; 41 FF | Exclusive OR with accumulator ((zero page,X))
    ADC $7FFF,X          ; 7D FF 7F | Add with carry (absolute,X)
    BIT #$0C             ; 89 0C | Test bits in accumulator (immediate)
    DEY                  ; 88 | Decrement Y register
    BRA $0F              ; 80 0F | Branch always
    BIT #$06             ; 89 06 | Test bits in accumulator (immediate)
    ORA $0D00            ; 0D 00 0D | Logical OR with accumulator (absolute)
    ORA $0D00            ; 0D 00 0D | Logical OR with accumulator (absolute)
    SBC $FD82,X          ; FD 82 FD | Subtract with carry (absolute,X)
    PHB                  ; 8B | Push data bank register to stack
    SBC $FF8F,X          ; FD 8F FF | Subtract with carry (absolute,X)
    STA $0DFF            ; 8D FF 0D | Store accumulator to absolute address
    ORA $03FF            ; 0D FF 03 | Logical OR with accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    ORA ($F8,X)          ; 01 F8 | Logical OR with accumulator ((zero page,X))
    ORA $0FDB            ; 0D DB 0F | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0E6
; Address: $E2B437
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0E6:
    STA $000F04          ; 8F 04 0F 00 | Store accumulator to absolute long address
    INC $DBF1            ; EE F1 DB | Increment (absolute)
    CPX $E5              ; E4 E5 | Compare X register (zero page)
    INC $FF7F,X          ; FE 7F FF | Increment (absolute,X)
    SEC                  ; 38 | Set carry flag
    PHB                  ; 8B | Push data bank register to stack
    JMP $00FF            ; 4C FF 00 | Jump to address
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    BMI $FF              ; 30 FF | Branch if negative
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    BCC $87              ; 90 87 | Branch if carry clear
    BRA $80              ; 80 80 | Branch always
    BPL $86              ; 10 86 | Branch if positive
    ORA ($44),Y          ; 11 44 | Logical OR with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    EOR ($EF,X)          ; 41 EF | Exclusive OR with accumulator ((zero page,X))
    DEC $EF              ; C6 EF | Decrement (zero page)
    LDA                  ; BF 40 FF 00 | Load from absolute long,X into accumulator
    BPL $9F              ; 10 9F | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0E7
; Address: $E2B48F
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0E7:
    BEQ $3E              ; F0 3E | Branch if equal
    STA                  ; 9F FF FF FF | Store accumulator to absolute long,X
    STA                  ; 9F FF 0F FF | Store accumulator to absolute long,X
    INC $FF62,X          ; FE 62 FF | Increment (absolute,X)
    WDM #$FF             ; 42 FF | Reserved instruction

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0E8
; Address: $E2B4A6
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0E8:
    JSR $6DFF            ; 20 FF 6D | Jump to subroutine
    INC $7FCE,X          ; FE CE 7F | Increment (absolute,X)
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    INC $7FFE,X          ; FE FE 7F | Increment (absolute,X)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDX $5E44,Y          ; BE 44 5E | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0EA
; Address: $E2B4CE
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0EA:
    JSR $01B5            ; 20 B5 01 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    STA ($20,X)          ; 81 20 | Store accumulator to (zero page,X)
    CMP #$A0             ; C9 A0 | Compare accumulator (immediate)
    CPY $CEA0            ; CC A0 CE | Compare Y register (absolute)
    BRA $8E              ; 80 8E | Branch always
    PHB                  ; 8B | Push data bank register to stack
    DEX                  ; CA | Decrement X register
    BRA $00              ; 80 00 | Branch always
    CLC                  ; 18 | Clear carry flag
    INC                  ; 1A | Increment accumulator
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SBC $03              ; E5 03 | Subtract with carry (zero page)
    INC $F800,X          ; FE 00 F8 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0EB
; Address: $E2B4FC
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0EB:
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    RTI                  ; 40 | Return from interrupt
    ADC $D920,Y          ; 79 20 D9 | Add with carry (absolute,Y)
    SEC                  ; 38 | Set carry flag
    SBC #$5A             ; E9 5A | Subtract with carry (immediate)
    SBC $58              ; E5 58 | Subtract with carry (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0EC
; Address: $E2B50E
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0EC:
    SEC                  ; 38 | Set carry flag
    LDY $B604            ; AC 04 B6 | Load from absolute address into Y register
    INC                  ; 1A | Increment accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    CPX #$3D             ; E0 3D | Compare X register (immediate)
    SEP #$B2             ; E2 B2 | Set processor status bits
    SBC $F4DB            ; ED DB F4 | Subtract with carry (absolute)
    TSX                  ; BA | Transfer stack pointer to X register
    ROR $6FFB,X          ; 7E FB 6F | Rotate right (absolute,X)
    DEC $001F,X          ; DE 1F 00 | Decrement (absolute,X)
    EOR $4500            ; 4D 00 45 | Exclusive OR with accumulator (absolute)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    BVC $E0              ; 50 E0 | Game work RAM access
    BVS $D4              ; 70 D4 | Branch if overflow set
    STZ $BC              ; 64 BC | Store zero to zero page
    PHX                  ; DA | Push X register to stack
    STX $C2FE            ; 8E FE C2 | Store X register to absolute address
    PLX                  ; FA | Pull X register from stack
    INC $FF              ; E6 FF | Increment (zero page)
    SBC $7D01,X          ; FD 01 7D | Subtract with carry (absolute,X)
    ORA ($3D,X)          ; 01 3D | Logical OR with accumulator ((zero page,X))
    ORA ($1D,X)          ; 01 1D | Logical OR with accumulator ((zero page,X))
    ORA ($E0,X)          ; 01 E0 | Game work RAM access
    BMI $00              ; 30 00 | Branch if negative
    ASL $1C00,X          ; 1E 00 1C | Arithmetic shift left (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    INC $8FFF,X          ; FE FF 8F | Increment (absolute,X)
    BEQ $FF              ; F0 FF | Branch if equal
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BEQ $FF              ; F0 FF | Branch if equal
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0ED
; Address: $E2B5DE
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0ED:
    BRA $FF              ; 80 FF | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    AND $1FFF,X          ; 3D FF 1F | Logical AND with accumulator (absolute,X)
    ORA $0400            ; 0D 00 04 | Logical OR with accumulator (absolute)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA $0C00            ; 0D 00 0C | Logical OR with accumulator (absolute)
    ORA $0DFF            ; 0D FF 0D | Logical OR with accumulator (absolute)
    ORA $0DFF            ; 0D FF 0D | Logical OR with accumulator (absolute)
    ORA $0DFF            ; 0D FF 0D | Logical OR with accumulator (absolute)
    SBC $F803,X          ; FD 03 F8 | Subtract with carry (absolute,X)
    ORA ($F2,X)          ; 01 F2 | Logical OR with accumulator ((zero page,X))
    BEQ $02              ; F0 02 | Branch if equal
    SBC $F803,Y          ; F9 03 F8 | Subtract with carry (absolute,Y)
    ORA ($F8,X)          ; 01 F8 | Logical OR with accumulator ((zero page,X))
    ORA $0F              ; 05 0F | Logical OR with accumulator (zero page)
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    STA                  ; 9F 60 4F F0 | Store accumulator to absolute long,X
    INY                  ; C8 | Increment Y register
    LDA                  ; BF 40 2C D0 | Load from absolute long,X into accumulator
    STA $FF07FF          ; 8F FF 07 FF | Store accumulator to absolute long address
    BPL $85              ; 10 85 | Branch if positive
    STA ($36,X)          ; 81 36 | Store accumulator to (zero page,X)
    BMI $07              ; 30 07 | Branch if negative
    BMI $07              ; 30 07 | Branch if negative
    BMI $07              ; 30 07 | Branch if negative
    BMI $07              ; 30 07 | Branch if negative
    BMI $C7              ; 30 C7 | Branch if negative
    CMP $EF              ; C5 EF | Compare accumulator (zero page)
    CMP ($CF,X)          ; C1 CF | Compare accumulator ((zero page,X))
    STA $CF8FCF          ; 8F CF 8F CF | Store accumulator to absolute long address

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0EE
; Address: $E2B681
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0EE:
    JSR $08F7            ; 20 F7 08 | Jump to subroutine
    LDA                  ; BF 40 FF 00 | Load from absolute long,X into accumulator
    LDA                  ; BF FF FF FF | Load from absolute long,X into accumulator
    EOR ($BE,X)          ; 41 BE | Exclusive OR with accumulator ((zero page,X))
    ORA $0492,X          ; 1D 92 04 | Logical OR with accumulator (absolute,X)
    ADC ($71),Y          ; 71 71 | Add with carry ((zero page),Y)
    STA $FF30FF          ; 8F FF 30 FF | Store accumulator to absolute long address
    TXA                  ; 8A | Transfer X register to accumulator
    STA                  ; 9F 00 C3 8E | Store accumulator to absolute long,X
    STX $6202            ; 8E 02 62 | Store X register to absolute address
    SED                  ; F8 | Set decimal mode flag
    STX $0000            ; 8E 00 00 | Store X register to absolute address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0EF
; Address: $E2B6C0
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0EF:
    JSR $02A7            ; 20 A7 02 | Jump to subroutine
    ORA ($63,X)          ; 01 63 | Logical OR with accumulator ((zero page,X))
    ORA ($63,X)          ; 01 63 | Logical OR with accumulator ((zero page,X))
    BVS $F1              ; 70 F1 | Branch if overflow set
    STA $9AE0            ; 8D E0 9A | Store accumulator to absolute address
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0F0
; Address: $E2B6D1
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0F0:
    BRA $5C              ; 80 5C | Branch always
    JMP $009C00          ; 5C 00 9C 00 | Jump to address long
    STZ $0E00            ; 9C 00 0E | Store zero to absolute
    ADC $00              ; 65 00 | Add with carry (zero page)
    SEP #$00             ; E2 00 | Set processor status bits
    RTI                  ; 40 | Return from interrupt
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    JMP $107600          ; 5C 00 76 10 | Jump to address long
    ADC $1D00,X          ; 7D 00 1D | Add with carry (absolute,X)
    STZ $8E00            ; 9C 00 8E | Store zero to absolute
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    CMP $3D00            ; CD 00 3D | Compare accumulator (absolute)
    INC                  ; 1A | Increment accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ROR $6E20,X          ; 7E 20 6E | Rotate right (absolute,X)
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    STY $00              ; 84 00 | Store Y register to zero page
    STY $00              ; 84 00 | Store Y register to zero page
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    STA ($20),Y          ; 91 20 | Store accumulator to (zero page),Y
    CMP $7E7F            ; CD 7F 7E | Compare accumulator (absolute)
    ROR $661F,X          ; 7E 1F 66 | Rotate right (absolute,X)
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0F1
; Address: $E2B732
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0F1:
    JSR $3200            ; 20 00 32 | Jump to subroutine
    STA ($10,X)          ; 81 10 | Store accumulator to (zero page,X)
    BIT #$10             ; 89 10 | Test bits in accumulator (immediate)
    ASL $10              ; 06 10 | Arithmetic shift left (zero page)
    SBC $FBC4            ; ED C4 FB | Subtract with carry (absolute)
    SBC ($D8,X)          ; E1 D8 | Subtract with carry ((zero page,X))
    CMP ($6A),Y          ; D1 6A | Compare accumulator ((zero page),Y)
    TAX                  ; AA | Transfer accumulator to X register
    INC $9F19,X          ; FE 19 9F | Increment (absolute,X)
    SBC $00FE,X          ; FD FE 00 | Subtract with carry (absolute,X)
    CPY #$3D             ; C0 3D | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDA $DA00,X          ; BD 00 DA | Load from absolute,X into accumulator
    INC $00              ; E6 00 | Increment (zero page)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0F2
; Address: $E2B763
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0F2:
    CLC                  ; 18 | Clear carry flag
    ADC ($0C),Y          ; 71 0C | Add with carry ((zero page),Y)
    LSR $89              ; 46 89 | Logical shift right (zero page)
    CLC                  ; 18 | Clear carry flag
    ROL                  ; 2A | Rotate left (accumulator)
    ORA ($10),Y          ; 11 10 | Logical OR with accumulator ((zero page),Y)
    REP #$9F             ; C2 9F | Reset processor status bits

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0F3
; Address: $E2B776
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0F3:
    BVS $7F              ; 70 7F | Branch if overflow set
    ADC #$7F             ; 69 7F | Add with carry (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    PHA                  ; 48 | Push accumulator to stack
    ROL $49              ; 26 49 | Rotate left (zero page)
    EOR #$04             ; 49 04 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0F5
; Address: $E2B796
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0F5:
    BPL $FF              ; 10 FF | Branch if positive
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    BCC $FE              ; 90 FE | Branch if carry clear
    NOP                  ; EA | No operation
    PHP                  ; 08 | Push processor status to stack
    SBC $FF00            ; ED 00 FF | Subtract with carry (absolute)
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    PHB                  ; 8B | Push data bank register to stack
    BMI $F0              ; 30 F0 | Branch if negative
    LDY #$F0             ; A0 F0 | Load immediate value into Y register
    BIT $1200            ; 2C 00 12 | Test bits in accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPX $F800            ; EC 00 F8 | Compare X register (absolute)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0F6
; Address: $E2B7D9
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0F6:
    JSR $0100            ; 20 00 01 | Jump to subroutine
    ASL $1E00            ; 0E 00 1E | Arithmetic shift left (absolute)
    ASL $0E00            ; 0E 00 0E | Arithmetic shift left (absolute)
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    BRA $3F              ; 80 3F | Branch always
    ASL $1EFF,X          ; 1E FF 1E | Arithmetic shift left (absolute,X)
    ROL $3EFF,X          ; 3E FF 3E | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0F7
; Address: $E2B7FC
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0F7:
    JSR $02FF            ; 20 FF 02 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF 0D BF 08 | Load from absolute long,X into accumulator
    INC $BC08,X          ; FE 08 BC | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    STA $7C01,X          ; 9D 01 7C | Store accumulator to absolute,X
    ORA ($7C,X)          ; 01 7C | Logical OR with accumulator ((zero page,X))
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0F8
; Address: $E2B846
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0F8:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $9FFF,X          ; 1D FF 9F | Logical OR with accumulator (absolute,X)
    SBC $8FFF,Y          ; F9 FF 8F | Subtract with carry (absolute,Y)
    BMI $06              ; 30 06 | Branch if negative
    AND ($01),Y          ; 31 01 | Logical AND with accumulator ((zero page),Y)
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    BMI $01              ; 30 01 | Branch if negative
    BVS $04              ; 70 04 | Branch if overflow set
    BVS $00              ; 70 00 | Branch if overflow set
    BVS $8F              ; 70 8F | Branch if overflow set
    STX $8FCF            ; 8E CF 8F | Store X register to absolute address
    STA ($CF,X)          ; 81 CF | Store accumulator to (zero page,X)
    STA $0F8F0F          ; 8F 0F 8F 0F | Store accumulator to absolute long address
    STA $7F00FF          ; 8F FF 00 7F | Store accumulator to absolute long address
    BRA $9F              ; 80 9F | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0F9
; Address: $E2B886
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0F9:
    STA                  ; 9F 60 7F 00 | Store accumulator to absolute long,X
    LDA $007F10          ; AF 10 7F 00 | Load from absolute long address into accumulator
    STA                  ; 9F FF 9F FF | Store accumulator to absolute long,X
    INC $E602            ; EE 02 E6 | Increment (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0FA
; Address: $E2B8A9
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0FA:
    INC $F181,X          ; FE 81 F1 | Increment (absolute,X)
    INC $19              ; E6 19 | Increment (zero page)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($E0),Y          ; 11 E0 | Game work RAM access
    STA $08E0,Y          ; 99 E0 08 | Store accumulator to absolute,Y
    BRA $01              ; 80 01 | Branch always
    ASL $1F00            ; 0E 00 1F | Arithmetic shift left (absolute)
    ROL $80C0,X          ; 3E C0 80 | Rotate left (absolute,X)
    SEP #$00             ; E2 00 | Set processor status bits
    REP #$01             ; C2 01 | Reset processor status bits
    ASL $700F            ; 0E 0F 70 | Arithmetic shift left (absolute)
    SBC $EBFF,X          ; FD FF EB | Subtract with carry (absolute,X)
    INC $1DB3,X          ; FE B3 1D | Increment (absolute,X)
    AND $3800,X          ; 3D 00 38 | Logical AND with accumulator (absolute,X)
    BEQ $00              ; F0 00 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    JMP $1000            ; 4C 00 10 | Jump to address
    AND $7930,X          ; 3D 30 79 | Logical AND with accumulator (absolute,X)
    LDY #$F9             ; A0 F9 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    BNE $F6              ; D0 F6 | Branch if not equal
    BCS $FD              ; B0 FD | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0FB
; Address: $E2B8EE
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0FB:
    STA ($FB,X)          ; 81 FB | Store accumulator to (zero page,X)
    REP #$00             ; C2 00 | Reset processor status bits
    STX $00              ; 86 00 | Store X register to zero page

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0FC
; Address: $E2B8F4
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0FC:
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA $0900            ; 0D 00 09 | Logical OR with accumulator (absolute)
    LDX $8E00            ; AE 00 8E | Load from absolute address into X register
    LSR $CD00            ; 4E 00 CD | Logical shift right (absolute)
    ORA ($E5,X)          ; 01 E5 | Logical OR with accumulator ((zero page,X))
    ORA ($61,X)          ; 01 61 | Logical OR with accumulator ((zero page,X))
    STA ($E1,X)          ; 81 E1 | Store accumulator to (zero page,X)
    SEP #$51             ; E2 51 | Set processor status bits
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    LDA ($00),Y          ; B1 00 | Load from (zero page),Y into accumulator
    INC                  ; 1A | Increment accumulator
    STZ $1E00,X          ; 9E 00 1E | Store zero to absolute,X
    ORA $7900,X          ; 1D 00 79 | Logical OR with accumulator (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $DD              ; F0 DD | Branch if equal
    LDA $3FF6,X          ; BD F6 3F | Load from absolute,X into accumulator
    CPX $76              ; E4 76 | Compare X register (zero page)
    SBC $E9F6            ; ED F6 E9 | Subtract with carry (absolute)
    ASL $5F00,X          ; 1E 00 5F | Arithmetic shift left (absolute,X)
    LDY $CFF7,X          ; BC F7 CF | Load from absolute,X into Y register
    SBC $4FF6            ; ED F6 4F | Subtract with carry (absolute)
    ADC $760F,Y          ; 79 0F 76 | Add with carry (absolute,Y)
    ORA #$3E             ; 09 3E | Logical OR with accumulator (immediate)
    DEC $0073,X          ; DE 73 00 | Decrement (absolute,X)
    SEC                  ; 38 | Set carry flag
    STX $00              ; 86 00 | Store X register to zero page
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    LDA ($00,X)          ; A1 00 | Load from (zero page,X) into accumulator
    JMP $C13FA3          ; 5C A3 3F C1 | Jump to address long
    LDA ($1D,X)          ; A1 1D | Load from (zero page,X) into accumulator
    ADC $9E              ; 65 9E | Add with carry (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    PHB                  ; 8B | Push data bank register to stack
    PEA #$6FF9           ; F4 F9 6F | Push effective address to stack
    ORA #$49             ; 09 49 | Logical OR with accumulator (immediate)
    STX $06              ; 86 06 | Store X register to zero page
    INC $0E              ; E6 0E | Increment (zero page)
    PEA #$7804           ; F4 04 78 | Push effective address to stack
    BRA $90              ; 80 90 | Branch always

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0FD
; Address: $E2B97F
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0FD:
    JSR $7FAE            ; 20 AE 7F | Jump to subroutine
    ROR $FECF,X          ; 7E CF FE | Rotate right (absolute,X)
    CMP $FC              ; C5 FC | Compare accumulator (zero page)
    INC $F707,X          ; FE 07 F7 | Increment (absolute,X)
    ASL $88FF,X          ; 1E FF 88 | Arithmetic shift left (absolute,X)
    STA                  ; 9F 9F 3F 3F | Store accumulator to absolute long,X
    BRA $1C              ; 80 1C | Branch always
    CPY #$17             ; C0 17 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    AND $AB10,X          ; 3D 10 AB | Logical AND with accumulator (absolute,X)
    STX $9608            ; 8E 08 96 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0FE
; Address: $E2B9B1
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0FE:
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BPL $F8              ; 10 F8 | Branch if positive
    INC $FCA8,X          ; FE A8 FC | Increment (absolute,X)
    STY $92FD            ; 8C FD 92 | Store Y register to absolute address
    SED                  ; F8 | Set decimal mode flag
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_0FF
; Address: $E2B9CA
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_0FF:
    JSR $0053            ; 20 53 00 | Jump to subroutine
    SEP #$10             ; E2 10 | Set processor status bits
    CPY $0704            ; CC 04 07 | Compare Y register (absolute)
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $BC              ; 10 BC | Branch if positive
    PHA                  ; 48 | Push accumulator to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_100
; Address: $E2B9E5
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_100:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    ASL $069F            ; 0E 9F 06 | Arithmetic shift left (absolute)
    BPL $1F              ; 10 1F | Branch if positive
    BPL $7E              ; 10 7E | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ASL $0C08,X          ; 1E 08 0C | Arithmetic shift left (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_101
; Address: $E2BA03
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_101:
    RTI                  ; 40 | Return from interrupt
    ORA #$C0             ; 09 C0 | Logical OR with accumulator (immediate)
    ORA #$F0             ; 09 F0 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    CPX #$08             ; E0 08 | Compare X register (immediate)
    PLX                  ; FA | Pull X register from stack
    SEP #$0C             ; E2 0C | Set processor status bits
    STA                  ; 9F 0D BF 0D | Store accumulator to absolute long,X
    ORA $190F            ; 0D 0F 19 | Logical OR with accumulator (absolute)
    ORA #$0D             ; 09 0D | Logical OR with accumulator (immediate)
    ORA $08              ; 05 08 | Logical OR with accumulator (zero page)
    ORA $7C00,X          ; 1D 00 7C | Logical OR with accumulator (absolute,X)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($83,X)          ; 01 83 | Logical OR with accumulator ((zero page,X))
    ORA ($70,X)          ; 01 70 | Logical OR with accumulator ((zero page,X))
    BVS $00              ; 70 00 | Branch if overflow set
    BVS $00              ; 70 00 | Branch if overflow set
    BVS $00              ; 70 00 | Branch if overflow set
    BVS $00              ; 70 00 | Branch if overflow set
    BVS $00              ; 70 00 | Branch if overflow set
    BVS $00              ; 70 00 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    STA $0F8F0F          ; 8F 0F 8F 0F | Store accumulator to absolute long address
    STA $018F07          ; 8F 07 8F 01 | Store accumulator to absolute long address

;------------------------------------------------------------------------------
; Bank44_DmaFunction_102
; Address: $E2BA79
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_102:
    STA $018F03          ; 8F 03 8F 01 | Store accumulator to absolute long address
    STA $BF8707          ; 8F 07 87 BF | Store accumulator to absolute long address
    RTI                  ; 40 | Return from interrupt
    BRA $9F              ; 80 9F | Branch always
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    CPX $BF00            ; EC 00 BF | Compare X register (absolute)
    LDA $677F,X          ; BD 7F 67 | Load from absolute,X into accumulator
    SBC $4C8F,Y          ; F9 8F 4C | Subtract with carry (absolute,Y)
    INC $FC80,X          ; FE 80 FC | Increment (absolute,X)
    CMP $3720            ; CD 20 37 | Compare accumulator (absolute)
    JMP $80C280          ; 5C 80 C2 80 | Jump to address long
    TYA                  ; 98 | Transfer Y register to accumulator
    BVS $00              ; 70 00 | Branch if overflow set
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $C8              ; 05 C8 | Logical OR with accumulator (zero page)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BRA $FC              ; 80 FC | Branch always
    BPL $F8              ; 10 F8 | Branch if positive
    DEC $0600            ; CE 00 06 | Decrement (absolute)
    LDA ($00,X)          ; A1 00 | Load from (zero page,X) into accumulator
    BEQ $03              ; F0 03 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    SBC $5E00,Y          ; F9 00 5E | Subtract with carry (absolute,Y)
    LDY #$0F             ; A0 0F | Load immediate value into Y register
    BEQ $07              ; F0 07 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA $1ECF            ; 0D CF 1E | Logical OR with accumulator (absolute)
    ROL $7E27,X          ; 3E 27 7E | Rotate left (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BMI $00              ; 30 00 | Branch if negative
    INX                  ; E8 | Increment X register
    CLD                  ; D8 | Clear decimal mode flag
    BCC $00              ; 90 00 | Branch if carry clear
    RTI                  ; 40 | Return from interrupt
    SEP #$80             ; E2 80 | Set processor status bits
    SEP #$80             ; E2 80 | Set processor status bits
    STY $00              ; 84 00 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank44_DmaFunction_103
; Address: $E2BB0D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_103:
    JSR $4800            ; 20 00 48 | Jump to subroutine
    ORA $1D00,X          ; 1D 00 1D | Logical OR with accumulator (absolute,X)
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank44_DmaFunction_104
; Address: $E2BB26
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_104:
    AND $3FD3            ; 2D D3 3F | Logical AND with accumulator (absolute)
    SBC $EF37,X          ; FD 37 EF | Subtract with carry (absolute,X)
    SBC $FD4B,X          ; FD 4B FD | Subtract with carry (absolute,X)
    ORA $0D02            ; 0D 02 0D | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    ORA #$02             ; 09 02 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_105
; Address: $E2BB3A
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_105:
    ORA ($07),Y          ; 11 07 | Logical OR with accumulator ((zero page),Y)
    LDA $FC7791          ; AF 91 77 FC | Load from absolute long address into accumulator
    STY $DBE4            ; 8C E4 DB | Store Y register to absolute address
    ASL $79FD,X          ; 1E FD 79 | Arithmetic shift left (absolute,X)
    LDA                  ; BF 7E FB D0 | Load from absolute long,X into accumulator
    INX                  ; E8 | Increment X register
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    EOR ($64,X)          ; 41 64 | Exclusive OR with accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack
    CLV                  ; B8 | Clear overflow flag
    INC                  ; 1A | Increment accumulator
    ROR $7B              ; 66 7B | Rotate right (zero page)
    STA $EFF4,X          ; 9D F4 EF | Store accumulator to absolute,X
    STA $CB07,Y          ; 99 07 CB | Store accumulator to absolute,Y
    PHP                  ; 08 | Push processor status to stack
    SEP #$01             ; E2 01 | Set processor status bits
    BPL $00              ; 10 00 | Branch if positive
    BEQ $00              ; F0 00 | Branch if equal
    DEX                  ; CA | Decrement X register
    ROL $BDC3,X          ; 3E C3 BD | Rotate left (absolute,X)
    REP #$D3             ; C2 D3 | Reset processor status bits
    JMP ($ECD3)          ; 6C D3 EC | Jump to address (absolute indirect)
    CPX $DB              ; E4 DB | Compare X register (zero page)
    STY $07              ; 84 07 | Store Y register to zero page
    INY                  ; C8 | Increment Y register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank44_DmaFunction_107
; Address: $E2BB96
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_107:
    STA $0E0E0F          ; 8F 0F 0E 0E | Store accumulator to absolute long address
    BMI $00              ; 30 00 | Branch if negative
    BPL $EF              ; 10 EF | Branch if positive
    ASL $79              ; 06 79 | Arithmetic shift left (zero page)
    BCC $C2              ; 90 C2 | Branch if carry clear
    AND $4285,X          ; 3D 85 42 | Hardware register operation
    AND ($86),Y          ; 31 86 | Logical AND with accumulator ((zero page),Y)
    AND ($0E),Y          ; 31 0E | Logical AND with accumulator ((zero page),Y)
    BPL $2B              ; 10 2B | Branch if positive
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_108
; Address: $E2BBB4
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_108:
    BCC $FF              ; 90 FF | Branch if carry clear
    AND $42FF,Y          ; 39 FF 42 | Hardware register operation
    STX $FF              ; 86 FF | Store X register to zero page
    ASL $2BFF            ; 0E FF 2B | Arithmetic shift left (absolute)
    CPY #$36             ; C0 36 | Compare Y register (immediate)
    ADC ($9A,X)          ; 61 9A | Add with carry ((zero page,X))
    TAY                  ; A8 | Transfer accumulator to Y register
    INY                  ; C8 | Increment Y register
    ORA $27D8            ; 0D D8 27 | Logical OR with accumulator (absolute)
    PHA                  ; 48 | Push accumulator to stack
    AND $E900,Y          ; 39 00 E9 | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_10A
; Address: $E2BBD4
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_10A:
    JSR $48FF            ; 20 FF 48 | Jump to subroutine
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    AND $00FF,Y          ; 39 FF 00 | Logical AND with accumulator (absolute,Y)
    BRA $37              ; 80 37 | Branch always
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    SBC ($B0,X)          ; E1 B0 | Subtract with carry ((zero page,X))
    ORA ($90,X)          ; 01 90 | Logical OR with accumulator ((zero page,X))
    STZ $03              ; 64 03 | Store zero to zero page
    INY                  ; C8 | Increment Y register
    LDY #$F8             ; A0 F8 | Load immediate value into Y register
    PEA #$E0FD           ; F4 FD E0 | Game work RAM access
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    STZ $FF              ; 64 FF | Store zero to zero page
    LDA $2000            ; AD 00 20 | Load from absolute address into accumulator
    PHA                  ; 48 | Push accumulator to stack
    ROR $7E00,X          ; 7E 00 7E | Rotate right (absolute,X)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    SBC $FB00            ; ED 00 FB | Subtract with carry (absolute)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank44_DmaFunction_10B
; Address: $E2BC3B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_10B:
    JSR $1200            ; 20 00 12 | Jump to subroutine
    BPL $14              ; 10 14 | Branch if positive
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank44_DmaFunction_10C
; Address: $E2BC43
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_10C:
    JSR $0300            ; 20 00 03 | Jump to subroutine
    AND $7C00,Y          ; 39 00 7C | Logical AND with accumulator (absolute,Y)
    STX $DF00            ; 8E 00 DF | Store X register to absolute address
    DEC $00              ; C6 00 | Decrement (zero page)
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_10D
; Address: $E2BC5D
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_10D:
    JSR $3000            ; 20 00 30 | Jump to subroutine
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    ORA ($87,X)          ; 01 87 | Logical OR with accumulator ((zero page,X))
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    BMI $00              ; 30 00 | Branch if negative
    BPL $00              ; 10 00 | Branch if positive
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ROL $FFFF,X          ; 3E FF FF | Rotate left (absolute,X)
    INC $FF              ; E6 FF | Increment (zero page)
    SBC $E000,Y          ; F9 00 E0 | Game work RAM access
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    BPL $7B              ; 10 7B | Branch if positive
    CPX $01BA            ; EC BA 01 | Compare X register (absolute)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_10E
; Address: $E2BCAE
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_10E:
    INC $101B,X          ; FE 1B 10 | Increment (absolute,X)
    STY $03              ; 84 03 | Store Y register to zero page
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SEC                  ; 38 | Set carry flag
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    CPX $00              ; E4 00 | Compare X register (zero page)
    PEA #$F707           ; F4 07 F7 | Push effective address to stack
    CLV                  ; B8 | Clear overflow flag
    ASL $7B70            ; 0E 70 7B | Arithmetic shift left (absolute)
    BVS $DE              ; 70 DE | Branch if overflow set
    CPX #$F4             ; E0 F4 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_10F
; Address: $E2BCCE
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_10F:
    JSR $0BFE            ; 20 FE 0B | Jump to subroutine
    BEQ $08              ; F0 08 | Branch if equal
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    BRA $F1              ; 80 F1 | Branch always
    BRA $84              ; 80 84 | Branch always
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPX $B57F            ; EC 7F B5 | Compare X register (absolute)
    LDA                  ; BF 04 1F 0C | Load from absolute long,X into accumulator
    ASL $3E08,X          ; 1E 08 3E | Arithmetic shift left (absolute,X)
    BPL $7E              ; 10 7E | Branch if positive
    BPL $3C              ; 10 3C | Branch if positive
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    LDA ($21),Y          ; B1 21 | PPU graphics register access
    AND ($21,X)          ; 21 21 | PPU graphics register access
    AND ($01,X)          ; 21 01 | Logical AND with accumulator ((zero page,X))
    EOR ($63,X)          ; 41 63 | Exclusive OR with accumulator ((zero page,X))
    ROL $4E00            ; 2E 00 4E | Rotate left (absolute)
    DEC $DE00,X          ; DE 00 DE | Decrement (absolute,X)
    STZ $9C00            ; 9C 00 9C | Store zero to absolute
    STZ $9C00            ; 9C 00 9C | Store zero to absolute
    AND $7B              ; 25 7B | Logical AND with accumulator (zero page)
    ORA ($1F),Y          ; 11 1F | Logical OR with accumulator ((zero page),Y)
    STA                  ; 9F 83 CF 01 | Store accumulator to absolute long,X
    INC $40              ; E6 40 | Increment (zero page)
    STA ($01),Y          ; 91 01 | Store accumulator to (zero page),Y
    STA $05              ; 85 05 | Store accumulator to zero page
    CPX #$01             ; E0 01 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_110
; Address: $E2BD38
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_110:
    BMI $01              ; 30 01 | Branch if negative
    ORA $1801,Y          ; 19 01 18 | Logical OR with accumulator (absolute,Y)
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank44_DmaFunction_111
; Address: $E2BD41
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_111:
    INC $BCF7,X          ; FE F7 BC | Increment (absolute,X)
    CMP $77FB,X          ; DD FB 77 | Compare accumulator (absolute,X)
    SBC #$77             ; E9 77 | Subtract with carry (immediate)
    CMP $2F5E,X          ; DD 5E 2F | Compare accumulator (absolute,X)
    AND #$7F             ; 29 7F | Logical AND with accumulator (immediate)
    LDY $84FC,X          ; BC FC 84 | Load from absolute,X into Y register
    STY $3616            ; 8C 16 36 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank44_DmaFunction_112
; Address: $E2BD5A
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_112:
    JSL $50D034          ; 22 34 D0 50 | Jump to subroutine long
    BRA $00              ; 80 00 | Branch always
    BEQ $7F              ; F0 7F | Branch if equal
    INY                  ; C8 | Increment Y register
    PEA #$BF0B           ; F4 0B BF | Push effective address to stack
    CLI                  ; 58 | Clear interrupt disable flag
    ROR $DFE5,X          ; 7E E5 DF | Rotate right (absolute,X)
    INY                  ; C8 | Increment Y register
    BRA $60              ; 80 60 | Branch always
    ROL $FF00,X          ; 3E 00 FF | Rotate left (absolute,X)
    AND $1B00,Y          ; 39 00 1B | Logical AND with accumulator (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    PHB                  ; 8B | Push data bank register to stack
    AND $7EE6,Y          ; 39 E6 7E | Logical AND with accumulator (absolute,Y)
    CMP $F778,Y          ; D9 78 F7 | Compare accumulator (absolute,Y)
    BVC $EF              ; 50 EF | Branch if overflow clear
    SEP #$B6             ; E2 B6 | Set processor status bits
    SBC $FFA7,X          ; FD A7 FF | Subtract with carry (absolute,X)
    CLC                  ; 18 | Clear carry flag
    ROL $00              ; 26 00 | Rotate left (zero page)
    ORA $0300,X          ; 1D 00 03 | Logical OR with accumulator (absolute,X)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    CMP $DB36            ; CD 36 DB | Compare accumulator (absolute)
    BIT $7F              ; 24 7F | Test bits in accumulator (zero page)
    BRA $5B              ; 80 5B | Branch always
    ADC ($FE,X)          ; 61 FE | Add with carry ((zero page,X))
    CLD                  ; D8 | Clear decimal mode flag
    CPX #$9F             ; E0 9F | Compare X register (immediate)
    ROL $26              ; 26 26 | Rotate left (zero page)
    INC $7FC0,X          ; FE C0 7F | Increment (absolute,X)
    BRA $0F              ; 80 0F | Branch always

;------------------------------------------------------------------------------
; Bank44_DmaFunction_113
; Address: $E2BDBF
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_113:
    JSR $BA57            ; 20 57 BA | Jump to subroutine
    BPL $3F              ; 10 3F | Branch if positive
    CPY $7F              ; C4 7F | Compare Y register (zero page)
    ADC ($9F),Y          ; 71 9F | Add with carry ((zero page),Y)
    STY $6B              ; 84 6B | Store Y register to zero page
    BVS $AF              ; 70 AF | Branch if overflow set
    LDA                  ; BF BF F3 F3 | Load from absolute long,X into accumulator
    INC $E6              ; E6 E6 | Increment (zero page)
    REP #$C2             ; C2 C2 | Reset processor status bits
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank44_DmaFunction_114
; Address: $E2BDE9
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_114:
    LDA                  ; BF F0 8F 70 | Load from absolute long,X into accumulator
    CLC                  ; 18 | Clear carry flag
    STZ $4EFF            ; 9C FF 4E | Store zero to absolute
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    BRA $2D              ; 80 2D | Branch always
    SBC #$0D             ; E9 0D | Subtract with carry (immediate)
    PHP                  ; 08 | Push processor status to stack
    DEC $D0              ; C6 D0 | Decrement (zero page)
    BIT $649A            ; 2C 9A 64 | Test bits in accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    STA ($97,X)          ; 81 97 | Store accumulator to (zero page,X)
    STA                  ; 9F 86 BF 2C | Store accumulator to absolute long,X
    STZ $FF              ; 64 FF | Store zero to zero page
    NOP                  ; EA | No operation
    DEC $31              ; C6 31 | Decrement (zero page)
    TXA                  ; 8A | Transfer X register to accumulator
    ROR                  ; 6A | Rotate right (accumulator)
    ORA ($D6,X)          ; 01 D6 | Logical OR with accumulator ((zero page,X))
    AND $7F0A,Y          ; 39 0A 7F | Logical AND with accumulator (absolute,Y)
    ROR                  ; 6A | Rotate right (accumulator)
    STA                  ; 9F 12 3B 11 | Store accumulator to absolute long,X
    BRA $77              ; 80 77 | Branch always
    PHA                  ; 48 | Push accumulator to stack
    BCC $47              ; 90 47 | Branch if carry clear
    LDY #$2A             ; A0 2A | Load immediate value into Y register
    LDX #$59             ; A2 59 | Load immediate value into X register
    DEY                  ; 88 | Decrement Y register
    BRA $E8              ; 80 E8 | Branch always
    BCC $FF              ; 90 FF | Branch if carry clear
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    EOR $00FF,Y          ; 59 FF 00 | Exclusive OR with accumulator (absolute,Y)
    INC $F20C,X          ; FE 0C F2 | Increment (absolute,X)
    CPX $12              ; E4 12 | Compare X register (zero page)
    SBC #$9C             ; E9 9C | Subtract with carry (immediate)
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $1F04            ; 0D 04 1F | Logical OR with accumulator (absolute)
    ORA #$1F             ; 09 1F | Logical OR with accumulator (immediate)
    ROR $0D30,X          ; 7E 30 0D | Rotate right (absolute,X)
    BIT $80              ; 24 80 | Test bits in accumulator (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    BMI $48              ; 30 48 | Branch if negative

;------------------------------------------------------------------------------
; Bank44_DmaFunction_115
; Address: $E2BE91
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_115:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    STA ($05,X)          ; 81 05 | Store accumulator to (zero page,X)
    BIT $FF              ; 24 FF | Test bits in accumulator (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    CLI                  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank44_DmaFunction_116
; Address: $E2BEA2
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_116:
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    BRA $86              ; 80 86 | Branch always
    AND $FE00,Y          ; 39 00 FE | Logical AND with accumulator (absolute,Y)
    SEC                  ; 38 | Set carry flag
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    STA $0064,Y          ; 99 64 00 | Store accumulator to absolute,Y
    BRA $00              ; 80 00 | Branch always
    ADC $C600,Y          ; 79 00 C6 | Add with carry (absolute,Y)
    SEC                  ; 38 | Set carry flag
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    SBC $BC00,X          ; FD 00 BC | Subtract with carry (absolute,X)
    PHB                  ; 8B | Push data bank register to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_118
; Address: $E2BED6
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_118:
    JSR $C01F            ; 20 1F C0 | Jump to subroutine
    ORA $63FE            ; 0D FE 63 | Logical OR with accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    LDY $BC30,X          ; BC 30 BC | Load from absolute,X into Y register
    SEC                  ; 38 | Set carry flag
    ROR $7F38            ; 6E 38 7F | Rotate right (absolute)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_119
; Address: $E2BEEA
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_119:
    JSR $037F            ; 20 7F 03 | Jump to subroutine
    BRA $01              ; 80 01 | Branch always
    ROR $C023            ; 6E 23 C0 | Rotate right (absolute)
    BRA $43              ; 80 43 | Branch always
    BRA $91              ; 80 91 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $97              ; 80 97 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_11A
; Address: $E2BF01
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_11A:
    WDM #$03             ; 42 03 | Reserved instruction
    ORA ($17,X)          ; 01 17 | Logical OR with accumulator ((zero page,X))
    ORA $0C1F            ; 0D 1F 0C | Logical OR with accumulator (absolute)
    PLP                  ; 28 | Pull processor status from stack
    LDA $B800,X          ; BD 00 B8 | Load from absolute,X into accumulator
    INC $ED00,X          ; FE 00 ED | Increment (absolute,X)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX $C000            ; EC 00 C0 | Compare X register (absolute)
    BRA $E7              ; 80 E7 | Branch always
    STA ($F3,X)          ; 81 F3 | Store accumulator to (zero page,X)
    BRA $D9              ; 80 D9 | Branch always
    DEC $8D02            ; CE 02 8D | Decrement (absolute)
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ROL $00              ; 26 00 | Rotate left (zero page)
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_11B
; Address: $E2BF3F
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_11B:
    RTI                  ; 40 | Return from interrupt
    BIT $7B              ; 24 7B | Test bits in accumulator (zero page)
    BMI $0F              ; 30 0F | Branch if negative
    BPL $8F              ; 10 8F | Branch if positive
    CMP $01              ; C5 01 | Compare accumulator (zero page)
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    SBC ($20,X)          ; E1 20 | Subtract with carry ((zero page,X))
    STY $24              ; 84 24 | Store Y register to zero page
    BEQ $30              ; F0 30 | Branch if equal
    BVS $10              ; 70 10 | Branch if overflow set
    DEC                  ; 3A | Decrement accumulator
    INC $D600,X          ; FE 00 D6 | Increment (absolute,X)
    SEC                  ; 38 | Set carry flag
    ASL $A460,X          ; 1E 60 A4 | Arithmetic shift left (absolute,X)
    TAX                  ; AA | Transfer accumulator to X register
    ADC $FDF7,X          ; 7D F7 FD | Add with carry (absolute,X)
    LDA                  ; BF EA 37 62 | Load from absolute long,X into accumulator
    JMP $5544            ; 4C 44 55 | Jump to address
    ROL $3838,X          ; 3E 38 38 | Rotate left (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    PHA                  ; 48 | Push accumulator to stack
    PLP                  ; 28 | Pull processor status from stack
    INY                  ; C8 | Increment Y register
    PHP                  ; 08 | Push processor status to stack
    CPY $00              ; C4 00 | Compare Y register (zero page)
    STY $8FFB            ; 8C FB 8F | Store Y register to absolute address
    INC $BF87,X          ; FE 87 BF | Increment (absolute,X)
    REP #$5F             ; C2 5F | Reset processor status bits
    CPY #$47             ; C0 47 | Compare Y register (immediate)
    CPX #$30             ; E0 30 | Compare X register (immediate)
    INC $7EA7,X          ; FE A7 7E | Increment (absolute,X)
    CMP $0007            ; CD 07 00 | Compare accumulator (absolute)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CLV                  ; B8 | Clear overflow flag
    CLI                  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank44_DmaFunction_11C
; Address: $E2BF9D
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_11C:
    JSR $3632            ; 20 32 36 | Jump to subroutine
    LDY $E37F            ; AC 7F E3 | Load from absolute address into Y register
    ORA $39FF            ; 0D FF 39 | Logical OR with accumulator (absolute)
    BRA $87              ; 80 87 | Branch always
    SED                  ; F8 | Set decimal mode flag
    CMP $B2              ; C5 B2 | Compare accumulator (zero page)
    ROR $205B,X          ; 7E 5B 20 | Rotate right (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    ROL $8D01,X          ; 3E 01 8D | Rotate left (absolute,X)
    BRA $FF              ; 80 FF | Branch always
    ROL $D7F9,X          ; 3E F9 D7 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_11D
; Address: $E2BFC6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_11D:
    SBC $019F,Y          ; F9 9F 01 | Subtract with carry (absolute,Y)
    STA $BBF700          ; 8F 00 F7 BB | Store accumulator to absolute long address
    BEQ $00              ; F0 00 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_11E
; Address: $E2BFDA
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_11E:
    BRA $00              ; 80 00 | Branch always
    BVS $80              ; 70 80 | Branch if overflow set
    PHP                  ; 08 | Push processor status to stack
    BEQ $9C              ; F0 9C | Branch if equal
    AND $9B40,X          ; 3D 40 9B | Logical AND with accumulator (absolute,X)
    CMP ($06,X)          ; C1 06 | Compare accumulator ((zero page,X))
    ADC ($EE,X)          ; 61 EE | Add with carry ((zero page,X))
    BEQ $93              ; F0 93 | Branch if equal
    CPX $38D4            ; EC D4 38 | Compare X register (absolute)
    ORA $C2F2,X          ; 1D F2 C2 | Logical OR with accumulator (absolute,X)
    ORA ($E4,X)          ; 01 E4 | Logical OR with accumulator ((zero page,X))
    ASL $12              ; 06 12 | Arithmetic shift left (zero page)
    ASL $036E            ; 0E 6E 03 | Arithmetic shift left (absolute)
    EOR $FFE2,X          ; 5D E2 FF | Exclusive OR with accumulator (absolute,X)
    DEC $FE              ; C6 FE | Decrement (zero page)
    CMP $EF22,X          ; DD 22 EF | Compare accumulator (absolute,X)
    BMI $40              ; 30 40 | Branch if negative

;------------------------------------------------------------------------------
; Bank44_DmaFunction_11F
; Address: $E2C00B
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_11F:
    JSR $181F            ; 20 1F 18 | Jump to subroutine
    PEA #$E7FF           ; F4 FF E7 | Push effective address to stack
    BMI $30              ; 30 30 | Branch if negative
    LDA                  ; BF 20 E7 00 | Load from absolute long,X into accumulator
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    DEC $6B31            ; CE 31 6B | Decrement (absolute)
    STZ $04FB            ; 9C FB 04 | Store zero to absolute
    DEC $FF6B            ; CE 6B FF | Decrement (absolute)
    LDA $9DB9,Y          ; B9 B9 9D | Load from absolute,Y into accumulator
    STA $4444,X          ; 9D 44 44 | Store accumulator to absolute,X
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    XBA                  ; EB | Exchange accumulator bytes
    CLV                  ; B8 | Clear overflow flag
    BPL $FF              ; 10 FF | Branch if positive
    ORA ($77,X)          ; 01 77 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    LDA                  ; BF 00 DC 00 | Load from absolute long,X into accumulator
    SBC $1DEE,X          ; FD EE 1D | Subtract with carry (absolute,X)
    ORA $B8B8,X          ; 1D B8 B8 | Logical OR with accumulator (absolute,X)
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    CPY $CC4C            ; CC 4C CC | Compare Y register (absolute)
    ASL $F6              ; 06 F6 | Arithmetic shift left (zero page)
    ORA #$3F             ; 09 3F | Logical OR with accumulator (immediate)
    CPY #$D3             ; C0 D3 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_120
; Address: $E2C065
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_120:
    BIT $00FF            ; 2C FF 00 | Test bits in accumulator (absolute)
    INC $E901,X          ; FE 01 E9 | Increment (absolute,X)
    ORA $C419,Y          ; 19 19 C4 | Logical OR with accumulator (absolute,Y)
    CPY $AE              ; C4 AE | Compare Y register (zero page)
    LDX $7070            ; AE 70 70 | Load from absolute address into X register
    ASL $201E            ; 0E 1E 20 | Arithmetic shift left (absolute)
    PLP                  ; 28 | Pull processor status from stack
    BVS $68              ; 70 68 | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    BIT $90              ; 24 90 | Test bits in accumulator (zero page)
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_121
; Address: $E2C08D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_121:
    JSR $0C00            ; 20 00 0C | Jump to subroutine
    STA $78FF,X          ; 9D FF 78 | Store accumulator to absolute,X
    WDM #$FF             ; 42 FF | Reserved instruction
    BCC $FF              ; 90 FF | Branch if carry clear
    AND ($FF),Y          ; 31 FF | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_122
; Address: $E2C09C
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_122:
    JSR $0CFF            ; 20 FF 0C | Jump to subroutine
    CMP $3037,X          ; DD 37 30 | Compare accumulator (absolute,X)
    CMP $3832            ; CD 32 38 | Compare accumulator (absolute)
    SBC ($1D,X)          ; E1 1D | Subtract with carry ((zero page,X))
    JMP ($C8F0)          ; 6C F0 C8 | Jump to address (absolute indirect)
    SEP #$23             ; E2 23 | Set processor status bits
    CPY $FF00            ; CC 00 FF | Compare Y register (absolute)
    CMP $38FF            ; CD FF 38 | Compare accumulator (absolute)
    SEP #$FC             ; E2 FC | Set processor status bits
    CPY $F0              ; C4 F0 | Compare Y register (zero page)
    BPL $F9              ; 10 F9 | Branch if positive
    PHX                  ; DA | Push X register to stack
    JMP $60E12E          ; 5C 2E E1 60 | Jump to address long
    INY                  ; C8 | Increment Y register
    ORA $EFE6,Y          ; 19 E6 EF | Logical OR with accumulator (absolute,Y)
    BPL $27              ; 10 27 | Branch if positive
    INY                  ; C8 | Increment Y register
    BRA $F1              ; 80 F1 | Branch always
    STA                  ; 9F 01 28 1F | Store accumulator to absolute long,X
    STA $E3FE81          ; 8F 81 FE E3 | Store accumulator to absolute long address
    ROL $70FF,X          ; 3E FF 70 | Rotate left (absolute,X)
    ASL $9118            ; 0E 18 91 | Arithmetic shift left (absolute)
    STA $CE6E            ; 8D 6E CE | Store accumulator to absolute address
    AND $007E,X          ; 3D 7E 00 | Logical AND with accumulator (absolute,X)
    BMI $00              ; 30 00 | Branch if negative
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    ROR $9181            ; 6E 81 91 | Rotate right (absolute)
    REP #$F3             ; C2 F3 | Reset processor status bits
    BEQ $8E              ; F0 8E | Branch if equal
    DEC $7D30            ; CE 30 7D | Decrement (absolute)
    ADC #$BE             ; 69 BE | Add with carry (immediate)
    EOR ($9C,X)          ; 41 9C | Exclusive OR with accumulator ((zero page,X))
    DEC $39              ; C6 39 | Decrement (zero page)
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_123
; Address: $E2C112
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_123:
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    ORA ($FB,X)          ; 01 FB | Logical OR with accumulator ((zero page,X))
    LDX $FFFF,Y          ; BE FF FF | Load from absolute,Y into X register
    DEC                  ; 3A | Decrement accumulator
    LDA #$55             ; A9 55 | Load immediate value into accumulator
    EOR ($BC,X)          ; 41 BC | Exclusive OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 71 8A 97 | Load from absolute long,X into accumulator
    ADC $13              ; 65 13 | Add with carry (zero page)
    CPX #$18             ; E0 18 | Compare X register (immediate)
    BEQ $C5              ; F0 C5 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    NOP                  ; EA | No operation
    RTI                  ; 40 | Return from interrupt
    INC $F8F5,X          ; FE F5 F8 | Increment (absolute,X)
    TXS                  ; 9A | Transfer X register to stack pointer
    BEQ $92              ; F0 92 | Branch if equal
    JMP ($7EC0)          ; 6C C0 7E | Jump to address (absolute indirect)
    BVC $AE              ; 50 AE | Branch if overflow clear
    CPY #$BE             ; C0 BE | Compare Y register (immediate)
    LDY $7B45,X          ; BC 45 7B | Load from absolute,X into Y register
    INC $7FE6            ; EE E6 7F | Increment (absolute)
    DEY                  ; 88 | Decrement Y register
    STA                  ; 9F 93 3E B1 | Store accumulator to absolute long,X
    ROL $3ED9,X          ; 3E D9 3E | Rotate left (absolute,X)
    EOR ($0E,X)          ; 41 0E | Exclusive OR with accumulator ((zero page,X))
    TSX                  ; BA | Transfer stack pointer to X register
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_124
; Address: $E2C160
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_124:
    CMP ($33,X)          ; C1 33 | Compare accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register
    LDA ($F8),Y          ; B1 F8 | Load from (zero page),Y into accumulator
    BRA $78              ; 80 78 | Branch always
    DEX                  ; CA | Decrement X register
    BVS $E3              ; 70 E3 | Branch if overflow set
    CMP ($F6,X)          ; C1 F6 | Compare accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ROR $7F00,X          ; 7E 00 7F | Rotate right (absolute,X)
    ORA #$07             ; 09 07 | Logical OR with accumulator (immediate)
    BPL $0F              ; 10 0F | Branch if positive
    AND ($DF),Y          ; 31 DF | Logical AND with accumulator ((zero page),Y)
    INC $2D7D,X          ; FE 7D 2D | Increment (absolute,X)
    SBC $677F,Y          ; F9 7F 67 | Subtract with carry (absolute,Y)
    ADC $4B7F            ; 6D 7F 4B | Add with carry (absolute)
    INC $30              ; E6 30 | Increment (zero page)
    BMI $8A              ; 30 8A | Branch if negative
    LDX $2D27,Y          ; BE 27 2D | Load from absolute,Y into X register
    STZ $EF7F,X          ; 9E 7F EF | Store zero to absolute,X
    JMP $83FF            ; 4C FF 83 | Jump to address

;------------------------------------------------------------------------------
; Bank44_DmaFunction_125
; Address: $E2C1A0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_125:
    ROL $FDF3,X          ; 3E F3 FD | Rotate left (absolute,X)
    LDA $41EF42          ; AF 42 EF 41 | Load from absolute long address into accumulator
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    BCC $6D              ; 90 6D | Branch if carry clear

;------------------------------------------------------------------------------
; Bank44_DmaFunction_126
; Address: $E2C1B1
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_126:
    JSR $E06E            ; 20 6E E0 | Game work RAM access
    CPY #$D0             ; C0 D0 | Compare Y register (immediate)
    CPX #$D0             ; E0 D0 | Compare X register (immediate)
    CPX #$0C             ; E0 0C | Compare X register (immediate)
    BEQ $02              ; F0 02 | Branch if equal
    CPX #$1C             ; E0 1C | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    STA $B9E2,X          ; 9D E2 B9 | Store accumulator to absolute,X
    LSR $C7              ; 46 C7 | Logical shift right (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    CPX $7353            ; EC 53 73 | Compare X register (absolute)
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    AND $BF7F,X          ; 3D 7F BF | Logical AND with accumulator (absolute,X)
    STA                  ; 9F 1F AF 1F | Store accumulator to absolute long,X
    SBC ($06),Y          ; F1 06 | Subtract with carry ((zero page),Y)
    LDA                  ; BF 01 DC 83 | Load from absolute long,X into accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_127
; Address: $E2C1EA
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_127:
    SED                  ; F8 | Set decimal mode flag
    ROL $D9              ; 26 D9 | Rotate left (zero page)
    CPY $010F            ; CC 0F 01 | Compare Y register (absolute)
    EOR $85              ; 45 85 | Exclusive OR with accumulator (zero page)
    CMP $9F              ; C5 9F | Compare accumulator (zero page)
    BRA $FF              ; 80 FF | Branch always
    STA ($FF),Y          ; 91 FF | Store accumulator to (zero page),Y
    ROR $3F              ; 66 3F | Rotate right (zero page)
    PLX                  ; FA | Pull X register from stack
    INC $BBF4,X          ; FE F4 BB | Increment (absolute,X)
    CPX $FF              ; E4 FF | Compare X register (zero page)
    INC $FE7F,X          ; FE 7F FE | Increment (absolute,X)
    ADC #$BF             ; 69 BF | Add with carry (immediate)
    PLY                  ; 7A | Pull Y register from stack
    ORA $E7EF,X          ; 1D EF E7 | Logical OR with accumulator (absolute,X)
    ORA $7F7F,X          ; 1D 7F 7F | Logical OR with accumulator (absolute,X)
    LDX $FFFF,Y          ; BE FF FF | Load from absolute,Y into X register
    CMP $F7FF,X          ; DD FF F7 | Compare accumulator (absolute,X)
    STA                  ; 9F C7 F7 D0 | Store accumulator to absolute long,X
    ROR $EF8D,X          ; 7E 8D EF | Rotate right (absolute,X)
    TXS                  ; 9A | Transfer X register to stack pointer
    INC $4783,X          ; FE 83 47 | Increment (absolute,X)
    CLV                  ; B8 | Clear overflow flag
    SBC $E899,Y          ; F9 99 E8 | Subtract with carry (absolute,Y)
    BEQ $DB              ; F0 DB | Branch if equal
    INC $7FFF,X          ; FE FF 7F | Increment (absolute,X)
    STY $339B            ; 8C 9B 33 | Store Y register to absolute address
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_128
; Address: $E2C26D
; Size: 119 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_128:
    BCC $78              ; 90 78 | Branch if carry clear
    JMP ($331F)          ; 6C 1F 33 | Jump to address (absolute indirect)
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    ASL $BCFD            ; 0E FD BC | Arithmetic shift left (absolute)
    INC $BBED,X          ; FE ED BB | Increment (absolute,X)
    SEC                  ; 38 | Set carry flag
    LDX $3051,Y          ; BE 51 30 | Load from absolute,Y into X register
    ASL $BCFF            ; 0E FF BC | Arithmetic shift left (absolute)
    SBC $DFFF,X          ; FD FF DF | Subtract with carry (absolute,X)
    CLC                  ; 18 | Clear carry flag
    INC $19              ; E6 19 | Increment (zero page)
    SEC                  ; 38 | Set carry flag
    BCC $01              ; 90 01 | Branch if carry clear
    INC $33CC,X          ; FE CC 33 | Increment (absolute,X)
    STA $0DF270          ; 8F 70 F2 0D | Store accumulator to absolute long address
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    LDA                  ; BF 71 35 CE | Load from absolute long,X into accumulator
    ASL $F3E1,X          ; 1E E1 F3 | Arithmetic shift left (absolute,X)
    ASL $FE01            ; 0E 01 FE | Arithmetic shift left (absolute)
    SEP #$1D             ; E2 1D | Set processor status bits
    RTI                  ; 40 | Return from interrupt
    SBC ($3E,X)          ; E1 3E | Subtract with carry ((zero page,X))
    BVS $8F              ; 70 8F | Branch if overflow set
    EOR $E7E2,X          ; 5D E2 E7 | Exclusive OR with accumulator (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    DEC $F621,X          ; DE 21 F6 | Decrement (absolute,X)
    ORA #$77             ; 09 77 | Logical OR with accumulator (immediate)
    TAY                  ; A8 | Transfer accumulator to Y register
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    STX $79              ; 86 79 | Store X register to zero page
    SBC $FFFF,X          ; FD FF FF | Subtract with carry (absolute,X)
    INC $FFFE,X          ; FE FE FF | Increment (absolute,X)
    STA $E31E7F          ; 8F 7F 1E E3 | Store accumulator to absolute long address
    SBC $BFE0,Y          ; F9 E0 BF | Subtract with carry (absolute,Y)
    STA $C3E2,X          ; 9D E2 C3 | Store accumulator to absolute,X
    SEC                  ; 38 | Set carry flag
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    STZ $06E0            ; 9C E0 06 | Store zero to absolute
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    ORA $FF7F,X          ; 1D 7F FF | Logical OR with accumulator (absolute,X)
    BPL $7F              ; 10 7F | Branch if positive
    ROR $B9              ; 66 B9 | Rotate right (zero page)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 91 EE 6C | Load from absolute long,X into accumulator
    CPX #$38             ; E0 38 | Compare X register (immediate)
    PHB                  ; 8B | Push data bank register to stack
    BRA $43              ; 80 43 | Branch always
    LDA                  ; BF FF FF FF | Load from absolute long,X into accumulator
    EOR ($AE),Y          ; 51 AE | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_129
; Address: $E2C366
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_129:
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF 4D DE 29 | Load from absolute long,X into accumulator
    STA $06F9,X          ; 9D F9 06 | Store accumulator to absolute,X
    BRA $7F              ; 80 7F | Branch always
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 78 C7 B9 | Load from absolute long,X into accumulator
    INC $F0              ; E6 F0 | Increment (zero page)
    STA $FFFFFF          ; 8F FF FF FF | Store accumulator to absolute long address
    DEY                  ; 88 | Decrement Y register
    STA $FE0170          ; 8F 70 01 FE | Store accumulator to absolute long address
    BMI $FF              ; 30 FF | Branch if negative
    PEA #$0FF0           ; F4 F0 0F | Push effective address to stack

;------------------------------------------------------------------------------
; Bank44_DmaFunction_12A
; Address: $E2C3AE
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_12A:
    JSR $FFFF            ; 20 FF FF | Jump to subroutine
    INC $EF13,X          ; FE 13 EF | Increment (absolute,X)
    SBC $1A              ; E5 1A | Subtract with carry (zero page)
    DEY                  ; 88 | Decrement Y register
    INC $1801,X          ; FE 01 18 | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))
    BPL $F0              ; 10 F0 | Branch if positive
    SBC $FE              ; E5 FE | Subtract with carry (zero page)
    SED                  ; F8 | Set decimal mode flag
    INY                  ; C8 | Increment Y register
    INC $3F              ; E6 3F | Increment (zero page)
    CMP #$F7             ; C9 F7 | Compare accumulator (immediate)
    STZ $AFE1,X          ; 9E E1 AF | Store zero to absolute,X
    BNE $F3              ; D0 F3 | Branch if not equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    PLX                  ; FA | Pull X register from stack
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    ASL $3F3F,X          ; 1E 3F 3F | Arithmetic shift left (absolute,X)
    ORA $E817            ; 0D 17 E8 | Logical OR with accumulator (absolute)
    INC $C101,X          ; FE 01 C1 | Increment (absolute,X)
    ROL $28D7,X          ; 3E D7 28 | Rotate left (absolute,X)
    BRA $FF              ; 80 FF | Branch always
    PEA #$23DC           ; F4 DC 23 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank44_DmaFunction_12B
; Address: $E2C424
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_12B:
    JSR $A0FF            ; 20 FF A0 | Jump to subroutine
    CPY $B233            ; CC 33 B2 | Compare Y register (absolute)
    JMP $F906            ; 4C 06 F9 | Jump to address
    SED                  ; F8 | Set decimal mode flag
    STZ $9B              ; 64 9B | Store zero to zero page
    BPL $FF              ; 10 FF | Branch if positive
    STY $3073            ; 8C 73 30 | Store Y register to absolute address
    WDM #$FF             ; 42 FF | Reserved instruction
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    SBC #$40             ; E9 40 | Subtract with carry (immediate)
    BVS $8F              ; 70 8F | Branch if overflow set
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_12D
; Address: $E2C483
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_12D:
    STA                  ; 9F F6 09 38 | Store accumulator to absolute long,X
    PHP                  ; 08 | Push processor status to stack
    ROL $3EF2,X          ; 3E F2 3E | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_12E
; Address: $E2C4A4
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_12E:
    JSR $131E            ; 20 1E 13 | Jump to subroutine
    ASL $0CC0,X          ; 1E C0 0C | Arithmetic shift left (absolute,X)
    BVS $08              ; 70 08 | Branch if overflow set
    CPY #$E8             ; C0 E8 | Compare Y register (immediate)
    BEQ $3E              ; F0 3E | Branch if equal
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    CMP ($1E,X)          ; C1 1E | Compare accumulator ((zero page,X))
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    SBC ($0C,X)          ; E1 0C | Subtract with carry ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    SBC #$08             ; E9 08 | Subtract with carry (immediate)
    ORA ($D5,X)          ; 01 D5 | Logical OR with accumulator ((zero page,X))
    CMP ($E0,X)          ; C1 E0 | Game work RAM access
    CMP ($1F),Y          ; D1 1F | Compare accumulator ((zero page),Y)
    STA ($03,X)          ; 81 03 | Store accumulator to (zero page,X)
    PHP                  ; 08 | Push processor status to stack
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    CPX #$07             ; E0 07 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    EOR $22              ; 45 22 | Exclusive OR with accumulator (zero page)
    NOP                  ; EA | No operation
    STY $B8              ; 84 B8 | Store Y register to zero page
    ORA $5201,Y          ; 19 01 52 | Logical OR with accumulator (absolute,Y)
    SBC ($C1),Y          ; F1 C1 | Subtract with carry ((zero page),Y)
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SBC $3EC1,X          ; FD C1 3E | Subtract with carry (absolute,X)
    JMP $3C300C          ; 5C 0C 30 3C | Jump to address long
    DEC $F3C0,X          ; DE C0 F3 | Decrement (absolute,X)
    SBC $1513,X          ; FD 13 15 | Subtract with carry (absolute,X)
    SBC #$E1             ; E9 E1 | Subtract with carry (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    BEQ $0F              ; F0 0F | Branch if equal

;------------------------------------------------------------------------------
; Bank44_DmaFunction_12F
; Address: $E2C524
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_12F:
    JSR $1060            ; 20 60 10 | Jump to subroutine
    BVS $20              ; 70 20 | Branch if overflow set
    BVS $42              ; 70 42 | Hardware register operation
    ADC #$01             ; 69 01 | Add with carry (immediate)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_131
; Address: $E2C535
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_131:
    BCC $70              ; 90 70 | Branch if carry clear
    BIT #$70             ; 89 70 | Test bits in accumulator (immediate)
    PHB                  ; 8B | Push data bank register to stack
    LDA $EC13            ; AD 13 EC | Load from absolute address into accumulator
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    BMI $38              ; 30 38 | Branch if negative
    BMI $38              ; 30 38 | Branch if negative
    PHY                  ; 5A | Push Y register to stack
    INC                  ; 1A | Increment accumulator
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    BIT $38              ; 24 38 | Test bits in accumulator (zero page)
    EOR $38              ; 45 38 | Exclusive OR with accumulator (zero page)
    INC                  ; 1A | Increment accumulator
    SBC $0C              ; E5 0C | Subtract with carry (zero page)
    EOR ($82),Y          ; 51 82 | Exclusive OR with accumulator ((zero page),Y)
    LDA $4B              ; A5 4B | Load from zero page into accumulator
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($B2,X)          ; 01 B2 | Logical OR with accumulator ((zero page,X))
    EOR $2F17            ; 4D 17 2F | Exclusive OR with accumulator (absolute)
    CPY $D23C            ; CC 3C D2 | Compare Y register (absolute)
    AND ($08),Y          ; 31 08 | Logical AND with accumulator ((zero page),Y)
    STX $01              ; 86 01 | Store X register to zero page
    ORA #$D7             ; 09 D7 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    CPY $1133            ; CC 33 11 | Compare Y register (absolute)
    ROL $FF78            ; 2E 78 FF | Rotate left (absolute)
    CPX $FF              ; E4 FF | Compare X register (zero page)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    LDX #$FF             ; A2 FF | Load immediate value into X register
    STA                  ; 9F 89 03 00 | Store accumulator to absolute long,X
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    ASL $0CE1,X          ; 1E E1 0C | Arithmetic shift left (absolute,X)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    SBC $B768,X          ; FD 68 B7 | Subtract with carry (absolute,X)
    ADC ($FF,X)          ; 61 FF | Add with carry ((zero page,X))
    CMP #$F7             ; C9 F7 | Compare accumulator (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_133
; Address: $E2C5B7
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_133:
    SBC $E21D,X          ; FD 1D E2 | Subtract with carry (absolute,X)
    BRA $7F              ; 80 7F | Branch always
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    ASL $3CFF,X          ; 1E FF 3C | Arithmetic shift left (absolute,X)
    NOP                  ; EA | No operation
    WDM #$FD             ; 42 FD | Reserved instruction

;------------------------------------------------------------------------------
; Bank44_DmaFunction_134
; Address: $E2C5CA
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_134:
    JSL $F11EFD          ; 22 FD 1E F1 | Jump to subroutine long
    ORA $C0F6,Y          ; 19 F6 C0 | Logical OR with accumulator (absolute,Y)
    BRA $7C              ; 80 7C | Branch always
    INX                  ; E8 | Increment X register
    BRA $78              ; 80 78 | Branch always
    SBC $7080,X          ; FD 80 70 | Subtract with carry (absolute,X)
    RTI                  ; 40 | Return from interrupt
    LDA ($E1),Y          ; B1 E1 | Load from (zero page),Y into accumulator
    LDA ($E1),Y          ; B1 E1 | Load from (zero page),Y into accumulator
    SEP #$C3             ; E2 C3 | Set processor status bits
    CPY $7823            ; CC 23 78 | Compare Y register (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    CPX $EC13            ; EC 13 EC | Compare X register (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CPX #$81             ; E0 81 | Compare X register (immediate)
    STA ($82,X)          ; 81 82 | Store accumulator to (zero page,X)
    BRA $C3              ; 80 C3 | Branch always
    CPY #$F9             ; C0 F9 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BEQ $FC              ; F0 FC | Branch if equal
    CPY #$7E             ; C0 7E | Compare Y register (immediate)
    ORA $1B              ; 05 1B | Logical OR with accumulator (zero page)
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    BRA $7F              ; 80 7F | Branch always
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BEQ $0F              ; F0 0F | Branch if equal
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    SBC $FC03,X          ; FD 03 FC | Subtract with carry (absolute,X)
    STZ $9E87,X          ; 9E 87 9E | Store zero to absolute,X
    STA $00CFCD          ; 8F CD CF 00 | Store accumulator to absolute long address
    BEQ $00              ; F0 00 | Branch if equal
    ASL $F0              ; 06 F0 | Arithmetic shift left (zero page)
    STA ($E0,X)          ; 81 E0 | Game work RAM access
    SEI                  ; 78 | Set interrupt disable flag
    STA $30CF70          ; 8F 70 CF 30 | Store accumulator to absolute long address
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $0F              ; F0 0F | Branch if equal
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    ORA #$F8             ; 09 F8 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_136
; Address: $E2C647
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_136:
    ADC ($3C),Y          ; 71 3C | Add with carry ((zero page),Y)
    DEX                  ; CA | Decrement X register
    SED                  ; F8 | Set decimal mode flag
    ADC ($8E),Y          ; 71 8E | Add with carry ((zero page),Y)
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    ORA ($1F),Y          ; 11 1F | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_137
; Address: $E2C67B
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_137:
    JSR $100F            ; 20 0F 10 | Jump to subroutine
    ORA $3DFD,X          ; 1D FD 3D | Logical OR with accumulator (absolute,X)
    LDA                  ; BF 5E BF 84 | Load from absolute long,X into accumulator
    SBC ($66,X)          ; E1 66 | Subtract with carry ((zero page,X))
    SBC ($1D,X)          ; E1 1D | Subtract with carry ((zero page,X))
    AND $3F02,X          ; 3D 02 3F | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_139
; Address: $E2C69A
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_139:
    JSL $9E615D          ; 22 5D 61 9E | Jump to subroutine long
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    ROR $8E00,X          ; 7E 00 8E | Rotate right (absolute,X)
    STA ($29,X)          ; 81 29 | Store accumulator to (zero page,X)
    AND ($2A,X)          ; 21 2A | Logical AND with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    CPY #$DF             ; C0 DF | Compare Y register (immediate)
    BRA $FF              ; 80 FF | Branch always
    BVS $FF              ; 70 FF | Branch if overflow set
    CMP ($7E,X)          ; C1 7E | Compare accumulator ((zero page,X))
    AND $DE              ; 25 DE | Logical AND with accumulator (zero page)
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    DEC $7721,X          ; DE 21 77 | Decrement (absolute,X)
    BEQ $FF              ; F0 FF | Branch if equal
    JMP $3EE1            ; 4C E1 3E | Jump to address
    CPY $A000            ; CC 00 A0 | Compare Y register (absolute)
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $0F              ; F0 0F | Branch if equal
    LDX #$5D             ; A2 5D | Load immediate value into X register
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    BMI $FF              ; 30 FF | Branch if negative
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    STY $87F3            ; 8C F3 87 | Store Y register to absolute address
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    DEC $E0              ; C6 E0 | Game work RAM access
    SBC $6780,X          ; FD 80 67 | Subtract with carry (absolute,X)
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    STZ $D03E            ; 9C 3E D0 | Store zero to absolute
    ASL $F1              ; 06 F1 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_13A
; Address: $E2C70D
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_13A:
    CMP ($3B,X)          ; C1 3B | Compare accumulator ((zero page,X))
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$1C             ; E0 1C | Compare X register (immediate)
    BPL $EF              ; 10 EF | Branch if positive
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    CPY $7CF3            ; CC F3 7C | Compare Y register (absolute)
    SBC ($02),Y          ; F1 02 | Subtract with carry ((zero page),Y)
    DEC $FFC0,X          ; DE C0 FF | Decrement (absolute,X)
    SBC $010F,Y          ; F9 0F 01 | Subtract with carry (absolute,Y)
    SBC ($11,X)          ; E1 11 | Subtract with carry ((zero page,X))
    SBC ($C3),Y          ; F1 C3 | Subtract with carry ((zero page),Y)
    SBC $3FC0,X          ; FD C0 3F | Subtract with carry (absolute,X)
    SBC $0106,Y          ; F9 06 01 | Subtract with carry (absolute,Y)
    INC $1EE1,X          ; FE E1 1E | Increment (absolute,X)
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    INC $FC3E,X          ; FE 3E FC | Increment (absolute,X)
    ASL $1E73,X          ; 1E 73 1E | Arithmetic shift left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    STY $A480            ; 8C 80 A4 | Store Y register to absolute address
    LDY #$52             ; A0 52 | Load immediate value into Y register
    LDA $C13E            ; AD 3E C1 | Load from absolute address into accumulator
    ASL $1EE1,X          ; 1E E1 1E | Arithmetic shift left (absolute,X)
    SBC ($0C,X)          ; E1 0C | Subtract with carry ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BRA $7F              ; 80 7F | Branch always
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    SBC $0C              ; E5 0C | Subtract with carry (zero page)
    SBC #$08             ; E9 08 | Subtract with carry (immediate)
    BNE $D0              ; D0 D0 | Branch if not equal
    SBC $0E11,X          ; FD 11 0E | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_13B
; Address: $E2C76F
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_13B:
    JSR $F30C            ; 20 0C F3 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    BNE $2F              ; D0 2F | Branch if not equal
    STA $CC33            ; 8D 33 CC | Store accumulator to absolute address
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    LDA $2DFD            ; AD FD 2D | Load from absolute address into accumulator
    SBC $FE1F,X          ; FD 1F FE | Subtract with carry (absolute,X)
    LDA $FD30,X          ; BD 30 FD | Load from absolute,X into accumulator
    BMI $7E              ; 30 7E | Branch if negative
    ORA $FD03,X          ; 1D 03 FD | Logical OR with accumulator (absolute,X)
    SBC $FE02,X          ; FD 02 FE | Subtract with carry (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BMI $CF              ; 30 CF | Branch if negative
    BMI $CF              ; 30 CF | Branch if negative
    SBC $FC03,X          ; FD 03 FC | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_13C
; Address: $E2C7C6
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_13C:
    PHP                  ; 08 | Push processor status to stack
    SBC $7097,Y          ; F9 97 70 | Subtract with carry (absolute,Y)
    LDY $DD60            ; AC 60 DD | Load from absolute address into Y register
    AND $FFC7,Y          ; 39 C7 FF | Logical AND with accumulator (absolute,Y)
    ORA $B847            ; 0D 47 B8 | Logical OR with accumulator (absolute)
    BCS $19              ; B0 19 | Branch if carry set
    INC $30              ; E6 30 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_13E
; Address: $E2C7DF
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_13E:
    JSR $FF30            ; 20 30 FF | Jump to subroutine
    ORA ($F8,X)          ; 01 F8 | Logical OR with accumulator ((zero page,X))
    CPX #$07             ; E0 07 | Compare X register (immediate)
    CPX #$A1             ; E0 A1 | Compare X register (immediate)
    CPX #$B8             ; E0 B8 | Compare X register (immediate)
    CPX #$36             ; E0 36 | Compare X register (immediate)
    ADC $D886,Y          ; 79 86 D8 | Add with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_13F
; Address: $E2C7F6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_13F:
    JSR $A8DF            ; 20 DF A8 | Jump to subroutine
    INC $E01F            ; EE 1F E0 | Game work RAM access
    PHA                  ; 48 | Push accumulator to stack
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    BRA $3F              ; 80 3F | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_140
; Address: $E2C809
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_140:
    SEI                  ; 78 | Set interrupt disable flag
    SBC $6478            ; ED 78 64 | Subtract with carry (absolute)
    BVS $C6              ; 70 C6 | Branch if overflow set
    BNE $FF              ; D0 FF | Branch if not equal
    TYA                  ; 98 | Transfer Y register to accumulator
    BMI $CF              ; 30 CF | Branch if negative
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    BVS $8F              ; 70 8F | Branch if overflow set
    BNE $2F              ; D0 2F | Branch if not equal
    ORA $37F6,Y          ; 19 F6 37 | Logical OR with accumulator (absolute,Y)
    INX                  ; E8 | Increment X register
    BRA $0B              ; 80 0B | Branch always
    PEA #$7A05           ; F4 05 7A | Push effective address to stack
    SEC                  ; 38 | Set carry flag
    AND $3A              ; 25 3A | Logical AND with accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    BRA $70              ; 80 70 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    BEQ $60              ; F0 60 | Branch if equal
    TYA                  ; 98 | Transfer Y register to accumulator
    BMI $C8              ; 30 C8 | Branch if negative
    BMI $C8              ; 30 C8 | Branch if negative
    BMI $C8              ; 30 C8 | Branch if negative
    INC $2DEF            ; EE EF 2D | Increment (absolute)
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    BEQ $CF              ; F0 CF | Branch if equal

;------------------------------------------------------------------------------
; Bank44_DmaFunction_141
; Address: $E2C84F
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_141:
    INC $18E7            ; EE E7 18 | Increment (absolute)
    BPL $2F              ; 10 2F | Branch if positive
    BNE $0F              ; D0 0F | Branch if not equal
    BEQ $7F              ; F0 7F | Branch if equal
    BRA $FD              ; 80 FD | Branch always
    BEQ $0F              ; F0 0F | Branch if equal
    INC $0D11            ; EE 11 0D | Increment (absolute)
    SBC $FC04,X          ; FD 04 FC | Subtract with carry (absolute,X)
    SBC ($F1),Y          ; F1 F1 | Subtract with carry ((zero page),Y)
    INC $3BF8,X          ; FE F8 3B | Increment (absolute,X)
    PHB                  ; 8B | Push data bank register to stack
    ORA ($1E),Y          ; 11 1E | Logical OR with accumulator ((zero page),Y)
    SBC $FC02,X          ; FD 02 FC | Subtract with carry (absolute,X)
    SBC $0EF1,X          ; FD F1 0E | Subtract with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    INC $E0              ; E6 E0 | Game work RAM access
    SEP #$E0             ; E2 E0 | Game work RAM access
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPY #$61             ; C0 61 | Compare Y register (immediate)
    WDM #$A1             ; 42 A1 | Reserved instruction
    SBC ($36,X)          ; E1 36 | Subtract with carry ((zero page,X))
    CMP ($7F,X)          ; C1 7F | Compare accumulator ((zero page,X))
    BRA $E0              ; 80 E0 | Game work RAM access
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 00 FF 00 | Load from absolute long,X into accumulator
    ORA ($30,X)          ; 01 30 | Logical OR with accumulator ((zero page,X))
    EOR ($50,X)          ; 41 50 | Exclusive OR with accumulator ((zero page,X))
    CPY $FED0            ; CC D0 FE | Compare Y register (absolute)
    CPY #$FB             ; C0 FB | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    ROR                  ; 6A | Rotate right (accumulator)
    STA ($A0,X)          ; 81 A0 | Store accumulator to (zero page,X)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF C0 3F C0 | Load from absolute long,X into accumulator
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 00 FF 00 | Load from absolute long,X into accumulator
    LDY $F930,X          ; BC 30 F9 | Load from absolute,X into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_142
; Address: $E2C8C6
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_142:
    STZ $4C              ; 64 4C | Store zero to zero page
    EOR ($01,X)          ; 41 01 | Exclusive OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    BMI $CF              ; 30 CF | Branch if negative
    STY $9867            ; 8C 67 98 | Store Y register to absolute address
    JMP $01B3            ; 4C B3 01 | Jump to address
    LSR $0601            ; 4E 01 06 | Logical shift right (absolute)
    ORA $100F            ; 0D 0F 10 | Logical OR with accumulator (absolute)
    ASL $070E            ; 0E 0E 07 | Arithmetic shift left (absolute)
    ASL $1D              ; 06 1D | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_143
; Address: $E2C8E7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_143:
    BPL $11              ; 10 11 | Branch if positive
    ORA ($23,X)          ; 01 23 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    LSR $0E1E,X          ; 5E 1E 0E | Logical shift right (absolute,X)
    ORA ($1F),Y          ; 11 1F | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_144
; Address: $E2C8F3
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_144:
    JSR $231C            ; 20 1C 23 | Jump to subroutine
    BPL $2F              ; 10 2F | Branch if positive
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    ASL $C461,X          ; 1E 61 C4 | Arithmetic shift left (absolute,X)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF E1 1F C0 | Load from absolute long,X into accumulator
    LDY #$3E             ; A0 3E | Load immediate value into Y register
    INC $91              ; E6 91 | Increment (zero page)
    BVS $2A              ; 70 2A | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    SBC $201F,Y          ; F9 1F 20 | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_145
; Address: $E2C916
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_145:
    JSR $661F            ; 20 1F 66 | Jump to subroutine
    ORA $0F76,Y          ; 19 76 0F | Logical OR with accumulator (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    SBC $0C06,Y          ; F9 06 0C | Subtract with carry (absolute,Y)
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    LDY #$BF             ; A0 BF | Load immediate value into Y register
    BIT $3F              ; 24 3F | Test bits in accumulator (zero page)
    AND #$39             ; 29 39 | Logical AND with accumulator (immediate)
    BVS $D8              ; 70 D8 | Branch if overflow set
    BEQ $3F              ; F0 3F | Branch if equal
    CPY #$EF             ; C0 EF | Compare Y register (immediate)
    BPL $23              ; 10 23 | Branch if positive
    LDY $5B              ; A4 5B | Load from zero page into Y register
    BNE $39              ; D0 39 | Branch if not equal
    DEC $70              ; C6 70 | Decrement (zero page)
    STA $680FF2          ; 8F F2 0F 68 | Store accumulator to absolute long address
    SED                  ; F8 | Set decimal mode flag
    EOR #$F8             ; 49 F8 | Exclusive OR with accumulator (immediate)
    EOR ($F8,X)          ; 41 F8 | Exclusive OR with accumulator ((zero page,X))
    BEQ $3F              ; F0 3F | Branch if equal
    BNE $DF              ; D0 DF | Branch if not equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    BPL $F7              ; 10 F7 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    INY                  ; C8 | Increment Y register
    BIT $3986            ; 2C 86 39 | Test bits in accumulator (absolute)
    STX $F9              ; 86 F9 | Store X register to zero page
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank44_DmaFunction_146
; Address: $E2C970
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_146:
    SEC                  ; 38 | Set carry flag
    CPY #$78             ; C0 78 | Compare Y register (immediate)
    BRA $F8              ; 80 F8 | Branch always
    SED                  ; F8 | Set decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    RTI                  ; 40 | Return from interrupt
    BEQ $08              ; F0 08 | Branch if equal
    BVS $88              ; 70 88 | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    CLV                  ; B8 | Clear overflow flag
    ASL $1E              ; 06 1E | Arithmetic shift left (zero page)
    ORA ($10),Y          ; 11 10 | Logical OR with accumulator ((zero page),Y)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BPL $71              ; 10 71 | Branch if positive
    BPL $1E              ; 10 1E | Branch if positive
    AND ($1C,X)          ; 21 1C | Logical AND with accumulator ((zero page,X))
    BPL $2D              ; 10 2D | Branch if positive
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    ORA ($72,X)          ; 01 72 | Logical OR with accumulator ((zero page,X))
    ADC ($8E),Y          ; 71 8E | Add with carry ((zero page),Y)
    JMP ($6923)          ; 6C 23 69 | Jump to address (absolute indirect)
    ROL $5E              ; 26 5E | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_149
; Address: $E2C9C1
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_149:
    JSL $FC3ADB          ; 22 DB 3A FC | Jump to subroutine long
    CLD                  ; D8 | Clear decimal mode flag
    BMI $98              ; 30 98 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    STY $0500            ; 8C 00 05 | Store Y register to absolute address
    SBC $E51A,X          ; FD 1A E5 | Subtract with carry (absolute,X)
    BPL $EF              ; 10 EF | Branch if positive
    STA $000700          ; 8F 00 07 00 | Store accumulator to absolute long address
    CPX $FA              ; E4 FA | Compare X register (zero page)
    INC $FEF0            ; EE F0 FE | Increment (absolute)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank44_DmaFunction_14A
; Address: $E2C9E7
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_14A:
    JSR $4295            ; 20 95 42 | Hardware register operation
    STA ($14,X)          ; 81 14 | Store accumulator to (zero page,X)
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 00 FF 00 | Load from absolute long,X into accumulator
    STA $0900,X          ; 9D 00 09 | Store accumulator to absolute,X
    BPL $FF              ; 10 FF | Branch if positive
    ORA $FD              ; 05 FD | Logical OR with accumulator (zero page)
    ASL $4FFC            ; 0E FC 4F | Arithmetic shift left (absolute)
    INC $3ECE,X          ; FE CE 3E | Increment (absolute,X)
    BRA $62              ; 80 62 | Branch always

;------------------------------------------------------------------------------
; Bank44_DmaFunction_14B
; Address: $E2CA17
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_14B:
    STA $BA45,X          ; 9D 45 BA | Store accumulator to absolute,X
    ASL $1E21,X          ; 1E 21 1E | Arithmetic shift left (absolute,X)
    ORA ($C3,X)          ; 01 C3 | Logical OR with accumulator ((zero page,X))
    SBC ($85),Y          ; F1 85 | Subtract with carry ((zero page),Y)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    BRA $FF              ; 80 FF | Branch always
    RTI                  ; 40 | Return from interrupt
    SEC                  ; 38 | Set carry flag
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    ROL                  ; 2A | Rotate left (accumulator)
    PLA                  ; 68 | Pull accumulator from stack
    CPX #$CF             ; E0 CF | Compare X register (immediate)
    BMI $E0              ; 30 E0 | Game work RAM access
    SEI                  ; 78 | Set interrupt disable flag
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    DEC $7E72,X          ; DE 72 7E | Decrement (absolute,X)
    LDX $BE22,Y          ; BE 22 BE | Load from absolute,Y into X register
    ORA $FC              ; 05 FC | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    XBA                  ; EB | Exchange accumulator bytes
    DEC $7E21,X          ; DE 21 7E | Decrement (absolute,X)
    STA ($B6,X)          ; 81 B6 | Store accumulator to (zero page,X)
    EOR #$B6             ; 49 B6 | Exclusive OR with accumulator (immediate)
    EOR #$C4             ; 49 C4 | Exclusive OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    ASL $1CF1            ; 0E F1 1C | Arithmetic shift left (absolute)
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    AND $4C              ; 25 4C | Logical AND with accumulator (zero page)
    LSR $CE11            ; 4E 11 CE | Logical shift right (absolute)
    SBC $8073            ; ED 73 80 | Subtract with carry (absolute)
    BVS $40              ; 70 40 | Branch if overflow set
    LDY #$40             ; A0 40 | Load immediate value into Y register
    BRA $21              ; 80 21 | PPU graphics register access
    REP #$32             ; C2 32 | Reset processor status bits
    CMP ($10,X)          ; C1 10 | Compare accumulator ((zero page,X))
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $60              ; F0 60 | Branch if equal
    BCC $0D              ; 90 0D | Branch if carry clear
    WDM #$32             ; 42 32 | Reserved instruction
    BRA $B8              ; 80 B8 | Branch always
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank44_DmaFunction_14C
; Address: $E2CA8C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_14C:
    JSR $505F            ; 20 5F 50 | Jump to subroutine
    LDA                  ; BF 00 B2 0D | Load from absolute long,X into accumulator
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank44_DmaFunction_14D
; Address: $E2CA9B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_14D:
    JSR $108F            ; 20 8F 10 | Jump to subroutine
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    DEC                  ; 3A | Decrement accumulator
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank44_DmaFunction_14E
; Address: $E2CAA4
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_14E:
    BEQ $5F              ; F0 5F | Branch if equal
    BRA $FF              ; 80 FF | Branch always
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CPX #$39             ; E0 39 | Compare X register (immediate)
    DEC $3B              ; C6 3B | Decrement (zero page)
    CPY $0F              ; C4 0F | Compare Y register (zero page)
    BEQ $5E              ; F0 5E | Branch if equal
    LDA ($FC,X)          ; A1 FC | Load from (zero page,X) into accumulator
    CPY $8032            ; CC 32 80 | Compare Y register (absolute)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$11             ; C0 11 | Compare Y register (immediate)
    BEQ $1A              ; F0 1A | Branch if equal
    TYA                  ; 98 | Transfer Y register to accumulator
    BRA $7F              ; 80 7F | Branch always
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    LDA                  ; BF 40 5B EE | Load from absolute long,X into accumulator
    BCC $6F              ; 90 6F | Branch if carry clear
    CPY $3F              ; C4 3F | Compare Y register (zero page)
    RTI                  ; 40 | Return from interrupt
    DEC $8EF1            ; CE F1 8E | Decrement (absolute)
    SBC ($1B),Y          ; F1 1B | Subtract with carry ((zero page),Y)
    INC $3D              ; E6 3D | Increment (zero page)
    ROR $F981,X          ; 7E 81 F9 | Rotate right (absolute,X)
    ADC $CB              ; 65 CB | Add with carry (zero page)
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $02              ; 80 02 | Branch always
    PLP                  ; 28 | Pull processor status from stack
    BPL $00              ; 10 00 | Branch if positive
    TYA                  ; 98 | Transfer Y register to accumulator
    EOR ($68,X)          ; 41 68 | Exclusive OR with accumulator ((zero page,X))
    EOR ($3D,X)          ; 41 3D | Exclusive OR with accumulator ((zero page,X))
    BIT $B2D6            ; 2C D6 B2 | Test bits in accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    ORA $74              ; 05 74 | Logical OR with accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    BPL $04              ; 10 04 | Branch if positive
    TXA                  ; 8A | Transfer X register to accumulator
    BMI $00              ; 30 00 | Branch if negative
    ORA ($41),Y          ; 11 41 | Logical OR with accumulator ((zero page),Y)
    ORA ($76,X)          ; 01 76 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    CPY $04              ; C4 04 | Compare Y register (zero page)
    PLY                  ; 7A | Pull Y register from stack
    ADC ($03,X)          ; 61 03 | Add with carry ((zero page,X))
    AND ($41,X)          ; 21 41 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank44_DmaFunction_14F
; Address: $E2CB29
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_14F:
    ADC $A480,Y          ; 79 80 A4 | Add with carry (absolute,Y)
    CPY #$CA             ; C0 CA | Compare Y register (immediate)
    LSR $0018,X          ; 5E 18 00 | Logical shift right (absolute,X)
    CLI                  ; 58 | Clear interrupt disable flag
    STY $00              ; 84 00 | Store Y register to zero page
    BIT $D8              ; 24 D8 | Test bits in accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    STX $74              ; 86 74 | Store X register to zero page
    AND #$14             ; 29 14 | Logical AND with accumulator (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    LDX $D0              ; A6 D0 | Load from zero page into X register
    ORA $83              ; 05 83 | Logical OR with accumulator (zero page)
    DEY                  ; 88 | Decrement Y register
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    AND ($41,X)          ; 21 41 | Logical AND with accumulator ((zero page,X))
    ORA ($76,X)          ; 01 76 | Logical OR with accumulator ((zero page,X))
    BPL $82              ; 10 82 | Branch if positive
    CPY $14              ; C4 14 | Compare Y register (zero page)
    PHX                  ; DA | Push X register to stack
    SBC ($03,X)          ; E1 03 | Subtract with carry ((zero page,X))
    AND ($41,X)          ; 21 41 | Logical AND with accumulator ((zero page,X))
    ADC $A480,Y          ; 79 80 A4 | Add with carry (absolute,Y)
    LDY #$EA             ; A0 EA | Load immediate value into Y register
    CLC                  ; 18 | Clear carry flag
    PHA                  ; 48 | Push accumulator to stack
    LDY #$04             ; A0 04 | Load immediate value into Y register
    BIT $D8              ; 24 D8 | Test bits in accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    STX $74              ; 86 74 | Store X register to zero page
    ORA #$14             ; 09 14 | Logical OR with accumulator (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    CMP ($4C),Y          ; D1 4C | Compare accumulator ((zero page),Y)
    PHB                  ; 8B | Push data bank register to stack
    AND #$F4             ; 29 F4 | Logical AND with accumulator (immediate)
    BIT #$C9             ; 89 C9 | Test bits in accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    BMI $00              ; 30 00 | Branch if negative
    EOR ($0C,X)          ; 41 0C | Exclusive OR with accumulator ((zero page,X))
    BPL $06              ; 10 06 | Branch if positive
    CPY $04              ; C4 04 | Compare Y register (zero page)
    ASL $C1              ; 06 C1 | Arithmetic shift left (zero page)
    ORA $53C3,Y          ; 19 C3 53 | Logical OR with accumulator (absolute,Y)
    TAX                  ; AA | Transfer accumulator to X register
    INC $C9              ; E6 C9 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_152
; Address: $E2CBB7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_152:
    JSR $2004            ; 20 04 20 | Jump to subroutine
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    BPL $00              ; 10 00 | Branch if positive
    CPY #$20             ; C0 20 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_153
; Address: $E2CBC1
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_153:
    JSR $936E            ; 20 6E 93 | Jump to subroutine
    SBC $FB16            ; ED 16 FB | Subtract with carry (absolute)
    STY $C977            ; 8C 77 C9 | Store Y register to absolute address
    STZ $51              ; 64 51 | Store zero to zero page
    LDX $926F            ; AE 6F 92 | Load from absolute address into X register
    AND ($DE),Y          ; 31 DE | Logical AND with accumulator ((zero page),Y)
    ADC $BFD2,X          ; 7D D2 BF | Add with carry (absolute,X)
    STZ $FB              ; 64 FB | Store zero to zero page
    BIT $DB              ; 24 DB | Test bits in accumulator (zero page)
    LDA $92FF            ; AD FF 92 | Load from absolute address into accumulator
    ADC $00A6,Y          ; 79 A6 00 | Add with carry (absolute,Y)
    ADC $A28D            ; 6D 8D A2 | Add with carry (absolute)
    ASL $5B              ; 06 5B | Arithmetic shift left (zero page)
    ORA $7344,X          ; 1D 44 73 | Logical OR with accumulator (absolute,X)
    CMP $6646,Y          ; D9 46 66 | Compare accumulator (absolute,Y)
    BRA $00              ; 80 00 | Branch always
    BMI $40              ; 30 40 | Branch if negative
    SEI                  ; 78 | Set interrupt disable flag
    BRA $33              ; 80 33 | Branch always
    INY                  ; C8 | Increment Y register
    ORA ($E2),Y          ; 11 E2 | Logical OR with accumulator ((zero page),Y)
    ORA #$80             ; 09 80 | Logical OR with accumulator (immediate)
    LDA ($18,X)          ; A1 18 | Load from (zero page,X) into accumulator
    LDA $096B08          ; AF 08 6B 09 | Load from absolute long address into accumulator
    PHB                  ; 8B | Push data bank register to stack
    BPL $DD              ; 10 DD | Branch if positive
    BPL $C5              ; 10 C5 | Branch if positive
    CLI                  ; 58 | Clear interrupt disable flag
    LSR $FE09,X          ; 5E 09 FE | Logical shift right (absolute,X)
    SBC $10              ; E5 10 | Subtract with carry (zero page)
    ROR $90              ; 66 90 | Rotate right (zero page)
    ASL $70              ; 06 70 | Arithmetic shift left (zero page)
    STY $A422            ; 8C 22 A4 | Store Y register to absolute address
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_154
; Address: $E2CC3A
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_154:
    JSR $8004            ; 20 04 80 | Jump to subroutine
    BPL $C2              ; 10 C2 | Branch if positive
    BMI $67              ; 30 67 | Branch if negative
    ADC $A681,Y          ; 79 81 A6 | Add with carry (absolute,Y)
    ORA $5A60,X          ; 1D 60 5A | Logical OR with accumulator (absolute,X)
    CPY #$9B             ; C0 9B | Compare Y register (immediate)
    CPY $67              ; C4 67 | Compare Y register (zero page)
    BRA $00              ; 80 00 | Branch always
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank44_DmaFunction_155
; Address: $E2CC53
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_155:
    RTI                  ; 40 | Return from interrupt
    SEI                  ; 78 | Set interrupt disable flag
    BRA $33              ; 80 33 | Branch always
    INY                  ; C8 | Increment Y register
    ORA ($E2),Y          ; 11 E2 | Logical OR with accumulator ((zero page),Y)
    STA ($38,X)          ; 81 38 | Store accumulator to (zero page,X)
    ORA $20              ; 05 20 | Logical OR with accumulator (zero page)
    ORA ($AE,X)          ; 01 AE | Logical OR with accumulator ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank44_DmaFunction_156
; Address: $E2CC64
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_156:
    STA ($0B,X)          ; 81 0B | Store accumulator to (zero page,X)
    ORA #$85             ; 09 85 | Logical OR with accumulator (immediate)
    ORA ($DD,X)          ; 01 DD | Logical OR with accumulator ((zero page,X))
    BVS $EA              ; 70 EA | Branch if overflow set
    BPL $F2              ; 10 F2 | Branch if positive
    CPX #$16             ; E0 16 | Compare X register (immediate)
    BCC $06              ; 90 06 | Branch if carry clear
    BVS $44              ; 70 44 | Branch if overflow set
    STY $22              ; 84 22 | Store Y register to zero page
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    DEC $09              ; C6 09 | Decrement (zero page)
    ADC #$7A             ; 69 7A | Add with carry (immediate)
    STA $A4              ; 85 A4 | Store accumulator to zero page
    LSR $3204,X          ; 5E 04 32 | Logical shift right (absolute,X)
    PHY                  ; 5A | Push Y register to stack
    CMP ($D9,X)          ; C1 D9 | Compare accumulator ((zero page,X))
    LSR $67              ; 46 67 | Logical shift right (zero page)
    STY $02              ; 84 02 | Store Y register to zero page
    DEC                  ; 3A | Decrement accumulator
    RTI                  ; 40 | Return from interrupt
    ADC $3380,Y          ; 79 80 33 | Add with carry (absolute,Y)
    INY                  ; C8 | Increment Y register
    ORA ($E2),Y          ; 11 E2 | Logical OR with accumulator ((zero page),Y)
    STA ($3A,X)          ; 81 3A | Store accumulator to (zero page,X)
    LDY #$19             ; A0 19 | Load immediate value into Y register
    LDA $096B08          ; AF 08 6B 09 | Load from absolute long address into accumulator
    PHB                  ; 8B | Push data bank register to stack
    ORA ($DD),Y          ; 11 DD | Logical OR with accumulator ((zero page),Y)
    ORA ($D5,X)          ; 01 D5 | Logical OR with accumulator ((zero page,X))
    PLX                  ; FA | Pull X register from stack
    CPX #$E2             ; E0 E2 | Compare X register (immediate)
    SBC $10              ; E5 10 | Subtract with carry (zero page)
    ROR $90              ; 66 90 | Rotate right (zero page)
    ASL $70              ; 06 70 | Arithmetic shift left (zero page)
    STY $A422            ; 8C 22 A4 | Store Y register to absolute address
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND ($44,X)          ; 21 44 | Logical AND with accumulator ((zero page,X))
    ORA #$60             ; 09 60 | Logical OR with accumulator (immediate)
    ASL $19              ; 06 19 | Arithmetic shift left (zero page)
    SBC $79A6,X          ; FD A6 79 | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_157
; Address: $E2CCC4
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_157:
    PLX                  ; FA | Pull X register from stack
    EOR $58B7            ; 4D B7 58 | Exclusive OR with accumulator (absolute)
    ADC #$12             ; 69 12 | Add with carry (immediate)
    STA $76              ; 85 76 | Store accumulator to zero page
    SEC                  ; 38 | Set carry flag
    STY $00              ; 84 00 | Store Y register to zero page
    PHA                  ; 48 | Push accumulator to stack
    EOR $FF              ; 45 FF | Exclusive OR with accumulator (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    CPY $5DA7            ; CC A7 5D | Compare Y register (absolute)
    LDX $1A94            ; AE 94 1A | Load from absolute address into X register
    CMP $00B3,X          ; DD B3 00 | Compare accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank44_DmaFunction_158
; Address: $E2CCFC
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_158:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    DEC $7860            ; CE 60 78 | Decrement (absolute)
    RTI                  ; 40 | Return from interrupt
    EOR $81              ; 45 81 | Exclusive OR with accumulator (zero page)
    LDA $D202,X          ; BD 02 D2 | Load from absolute,X into accumulator
    BPL $98              ; 10 98 | Branch if positive
    ADC $10E1,Y          ; 79 E1 10 | Add with carry (absolute,Y)
    STX $01              ; 86 01 | Store X register to zero page
    EOR #$B2             ; 49 B2 | Exclusive OR with accumulator (immediate)
    ROL $9C40,X          ; 3E 40 9C | Rotate left (absolute,X)
    AND ($C1,X)          ; 21 C1 | Logical AND with accumulator ((zero page,X))
    STA ($66),Y          ; 91 66 | Store accumulator to (zero page),Y
    BPL $82              ; 10 82 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHY                  ; 5A | Push Y register to stack
    ADC ($21,X)          ; 61 21 | PPU graphics register access
    EOR ($79,X)          ; 41 79 | Exclusive OR with accumulator ((zero page,X))
    BRA $A4              ; 80 A4 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_159
; Address: $E2CD2D
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_159:
    NOP                  ; EA | No operation
    ASL $735A            ; 0E 5A 73 | Arithmetic shift left (absolute)
    STY $42              ; 84 42 | Hardware register operation
    LDA $98              ; A5 98 | Load from zero page into accumulator
    ASL $14              ; 06 14 | Arithmetic shift left (zero page)
    INY                  ; C8 | Increment Y register
    SEC                  ; 38 | Set carry flag
    STX $74              ; 86 74 | Store X register to zero page
    ORA #$14             ; 09 14 | Logical OR with accumulator (immediate)
    CPY #$21             ; C0 21 | PPU graphics register access
    EOR $B026            ; 4D 26 B0 | Exclusive OR with accumulator (absolute)
    ROR                  ; 6A | Rotate right (accumulator)
    STA $69              ; 85 69 | Store accumulator to zero page
    AND $715B            ; 2D 5B 71 | Logical AND with accumulator (absolute)
    SBC $0084            ; ED 84 00 | Subtract with carry (absolute)
    STA ($00),Y          ; 91 00 | Store accumulator to (zero page),Y

;------------------------------------------------------------------------------
; Bank44_DmaFunction_15A
; Address: $E2CD54
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_15A:
    PHA                  ; 48 | Push accumulator to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    BRA $00              ; 80 00 | Branch always
    TSX                  ; BA | Transfer stack pointer to X register
    STA ($5A),Y          ; 91 5A | Store accumulator to (zero page),Y
    CMP $7AAF            ; CD AF 7A | Compare accumulator (absolute)
    CMP $2A97,Y          ; D9 97 2A | Compare accumulator (absolute,Y)
    CMP ($59),Y          ; D1 59 | Compare accumulator ((zero page),Y)
    SBC $4B              ; E5 4B | Subtract with carry (zero page)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_15C
; Address: $E2CD76
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_15C:
    JSR $0400            ; 20 00 04 | Jump to subroutine
    LDX #$00             ; A2 00 | Load immediate value into X register
    PHA                  ; 48 | Push accumulator to stack
    BPL $00              ; 10 00 | Branch if positive
    EOR #$5E             ; 49 5E | Exclusive OR with accumulator (immediate)
    LDA $02              ; A5 02 | Load from zero page into accumulator
    LSR $3600,X          ; 5E 00 36 | Logical shift right (absolute,X)
    ORA $7A42,X          ; 1D 42 7A | Logical OR with accumulator (absolute,X)
    CMP $DD              ; C5 DD | Compare accumulator (zero page)
    LSR $66              ; 46 66 | Logical shift right (zero page)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    SEC                  ; 38 | Set carry flag
    RTI                  ; 40 | Return from interrupt
    ADC $3380,Y          ; 79 80 33 | Add with carry (absolute,Y)
    INY                  ; C8 | Increment Y register
    ORA ($E2),Y          ; 11 E2 | Logical OR with accumulator ((zero page),Y)
    STA ($3E,X)          ; 81 3E | Store accumulator to (zero page,X)
    LDA ($18,X)          ; A1 18 | Load from (zero page,X) into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank44_DmaFunction_15D
; Address: $E2CDA4
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_15D:
    STA ($0B,X)          ; 81 0B | Store accumulator to (zero page,X)
    EOR ($95),Y          ; 51 95 | Exclusive OR with accumulator ((zero page),Y)
    ORA ($D5,X)          ; 01 D5 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    PLX                  ; FA | Pull X register from stack
    BPL $D2              ; 10 D2 | Branch if positive
    SBC ($10,X)          ; E1 10 | Subtract with carry ((zero page,X))
    ROR $90              ; 66 90 | Rotate right (zero page)
    ASL $70              ; 06 70 | Arithmetic shift left (zero page)
    STY $A422            ; 8C 22 A4 | Store Y register to absolute address
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND ($04,X)          ; 21 04 | Logical AND with accumulator ((zero page,X))
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    ORA #$D6             ; 09 D6 | Logical OR with accumulator (immediate)
    ROR                  ; 6A | Rotate right (accumulator)
    SEC                  ; 38 | Set carry flag
    ORA $5D              ; 05 5D | Logical OR with accumulator (zero page)
    SED                  ; F8 | Set decimal mode flag
    LDA $10              ; A5 10 | Load from zero page into accumulator

;------------------------------------------------------------------------------
; Bank44_DmaFunction_15E
; Address: $E2CDC9
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_15E:
    LDA $BA28A5          ; AF A5 28 BA | Load from absolute long address into accumulator
    PHY                  ; 5A | Push Y register to stack
    PHP                  ; 08 | Push processor status to stack
    STA $00              ; 85 00 | Store accumulator to zero page
    LDX #$00             ; A2 00 | Load immediate value into X register
    LSR                  ; 4A | Logical shift right (accumulator)
    BVC $00              ; 50 00 | Branch if overflow clear
    PLX                  ; FA | Pull X register from stack
    ORA ($75),Y          ; 11 75 | Logical OR with accumulator ((zero page),Y)
    DEC $92              ; C6 92 | Decrement (zero page)
    JMP $E923            ; 4C 23 E9 | Jump to address
    JMP $9B25            ; 4C 25 9B | Jump to address
    DEC                  ; 3A | Decrement accumulator
    STA $465AF5          ; 8F F5 5A 46 | Store accumulator to absolute long address
    PLP                  ; 28 | Pull processor status from stack
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    BVC $00              ; 50 00 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank44_DmaFunction_15F
; Address: $E2CDFE
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_15F:
    JSR $FF00            ; 20 00 FF | Jump to subroutine
    LDY $E7              ; A4 E7 | Load from zero page into Y register
    LDA $FE9F,X          ; BD 9F FE | Load from absolute,X into accumulator
    INC $BEDD,X          ; FE DD BE | Increment (absolute,X)
    SBC $BB              ; E5 BB | Subtract with carry (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    SED                  ; F8 | Set decimal mode flag
    LDX $2F00,Y          ; BE 00 2F | Load from absolute,Y into X register
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    INC $C37E,X          ; FE 7E C3 | Increment (absolute,X)
    LDA $CD6F,X          ; BD 6F CD | Load from absolute,X into accumulator
    INC $77FF,X          ; FE FF 77 | Increment (absolute,X)
    DEC $00D0            ; CE D0 00 | Decrement (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA ($00),Y          ; B1 00 | Load from (zero page),Y into accumulator
    ORA $F600            ; 0D 00 F6 | Logical OR with accumulator (absolute)
    SBC $F753,X          ; FD 53 F7 | Subtract with carry (absolute,X)
    STZ $7DF6            ; 9C F6 7D | Store zero to absolute
    INC $FE33            ; EE 33 FE | Increment (absolute)
    LDA                  ; BF 45 AD DA | Load from absolute long,X into accumulator
    AND $00B5,X          ; 3D B5 00 | Logical AND with accumulator (absolute,X)
    LDX $8E00            ; AE 00 8E | Load from absolute address into X register
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    XBA                  ; EB | Exchange accumulator bytes
    SBC $FFA3,X          ; FD A3 FF | Subtract with carry (absolute,X)
    CMP #$FB             ; C9 FB | Compare accumulator (immediate)
    INC $BD              ; E6 BD | Increment (zero page)
    ROL $B9E7,X          ; 3E E7 B9 | Rotate left (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_161
; Address: $E2CE7A
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_161:
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    SEC                  ; 38 | Set carry flag
    ASL $39              ; 06 39 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    PLX                  ; FA | Pull X register from stack
    STA ($42,X)          ; 81 42 | Hardware register operation
    WDM #$2D             ; 42 2D | Reserved instruction
    CPY $7F00            ; CC 00 7F | Compare Y register (absolute)
    PHP                  ; 08 | Push processor status to stack
    BNE $08              ; D0 08 | Branch if not equal
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA ($00),Y          ; B1 00 | Load from (zero page),Y into accumulator
    ORA $F600            ; 0D 00 F6 | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    ADC $00              ; 65 00 | Add with carry (zero page)
    LDY $A518            ; AC 18 A5 | Load from absolute address into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_162
; Address: $E2CEA5
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_162:
    STA                  ; 9F 01 DE 41 | Store accumulator to absolute long,X
    STX $80              ; 86 80 | Store X register to zero page
    CPY #$37             ; C0 37 | Compare Y register (immediate)
    INC                  ; 1A | Increment accumulator
    LDA $D7              ; A5 D7 | Load from zero page into accumulator
    PHP                  ; 08 | Push processor status to stack
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    SED                  ; F8 | Set decimal mode flag
    LDX $2F00,Y          ; BE 00 2F | Load from absolute,Y into X register
    ADC ($04,X)          ; 61 04 | Add with carry ((zero page,X))
    ADC $8492            ; 6D 92 84 | Add with carry (absolute)
    LDA $00              ; A5 00 | Load from zero page into accumulator
    CMP $EA04            ; CD 04 EA | Compare accumulator (absolute)
    WDM #$B5             ; 42 B5 | Reserved instruction
    CMP ($26,X)          ; C1 26 | Compare accumulator ((zero page,X))
    LSR $99              ; 46 99 | Logical shift right (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_163
; Address: $E2CED4
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_163:
    CLD                  ; D8 | Clear decimal mode flag
    PLX                  ; FA | Pull X register from stack
    PHP                  ; 08 | Push processor status to stack
    BIT #$30             ; 89 30 | Test bits in accumulator (immediate)
    SEC                  ; 38 | Set carry flag
    CLI                  ; 58 | Clear interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    ORA #$F4             ; 09 F4 | Logical OR with accumulator (immediate)
    ORA ($62),Y          ; 11 62 | Logical OR with accumulator ((zero page),Y)
    ORA ($7A,X)          ; 01 7A | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    STA                  ; 9F 52 AC 00 | Store accumulator to absolute long,X
    AND $08B5,X          ; 3D B5 08 | Logical AND with accumulator (absolute,X)
    ORA ($72,X)          ; 01 72 | Logical OR with accumulator ((zero page,X))
    BRA $AE              ; 80 AE | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank44_DmaFunction_164
; Address: $E2CEF8
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_164:
    STX $2450            ; 8E 50 24 | Store X register to absolute address
    TXS                  ; 9A | Transfer X register to stack pointer
    ORA ($24,X)          ; 01 24 | Logical OR with accumulator ((zero page,X))
    ROR $D870,X          ; 7E 70 D8 | Rotate right (absolute,X)
    CPY #$A1             ; C0 A1 | Compare Y register (immediate)
    STA ($C7,X)          ; 81 C7 | Store accumulator to (zero page,X)
    LSR $381E,X          ; 5E 1E 38 | Logical shift right (absolute,X)
    SEC                  ; 38 | Set carry flag
    STA $003F00          ; 8F 00 3F 00 | Store accumulator to absolute long address
    ROR $7800,X          ; 7E 00 78 | Rotate right (absolute,X)
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    BPL $00              ; 10 00 | Branch if positive
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    SBC $F3F9,Y          ; F9 F9 F3 | Subtract with carry (absolute,Y)
    STA $78788F          ; 8F 8F 78 78 | Store accumulator to absolute long address
    CPX #$E0             ; E0 E0 | Game work RAM access
    STA                  ; 9F 9F F9 00 | Store accumulator to absolute long,X
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BVS $00              ; 70 00 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_165
; Address: $E2CF40
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_165:
    BVS $70              ; 70 70 | Branch if overflow set
    CMP ($C0,X)          ; C1 C0 | Compare accumulator ((zero page,X))
    STZ $779C            ; 9C 9C 77 | Store zero to absolute
    ORA $761C,X          ; 1D 1C 76 | Logical OR with accumulator (absolute,X)
    BVS $DC              ; 70 DC | Branch if overflow set
    CPY #$8F             ; C0 8F | Compare Y register (immediate)
    DEY                  ; 88 | Decrement Y register
    STA $003F00          ; 8F 00 3F 00 | Store accumulator to absolute long address
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    TXS                  ; 9A | Transfer X register to stack pointer
    CLC                  ; 18 | Clear carry flag
    BIT $00F9            ; 2C F9 00 | Test bits in accumulator (absolute)
    CPY $00              ; C4 00 | Compare Y register (zero page)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    ROR $D870,X          ; 7E 70 D8 | Rotate right (absolute,X)
    CPY #$A1             ; C0 A1 | Compare Y register (immediate)
    STA ($C7,X)          ; 81 C7 | Store accumulator to (zero page,X)
    LSR $381E,X          ; 5E 1E 38 | Logical shift right (absolute,X)
    SEC                  ; 38 | Set carry flag
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    STA $003F00          ; 8F 00 3F 00 | Store accumulator to absolute long address
    ROR $7800,X          ; 7E 00 78 | Rotate right (absolute,X)
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    PHB                  ; 8B | Push data bank register to stack
    LDA                  ; BF 3F 7E 7E | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank44_DmaFunction_166
; Address: $E2CFAA
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_166:
    SBC $8EF9,Y          ; F9 F9 8E | Subtract with carry (absolute,Y)
    STX $3838            ; 8E 38 38 | Store X register to absolute address
    CLC                  ; 18 | Clear carry flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SBC ($E1,X)          ; E1 E1 | Subtract with carry ((zero page,X))
    STA $FCFC8F          ; 8F 8F FC FC | Store accumulator to absolute long address
    ASL $7000,X          ; 1E 00 70 | Arithmetic shift left (absolute,X)
    CLV                  ; B8 | Clear overflow flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    INC $BDFE,X          ; FE FE BD | Increment (absolute,X)
    LDY $FCFF,X          ; BC FF FC | Load from absolute,X into Y register
    PLX                  ; FA | Pull X register from stack
    SED                  ; F8 | Set decimal mode flag
    SBC $73FA,X          ; FD FA 73 | Subtract with carry (absolute,X)
    CLC                  ; 18 | Clear carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA $90A800          ; 8F 00 A8 90 | Store accumulator to absolute long address
    LSR $FD20,X          ; 5E 20 FD | Logical shift right (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_167
; Address: $E2D008
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_167:
    STX $E300            ; 8E 00 E3 | Store X register to absolute address
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    JMP $A830            ; 4C 30 A8 | Jump to address
    RTI                  ; 40 | Return from interrupt
    PEA #$C100           ; F4 00 C1 | Push effective address to stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ADC $00              ; 65 00 | Add with carry (zero page)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    BCC $10              ; 90 10 | Branch if carry clear
    AND ($21,X)          ; 21 21 | PPU graphics register access
    STA                  ; 9F BC 3C EF | Store accumulator to absolute long,X
    DEC $0000,X          ; DE 00 00 | Decrement (absolute,X)
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ROR $F97E,X          ; 7E 7E F9 | Rotate right (absolute,X)
    SBC $F3F3,Y          ; F9 F3 F3 | Subtract with carry (absolute,Y)
    ROR $FE7E,X          ; 7E 7E FE | Rotate right (absolute,X)
    INC $00F8,X          ; FE F8 00 | Increment (absolute,X)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    CPX #$00             ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_168
; Address: $E2D07C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_168:
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA                  ; 9F 9F 77 77 | Store accumulator to absolute long,X
    INC $00EE            ; EE EE 00 | Increment (absolute)
    ORA $2800            ; 0D 00 28 | Logical OR with accumulator (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_169
; Address: $E2D09C
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_169:
    DEY                  ; 88 | Decrement Y register
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    BEQ $FD              ; F0 FD | Branch if equal
    SBC ($F6),Y          ; F1 F6 | Subtract with carry ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    INC $0FFE,X          ; FE FE 0F | Increment (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA ($0E,X)          ; 81 0E | Store accumulator to (zero page,X)
    CLC                  ; 18 | Clear carry flag
    DEC $7820,X          ; DE 20 78 | Decrement (absolute,X)
    LDA ($40,X)          ; A1 40 | Load from (zero page,X) into accumulator
    TAX                  ; AA | Transfer accumulator to X register
    ORA ($77,X)          ; 01 77 | Logical OR with accumulator ((zero page,X))
    CPY $9000            ; CC 00 90 | Compare Y register (absolute)
    ADC $E001,Y          ; 79 01 E0 | Game work RAM access
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    INC $E000,X          ; FE 00 E0 | Game work RAM access
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_16A
; Address: $E2D10A
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_16A:
    CPY $B90C            ; CC 0C B9 | Compare Y register (absolute)
    SEC                  ; 38 | Set carry flag
    CPX #$E0             ; E0 E0 | Game work RAM access
    STA                  ; 9F 00 FC 00 | Store accumulator to absolute long,X
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ROR $F97E,X          ; 7E 7E F9 | Rotate right (absolute,X)
    SBC $8E8E,Y          ; F9 8E 8E | Subtract with carry (absolute,Y)
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    SBC ($E1,X)          ; E1 E1 | Subtract with carry ((zero page,X))
    STA                  ; 9F 9F FC FC | Store accumulator to absolute long,X
    ASL $6000,X          ; 1E 00 60 | Arithmetic shift left (absolute,X)
    LDY $F000,X          ; BC 00 F0 | Load from absolute,X into Y register
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank44_DmaFunction_16B
; Address: $E2D162
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_16B:
    SBC $FFFD,X          ; FD FD FF | Subtract with carry (absolute,X)
    SBC $EFF9,Y          ; F9 F9 EF | Subtract with carry (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BPL $00              ; 10 00 | Branch if positive
    STA                  ; 9F 80 E6 E0 | Store accumulator to absolute long,X
    SBC $FCF8,Y          ; F9 F8 FC | Subtract with carry (absolute,Y)
    LDA                  ; BF BF 7B 7B | Load from absolute long,X into accumulator
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    STY $00              ; 84 00 | Store Y register to zero page
    CLC                  ; 18 | Clear carry flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CMP $04              ; C5 04 | Compare accumulator (zero page)
    ROL $40              ; 26 40 | Rotate left (zero page)
    ORA #$70             ; 09 70 | Logical OR with accumulator (immediate)
    INC $FB00,X          ; FE 00 FB | Increment (absolute,X)
    EOR $1B41            ; 4D 41 1B | Exclusive OR with accumulator (absolute)
    LDX $FC00,Y          ; BE 00 FC | Load from absolute,Y into X register
    BEQ $00              ; F0 00 | Branch if equal
    CLD                  ; D8 | Clear decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    LDY #$00             ; A0 00 | Load immediate value into Y register
    SBC $F3FD,X          ; FD FD F3 | Subtract with carry (absolute,X)
    ROR $FE7E,X          ; 7E 7E FE | Rotate right (absolute,X)
    INC $00F8,X          ; FE F8 00 | Increment (absolute,X)
    BRA $00              ; 80 00 | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC $F0FE,X          ; FE FE F0 | Increment (absolute,X)
    BEQ $CF              ; F0 CF | Branch if equal
    INC $01EE            ; EE EE 01 | Increment (absolute)
    BMI $00              ; 30 00 | Branch if negative
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    PHB                  ; 8B | Push data bank register to stack
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    STA $FFFF8F          ; 8F 8F FF FF | Store accumulator to absolute long address
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BVS $00              ; 70 00 | Branch if overflow set
    BRA $00              ; 80 00 | Branch always
    INC $ECEF,X          ; FE EF EC | Increment (absolute,X)
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    INC $E5FE,X          ; FE FE E5 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_16C
; Address: $E2D24B
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_16C:
    CPX $DE              ; E4 DE | Compare X register (zero page)
    CMP $BABD,X          ; DD BD BA | Compare accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF 40 FD 00 | Load from absolute long,X into accumulator
    ORA $6300,Y          ; 19 00 63 | Logical OR with accumulator (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    STA ($11),Y          ; 91 11 | Store accumulator to (zero page),Y
    CLC                  ; 18 | Clear carry flag
    SEP #$00             ; E2 00 | Set processor status bits
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    INC $00              ; E6 00 | Increment (zero page)
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    INC $FC00            ; EE 00 FC | Increment (absolute)
    STX $86              ; 86 86 | Store X register to zero page
    ADC $1379,Y          ; 79 79 13 | Add with carry (absolute,Y)
    LDA                  ; BF 3F 3E 3E | Load from absolute long,X into accumulator
    ROR $797E,X          ; 7E 7E 79 | Rotate right (absolute,X)
    STX $00              ; 86 00 | Store X register to zero page
    CPX $E800            ; EC 00 E8 | Compare X register (absolute)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SBC ($E1,X)          ; E1 E1 | Subtract with carry ((zero page,X))
    STA $FCFC8F          ; 8F 8F FC FC | Store accumulator to absolute long address
    ASL $7000,X          ; 1E 00 70 | Arithmetic shift left (absolute,X)
    LDY $F000,X          ; BC 00 F0 | Load from absolute,X into Y register
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA $3B1D,X          ; 1D 1D 3B | Logical OR with accumulator (absolute,X)
    SBC $83F9,Y          ; F9 F9 83 | Subtract with carry (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    SEP #$00             ; E2 00 | Set processor status bits
    CPY $00              ; C4 00 | Compare Y register (zero page)
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BEQ $9C              ; F0 9C | Branch if equal
    CPY #$E7             ; C0 E7 | Compare Y register (immediate)
    CPX #$6C             ; E0 6C | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_16D
; Address: $E2D30A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_16D:
    BNE $C0              ; D0 C0 | Branch if not equal
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$0F             ; C0 0F | Compare Y register (immediate)
    STA                  ; 9F 00 3F 00 | Store accumulator to absolute long,X
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_16E
; Address: $E2D324
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_16E:
    INC $00              ; E6 00 | Increment (zero page)
    CPY $0100            ; CC 00 01 | Compare Y register (absolute)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BVS $00              ; 70 00 | Branch if overflow set
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    ORA $6301,Y          ; 19 01 63 | Logical OR with accumulator (absolute,Y)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    LDA ($01),Y          ; B1 01 | Load from (zero page),Y into accumulator
    ADC ($01,X)          ; 61 01 | Add with carry ((zero page,X))
    CMP $FF0D            ; CD 0D FF | Compare accumulator (absolute)
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BVS $70              ; 70 70 | Branch if overflow set
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    STA $BE1F1F          ; 8F 1F 1F BE | Store accumulator to absolute long address
    ROL $7474,X          ; 3E 74 74 | Rotate left (absolute,X)
    STA $003F00          ; 8F 00 3F 00 | Store accumulator to absolute long address
    BVS $00              ; 70 00 | Branch if overflow set
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    PHB                  ; 8B | Push data bank register to stack
    BPL $00              ; 10 00 | Branch if positive
    SBC $E7F9,Y          ; F9 F9 E7 | Subtract with carry (absolute,Y)
    ASL $FF1E,X          ; 1E 1E FF | Arithmetic shift left (absolute,X)
    INC $FCFC,X          ; FE FC FC | Increment (absolute,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    BPL $00              ; 10 00 | Branch if positive
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CMP ($CE,X)          ; C1 CE | Compare accumulator ((zero page,X))
    CLD                  ; D8 | Clear decimal mode flag
    DEC $B8E0,X          ; DE E0 B8 | Decrement (absolute,X)
    BRA $21              ; 80 21 | PPU graphics register access
    RTI                  ; 40 | Return from interrupt
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($97,X)          ; 01 97 | Logical OR with accumulator ((zero page,X))
    BRA $3F              ; 80 3F | Branch always
    DEC $00              ; C6 00 | Decrement (zero page)
    STY $04              ; 84 04 | Store Y register to zero page
    BPL $6C              ; 10 6C | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_16F
; Address: $E2D3C8
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_16F:
    SEI                  ; 78 | Set interrupt disable flag
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    STA ($01,X)          ; 81 01 | Store accumulator to (zero page,X)
    STA                  ; 9F 00 FF 00 | Store accumulator to absolute long,X
    INC $F800,X          ; FE 00 F8 | Increment (absolute,X)
    ORA ($13),Y          ; 11 13 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_170
; Address: $E2D3E4
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_170:
    BIT $04              ; 24 04 | Test bits in accumulator (zero page)
    AND ($01,X)          ; 21 01 | Logical AND with accumulator ((zero page,X))
    STA $F419,Y          ; 99 19 F4 | Store accumulator to absolute,Y
    PEA #$F9F9           ; F4 F9 F9 | Push effective address to stack
    INC $FC00            ; EE 00 FC | Increment (absolute)
    INC $F800,X          ; FE 00 F8 | Increment (absolute,X)
    INC $00              ; E6 00 | Increment (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BEQ $F0              ; F0 F0 | Branch if equal
    SBC ($E1,X)          ; E1 E1 | Subtract with carry ((zero page,X))
    STA $FEFE8F          ; 8F 8F FE FE | Store accumulator to absolute long address
    STA                  ; 9F 1F 3C 3C | Store accumulator to absolute long,X
    ASL $7000,X          ; 1E 00 70 | Arithmetic shift left (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDY $F000,X          ; BC 00 F0 | Load from absolute,X into Y register
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SBC $E2F9,Y          ; F9 F9 E2 | Subtract with carry (absolute,Y)
    SEP #$8F             ; E2 8F | Set processor status bits
    STA $F97E7E          ; 8F 7E 7E F9 | Store accumulator to absolute long address
    SBC $FCFC,Y          ; F9 FC FC | Subtract with carry (absolute,Y)
    SBC ($E0,X)          ; E1 E0 | Game work RAM access
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA $7000,X          ; 1D 00 70 | Logical OR with accumulator (absolute,X)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    STA $809E80          ; 8F 80 9E 80 | Store accumulator to absolute long address
    BVS $00              ; 70 00 | Branch if overflow set
    LDY $F080,X          ; BC 80 F0 | Load from absolute,X into Y register
    PHB                  ; 8B | Push data bank register to stack
    INC $7FFE,X          ; FE FE 7F | Increment (absolute,X)
    PEA #$0100           ; F4 00 01 | Push effective address to stack
    SEC                  ; 38 | Set carry flag
    EOR ($41),Y          ; 51 41 | Exclusive OR with accumulator ((zero page),Y)
    BEQ $F0              ; F0 F0 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_171
; Address: $E2D46C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_171:
    STX $86              ; 86 86 | Store X register to zero page
    LDX $FC00,Y          ; BE 00 FC | Load from absolute,Y into X register
    STA                  ; 9F 00 79 00 | Store accumulator to absolute long,X
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank44_DmaFunction_172
; Address: $E2D492
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_172:
    JSR $1C00            ; 20 00 1C | Jump to subroutine
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ORA $E01F,Y          ; 19 1F E0 | Game work RAM access
    INC $0001,X          ; FE 01 00 | Increment (absolute,X)
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    SBC ($F1,X)          ; E1 F1 | Subtract with carry ((zero page,X))
    DEC $D3FF            ; CE FF D3 | Decrement (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_175
; Address: $E2D509
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_175:
    BEQ $F0              ; F0 F0 | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    CLV                  ; B8 | Clear overflow flag
    JMP $E13E            ; 4C 3E E1 | Jump to address
    BEQ $00              ; F0 00 | Branch if equal
    CLV                  ; B8 | Clear overflow flag
    ROL $0000,X          ; 3E 00 00 | Rotate left (absolute,X)
    CPY $07              ; C4 07 | Compare Y register (zero page)
    ORA ($81,X)          ; 01 81 | Logical OR with accumulator ((zero page,X))
    ASL $CE00            ; 0E 00 CE | Arithmetic shift left (absolute)
    INC $00FF,X          ; FE FF 00 | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    ASL $DDC1,X          ; 1E C1 DD | Arithmetic shift left (absolute,X)
    BVS $0F              ; 70 0F | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    ROL $3C00,X          ; 3E 00 3C | Rotate left (absolute,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$C1             ; C0 C1 | Compare Y register (immediate)
    CPX #$E1             ; E0 E1 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPY $F1F1            ; CC F1 F1 | Compare Y register (absolute)
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    STA                  ; 9F 00 BE 00 | Store accumulator to absolute long,X
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    BEQ $FC              ; F0 FC | Branch if equal
    INC $3E00,X          ; FE 00 3E | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    BMI $0F              ; 30 0F | Branch if negative
    BIT $BF              ; 24 BF | Test bits in accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    LSR $B9              ; 46 B9 | Logical shift right (zero page)
    BMI $CF              ; 30 CF | Branch if negative
    LDA                  ; BF 00 EF 00 | Load from absolute long,X into accumulator
    LSR $00              ; 46 00 | Logical shift right (zero page)
    BMI $00              ; 30 00 | Branch if negative
    INC $F811,X          ; FE 11 F8 | Increment (absolute,X)
    ADC $CAFF            ; 6D FF CA | Add with carry (absolute)
    PEA #$6C9C           ; F4 9C 6C | Push effective address to stack
    SEC                  ; 38 | Set carry flag
    INY                  ; C8 | Increment Y register
    SEC                  ; 38 | Set carry flag
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank44_DmaFunction_176
; Address: $E2D5D0
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_176:
    INC $F800,X          ; FE 00 F8 | Increment (absolute,X)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    ADC ($9E,X)          ; 61 9E | Add with carry ((zero page,X))
    ORA $E1E6,Y          ; 19 E6 E1 | Logical OR with accumulator (absolute,Y)
    ASL $00FF,X          ; 1E FF 00 | Arithmetic shift left (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BCS $FE              ; B0 FE | Branch if carry set
    AND $3DFE,X          ; 3D FE 3D | Logical AND with accumulator (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_177
; Address: $E2D5F6
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_177:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDX $C761,Y          ; BE 61 C7 | Load from absolute,Y into X register
    SEC                  ; 38 | Set carry flag
    BPL $FF              ; 10 FF | Branch if positive
    STY $D02F            ; 8C 2F D0 | Store Y register to absolute address
    BNE $3E              ; D0 3E | Branch if not equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_178
; Address: $E2D622
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_178:
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $F0              ; 80 F0 | Branch always

;------------------------------------------------------------------------------
; Bank44_DmaFunction_179
; Address: $E2D629
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_179:
    JSR $EBF7            ; 20 F7 EB | Jump to subroutine
    INY                  ; C8 | Increment Y register
    STZ $0000            ; 9C 00 00 | Store zero to absolute
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    STA $00FF76          ; 8F 76 FF 00 | Store accumulator to absolute long address
    BEQ $0F              ; F0 0F | Branch if equal
    CLD                  ; D8 | Clear decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    CLD                  ; D8 | Clear decimal mode flag
    CPX #$E0             ; E0 E0 | Game work RAM access
    BPL $F4              ; 10 F4 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    INC $67D0,X          ; FE D0 67 | Increment (absolute,X)
    TYA                  ; 98 | Transfer Y register to accumulator
    SBC $00              ; E5 00 | Subtract with carry (zero page)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_17A
; Address: $E2D687
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_17A:
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    BVS $0F              ; 70 0F | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    SED                  ; F8 | Set decimal mode flag
    ROR $FD81,X          ; 7E 81 FD | Rotate right (absolute,X)
    SBC $FFE2,X          ; FD E2 FF | Subtract with carry (absolute,X)
    INC $3B              ; E6 3B | Increment (zero page)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_17B
; Address: $E2D6AF
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_17B:
    CPY $00              ; C4 00 | Compare Y register (zero page)
    ROR $FC00,X          ; 7E 00 FC | Rotate right (absolute,X)
    SBC $F300,X          ; FD 00 F3 | Subtract with carry (absolute,X)
    BRA $AE              ; 80 AE | Branch always
    EOR ($7C),Y          ; 51 7C | Exclusive OR with accumulator ((zero page),Y)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    LSR $FF              ; 46 FF | Logical shift right (zero page)
    DEC $1AFD            ; CE FD 1A | Decrement (absolute)
    DEC $00F1            ; CE F1 00 | Decrement (absolute)
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    DEC $8000            ; CE 00 80 | Decrement (absolute)
    BEQ $F3              ; F0 F3 | Branch if equal
    JMP ($BFF8)          ; 6C F8 BF | Jump to address (absolute indirect)
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    PEA #$FFE6           ; F4 E6 FF | Push effective address to stack
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    BEQ $0F              ; F0 0F | Branch if equal
    DEC $7F21,X          ; DE 21 7F | Decrement (absolute,X)
    BRA $3C              ; 80 3C | Branch always
    EOR #$0F             ; 49 0F | Exclusive OR with accumulator (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    ASL $7F00,X          ; 1E 00 7F | Arithmetic shift left (absolute,X)
    BCS $00              ; B0 00 | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_17C
; Address: $E2D726
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_17C:
    BMI $3F              ; 30 3F | Branch if negative
    STA $00C500          ; 8F 00 C5 00 | Store accumulator to absolute long address
    STA                  ; 9F 00 CF 00 | Store accumulator to absolute long,X
    STY $7373            ; 8C 73 73 | Store Y register to absolute address
    ORA ($EF,X)          ; 01 EF | Logical OR with accumulator ((zero page,X))
    ORA ($3C,X)          ; 01 3C | Logical OR with accumulator ((zero page,X))
    ORA ($BD,X)          ; 01 BD | Logical OR with accumulator ((zero page,X))
    ORA ($9D,X)          ; 01 9D | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    STY $9C00            ; 8C 00 9C | Store Y register to absolute address
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    ORA ($E1,X)          ; 01 E1 | Logical OR with accumulator ((zero page,X))
    BRA $FC              ; 80 FC | Branch always
    CPY #$FC             ; C0 FC | Compare Y register (immediate)
    BEQ $FD              ; F0 FD | Branch if equal
    INC $001F,X          ; FE 1F 00 | Increment (absolute,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    INC $7F00,X          ; FE 00 7F | Increment (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank44_DmaFunction_17D
; Address: $E2D780
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_17D:
    BEQ $F7              ; F0 F7 | Branch if equal
    CPY #$CF             ; C0 CF | Compare Y register (immediate)
    CPY #$CF             ; C0 CF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_17E
; Address: $E2D788
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_17E:
    JSR $002F            ; 20 2F 00 | Jump to subroutine
    STA                  ; 9F 00 B9 00 | Store accumulator to absolute long,X
    CLD                  ; D8 | Clear decimal mode flag
    BIT $E7              ; 24 E7 | Test bits in accumulator (zero page)
    SBC $99E1,Y          ; F9 E1 99 | Subtract with carry (absolute,Y)
    STA $F8F8,Y          ; 99 F8 F8 | Store accumulator to absolute,Y
    SBC ($E6,X)          ; E1 E6 | Subtract with carry ((zero page,X))
    CMP ($DE,X)          ; C1 DE | Compare accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ROR $00              ; 66 00 | Rotate right (zero page)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank44_DmaFunction_17F
; Address: $E2D7BC
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_17F:
    JSR $0600            ; 20 00 06 | Jump to subroutine
    SBC $FB09,Y          ; F9 09 FB | Subtract with carry (absolute,Y)
    DEX                  ; CA | Decrement X register
    BVS $70              ; 70 70 | Branch if overflow set
    BVS $70              ; 70 70 | Branch if overflow set
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    STA $008F00          ; 8F 00 8F 00 | Store accumulator to absolute long address
    INC $16F7            ; EE F7 16 | Increment (absolute)
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    BMI $EF              ; 30 EF | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    INC $E001,X          ; FE 01 E0 | Game work RAM access
    BCS $FF              ; B0 FF | Branch if carry set
    LDA $BFFF,Y          ; B9 FF BF | Load from absolute,Y into accumulator
    CPX #$18             ; E0 18 | Compare X register (immediate)
    CPY $6033            ; CC 33 60 | Compare Y register (absolute)
    LDA                  ; BF F7 08 CB | Load from absolute long,X into accumulator
    PHP                  ; 08 | Push processor status to stack
    BIT $E7              ; 24 E7 | Test bits in accumulator (zero page)
    TXS                  ; 9A | Transfer X register to stack pointer
    LSR $00              ; 46 00 | Logical shift right (zero page)
    CLC                  ; 18 | Clear carry flag
    BRA $00              ; 80 00 | Branch always
    ROR $FF81,X          ; 7E 81 FF | Rotate right (absolute,X)
    DEC                  ; 3A | Decrement accumulator
    SBC $3D75,X          ; FD 75 3D | Subtract with carry (absolute,X)
    CMP $0FFF            ; CD FF 0F | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_180
; Address: $E2D852
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_180:
    SED                  ; F8 | Set decimal mode flag
    CPX #$1E             ; E0 1E | Compare X register (immediate)
    INC $F800,X          ; FE 00 F8 | Increment (absolute,X)
    STY $FC              ; 84 FC | Store Y register to zero page
    BCS $FD              ; B0 FD | Branch if carry set
    AND $EF7D,X          ; 3D 7D EF | Logical AND with accumulator (absolute,X)
    SBC ($13),Y          ; F1 13 | Subtract with carry ((zero page),Y)
    CPX #$E6             ; E0 E6 | Compare X register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $1F00            ; 0E 00 1F | Arithmetic shift left (absolute)
    CLI                  ; 58 | Clear interrupt disable flag
    ADC ($FF),Y          ; 71 FF | Add with carry ((zero page),Y)
    INC $E0DF            ; EE DF E0 | Game work RAM access
    LDX $F0C1,Y          ; BE C1 F0 | Load from absolute,Y into X register
    INY                  ; C8 | Increment Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    BRA $00              ; 80 00 | Branch always
    SBC $F946,Y          ; F9 46 F9 | Subtract with carry (absolute,Y)
    STX $FF              ; 86 FF | Store X register to zero page
    BRA $FF              ; 80 FF | Branch always
    STA $CC3F70          ; 8F 70 3F CC | Store accumulator to absolute long address
    DEC $0001            ; CE 01 00 | Decrement (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    AND $39C6,Y          ; 39 C6 39 | Logical AND with accumulator (absolute,Y)
    DEC $1B              ; C6 1B | Decrement (zero page)
    SBC $FA              ; E5 FA | Subtract with carry (zero page)
    DEC                  ; 3A | Decrement accumulator
    SEC                  ; 38 | Set carry flag
    CLD                  ; D8 | Clear decimal mode flag
    LDY $6EEE,X          ; BC EE 6E | Load from absolute,X into Y register
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    INC $FEE0,X          ; FE E0 FE | Increment (absolute,X)
    CPX #$6E             ; E0 6E | Compare X register (immediate)
    BVS $72              ; 70 72 | Branch if overflow set
    ADC $6D72            ; 6D 72 6D | Add with carry (absolute)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))
    STZ $DF              ; 64 DF | Store zero to zero page
    STZ $7F              ; 64 7F | Store zero to zero page
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank44_DmaFunction_181
; Address: $E2D911
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_181:
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    ADC $7D7C,Y          ; 79 7C 7D | Add with carry (absolute,Y)
    JMP ($B838)          ; 6C 38 B8 | Jump to address (absolute indirect)
    BPL $D0              ; 10 D0 | Branch if positive
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_182
; Address: $E2D941
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_182:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    LDX $7C00,Y          ; BE 00 7C | Load from absolute,Y into X register
    SEI                  ; 78 | Set interrupt disable flag
    JMP ($009F)          ; 6C 9F 00 | Jump to address (absolute indirect)
    INC $041F,X          ; FE 1F 04 | Increment (absolute,X)
    ORA ($39,X)          ; 01 39 | Logical OR with accumulator ((zero page,X))
    ASL $0E00            ; 0E 00 0E | Arithmetic shift left (absolute)
    ROL $0001,X          ; 3E 01 00 | Rotate left (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    ASL $DCC0,X          ; 1E C0 DC | Arithmetic shift left (absolute,X)
    CPY #$DC             ; C0 DC | Compare Y register (immediate)
    ASL $3E00,X          ; 1E 00 3E | Arithmetic shift left (absolute,X)
    ROR $FD00,X          ; 7E 00 FD | Rotate right (absolute,X)
    STA $639C,X          ; 9D 9C 63 | Store accumulator to absolute,X
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    STX $3F71            ; 8E 71 3F | Store X register to absolute address
    INY                  ; C8 | Increment Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_185
; Address: $E2D9C0
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_185:
    JSR $10C0            ; 20 C0 10 | Jump to subroutine
    SBC ($80),Y          ; F1 80 | Subtract with carry ((zero page),Y)
    CPY $F933            ; CC 33 F9 | Compare Y register (absolute)
    ASL $79              ; 06 79 | Arithmetic shift left (zero page)
    STX $E2              ; 86 E2 | Store X register to zero page
    ORA $14FB,X          ; 1D FB 14 | Logical OR with accumulator (absolute,X)
    BRA $00              ; 80 00 | Branch always
    CPY $F900            ; CC 00 F9 | Compare Y register (absolute)
    ADC $0200,Y          ; 79 00 02 | Add with carry (absolute,Y)
    LDY $5B              ; A4 5B | Load from zero page into Y register
    SBC $F906,X          ; FD 06 F9 | Subtract with carry (absolute,X)
    LDA ($4E),Y          ; B1 4E | Load from (zero page),Y into accumulator
    LDA ($4E),Y          ; B1 4E | Load from (zero page),Y into accumulator

;------------------------------------------------------------------------------
; Bank44_DmaFunction_187
; Address: $E2D9F2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_187:
    JSR $0200            ; 20 00 02 | Jump to subroutine
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank44_DmaFunction_188
; Address: $E2DA00
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_188:
    BRA $7E              ; 80 7E | Branch always
    SBC #$2F             ; E9 2F | Subtract with carry (immediate)
    STA $C3C3C3          ; 8F C3 C3 C3 | Store accumulator to absolute long address
    JMP ($0001)          ; 6C 01 00 | Jump to address (absolute indirect)
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank44_DmaFunction_189
; Address: $E2DA14
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_189:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $00              ; F0 00 | Branch if equal
    ADC $7848            ; 6D 48 78 | Add with carry (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    PHA                  ; 48 | Push accumulator to stack
    BVS $50              ; 70 50 | Branch if overflow set
    SBC ($F1),Y          ; F1 F1 | Subtract with carry ((zero page),Y)
    SBC ($70),Y          ; F1 70 | Subtract with carry ((zero page),Y)
    INC                  ; 1A | Increment accumulator
    STA $000E00          ; 8F 00 0E 00 | Store accumulator to absolute long address
    ASL $0400            ; 0E 00 04 | Arithmetic shift left (absolute)
    SBC $49FD,X          ; FD FD 49 | Subtract with carry (absolute,X)
    EOR #$7B             ; 49 7B | Exclusive OR with accumulator (immediate)
    INC $E0FF,X          ; FE FF E0 | Game work RAM access
    INC $2F01,X          ; FE 01 2F | Increment (absolute,X)
    REP #$00             ; C2 00 | Reset processor status bits
    STY $00              ; 84 00 | Store Y register to zero page
    BPL $80              ; 10 80 | Branch if positive
    STX $9E              ; 86 9E | Store X register to zero page
    PHP                  ; 08 | Push processor status to stack
    BRA $7F              ; 80 7F | Branch always
    BIT $DB              ; 24 DB | Test bits in accumulator (zero page)
    SBC $39C6,X          ; FD C6 39 | Subtract with carry (absolute,X)
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank44_DmaFunction_18A
; Address: $E2DA7A
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_18A:
    JSR $0200            ; 20 00 02 | Jump to subroutine
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    LDA $1BE4,Y          ; B9 E4 1B | Load from absolute,Y into accumulator
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    INX                  ; E8 | Increment X register
    STX $0000            ; 8E 00 00 | Store X register to absolute address
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank44_DmaFunction_18B
; Address: $E2DA9C
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_18B:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    SBC $E12D            ; ED 2D E1 | Subtract with carry (absolute)
    AND ($F0,X)          ; 21 F0 | Logical AND with accumulator ((zero page,X))
    BPL $F8              ; 10 F8 | Branch if positive
    INY                  ; C8 | Increment Y register
    CPY $EFF0            ; CC F0 EF | Compare Y register (absolute)
    CPX $0003            ; EC 03 00 | Compare X register (absolute)
    ASL $0F00,X          ; 1E 00 0F | Arithmetic shift left (absolute,X)
    SBC ($F0),Y          ; F1 F0 | Subtract with carry ((zero page),Y)
    SBC ($E0,X)          ; E1 E0 | Game work RAM access
    SBC ($E1,X)          ; E1 E1 | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank44_DmaFunction_18C
; Address: $E2DAC6
; Size: 109 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_18C:
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    CMP ($21),Y          ; D1 21 | PPU graphics register access
    ASL $1E00            ; 0E 00 1E | Arithmetic shift left (absolute)
    ASL $FE00,X          ; 1E 00 FE | Arithmetic shift left (absolute,X)
    ROL $CE00,X          ; 3E 00 CE | Rotate left (absolute,X)
    ROL $FFFF,X          ; 3E FF FF | Rotate left (absolute,X)
    ROL $3F3E,X          ; 3E 3E 3F | Rotate left (absolute,X)
    INC $00E1,X          ; FE E1 00 | Increment (absolute,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$0F             ; C0 0F | Compare Y register (immediate)
    ASL $0E0F            ; 0E 0F 0E | Arithmetic shift left (absolute)
    SBC $FDC2,X          ; FD C2 FD | Subtract with carry (absolute,X)
    REP #$C3             ; C2 C3 | Reset processor status bits
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    STA $009F00          ; 8F 00 9F 00 | Store accumulator to absolute long address
    LDA $C000,Y          ; B9 00 C0 | Load from absolute,Y into accumulator
    INC $FF              ; E6 FF | Increment (zero page)
    CMP $F170            ; CD 70 F1 | Compare accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    WDM #$00             ; 42 00 | Reserved instruction
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ROL $BC00            ; 2E 00 BC | Rotate left (absolute)
    INC $00FF,X          ; FE FF 00 | Increment (absolute,X)
    STA $00BF00          ; 8F 00 BF 00 | Store accumulator to absolute long address
    LDX $0FFF            ; AE FF 0F | Load from absolute address into X register
    LDX $C7              ; A6 C7 | Load from zero page into X register
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SBC $8702,X          ; FD 02 87 | Subtract with carry (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    SBC ($FE,X)          ; E1 FE | Subtract with carry ((zero page,X))
    INC $90              ; E6 90 | Increment (zero page)
    BCC $C0              ; 90 C0 | Branch if carry clear
    RTI                  ; 40 | Return from interrupt
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C1             ; C0 C1 | Compare Y register (immediate)
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank44_DmaFunction_18D
; Address: $E2DBE0
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_18D:
    STA $1E1F8F          ; 8F 8F 1F 1E | Store accumulator to absolute long address
    JMP ($6C0C)          ; 6C 0C 6C | Jump to address (absolute indirect)
    PHP                  ; 08 | Push processor status to stack
    SBC #$00             ; E9 00 | Subtract with carry (immediate)
    BVS $00              ; 70 00 | Branch if overflow set
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    STX $8E0F            ; 8E 0F 8E | Store X register to absolute address
    STY $07              ; 84 07 | Store Y register to zero page
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    DEC $FF5D,X          ; DE 5D FF | Decrement (absolute,X)
    STA $03038F          ; 8F 8F 03 03 | Store accumulator to absolute long address
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    DEC $B8FF            ; CE FF B8 | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_18E
; Address: $E2DC30
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_18E:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BVS $00              ; 70 00 | Branch if overflow set
    ROR $3000,X          ; 7E 00 30 | Rotate right (absolute,X)
    STX $EB              ; 86 EB | Store X register to zero page
    PHB                  ; 8B | Push data bank register to stack
    SBC ($21,X)          ; E1 21 | PPU graphics register access
    CMP ($E1,X)          ; C1 E1 | Compare accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BPL $1C              ; 10 1C | Branch if positive
    ASL $3E00,X          ; 1E 00 3E | Arithmetic shift left (absolute,X)
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    PEA #$98E4           ; F4 E4 98 | Push effective address to stack
    SED                  ; F8 | Set decimal mode flag
    CMP #$00             ; C9 00 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_18F
; Address: $E2DC76
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_18F:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    REP #$87             ; C2 87 | Reset processor status bits
    JMP ($0307)          ; 6C 07 03 | Jump to address (absolute indirect)
    STX $8407            ; 8E 07 84 | Store X register to absolute address
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPX $C0CF            ; EC CF C0 | Compare X register (absolute)
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    DEC $0003,X          ; DE 03 00 | Decrement (absolute,X)
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_190
; Address: $E2DCB8
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_190:
    ROL $1C00,X          ; 3E 00 1C | Rotate left (absolute,X)
    CMP ($21),Y          ; D1 21 | PPU graphics register access
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    INC $D9              ; E6 D9 | Increment (zero page)
    SBC $E112            ; ED 12 E1 | Subtract with carry (absolute)
    ASL $00FF,X          ; 1E FF 00 | Arithmetic shift left (absolute,X)
    DEC $0000            ; CE 00 00 | Decrement (absolute)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    STY $7F73            ; 8C 73 7F | Store Y register to absolute address
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    ASL $3FFF            ; 0E FF 3F | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STY $0000            ; 8C 00 00 | Store Y register to absolute address
    ORA $1EED,X          ; 1D ED 1E | Logical OR with accumulator (absolute,X)
    INC $23DF            ; EE DF 23 | Increment (absolute)
    CPY #$CF             ; C0 CF | Compare Y register (immediate)
    BEQ $13              ; F0 13 | Branch if equal
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($61,X)          ; 01 61 | Logical OR with accumulator ((zero page,X))
    EOR ($41,X)          ; 41 41 | Exclusive OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_192
; Address: $E2DD28
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_192:
    BVS $70              ; 70 70 | Branch if overflow set
    BVS $70              ; 70 70 | Branch if overflow set
    BMI $30              ; 30 30 | Branch if negative
    ORA $FC19,Y          ; 19 19 FC | Logical OR with accumulator (absolute,Y)
    INC $BE00,X          ; FE 00 BE | Increment (absolute,X)
    STA                  ; 9F 00 8F 00 | Store accumulator to absolute long,X
    STA $00CF00          ; 8F 00 CF 00 | Store accumulator to absolute long address
    INC $00              ; E6 00 | Increment (zero page)
    BRA $81              ; 80 81 | Branch always
    ROL $3C00,X          ; 3E 00 3C | Rotate left (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    STA                  ; 9F 00 07 18 | Store accumulator to absolute long,X
    ORA $9998,Y          ; 19 98 99 | Logical OR with accumulator (absolute,Y)
    BCC $91              ; 90 91 | Branch if carry clear
    STA $600EC6          ; 8F C6 0E 60 | Store accumulator to absolute long address
    STZ $FF              ; 64 FF | Store zero to zero page
    BMI $00              ; 30 00 | Branch if negative
    AND ($08),Y          ; 31 08 | Logical AND with accumulator ((zero page),Y)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    STY $9800            ; 8C 00 98 | Store Y register to absolute address
    STA ($BD,X)          ; 81 BD | Store accumulator to (zero page,X)
    STX $F6              ; 86 F6 | Store X register to zero page

;------------------------------------------------------------------------------
; Bank44_DmaFunction_193
; Address: $E2DD8D
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_193:
    JMP $F93C3C          ; 5C 3C 3C F9 | Jump to address long
    ROR $7900,X          ; 7E 00 79 | Rotate right (absolute,X)
    CMP $F1FF            ; CD FF F1 | Compare accumulator (absolute)
    ROL $0C0F,X          ; 3E 0F 0C | Rotate left (absolute,X)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    STZ $00FE            ; 9C FE 00 | Store zero to absolute
    CPX $D810            ; EC 10 D8 | Compare X register (absolute)
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    SED                  ; F8 | Set decimal mode flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BEQ $F7              ; F0 F7 | Branch if equal
    CPY #$CF             ; C0 CF | Compare Y register (immediate)
    BRA $9F              ; 80 9F | Branch always
    CLC                  ; 18 | Clear carry flag
    STA $9110,Y          ; 99 10 91 | Store accumulator to absolute,Y
    STA $0F8E07          ; 8F 07 8E 0F | Store accumulator to absolute long address
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $08              ; F0 08 | Branch if equal
    ASL $3E0A            ; 0E 0A 3E | Arithmetic shift left (absolute)
    BCS $FF              ; B0 FF | Branch if carry set
    SBC ($F6,X)          ; E1 F6 | Subtract with carry ((zero page,X))
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SBC #$00             ; E9 00 | Subtract with carry (immediate)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    CMP $FF              ; C5 FF | Compare accumulator (zero page)
    SBC ($7F),Y          ; F1 7F | Subtract with carry ((zero page),Y)
    SBC ($F1),Y          ; F1 F1 | Subtract with carry ((zero page),Y)
    CPX #$E8             ; E0 E8 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    CLI                  ; 58 | Clear interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    BRA $00              ; 80 00 | Branch always
    ASL $1F00            ; 0E 00 1F | Arithmetic shift left (absolute)
    LDA                  ; BF 00 FF 00 | Load from absolute long,X into accumulator
    STA                  ; 9F 9C 1E 1E | Store accumulator to absolute long,X
    CPX #$E0             ; E0 E0 | Game work RAM access
    BRA $BC              ; 80 BC | Branch always
    BRA $BC              ; 80 BC | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_194
; Address: $E2DE52
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_194:
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    BIT $EC40            ; 2C 40 EC | Test bits in accumulator (absolute)
    DEC $1DCC            ; CE CC 1D | Decrement (absolute)
    CLC                  ; 18 | Clear carry flag
    BPL $03              ; 10 03 | Branch if positive

;------------------------------------------------------------------------------
; Bank44_DmaFunction_196
; Address: $E2DE73
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_196:
    JSR $209F            ; 20 9F 20 | Jump to subroutine
    AND ($02),Y          ; 31 02 | Logical AND with accumulator ((zero page),Y)
    CPX #$07             ; E0 07 | Compare X register (immediate)
    INX                  ; E8 | Increment X register
    SED                  ; F8 | Set decimal mode flag
    BEQ $0F              ; F0 0F | Branch if equal
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $3E0A            ; 0E 0A 3E | Arithmetic shift left (absolute)
    BMI $3F              ; 30 3F | Branch if negative
    AND ($76,X)          ; 21 76 | Logical AND with accumulator ((zero page,X))
    CPX #$60             ; E0 60 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SBC $F100,Y          ; F9 00 F1 | Subtract with carry (absolute,Y)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA #$80             ; 09 80 | Logical OR with accumulator (immediate)
    BRA $70              ; 80 70 | Branch always
    BVS $60              ; 70 60 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_197
; Address: $E2DEB0
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_197:
    STA $009F00          ; 8F 00 9F 00 | Store accumulator to absolute long address
    STA                  ; 9F 00 FF 00 | Store accumulator to absolute long,X
    BPL $53              ; 10 53 | Branch if positive
    BPL $57              ; 10 57 | Branch if positive
    BVS $F7              ; 70 F7 | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    STA                  ; 9F 00 B9 00 | Store accumulator to absolute long,X
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    STA $00BF00          ; 8F 00 BF 00 | Store accumulator to absolute long address
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    BIT $5343            ; 2C 43 53 | Test bits in accumulator (absolute)
    ASL $26              ; 06 26 | Arithmetic shift left (zero page)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    LDY $BC00,X          ; BC 00 BC | Load from absolute,X into Y register
    SBC $FF00,Y          ; F9 00 FF | Subtract with carry (absolute,Y)
    ORA ($C1,X)          ; 01 C1 | Logical OR with accumulator ((zero page,X))
    ASL $40              ; 06 40 | Arithmetic shift left (zero page)
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    PLY                  ; 7A | Pull Y register from stack
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    LDA                  ; BF 00 FD 02 | Load from absolute long,X into accumulator
    SBC $FF02,X          ; FD 02 FF | Subtract with carry (absolute,X)
    SBC $FF01,X          ; FD 01 FF | Subtract with carry (absolute,X)
    BPL $53              ; 10 53 | Branch if positive

;------------------------------------------------------------------------------
; Bank44_DmaFunction_198
; Address: $E2DF46
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_198:
    BVS $73              ; 70 73 | Branch if overflow set
    CLC                  ; 18 | Clear carry flag
    BRA $BC              ; 80 BC | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_199
; Address: $E2DF56
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_199:
    STA $00FF00          ; 8F 00 FF 00 | Store accumulator to absolute long address
    STA                  ; 9F 80 FF 00 | Store accumulator to absolute long,X
    ADC ($65,X)          ; 61 65 | Add with carry ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank44_DmaFunction_19A
; Address: $E2DF6A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_19A:
    JSR $002F            ; 20 2F 00 | Jump to subroutine
    ASL $F000            ; 0E 00 F0 | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    BRA $98              ; 80 98 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_19B
; Address: $E2DF83
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_19B:
    JMP ($C3C3)          ; 6C C3 C3 | Jump to address (absolute indirect)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    BRA $00              ; 80 00 | Branch always
    SED                  ; F8 | Set decimal mode flag
    BMI $06              ; 30 06 | Branch if negative
    ASL $7F              ; 06 7F | Arithmetic shift left (zero page)
    STA                  ; 9F 00 3C 00 | Store accumulator to absolute long,X
    SBC $FF00,Y          ; F9 00 FF | Subtract with carry (absolute,Y)
    SBC $0100,Y          ; F9 00 01 | Subtract with carry (absolute,Y)
    CMP $1000,Y          ; D9 00 10 | Compare accumulator (absolute,Y)
    WDM #$42             ; 42 42 | Hardware register operation
    ORA ($7A,X)          ; 01 7A | Logical OR with accumulator ((zero page,X))
    ORA ($7A,X)          ; 01 7A | Logical OR with accumulator ((zero page,X))
    BPL $EF              ; 10 EF | Branch if positive
    ADC $00FE,X          ; 7D FE 00 | Add with carry (absolute,X)
    INC $BC01,X          ; FE 01 BC | Increment (absolute,X)
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    CPX $C813            ; EC 13 C8 | Compare X register (absolute)
    DEX                  ; CA | Decrement X register
    ADC $7F00,X          ; 7D 00 7F | Add with carry (absolute,X)
    CPY #$2F             ; C0 2F | Compare Y register (immediate)
    BRA $7D              ; 80 7D | Branch always
    STA                  ; 9F 02 09 FF | Store accumulator to absolute long,X
    BRA $7F              ; 80 7F | Branch always
    BRA $3F              ; 80 3F | Branch always
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$7D             ; E0 7D | Compare X register (immediate)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_19D
; Address: $E2DFE6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_19D:
    JSR $015E            ; 20 5E 01 | Jump to subroutine
    BIT $2801            ; 2C 01 28 | Test bits in accumulator (absolute)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    BNE $2F              ; D0 2F | Branch if not equal

;------------------------------------------------------------------------------
; Bank44_DmaFunction_19E
; Address: $E2DFF4
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_19E:
    BRA $7F              ; 80 7F | Branch always
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    AND $29D6            ; 2D D6 29 | Logical AND with accumulator (absolute)
    ORA #$FE             ; 09 FE | Logical OR with accumulator (immediate)
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))
    CLI                  ; 58 | Clear interrupt disable flag
    STA                  ; 9F 60 94 A0 | Store accumulator to absolute long,X
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$0C             ; C0 0C | Compare Y register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $1F              ; F0 1F | Branch if equal
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ASL $DCC0,X          ; 1E C0 DC | Arithmetic shift left (absolute,X)
    CPY #$CC             ; C0 CC | Compare Y register (immediate)
    ASL $3E00,X          ; 1E 00 3E | Arithmetic shift left (absolute,X)
    ROR $FD00,X          ; 7E 00 FD | Rotate right (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_19F
; Address: $E2E046
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_19F:
    BMI $3F              ; 30 3F | Branch if negative
    STA $00C400          ; 8F 00 C4 00 | Store accumulator to absolute long address
    INC $FF              ; E6 FF | Increment (zero page)
    STA                  ; 9F 00 CF 00 | Store accumulator to absolute long,X
    STA $7170            ; 8D 70 71 | Store accumulator to absolute address
    RTI                  ; 40 | Return from interrupt
    WDM #$00             ; 42 00 | Reserved instruction
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ROL $BC00            ; 2E 00 BC | Rotate left (absolute)
    INC $00FF,X          ; FE FF 00 | Increment (absolute,X)
    STA $00BF00          ; 8F 00 BF 00 | Store accumulator to absolute long address
    RTI                  ; 40 | Return from interrupt
    EOR ($60,X)          ; 41 60 | Exclusive OR with accumulator ((zero page,X))
    ADC #$70             ; 69 70 | Add with carry (immediate)
    BVS $76              ; 70 76 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1A0
; Address: $E2E08C
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1A0:
    JSR $01A0            ; 20 A0 01 | Jump to subroutine
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    LDA                  ; BF 00 9F 00 | Load from absolute long,X into accumulator
    STA $008F00          ; 8F 00 8F 00 | Store accumulator to absolute long address
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    STA                  ; 9F 00 BE 00 | Store accumulator to absolute long,X
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    STA $009F00          ; 8F 00 9F 00 | Store accumulator to absolute long address
    LDA $C000,Y          ; B9 00 C0 | Load from absolute,Y into accumulator
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1A1
; Address: $E2E12F
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1A1:
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    BRA $80              ; 80 80 | Branch always
    PHP                  ; 08 | Push processor status to stack
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    PHB                  ; 8B | Push data bank register to stack
    BRA $00              ; 80 00 | Branch always
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPX #$E0             ; E0 E0 | Game work RAM access
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    DEC $FF              ; C6 FF | Decrement (zero page)
    LDA $7E81,Y          ; B9 81 7E | Load from absolute,Y into accumulator
    CPY #$43             ; C0 43 | Compare Y register (immediate)
    LDY $708F,X          ; BC 8F 70 | Load from absolute,X into Y register
    BRA $FF              ; 80 FF | Branch always
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    STA $007F00          ; 8F 00 7F 00 | Store accumulator to absolute long address
    BMI $87              ; 30 87 | Branch if negative
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SBC ($2E),Y          ; F1 2E | Subtract with carry ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    BEQ $FF              ; F0 FF | Branch if equal
    INX                  ; E8 | Increment X register
    DEC $FFC9            ; CE C9 FF | Decrement (absolute)
    BEQ $F0              ; F0 F0 | Branch if equal
    CMP ($C0,X)          ; C1 C0 | Compare accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    BPL $00              ; 10 00 | Branch if positive
    BMI $00              ; 30 00 | Branch if negative
    SBC $9E7A            ; ED 7A 9E | Subtract with carry (absolute)
    LSR $0FA7,X          ; 5E A7 0F | Logical shift right (absolute,X)
    CPX #$81             ; E0 81 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    STY $1C00            ; 8C 00 1C | Store Y register to absolute address
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    BEQ $BF              ; F0 BF | Branch if equal
    SBC $B50F,Y          ; F9 0F B5 | Subtract with carry (absolute,Y)
    LSR                  ; 4A | Logical shift right (accumulator)
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    BIT $B05F            ; 2C 5F B0 | Test bits in accumulator (absolute)
    STA                  ; 9F 78 73 03 | Store accumulator to absolute long,X
    LDY $F800,X          ; BC 00 F8 | Load from absolute,X into Y register
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1A2
; Address: $E2E27A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1A2:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF 47 BF 4F | Load from absolute long,X into accumulator
    BRA $FF              ; 80 FF | Branch always
    SED                  ; F8 | Set decimal mode flag
    LDY $AC53,X          ; BC 53 AC | Load from absolute,X into Y register
    LDA $3FFF3D          ; AF 3D FF 3F | Load from absolute long address into accumulator
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1A3
; Address: $E2E2AD
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1A3:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    STA                  ; 9F 1F C7 07 | Store accumulator to absolute long,X
    PEA #$FF04           ; F4 04 FF | Push effective address to stack
    ORA ($EF,X)          ; 01 EF | Logical OR with accumulator ((zero page,X))
    BPL $FF              ; 10 FF | Branch if positive
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPX #$E0             ; E0 E0 | Game work RAM access
    BPL $00              ; 10 00 | Branch if positive
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ASL $F9FE            ; 0E FE F9 | Arithmetic shift left (absolute)
    INC $F6F9,X          ; FE F9 F6 | Increment (absolute,X)
    SBC $FFFF            ; ED FF FF | Subtract with carry (absolute)
    INC $FCFE,X          ; FE FE FC | Increment (absolute,X)
    LDA $C83750          ; AF 50 37 C8 | Load from absolute long address into accumulator
    STY $1C              ; 84 1C | Store Y register to zero page
    CPY $C433            ; CC 33 C4 | Compare Y register (absolute)
    AND ($01),Y          ; 31 01 | Logical AND with accumulator ((zero page),Y)
    SEI                  ; 78 | Set interrupt disable flag
    CPY $C400            ; CC 00 C4 | Compare Y register (absolute)
    INC $FE09,X          ; FE 09 FE | Increment (absolute,X)
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    STA                  ; 9F 63 FF FF | Store accumulator to absolute long,X
    INC $F0FE,X          ; FE FE F0 | Increment (absolute,X)
    BEQ $C0              ; F0 C0 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1A4
; Address: $E2E33C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1A4:
    JSR $9000            ; 20 00 90 | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1A5
; Address: $E2E34C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1A5:
    JSR $FBDF            ; 20 DF FB | Jump to subroutine
    CPY $FF              ; C4 FF | Compare Y register (zero page)
    BRA $80              ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1A7
; Address: $E2E367
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1A7:
    JSR $F81F            ; 20 1F F8 | Jump to subroutine
    STZ $B04F            ; 9C 4F B0 | Store zero to absolute
    SEC                  ; 38 | Set carry flag
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    LSR $1F00,X          ; 5E 00 1F | Logical shift right (absolute,X)
    SEC                  ; 38 | Set carry flag
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    STA                  ; 9F 60 CF 70 | Store accumulator to absolute long,X

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1A8
; Address: $E2E387
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1A8:
    CMP $C1FF,Y          ; D9 FF C1 | Compare accumulator (absolute,Y)
    LDA $3C4A,X          ; BD 4A 3C | Load from absolute,X into accumulator
    ADC $01BA,X          ; 7D BA 01 | Add with carry (absolute,X)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA $708F70          ; 8F 70 8F 70 | Store accumulator to absolute long address
    BRA $FF              ; 80 FF | Branch always
    BRA $DF              ; 80 DF | Branch always
    LDA ($DD,X)          ; A1 DD | Load from (zero page,X) into accumulator

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1A9
; Address: $E2E3AB
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1A9:
    JSL $7A45BA          ; 22 BA 45 7A | Jump to subroutine long
    SBC $80              ; E5 80 | Subtract with carry (zero page)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    AND $BFC2,X          ; 3D C2 BF | Logical AND with accumulator (absolute,X)
    STZ $FC              ; 64 FC | Store zero to zero page
    SBC $FF7A,X          ; FD 7A FF | Subtract with carry (absolute,X)
    INC $000D,X          ; FE 0D 00 | Increment (absolute,X)
    BIT $906F            ; 2C 6F 90 | Test bits in accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    INC $CEE1,X          ; FE E1 CE | Increment (absolute,X)
    SBC $BDCE,X          ; FD CE BD | Subtract with carry (absolute,X)
    ASL $00DF            ; 0E DF 00 | Arithmetic shift left (absolute)
    AND ($3F,X)          ; 21 3F | Logical AND with accumulator ((zero page,X))
    SBC ($3F,X)          ; E1 3F | Subtract with carry ((zero page,X))
    SBC ($FE,X)          ; E1 FE | Subtract with carry ((zero page,X))
    PEA #$FC0C           ; F4 0C FC | Push effective address to stack
    PEA #$FF08           ; F4 08 FF | Push effective address to stack
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    AND $0300,Y          ; 39 00 03 | Logical AND with accumulator (absolute,Y)
    STA                  ; 9F 99 97 9D | Store accumulator to absolute long,X
    ORA $3E31,X          ; 1D 31 3E | Logical OR with accumulator (absolute,X)
    ORA $3F06,Y          ; 19 06 3F | Logical OR with accumulator (absolute,Y)
    BMI $53              ; 30 53 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1AB
; Address: $E2E434
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1AB:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    LDY $3800            ; AC 00 38 | Load from absolute address into Y register
    CMP $D6B3            ; CD B3 D6 | Compare accumulator (absolute)
    LDA #$8E             ; A9 8E | Load immediate value into accumulator
    STA $8F6A,X          ; 9D 6A 8F | Store accumulator to absolute,X
    LDY #$FB             ; A0 FB | Load immediate value into Y register
    CPY $E3              ; C4 E3 | Compare Y register (zero page)
    ASL $0400            ; 0E 00 04 | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1AC
; Address: $E2E461
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1AC:
    BCC $F0              ; 90 F0 | Branch if carry clear
    LDA                  ; BF F9 F6 FE | Load from absolute long,X into accumulator
    ADC $79FE,Y          ; 79 FE 79 | Add with carry (absolute,Y)
    SBC $7F7A,X          ; FD 7A 7F | Subtract with carry (absolute,X)
    INC $0007,X          ; FE 07 00 | Increment (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    AND $FBF7,Y          ; 39 F7 FB | Logical AND with accumulator (absolute,Y)
    AND $7D              ; 25 7D | Logical AND with accumulator (zero page)
    SEP #$7F             ; E2 7F | Set processor status bits
    SBC $79FF,Y          ; F9 FF 79 | Subtract with carry (absolute,Y)
    LDA                  ; BF 00 00 00 | Load from absolute long,X into accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PEA #$E60B           ; F4 0B E6 | Push effective address to stack
    ORA $976B,Y          ; 19 6B 97 | Logical OR with accumulator (absolute,Y)
    STA                  ; 9F AF 53 CD | Store accumulator to absolute long,X
    CPY $F1B3            ; CC B3 F1 | Compare Y register (absolute)
    BEQ $00              ; F0 00 | Branch if equal
    INC $00              ; E6 00 | Increment (zero page)
    PLA                  ; 68 | Pull accumulator from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1AD
; Address: $E2E4BA
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1AD:
    BIT $0C00            ; 2C 00 0C | Test bits in accumulator (absolute)
    LDA $7F42,X          ; BD 42 7F | Load from absolute,X into accumulator
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    LDA $3BFC,Y          ; B9 FC 3B | Load from absolute,Y into accumulator
    BPL $F3              ; 10 F3 | Branch if positive
    STY $83FC            ; 8C FC 83 | Store Y register to absolute address
    INC $84C1,X          ; FE C1 84 | Increment (absolute,X)
    JMP ($7EBF)          ; 6C BF 7E | Jump to address (absolute indirect)
    LDY $38FF,X          ; BC FF 38 | Load from absolute,X into Y register
    SBC $FF36,Y          ; F9 36 FF | Subtract with carry (absolute,Y)
    REP #$00             ; C2 00 | Reset processor status bits
    RTI                  ; 40 | Return from interrupt
    STY $7B              ; 84 7B | Store Y register to zero page
    INC $19              ; E6 19 | Increment (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1AE
; Address: $E2E507
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1AE:
    ROR $7F              ; 66 7F | Rotate right (zero page)
    DEY                  ; 88 | Decrement Y register
    ROR $FC9D            ; 6E 9D FC | Rotate right (absolute)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1AF
; Address: $E2E521
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1AF:
    STA $9D6F,Y          ; 99 6F 9D | Store accumulator to absolute,Y
    STA                  ; 9F BF 4F 9F | Store accumulator to absolute long,X
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BPL $00              ; 10 00 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    INC $FF79,X          ; FE 79 FF | Increment (absolute,X)
    BCS $DF              ; B0 DF | Branch if carry set

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1B0
; Address: $E2E545
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1B0:
    CLV                  ; B8 | Clear overflow flag
    CLD                  ; D8 | Clear decimal mode flag
    INX                  ; E8 | Increment X register
    PEA #$FCFF           ; F4 FF FC | Push effective address to stack
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    INC $FE8E,X          ; FE 8E FE | Increment (absolute,X)
    INC $7CFC,X          ; FE FC 7C | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC $FC3D,X          ; FE 3D FC | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    LDY #$61             ; A0 61 | Load immediate value into Y register
    ROR $6867            ; 6E 67 68 | Rotate right (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1B1
; Address: $E2E58E
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1B1:
    ADC ($2E),Y          ; 71 2E | Add with carry ((zero page),Y)
    BPL $00              ; 10 00 | Branch if positive
    BCC $00              ; 90 00 | Branch if carry clear
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    STY $F1              ; 84 F1 | Store Y register to zero page
    ASL $3FC3            ; 0E C3 3F | Arithmetic shift left (absolute)
    STA                  ; 9F 6F FF 0F | Store accumulator to absolute long,X
    STA $FF8F7F          ; 8F 7F 8F FF | Store accumulator to absolute long address
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1B2
; Address: $E2E5BE
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1B2:
    BEQ $00              ; F0 00 | Branch if equal
    STA                  ; 9F BF CF FF | Store accumulator to absolute long,X
    LDA ($FF,X)          ; A1 FF | Load from (zero page,X) into accumulator
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ASL $0FFF            ; 0E FF 0F | Arithmetic shift left (absolute)
    INC $FC3E,X          ; FE 3E FC | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    INC $FFFD,X          ; FE FD FF | Increment (absolute,X)
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SBC ($FE),Y          ; F1 FE | Subtract with carry ((zero page),Y)
    STZ $8EFE,X          ; 9E FE 8E | Store zero to absolute,X
    STA $78              ; 85 78 | Store accumulator to zero page
    BEQ $0F              ; F0 0F | Branch if equal
    STA $C0FF,X          ; 9D FF C0 | Store accumulator to absolute,X
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    STA                  ; 9F F1 81 71 | Store accumulator to absolute long,X
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1B3
; Address: $E2E627
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1B3:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BRA $80              ; 80 80 | Branch always
    STY $00              ; 84 00 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1B4
; Address: $E2E632
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1B4:
    ASL $8E00            ; 0E 00 8E | Arithmetic shift left (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    SBC ($FE),Y          ; F1 FE | Subtract with carry ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    SBC $4E4F,Y          ; F9 4F 4E | Subtract with carry (absolute,Y)
    ASL $1E1F            ; 0E 1F 1E | Arithmetic shift left (absolute)
    ASL $0707            ; 0E 07 07 | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BCS $00              ; B0 00 | Branch if carry set
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SBC $F8FF,Y          ; F9 FF F8 | Subtract with carry (absolute,Y)
    SBC $FEFA,X          ; FD FA FE | Subtract with carry (absolute,X)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF FF 3F FF | Load from absolute long,X into accumulator
    LDX $C0FF,Y          ; BE FF C0 | Load from absolute,Y into X register
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$2C             ; C0 2C | Compare Y register (immediate)
    CPY #$24             ; C0 24 | Compare Y register (immediate)
    INC $FED1            ; EE D1 FE | Increment (absolute)
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    CPX #$F7             ; E0 F7 | Compare X register (immediate)
    INY                  ; C8 | Increment Y register
    CMP $FF              ; C5 FF | Compare accumulator (zero page)
    STA $000000          ; 8F 00 00 00 | Store accumulator to absolute long address

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1B5
; Address: $E2E6C1
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1B5:
    JSL $3F03FF          ; 22 FF 03 3F | Jump to subroutine long
    CPX $ECEB            ; EC EB EC | Compare X register (absolute)
    XBA                  ; EB | Exchange accumulator bytes
    SEI                  ; 78 | Set interrupt disable flag
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    LDX $70EF,Y          ; BE EF 70 | Load from absolute,Y into X register
    INC $F8F1            ; EE F1 F8 | Increment (absolute)
    ROR $BFB1,X          ; 7E B1 BF | Rotate right (absolute,X)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    BRA $00              ; 80 00 | Branch always
    INC $FF1D,X          ; FE 1D FF | Increment (absolute,X)
    ASL $9E7F,X          ; 1E 7F 9E | Arithmetic shift left (absolute,X)
    ROL $5FC9,X          ; 3E C9 5F | Rotate left (absolute,X)
    LDX $1EFF            ; AE FF 1E | Load from absolute address into X register
    ROL $38C1,X          ; 3E C1 38 | Rotate left (absolute,X)
    LDA ($FE),Y          ; B1 FE | Load from (zero page),Y into accumulator
    SEP #$1D             ; E2 1D | Set processor status bits
    JMP $FF926F          ; 5C 6F 92 FF | Jump to address long
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1B6
; Address: $E2E734
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1B6:
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    LDA                  ; BF 7F 3F DF | Load from absolute long,X into accumulator
    DEC $CF3F            ; CE 3F CF | Decrement (absolute)
    STA $FFCF7F          ; 8F 7F CF FF | Store accumulator to absolute long address
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    BRA $00              ; 80 00 | Branch always
    SBC $7E19,Y          ; F9 19 7E | Subtract with carry (absolute,Y)
    STA $8F70            ; 8D 70 8F | Store accumulator to absolute address
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BIT $E7              ; 24 E7 | Test bits in accumulator (zero page)
    STA $8BFF,Y          ; 99 FF 8B | Store accumulator to absolute,Y
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    SEI                  ; 78 | Set interrupt disable flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $EF              ; 10 EF | Branch if positive
    STY $08F7            ; 8C F7 08 | Store Y register to absolute address
    CPX #$9F             ; E0 9F | Compare X register (immediate)
    INC $0FFF            ; EE FF 0F | Increment (absolute)
    STA $3FCF7F          ; 8F 7F CF 3F | Store accumulator to absolute long address
    BEQ $00              ; F0 00 | Branch if equal
    SBC $FCE2,X          ; FD E2 FC | Subtract with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    INC $FF              ; E6 FF | Increment (zero page)
    INC $FF              ; E6 FF | Increment (zero page)
    INC $00FF,X          ; FE FF 00 | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    PLY                  ; 7A | Pull Y register from stack
    SBC $E5              ; E5 E5 | Subtract with carry (zero page)
    BRA $00              ; 80 00 | Branch always
    STY $00              ; 84 00 | Store Y register to zero page
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    STX $05              ; 86 05 | Store X register to zero page
    PHA                  ; 48 | Push accumulator to stack
    TSX                  ; BA | Transfer stack pointer to X register
    SEI                  ; 78 | Set interrupt disable flag
    BMI $00              ; 30 00 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SBC $D806,Y          ; F9 06 D8 | Subtract with carry (absolute,Y)
    SBC $FC12            ; ED 12 FC | Subtract with carry (absolute)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1B7
; Address: $E2E852
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1B7:
    CPX $00              ; E4 00 | Compare X register (zero page)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SBC #$E8             ; E9 E8 | Subtract with carry (immediate)
    SBC $FEEA,X          ; FD EA FE | Subtract with carry (absolute,X)
    SBC $FCFF,X          ; FD FF FC | Subtract with carry (absolute,X)
    ADC $3BFF,X          ; 7D FF 3B | Add with carry (absolute,X)
    LDA                  ; BF 5B 00 00 | Load from absolute long,X into accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    BPL $E6              ; 10 E6 | Branch if positive
    BPL $E3              ; 10 E3 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1B8
; Address: $E2E888
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1B8:
    SBC $FC61,X          ; FD 61 FC | Subtract with carry (absolute,X)
    BRA $B6              ; 80 B6 | Branch always
    CPY $AAD7            ; CC D7 AA | Compare Y register (absolute)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    AND $05              ; 25 05 | Logical AND with accumulator (zero page)
    AND ($01),Y          ; 31 01 | Logical AND with accumulator ((zero page),Y)
    BPL $00              ; 10 00 | Branch if positive
    LDA $936F5F          ; AF 5F 6F 93 | Load from absolute long address into accumulator
    ORA $0EF0            ; 0D F0 0E | Logical OR with accumulator (absolute)
    SBC $C793,X          ; FD 93 C7 | Subtract with carry (absolute,X)
    LDA $45FB,Y          ; B9 FB 45 | Load from absolute,Y into accumulator
    LDY #$00             ; A0 00 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1BA
; Address: $E2E8B8
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1BA:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    DEC                  ; 3A | Decrement accumulator
    CPY $AECB            ; CC CB AE | Compare Y register (absolute)
    LDA ($0E,X)          ; A1 0E | Load from (zero page,X) into accumulator
    SBC ($C1),Y          ; F1 C1 | Subtract with carry ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    INX                  ; E8 | Increment X register
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BMI $00              ; 30 00 | Branch if negative
    BVC $00              ; 50 00 | Branch if overflow clear
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    DEY                  ; 88 | Decrement Y register
    ASL $0700            ; 0E 00 07 | Arithmetic shift left (absolute)
    BEQ $3F              ; F0 3F | Branch if equal
    STA $FF1FFF          ; 8F FF 1F FF | Store accumulator to absolute long address
    LDA                  ; BF 5F FF 9F | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1BB
; Address: $E2E907
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1BB:
    LDA                  ; BF FF B3 FF | Load from absolute long,X into accumulator
    SBC ($F9,X)          ; E1 F9 | Subtract with carry ((zero page,X))
    DEC $F5              ; C6 F5 | Decrement (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    SBC ($8F),Y          ; F1 8F | Subtract with carry ((zero page),Y)
    CPY #$FC             ; C0 FC | Compare Y register (immediate)
    CPY #$F8             ; C0 F8 | Compare Y register (immediate)
    BEQ $0D              ; F0 0D | Branch if equal
    STA ($CF,X)          ; 81 CF | Store accumulator to (zero page,X)
    BNE $01              ; D0 01 | Branch if not equal
    BRA $80              ; 80 80 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    LDA                  ; BF FF DF FF | Load from absolute long,X into accumulator
    SBC ($F8),Y          ; F1 F8 | Subtract with carry ((zero page),Y)
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    AND $6DF2            ; 2D F2 6D | Logical AND with accumulator (absolute)
    BNE $FF              ; D0 FF | Branch if not equal
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC $FCFF,X          ; FE FF FC | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    INY                  ; C8 | Increment Y register
    JMP $4FB0            ; 4C B0 4F | Jump to address
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    BMI $00              ; 30 00 | Branch if negative
    BCS $00              ; B0 00 | Branch if carry set
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    LDY $D827            ; AC 27 D8 | Load from absolute address into Y register
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    ROR $FE3F,X          ; 7E 3F FE | Rotate right (absolute,X)
    RTI                  ; 40 | Return from interrupt
    LDY #$60             ; A0 60 | Load immediate value into Y register
    BEQ $10              ; F0 10 | Branch if equal
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
    SBC $7FF9,Y          ; F9 F9 7F | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1BC
; Address: $E2EA27
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1BC:
    ROL $181F,X          ; 3E 1F 18 | Rotate left (absolute,X)
    ORA $0C0D            ; 0D 0D 0C | Logical OR with accumulator (absolute)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BPL $EF              ; 10 EF | Branch if positive
    BCC $F7              ; 90 F7 | Branch if carry clear
    DEY                  ; 88 | Decrement Y register
    CPX $E718            ; EC 18 E7 | Compare X register (absolute)
    EOR #$B6             ; 49 B6 | Exclusive OR with accumulator (immediate)
    PLX                  ; FA | Pull X register from stack
    ORA $F5              ; 05 F5 | Logical OR with accumulator (zero page)
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    BVS $00              ; 70 00 | Branch if overflow set
    BMI $00              ; 30 00 | Branch if negative
    STA ($0F,X)          ; 81 0F | Store accumulator to (zero page,X)
    BEQ $AB              ; F0 AB | Branch if equal
    STA $4572            ; 8D 72 45 | Store accumulator to absolute address
    TSX                  ; BA | Transfer stack pointer to X register
    TXA                  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1BE
; Address: $E2EA7C
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1BE:
    BRA $00              ; 80 00 | Branch always
    DEC                  ; 3A | Decrement accumulator
    PHP                  ; 08 | Push processor status to stack
    SBC $FDE7,Y          ; F9 E7 FD | Subtract with carry (absolute,Y)
    ORA $C1E3            ; 0D E3 C1 | Logical OR with accumulator (absolute)
    CMP ($F3,X)          ; C1 F3 | Compare accumulator ((zero page,X))
    SBC ($7A),Y          ; F1 7A | Subtract with carry ((zero page),Y)
    ADC $7D7E,Y          ; 79 7E 7D | Add with carry (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    BMI $00              ; 30 00 | Branch if negative
    STY $00              ; 84 00 | Store Y register to zero page
    BRA $00              ; 80 00 | Branch always
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    SBC $7F7E,X          ; FD 7E 7F | Subtract with carry (absolute,X)
    ROL $D69F,X          ; 3E 9F D6 | Rotate left (absolute,X)
    STA $B587EB          ; 8F EB 87 B5 | Store accumulator to absolute long address
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1C0
; Address: $E2EAFD
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1C0:
    BPL $48              ; 10 48 | Branch if positive
    PHA                  ; 48 | Push accumulator to stack
    BEQ $FF              ; F0 FF | Branch if equal
    ROR $A3FF,X          ; 7E FF A3 | Rotate right (absolute,X)
    SBC $7C89,X          ; FD 89 7C | Subtract with carry (absolute,X)
    CPY $7E              ; C4 7E | Compare Y register (zero page)
    LDY #$FE             ; A0 FE | Load immediate value into Y register
    STA $000000          ; 8F 00 00 00 | Store accumulator to absolute long address
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1C1
; Address: $E2EB1E
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1C1:
    JSR $F020            ; 20 20 F0 | Jump to subroutine
    SBC $FDE6,Y          ; F9 E6 FD | Subtract with carry (absolute,Y)
    INC $FEF9,X          ; FE F9 FE | Increment (absolute,X)
    ROR $2F3E,X          ; 7E 3E 2F | Rotate right (absolute,X)
    ASL $0F1F,X          ; 1E 1F 0F | Arithmetic shift left (absolute,X)
    BPL $00              ; 10 00 | Branch if positive
    ORA $0D00,Y          ; 19 00 0D | Logical OR with accumulator (absolute,Y)
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    STA ($84),Y          ; 91 84 | Store accumulator to (zero page),Y
    RTI                  ; 40 | Return from interrupt
    REP #$20             ; C2 20 | Reset processor status bits
    ADC ($80,X)          ; 61 80 | Add with carry ((zero page,X))
    ORA $8C20,Y          ; 19 20 8C | Logical OR with accumulator (absolute,Y)
    BNE $90              ; D0 90 | Branch if not equal
    ROR $66              ; 66 66 | Rotate right (zero page)
    ORA $1E1D,X          ; 1D 1D 1E | Logical OR with accumulator (absolute,X)
    ASL $C6C6,X          ; 1E C6 C6 | Arithmetic shift left (absolute,X)
    ASL $3F              ; 06 3F | Arithmetic shift left (zero page)
    ORA ($09),Y          ; 11 09 | Logical OR with accumulator ((zero page),Y)
    BMI $80              ; 30 80 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BCS $B0              ; B0 B0 | Branch if carry set
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    CPX $CEEC            ; EC EC CE | Compare X register (absolute)
    DEC $77              ; C6 77 | Decrement (zero page)
    ROL $7F3E,X          ; 3E 3E 7F | Rotate left (absolute,X)
    LDA                  ; BF FF 9F FF | Load from absolute long,X into accumulator
    AND $0000,X          ; 3D 00 00 | Logical AND with accumulator (absolute,X)
    BRA $80              ; 80 80 | Branch always
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    SBC $FFFF,Y          ; F9 FF FF | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1C2
; Address: $E2EBA9
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1C2:
    LDA                  ; BF FF CF FF | Load from absolute long,X into accumulator
    LDA ($00),Y          ; B1 00 | Load from (zero page),Y into accumulator
    INC $F901,X          ; FE 01 F9 | Increment (absolute,X)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    TYA                  ; 98 | Transfer Y register to accumulator
    LDA $F9FF,Y          ; B9 FF F9 | Load from absolute,Y into accumulator
    ROR $B5FF,X          ; 7E FF B5 | Rotate right (absolute,X)
    STZ $0EFF,X          ; 9E FF 0E | Store zero to absolute,X
    ASL $27DF            ; 0E DF 27 | Arithmetic shift left (absolute)
    STA                  ; 9F E3 9F E3 | Store accumulator to absolute long,X
    ORA $B14F,X          ; 1D 4F B1 | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1C4
; Address: $E2EC01
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1C4:
    CPY $EEFE            ; CC FE EE | Compare Y register (absolute)
    SBC $FFFD,X          ; FD FD FF | Subtract with carry (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    BRA $80              ; 80 80 | Branch always
    CPY $C4              ; C4 C4 | Compare Y register (zero page)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    ADC $7D00,X          ; 7D 00 7D | Add with carry (absolute,X)
    BNE $EF              ; D0 EF | Branch if not equal
    ORA $0000,X          ; 1D 00 00 | Logical OR with accumulator (absolute,X)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY $9F              ; C4 9F | Compare Y register (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1C5
; Address: $E2EC65
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1C5:
    PLA                  ; 68 | Pull accumulator from stack
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    LDY #$9F             ; A0 9F | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1C6
; Address: $E2EC8B
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1C6:
    LDY #$DF             ; A0 DF | Load immediate value into Y register
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    CMP ($C0,X)          ; C1 C0 | Compare accumulator ((zero page,X))
    ROR $C0              ; 66 C0 | Rotate right (zero page)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    STY $9C00            ; 8C 00 9C | Store Y register to absolute address
    ROR $3E00,X          ; 7E 00 3E | Rotate right (absolute,X)
    CLC                  ; 18 | Clear carry flag
    ORA ($F6,X)          ; 01 F6 | Logical OR with accumulator ((zero page,X))
    BRA $F9              ; 80 F9 | Branch always
    BRA $BC              ; 80 BC | Branch always

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1C7
; Address: $E2ECC8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1C7:
    ASL $EFF8,X          ; 1E F8 EF | Arithmetic shift left (absolute,X)
    DEC                  ; 3A | Decrement accumulator
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1C9
; Address: $E2ECE1
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1C9:
    TXS                  ; 9A | Transfer X register to stack pointer
    EOR #$11             ; 49 11 | Exclusive OR with accumulator (immediate)
    STY $6600            ; 8C 00 66 | Store Y register to absolute address
    STA ($00),Y          ; 91 00 | Store accumulator to (zero page),Y
    CLD                  ; D8 | Clear decimal mode flag
    BRA $87              ; 80 87 | Branch always
    ADC ($60,X)          ; 61 60 | Add with carry ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1CA
; Address: $E2ECF4
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1CA:
    INC $73EE            ; EE EE 73 | Increment (absolute)
    STA $6E99,Y          ; 99 99 6E | Store accumulator to absolute,Y
    ROR $2727            ; 6E 27 27 | Rotate right (absolute)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    STA                  ; 9F 10 DF 04 | Store accumulator to absolute long,X
    PHP                  ; 08 | Push processor status to stack
    BPL $10              ; 10 10 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1CC
; Address: $E2ED16
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1CC:
    JSR $9020            ; 20 20 90 | Jump to subroutine
    BCC $C0              ; 90 C0 | Branch if carry clear
    CPY #$20             ; C0 20 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1CD
; Address: $E2ED1D
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1CD:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    XBA                  ; EB | Exchange accumulator bytes
    PLX                  ; FA | Pull X register from stack
    BEQ $F9              ; F0 F9 | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    SBC $3F38,Y          ; F9 38 3F | Subtract with carry (absolute,Y)
    ORA $0C9F,Y          ; 19 9F 0C | Logical OR with accumulator (absolute,Y)
    ASL $10              ; 06 10 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1CF
; Address: $E2ED3E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1CF:
    BCS $B0              ; B0 B0 | Branch if carry set
    STX $C700            ; 8E 00 C7 | Store X register to absolute address
    ORA $A9F6,X          ; 1D F6 A9 | Logical OR with accumulator (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    ADC ($71),Y          ; 71 71 | Add with carry ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1D0
; Address: $E2ED62
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1D0:
    BMI $00              ; 30 00 | Branch if negative
    LDY $CE00,X          ; BC 00 CE | Load from absolute,X into Y register
    STA $00E700          ; 8F 00 E7 00 | Store accumulator to absolute long address
    STA                  ; 9F 9F CF CF | Store accumulator to absolute long,X
    AND ($31),Y          ; 31 31 | Logical AND with accumulator ((zero page),Y)
    BCC $90              ; 90 90 | Branch if carry clear
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    BVS $70              ; 70 70 | Branch if overflow set
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    AND $1E1F,X          ; 3D 1F 1E | Logical AND with accumulator (absolute,X)
    STA                  ; 9F 0B 0F 05 | Store accumulator to absolute long,X
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($C4,X)          ; 01 C4 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1D2
; Address: $E2ED96
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1D2:
    BEQ $F0              ; F0 F0 | Branch if equal
    BPL $10              ; 10 10 | Branch if positive
    AND ($FF),Y          ; 31 FF | Logical AND with accumulator ((zero page),Y)
    CLD                  ; D8 | Clear decimal mode flag
    SBC $FFE6,X          ; FD E6 FF | Subtract with carry (absolute,X)
    SEP #$7D             ; E2 7D | Set processor status bits
    INC $FEF9,X          ; FE F9 FE | Increment (absolute,X)
    ADC $BEFF,X          ; 7D FF BE | Add with carry (absolute,X)
    LDA $D9FF,Y          ; B9 FF D9 | Load from absolute,Y into accumulator
    SBC $FF4E,Y          ; F9 4E FF | Subtract with carry (absolute,Y)
    ROL $3EFF            ; 2E FF 3E | Rotate left (absolute)
    STA                  ; 9F 3F DF DF | Store accumulator to absolute long,X
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    SBC ($E3,X)          ; E1 E3 | Subtract with carry ((zero page,X))
    SBC $ECF2,X          ; FD F2 EC | Subtract with carry (absolute,X)
    INC $FFE2,X          ; FE E2 FF | Increment (absolute,X)
    SBC ($FE,X)          ; E1 FE | Subtract with carry ((zero page,X))
    SBC ($0C,X)          ; E1 0C | Subtract with carry ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF FF DF FF | Load from absolute long,X into accumulator
    AND ($F9),Y          ; 31 F9 | Logical AND with accumulator ((zero page),Y)
    TYA                  ; 98 | Transfer Y register to accumulator
    BRA $80              ; 80 80 | Branch always
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    DEC $C6              ; C6 C6 | Decrement (zero page)
    LDA                  ; BF 39 00 1C | Load from absolute long,X into accumulator
    ORA ($1F),Y          ; 11 1F | Logical OR with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1D3
; Address: $E2EE44
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1D3:
    STA                  ; 9F 9A CF CA | Store accumulator to absolute long,X
    NOP                  ; EA | No operation
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    SBC $FEFE,X          ; FD FE FE | Subtract with carry (absolute,X)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1D4
; Address: $E2EE56
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1D4:
    BMI $00              ; 30 00 | Branch if negative
    BPL $00              ; 10 00 | Branch if positive
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    SBC $FCFF,X          ; FD FF FC | Subtract with carry (absolute,X)
    ROR $7EFF,X          ; 7E FF 7E | Rotate right (absolute,X)
    ROL $3F7F,X          ; 3E 7F 3F | Rotate left (absolute,X)
    STA                  ; 9F 00 00 00 | Store accumulator to absolute long,X
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1D6
; Address: $E2EE8B
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1D6:
    BMI $FF              ; 30 FF | Branch if negative
    BPL $FF              ; 10 FF | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    CPX $0000            ; EC 00 00 | Compare X register (absolute)
    EOR #$F7             ; 49 F7 | Exclusive OR with accumulator (immediate)
    INY                  ; C8 | Increment Y register
    CPY $C8F7            ; CC F7 C8 | Compare Y register (absolute)
    INC $FF              ; E6 FF | Increment (zero page)
    ASL $3F              ; 06 3F | Arithmetic shift left (zero page)
    EOR $10              ; 45 10 | Exclusive OR with accumulator (zero page)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    INC $FBC5,X          ; FE C5 FB | Increment (absolute,X)
    SBC ($71),Y          ; F1 71 | Subtract with carry ((zero page),Y)
    ORA $0000,Y          ; 19 00 00 | Logical OR with accumulator (absolute,Y)
    ASL $1C00            ; 0E 00 1C | Arithmetic shift left (absolute)
    SBC ($D8,X)          ; E1 D8 | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1D7
; Address: $E2EF05
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1D7:
    JSR $22D8            ; 20 D8 22 | Jump to subroutine
    JMP ($AC91)          ; 6C 91 AC | Jump to address (absolute indirect)
    BEQ $FE              ; F0 FE | Branch if equal
    LDY #$FD             ; A0 FD | Load immediate value into Y register
    LDY #$50             ; A0 50 | Load immediate value into Y register
    BPL $0C              ; 10 0C | Branch if positive
    CMP $05              ; C5 05 | Compare accumulator (zero page)
    WDM #$02             ; 42 02 | Reserved instruction
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1D8
; Address: $E2EF23
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1D8:
    AND ($C7,X)          ; 21 C7 | Logical AND with accumulator ((zero page,X))
    ORA #$70             ; 09 70 | Logical OR with accumulator (immediate)
    BRA $19              ; 80 19 | Branch always
    CPX #$0D             ; E0 0D | Compare X register (immediate)
    BVC $06              ; 50 06 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1D9
; Address: $E2EF2F
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1D9:
    JSR $D8D8            ; 20 D8 D8 | Jump to subroutine
    JMP $28285C          ; 5C 5C 28 28 | Jump to address long
    ASL $0606            ; 0E 06 06 | Arithmetic shift left (absolute)
    LDX #$A2             ; A2 A2 | Load immediate value into X register
    CMP $98D9,Y          ; D9 D9 98 | Compare accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    BPL $1B              ; 10 1B | Branch if positive
    LDA                  ; BF 3C FF 7F | Load from absolute long,X into accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1DA
; Address: $E2EF52
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1DA:
    CPX $00              ; E4 00 | Compare X register (zero page)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    BVS $80              ; 70 80 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    BRA $7E              ; 80 7E | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $FF              ; 80 FF | Branch always
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1DB
; Address: $E2EF6E
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1DB:
    SBC $1E66,Y          ; F9 66 1E | Subtract with carry (absolute,Y)
    ASL $0F0F,X          ; 1E 0F 0F | Arithmetic shift left (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BEQ $07              ; F0 07 | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    BEQ $E3              ; F0 E3 | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    CPY #$71             ; C0 71 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1DC
; Address: $E2EF8E
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1DC:
    BCS $04              ; B0 04 | Branch if carry set
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    STX $86              ; 86 86 | Store X register to zero page
    SBC ($E1,X)          ; E1 E1 | Subtract with carry ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    STX $4B8E            ; 8E 8E 4B | Store X register to absolute address
    STY $1F              ; 84 1F | Store Y register to zero page
    BRA $1F              ; 80 1F | Branch always
    ORA ($9B,X)          ; 01 9B | Logical OR with accumulator ((zero page,X))
    CMP $00              ; C5 00 | Compare accumulator (zero page)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1DD
; Address: $E2EFB0
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1DD:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1DF
; Address: $E2EFB4
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1DF:
    CPX #$E0             ; E0 E0 | Game work RAM access
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    STZ $64              ; 64 64 | Store zero to zero page
    DEC                  ; 3A | Decrement accumulator
    DEC                  ; 3A | Decrement accumulator
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    SBC $FF77,Y          ; F9 77 FF | Subtract with carry (absolute,Y)
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1E0
; Address: $E2EFCD
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1E0:
    JSR $05FE            ; 20 FE 05 | Jump to subroutine
    INC $FEF1,X          ; FE F1 FE | Increment (absolute,X)
    INC $FFFE,X          ; FE FE FF | Increment (absolute,X)
    INC $3FFF,X          ; FE FF 3F | Increment (absolute,X)
    EOR $26FF            ; 4D FF 26 | Exclusive OR with accumulator (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    ASL $0E00,X          ; 1E 00 0E | Arithmetic shift left (absolute,X)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    SBC $FD81,Y          ; F9 81 FD | Subtract with carry (absolute,Y)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $E1              ; 80 E1 | Branch always
    SBC ($F1,X)          ; E1 F1 | Subtract with carry ((zero page,X))
    SBC ($F9),Y          ; F1 F9 | Subtract with carry ((zero page),Y)
    SBC $7C7C,Y          ; F9 7C 7C | Subtract with carry (absolute,Y)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1E1
; Address: $E2F03C
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1E1:
    JSR $1020            ; 20 20 10 | Jump to subroutine
    BPL $FE              ; 10 FE | Branch if positive
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    LDX $FCFF,Y          ; BE FF FC | Load from absolute,Y into X register
    SBC $F8C8,X          ; FD C8 F8 | Subtract with carry (absolute,X)
    INC $FEF8            ; EE F8 FE | Increment (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    LDA $02A705          ; AF 05 A7 02 | Load from absolute long address into accumulator
    ORA ($A0,X)          ; 01 A0 | Logical OR with accumulator ((zero page,X))
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    LDY #$B0             ; A0 B0 | Load immediate value into Y register
    BCS $90              ; B0 90 | Branch if carry set
    BCC $50              ; 90 50 | Branch if carry clear
    BVC $58              ; 50 58 | Branch if overflow clear
    CLI                  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1E2
; Address: $E2F07C
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1E2:
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    ORA #$C1             ; 09 C1 | Logical OR with accumulator (immediate)
    SED                  ; F8 | Set decimal mode flag
    INC $00              ; E6 00 | Increment (zero page)
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    PEA #$3EF4           ; F4 F4 3E | Push effective address to stack
    ROL $0707,X          ; 3E 07 07 | Rotate left (absolute,X)
    ORA $0419,Y          ; 19 19 04 | Logical OR with accumulator (absolute,Y)
    STA ($F1,X)          ; 81 F1 | Store accumulator to (zero page,X)
    BRA $FC              ; 80 FC | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1E3
; Address: $E2F0C9
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1E3:
    JSR $00BD            ; 20 BD 00 | Jump to subroutine
    ADC $4F00,X          ; 7D 00 4F | Add with carry (absolute,X)
    LDY #$F0             ; A0 F0 | Load immediate value into Y register
    BEQ $18              ; F0 18 | Branch if equal
    CLC                  ; 18 | Clear carry flag
    ASL $030E            ; 0E 0E 03 | Arithmetic shift left (absolute)
    BRA $80              ; 80 80 | Branch always
    WDM #$42             ; 42 42 | Hardware register operation
    BVC $10              ; 50 10 | Branch if overflow clear
    STZ $00E1            ; 9C E1 00 | Store zero to absolute
    SBC ($81,X)          ; E1 81 | Subtract with carry ((zero page,X))
    SBC ($61,X)          ; E1 61 | Subtract with carry ((zero page,X))
    LDA                  ; BF 08 9F 04 | Load from absolute long,X into accumulator
    ASL $1E00,X          ; 1E 00 1E | Arithmetic shift left (absolute,X)
    ASL $0800,X          ; 1E 00 08 | Arithmetic shift left (absolute,X)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1E5
; Address: $E2F0FE
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1E5:
    BMI $30              ; 30 30 | Branch if negative
    BMI $FE              ; 30 FE | Branch if negative
    BEQ $FF              ; F0 FF | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    LDA ($FF),Y          ; B1 FF | Load from (zero page),Y into accumulator
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    CPY #$FC             ; C0 FC | Compare Y register (immediate)
    BRA $F2              ; 80 F2 | Branch always
    CPX #$FB             ; E0 FB | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1E6
; Address: $E2F12C
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1E6:
    SBC $FE20,X          ; FD 20 FE | Subtract with carry (absolute,X)
    BMI $AC              ; 30 AC | Branch if negative
    LDY $1C1C            ; AC 1C 1C | Load from absolute address into Y register
    ORA $040D            ; 0D 0D 04 | Logical OR with accumulator (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    SBC $F139,Y          ; F9 39 F1 | Subtract with carry (absolute,Y)
    STA ($FF),Y          ; 91 FF | Store accumulator to (zero page),Y
    BIT $7F              ; 24 7F | Test bits in accumulator (zero page)
    LDA                  ; BF 0A 7F 05 | Load from absolute long,X into accumulator
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    LDA                  ; BF B4 BF B0 | Load from absolute long,X into accumulator
    BMI $FF              ; 30 FF | Branch if negative
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1E7
; Address: $E2F16B
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1E7:
    JSL $FF11FF          ; 22 FF 11 FF | Jump to subroutine long
    BRA $40              ; 80 40 | Branch always
    RTI                  ; 40 | Return from interrupt
    CLD                  ; D8 | Clear decimal mode flag
    CPY $E600            ; CC 00 E6 | Compare Y register (absolute)
    SBC $FE20,X          ; FD 20 FE | Subtract with carry (absolute,X)
    BRA $27              ; 80 27 | Branch always
    ORA $0419,Y          ; 19 19 04 | Logical OR with accumulator (absolute,Y)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    STA                  ; 9F 01 CF 00 | Store accumulator to absolute long,X
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1E9
; Address: $E2F1BA
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1E9:
    BMI $30              ; 30 30 | Branch if negative
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA $07FF            ; 0D FF 07 | Logical OR with accumulator (absolute)
    EOR ($FF,X)          ; 41 FF | Exclusive OR with accumulator ((zero page,X))
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ORA $CCFF,Y          ; 19 FF CC | Logical OR with accumulator (absolute,Y)
    INC $FFF5,X          ; FE F5 FF | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    CMP $FEFF,Y          ; D9 FF FE | Compare accumulator (absolute,Y)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BVS $FF              ; 70 FF | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    STZ $4FBF,X          ; 9E BF 4F | Store zero to absolute,X

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1EA
; Address: $E2F223
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1EA:
    AND ($FF,X)          ; 21 FF | Logical AND with accumulator ((zero page,X))
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    BPL $FF              ; 10 FF | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    LDA ($FE),Y          ; B1 FE | Load from (zero page),Y into accumulator
    REP #$FF             ; C2 FF | Reset processor status bits
    XBA                  ; EB | Exchange accumulator bytes
    ADC $FF              ; 65 FF | Add with carry (zero page)
    CLC                  ; 18 | Clear carry flag
    INC                  ; 1A | Increment accumulator
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($39),Y          ; 11 39 | Logical OR with accumulator ((zero page),Y)
    STA $DF00,X          ; 9D 00 DF | Store accumulator to absolute,X
    BRA $EF              ; 80 EF | Branch always
    BRA $FF              ; 80 FF | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1EB
; Address: $E2F270
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1EB:
    STY $84              ; 84 84 | Store Y register to zero page
    DEC $C6              ; C6 C6 | Decrement (zero page)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1EC
; Address: $E2F278
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1EC:
    JSR $1020            ; 20 20 10 | Jump to subroutine
    BPL $00              ; 10 00 | Branch if positive
    ADC ($FF,X)          ; 61 FF | Add with carry ((zero page,X))
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    BCC $FF              ; 90 FF | Branch if carry clear
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1ED
; Address: $E2F28D
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1ED:
    JSR $10FF            ; 20 FF 10 | Jump to subroutine
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    INC $F20F,X          ; FE 0F F2 | Increment (absolute,X)
    EOR $0101            ; 4D 01 01 | Exclusive OR with accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    BPL $00              ; 10 00 | Branch if positive
    ORA ($F0,X)          ; 01 F0 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1EE
; Address: $E2F2C3
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1EE:
    JSR $8C00            ; 20 00 8C | Jump to subroutine
    CPX #$01             ; E0 01 | Compare X register (immediate)
    BEQ $42              ; F0 42 | Hardware register operation
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt
    LDY #$1F             ; A0 1F | Load immediate value into Y register
    CPX #$0E             ; E0 0E | Compare X register (immediate)
    ASL $DFDF            ; 0E DF DF | Arithmetic shift left (absolute)
    STZ $8D1E,X          ; 9E 1E 8D | Store zero to absolute,X
    ORA $0707            ; 0D 07 07 | Logical OR with accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    ORA ($F1,X)          ; 01 F1 | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    STA                  ; 9F 10 1C 1C | Store accumulator to absolute long,X
    ASL $870E            ; 0E 0E 87 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1EF
; Address: $E2F2F8
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1EF:
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1F2
; Address: $E2F307
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1F2:
    JSR $007F            ; 20 7F 00 | Jump to subroutine
    INC $FF09,X          ; FE 09 FF | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    TYA                  ; 98 | Transfer Y register to accumulator
    CPY $FF              ; C4 FF | Compare Y register (zero page)
    WDM #$FF             ; 42 FF | Reserved instruction

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1F3
; Address: $E2F327
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1F3:
    JSR $19FE            ; 20 FE 19 | Jump to subroutine
    STY $FF              ; 84 FF | Store Y register to zero page
    LDA                  ; BF 41 00 00 | Load from absolute long,X into accumulator
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BMI $FF              ; 30 FF | Branch if negative
    CLC                  ; 18 | Clear carry flag
    ASL $BF              ; 06 BF | Arithmetic shift left (zero page)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    INC $FF11,X          ; FE 11 FF | Increment (absolute,X)
    ROR $FF              ; 66 FF | Rotate right (zero page)
    STY $C6FF            ; 8C FF C6 | Store Y register to absolute address
    BRA $7F              ; 80 7F | Branch always
    BRA $FF              ; 80 FF | Branch always
    BRA $F8              ; 80 F8 | Branch always
    ROL $FF              ; 26 FF | Rotate left (zero page)
    STY $46FE            ; 8C FE 46 | Store Y register to absolute address
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC $F700,X          ; FE 00 F7 | Increment (absolute,X)
    BRA $7F              ; 80 7F | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1F5
; Address: $E2F3B6
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1F5:
    JSR $0120            ; 20 20 01 | Jump to subroutine
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ASL $0FFF,X          ; 1E FF 0F | Arithmetic shift left (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1F6
; Address: $E2F3DA
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1F6:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    STA                  ; 9F FF CF FF | Store accumulator to absolute long,X
    CMP $FEFF,Y          ; D9 FF FE | Compare accumulator (absolute,Y)
    INC $F7FE,X          ; FE FE F7 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1F8
; Address: $E2F41E
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1F8:
    JSR $FF00            ; 20 00 FF | Jump to subroutine
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    BEQ $FF              ; F0 FF | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    LDY $FEFF,X          ; BC FF FE | Load from absolute,X into Y register
    SBC $1F1F,X          ; FD 1F 1F | Subtract with carry (absolute,X)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BMI $00              ; 30 00 | Branch if negative
    ORA $04FF            ; 0D FF 04 | Logical OR with accumulator (absolute)
    STX $FF              ; 86 FF | Store X register to zero page
    EOR ($FF,X)          ; 41 FF | Exclusive OR with accumulator ((zero page,X))
    LDA ($FF,X)          ; A1 FF | Load from (zero page,X) into accumulator
    CPX #$FE             ; E0 FE | Compare X register (immediate)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    PLA                  ; 68 | Pull accumulator from stack
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    LDA                  ; BF CC 4B E6 | Load from absolute long,X into accumulator
    SEP #$F1             ; E2 F1 | Set processor status bits
    SBC ($F8),Y          ; F1 F8 | Subtract with carry ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    BMI $00              ; 30 00 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    ASL $0700            ; 0E 00 07 | Arithmetic shift left (absolute)
    BPL $FF              ; 10 FF | Branch if positive
    DEY                  ; 88 | Decrement Y register
    STY $5F              ; 84 5F | Store Y register to zero page
    CPX $EF              ; E4 EF | Compare X register (zero page)
    REP #$7F             ; C2 7F | Reset processor status bits
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    SBC $FF21,X          ; FD 21 FF | Subtract with carry (absolute,X)
    CLD                  ; D8 | Clear decimal mode flag
    ROR $FF              ; 66 FF | Rotate right (zero page)
    AND $0010,Y          ; 39 10 00 | Logical AND with accumulator (absolute,Y)
    SEI                  ; 78 | Set interrupt disable flag
    BVS $FF              ; 70 FF | Branch if overflow set
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $FE              ; F0 FE | Branch if equal
    SBC $B6BF,Y          ; F9 BF B6 | Subtract with carry (absolute,Y)
    STA $02F701          ; 8F 01 F7 02 | Store accumulator to absolute long address
    RTI                  ; 40 | Return from interrupt
    BVS $70              ; 70 70 | Branch if overflow set
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    LDA                  ; BF 03 CF 01 | Load from absolute long,X into accumulator
    BRA $70              ; 80 70 | Branch always
    BRA $FC              ; 80 FC | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1FA
; Address: $E2F4F0
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1FA:
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BMI $30              ; 30 30 | Branch if negative
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    LDA $E4FB50          ; AF 50 FB E4 | Load from absolute long address into accumulator
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ASL $077F,X          ; 1E 7F 07 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1FB
; Address: $E2F510
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1FB:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BPL $FF              ; 10 FF | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    BEQ $FF              ; F0 FF | Branch if equal
    BVS $FF              ; 70 FF | Branch if overflow set
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    ADC $3EFF,Y          ; 79 FF 3E | Add with carry (absolute,Y)
    STA                  ; 9F FF CF DF | Store accumulator to absolute long,X
    CPX $E1              ; E4 E1 | Compare X register (zero page)
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1FC
; Address: $E2F57A
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1FC:
    JSR $1800            ; 20 00 18 | Jump to subroutine
    ASL $FF00,X          ; 1E 00 FF | Arithmetic shift left (absolute,X)
    AND ($FF),Y          ; 31 FF | Logical AND with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    CPY $FF              ; C4 FF | Compare Y register (zero page)
    LDA ($FF),Y          ; B1 FF | Load from (zero page),Y into accumulator
    INC $77FF            ; EE FF 77 | Increment (absolute)
    STA                  ; 9F 80 FF 60 | Store accumulator to absolute long,X
    BMI $FF              ; 30 FF | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    CPX $76FF            ; EC FF 76 | Compare X register (absolute)
    AND $00E0,Y          ; 39 E0 00 | Logical AND with accumulator (absolute,Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1FE
; Address: $E2F5CD
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1FE:
    JSR $10FF            ; 20 FF 10 | Jump to subroutine
    SBC $FEF9,X          ; FD F9 FE | Subtract with carry (absolute,X)
    INC $FDFF,X          ; FE FF FD | Increment (absolute,X)
    INC $7EFF,X          ; FE FF 7E | Increment (absolute,X)
    ROL $1FFF,X          ; 3E FF 1F | Rotate left (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA $C7C78F          ; 8F 8F C7 C7 | Store accumulator to absolute long address
    SBC ($31),Y          ; F1 31 | Subtract with carry ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank44_DmaFunction_1FF
; Address: $E2F612
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_1FF:
    CLC                  ; 18 | Clear carry flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BVS $00              ; 70 00 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    ASL $0700            ; 0E 00 07 | Arithmetic shift left (absolute)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INC $FFFE,X          ; FE FE FF | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    STA                  ; 9F 9F DF DF | Store accumulator to absolute long,X
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_200
; Address: $E2F65C
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_200:
    JSR $9000            ; 20 00 90 | Jump to subroutine
    INC $FD7E,X          ; FE 7E FD | Increment (absolute,X)
    STA $EEFF,X          ; 9D FF EE | Store accumulator to absolute,X
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ADC ($7F),Y          ; 71 7F | Add with carry ((zero page),Y)
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    LDA                  ; BF B8 DF D8 | Load from absolute long,X into accumulator
    INC $BEFF,X          ; FE FF BE | Increment (absolute,X)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank44_DmaFunction_201
; Address: $E2F698
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_201:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    TXA                  ; 8A | Transfer X register to accumulator
    SBC $FFE5,X          ; FD E5 FF | Subtract with carry (absolute,X)
    SBC $1E1F,Y          ; F9 1F 1E | Subtract with carry (absolute,Y)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    CLV                  ; B8 | Clear overflow flag
    ROR $9B9F,X          ; 7E 9F 9B | Rotate right (absolute,X)
    DEC $C6              ; C6 C6 | Decrement (zero page)
    ADC ($71),Y          ; 71 71 | Add with carry ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_202
; Address: $E2F6D8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_202:
    AND $8E00,Y          ; 39 00 8E | Logical AND with accumulator (absolute,Y)
    LDY $6FFF,X          ; BC FF 6F | Load from absolute,X into Y register
    CMP $F2FF            ; CD FF F2 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_203
; Address: $E2F6EE
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_203:
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CLV                  ; B8 | Clear overflow flag
    STA                  ; 9F 00 E7 82 | Store accumulator to absolute long,X
    CMP ($3F,X)          ; C1 3F | Compare accumulator ((zero page,X))
    BMI $C7              ; 30 C7 | Branch if negative
    CPY $F3              ; C4 F3 | Compare Y register (zero page)
    CLD                  ; D8 | Clear decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    INC $E6              ; E6 E6 | Increment (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_205
; Address: $E2F712
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_205:
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SEC                  ; 38 | Set carry flag
    ORA $FF00,Y          ; 19 00 FF | Logical OR with accumulator (absolute,Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_206
; Address: $E2F723
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_206:
    BMI $FF              ; 30 FF | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    STY $FF              ; 84 FF | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank44_DmaFunction_207
; Address: $E2F729
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_207:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    INY                  ; C8 | Increment Y register
    BEQ $00              ; F0 00 | Branch if equal
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_208
; Address: $E2F745
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_208:
    BPL $FF              ; 10 FF | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    AND ($FF,X)          ; 21 FF | Logical AND with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    BEQ $70              ; F0 70 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    INC $FF9E,X          ; FE 9E FF | Increment (absolute,X)
    INC $FF32,X          ; FE 32 FF | Increment (absolute,X)
    ORA $8DFF,Y          ; 19 FF 8D | Logical OR with accumulator (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF 7F E7 A7 | Load from absolute long,X into accumulator
    STA $809D,X          ; 9D 9D 80 | Store accumulator to absolute,X
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    DEY                  ; 88 | Decrement Y register
    CPY $00              ; C4 00 | Compare Y register (zero page)
    SBC $FE9D,X          ; FD 9D FE | Subtract with carry (absolute,X)
    DEC $E7FF            ; CE FF E7 | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_209
; Address: $E2F7AC
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_209:
    SBC $FEE9,Y          ; F9 E9 FE | Subtract with carry (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    TYA                  ; 98 | Transfer Y register to accumulator
    CPY $373F            ; CC 3F 37 | Compare Y register (absolute)
    STA                  ; 9F 9B CF CD | Store accumulator to absolute long,X
    SBC ($F1),Y          ; F1 F1 | Subtract with carry ((zero page),Y)
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_20A
; Address: $E2F7D8
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_20A:
    BMI $00              ; 30 00 | Branch if negative
    ASL $8700            ; 0E 00 87 | Arithmetic shift left (absolute)
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    BRA $FF              ; 80 FF | Branch always
    CPX $FF              ; E4 FF | Compare X register (zero page)
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    CPX $F6FE            ; EC FE F6 | Compare X register (absolute)
    INC $FFFE,X          ; FE FE FF | Increment (absolute,X)
    LDY $5EFF,X          ; BC FF 5E | Load from absolute,X into Y register
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$60             ; E0 60 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    INC $7F00,X          ; FE 00 7F | Increment (absolute,X)
    LDA                  ; BF BF EF EF | Load from absolute long,X into accumulator
    BVS $70              ; 70 70 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    ASL $881E,X          ; 1E 1E 88 | Arithmetic shift left (absolute,X)
    RTI                  ; 40 | Return from interrupt
    BPL $00              ; 10 00 | Branch if positive
    STA $00C700          ; 8F 00 C7 00 | Store accumulator to absolute long address
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    STA                  ; 9F 9F CF CF | Store accumulator to absolute long,X
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank44_DmaFunction_20C
; Address: $E2F872
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_20C:
    BMI $00              ; 30 00 | Branch if negative
    CLV                  ; B8 | Clear overflow flag
    STA ($91),Y          ; 91 91 | Store accumulator to (zero page),Y
    SBC ($F1),Y          ; F1 F1 | Subtract with carry ((zero page),Y)
    BEQ $F0              ; F0 F0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    ROR $0E00            ; 6E 00 0E | Rotate right (absolute)
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    INC $FF1F            ; EE 1F FF | Increment (absolute)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_20D
; Address: $E2F8A9
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_20D:
    JSR $27DD            ; 20 DD 27 | Jump to subroutine
    AND ($FF,X)          ; 21 FF | Logical AND with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    SBC ($F1),Y          ; F1 F1 | Subtract with carry ((zero page),Y)
    INC $9FE0            ; EE E0 9F | Increment (absolute)
    BRA $9F              ; 80 9F | Branch always
    BRA $0D              ; 80 0D | Branch always
    CPY #$CF             ; C0 CF | Compare Y register (immediate)
    BMI $9F              ; 30 9F | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_20E
; Address: $E2F8CB
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_20E:
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    BCC $00              ; 90 00 | Branch if carry clear
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    BPL $DF              ; 10 DF | Branch if positive

;------------------------------------------------------------------------------
; Bank44_DmaFunction_20F
; Address: $E2F8E9
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_20F:
    JSR $AFDF            ; 20 DF AF | Jump to subroutine
    STA $FF20FF          ; 8F FF 20 FF | Store accumulator to absolute long address
    BEQ $F0              ; F0 F0 | Branch if equal
    STA $001F80          ; 8F 80 1F 00 | Store accumulator to absolute long address
    CPX #$1F             ; E0 1F | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_210
; Address: $E2F905
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_210:
    JSR $03FF            ; 20 FF 03 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    INC $DF21,X          ; FE 21 DF | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_211
; Address: $E2F90F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_211:
    JSR $FFFF            ; 20 FF FF | Jump to subroutine
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    INC $D000,X          ; FE 00 D0 | Increment (absolute,X)
    CLC                  ; 18 | Clear carry flag
    STZ $E917            ; 9C 17 E9 | Store zero to absolute
    STA $FC              ; 85 FC | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank44_DmaFunction_212
; Address: $E2F92F
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_212:
    JSR $E1E1            ; 20 E1 E1 | Jump to subroutine
    SBC #$F6             ; E9 F6 | Subtract with carry (immediate)
    SED                  ; F8 | Set decimal mode flag
    LDA $CDB2,X          ; BD B2 CD | Load from absolute,X into accumulator
    SBC #$00             ; E9 00 | Subtract with carry (immediate)
    BMI $00              ; 30 00 | Branch if negative
    DEC $F7FF            ; CE FF F7 | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_213
; Address: $E2F966
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_213:
    STX $468E            ; 8E 8E 46 | Store X register to absolute address
    LSR $23              ; 46 23 | Logical shift right (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    LDA $DC00,Y          ; B9 00 DC | Load from absolute,Y into accumulator
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    SBC $7CC9,Y          ; F9 C9 7C | Subtract with carry (absolute,Y)
    ROL $8F3E,X          ; 3E 3E 8F | Rotate left (absolute,X)
    STA $30CFCF          ; 8F CF CF 30 | Store accumulator to absolute long address
    CLC                  ; 18 | Clear carry flag
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    BVS $00              ; 70 00 | Branch if overflow set
    BMI $00              ; 30 00 | Branch if negative
    LDA                  ; BF BF FF FF | Load from absolute long,X into accumulator
    ADC $3C7D,X          ; 7D 7D 3C | Add with carry (absolute,X)
    ASL $8F1E,X          ; 1E 1E 8F | Arithmetic shift left (absolute,X)
    STA $000000          ; 8F 00 00 00 | Store accumulator to absolute long address
    RTI                  ; 40 | Return from interrupt
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    BVS $00              ; 70 00 | Branch if overflow set
    ROR $3E7E,X          ; 7E 7E 3E | Rotate right (absolute,X)
    ROL $9F9F,X          ; 3E 9F 9F | Rotate left (absolute,X)
    SBC $7CF9,Y          ; F9 F9 7C | Subtract with carry (absolute,Y)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_214
; Address: $E2F9D6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_214:
    BMI $00              ; 30 00 | Branch if negative
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    SBC ($E1,X)          ; E1 E1 | Subtract with carry ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_216
; Address: $E2F9EE
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_216:
    BVS $70              ; 70 70 | Branch if overflow set
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    ASL $9F00,X          ; 1E 00 9F | Arithmetic shift left (absolute,X)
    STA $EFFF00          ; 8F 00 FF EF | Store accumulator to absolute long address
    STA                  ; 9F 9F E7 E7 | Store accumulator to absolute long,X
    BEQ $F0              ; F0 F0 | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_217
; Address: $E2FA16
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_217:
    CLC                  ; 18 | Clear carry flag
    BEQ $10              ; F0 10 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    CPX $FEFE            ; EC FE FE | Compare X register (absolute)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_218
; Address: $E2FA36
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_218:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    ROR $3F00,X          ; 7E 00 3F | Rotate right (absolute,X)
    STA $E7E78F          ; 8F 8F E7 E7 | Store accumulator to absolute long address
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    DEC $3FDE,X          ; DE DE 3F | Decrement (absolute,X)
    BEQ $00              ; F0 00 | Branch if equal
    BVS $00              ; 70 00 | Branch if overflow set
    CLC                  ; 18 | Clear carry flag
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BEQ $F0              ; F0 F0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ROL $1F3E,X          ; 3E 3E 1F | Rotate left (absolute,X)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    CPX #$00             ; E0 00 | Compare X register (immediate)
    LDA                  ; BF 4C 9F 7C | Load from absolute long,X into accumulator
    STX $CB71            ; 8E 71 CB | Store X register to absolute address
    NOP                  ; EA | No operation
    INC $FCED,X          ; FE ED FC | Increment (absolute,X)
    SBC $00FE,X          ; FD FE 00 | Subtract with carry (absolute,X)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    STA                  ; 9F E4 1F EC | Store accumulator to absolute long,X
    STA                  ; 9F FE 0D FC | Store accumulator to absolute long,X
    CPX #$00             ; E0 00 | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    ADC ($FF,X)          ; 61 FF | Add with carry ((zero page,X))
    SBC ($FE,X)          ; E1 FE | Subtract with carry ((zero page,X))
    SBC ($FC,X)          ; E1 FC | Subtract with carry ((zero page,X))
    CPY #$3B             ; C0 3B | Compare Y register (immediate)
    CPY $0F              ; C4 0F | Compare Y register (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CPY $00              ; C4 00 | Compare Y register (zero page)
    SEC                  ; 38 | Set carry flag
    CPY #$EF             ; C0 EF | Compare Y register (immediate)
    ASL $1FFF            ; 0E FF 1F | Arithmetic shift left (absolute)
    LSR $BA              ; 46 BA | Logical shift right (zero page)
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_219
; Address: $E2FB10
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_219:
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    INC $FF75,X          ; FE 75 FF | Increment (absolute,X)
    PLY                  ; 7A | Pull Y register from stack
    SED                  ; F8 | Set decimal mode flag
    PHA                  ; 48 | Push accumulator to stack
    BEQ $00              ; F0 00 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    INY                  ; C8 | Increment Y register
    LDY $FDFE,X          ; BC FE FD | Load from absolute,X into Y register
    SBC $9D36,Y          ; F9 36 9D | Subtract with carry (absolute,Y)
    ROR $31CE            ; 6E CE 31 | Rotate right (absolute)
    INC $79              ; E6 79 | Increment (zero page)
    BMI $00              ; 30 00 | Branch if negative
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $0C00,X          ; 1D 00 0C | Logical OR with accumulator (absolute,X)
    AND ($21,X)          ; 21 21 | PPU graphics register access
    BPL $10              ; 10 10 | Branch if positive
    STZ $DE00            ; 9C 00 DE | Store zero to absolute
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_21B
; Address: $E2FB86
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_21B:
    BMI $30              ; 30 30 | Branch if negative
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    STA                  ; 9F 00 CF 00 | Store accumulator to absolute long,X
    SBC $FE00,Y          ; F9 00 FE | Subtract with carry (absolute,Y)
    ASL $870E            ; 0E 0E 87 | Arithmetic shift left (absolute)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    SEI                  ; 78 | Set interrupt disable flag
    LDA                  ; BF 00 FF 00 | Load from absolute long,X into accumulator
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ADC $7F00,X          ; 7D 00 7F | Add with carry (absolute,X)
    LDA                  ; BF 00 FF 00 | Load from absolute long,X into accumulator
    ASL $020E            ; 0E 0E 02 | Arithmetic shift left (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    SBC $FE00,X          ; FD 00 FE | Subtract with carry (absolute,X)
    STA $03038F          ; 8F 8F 03 03 | Store accumulator to absolute long address
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BVS $00              ; 70 00 | Branch if overflow set
    BEQ $F0              ; F0 F0 | Branch if equal

;------------------------------------------------------------------------------
; Bank44_DmaFunction_21C
; Address: $E2FC22
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_21C:
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ROL $1E3E,X          ; 3E 3E 1E | Rotate left (absolute,X)
    ASL $0707,X          ; 1E 07 07 | Arithmetic shift left (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    LDA                  ; BF 00 0F 0F | Load from absolute long,X into accumulator
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    BMI $30              ; 30 30 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BEQ $00              ; F0 00 | Branch if equal
    ROL $1F00,X          ; 3E 00 1F | Rotate left (absolute,X)
    SBC $FFFE,X          ; FD FE FF | Subtract with carry (absolute,X)
    BRA $FD              ; 80 FD | Branch always
    SBC $FDD3            ; ED D3 FD | Subtract with carry (absolute)
    DEC $F9              ; C6 F9 | Decrement (zero page)
    INC $FEF1            ; EE F1 FE | Increment (absolute)
    SBC ($FE),Y          ; F1 FE | Subtract with carry ((zero page),Y)
    BIT #$1E             ; 89 1E | Test bits in accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    SBC $F9F9,Y          ; F9 F9 F9 | Subtract with carry (absolute,Y)
    SBC $F9F9,Y          ; F9 F9 F9 | Subtract with carry (absolute,Y)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CPY #$FB             ; C0 FB | Compare Y register (immediate)
    CPY $FE              ; C4 FE | Compare Y register (zero page)
    CMP ($FD),Y          ; D1 FD | Compare accumulator ((zero page),Y)
    SBC $FEFE,X          ; FD FE FE | Subtract with carry (absolute,X)
    INC $FEEE            ; EE EE FE | Increment (absolute)
    INC $FCFF,X          ; FE FF FC | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_21D
; Address: $E2FCF8
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_21D:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $EF              ; 10 EF | Branch if positive
    JMP $CF3CC3          ; 5C C3 3C CF | Jump to address long
    BCS $7F              ; B0 7F | Branch if carry set
    RTI                  ; 40 | Return from interrupt
    ROR $7E41,X          ; 7E 41 7E | Rotate right (absolute,X)
    EOR ($FF,X)          ; 41 FF | Exclusive OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $00              ; 10 00 | Branch if positive
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    INC $FE61,X          ; FE 61 FE | Increment (absolute,X)
    SBC $7FFC,Y          ; F9 FC 7F | Subtract with carry (absolute,Y)
    SBC $F972,X          ; FD 72 F9 | Subtract with carry (absolute,X)
    SBC $FE66,Y          ; F9 66 FE | Subtract with carry (absolute,Y)
    AND ($7B,X)          ; 21 7B | Logical AND with accumulator ((zero page,X))
    STY $00              ; 84 00 | Store Y register to zero page
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BEQ $0F              ; F0 0F | Branch if equal
    INC $FBFF,X          ; FE FF FB | Increment (absolute,X)
    BEQ $FF              ; F0 FF | Branch if equal
    CPY $FFFF            ; CC FF FF | Compare Y register (absolute)
    CPY $F8D8            ; CC D8 F8 | Compare Y register (absolute)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    STA $FF03FF          ; 8F FF 03 FF | Store accumulator to absolute long address
    STA $FF03FF          ; 8F FF 03 FF | Store accumulator to absolute long address
    CPY #$27             ; C0 27 | Compare Y register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    STA                  ; 9F FF E3 FF | Store accumulator to absolute long,X
    STA                  ; 9F 60 5F E0 | Store accumulator to absolute long,X
    LDA $2020FF          ; AF FF 20 20 | Load from absolute long address into accumulator
    INC $7EFF,X          ; FE FF 7E | Increment (absolute,X)
    ROR $7EFF,X          ; 7E FF 7E | Rotate right (absolute,X)
    ROR $7EFF,X          ; 7E FF 7E | Rotate right (absolute,X)
    ROR $6EFF            ; 6E FF 6E | Rotate right (absolute)

;------------------------------------------------------------------------------
; Bank44_DmaFunction_21E
; Address: $E2FE0D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_21E:
    JSR $21FF            ; 20 FF 21 | PPU graphics register access
    ADC $7DFF,X          ; 7D FF 7D | Add with carry (absolute,X)
    LDY $BCFF,X          ; BC FF BC | Load from absolute,X into Y register
    LDY $7E8F,X          ; BC 8F 7E | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank44_DmaFunction_220
; Address: $E2FE3E
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_220:
    JSR $7F00            ; 20 00 7F | Jump to subroutine
    ROL $BF3E,X          ; 3E 3E BF | Rotate left (absolute,X)
    LDA                  ; BF 9F 1F 8F | Load from absolute long,X into accumulator
    STA $0F8F0F          ; 8F 0F 8F 0F | Store accumulator to absolute long address
    BRA $00              ; 80 00 | Branch always
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank44_DmaFunction_221
; Address: $E2FE5A
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_221:
    BVS $00              ; 70 00 | Branch if overflow set
    BVS $00              ; 70 00 | Branch if overflow set
    BVS $00              ; 70 00 | Branch if overflow set
    LDA                  ; BF 7A 7F 72 | Load from absolute long,X into accumulator
    LDA ($FF),Y          ; B1 FF | Load from (zero page),Y into accumulator
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    SBC ($FD),Y          ; F1 FD | Subtract with carry ((zero page),Y)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CLC                  ; 18 | Clear carry flag
    DEC $C831            ; CE 31 C8 | Decrement (absolute)
    SBC #$D6             ; E9 D6 | Subtract with carry (immediate)
    NOP                  ; EA | No operation
    INC $FE65,X          ; FE 65 FE | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    PEA #$FFFF           ; F4 FF FF | Push effective address to stack
    REP #$3D             ; C2 3D | Reset processor status bits
    BIT #$7F             ; 89 7F | Test bits in accumulator (immediate)
    STA $FF              ; 85 FF | Store accumulator to zero page
    PHB                  ; 8B | Push data bank register to stack
    AND $46FF,X          ; 3D FF 46 | Logical AND with accumulator (absolute,X)
    BIT #$FF             ; 89 FF | Test bits in accumulator (immediate)
    LDA $BA7F,X          ; BD 7F BA | Load from absolute,X into accumulator
    ROR $FC7C,X          ; 7E 7C FC | Rotate right (absolute,X)
    SBC $FAF9,Y          ; F9 F9 FA | Subtract with carry (absolute,Y)
    DEC $FCDF,X          ; DE DF FC | Decrement (absolute,X)
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    LDA                  ; BF FF BF FF | Load from absolute long,X into accumulator
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    ADC $EF7F,Y          ; 79 7F EF | Add with carry (absolute,Y)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    DEC                  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank44_DmaFunction_222
; Address: $E2FF32
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_222:
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BEQ $FF              ; F0 FF | Branch if equal
    PLX                  ; FA | Pull X register from stack
    CPX $04FF            ; EC FF 04 | Compare X register (absolute)
    DEC                  ; 3A | Decrement accumulator
    INC $FFE3,X          ; FE E3 FF | Increment (absolute,X)
    ASL $03FF            ; 0E FF 03 | Arithmetic shift left (absolute)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank44_DmaFunction_223
; Address: $E2FF56
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_223:
    JSR $F1FF            ; 20 FF F1 | Jump to subroutine
    BVS $73              ; 70 73 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BRA $7F              ; 80 7F | Branch always
    BRA $FF              ; 80 FF | Branch always
    CMP $BBFF            ; CD FF BB | Compare accumulator (absolute)
    LDA                  ; BF FF BF FF | Load from absolute long,X into accumulator
    ROR $6EFF,X          ; 7E FF 6E | Rotate right (absolute,X)
    ROL $66FF            ; 2E FF 66 | Rotate left (absolute)
    BVS $F3              ; 70 F3 | Branch if overflow set
    JMP ($0000)          ; 6C 00 00 | Jump to address (absolute indirect)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($89,X)          ; 01 89 | Logical OR with accumulator ((zero page,X))
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    BRA $02              ; 80 02 | Branch always
    BRA $03              ; 80 03 | Branch always
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank44_DmaFunction_224
; Address: $E2FFAD
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank44_DmaFunction_224:
    JSR $6008            ; 20 08 60 | Jump to subroutine
    ROR $7D7E,X          ; 7E 7E 7D | Rotate right (absolute,X)
    ADC $7C7C,X          ; 7D 7C 7C | Add with carry (absolute,X)
    LDA $EEC5FF          ; AF FF C5 EE | Load from absolute long address into accumulator
    INC $FEE2,X          ; FE E2 FE | Increment (absolute,X)
    INC $7F70            ; EE 70 7F | Increment (absolute)
    LDA ($FF,X)          ; A1 FF | Load from (zero page,X) into accumulator
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    EOR ($41,X)          ; 41 41 | Exclusive OR with accumulator ((zero page,X))
    ADC $2161,Y          ; 79 61 21 | PPU graphics register access
    ORA $417F,Y          ; 19 7F 41 | Logical OR with accumulator (absolute,Y)
    ADC $3C62,X          ; 7D 62 3C | Add with carry (absolute,X)
    ROR $BE00,X          ; 7E 00 BE | Rotate right (absolute,X)
    STX $00              ; 86 00 | Store X register to zero page
    DEC $00              ; C6 00 | Decrement (zero page)
    STY $8C00            ; 8C 00 8C | Store Y register to absolute address
