;==============================================================================
; Dragon Quest III - Bank $48
; Type: Dma
; Purpose: DMA operations and data transfer
; Address Range: $E40000-$E47FFF
; Instructions: 8726
; Bytes: 32768
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_48"

;------------------------------------------------------------------------------
; Bank48_DmaFunction_000
; Address: $E48001
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_000:
    STY $F9              ; 84 F9 | Store Y register to zero page
    ASL $86              ; 06 86 | Arithmetic shift left (zero page)
    ADC $F906,Y          ; 79 06 F9 | Add with carry (absolute,Y)
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    SBC $7E81,X          ; FD 81 7E | Subtract with carry (absolute,X)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF FF DF FF | Load from absolute long,X into accumulator
    AND ($5C,X)          ; 21 5C | Logical AND with accumulator ((zero page,X))
    JMP ($FE01)          ; 6C 01 FE | Jump to address (absolute indirect)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_001
; Address: $E48027
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_001:
    STA                  ; 9F 00 FF 11 | Store accumulator to absolute long,X
    INC $7F80            ; EE 80 7F | Increment (absolute)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    SBC $FE01,Y          ; F9 01 FE | Subtract with carry (absolute,Y)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    STA ($70,X)          ; 81 70 | Store accumulator to (zero page,X)
    ASL $E1              ; 06 E1 | Arithmetic shift left (zero page)
    LDA                  ; BF FF FF FF | Load from absolute long,X into accumulator
    BPL $EF              ; 10 EF | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    EOR $6882,X          ; 5D 82 68 | Exclusive OR with accumulator (absolute,X)
    STZ $8463            ; 9C 63 84 | Store zero to absolute
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    BPL $E3              ; 10 E3 | Branch if positive
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank48_DmaFunction_002
; Address: $E48084
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_002:
    JSR $449F            ; 20 9F 44 | Jump to subroutine
    BRA $7F              ; 80 7F | Branch always
    BRA $7D              ; 80 7D | Branch always
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 00 FF FC | Load from absolute long,X into accumulator
    SBC $FFFF,X          ; FD FF FF | Subtract with carry (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    BRA $7F              ; 80 7F | Branch always
    EOR ($BE,X)          ; 41 BE | Exclusive OR with accumulator ((zero page,X))
    ADC ($FF),Y          ; 71 FF | Add with carry ((zero page),Y)
    SEP #$FF             ; E2 FF | Set processor status bits
    SBC $FF              ; E5 FF | Subtract with carry (zero page)
    SBC $F9FF,Y          ; F9 FF F9 | Subtract with carry (absolute,Y)
    BEQ $1F              ; F0 1F | Branch if equal
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    CPY #$9A             ; C0 9A | Compare Y register (immediate)
    ADC $46              ; 65 46 | Add with carry (zero page)
    LDA $F30C,Y          ; B9 0C F3 | Load from absolute,Y into accumulator
    PHP                  ; 08 | Push processor status to stack
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$E0             ; E0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank48_DmaFunction_003
; Address: $E480D4
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_003:
    BRA $C0              ; 80 C0 | Branch always
    REP #$E7             ; C2 E7 | Reset processor status bits
    INC $98FF,X          ; FE FF 98 | Increment (absolute,X)
    SEC                  ; 38 | Set carry flag
    BEQ $07              ; F0 07 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    STA $18E7,X          ; 9D E7 18 | Store accumulator to absolute,X
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    BPL $38              ; 10 38 | Branch if positive
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    STA $1818,X          ; 9D 18 18 | Store accumulator to absolute,X
    ASL $00F1            ; 0E F1 00 | Arithmetic shift left (absolute)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BRA $7F              ; 80 7F | Branch always
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SBC ($F1),Y          ; F1 F1 | Subtract with carry ((zero page),Y)
    CPX #$FE             ; E0 FE | Compare X register (immediate)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    BEQ $3F              ; F0 3F | Branch if equal
    CPY #$FE             ; C0 FE | Compare Y register (immediate)
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    INC $E0FE,X          ; FE FE E0 | Game work RAM access
    BEQ $80              ; F0 80 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($C1,X)          ; 01 C1 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ORA ($E3,X)          ; 01 E3 | Logical OR with accumulator ((zero page,X))
    ORA $0CF3,X          ; 1D F3 0C | Logical OR with accumulator (absolute,X)
    AND $3FC2,X          ; 3D C2 3F | Logical AND with accumulator (absolute,X)
    INY                  ; C8 | Increment Y register
    AND $01              ; 25 01 | Logical AND with accumulator (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $0C00,X          ; 1D 00 0C | Logical OR with accumulator (absolute,X)
    REP #$88             ; C2 88 | Reset processor status bits
    INY                  ; C8 | Increment Y register
    PHB                  ; 8B | Push data bank register to stack
    ORA $25              ; 05 25 | Logical OR with accumulator (zero page)
    CMP $D0FB,Y          ; D9 FB D0 | Compare accumulator (absolute,Y)
    BEQ $7F              ; F0 7F | Branch if equal
    PLX                  ; FA | Pull X register from stack
    SED                  ; F8 | Set decimal mode flag
    CPY $DDDD            ; CC DD DD | Compare Y register (absolute)
    BNE $D0              ; D0 D0 | Branch if not equal
    BVS $70              ; 70 70 | Branch if overflow set
    ORA $0706,X          ; 1D 06 07 | Logical OR with accumulator (absolute,X)
    RTI                  ; 40 | Return from interrupt
    LDA $1BE0            ; AD E0 1B | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank48_DmaFunction_004
; Address: $E48186
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_004:
    LDY #$59             ; A0 59 | Load immediate value into Y register
    BRA $78              ; 80 78 | Branch always
    BRA $78              ; 80 78 | Branch always
    BCS $4C              ; B0 4C | Branch if carry set
    BRA $7C              ; 80 7C | Branch always
    DEC $B6              ; C6 B6 | Decrement (zero page)
    PHX                  ; DA | Push X register to stack
    PLX                  ; FA | Pull X register from stack
    SBC $F7FD,X          ; FD FD F7 | Subtract with carry (absolute,X)
    PHB                  ; 8B | Push data bank register to stack
    PHB                  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank48_DmaFunction_005
; Address: $E481A0
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_005:
    JSR $A05F            ; 20 5F A0 | Jump to subroutine
    SBC $8F50,X          ; FD 50 8F | Subtract with carry (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    STZ $C861,X          ; 9E 61 C8 | Store zero to absolute,X
    BRA $7F              ; 80 7F | Branch always
    SBC $F7FF,Y          ; F9 FF F7 | Subtract with carry (absolute,Y)
    INC $ECFF,X          ; FE FF EC | Increment (absolute,X)
    BIT #$74             ; 89 74 | Test bits in accumulator (immediate)
    PHB                  ; 8B | Push data bank register to stack
    BMI $CF              ; 30 CF | Branch if negative
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF FF 7F FF | Load from absolute long,X into accumulator
    LDA $FF00,Y          ; B9 00 FF | Load from absolute,Y into accumulator
    SBC $FFFF,X          ; FD FF FF | Subtract with carry (absolute,X)
    CPY $92FF            ; CC FF 92 | Compare Y register (absolute)
    CPX $47FF            ; EC FF 47 | Compare X register (absolute)
    CLV                  ; B8 | Clear overflow flag
    BCS $20              ; B0 20 | Branch if carry set
    ORA $31E6,Y          ; 19 E6 31 | Logical OR with accumulator (absolute,Y)
    CPY $9C61            ; CC 61 9C | Compare Y register (absolute)
    STA $FFFF,X          ; 9D FF FF | Store accumulator to absolute,X
    BCC $6F              ; 90 6F | Branch if carry clear
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    JMP $C6B1            ; 4C B1 C6 | Jump to address
    AND $FD02,Y          ; 39 02 FD | Logical AND with accumulator (absolute,Y)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    REP #$3D             ; C2 3D | Reset processor status bits
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    EOR #$FF             ; 49 FF | Exclusive OR with accumulator (immediate)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank48_DmaFunction_006
; Address: $E48244
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_006:
    JSR $30DF            ; 20 DF 30 | Jump to subroutine
    STA $FF07FF          ; 8F FF 07 FF | Store accumulator to absolute long address
    BVS $FF              ; 70 FF | Branch if overflow set
    BEQ $FF              ; F0 FF | Branch if equal
    INC $00FF,X          ; FE FF 00 | Increment (absolute,X)
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always

;------------------------------------------------------------------------------
; Bank48_DmaFunction_007
; Address: $E4826E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_007:
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 7F FF CF | Load from absolute long,X into accumulator
    AND ($FF,X)          ; 21 FF | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank48_DmaFunction_008
; Address: $E4827C
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_008:
    JSR $077F            ; 20 7F 07 | Jump to subroutine
    LDA                  ; BF 63 9C 23 | Load from absolute long,X into accumulator
    SBC $FD02,X          ; FD 02 FD | Subtract with carry (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    STA $FFFEFF          ; 8F FF FE FF | Store accumulator to absolute long address
    INC $C7FF,X          ; FE FF C7 | Increment (absolute,X)
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    CPX $9C63            ; EC 63 9C | Compare X register (absolute)
    EOR ($BE,X)          ; 41 BE | Exclusive OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BPL $EF              ; 10 EF | Branch if positive
    ADC ($9E,X)          ; 61 9E | Add with carry ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ASL $C39E            ; 0E 9E C3 | Arithmetic shift left (absolute)
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$0F             ; E0 0F | Compare X register (immediate)
    BEQ $6F              ; F0 6F | Branch if equal
    BCC $00              ; 90 00 | Branch if carry clear
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPX #$80             ; E0 80 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BCC $FF              ; 90 FF | Branch if carry clear
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank48_DmaFunction_009
; Address: $E48303
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_009:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank48_DmaFunction_00A
; Address: $E48312
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_00A:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    EOR ($FF,X)          ; 41 FF | Exclusive OR with accumulator ((zero page,X))
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank48_DmaFunction_00B
; Address: $E4832B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_00B:
    JSR $80FF            ; 20 FF 80 | Jump to subroutine
    ORA ($41,X)          ; 01 41 | Logical OR with accumulator ((zero page,X))
    EOR ($0C,X)          ; 41 0C | Exclusive OR with accumulator ((zero page,X))
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank48_DmaFunction_00D
; Address: $E4833F
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_00D:
    ORA ($F1,X)          ; 01 F1 | Logical OR with accumulator ((zero page,X))
    STX $17E8            ; 8E E8 17 | Store X register to absolute address
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    LDY $797B            ; AC 7B 79 | Load from absolute address into Y register
    INC $CC32,X          ; FE 32 CC | Increment (absolute,X)
    PLA                  ; 68 | Pull accumulator from stack
    RTI                  ; 40 | Return from interrupt
    LDX $8F8F,Y          ; BE 8F 8F | Load from absolute,Y into X register
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank48_DmaFunction_00E
; Address: $E48354
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_00E:
    JSR $2C3F            ; 20 3F 2C | Jump to subroutine
    EOR ($71),Y          ; 51 71 | Exclusive OR with accumulator ((zero page),Y)
    DEC $6D80,X          ; DE 80 6D | Decrement (absolute,X)
    RTI                  ; 40 | Return from interrupt
    LDY $88              ; A4 88 | Load from zero page into Y register
    LDY $5B              ; A4 5B | Load from zero page into Y register
    BCS $4C              ; B0 4C | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_00F
; Address: $E4836F
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_00F:
    ASL $A9A9,X          ; 1E A9 A9 | Arithmetic shift left (absolute,X)
    CMP $66CD            ; CD CD 66 | Compare accumulator (absolute)
    INC $FEA6,X          ; FE A6 FE | Increment (absolute,X)
    SBC $80F9,Y          ; F9 F9 80 | Subtract with carry (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 48 B7 11 | Load from absolute long,X into accumulator
    INC $CE31            ; EE 31 CE | Increment (absolute)
    BMI $CF              ; 30 CF | Branch if negative
    INC $F7FF,X          ; FE FF F7 | Increment (absolute,X)
    INC $FFFF            ; EE FF FF | Increment (absolute)
    SBC $F0FF,Y          ; F9 FF F0 | Subtract with carry (absolute,Y)
    INY                  ; C8 | Increment Y register
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BRA $7F              ; 80 7F | Branch always
    AND ($DE,X)          ; 21 DE | Logical AND with accumulator ((zero page,X))
    BMI $CF              ; 30 CF | Branch if negative

;------------------------------------------------------------------------------
; Bank48_DmaFunction_010
; Address: $E483AC
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_010:
    JSR $00DF            ; 20 DF 00 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    DEC $3BFF,X          ; DE FF 3B | Decrement (absolute,X)
    SBC $2CFF,Y          ; F9 FF 2C | Subtract with carry (absolute,Y)
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    ADC ($FF,X)          ; 61 FF | Add with carry ((zero page,X))
    ADC ($FF,X)          ; 61 FF | Add with carry ((zero page,X))
    REP #$FF             ; C2 FF | Reset processor status bits
    INY                  ; C8 | Increment Y register
    CLI                  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank48_DmaFunction_011
; Address: $E483DE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_011:
    JSL $BF40FF          ; 22 FF 40 BF | Jump to subroutine long
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    EOR ($FF,X)          ; 41 FF | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank48_DmaFunction_012
; Address: $E483F6
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_012:
    AND ($FF,X)          ; 21 FF | Logical AND with accumulator ((zero page,X))
    BPL $FF              ; 10 FF | Branch if positive
    BCC $FF              ; 90 FF | Branch if carry clear
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    ROL $62FF,X          ; 3E FF 62 | Rotate left (absolute,X)
    STA $9C63,X          ; 9D 63 9C | Store accumulator to absolute,X
    STZ $7E81            ; 9C 81 7E | Store zero to absolute
    BRA $7F              ; 80 7F | Branch always
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    BEQ $FF              ; F0 FF | Branch if equal
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    SED                  ; F8 | Set decimal mode flag
    STX $0071            ; 8E 71 00 | Store X register to absolute address
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    SBC $F8E0,X          ; FD E0 F8 | Subtract with carry (absolute,X)
    CPY #$F1             ; C0 F1 | Compare Y register (immediate)
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    AND $0FFF,X          ; 3D FF 0F | Logical AND with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    CMP ($F7,X)          ; C1 F7 | Compare accumulator ((zero page,X))
    BCC $F9              ; 90 F9 | Branch if carry clear
    SBC $FF00,Y          ; F9 00 FF | Subtract with carry (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    BCS $FF              ; B0 FF | Branch if carry set
    ADC ($FF),Y          ; 71 FF | Add with carry ((zero page),Y)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CLV                  ; B8 | Clear overflow flag
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    PLX                  ; FA | Pull X register from stack
    ORA $0F              ; 05 0F | Logical OR with accumulator (zero page)
    INC $B800,X          ; FE 00 B8 | Increment (absolute,X)
    CPY #$F8             ; C0 F8 | Compare Y register (immediate)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    CMP $3A              ; C5 3A | Compare accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    CPY $3B              ; C4 3B | Compare Y register (zero page)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    STX $E7              ; 86 E7 | Store X register to zero page
    DEC                  ; 3A | Decrement accumulator
    SEC                  ; 38 | Set carry flag
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank48_DmaFunction_013
; Address: $E484A4
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_013:
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    BRA $DE              ; 80 DE | Branch always
    INC $F8F8,X          ; FE F8 F8 | Increment (absolute,X)
    DEC $FE              ; C6 FE | Decrement (zero page)
    ROL $3E              ; 26 3E | Rotate left (zero page)
    ASL $001E,X          ; 1E 1E 00 | Arithmetic shift left (absolute,X)
    BRA $FF              ; 80 FF | Branch always
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    ASL $4FFF            ; 0E FF 4F | Arithmetic shift left (absolute)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    STA $050570          ; 8F 70 05 05 | Store accumulator to absolute long address
    ASL $4F0E            ; 0E 0E 4F | Arithmetic shift left (absolute)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BPL $10              ; 10 10 | Branch if positive
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    SBC ($F0,X)          ; E1 F0 | Subtract with carry ((zero page,X))
    SBC ($FE,X)          ; E1 FE | Subtract with carry ((zero page,X))
    PHX                  ; DA | Push X register to stack
    SBC $D8              ; E5 D8 | Subtract with carry (zero page)
    CPX #$80             ; E0 80 | Compare X register (immediate)
    BNE $80              ; D0 80 | Branch if not equal
    BVC $00              ; 50 00 | Branch if overflow clear
    CPX #$E0             ; E0 E0 | Game work RAM access
    INC $F1FE,X          ; FE FE F1 | Increment (absolute,X)
    LDA $2F2FAF          ; AF AF 2F 2F | Load from absolute long address into accumulator

;------------------------------------------------------------------------------
; Bank48_DmaFunction_014
; Address: $E48500
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_014:
    JSR $00DF            ; 20 DF 00 | Jump to subroutine
    BEQ $00              ; F0 00 | Branch if equal
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    BMI $00              ; 30 00 | Branch if negative
    ROR $66              ; 66 66 | Rotate right (zero page)
    ROL $26              ; 26 26 | Rotate left (zero page)
    STZ $FF9E,X          ; 9E 9E FF | Store zero to absolute,X
    BPL $2F              ; 10 2F | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    STA $00C700          ; 8F 00 C7 00 | Store accumulator to absolute long address
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    BVS $70              ; 70 70 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    INC $FFFE,X          ; FE FE FF | Increment (absolute,X)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank48_DmaFunction_016
; Address: $E48552
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_016:
    STY $1EFF            ; 8C FF 1E | Store Y register to absolute address
    AND ($FF),Y          ; 31 FF | Logical AND with accumulator ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    CLC                  ; 18 | Clear carry flag
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ADC ($FF),Y          ; 71 FF | Add with carry ((zero page),Y)
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    STZ $FF              ; 64 FF | Store zero to zero page
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    LDY $7F80,X          ; BC 80 7F | Load from absolute,X into Y register
    BRA $7F              ; 80 7F | Branch always
    BPL $EF              ; 10 EF | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_017
; Address: $E48589
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_017:
    STA                  ; 9F 60 9F 60 | Store accumulator to absolute long,X
    STA                  ; 9F 04 FB FF | Store accumulator to absolute long,X
    CPX $FF              ; E4 FF | Compare X register (zero page)
    PHB                  ; 8B | Push data bank register to stack
    LDA                  ; BF FF 7B FF | Load from absolute long,X into accumulator
    SEI                  ; 78 | Set interrupt disable flag
    ROR $FF              ; 66 FF | Rotate right (zero page)
    ASL $03FF            ; 0E FF 03 | Arithmetic shift left (absolute)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 02 FD C3 | Load from absolute long,X into accumulator
    ADC ($9E,X)          ; 61 9E | Add with carry ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    BEQ $FF              ; F0 FF | Branch if equal
    LDX $DFFF,Y          ; BE FF DF | Load from absolute,Y into X register
    EOR ($FF,X)          ; 41 FF | Exclusive OR with accumulator ((zero page,X))
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    BRA $7F              ; 80 7F | Branch always
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank48_DmaFunction_019
; Address: $E485D8
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_019:
    BCC $FF              ; 90 FF | Branch if carry clear
    ASL $20FF,X          ; 1E FF 20 | Arithmetic shift left (absolute,X)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank48_DmaFunction_01A
; Address: $E485F6
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_01A:
    JSR $24FE            ; 20 FE 24 | Jump to subroutine
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    BCC $FF              ; 90 FF | Branch if carry clear
    SEC                  ; 38 | Set carry flag
    ADC $3F82,X          ; 7D 82 3F | Add with carry (absolute,X)
    CPY #$67             ; C0 67 | Compare Y register (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    CLC                  ; 18 | Clear carry flag
    DEY                  ; 88 | Decrement Y register
    AND $19C6,Y          ; 39 C6 19 | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_01B
; Address: $E4860F
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_01B:
    INC $02              ; E6 02 | Increment (zero page)
    BRA $C0              ; 80 C0 | Branch always
    TYA                  ; 98 | Transfer Y register to accumulator
    CLC                  ; 18 | Clear carry flag
    DEY                  ; 88 | Decrement Y register
    CPY #$C6             ; C0 C6 | Compare Y register (immediate)
    BRA $E6              ; 80 E6 | Branch always
    LDA                  ; BF 00 DF 00 | Load from absolute long,X into accumulator
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank48_DmaFunction_01C
; Address: $E4863D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_01C:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    STA                  ; 9F 60 DF 20 | Store accumulator to absolute long,X
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_01D
; Address: $E48657
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_01D:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    BRA $FF              ; 80 FF | Branch always
    BRA $00              ; 80 00 | Branch always
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    LDA                  ; BF 40 08 F7 | Load from absolute long,X into accumulator
    ASL $00F1            ; 0E F1 00 | Arithmetic shift left (absolute)
    ORA $110F            ; 0D 0F 11 | Logical OR with accumulator (absolute)
    ASL $7A1E,X          ; 1E 1E 7A | Arithmetic shift left (absolute,X)
    PLY                  ; 7A | Pull Y register from stack
    CPY $FB04            ; CC 04 FB | Compare Y register (absolute)
    BRA $4F              ; 80 4F | Branch always
    BRA $71              ; 80 71 | Branch always
    BCC $69              ; 90 69 | Branch if carry clear
    RTI                  ; 40 | Return from interrupt
    LDA $F800,Y          ; B9 00 F8 | Load from absolute,Y into accumulator

;------------------------------------------------------------------------------
; Bank48_DmaFunction_01E
; Address: $E486AE
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_01E:
    JSR $F8DC            ; 20 DC F8 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    INC $F6EE            ; EE EE F6 | Increment (absolute)
    INC $77FE,X          ; FE FE 77 | Increment (absolute,X)
    ORA ($82,X)          ; 01 82 | Logical OR with accumulator ((zero page,X))
    ORA ($32,X)          ; 01 32 | Logical OR with accumulator ((zero page,X))
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    CPY $00              ; C4 00 | Compare Y register (zero page)
    CPX $00              ; E4 00 | Compare X register (zero page)
    CLC                  ; 18 | Clear carry flag
    ADC $CF7F,X          ; 7D 7F CF | Add with carry (absolute,X)
    BRA $00              ; 80 00 | Branch always
    CPY $00              ; C4 00 | Compare Y register (zero page)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SBC $00FD,X          ; FD FD 00 | Subtract with carry (absolute,X)
    BMI $FF              ; 30 FF | Branch if negative

;------------------------------------------------------------------------------
; Bank48_DmaFunction_01F
; Address: $E48732
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_01F:
    STX $FF              ; 86 FF | Store X register to zero page
    REP #$FF             ; C2 FF | Reset processor status bits
    LDX $9CFF            ; AE FF 9C | Load from absolute address into X register
    INC                  ; 1A | Increment accumulator
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    BMI $CF              ; 30 CF | Branch if negative
    BPL $EF              ; 10 EF | Branch if positive
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    DEC                  ; 3A | Decrement accumulator
    BMI $FF              ; 30 FF | Branch if negative
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BVS $FF              ; 70 FF | Branch if overflow set
    BPL $FF              ; 10 FF | Branch if positive
    INC $FB04,X          ; FE 04 FB | Increment (absolute,X)
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    ORA $E1FF            ; 0D FF E1 | Logical OR with accumulator (absolute)
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank48_DmaFunction_020
; Address: $E4877A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_020:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    ROR $FF00,X          ; 7E 00 FF | Rotate right (absolute,X)
    BRA $7F              ; 80 7F | Branch always
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 00 FF 8C | Load from absolute long,X into accumulator
    STX $79              ; 86 79 | Store X register to zero page

;------------------------------------------------------------------------------
; Bank48_DmaFunction_021
; Address: $E48792
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_021:
    JSR $10FF            ; 20 FF 10 | Jump to subroutine
    BPL $7F              ; 10 7F | Branch if positive
    ORA ($BF,X)          ; 01 BF | Logical OR with accumulator ((zero page,X))
    ADC $FF00,Y          ; 79 00 FF | Add with carry (absolute,Y)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BIT $7DFF            ; 2C FF 7D | Test bits in accumulator (absolute)
    BRA $FF              ; 80 FF | Branch always
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    BPL $EF              ; 10 EF | Branch if positive
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA $B0FF,X          ; 1D FF B0 | Logical OR with accumulator (absolute,X)
    STY $C6FF            ; 8C FF C6 | Store Y register to absolute address
    BRA $FE              ; 80 FE | Branch always
    SED                  ; F8 | Set decimal mode flag
    AND ($CE),Y          ; 31 CE | Logical AND with accumulator ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    BCS $FC              ; B0 FC | Branch if carry set
    WDM #$FF             ; 42 FF | Reserved instruction
    ASL $00FF,X          ; 1E FF 00 | Arithmetic shift left (absolute,X)
    DEC $0000            ; CE 00 00 | Decrement (absolute)
    BPL $FF              ; 10 FF | Branch if positive
    BRA $FF              ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank48_DmaFunction_022
; Address: $E48815
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_022:
    BPL $00              ; 10 00 | Branch if positive
    BRA $00              ; 80 00 | Branch always
    STA                  ; 9F 00 CF 00 | Store accumulator to absolute long,X
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_024
; Address: $E4883F
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_024:
    JSR $FFFF            ; 20 FF FF | Jump to subroutine
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BEQ $FE              ; F0 FE | Branch if equal
    CPX $00F3            ; EC F3 00 | Compare X register (absolute)
    LDA ($00),Y          ; B1 00 | Load from (zero page),Y into accumulator
    STA ($00),Y          ; 91 00 | Store accumulator to (zero page),Y
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ROL $CD3E,X          ; 3E 3E CD | Rotate left (absolute,X)
    CMP $4E4E            ; CD 4E 4E | Compare accumulator (absolute)
    ROR $FE6E            ; 6E 6E FE | Rotate right (absolute)
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BCS $00              ; B0 00 | Branch if carry set
    BCS $00              ; B0 00 | Branch if carry set
    INC $00              ; E6 00 | Increment (zero page)
    ROR $7C00,X          ; 7E 00 7C | Rotate right (absolute,X)
    JMP $27B3B3          ; 5C B3 B3 27 | Jump to address long
    ORA $9919,Y          ; 19 19 99 | Logical OR with accumulator (absolute,Y)
    STA $9393,Y          ; 99 93 93 | Store accumulator to absolute,Y
    SEC                  ; 38 | Set carry flag
    CLI                  ; 58 | Clear interrupt disable flag
    CLI                  ; 58 | Clear interrupt disable flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_026
; Address: $E488BC
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_026:
    STA                  ; 9F 9F 9F 9F | Store accumulator to absolute long,X
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    INC $FFFE,X          ; FE FE FF | Increment (absolute,X)
    LDA                  ; BF BF FF FF | Load from absolute long,X into accumulator
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BVS $00              ; 70 00 | Branch if overflow set
    STA $89898F          ; 8F 8F 89 89 | Store accumulator to absolute long address
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BRA $7F              ; 80 7F | Branch always
    SED                  ; F8 | Set decimal mode flag
    BMI $E3              ; 30 E3 | Branch if negative
    BPL $7F              ; 10 7F | Branch if positive

;------------------------------------------------------------------------------
; Bank48_DmaFunction_028
; Address: $E48919
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_028:
    BMI $00              ; 30 00 | Branch if negative
    LSR $B9              ; 46 B9 | Logical shift right (zero page)
    LDX $FF41,Y          ; BE 41 FF | Load from absolute,Y into X register
    SBC $FC06,Y          ; F9 06 FC | Subtract with carry (absolute,Y)
    BPL $FF              ; 10 FF | Branch if positive
    LDA $E300,Y          ; B9 00 E3 | Load from absolute,Y into accumulator
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    INY                  ; C8 | Increment Y register
    ROR $F980,X          ; 7E 80 F9 | Rotate right (absolute,X)
    ASL $FC              ; 06 FC | Arithmetic shift left (zero page)
    SBC $DF02,X          ; FD 02 DF | Subtract with carry (absolute,X)
    BRA $F8              ; 80 F8 | Branch always
    INY                  ; C8 | Increment Y register
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_029
; Address: $E4895D
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_029:
    JSR $1000            ; 20 00 10 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BRA $00              ; 80 00 | Branch always
    PHA                  ; 48 | Push accumulator to stack
    BEQ $8E              ; F0 8E | Branch if equal
    ADC ($80),Y          ; 71 80 | Add with carry ((zero page),Y)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BRA $7F              ; 80 7F | Branch always
    STZ $C863            ; 9C 63 C8 | Store zero to absolute
    SBC $2006,Y          ; F9 06 20 | Subtract with carry (absolute,Y)
    BEQ $00              ; F0 00 | Branch if equal
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    TYA                  ; 98 | Transfer Y register to accumulator
    BPL $FE              ; 10 FE | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_02A
; Address: $E489B6
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_02A:
    BRA $FF              ; 80 FF | Branch always
    BRA $FC              ; 80 FC | Branch always
    INC $6700            ; EE 00 67 | Increment (absolute)
    BRA $7F              ; 80 7F | Branch always
    BRA $FF              ; 80 FF | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$DF             ; C0 DF | Compare Y register (immediate)
    BRA $BD              ; 80 BD | Branch always

;------------------------------------------------------------------------------
; Bank48_DmaFunction_02B
; Address: $E489E4
; Size: 109 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_02B:
    BRA $A9              ; 80 A9 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BIT $422C            ; 2C 2C 42 | Hardware register operation
    WDM #$56             ; 42 56 | Reserved instruction
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    SBC $FFF9,Y          ; F9 F9 FF | Subtract with carry (absolute,Y)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    SBC $EDF9,Y          ; F9 F9 ED | Subtract with carry (absolute,Y)
    SBC $ECEC            ; ED EC EC | Subtract with carry (absolute)
    PHP                  ; 08 | Push processor status to stack
    INC $9D00,X          ; FE 00 9D | Increment (absolute,X)
    BPL $00              ; 10 00 | Branch if positive
    CLV                  ; B8 | Clear overflow flag
    LDY #$00             ; A0 00 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF 00 FF 83 | Load from absolute long,X into accumulator
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ASL $0500            ; 0E 00 05 | Arithmetic shift left (absolute)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    LDX $9C00,Y          ; BE 00 9C | Load from absolute,Y into X register
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    PLX                  ; FA | Pull X register from stack
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    CPX #$D7             ; E0 D7 | Compare X register (immediate)
    SEP #$00             ; E2 00 | Set processor status bits
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BVS $70              ; 70 70 | Branch if overflow set
    INC $FFFE,X          ; FE FE FF | Increment (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    ORA $3F00,X          ; 1D 00 3F | Logical OR with accumulator (absolute,X)
    BVS $9F              ; 70 9F | Branch if overflow set
    INC $FF3F,X          ; FE 3F FF | Increment (absolute,X)
    CLC                  ; 18 | Clear carry flag
    INC $3F00,X          ; FE 00 3F | Increment (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    JMP $06F9            ; 4C F9 06 | Jump to address
    SBC $5E02,X          ; FD 02 5E | Subtract with carry (absolute,X)
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank48_DmaFunction_02C
; Address: $E48AF1
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_02C:
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    LDA ($00,X)          ; A1 00 | Load from (zero page,X) into accumulator
    BEQ $01              ; F0 01 | Branch if equal
    SBC $B97F,X          ; FD 7F B9 | Subtract with carry (absolute,X)
    BRA $FF              ; 80 FF | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    BRA $00              ; 80 00 | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    RTI                  ; 40 | Return from interrupt
    INC $FFC2,X          ; FE C2 FF | Increment (absolute,X)
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    CLD                  ; D8 | Clear decimal mode flag
    BMI $FF              ; 30 FF | Branch if negative
    SBC $CC00,X          ; FD 00 CC | Subtract with carry (absolute,X)
    STA ($00),Y          ; 91 00 | Store accumulator to (zero page),Y
    CPY $EF80            ; CC 80 EF | Compare Y register (absolute)
    INX                  ; E8 | Increment X register
    SED                  ; F8 | Set decimal mode flag
    ROR $B380            ; 6E 80 B3 | Rotate right (absolute)
    INX                  ; E8 | Increment X register
    SEI                  ; 78 | Set interrupt disable flag
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    CLC                  ; 18 | Clear carry flag
    ROL $7F3F,X          ; 3E 3F 7F | Rotate left (absolute,X)
    SBC $F0F9,Y          ; F9 F9 F0 | Subtract with carry (absolute,Y)
    BEQ $FE              ; F0 FE | Branch if equal
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    ORA ($11,X)          ; 01 11 | Logical OR with accumulator ((zero page,X))
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank48_DmaFunction_02D
; Address: $E48BC4
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_02D:
    JSR $2C5F            ; 20 5F 2C | Jump to subroutine
    ADC $32FE,Y          ; 79 FE 32 | Add with carry (absolute,Y)
    CPY $9668            ; CC 68 96 | Compare Y register (absolute)
    RTI                  ; 40 | Return from interrupt
    LDX $0F0F,Y          ; BE 0F 0F | Load from absolute,Y into X register
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank48_DmaFunction_02E
; Address: $E48BD4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_02E:
    JSR $2C3F            ; 20 3F 2C | Jump to subroutine
    EOR ($71),Y          ; 51 71 | Exclusive OR with accumulator ((zero page),Y)
    BVS $00              ; 70 00 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank48_DmaFunction_02F
; Address: $E48BFE
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_02F:
    BPL $10              ; 10 10 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    AND $18              ; 25 18 | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_030
; Address: $E48C0B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_030:
    JSR $5000            ; 20 00 50 | Jump to subroutine
    BVC $00              ; 50 00 | Branch if overflow clear
    ASL $110E            ; 0E 0E 11 | Arithmetic shift left (absolute)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_031
; Address: $E48C45
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_031:
    BPL $00              ; 10 00 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank48_DmaFunction_033
; Address: $E48C4F
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_033:
    RTI                  ; 40 | Return from interrupt
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    ASL $00F1            ; 0E F1 00 | Arithmetic shift left (absolute)
    ORA $110F            ; 0D 0F 11 | Logical OR with accumulator (absolute)
    ASL $7A1E,X          ; 1E 1E 7A | Arithmetic shift left (absolute,X)
    PLY                  ; 7A | Pull Y register from stack
    BMI $CC              ; 30 CC | Branch if negative
    BRA $4F              ; 80 4F | Branch always
    BRA $71              ; 80 71 | Branch always
    BCC $69              ; 90 69 | Branch if carry clear
    RTI                  ; 40 | Return from interrupt
    LDA $F800,Y          ; B9 00 F8 | Load from absolute,Y into accumulator

;------------------------------------------------------------------------------
; Bank48_DmaFunction_034
; Address: $E48C8E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_034:
    JSR $F8DC            ; 20 DC F8 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    INC $F6EE            ; EE EE F6 | Increment (absolute)
    INC $77FE,X          ; FE FE 77 | Increment (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_035
; Address: $E48CA1
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_035:
    BMI $38              ; 30 38 | Branch if negative
    ROL $1F03,X          ; 3E 03 1F | Rotate left (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $04              ; F0 04 | Branch if equal
    ASL $08F8            ; 0E F8 08 | Arithmetic shift left (absolute)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank48_DmaFunction_036
; Address: $E48D01
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_036:
    JSR $0120            ; 20 20 01 | Jump to subroutine
    AND ($43,X)          ; 21 43 | Logical AND with accumulator ((zero page,X))
    ADC ($01),Y          ; 71 01 | Add with carry ((zero page),Y)
    BRA $62              ; 80 62 | Branch always

;------------------------------------------------------------------------------
; Bank48_DmaFunction_037
; Address: $E48D16
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_037:
    RTI                  ; 40 | Return from interrupt
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BEQ $D0              ; F0 D0 | Branch if equal
    LDY #$80             ; A0 80 | Load immediate value into Y register
    LDY #$80             ; A0 80 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    BVS $00              ; 70 00 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_039
; Address: $E48D2E
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_039:
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_03A
; Address: $E48D69
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_03A:
    RTI                  ; 40 | Return from interrupt
    CPX #$80             ; E0 80 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $130C            ; 0E 0C 13 | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($EE,X)          ; 01 EE | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank48_DmaFunction_03B
; Address: $E48DC7
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_03B:
    JSR $0079            ; 20 79 00 | Jump to subroutine
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $A0              ; 80 A0 | Branch always
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BRA $08              ; 80 08 | Branch always
    CPX $FC0C            ; EC 0C FC | Compare X register (absolute)
    CPX $6D01            ; EC 01 6D | Compare X register (absolute)
    ORA ($6F,X)          ; 01 6F | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_03C
; Address: $E48DFA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_03C:
    BPL $00              ; 10 00 | Branch if positive
    BCC $00              ; 90 00 | Branch if carry clear
    BCC $00              ; 90 00 | Branch if carry clear
    BRA $F7              ; 80 F7 | Branch always

;------------------------------------------------------------------------------
; Bank48_DmaFunction_03D
; Address: $E48E03
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_03D:
    BIT #$FE             ; 89 FE | Test bits in accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    ROL $BE02,X          ; 3E 02 BE | Rotate left (absolute,X)
    LDY $0180,X          ; BC 80 01 | Load from absolute,X into Y register
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CMP ($81,X)          ; C1 81 | Compare accumulator ((zero page,X))
    STA ($03,X)          ; 81 03 | Store accumulator to (zero page,X)
    ASL $E7              ; 06 E7 | Arithmetic shift left (zero page)
    DEC $8F08            ; CE 08 8F | Decrement (absolute)
    PHP                  ; 08 | Push processor status to stack
    INC $C608            ; EE 08 C6 | Increment (absolute)
    PHP                  ; 08 | Push processor status to stack
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank48_DmaFunction_03E
; Address: $E48E47
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_03E:
    JSR $2423            ; 20 23 24 | Jump to subroutine
    JMP $486F            ; 4C 6F 48 | Jump to address
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    AND $2900,X          ; 3D 00 29 | Logical AND with accumulator (absolute,X)
    BIT $422C            ; 2C 2C 42 | Hardware register operation
    WDM #$56             ; 42 56 | Reserved instruction
    CLC                  ; 18 | Clear carry flag
    ASL $0306            ; 0E 06 03 | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SBC ($60,X)          ; E1 60 | Subtract with carry ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    INC $7E00,X          ; FE 00 7E | Increment (absolute,X)
    AND $9D00,X          ; 3D 00 9D | Logical AND with accumulator (absolute,X)
    STA                  ; 9F 00 8F 00 | Store accumulator to absolute long,X
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank48_DmaFunction_03F
; Address: $E48EEC
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_03F:
    JSR $F800            ; 20 00 F8 | Jump to subroutine
    REP #$00             ; C2 00 | Reset processor status bits
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_040
; Address: $E48EF6
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_040:
    BVS $00              ; 70 00 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    ASL $1F00,X          ; 1E 00 1F | Arithmetic shift left (absolute,X)
    SBC $F940,X          ; FD 40 F9 | Subtract with carry (absolute,X)
    RTI                  ; 40 | Return from interrupt
    INC $F802,X          ; FE 02 F8 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_041
; Address: $E48F12
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_041:
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STX $00              ; 86 00 | Store X register to zero page

;------------------------------------------------------------------------------
; Bank48_DmaFunction_042
; Address: $E48F27
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_042:
    JSR $40DE            ; 20 DE 40 | Jump to subroutine
    CPY #$19             ; C0 19 | Compare Y register (immediate)
    ADC $0800,Y          ; 79 00 08 | Add with carry (absolute,Y)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    INC $00              ; E6 00 | Increment (zero page)
    STX $00              ; 86 00 | Store X register to zero page
    PLX                  ; FA | Pull X register from stack
    STX $FA00            ; 8E 00 FA | Store X register to absolute address
    CLD                  ; D8 | Clear decimal mode flag
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    STZ $7000            ; 9C 00 70 | Store zero to absolute
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    LSR $0111            ; 4E 11 01 | Logical shift right (absolute)
    BPL $16              ; 10 16 | Branch if positive
    ORA ($56,X)          ; 01 56 | Logical OR with accumulator ((zero page,X))
    ORA ($17,X)          ; 01 17 | Logical OR with accumulator ((zero page,X))
    STA ($C6),Y          ; 91 C6 | Store accumulator to (zero page),Y
    AND ($67),Y          ; 31 67 | Logical AND with accumulator ((zero page),Y)
    BPL $00              ; 10 00 | Branch if positive
    BRA $7F              ; 80 7F | Branch always
    SBC $10              ; E5 10 | Subtract with carry (zero page)
    INC $E111            ; EE 11 E1 | Increment (absolute)
    BPL $F6              ; 10 F6 | Branch if positive
    ORA ($17,X)          ; 01 17 | Logical OR with accumulator ((zero page,X))
    INC $11              ; E6 11 | Increment (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $83              ; 80 83 | Branch always
    PHB                  ; 8B | Push data bank register to stack
    SBC ($61,X)          ; E1 61 | Subtract with carry ((zero page,X))
    ORA ($1C,X)          ; 01 1C | Logical OR with accumulator ((zero page,X))
    DEC $9FFF,X          ; DE FF 9F | Decrement (absolute,X)
    BRA $00              ; 80 00 | Branch always
    STZ $E300,X          ; 9E 00 E3 | Store zero to absolute,X
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_043
; Address: $E49005
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_043:
    CPX #$D6             ; E0 D6 | Compare X register (immediate)
    STA                  ; 9F D9 DF AF | Store accumulator to absolute long,X
    BMI $00              ; 30 00 | Branch if negative
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_044
; Address: $E4901C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_044:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ORA $0F              ; 05 0F | Logical OR with accumulator (zero page)
    ORA $161F            ; 0D 1F 16 | Logical OR with accumulator (absolute)
    ROR $9729            ; 6E 29 97 | Rotate right (absolute)
    BEQ $8C              ; F0 8C | Branch if equal

;------------------------------------------------------------------------------
; Bank48_DmaFunction_045
; Address: $E4903C
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_045:
    PHP                  ; 08 | Push processor status to stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    TSX                  ; BA | Transfer stack pointer to X register
    STA $FCCB            ; 8D CB FC | Store accumulator to absolute address
    INC $8337,X          ; FE 37 83 | Increment (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF 00 FF 00 | Load from absolute long,X into accumulator
    PLA                  ; 68 | Pull accumulator from stack
    JMP $2548            ; 4C 48 25 | Jump to address
    ASL $25              ; 06 25 | Arithmetic shift left (zero page)
    PHA                  ; 48 | Push accumulator to stack
    JMP $104371          ; 5C 71 43 10 | Jump to address long
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    SBC $DB24            ; ED 24 DB | Subtract with carry (absolute)
    SBC $AD52,X          ; FD 52 AD | Subtract with carry (absolute,X)
    BIT $01D3            ; 2C D3 01 | Test bits in accumulator (absolute)
    INC $2424,X          ; FE 24 24 | Increment (absolute,X)
    LDA $BD81,X          ; BD 81 BD | Load from absolute,X into accumulator
    ROR $00              ; 66 00 | Rotate right (zero page)
    LDA $E7              ; A5 E7 | Load from zero page into accumulator
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    BIT $DB              ; 24 DB | Test bits in accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    BRA $D8              ; 80 D8 | Branch always
    CLD                  ; D8 | Clear decimal mode flag
    BRA $AF              ; 80 AF | Branch always
    LDA $F7AFF7          ; AF F7 AF F7 | Load from absolute long address into accumulator
    LDA #$CF             ; A9 CF | Load immediate value into accumulator
    STY $00              ; 84 00 | Store Y register to zero page
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    AND ($DE,X)          ; 21 DE | Logical AND with accumulator ((zero page,X))
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    SBC ($46),Y          ; F1 46 | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_046
; Address: $E490C4
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_046:
    JSL $59024D          ; 22 4D 02 59 | Jump to subroutine long
    BVS $A6              ; 70 A6 | Branch if overflow set
    ORA ($26,X)          ; 01 26 | Logical OR with accumulator ((zero page,X))
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    PEA #$F601           ; F4 01 F6 | Push effective address to stack
    ORA ($E9,X)          ; 01 E9 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    INC $E311            ; EE 11 E3 | Increment (absolute)
    BPL $70              ; 10 70 | Branch if positive
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    BPL $68              ; 10 68 | Branch if positive
    STA $FF00,Y          ; 99 00 FF | Store accumulator to absolute,Y
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $76              ; 10 76 | Branch if positive

;------------------------------------------------------------------------------
; Bank48_DmaFunction_047
; Address: $E49103
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_047:
    ORA ($26,X)          ; 01 26 | Logical OR with accumulator ((zero page,X))
    ORA ($41),Y          ; 11 41 | Logical OR with accumulator ((zero page),Y)
    BPL $4E              ; 10 4E | Branch if positive
    ORA ($15),Y          ; 11 15 | Logical OR with accumulator ((zero page),Y)
    CMP ($30,X)          ; C1 30 | Compare accumulator ((zero page,X))
    BIT #$BF             ; 89 BF | Test bits in accumulator (immediate)
    LDY $16FD,X          ; BC FD 16 | Load from absolute,X into Y register
    SBC ($7F),Y          ; F1 7F | Subtract with carry ((zero page),Y)
    STZ $451E,X          ; 9E 1E 45 | Store zero to absolute,X
    STA $30              ; 85 30 | Store accumulator to zero page
    RTI                  ; 40 | Return from interrupt
    TYA                  ; 98 | Transfer Y register to accumulator
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    PLY                  ; 7A | Pull Y register from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_048
; Address: $E49141
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_048:
    SED                  ; F8 | Set decimal mode flag
    LDY $FCCC,X          ; BC CC FC | Load from absolute,X into Y register
    ORA $287A,Y          ; 19 7A 28 | Logical OR with accumulator (absolute,Y)
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    STA $07EF08          ; 8F 08 EF 07 | Store accumulator to absolute long address
    STA $00              ; 85 00 | Store accumulator to zero page
    BCC $00              ; 90 00 | Branch if carry clear
    BEQ $00              ; F0 00 | Branch if equal
    BVS $00              ; 70 00 | Branch if overflow set
    BPL $00              ; 10 00 | Branch if positive
    ADC ($65,X)          ; 61 65 | Add with carry ((zero page,X))
    EOR #$7B             ; 49 7B | Exclusive OR with accumulator (immediate)
    TSX                  ; BA | Transfer stack pointer to X register
    STZ $7D1E            ; 9C 1E 7D | Store zero to absolute
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank48_DmaFunction_049
; Address: $E4916E
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_049:
    BIT $3E              ; 24 3E | Test bits in accumulator (zero page)
    INC                  ; 1A | Increment accumulator
    RTI                  ; 40 | Return from interrupt
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    RTI                  ; 40 | Return from interrupt
    AND $6DBF            ; 2D BF 6D | Logical AND with accumulator (absolute)
    SBC $7080            ; ED 80 70 | Subtract with carry (absolute)
    BEQ $F0              ; F0 F0 | Branch if equal
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPX #$70             ; E0 70 | Compare X register (immediate)
    STA $823FC0          ; 8F C0 3F 82 | Store accumulator to absolute long address
    ADC $567A,X          ; 7D 7A 56 | Add with carry (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    LDA $6359            ; AD 59 63 | Load from absolute address into accumulator
    EOR $BB63,Y          ; 59 63 BB | Exclusive OR with accumulator (absolute,Y)
    LDA $4A62            ; AD 62 4A | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank48_DmaFunction_04A
; Address: $E491AE
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_04A:
    PLY                  ; 7A | Pull Y register from stack
    LDA $AD52            ; AD 52 AD | Load from absolute address into accumulator
    AND #$D6             ; 29 D6 | Logical AND with accumulator (immediate)
    EOR $BA              ; 45 BA | Exclusive OR with accumulator (zero page)
    EOR $BA              ; 45 BA | Exclusive OR with accumulator (zero page)
    AND #$D6             ; 29 D6 | Logical AND with accumulator (immediate)
    LDA $AD52            ; AD 52 AD | Load from absolute address into accumulator
    BIT #$89             ; 89 89 | Test bits in accumulator (immediate)
    STX $2F8E            ; 8E 8E 2F | Store X register to absolute address
    LSR $A55E,X          ; 5E 5E A5 | Logical shift right (absolute,X)
    LDA $09              ; A5 09 | Load from zero page into accumulator
    BVC $AF              ; 50 AF | Branch if overflow clear
    AND $DA              ; 25 DA | Logical AND with accumulator (zero page)
    LDA $738C            ; AD 8C 73 | Load from absolute address into accumulator
    AND $12D2            ; 2D D2 12 | Logical AND with accumulator (absolute)
    SBC $5AA5            ; ED A5 5A | Subtract with carry (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank48_DmaFunction_04B
; Address: $E491E4
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_04B:
    JSL $030223          ; 22 23 02 03 | Jump to subroutine long
    AND $26              ; 25 26 | Logical AND with accumulator (zero page)
    WDM #$63             ; 42 63 | Reserved instruction
    BEQ $B4              ; F0 B4 | Branch if equal
    CMP ($01),Y          ; D1 01 | Compare accumulator ((zero page),Y)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($23,X)          ; 01 23 | Logical OR with accumulator ((zero page,X))
    BEQ $F6              ; F0 F6 | Branch if equal
    BEQ $85              ; F0 85 | Branch if equal
    STY $D2              ; 84 D2 | Store Y register to zero page
    BRA $D8              ; 80 D8 | Branch always
    TYA                  ; 98 | Transfer Y register to accumulator
    CPX $DA80            ; EC 80 DA | Compare X register (absolute)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    BIT $FF              ; 24 FF | Test bits in accumulator (zero page)
    BCC $5F              ; 90 5F | Branch if carry clear
    BCC $5F              ; 90 5F | Branch if carry clear
    STX $9F4E            ; 8E 4E 9F | Store X register to absolute address
    BVS $F0              ; 70 F0 | Branch if overflow set
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDA ($00),Y          ; B1 00 | Load from (zero page),Y into accumulator
    LDY #$1F             ; A0 1F | Load immediate value into Y register
    BRA $3F              ; 80 3F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $70              ; 80 70 | Branch always
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_04C
; Address: $E49248
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_04C:
    SBC $45F0,X          ; FD F0 45 | Subtract with carry (absolute,X)
    LDY $F60B,X          ; BC 0B F6 | Load from absolute,X into Y register
    STA ($FE),Y          ; 91 FE | Store accumulator to (zero page),Y
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    BEQ $03              ; F0 03 | Branch if equal
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank48_DmaFunction_04D
; Address: $E49262
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_04D:
    JSL $F50ADD          ; 22 DD 0A F5 | Jump to subroutine long
    LDY $3488,X          ; BC 88 34 | Load from absolute,X into Y register
    INC $76FF,X          ; FE FF 76 | Increment (absolute,X)
    ORA ($26,X)          ; 01 26 | Logical OR with accumulator ((zero page,X))
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    BNE $4F              ; D0 4F | Branch if not equal
    STZ $4043            ; 9C 43 40 | Store zero to absolute
    PLA                  ; 68 | Pull accumulator from stack
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    CPY $7B              ; C4 7B | Compare Y register (zero page)
    BNE $4F              ; D0 4F | Branch if not equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_04E
; Address: $E492A0
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_04E:
    ASL $FB              ; 06 FB | Arithmetic shift left (zero page)
    ORA ($F6,X)          ; 01 F6 | Logical OR with accumulator ((zero page,X))
    ORA ($EC),Y          ; 11 EC | Logical OR with accumulator ((zero page),Y)
    LSR $99              ; 46 99 | Logical shift right (zero page)
    DEY                  ; 88 | Decrement Y register
    STY $D0E3            ; 8C E3 D0 | Store Y register to absolute address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_04F
; Address: $E492C0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_04F:
    ROL                  ; 2A | Rotate left (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    JMP $FEBE7E          ; 5C 7E BE FE | Jump to address long
    LDX $BEFE,Y          ; BE FE BE | Load from absolute,Y into X register
    INC $3E7E,X          ; FE 7E 3E | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_050
; Address: $E492CF
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_050:
    JSR $7F40            ; 20 40 7F | Jump to subroutine
    ORA $1CE3,X          ; 1D E3 1C | Logical OR with accumulator (absolute,X)
    STZ $80E3            ; 9C E3 80 | Store zero to absolute
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    WDM #$42             ; 42 42 | Hardware register operation
    ADC ($61,X)          ; 61 61 | Add with carry ((zero page,X))
    CPX $E718            ; EC 18 E7 | Compare X register (absolute)
    WDM #$BD             ; 42 BD | Reserved instruction
    ADC ($9E,X)          ; 61 9E | Add with carry ((zero page,X))
    BRA $F3              ; 80 F3 | Branch always
    ROR                  ; 6A | Rotate right (accumulator)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    EOR $02              ; 45 02 | Exclusive OR with accumulator (zero page)
    PHB                  ; 8B | Push data bank register to stack
    ORA $0000            ; 0D 00 00 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_052
; Address: $E49328
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_052:
    JSR $98A4            ; 20 A4 98 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    CLI                  ; 58 | Clear interrupt disable flag
    CLI                  ; 58 | Clear interrupt disable flag
    LDY $A6              ; A4 A6 | Load from zero page into Y register
    CPY #$E0             ; C0 E0 | Game work RAM access
    CMP ($E0,X)          ; C1 E0 | Game work RAM access
    PHX                  ; DA | Push X register to stack
    CLC                  ; 18 | Clear carry flag
    BIT $BE              ; 24 BE | Test bits in accumulator (zero page)
    CPX $D9              ; E4 D9 | Compare X register (zero page)
    ADC ($4E),Y          ; 71 4E | Add with carry ((zero page),Y)
    INC $4B              ; E6 4B | Increment (zero page)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_053
; Address: $E49348
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_053:
    JSR $0D92            ; 20 92 0D | Jump to subroutine
    WDM #$15             ; 42 15 | Reserved instruction
    ASL $0B              ; 06 0B | Arithmetic shift left (zero page)
    BVS $5B              ; 70 5B | Branch if overflow set
    LDY $5700,X          ; BC 00 57 | Load from absolute,X into Y register
    SEC                  ; 38 | Set carry flag
    ORA $8C00            ; 0D 00 8C | Logical OR with accumulator (absolute)
    BRA $7F              ; 80 7F | Branch always
    CPX #$7F             ; E0 7F | Compare X register (immediate)
    CPX #$7F             ; E0 7F | Compare X register (immediate)
    BEQ $7F              ; F0 7F | Branch if equal
    BEQ $7F              ; F0 7F | Branch if equal
    BNE $7F              ; D0 7F | Branch if not equal
    CPX #$7F             ; E0 7F | Compare X register (immediate)
    BRA $40              ; 80 40 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    AND $0DFA,Y          ; 39 FA 0D | Logical AND with accumulator (absolute,Y)
    AND $73FC,X          ; 3D FC 73 | Logical AND with accumulator (absolute,X)
    ORA $1FFC,X          ; 1D FC 1F | Logical OR with accumulator (absolute,X)
    INC $FE3F,X          ; FE 3F FE | Increment (absolute,X)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA $0300            ; 0D 00 03 | Logical OR with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $381F,X          ; 1D 1F 38 | Logical OR with accumulator (absolute,X)
    INY                  ; C8 | Increment Y register
    LDA $D0E1,Y          ; B9 E1 D0 | Load from absolute,Y into accumulator
    BCS $8A              ; B0 8A | Branch if carry set
    STX $0300            ; 8E 00 03 | Store X register to absolute address
    BIT $7F              ; 24 7F | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_055
; Address: $E493EC
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_055:
    JSR $4A20            ; 20 20 4A | Jump to subroutine
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    ADC ($3F),Y          ; 71 3F | Add with carry ((zero page),Y)
    LSR                  ; 4A | Logical shift right (accumulator)
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    AND $3E02,X          ; 3D 02 3E | Logical AND with accumulator (absolute,X)
    INC $BC              ; E6 BC | Increment (zero page)
    LDA $3C              ; A5 3C | Load from zero page into accumulator
    ROR $3C18,X          ; 7E 18 3C | Rotate right (absolute,X)
    PHY                  ; 5A | Push Y register to stack
    WDM #$7F             ; 42 7F | Reserved instruction
    EOR ($7F,X)          ; 41 7F | Exclusive OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    LDA $7F7FAF          ; AF AF 7F 7F | Load from absolute long address into accumulator
    RTI                  ; 40 | Return from interrupt
    CPY #$9D             ; C0 9D | Compare Y register (immediate)
    INC $3F36            ; EE 36 3F | Increment (absolute)
    LDA $807F50          ; AF 50 7F 80 | Load from absolute long address into accumulator
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $0E              ; 05 0E | Logical OR with accumulator (zero page)
    ORA $49              ; 05 49 | Logical OR with accumulator (zero page)
    LDA ($42),Y          ; B1 42 | Hardware register operation
    CMP $8862,Y          ; D9 62 88 | Compare accumulator (absolute,Y)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    LDA                  ; BF 00 BF 00 | Load from absolute long,X into accumulator
    LDA                  ; BF 00 50 20 | Load from absolute long,X into accumulator
    DEY                  ; 88 | Decrement Y register
    BVS $A8              ; 70 A8 | Branch if overflow set
    BVC $E0              ; 50 E0 | Game work RAM access
    BVC $DA              ; 50 DA | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank48_DmaFunction_056
; Address: $E4946B
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_056:
    JSL $8B2297          ; 22 97 22 8B | Jump to subroutine long
    BVC $00              ; 50 00 | Branch if overflow clear
    DEY                  ; 88 | Decrement Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDX #$00             ; A2 00 | Load immediate value into X register
    SBC $FD00,X          ; FD 00 FD | Subtract with carry (absolute,X)
    SBC $0D00,X          ; FD 00 0D | Subtract with carry (absolute,X)
    SBC $6FBB,Y          ; F9 BB 6F | Subtract with carry (absolute,Y)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank48_DmaFunction_057
; Address: $E49486
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_057:
    BMI $37              ; 30 37 | Branch if negative
    AND $34              ; 25 34 | Logical AND with accumulator (zero page)
    INC                  ; 1A | Increment accumulator
    ORA $0718,X          ; 1D 18 07 | Logical OR with accumulator (absolute,X)
    ORA #$C0             ; 09 C0 | Logical OR with accumulator (immediate)
    SEC                  ; 38 | Set carry flag
    ORA ($78,X)          ; 01 78 | Logical OR with accumulator ((zero page,X))
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ORA $1F00,X          ; 1D 00 1F | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_058
; Address: $E494A2
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_058:
    JSL $FE87FD          ; 22 FD 87 FE | Jump to subroutine long
    STY $FC              ; 84 FC | Store Y register to zero page
    JMP $F8B4            ; 4C B4 F8 | Jump to address
    INY                  ; C8 | Increment Y register
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    CPX #$E0             ; E0 E0 | Game work RAM access
    TAY                  ; A8 | Transfer accumulator to Y register
    BNE $9E              ; D0 9E | Branch if not equal
    EOR #$86             ; 49 86 | Exclusive OR with accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    STY $9C40            ; 8C 40 9C | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank48_DmaFunction_059
; Address: $E494BA
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_059:
    JSR $00D8            ; 20 D8 00 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    CPX #$01             ; E0 01 | Compare X register (immediate)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $1B00            ; 0E 00 1B | Arithmetic shift left (absolute)
    BNE $5F              ; D0 5F | Branch if not equal
    LDA $B23F,Y          ; B9 3F B2 | Load from absolute,Y into accumulator
    ROL $7FFE,X          ; 3E FE 7F | Rotate left (absolute,X)
    STA ($71),Y          ; 91 71 | Store accumulator to (zero page),Y
    BEQ $96              ; F0 96 | Branch if equal
    STA $00A0,Y          ; 99 A0 00 | Store accumulator to absolute,Y
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    STX $0960            ; 8E 60 09 | Store X register to absolute address
    AND $8DFC,X          ; 3D FC 8D | Logical AND with accumulator (absolute,X)
    STY $0405            ; 8C 05 04 | Store Y register to absolute address
    AND ($E0,X)          ; 21 E0 | Game work RAM access
    SBC ($F6),Y          ; F1 F6 | Subtract with carry ((zero page),Y)
    ADC $99FF,Y          ; 79 FF 99 | Add with carry (absolute,Y)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    BRA $6F              ; 80 6F | Branch always
    BCC $34              ; 90 34 | Branch if carry clear
    LDA ($6F,X)          ; A1 6F | Load from (zero page,X) into accumulator
    CMP ($1E,X)          ; C1 1E | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank48_DmaFunction_05A
; Address: $E49526
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_05A:
    CMP ($1C,X)          ; C1 1C | Compare accumulator ((zero page,X))
    BRA $5D              ; 80 5D | Branch always
    LSR $5C9D,X          ; 5E 9D 5C | Logical shift right (absolute,X)
    CPY #$1D             ; C0 1D | Compare Y register (immediate)
    STZ $BE71,X          ; 9E 71 BE | Store zero to absolute,X
    ADC ($BE,X)          ; 61 BE | Add with carry ((zero page,X))
    LDX $A063,Y          ; BE 63 A0 | Load from absolute,Y into X register
    LDX #$7F             ; A2 7F | Load immediate value into X register
    LDX $1A63,Y          ; BE 63 1A | Load from absolute,Y into X register
    ROL                  ; 2A | Rotate left (accumulator)
    CMP ($19),Y          ; D1 19 | Compare accumulator ((zero page),Y)
    ASL $09F1,X          ; 1E F1 09 | Arithmetic shift left (absolute,X)
    INX                  ; E8 | Increment X register
    AND $CDF7,Y          ; 39 F7 CD | Logical AND with accumulator (absolute,Y)
    LDA                  ; BF 7F AC 40 | Load from absolute long,X into accumulator
    RTI                  ; 40 | Return from interrupt
    PEA #$9F40           ; F4 40 9F | Push effective address to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_05B
; Address: $E4956E
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_05B:
    STA $008070          ; 8F 70 80 00 | Store accumulator to absolute long address
    LDA                  ; BF 00 BF 00 | Load from absolute long,X into accumulator
    LDA $BF00            ; AD 00 BF | Load from absolute address into accumulator
    LDA                  ; BF 00 BF 00 | Load from absolute long,X into accumulator
    LDA                  ; BF 00 FD FE | Load from absolute long,X into accumulator
    ASL $9F              ; 06 9F | Arithmetic shift left (zero page)
    DEC                  ; 3A | Decrement accumulator
    EOR $E73A,X          ; 5D 3A E7 | Exclusive OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_05C
; Address: $E4958D
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_05C:
    JSL $01FA1D          ; 22 1D FA 01 | Jump to subroutine long
    SBC $FD00,X          ; FD 00 FD | Subtract with carry (absolute,X)
    SBC $C500,X          ; FD 00 C5 | Subtract with carry (absolute,X)
    CMP $00              ; C5 00 | Compare accumulator (zero page)
    CMP $C500,X          ; DD 00 C5 | Compare accumulator (absolute,X)
    LDA $BB42,X          ; BD 42 BB | Load from absolute,X into accumulator
    LDA $51BD4C          ; AF 4C BD 51 | Load from absolute long address into accumulator
    STA                  ; 9F 40 C0 7F | Store accumulator to absolute long,X
    SBC $D949,Y          ; F9 49 D9 | Subtract with carry (absolute,Y)
    LSR                  ; 4A | Logical shift right (accumulator)
    LDY $00              ; A4 00 | Load from zero page into Y register
    BCS $00              ; B0 00 | Branch if carry set
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BRA $00              ; 80 00 | Branch always
    CMP $7F22,X          ; DD 22 7F | Compare accumulator (absolute,X)
    CMP $FD1A,X          ; DD 1A FD | Compare accumulator (absolute,X)
    SBC $4B02,Y          ; F9 02 4B | Subtract with carry (absolute,Y)
    INC $0809,X          ; FE 09 08 | Increment (absolute,X)
    LDA $6D40            ; AD 40 6D | Load from absolute address into accumulator
    STA $00              ; 85 00 | Store accumulator to zero page
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_05D
; Address: $E495DA
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_05D:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF 00 00 00 | Load from absolute long,X into accumulator
    BPL $34              ; 10 34 | Branch if positive
    AND $4A              ; 25 4A | Logical AND with accumulator (zero page)
    DEC                  ; 3A | Decrement accumulator
    ASL $452B,X          ; 1E 2B 45 | Arithmetic shift left (absolute,X)
    ASL $4B              ; 06 4B | Arithmetic shift left (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    BPL $50              ; 10 50 | Branch if positive
    LDX $4CB4,Y          ; BE B4 4C | Load from absolute,Y into X register
    BNE $48              ; D0 48 | Branch if not equal
    ROR $0000            ; 6E 00 00 | Rotate right (absolute)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPX #$B0             ; E0 B0 | Compare X register (immediate)
    LSR                  ; 4A | Logical shift right (accumulator)
    CPX #$BC             ; E0 BC | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    BCC $20              ; 90 20 | Branch if carry clear
    SBC $85              ; E5 85 | Subtract with carry (zero page)
    DEC $D2EE            ; CE EE D2 | Decrement (absolute)
    RTI                  ; 40 | Return from interrupt
    BVS $80              ; 70 80 | Branch if overflow set
    CPX #$00             ; E0 00 | Compare X register (immediate)
    INC                  ; 1A | Increment accumulator
    PHP                  ; 08 | Push processor status to stack
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    STA $FF1FFF          ; 8F FF 1F FF | Store accumulator to absolute long address
    ORA $FF0D            ; 0D 0D FF | Logical OR with accumulator (absolute)
    SBC $CD9F,Y          ; F9 9F CD | Subtract with carry (absolute,Y)
    INC $DFB9            ; EE B9 DF | Increment (absolute)
    TAX                  ; AA | Transfer accumulator to X register
    INC $EDE5            ; EE E5 ED | Increment (absolute)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $000D00          ; AF 00 0D 00 | Load from absolute long address into accumulator
    BPL $FF              ; 10 FF | Branch if positive
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    BVC $E0              ; 50 E0 | Game work RAM access
    BRA $5D              ; 80 5D | Branch always
    BRA $43              ; 80 43 | Branch always
    CPY $A14D            ; CC 4D A1 | Compare Y register (absolute)
    LDA                  ; BF CA B5 F7 | Load from absolute long,X into accumulator
    BRA $80              ; 80 80 | Branch always
    LDX $BE63,Y          ; BE 63 BE | Load from absolute,Y into X register
    ADC $7FB2,X          ; 7D B2 7F | Add with carry (absolute,X)
    RTI                  ; 40 | Return from interrupt
    CLV                  ; B8 | Clear overflow flag
    BIT #$77             ; 89 77 | Test bits in accumulator (immediate)
    CMP $BE37,Y          ; D9 37 BE | Compare accumulator (absolute,Y)
    EOR ($B3),Y          ; 51 B3 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_05E
; Address: $E4968A
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_05E:
    NOP                  ; EA | No operation
    ROL $0AF1,X          ; 3E F1 0A | Rotate left (absolute,X)
    DEY                  ; 88 | Decrement Y register
    BCC $6E              ; 90 6E | Branch if carry clear
    ADC ($CC),Y          ; 71 CC | Add with carry ((zero page),Y)
    STA $73              ; 85 73 | Store accumulator to zero page
    LDX $BF00,Y          ; BE 00 BF | Load from absolute,Y into X register
    LDA                  ; BF 00 BE 00 | Load from absolute long,X into accumulator
    LDA                  ; BF 00 BE 00 | Load from absolute long,X into accumulator
    BRA $00              ; 80 00 | Branch always
    DEC                  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank48_DmaFunction_05F
; Address: $E496C3
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_05F:
    JSL $552A6F          ; 22 6F 2A 55 | Jump to subroutine long
    CMP $B73A,X          ; DD 3A B7 | Compare accumulator (absolute,X)
    WDM #$E9             ; 42 E9 | Reserved instruction
    INC $40AD,X          ; FE AD 40 | Increment (absolute,X)
    CMP $00              ; C5 00 | Compare accumulator (zero page)
    CMP $D500,X          ; DD 00 D5 | Compare accumulator (absolute,X)
    CMP $C500            ; CD 00 C5 | Compare accumulator (absolute)
    SBC $0100,X          ; FD 00 01 | Subtract with carry (absolute,X)
    PHX                  ; DA | Push X register to stack
    EOR #$99             ; 49 99 | Exclusive OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    INY                  ; C8 | Increment Y register
    BMI $FF              ; 30 FF | Branch if negative
    RTI                  ; 40 | Return from interrupt
    STX $A140            ; 8E 40 A1 | Store X register to absolute address
    STZ $0000,X          ; 9E 00 00 | Store zero to absolute,X
    LDA                  ; BF 00 BF 00 | Load from absolute long,X into accumulator
    REP #$C5             ; C2 C5 | Reset processor status bits
    PHP                  ; 08 | Push processor status to stack
    ORA $03FE            ; 0D FE 03 | Logical OR with accumulator (absolute)
    ADC ($02),Y          ; 71 02 | Add with carry ((zero page),Y)
    STA $79              ; 85 79 | Store accumulator to zero page
    ADC $FF00,X          ; 7D 00 FF | Add with carry (absolute,X)
    SBC $FD00,X          ; FD 00 FD | Subtract with carry (absolute,X)
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    STA ($1D,X)          ; 81 1D | Store accumulator to (zero page,X)
    ROL $2E              ; 26 2E | Rotate left (zero page)
    ORA ($35,X)          ; 01 35 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank48_DmaFunction_060
; Address: $E49726
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_060:
    JSR $0006            ; 20 06 00 | Jump to subroutine
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($03),Y          ; 11 03 | Logical OR with accumulator ((zero page),Y)
    ORA ($21,X)          ; 01 21 | PPU graphics register access
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    EOR $76              ; 45 76 | Exclusive OR with accumulator (zero page)
    TXA                  ; 8A | Transfer X register to accumulator
    BPL $F0              ; 10 F0 | Branch if positive
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BVS $10              ; 70 10 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank48_DmaFunction_061
; Address: $E4974B
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_061:
    BPL $00              ; 10 00 | Branch if positive
    BIT #$80             ; 89 80 | Test bits in accumulator (immediate)
    JMP ($2A80)          ; 6C 80 2A | Jump to address (absolute indirect)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    ROR $26              ; 66 26 | Rotate right (zero page)
    LDA $ADAD18          ; AF 18 AD AD | Load from absolute long address into accumulator
    DEC                  ; 3A | Decrement accumulator
    PHP                  ; 08 | Push processor status to stack
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    WDM #$00             ; 42 00 | Reserved instruction
    RTI                  ; 40 | Return from interrupt
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    CMP $F4              ; C5 F4 | Compare accumulator (zero page)
    DEC $6D              ; C6 6D | Decrement (zero page)
    CMP ($41),Y          ; D1 41 | Compare accumulator ((zero page),Y)
    ADC $ED              ; 65 ED | Add with carry (zero page)
    LDA $CADE,X          ; BD DE CA | Load from absolute,X into accumulator
    PLP                  ; 28 | Pull processor status from stack
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    ORA $FB05            ; 0D 05 FB | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SED                  ; F8 | Set decimal mode flag
    DEY                  ; 88 | Decrement Y register
    ROL $3E43,X          ; 3E 43 3E | Rotate left (absolute,X)
    CMP $833C,X          ; DD 3C 83 | Compare accumulator (absolute,X)
    LDX $3E1B,Y          ; BE 1B 3E | Load from absolute,Y into X register
    LDX $80DF,Y          ; BE DF 80 | Load from absolute,Y into X register
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    BVS $E3              ; 70 E3 | Branch if overflow set
    ASL $FE80,X          ; 1E 80 FE | Arithmetic shift left (absolute,X)
    ORA $0BCB,X          ; 1D CB 0B | Logical OR with accumulator (absolute,X)
    AND ($21,X)          ; 21 21 | PPU graphics register access
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_063
; Address: $E497F2
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_063:
    STA $009C00          ; 8F 00 9C 00 | Store accumulator to absolute long address
    PEA #$DE00           ; F4 00 DE | Push effective address to stack
    STA                  ; 9F 00 E3 E3 | Store accumulator to absolute long,X
    JMP $9F40            ; 4C 40 9F | Jump to address
    BRA $29              ; 80 29 | Branch always
    ORA $30D0,Y          ; 19 D0 30 | Logical OR with accumulator (absolute,Y)
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank48_DmaFunction_064
; Address: $E4980B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_064:
    TAY                  ; A8 | Transfer accumulator to Y register
    ROL $06              ; 26 06 | Rotate left (zero page)
    BVC $50              ; 50 50 | Branch if overflow clear
    LDA                  ; BF 00 7F 00 | Load from absolute long,X into accumulator
    SBC $AF00,Y          ; F9 00 AF | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_066
; Address: $E4982B
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_066:
    JSR $5702            ; 20 02 57 | Jump to subroutine
    BPL $FF              ; 10 FF | Branch if positive
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND $1B75,X          ; 3D 75 1B | Logical AND with accumulator (absolute,X)
    STY $7B              ; 84 7B | Store Y register to zero page
    ADC ($2F),Y          ; 71 2F | Add with carry ((zero page),Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    AND $0E61,X          ; 3D 61 0E | Logical AND with accumulator (absolute,X)
    BVC $E0              ; 50 E0 | Game work RAM access
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_067
; Address: $E49846
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_067:
    JSR $B9F8            ; 20 F8 B9 | Jump to subroutine
    INC $AF24,X          ; FE 24 AF | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ASL $9C02,X          ; 1E 02 9C | Arithmetic shift left (absolute,X)
    BRA $80              ; 80 80 | Branch always
    BPL $80              ; 10 80 | Branch if positive
    CPX #$80             ; E0 80 | Compare X register (immediate)
    CPY #$81             ; C0 81 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BVC $80              ; 50 80 | Branch if overflow clear
    BRA $66              ; 80 66 | Branch always
    BEQ $11              ; F0 11 | Branch if equal
    LDA $A677,X          ; BD 77 A6 | Load from absolute,X into accumulator
    INC $8D              ; E6 8D | Increment (zero page)
    ADC $B6              ; 65 B6 | Add with carry (zero page)
    INC $2B89            ; EE 89 2B | Increment (absolute)
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHX                  ; DA | Push X register to stack
    LDA $1878            ; AD 78 18 | Load from absolute address into accumulator
    LDA $AF74            ; AD 74 AF | Load from absolute address into accumulator
    ROL $7C              ; 26 7C | Rotate left (zero page)
    CPX #$F6             ; E0 F6 | Compare X register (immediate)
    CMP ($01),Y          ; D1 01 | Compare accumulator ((zero page),Y)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    WDM #$00             ; 42 00 | Reserved instruction
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    LDA $D478,X          ; BD 78 D4 | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank48_DmaFunction_068
; Address: $E498A7
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_068:
    BVC $B5              ; 50 B5 | Branch if overflow clear
    BVS $BB              ; 70 BB | Branch if overflow set
    CLI                  ; 58 | Clear interrupt disable flag
    BRA $67              ; 80 67 | Branch always
    TYA                  ; 98 | Transfer Y register to accumulator
    PHB                  ; 8B | Push data bank register to stack
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $008F00          ; AF 00 8F 00 | Load from absolute long address into accumulator
    CMP $E588            ; CD 88 E5 | Compare accumulator (absolute)
    BRA $DB              ; 80 DB | Branch always
    LDX $81              ; A6 81 | Load from zero page into X register
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    PHX                  ; DA | Push X register to stack
    AND $BE              ; 25 BE | Logical AND with accumulator (zero page)
    ORA ($48,X)          ; 01 48 | Logical OR with accumulator ((zero page,X))
    CLD                  ; D8 | Clear decimal mode flag
    RTI                  ; 40 | Return from interrupt
    EOR ($E9,X)          ; 41 E9 | Exclusive OR with accumulator ((zero page,X))
    ADC #$0E             ; 69 0E | Add with carry (immediate)
    STX $8061            ; 8E 61 80 | Store X register to absolute address
    DEC                  ; 3A | Decrement accumulator
    RTI                  ; 40 | Return from interrupt
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    LDA                  ; BF 00 BE 00 | Load from absolute long,X into accumulator
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    STA                  ; 9F 98 EB A8 | Store accumulator to absolute long,X
    BMI $E6              ; 30 E6 | Branch if negative
    SBC $5809,Y          ; F9 09 58 | Subtract with carry (absolute,Y)
    PLP                  ; 28 | Pull processor status from stack
    STA $B800,X          ; 9D 00 B8 | Store accumulator to absolute,X
    CLC                  ; 18 | Clear carry flag
    SBC $2616            ; ED 16 26 | Subtract with carry (absolute)
    PHY                  ; 5A | Push Y register to stack
    INC $FB15,X          ; FE 15 FB | Increment (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    LDA ($81),Y          ; B1 81 | Load from (zero page),Y into accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($27,X)          ; 01 27 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ROR $C300,X          ; 7E 00 C3 | Rotate right (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ROR $6C              ; 66 6C | Rotate right (zero page)
    ROR $69              ; 66 69 | Rotate right (zero page)
    PHP                  ; 08 | Push processor status to stack
    TXS                  ; 9A | Transfer X register to stack pointer
    NOP                  ; EA | No operation
    STA $DE              ; 85 DE | Store accumulator to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_06A
; Address: $E49951
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_06A:
    BCC $F7              ; 90 F7 | Branch if carry clear
    TYA                  ; 98 | Transfer Y register to accumulator
    ROR $14F0            ; 6E F0 14 | Rotate right (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_06B
; Address: $E49958
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_06B:
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    INC $2400,X          ; FE 00 24 | Increment (absolute,X)
    SBC ($33),Y          ; F1 33 | Subtract with carry ((zero page),Y)
    CPY $98F8            ; CC F8 98 | Compare Y register (absolute)
    ROL $AE              ; 26 AE | Rotate left (zero page)
    BIT $381E            ; 2C 1E 38 | Test bits in accumulator (absolute)
    CPY $8400            ; CC 00 84 | Compare Y register (absolute)
    CLI                  ; 58 | Clear interrupt disable flag
    CMP $D300,Y          ; D9 00 D3 | Compare accumulator (absolute,Y)
    ADC $3349            ; 6D 49 33 | Add with carry (absolute)
    CPY $3BC3            ; CC C3 3B | Compare Y register (absolute)
    STA $A9EB            ; 8D EB A9 | Store accumulator to absolute address
    PLX                  ; FA | Pull X register from stack
    TAY                  ; A8 | Transfer accumulator to Y register
    STA $B6              ; 85 B6 | Store accumulator to zero page
    LDY $3C00            ; AC 00 3C | Load from absolute address into Y register
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    PLY                  ; 7A | Pull Y register from stack
    ADC ($B7,X)          ; 61 B7 | Add with carry ((zero page,X))
    ROR $6C34            ; 6E 34 6C | Rotate right (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    TSX                  ; BA | Transfer stack pointer to X register
    LDA $2E26B2          ; AF B2 26 2E | Load from absolute long address into accumulator
    LDY $FADC            ; AC DC FA | Load from absolute address into Y register
    PHP                  ; 08 | Push processor status to stack
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    EOR $5300,Y          ; 59 00 53 | Exclusive OR with accumulator (absolute,Y)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    CMP $34              ; C5 34 | Compare accumulator (zero page)
    DEC $33C5            ; CE C5 33 | Decrement (absolute)
    ORA $8F              ; 05 8F | Logical OR with accumulator (zero page)
    XBA                  ; EB | Exchange accumulator bytes
    LDA #$F9             ; A9 F9 | Load immediate value into accumulator
    TAX                  ; AA | Transfer accumulator to X register
    STA $28              ; 85 28 | Store accumulator to zero page
    BRA $00              ; 80 00 | Branch always
    SEC                  ; 38 | Set carry flag
    PHA                  ; 48 | Push accumulator to stack
    BVS $00              ; 70 00 | Branch if overflow set
    PLY                  ; 7A | Pull Y register from stack
    ADC ($B3),Y          ; 71 B3 | Add with carry ((zero page),Y)
    JMP ($9878)          ; 6C 78 98 | Jump to address (absolute indirect)
    ROL $6E              ; 26 6E | Rotate left (zero page)
    CPX $B89E            ; EC 9E B8 | Compare X register (absolute)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_06C
; Address: $E499F2
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_06C:
    STY $00              ; 84 00 | Store Y register to zero page
    CLI                  ; 58 | Clear interrupt disable flag
    EOR $1300,Y          ; 59 00 13 | Exclusive OR with accumulator (absolute,Y)
    ADC $3549            ; 6D 49 35 | Add with carry (absolute)
    DEC $C9              ; C6 C9 | Decrement (zero page)
    STA $A9E9            ; 8D E9 A9 | Store accumulator to absolute address
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    PHA                  ; 48 | Push accumulator to stack
    ADC ($B3,X)          ; 61 B3 | Add with carry ((zero page,X))
    LDA ($6B),Y          ; B1 6B | Load from (zero page),Y into accumulator
    CPY $98F8            ; CC F8 98 | Compare Y register (absolute)
    ROL $AE              ; 26 AE | Rotate left (zero page)
    BIT $381E            ; 2C 1E 38 | Test bits in accumulator (absolute)
    STY $00              ; 84 00 | Store Y register to zero page
    CLI                  ; 58 | Clear interrupt disable flag
    CMP $D300,Y          ; D9 00 D3 | Compare accumulator (absolute,Y)
    CMP $33              ; C5 33 | Compare accumulator (zero page)
    DEC $3BC5            ; CE C5 3B | Decrement (absolute)
    STA $A9EB            ; 8D EB A9 | Store accumulator to absolute address
    PLX                  ; FA | Pull X register from stack
    TAY                  ; A8 | Transfer accumulator to Y register
    STA $38              ; 85 38 | Store accumulator to zero page
    STY $00              ; 84 00 | Store Y register to zero page
    SEC                  ; 38 | Set carry flag
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    PLY                  ; 7A | Pull Y register from stack
    LDA $DE42,Y          ; B9 42 DE | Load from absolute,Y into accumulator
    ORA ($0B),Y          ; 11 0B | Logical OR with accumulator ((zero page),Y)
    SEI                  ; 78 | Set interrupt disable flag
    STY $A65D            ; 8C 5D A6 | Store Y register to absolute address
    ROR $4782,X          ; 7E 82 47 | Rotate right (absolute,X)
    LDY $A043,X          ; BC 43 A0 | Load from absolute,X into Y register
    BRA $E4              ; 80 E4 | Branch always
    BRA $E0              ; 80 E0 | Game work RAM access
    BNE $20              ; D0 20 | Branch if not equal
    BNE $20              ; D0 20 | Branch if not equal
    CMP ($20),Y          ; D1 20 | Compare accumulator ((zero page),Y)
    SEP #$00             ; E2 00 | Set processor status bits
    STA $6B42,X          ; 9D 42 6B | Store accumulator to absolute,X
    TYA                  ; 98 | Transfer Y register to accumulator
    BNE $2E              ; D0 2E | Branch if not equal
    NOP                  ; EA | No operation
    ASL $35CA,X          ; 1E CA 35 | Arithmetic shift left (absolute,X)
    TXS                  ; 9A | Transfer X register to stack pointer
    ADC $3A              ; 65 3A | Add with carry (zero page)
    CMP $E2              ; C5 E2 | Compare accumulator (zero page)
    AND $05C2,X          ; 3D C2 05 | Logical AND with accumulator (absolute,X)
    PLX                  ; FA | Pull X register from stack
    ORA ($27,X)          ; 01 27 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank48_DmaFunction_06D
; Address: $E49A98
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_06D:
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    LDA $527C,X          ; BD 7C 52 | Load from absolute,X into accumulator
    AND ($33),Y          ; 31 33 | Logical AND with accumulator ((zero page),Y)
    ORA $7608            ; 0D 08 76 | Logical OR with accumulator (absolute)
    LSR $3200            ; 4E 00 32 | Logical shift right (absolute)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ADC $0000            ; 6D 00 00 | Add with carry (absolute)
    BVC $E0              ; 50 E0 | Game work RAM access
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_06E
; Address: $E49AC6
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_06E:
    JSR $79F8            ; 20 F8 79 | Jump to subroutine
    LDX $2FA4,Y          ; BE A4 2F | Load from absolute,Y into X register
    INY                  ; C8 | Increment Y register
    ASL $645A,X          ; 1E 5A 64 | Arithmetic shift left (absolute,X)
    BPL $00              ; 10 00 | Branch if positive
    CPX #$00             ; E0 00 | Compare X register (immediate)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    BNE $00              ; D0 00 | Branch if not equal
    STZ $0000,X          ; 9E 00 00 | Store zero to absolute,X
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BVC $37              ; 50 37 | Branch if overflow clear
    BEQ $4F              ; F0 4F | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_06F
; Address: $E49AEC
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_06F:
    CLV                  ; B8 | Clear overflow flag
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    INC                  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank48_DmaFunction_070
; Address: $E49AF4
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_070:
    JSR $4800            ; 20 00 48 | Jump to subroutine
    BCS $00              ; B0 00 | Branch if carry set
    STY $5D00            ; 8C 00 5D | Store Y register to absolute address
    TAY                  ; A8 | Transfer accumulator to Y register
    LDY #$D4             ; A0 D4 | Load immediate value into Y register
    BEQ $2A              ; F0 2A | Branch if equal
    CPX #$48             ; E0 48 | Compare X register (immediate)
    PEA #$D8D6           ; F4 D6 D8 | Push effective address to stack
    NOP                  ; EA | No operation
    ROL                  ; 2A | Rotate left (accumulator)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CLI                  ; 58 | Clear interrupt disable flag
    ASL $0C00,X          ; 1E 00 0C | Arithmetic shift left (absolute,X)
    ROL $00              ; 26 00 | Rotate left (zero page)
    STA $DE00,X          ; 9D 00 DE | Store accumulator to absolute,X
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BVC $33              ; 50 33 | Branch if overflow clear
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank48_DmaFunction_071
; Address: $E49B2E
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_071:
    EOR #$09             ; 49 09 | Exclusive OR with accumulator (immediate)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    INC                  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank48_DmaFunction_073
; Address: $E49B38
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_073:
    LDY $580D,X          ; BC 0D 58 | Load from absolute,X into Y register
    ROR $0037,X          ; 7E 37 00 | Rotate right (absolute,X)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDY #$94             ; A0 94 | Load immediate value into Y register
    BCC $6A              ; 90 6A | Branch if carry clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_074
; Address: $E49B48
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_074:
    PLA                  ; 68 | Pull accumulator from stack
    STZ $0E              ; 64 0E | Store zero to zero page
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank48_DmaFunction_075
; Address: $E49B4F
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_075:
    JSL $5800A0          ; 22 A0 00 58 | Jump to subroutine long
    JMP ($FE60)          ; 6C 60 FE | Jump to address (absolute indirect)
    BCC $FC              ; 90 FC | Branch if carry clear
    BCC $66              ; 90 66 | Branch if carry clear
    BEQ $AD              ; F0 AD | Branch if equal
    RTI                  ; 40 | Return from interrupt
    DEC $2E08,X          ; DE 08 2E | Decrement (absolute,X)
    ROR $4C              ; 66 4C | Rotate right (zero page)
    CMP $47              ; C5 47 | Compare accumulator (zero page)
    REP #$92             ; C2 92 | Reset processor status bits
    DEX                  ; CA | Decrement X register
    TXS                  ; 9A | Transfer X register to stack pointer
    CPY $B1              ; C4 B1 | Compare Y register (zero page)
    LDA $BB              ; A5 BB | Load from zero page into accumulator
    LDA $3A0099          ; AF 99 00 3A | Load from absolute long address into accumulator
    ADC $6500            ; 6D 00 65 | Add with carry (absolute)
    PHY                  ; 5A | Push Y register to stack
    BVC $00              ; 50 00 | Branch if overflow clear
    SBC $DB34,X          ; FD 34 DB | Subtract with carry (absolute,X)
    ASL $CA82,X          ; 1E 82 CA | Arithmetic shift left (absolute,X)
    CMP ($69,X)          ; C1 69 | Compare accumulator ((zero page,X))
    LDY $CCBC            ; AC BC CC | Load from absolute address into Y register
    CLI                  ; 58 | Clear interrupt disable flag
    PLY                  ; 7A | Pull Y register from stack
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    ROR                  ; 6A | Rotate right (accumulator)
    LDA $AD00            ; AD 00 AD | Load from absolute address into accumulator
    ROL $EE              ; 26 EE | Rotate left (zero page)
    CPX $8765            ; EC 65 87 | Compare X register (absolute)
    INC $659E            ; EE 9E 65 | Increment (absolute)
    BIT #$2B             ; 89 2B | Test bits in accumulator (immediate)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    INC                  ; 1A | Increment accumulator
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank48_DmaFunction_076
; Address: $E49BB6
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_076:
    AND $0100            ; 2D 00 01 | Logical AND with accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SBC $DA36,X          ; FD 36 DA | Subtract with carry (absolute,X)
    ASL $DA82,X          ; 1E 82 DA | Arithmetic shift left (absolute,X)
    CPY #$6D             ; C0 6D | Compare Y register (immediate)
    LDY $C6BF            ; AC BF C6 | Load from absolute address into Y register
    STZ $7660            ; 9C 60 76 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank48_DmaFunction_077
; Address: $E49BCF
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_077:
    CMP ($89),Y          ; D1 89 | Compare accumulator ((zero page),Y)
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    ROL $8CE6            ; 2E E6 8C | Rotate left (absolute)
    EOR $E7              ; 45 E7 | Exclusive OR with accumulator (zero page)
    PEA #$B2C2           ; F4 C2 B2 | Push effective address to stack
    DEX                  ; CA | Decrement X register
    TXS                  ; 9A | Transfer X register to stack pointer
    EOR $94              ; 45 94 | Exclusive OR with accumulator (zero page)
    LDA ($A5),Y          ; B1 A5 | Load from (zero page),Y into accumulator
    ORA $3A00,Y          ; 19 00 3A | Logical OR with accumulator (absolute,Y)
    EOR $6500            ; 4D 00 65 | Exclusive OR with accumulator (absolute)
    LSR                  ; 4A | Logical shift right (accumulator)
    BVC $00              ; 50 00 | Branch if overflow clear
    SBC $DC34,X          ; FD 34 DC | Subtract with carry (absolute,X)
    INC                  ; 1A | Increment accumulator
    BRA $C8              ; 80 C8 | Branch always
    CPY #$69             ; C0 69 | Compare Y register (immediate)
    LDY $CEBD            ; AC BD CE | Load from absolute address into Y register
    CLI                  ; 58 | Clear interrupt disable flag
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    WDM #$00             ; 42 00 | Reserved instruction
    ADC #$00             ; 69 00 | Add with carry (immediate)
    LDA $AC00            ; AD 00 AC | Load from absolute address into accumulator
    ROL $4C66            ; 2E 66 4C | Rotate left (absolute)
    CMP $47              ; C5 47 | Compare accumulator (zero page)
    REP #$92             ; C2 92 | Reset processor status bits
    DEX                  ; CA | Decrement X register
    TXS                  ; 9A | Transfer X register to stack pointer
    CPY $B1              ; C4 B1 | Compare Y register (zero page)
    SBC $A9              ; E5 A9 | Subtract with carry (zero page)
    STA $3A00,Y          ; 99 00 3A | Store accumulator to absolute,Y
    ADC $6500            ; 6D 00 65 | Add with carry (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SBC $DB34,X          ; FD 34 DB | Subtract with carry (absolute,X)
    ASL $CA82,X          ; 1E 82 CA | Arithmetic shift left (absolute,X)
    CMP ($69,X)          ; C1 69 | Compare accumulator ((zero page,X))
    LDY $EEBC            ; AC BC EE | Load from absolute address into Y register
    BNE $D6              ; D0 D6 | Branch if not equal
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank48_DmaFunction_078
; Address: $E49C52
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_078:
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    LSR $54A1            ; 4E A1 54 | Logical shift right (absolute)
    LDA ($2E,X)          ; A1 2E | Load from (zero page,X) into accumulator

;------------------------------------------------------------------------------
; Bank48_DmaFunction_079
; Address: $E49C65
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_079:
    SEI                  ; 78 | Set interrupt disable flag
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    ROL                  ; 2A | Rotate left (accumulator)
    ASL $1B              ; 06 1B | Arithmetic shift left (zero page)
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($D0,X)          ; 01 D0 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    PHX                  ; DA | Push X register to stack
    BIT $3F41            ; 2C 41 3F | Test bits in accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA $2A              ; 85 2A | Store accumulator to zero page
    EOR $74              ; 45 74 | Exclusive OR with accumulator (zero page)
    ASL $AA1C,X          ; 1E 1C AA | Arithmetic shift left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_07A
; Address: $E49C8B
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_07A:
    CLD                  ; D8 | Clear decimal mode flag
    BRA $60              ; 80 60 | Branch always
    BRA $4B              ; 80 4B | Branch always
    LSR $F8              ; 46 F8 | Logical shift right (zero page)
    LDY $38F0            ; AC F0 38 | Load from absolute address into Y register
    CPY #$E0             ; C0 E0 | Game work RAM access
    BRA $00              ; 80 00 | Branch always
    SBC #$12             ; E9 12 | Subtract with carry (immediate)
    BIT $61              ; 24 61 | Test bits in accumulator (zero page)
    PHY                  ; 5A | Push Y register to stack
    INC $FB15,X          ; FE 15 FB | Increment (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    LDA ($81),Y          ; B1 81 | Load from (zero page),Y into accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ROR $C300,X          ; 7E 00 C3 | Rotate right (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDX $BC              ; A6 BC | Load from zero page into X register
    ROR $08F1            ; 6E F1 08 | Rotate right (absolute)
    TXS                  ; 9A | Transfer X register to stack pointer
    NOP                  ; EA | No operation
    STA $DE              ; 85 DE | Store accumulator to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_07B
; Address: $E49CCB
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_07B:
    LDX $2452,Y          ; BE 52 24 | Load from absolute,Y into X register
    LSR                  ; 4A | Logical shift right (accumulator)
    STX $5400            ; 8E 00 54 | Store X register to absolute address
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    INC $2400,X          ; FE 00 24 | Increment (absolute,X)
    PHA                  ; 48 | Push accumulator to stack
    ROL $9F              ; 26 9F | Rotate left (zero page)
    PLA                  ; 68 | Pull accumulator from stack
    ORA ($A6),Y          ; 11 A6 | Logical OR with accumulator ((zero page),Y)
    AND #$5E             ; 29 5E | Logical AND with accumulator (immediate)
    ORA #$B7             ; 09 B7 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_07C
; Address: $E49CF2
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_07C:
    STZ $00              ; 64 00 | Store zero to zero page
    INX                  ; E8 | Increment X register
    LDA $FF00,X          ; BD 00 FF | Load from absolute,X into accumulator
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ROR $E8              ; 66 E8 | Rotate right (zero page)
    REP #$FD             ; C2 FD | Reset processor status bits
    TXS                  ; 9A | Transfer X register to stack pointer
    SBC $50              ; E5 50 | Subtract with carry (zero page)
    LDX $10              ; A6 10 | Load from zero page into X register
    INX                  ; E8 | Increment X register
    RTI                  ; 40 | Return from interrupt
    BCC $FD              ; 90 FD | Branch if carry clear
    TXS                  ; 9A | Transfer X register to stack pointer
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    CLD                  ; D8 | Clear decimal mode flag
    ROR $4948,X          ; 7E 48 49 | Rotate right (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    TXA                  ; 8A | Transfer X register to accumulator
    DEC $A012,X          ; DE 12 A0 | Decrement (absolute,X)
    AND #$5E             ; 29 5E | Logical AND with accumulator (immediate)
    ORA #$9D             ; 09 9D | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_07D
; Address: $E49D31
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_07D:
    JSL $F5773E          ; 22 3E 77 F5 | Jump to subroutine long
    ASL $1CA1,X          ; 1E A1 1C | Arithmetic shift left (absolute,X)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank48_DmaFunction_07E
; Address: $E49D43
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_07E:
    LSR $08              ; 46 08 | Logical shift right (zero page)
    STA                  ; 9F 3A 65 CA | Store accumulator to absolute long,X
    AND $2650            ; 2D 50 26 | Logical AND with accumulator (absolute)
    BCC $68              ; 90 68 | Branch if carry clear
    RTI                  ; 40 | Return from interrupt
    BCC $FD              ; 90 FD | Branch if carry clear
    PLX                  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank48_DmaFunction_07F
; Address: $E49D53
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_07F:
    JSR $E073            ; 20 73 E0 | Game work RAM access
    STA                  ; 9F 60 F7 00 | Store accumulator to absolute long,X
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    CLD                  ; D8 | Clear decimal mode flag
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ORA $0503            ; 0D 03 05 | Logical OR with accumulator (absolute)
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $1F03,X          ; 1E 03 1F | Arithmetic shift left (absolute,X)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_080
; Address: $E49D87
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_080:
    LDY #$60             ; A0 60 | Load immediate value into Y register
    LDY #$20             ; A0 20 | Load immediate value into Y register
    BEQ $90              ; F0 90 | Branch if equal

;------------------------------------------------------------------------------
; Bank48_DmaFunction_081
; Address: $E49D8D
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_081:
    TAY                  ; A8 | Transfer accumulator to Y register
    BCC $68              ; 90 68 | Branch if carry clear
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank48_DmaFunction_082
; Address: $E49D94
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_082:
    JSR $10E0            ; 20 E0 10 | Jump to subroutine
    BEQ $10              ; F0 10 | Branch if equal
    BEQ $10              ; F0 10 | Branch if equal
    CPX #$78             ; E0 78 | Compare X register (immediate)
    CPY #$F8             ; C0 F8 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    ROL                  ; 2A | Rotate left (accumulator)
    PHB                  ; 8B | Push data bank register to stack
    ADC ($1E,X)          ; 61 1E | Add with carry ((zero page,X))
    BMI $30              ; 30 30 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    BIT $D8              ; 24 D8 | Test bits in accumulator (zero page)
    SED                  ; F8 | Set decimal mode flag
    PLP                  ; 28 | Pull processor status from stack
    ASL $3020,X          ; 1E 20 30 | Arithmetic shift left (absolute,X)
    ORA #$0E             ; 09 0E | Logical OR with accumulator (immediate)
    BEQ $E0              ; F0 E0 | Game work RAM access
    BPL $00              ; 10 00 | Branch if positive
    BMI $30              ; 30 30 | Branch if negative
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ASL $D800            ; 0E 00 D8 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_083
; Address: $E49DD9
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_083:
    JSR $2010            ; 20 10 20 | Jump to subroutine
    BMI $00              ; 30 00 | Branch if negative
    CMP $0222,X          ; DD 22 02 | Compare accumulator (absolute,X)
    STA $8E71,X          ; 9D 71 8E | Store accumulator to absolute,X
    RTI                  ; 40 | Return from interrupt
    AND $2E47,Y          ; 39 47 2E | Logical AND with accumulator (absolute,Y)
    BIT $2953            ; 2C 53 29 | Test bits in accumulator (absolute)
    STZ $E363            ; 9C 63 E3 | Store zero to absolute
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_084
; Address: $E49DF9
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_084:
    ASL $106C,X          ; 1E 6C 10 | Arithmetic shift left (absolute,X)
    JMP ($6810)          ; 6C 10 68 | Jump to address (absolute indirect)
    BPL $BD              ; 10 BD | Branch if positive
    WDM #$40             ; 42 40 | Reserved instruction
    LDA $1DE2,Y          ; B9 E2 1D | Load from absolute,Y into accumulator
    RTI                  ; 40 | Return from interrupt
    INC $F234,X          ; FE 34 F2 | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    PLX                  ; FA | Pull X register from stack
    LDY $398A,X          ; BC 8A 39 | Load from absolute,X into Y register
    DEC $C7              ; C6 C7 | Decrement (zero page)
    SEC                  ; 38 | Set carry flag
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    ASL $0600            ; 0E 00 06 | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    ORA $372B,X          ; 1D 2B 37 | Logical OR with accumulator (absolute,X)
    BIT $3F              ; 24 3F | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_086
; Address: $E49E3C
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_086:
    JSR $101F            ; 20 1F 10 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ORA $0000            ; 0D 00 00 | Logical OR with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $1200            ; 0D 00 12 | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    ASL $3FF8            ; 0E F8 3F | Arithmetic shift left (absolute)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    BEQ $FF              ; F0 FF | Branch if equal
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    CLV                  ; B8 | Clear overflow flag
    BNE $B6              ; D0 B6 | Branch if not equal
    AND #$FE             ; 29 FE | Logical AND with accumulator (immediate)
    SED                  ; F8 | Set decimal mode flag
    STA $7CED            ; 8D ED 7C | Store accumulator to absolute address
    INC $0040,X          ; FE 40 00 | Increment (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_087
; Address: $E49EAB
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_087:
    BRA $B0              ; 80 B0 | Branch always
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BPL $00              ; 10 00 | Branch if positive
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ASL $1F22            ; 0E 22 1F | Arithmetic shift left (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_088
; Address: $E49EC8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_088:
    TAY                  ; A8 | Transfer accumulator to Y register
    PLB                  ; AB | Pull data bank register from stack
    ORA ($1B),Y          ; 11 1B | Logical OR with accumulator ((zero page),Y)
    BIT $4F00            ; 2C 00 4F | Test bits in accumulator (absolute)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_089
; Address: $E49EE0
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_089:
    JSR $8CD8            ; 20 D8 8C | Jump to subroutine
    BCS $0A              ; B0 0A | Branch if carry set
    BEQ $3A              ; F0 3A | Branch if equal
    INY                  ; C8 | Increment Y register
    EOR $F5F8,Y          ; 59 F8 F5 | Exclusive OR with accumulator (absolute,Y)
    PEA #$C1C2           ; F4 C2 C1 | Push effective address to stack
    STA ($F8),Y          ; 91 F8 | Store accumulator to (zero page),Y
    INC $F600,X          ; FE 00 F6 | Increment (absolute,X)
    SEC                  ; 38 | Set carry flag
    ROL $4E              ; 26 4E | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_08A
; Address: $E49F05
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_08A:
    CLI                  ; 58 | Clear interrupt disable flag
    BVS $30              ; 70 30 | Branch if overflow set
    LDA                  ; BF 00 C0 40 | Load from absolute long,X into accumulator
    LDY #$1F             ; A0 1F | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_08C
; Address: $E49F1C
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_08C:
    LDA                  ; BF 00 FF 00 | Load from absolute long,X into accumulator
    DEX                  ; CA | Decrement X register
    PEA #$F40A           ; F4 0A F4 | Push effective address to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PEA #$040A           ; F4 0A 04 | Push effective address to stack
    PLX                  ; FA | Pull X register from stack
    SBC $0300,X          ; FD 00 03 | Subtract with carry (absolute,X)
    ORA $F8              ; 05 F8 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $F8              ; 06 F8 | Arithmetic shift left (zero page)
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    BMI $7F              ; 30 7F | Branch if negative
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank48_DmaFunction_08E
; Address: $E49F54
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_08E:
    JSL $3B041D          ; 22 1D 04 3B | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    ASL $071E,X          ; 1E 1E 07 | Arithmetic shift left (absolute,X)
    ORA $071B,Y          ; 19 1B 07 | Logical OR with accumulator (absolute,Y)
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    ORA $3502            ; 0D 02 35 | Logical OR with accumulator (absolute)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ROL $00              ; 26 00 | Rotate left (zero page)
    CLC                  ; 18 | Clear carry flag
    ORA $0F00            ; 0D 00 0F | Logical OR with accumulator (absolute)
    BNE $DD              ; D0 DD | Branch if not equal
    STZ $387E,X          ; 9E 7E 38 | Store zero to absolute,X
    CLI                  ; 58 | Clear interrupt disable flag
    PHY                  ; 5A | Push Y register to stack
    INC                  ; 1A | Increment accumulator
    STA $533F            ; 8D 3F 53 | Store accumulator to absolute address
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank48_DmaFunction_08F
; Address: $E49F90
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_08F:
    JSL $004400          ; 22 00 44 00 | Jump to subroutine long
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    SBC $00              ; E5 00 | Subtract with carry (zero page)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    STY $BD00            ; 8C 00 BD | Store Y register to absolute address
    PLA                  ; 68 | Pull accumulator from stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank48_DmaFunction_090
; Address: $E49FA6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_090:
    EOR $00DF            ; 4D DF 00 | Exclusive OR with accumulator (absolute)
    XBA                  ; EB | Exchange accumulator bytes
    EOR $9F4E,Y          ; 59 4E 9F | Exclusive OR with accumulator (absolute,Y)
    CMP $3F              ; C5 3F | Compare accumulator (zero page)
    STY $D700            ; 8C 00 D7 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank48_DmaFunction_091
; Address: $E49FB6
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_091:
    JSR $1400            ; 20 00 14 | Jump to subroutine
    LDX $00              ; A6 00 | Load from zero page into X register
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BVC $60              ; 50 60 | Branch if overflow clear
    PLA                  ; 68 | Pull accumulator from stack
    BMI $E0              ; 30 E0 | Game work RAM access
    BCC $D0              ; 90 D0 | Branch if carry clear
    TYA                  ; 98 | Transfer Y register to accumulator
    BCC $58              ; 90 58 | Branch if carry clear
    BCS $70              ; B0 70 | Branch if carry set
    JMP ($DABC)          ; 6C BC DA | Jump to address (absolute indirect)
    BCC $00              ; 90 00 | Branch if carry clear
    INY                  ; C8 | Increment Y register
    BVS $00              ; 70 00 | Branch if overflow set
    PLA                  ; 68 | Pull accumulator from stack
    INX                  ; E8 | Increment X register
    BEQ $00              ; F0 00 | Branch if equal
    STZ $2600            ; 9C 00 26 | Store zero to absolute
    EOR #$87             ; 49 87 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_092
; Address: $E49FE4
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_092:
    JSL $8E538F          ; 22 8F 53 8E | Jump to subroutine long
    ADC $0E              ; 65 0E | Add with carry (zero page)
    BMI $08              ; 30 08 | Branch if negative
    ORA ($DF,X)          ; 01 DF | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    CPX $46              ; E4 46 | Compare X register (zero page)
    SBC ($86),Y          ; F1 86 | Subtract with carry ((zero page),Y)
    SBC ($6E),Y          ; F1 6E | Subtract with carry ((zero page),Y)
    LDA ($C6),Y          ; B1 C6 | Load from (zero page),Y into accumulator
    BMI $0C              ; 30 0C | Branch if negative
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPX #$FE             ; E0 FE | Compare X register (immediate)
    CPY #$1C             ; C0 1C | Compare Y register (immediate)
    BRA $FF              ; 80 FF | Branch always
    TAX                  ; AA | Transfer accumulator to X register
    CLD                  ; D8 | Clear decimal mode flag
    LDA                  ; BF A6 F9 B8 | Load from absolute long,X into accumulator
    CMP $EEBA,X          ; DD BA EE | Compare accumulator (absolute,X)
    LDA                  ; BF 00 00 00 | Load from absolute long,X into accumulator
    INC                  ; 1A | Increment accumulator
    ORA $0F10            ; 0D 10 0F | Logical OR with accumulator (absolute)
    LDY #$EF             ; A0 EF | Load immediate value into Y register
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank48_DmaFunction_093
; Address: $E4A04A
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_093:
    STZ $B491            ; 9C 91 B4 | Store zero to absolute
    AND $2A54            ; 2D 54 2A | Logical AND with accumulator (absolute)
    ROR $D200            ; 6E 00 D2 | Rotate right (absolute)
    PHP                  ; 08 | Push processor status to stack
    ADC ($0C),Y          ; 71 0C | Add with carry ((zero page),Y)
    INC $EEF7,X          ; FE F7 EE | Increment (absolute,X)
    SBC $DFB9,X          ; FD B9 DF | Subtract with carry (absolute,X)
    LDA                  ; BF F3 EF 6F | Load from absolute long,X into accumulator
    ROL $3713            ; 2E 13 37 | Rotate left (absolute)
    EOR ($37),Y          ; 51 37 | Exclusive OR with accumulator ((zero page),Y)
    PHB                  ; 8B | Push data bank register to stack
    SEI                  ; 78 | Set interrupt disable flag
    LSR $5FCE            ; 4E CE 5F | Logical shift right (absolute)
    XBA                  ; EB | Exchange accumulator bytes
    ADC ($59),Y          ; 71 59 | Add with carry ((zero page),Y)
    PLP                  ; 28 | Pull processor status from stack
    PHA                  ; 48 | Push accumulator to stack
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    DEY                  ; 88 | Decrement Y register
    STZ $A900,X          ; 9E 00 A9 | Store zero to absolute,X
    INC $21              ; E6 21 | PPU graphics register access
    CMP $4C78,Y          ; D9 78 4C | Compare accumulator (absolute,Y)
    INC $2779            ; EE 79 27 | Increment (absolute)
    LSR $1F              ; 46 1F | Logical shift right (zero page)
    DEC $DE00,X          ; DE 00 DE | Decrement (absolute,X)
    STA ($00),Y          ; 91 00 | Store accumulator to (zero page),Y
    CLD                  ; D8 | Clear decimal mode flag
    TXA                  ; 8A | Transfer X register to accumulator
    LDA $E000            ; AD 00 E0 | Game work RAM access
    CMP ($77,X)          ; C1 77 | Compare accumulator ((zero page,X))
    STY $AE              ; 84 AE | Store Y register to zero page
    SEC                  ; 38 | Set carry flag
    LDA ($06,X)          ; A1 06 | Load from (zero page,X) into accumulator
    LDA                  ; BF 87 EF 88 | Load from absolute long,X into accumulator
    EOR $AD00,Y          ; 59 00 AD | Exclusive OR with accumulator (absolute,Y)
    CMP $7E00,X          ; DD 00 7E | Compare accumulator (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_094
; Address: $E4A0DE
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_094:
    BVS $00              ; 70 00 | Branch if overflow set
    LDA $CD125E          ; AF 5E 12 CD | Load from absolute long address into accumulator
    ROR                  ; 6A | Rotate right (accumulator)
    CPY $B696            ; CC 96 B6 | Compare Y register (absolute)
    XBA                  ; EB | Exchange accumulator bytes
    BMI $C6              ; 30 C6 | Branch if negative
    CPY $86              ; C4 86 | Compare Y register (zero page)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    INC $6A00,X          ; FE 00 6A | Increment (absolute,X)
    AND $1D00,Y          ; 39 00 1D | Logical AND with accumulator (absolute,Y)
    INC $7A00,X          ; FE 00 7A | Increment (absolute,X)
    ASL $0007            ; 0E 07 00 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_095
; Address: $E4A106
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_095:
    CLI                  ; 58 | Clear interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ADC #$C0             ; 69 C0 | Add with carry (immediate)
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    STA $18              ; 85 18 | Store accumulator to zero page
    STA $9E00,X          ; 9D 00 9E | Store accumulator to absolute,X
    BRA $00              ; 80 00 | Branch always
    CPY #$A0             ; C0 A0 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_096
; Address: $E4A123
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_096:
    TYA                  ; 98 | Transfer Y register to accumulator
    RTI                  ; 40 | Return from interrupt
    LDY $DE20,X          ; BC 20 DE | Load from absolute,X into Y register
    BCC $6E              ; 90 6E | Branch if carry clear
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    PLX                  ; FA | Pull X register from stack
    BPL $60              ; 10 60 | Branch if positive
    STZ $00              ; 64 00 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank48_DmaFunction_097
; Address: $E4A134
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_097:
    JSL $009100          ; 22 00 91 00 | Jump to subroutine long
    STA $9960,Y          ; 99 60 99 | Store accumulator to absolute,Y
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_098
; Address: $E4A13C
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_098:
    SBC $0500,X          ; FD 00 05 | Subtract with carry (absolute,X)
    RTI                  ; 40 | Return from interrupt
    CPY #$BF             ; C0 BF | Compare Y register (immediate)
    CMP $C7A6,Y          ; D9 A6 C7 | Compare accumulator (absolute,Y)
    CLV                  ; B8 | Clear overflow flag
    LDY $A3DC            ; AC DC A3 | Load from absolute address into Y register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    SBC $35CB,X          ; FD CB 35 | Subtract with carry (absolute,X)
    SBC $E3              ; E5 E3 | Subtract with carry (zero page)
    ORA $E51B,X          ; 1D 1B E5 | Logical OR with accumulator (absolute,X)
    XBA                  ; EB | Exchange accumulator bytes
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    STY $BF              ; 84 BF | Store Y register to zero page
    BNE $EF              ; D0 EF | Branch if not equal
    STZ $82DF            ; 9C DF 82 | Store zero to absolute
    CMP $5E5F,X          ; DD 5F 5E | Compare accumulator (absolute,X)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF FF 00 FF | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank48_DmaFunction_099
; Address: $E4A196
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_099:
    JSR $22FD            ; 20 FD 22 | Jump to subroutine
    LDA ($FE,X)          ; A1 FE | Load from (zero page,X) into accumulator
    LDA                  ; BF FF 00 FF | Load from absolute long,X into accumulator
    ROL $09              ; 26 09 | Rotate left (zero page)
    ORA $0A              ; 05 0A | Logical OR with accumulator (zero page)
    BPL $25              ; 10 25 | Branch if positive
    INC                  ; 1A | Increment accumulator
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank48_DmaFunction_09A
; Address: $E4A1A9
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_09A:
    SEC                  ; 38 | Set carry flag
    DEC                  ; 3A | Decrement accumulator
    PLA                  ; 68 | Pull accumulator from stack
    ROL $62              ; 26 62 | Rotate left (zero page)
    AND $0730,X          ; 3D 30 07 | Logical AND with accumulator (absolute,X)
    INC                  ; 1A | Increment accumulator
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    ORA ($2C,X)          ; 01 2C | Logical OR with accumulator ((zero page,X))
    ORA ($45,X)          ; 01 45 | Logical OR with accumulator ((zero page,X))
    EOR $5E00,X          ; 5D 00 5E | Exclusive OR with accumulator (absolute,X)
    STZ $0379            ; 9C 79 03 | Store zero to absolute
    AND $3B07,X          ; 3D 07 3B | Logical AND with accumulator (absolute,X)
    BIT $5D0B            ; 2C 0B 5D | Test bits in accumulator (absolute)
    ASL $693F            ; 0E 3F 69 | Arithmetic shift left (absolute)
    ROL $C2              ; 26 C2 | Rotate left (zero page)
    INC $00              ; E6 00 | Increment (zero page)
    ROL $3C00            ; 2E 00 3C | Rotate left (absolute)
    EOR $3700,X          ; 5D 00 37 | Exclusive OR with accumulator (absolute,X)
    SBC $2200,X          ; FD 00 22 | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_09C
; Address: $E4A1EE
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_09C:
    JSR $E95F            ; 20 5F E9 | Jump to subroutine
    LDX $BC00,Y          ; BE 00 BC | Load from absolute,Y into X register
    CMP $8300,X          ; DD 00 83 | Compare accumulator (absolute,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    XBA                  ; EB | Exchange accumulator bytes
    EOR $BE              ; 45 BE | Exclusive OR with accumulator (zero page)
    EOR $984B,Y          ; 59 4B 98 | Exclusive OR with accumulator (absolute,Y)
    DEX                  ; CA | Decrement X register
    PLX                  ; FA | Pull X register from stack
    LDX $00              ; A6 00 | Load from zero page into X register
    AND $BF00            ; 2D 00 BF | Logical AND with accumulator (absolute)
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $F800            ; 4C 00 F8 | Jump to address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_09D
; Address: $E4A226
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_09D:
    ROL $14ED,X          ; 3E ED 14 | Rotate left (absolute,X)
    INC $9906            ; EE 06 99 | Increment (absolute)
    CPX $3849            ; EC 49 38 | Compare X register (absolute)
    LSR $00F4,X          ; 5E F4 00 | Logical shift right (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    DEC $D300,X          ; DE 00 D3 | Decrement (absolute,X)
    PLX                  ; FA | Pull X register from stack
    LDX $00              ; A6 00 | Load from zero page into X register
    CPY #$BF             ; C0 BF | Compare Y register (immediate)
    LDA                  ; BF C0 40 7F | Load from absolute long,X into accumulator
    LDX $71DF,Y          ; BE DF 71 | Load from absolute,Y into X register
    ADC $3810,Y          ; 79 10 38 | Add with carry (absolute,Y)
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    BRA $FF              ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank48_DmaFunction_09E
; Address: $E4A258
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_09E:
    STX $FF              ; 86 FF | Store X register to zero page
    BVS $70              ; 70 70 | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    JMP $5D425F          ; 5C 5F 42 5D | Jump to address long
    LSR $4040,X          ; 5E 40 40 | Logical shift right (absolute,X)
    BPL $30              ; 10 30 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0A0
; Address: $E4A270
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0A0:
    BRA $FF              ; 80 FF | Branch always
    LDY #$FD             ; A0 FD | Load immediate value into Y register
    LDX #$FC             ; A2 FC | Load immediate value into X register
    LDA ($FE,X)          ; A1 FE | Load from (zero page,X) into accumulator
    LDA                  ; BF FF 80 FF | Load from absolute long,X into accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    SED                  ; F8 | Set decimal mode flag
    ROL $1D1D,X          ; 3E 1D 1D | Rotate left (absolute,X)
    AND $3D1D,X          ; 3D 1D 3D | Logical AND with accumulator (absolute,X)
    JMP $7E5E7D          ; 5C 7D 5E 7E | Jump to address long
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    JMP $427E42          ; 5C 42 7E 42 | Hardware register operation
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    ORA #$7F             ; 09 7F | Logical OR with accumulator (immediate)
    EOR ($BA),Y          ; 51 BA | Exclusive OR with accumulator ((zero page),Y)
    CMP $BD44,Y          ; D9 44 BD | Compare accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    ORA $0400            ; 0D 00 04 | Logical OR with accumulator (absolute)
    LDA                  ; BF 00 FB 00 | Load from absolute long,X into accumulator
    EOR $1F00,X          ; 5D 00 1F | Exclusive OR with accumulator (absolute,X)
    ORA $0400            ; 0D 00 04 | Logical OR with accumulator (absolute)
    SBC ($9E,X)          ; E1 9E | Subtract with carry ((zero page,X))
    SBC $E391,Y          ; F9 91 E3 | Subtract with carry (absolute,Y)
    LDA #$5E             ; A9 5E | Load immediate value into accumulator
    SBC $27              ; E5 27 | Subtract with carry (zero page)
    ROL $7E00,X          ; 3E 00 7E | Rotate left (absolute,X)
    INC $F800,X          ; FE 00 F8 | Increment (absolute,X)
    ASL $1A              ; 06 1A | Arithmetic shift left (zero page)
    ADC $A236,Y          ; 79 36 A2 | Add with carry (absolute,Y)
    STZ $FA84            ; 9C 84 FA | Store zero to absolute
    LSR $40B1            ; 4E B1 40 | Logical shift right (absolute)
    LDY #$FA             ; A0 FA | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0A1
; Address: $E4A2F0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0A1:
    LDA $CF00            ; AD 00 CF | Load from absolute address into accumulator
    LSR $9C20,X          ; 5E 20 9C | Logical shift right (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0A3
; Address: $E4A302
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0A3:
    JSR $10DE            ; 20 DE 10 | Jump to subroutine
    INC $EE10            ; EE 10 EE | Increment (absolute)
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0A4
; Address: $E4A312
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0A4:
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    PEA #$C000           ; F4 00 C0 | Push effective address to stack
    ROL $3A1F,X          ; 3E 1F 3A | Rotate left (absolute,X)
    INC                  ; 1A | Increment accumulator
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    BRA $00              ; 80 00 | Branch always
    LDY #$00             ; A0 00 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0A5
; Address: $E4A336
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0A5:
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    SBC ($F4),Y          ; F1 F4 | Subtract with carry ((zero page),Y)
    SBC ($D6),Y          ; F1 D6 | Subtract with carry ((zero page),Y)
    BNE $90              ; D0 90 | Branch if not equal
    LDY #$88             ; A0 88 | Load immediate value into Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    SEI                  ; 78 | Set interrupt disable flag
    BNE $F0              ; D0 F0 | Branch if not equal

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0A6
; Address: $E4A34E
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0A6:
    JSR $0FE0            ; 20 E0 0F | Jump to subroutine
    ROL $6C00            ; 2E 00 6C | Rotate left (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    CPX #$18             ; E0 18 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CMP #$08             ; C9 08 | Compare accumulator (immediate)
    LDX $F32E            ; AE 2E F3 | Load from absolute address into X register
    STZ $451E,X          ; 9E 1E 45 | Store zero to absolute,X
    STA $30              ; 85 30 | Store accumulator to zero page
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    BRA $00              ; 80 00 | Branch always
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    PLY                  ; 7A | Pull Y register from stack
    LDA $24              ; A5 24 | Load from zero page into accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    AND $066F            ; 2D 6F 06 | Logical AND with accumulator (absolute)
    STA $FFEF08          ; 8F 08 EF FF | Store accumulator to absolute long address
    BCC $00              ; 90 00 | Branch if carry clear
    BEQ $00              ; F0 00 | Branch if equal
    BVS $00              ; 70 00 | Branch if overflow set
    BPL $00              ; 10 00 | Branch if positive
    SEC                  ; 38 | Set carry flag
    ROL                  ; 2A | Rotate left (accumulator)
    INC $09              ; E6 09 | Increment (zero page)
    LDA                  ; BF 94 37 34 | Load from absolute long,X into accumulator
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0A7
; Address: $E4A3B8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0A7:
    JSR $00DE            ; 20 DE 00 | Jump to subroutine
    PHA                  ; 48 | Push accumulator to stack
    STA ($01,X)          ; 81 01 | Store accumulator to (zero page,X)
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0A8
; Address: $E4A3C9
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0A8:
    LDY #$48             ; A0 48 | Load immediate value into Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    ADC ($F8),Y          ; 71 F8 | Add with carry ((zero page),Y)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    SED                  ; F8 | Set decimal mode flag
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC $FF              ; 65 FF | Add with carry (zero page)
    LDA $E5BF,Y          ; B9 BF E5 | Load from absolute,Y into accumulator
    CPX $1DEF            ; EC EF 1D | Compare X register (absolute)
    XBA                  ; EB | Exchange accumulator bytes
    PLY                  ; 7A | Pull Y register from stack
    PLP                  ; 28 | Pull processor status from stack
    JMP ($0000)          ; 6C 00 00 | Jump to address (absolute indirect)
    TYA                  ; 98 | Transfer Y register to accumulator
    RTI                  ; 40 | Return from interrupt
    BPL $EF              ; 10 EF | Branch if positive
    BIT #$76             ; 89 76 | Test bits in accumulator (immediate)
    JMP ($0044)          ; 6C 44 00 | Jump to address (absolute indirect)
    SED                  ; F8 | Set decimal mode flag
    LDX $5DFD,Y          ; BE FD 5D | Load from absolute,Y into X register
    XBA                  ; EB | Exchange accumulator bytes
    STA $6DEE,Y          ; 99 EE 6D | Store accumulator to absolute,Y
    SBC $8587,Y          ; F9 87 85 | Subtract with carry (absolute,Y)
    LDA $FC0350          ; AF 50 03 FC | Load from absolute long address into accumulator
    SBC $BF40,X          ; FD 40 BF | Subtract with carry (absolute,X)
    SBC $DF20,X          ; FD 20 DF | Subtract with carry (absolute,X)
    PHA                  ; 48 | Push accumulator to stack
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    CPX #$00             ; E0 00 | Compare X register (immediate)
    STY $54              ; 84 54 | Store Y register to zero page
    BNE $68              ; D0 68 | Branch if not equal
    CPY #$90             ; C0 90 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    BRA $2E              ; 80 2E | Branch always
    CPY #$3C             ; C0 3C | Compare Y register (immediate)
    CPY #$F8             ; C0 F8 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    INC $FCD4,X          ; FE D4 FC | Increment (absolute,X)
    STA $4BF9,Y          ; 99 F9 4B | Store accumulator to absolute,Y
    CMP ($81,X)          ; C1 81 | Compare accumulator ((zero page,X))
    STX $3E              ; 86 3E | Store X register to zero page
    LSR $937F,X          ; 5E 7F 93 | Logical shift right (absolute,X)
    TXS                  ; 9A | Transfer X register to stack pointer

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0A9
; Address: $E4A474
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0A9:
    JMP $BE00            ; 4C 00 BE | Jump to address
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0AA
; Address: $E4A481
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0AA:
    JSL $C5D91F          ; 22 1F D9 C5 | Jump to subroutine long
    CPX $C0              ; E4 C0 | Compare X register (zero page)
    DEC $1E6E            ; CE 6E 1E | Decrement (absolute)
    CMP #$EF             ; C9 EF | Compare accumulator (immediate)
    STA $F4              ; 85 F4 | Store accumulator to zero page
    SEP #$00             ; E2 00 | Set processor status bits
    AND $1A00,Y          ; 39 00 1A | Logical AND with accumulator (absolute,Y)
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0AB
; Address: $E4A49A
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0AB:
    JSR $1000            ; 20 00 10 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    PHA                  ; 48 | Push accumulator to stack
    SED                  ; F8 | Set decimal mode flag
    BRA $98              ; 80 98 | Branch always
    BPL $E8              ; 10 E8 | Branch if positive
    CPY #$E4             ; C0 E4 | Compare Y register (immediate)
    INC $9C              ; E6 9C | Increment (zero page)
    INC $33              ; E6 33 | Increment (zero page)
    REP #$00             ; C2 00 | Reset processor status bits
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    RTI                  ; 40 | Return from interrupt
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    INC                  ; 1A | Increment accumulator
    DEC                  ; 3A | Decrement accumulator
    AND $DEA2,X          ; 3D A2 DE | Logical AND with accumulator (absolute,X)
    LDX $DA              ; A6 DA | Load from zero page into X register
    ROL                  ; 2A | Rotate left (accumulator)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    BNE $9C              ; D0 9C | Branch if not equal
    SEI                  ; 78 | Set interrupt disable flag
    BCS $CC              ; B0 CC | Branch if carry set
    ROR $7E00,X          ; 7E 00 7E | Rotate right (absolute,X)
    BRA $7C              ; 80 7C | Branch always
    BRA $78              ; 80 78 | Branch always
    BRA $78              ; 80 78 | Branch always
    BPL $6C              ; 10 6C | Branch if positive
    DEY                  ; 88 | Decrement Y register
    LSR $99CD            ; 4E CD 99 | Logical shift right (absolute)
    SEP #$8F             ; E2 8F | Set processor status bits
    LDY $A2B7            ; AC B7 A2 | Load from absolute address into Y register
    LDY $0038,X          ; BC 38 00 | Load from absolute,X into Y register
    JMP $B007            ; 4C 07 B0 | Jump to address

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0AC
; Address: $E4A4F6
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0AC:
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    BVS $00              ; 70 00 | Branch if overflow set
    STZ $7E              ; 64 7E | Store zero to zero page
    RTI                  ; 40 | Return from interrupt
    EOR ($7E,X)          ; 41 7E | Exclusive OR with accumulator ((zero page,X))
    CPX #$EC             ; E0 EC | Compare X register (immediate)
    JMP ($BA6E)          ; 6C 6E BA | Jump to address (absolute indirect)
    LDY $FDDD,X          ; BC DD FD | Load from absolute,X into Y register
    SBC ($FE),Y          ; F1 FE | Subtract with carry ((zero page),Y)
    LDX $001C,Y          ; BE 1C 00 | Load from absolute,Y into X register
    CPX #$05             ; E0 05 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BCC $BE              ; 90 BE | Branch if carry clear
    ORA ($7C,X)          ; 01 7C | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    EOR ($BA),Y          ; 51 BA | Exclusive OR with accumulator ((zero page),Y)
    CMP $BD44,Y          ; D9 44 BD | Compare accumulator (absolute,Y)
    LSR $1709,X          ; 5E 09 17 | Logical shift right (absolute,X)
    ORA $020F,Y          ; 19 0F 02 | Logical OR with accumulator (absolute,Y)
    ORA $00EF            ; 0D EF 00 | Logical OR with accumulator (absolute)
    LDA                  ; BF 00 FB 00 | Load from absolute long,X into accumulator
    EOR $1E00,X          ; 5D 00 1E | Exclusive OR with accumulator (absolute,X)
    ASL $0D00,X          ; 1E 00 0D | Arithmetic shift left (absolute,X)
    SBC $539A            ; ED 9A 53 | Subtract with carry (absolute)
    INC $3FF8            ; EE F8 3F | Increment (absolute)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    BEQ $FF              ; F0 FF | Branch if equal
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    PHY                  ; 5A | Push Y register to stack
    LDA $B6D6,Y          ; B9 D6 B6 | Load from absolute,Y into accumulator
    AND #$FE             ; 29 FE | Logical AND with accumulator (immediate)
    SED                  ; F8 | Set decimal mode flag
    STA $7CED            ; 8D ED 7C | Store accumulator to absolute address
    INC $00ED,X          ; FE ED 00 | Increment (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0AD
; Address: $E4A582
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0AD:
    JSR $10DE            ; 20 DE 10 | Jump to subroutine
    INC $EE10            ; EE 10 EE | Increment (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0AF
; Address: $E4A58E
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0AF:
    JSR $9400            ; 20 00 94 | Jump to subroutine
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    PEA #$1000           ; F4 00 10 | Push effective address to stack
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CMP $26FD,X          ; DD FD 26 | Compare accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0B0
; Address: $E4A5A3
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0B0:
    ROR $3D              ; 66 3D | Rotate right (zero page)
    ADC $7F07,X          ; 7D 07 7F | Add with carry (absolute,X)
    BNE $5F              ; D0 5F | Branch if not equal
    INC $F56F            ; EE 6F F5 | Increment (absolute)
    AND ($FF,X)          ; 21 FF | Logical AND with accumulator ((zero page,X))
    STA $8200,Y          ; 99 00 82 | Store accumulator to absolute,Y
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BVS $00              ; 70 00 | Branch if overflow set
    ROL $9F00,X          ; 3E 00 9F | Rotate left (absolute,X)
    SBC $F8              ; E5 F8 | Subtract with carry (zero page)
    ADC ($E7),Y          ; 71 E7 | Add with carry ((zero page),Y)
    CPX $2F              ; E4 2F | Compare X register (zero page)
    SBC $829F            ; ED 9F 82 | Subtract with carry (absolute)
    ROL                  ; 2A | Rotate left (accumulator)
    PHA                  ; 48 | Push accumulator to stack
    STA $000F00          ; 8F 00 0F 00 | Store accumulator to absolute long address
    ORA $7200,X          ; 1D 00 72 | Logical OR with accumulator (absolute,X)
    PLX                  ; FA | Pull X register from stack
    PHA                  ; 48 | Push accumulator to stack
    BIT #$F4             ; 89 F4 | Test bits in accumulator (immediate)
    REP #$F6             ; C2 F6 | Reset processor status bits
    PLP                  ; 28 | Pull processor status from stack
    PHX                  ; DA | Push X register to stack
    STZ $A8AE            ; 9C AE A8 | Store zero to absolute
    CMP ($44,X)          ; C1 44 | Compare accumulator ((zero page,X))
    SBC $3F00,Y          ; F9 00 3F | Subtract with carry (absolute,Y)
    BRA $1F              ; 80 1F | Branch always
    ASL $3608,X          ; 1E 08 36 | Arithmetic shift left (absolute,X)
    JMP $0032            ; 4C 32 00 | Jump to address
    PHA                  ; 48 | Push accumulator to stack
    STZ $9C              ; 64 9C | Store zero to zero page
    DEX                  ; CA | Decrement X register
    DEC $512C            ; CE 2C 51 | Decrement (absolute)
    INY                  ; C8 | Increment Y register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SBC $0C              ; E5 0C | Subtract with carry (zero page)
    SBC $9C              ; E5 9C | Subtract with carry (zero page)
    BRA $1C              ; 80 1C | Branch always
    PHP                  ; 08 | Push processor status to stack
    BRA $7F              ; 80 7F | Branch always
    INC $7C00,X          ; FE 00 7C | Increment (absolute,X)
    AND $3F              ; 25 3F | Logical AND with accumulator (zero page)
    ROL $3E2C,X          ; 3E 2C 3E | Rotate left (absolute,X)
    DEC                  ; 3A | Decrement accumulator
    BIT $013E            ; 2C 3E 01 | Test bits in accumulator (absolute)
    ORA #$0B             ; 09 0B | Logical OR with accumulator (immediate)
    CPY #$7E             ; C0 7E | Compare Y register (immediate)
    CMP ($7C,X)          ; C1 7C | Compare accumulator ((zero page,X))
    CMP ($7D,X)          ; C1 7D | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0B1
; Address: $E4A636
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0B1:
    CPY $6E              ; C4 6E | Compare Y register (zero page)
    CMP ($47,X)          ; C1 47 | Compare accumulator ((zero page,X))
    CPX $EC47            ; EC 47 EC | Compare X register (absolute)
    PEA #$707F           ; F4 7F 70 | Push effective address to stack
    SBC $3C31,Y          ; F9 31 3C | Subtract with carry (absolute,Y)
    ROR $6E              ; 66 6E | Rotate right (zero page)
    INC $6E2C,X          ; FE 2C 6E | Increment (absolute,X)
    ASL $DE90,X          ; 1E 90 DE | Arithmetic shift left (absolute,X)
    BMI $3E              ; 30 3E | Branch if negative
    CPX #$FE             ; E0 FE | Compare X register (immediate)
    STA ($FE),Y          ; 91 FE | Store accumulator to (zero page),Y
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    BVC $60              ; 50 60 | Branch if overflow clear
    PLA                  ; 68 | Pull accumulator from stack
    BMI $E4              ; 30 E4 | Branch if negative
    TYA                  ; 98 | Transfer Y register to accumulator
    BCC $58              ; 90 58 | Branch if carry clear
    BCS $70              ; B0 70 | Branch if carry set
    JMP ($DABC)          ; 6C BC DA | Jump to address (absolute indirect)
    BCC $00              ; 90 00 | Branch if carry clear
    INY                  ; C8 | Increment Y register
    SEI                  ; 78 | Set interrupt disable flag
    ROR $EC00            ; 6E 00 EC | Rotate right (absolute)
    SED                  ; F8 | Set decimal mode flag
    STZ $2600            ; 9C 00 26 | Store zero to absolute
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY $83              ; C4 83 | Compare Y register (zero page)
    PHB                  ; 8B | Push data bank register to stack
    CMP $3C81            ; CD 81 3C | Compare accumulator (absolute)
    LSR $937F,X          ; 5E 7F 93 | Logical shift right (absolute,X)
    LDY $4400,X          ; BC 00 44 | Load from absolute,X into Y register
    PHA                  ; 48 | Push accumulator to stack
    INC $4300,X          ; FE 00 43 | Increment (absolute,X)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    SBC $F0B7,X          ; FD B7 F0 | Subtract with carry (absolute,X)
    CPY $FF              ; C4 FF | Compare Y register (zero page)
    SEC                  ; 38 | Set carry flag
    ROL $EF              ; 26 EF | Rotate left (zero page)
    CMP $81EF            ; CD EF 81 | Compare accumulator (absolute)
    SBC ($05),Y          ; F1 05 | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0B2
; Address: $E4A6D8
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0B2:
    SBC $1000,Y          ; F9 00 10 | Subtract with carry (absolute,Y)
    BPL $00              ; 10 00 | Branch if positive
    ASL $9F00            ; 0E 00 9F | Arithmetic shift left (absolute)
    ASL $62E2,X          ; 1E E2 62 | Arithmetic shift left (absolute,X)
    LSR $4059            ; 4E 59 40 | Logical shift right (absolute)
    DEC $46              ; C6 46 | Decrement (zero page)
    EOR ($40),Y          ; 51 40 | Exclusive OR with accumulator ((zero page),Y)
    INC $747D,X          ; FE 7D 74 | Increment (absolute,X)
    PHB                  ; 8B | Push data bank register to stack
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    STA $B100,X          ; 9D 00 B1 | Store accumulator to absolute,X
    LDA                  ; BF 00 B9 00 | Load from absolute long,X into accumulator
    LDA                  ; BF 00 83 00 | Load from absolute long,X into accumulator
    ORA #$1B             ; 09 1B | Logical OR with accumulator (immediate)
    ADC $0A1D,X          ; 7D 1D 0A | Add with carry (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ROR $781E,X          ; 7E 1E 78 | Rotate right (absolute,X)
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPX $7F              ; E4 7F | Compare X register (zero page)
    SEP #$00             ; E2 00 | Set processor status bits
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    LDA                  ; BF 3F 80 00 | Load from absolute long,X into accumulator
    PLA                  ; 68 | Pull accumulator from stack
    ADC #$91             ; 69 91 | Add with carry (immediate)
    BCC $68              ; 90 68 | Branch if carry clear
    PLA                  ; 68 | Pull accumulator from stack
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    INC $FFFE,X          ; FE FE FF | Increment (absolute,X)
    INC $00B7,X          ; FE B7 00 | Increment (absolute,X)
    SBC $01FC,X          ; FD FC 01 | Subtract with carry (absolute,X)
    BMI $30              ; 30 30 | Branch if negative
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    REP #$C2             ; C2 C2 | Reset processor status bits
    BPL $10              ; 10 10 | Branch if positive
    SBC $BB00,X          ; FD 00 BB | Subtract with carry (absolute,X)
    AND $EF00,X          ; 3D 00 EF | Logical AND with accumulator (absolute,X)
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    ROL                  ; 2A | Rotate left (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    BRA $80              ; 80 80 | Branch always
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    ROR $66              ; 66 66 | Rotate right (zero page)
    XBA                  ; EB | Exchange accumulator bytes
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    STA $4B00,Y          ; 99 00 4B | Store accumulator to absolute,Y

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0B3
; Address: $E4A782
; Size: 113 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0B3:
    STA ($FD,X)          ; 81 FD | Store accumulator to (zero page,X)
    STA ($93),Y          ; 91 93 | Store accumulator to (zero page),Y
    PLB                  ; AB | Pull data bank register from stack
    AND $E7              ; 25 E7 | Logical AND with accumulator (zero page)
    CPY $08DC            ; CC DC 08 | Compare Y register (absolute)
    ROL $00B4,X          ; 3E B4 00 | Rotate left (absolute,X)
    ROR $B300,X          ; 7E 00 B3 | Rotate right (absolute,X)
    JMP ($1000)          ; 6C 00 10 | Jump to address (absolute indirect)
    CLC                  ; 18 | Clear carry flag
    CMP #$DD             ; C9 DD | Compare accumulator (immediate)
    ROR $FE08,X          ; 7E 08 FE | Rotate right (absolute,X)
    ORA $B39D,X          ; 1D 9D B3 | Logical OR with accumulator (absolute,X)
    ADC $FE98,X          ; 7D 98 FE | Add with carry (absolute,X)
    PLB                  ; AB | Pull data bank register from stack
    LDY $6200            ; AC 00 62 | Load from absolute address into Y register
    JMP $8200            ; 4C 00 82 | Jump to address
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    EOR $267D,X          ; 5D 7D 26 | Exclusive OR with accumulator (absolute,X)
    ROR $3D              ; 66 3D | Rotate right (zero page)
    ADC $7F47,X          ; 7D 47 7F | Add with carry (absolute,X)
    TAY                  ; A8 | Transfer accumulator to Y register
    INC $27              ; E6 27 | Increment (zero page)
    SBC $F891,X          ; FD 91 F8 | Subtract with carry (absolute,X)
    LDA $990082          ; AF 82 00 99 | Load from absolute long address into accumulator
    BRA $00              ; 80 00 | Branch always
    BNE $00              ; D0 00 | Branch if not equal
    SEI                  ; 78 | Set interrupt disable flag
    STZ $A800,X          ; 9E 00 A8 | Store zero to absolute,X
    SBC $FC              ; E5 FC | Subtract with carry (zero page)
    ADC $FEE3,X          ; 7D E3 FE | Add with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SBC $7D              ; E5 7D | Subtract with carry (zero page)
    PEA #$80BD           ; F4 BD 80 | Push effective address to stack
    SBC ($03),Y          ; F1 03 | Subtract with carry ((zero page),Y)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA $1A00,X          ; 1D 00 1A | Logical OR with accumulator (absolute,X)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    PHX                  ; DA | Push X register to stack
    ORA $62E3,Y          ; 19 E3 62 | Logical OR with accumulator (absolute,Y)
    STA $3D00,Y          ; 99 00 3D | Store accumulator to absolute,Y
    TXS                  ; 9A | Transfer X register to stack pointer
    RTI                  ; 40 | Return from interrupt
    LDX $342D            ; AE 2D 34 | Load from absolute address into X register
    STA $FF00,X          ; 9D 00 FF | Store accumulator to absolute,X
    SBC $BF00,X          ; FD 00 BF | Subtract with carry (absolute,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0B4
; Address: $E4A841
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0B4:
    TYA                  ; 98 | Transfer Y register to accumulator
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA                  ; BF 00 57 00 | Load from absolute long,X into accumulator
    STA $FB00            ; 8D 00 FB | Store accumulator to absolute address
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    PLY                  ; 7A | Pull Y register from stack
    PLY                  ; 7A | Pull Y register from stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ROR $EB00,X          ; 7E 00 EB | Rotate right (absolute,X)
    STA $00              ; 85 00 | Store accumulator to zero page
    INC $3C00,X          ; FE 00 3C | Increment (absolute,X)
    ROL $BE              ; 26 BE | Rotate left (zero page)
    ORA $8CD9,Y          ; 19 D9 8C | Logical OR with accumulator (absolute,Y)
    STA $507737          ; 8F 37 77 50 | Store accumulator to absolute long address
    SED                  ; F8 | Set decimal mode flag
    BIT #$FB             ; 89 FB | Test bits in accumulator (immediate)
    STA                  ; 9F 59 00 26 | Store accumulator to absolute long,X
    BVS $00              ; 70 00 | Branch if overflow set
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0B5
; Address: $E4A8A0
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0B5:
    DEC $FE              ; C6 FE | Decrement (zero page)
    AND $483D,X          ; 3D 3D 48 | Logical AND with accumulator (absolute,X)
    CMP #$A9             ; C9 A9 | Compare accumulator (immediate)
    LDA $FE84,X          ; BD 84 FE | Load from absolute,X into accumulator
    ROR $9D9C,X          ; 7E 9C 9D | Rotate right (absolute,X)
    BIT $E7              ; 24 E7 | Test bits in accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    REP #$00             ; C2 00 | Reset processor status bits
    STA $6200            ; 8D 00 62 | Store accumulator to absolute address
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0B6
; Address: $E4A8C1
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0B6:
    ROR $7F1D,X          ; 7E 1D 7F | Rotate right (absolute,X)
    BCS $FE              ; B0 FE | Branch if carry set
    LDX $E6              ; A6 E6 | Load from zero page into X register
    AND $AE7F,Y          ; 39 7F AE | Logical AND with accumulator (absolute,Y)
    INC $7C01            ; EE 01 7C | Increment (absolute)
    PHB                  ; 8B | Push data bank register to stack
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $8000,Y          ; 19 00 80 | Logical OR with accumulator (absolute,Y)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ADC $A582            ; 6D 82 A5 | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0B7
; Address: $E4A8E4
; Size: 110 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0B7:
    PHY                  ; 5A | Push Y register to stack
    PHY                  ; 5A | Push Y register to stack
    DEC $46              ; C6 46 | Decrement (zero page)
    LDX #$62             ; A2 62 | Load immediate value into X register
    EOR $7C              ; 45 7C | Exclusive OR with accumulator (zero page)
    PHB                  ; 8B | Push data bank register to stack
    LDA $00              ; A5 00 | Load from zero page into accumulator
    LDA $8000,Y          ; B9 00 80 | Load from absolute,Y into accumulator
    STA $8300,X          ; 9D 00 83 | Store accumulator to absolute,X
    AND $3C              ; 25 3C | Logical AND with accumulator (zero page)
    ROR $6666,X          ; 7E 66 66 | Rotate right (absolute,X)
    REP #$C2             ; C2 C2 | Reset processor status bits
    ADC $66              ; 65 66 | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    EOR ($7C),Y          ; 51 7C | Exclusive OR with accumulator ((zero page),Y)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    STA $3D00,Y          ; 99 00 3D | Store accumulator to absolute,Y
    STA $B500,Y          ; 99 00 B5 | Store accumulator to absolute,Y
    ROL $5700            ; 2E 00 57 | Rotate left (absolute)
    BIT $2E16            ; 2C 16 2E | Test bits in accumulator (absolute)
    ROR $FF11            ; 6E 11 FF | Rotate right (absolute)
    BCS $4F              ; B0 4F | Branch if carry set
    LDA ($4F),Y          ; B1 4F | Load from (zero page),Y into accumulator
    LDA ($4E),Y          ; B1 4E | Load from (zero page),Y into accumulator
    BVS $00              ; 70 00 | Branch if overflow set
    JMP $30E8F8          ; 5C F8 E8 30 | Jump to address long
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    STY $22DD            ; 8C DD 22 | Store Y register to absolute address
    ORA $8BF3            ; 0D F3 8B | Logical OR with accumulator (absolute)
    STA $3F2071          ; 8F 71 20 3F | Store accumulator to absolute long address
    SEI                  ; 78 | Set interrupt disable flag
    LDA $B6E6,Y          ; B9 E6 B6 | Load from absolute,Y into accumulator
    SBC #$BB             ; E9 BB | Subtract with carry (immediate)
    CPX $B4              ; E4 B4 | Compare X register (zero page)
    XBA                  ; EB | Exchange accumulator bytes
    INX                  ; E8 | Increment X register
    LDY $00E3,X          ; BC E3 00 | Load from absolute,X into Y register
    CLC                  ; 18 | Clear carry flag
    STA $E766,Y          ; 99 66 E7 | Store accumulator to absolute,Y
    CLC                  ; 18 | Clear carry flag
    ROR $99              ; 66 99 | Rotate right (zero page)
    STA $0066,Y          ; 99 66 00 | Store accumulator to absolute,Y
    NOP                  ; EA | No operation
    ASL $D72D,X          ; 1E 2D D7 | Arithmetic shift left (absolute,X)
    SBC $AD17            ; ED 17 AD | Subtract with carry (absolute)
    EOR $ADB7            ; 4D B7 AD | Exclusive OR with accumulator (absolute)
    AND $00D7            ; 2D D7 00 | Logical AND with accumulator (absolute)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0B8
; Address: $E4A9C0
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0B8:
    ADC ($4A),Y          ; 71 4A | Add with carry ((zero page),Y)
    CPY #$85             ; C0 85 | Compare Y register (immediate)
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    ORA ($F8,X)          ; 01 F8 | Logical OR with accumulator ((zero page,X))
    STX $7F              ; 86 7F | Store X register to zero page

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0B9
; Address: $E4A9CD
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0B9:
    JSR $752B            ; 20 2B 75 | Jump to subroutine
    DEC                  ; 3A | Decrement accumulator
    PLB                  ; AB | Pull data bank register from stack
    BVC $77              ; 50 77 | Branch if overflow clear
    ROL $27              ; 26 27 | Rotate left (zero page)
    EOR ($BF,X)          ; 41 BF | Exclusive OR with accumulator ((zero page,X))
    STA                  ; 9F E0 8A C0 | Store accumulator to absolute long,X
    STZ $0342,X          ; 9E 42 03 | Store zero to absolute,X
    LDA ($00,X)          ; A1 00 | Load from (zero page,X) into accumulator
    ROL                  ; 2A | Rotate left (accumulator)
    CPY #$24             ; C0 24 | Compare Y register (immediate)
    BRA $07              ; 80 07 | Branch always
    ADC $06FC,Y          ; 79 FC 06 | Add with carry (absolute,Y)
    PHY                  ; 5A | Push Y register to stack
    LDX $FE20            ; AE 20 FE | Load from absolute address into X register
    JMP $FFD5FF          ; 5C FF D5 FF | Jump to address long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC $E464            ; EE 64 E4 | Increment (absolute)
    SBC $07F9,X          ; FD F9 07 | Subtract with carry (absolute,X)
    EOR ($03),Y          ; 51 03 | Exclusive OR with accumulator ((zero page),Y)
    STA $6200,X          ; 9D 00 62 | Store accumulator to absolute,X
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0BA
; Address: $E4AA0B
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0BA:
    JSR $2060            ; 20 60 20 | Jump to subroutine
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    STA $66FF,X          ; 9D FF 66 | Store accumulator to absolute,X
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    PLA                  ; 68 | Pull accumulator from stack
    SEC                  ; 38 | Set carry flag
    BVS $DC              ; 70 DC | Branch if overflow set
    CPX #$DF             ; E0 DF | Compare X register (immediate)
    BCC $F1              ; 90 F1 | Branch if carry clear
    ADC $2E              ; 65 2E | Add with carry (zero page)
    BEQ $3F              ; F0 3F | Branch if equal
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    BRA $FF              ; 80 FF | Branch always
    ASL $9AFF            ; 0E FF 9A | Arithmetic shift left (absolute)
    BPL $3F              ; 10 3F | Branch if positive
    INC $01FE,X          ; FE FE 01 | Increment (absolute,X)
    SBC $B503,X          ; FD 03 B5 | Subtract with carry (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA $87              ; 05 87 | Logical OR with accumulator (zero page)
    AND ($B7),Y          ; 31 B7 | Logical AND with accumulator ((zero page),Y)
    ADC $01FF,Y          ; 79 FF 01 | Add with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0BB
; Address: $E4AA5A
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0BB:
    SEI                  ; 78 | Set interrupt disable flag
    PHA                  ; 48 | Push accumulator to stack
    DEC                  ; 3A | Decrement accumulator
    ROL $2E16,X          ; 3E 16 2E | Rotate left (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    ROL $2E16,X          ; 3E 16 2E | Rotate left (absolute,X)
    AND #$31             ; 29 31 | Logical AND with accumulator (immediate)
    ROL $B616            ; 2E 16 B6 | Rotate left (absolute)
    EOR #$B1             ; 49 B1 | Exclusive OR with accumulator (immediate)
    LDA ($4E),Y          ; B1 4E | Load from (zero page),Y into accumulator
    EOR #$B1             ; 49 B1 | Exclusive OR with accumulator (immediate)
    LDA ($4E),Y          ; B1 4E | Load from (zero page),Y into accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    LDA ($CF),Y          ; B1 CF | Load from (zero page),Y into accumulator
    STZ $7488            ; 9C 88 74 | Store zero to absolute
    PLA                  ; 68 | Pull accumulator from stack
    BVC $68              ; 50 68 | Branch if overflow clear
    INY                  ; C8 | Increment Y register
    BVS $68              ; 70 68 | Branch if overflow set
    PLA                  ; 68 | Pull accumulator from stack
    PHA                  ; 48 | Push accumulator to stack
    BVS $68              ; 70 68 | Branch if overflow set
    STA $8F73            ; 8D 73 8F | Store accumulator to absolute address
    ADC ($09),Y          ; 71 09 | Add with carry ((zero page),Y)
    AND ($89),Y          ; 31 89 | Logical AND with accumulator ((zero page),Y)
    SBC ($4F),Y          ; F1 4F | Subtract with carry ((zero page),Y)
    LDA ($89),Y          ; B1 89 | Load from (zero page),Y into accumulator
    INX                  ; E8 | Increment X register
    LDA $B6E6,Y          ; B9 E6 B6 | Load from absolute,Y into accumulator
    SBC #$9C             ; E9 9C | Subtract with carry (immediate)
    SBC $EAB5            ; ED B5 EA | Subtract with carry (absolute)
    STZ $B5E1,X          ; 9E E1 B5 | Store zero to absolute,X
    NOP                  ; EA | No operation
    CMP #$37             ; C9 37 | Compare accumulator (immediate)
    AND $CDD7            ; 2D D7 CD | Logical AND with accumulator (absolute)
    AND #$D7             ; 29 D7 | Logical AND with accumulator (immediate)
    STA $AD77            ; 8D 77 AD | Store accumulator to absolute address
    EOR #$B7             ; 49 B7 | Exclusive OR with accumulator (immediate)
    ORA $00F7            ; 0D F7 00 | Logical OR with accumulator (absolute)
    AND #$D6             ; 29 D6 | Logical AND with accumulator (immediate)
    AND #$D7             ; 29 D7 | Logical AND with accumulator (immediate)
    ASL $3ED4,X          ; 1E D4 3E | Arithmetic shift left (absolute,X)
    CPX #$5A             ; E0 5A | Compare X register (immediate)
    LDA                  ; BF 00 7F A9 | Load from absolute long,X into accumulator
    RTI                  ; 40 | Return from interrupt
    TAY                  ; A8 | Transfer accumulator to Y register
    RTI                  ; 40 | Return from interrupt
    TAX                  ; AA | Transfer accumulator to X register
    RTI                  ; 40 | Return from interrupt
    PLB                  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0BC
; Address: $E4AAF7
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0BC:
    RTI                  ; 40 | Return from interrupt
    PHB                  ; 8B | Push data bank register to stack
    RTI                  ; 40 | Return from interrupt
    STA                  ; 9F 60 C0 3F | Store accumulator to absolute long,X
    LSR                  ; 4A | Logical shift right (accumulator)
    PHY                  ; 5A | Push Y register to stack
    LDA                  ; BF 4A BF F6 | Load from absolute long,X into accumulator
    LDA $5207FE          ; AF FE 07 52 | Load from absolute long address into accumulator
    SBC $FE00,X          ; FD 00 FE | Subtract with carry (absolute,X)
    EOR #$02             ; 49 02 | Exclusive OR with accumulator (immediate)
    EOR ($02,X)          ; 41 02 | Exclusive OR with accumulator ((zero page,X))
    EOR ($02),Y          ; 51 02 | Exclusive OR with accumulator ((zero page),Y)
    EOR $5902,Y          ; 59 02 59 | Exclusive OR with accumulator (absolute,Y)
    SBC $0306,Y          ; F9 06 03 | Subtract with carry (absolute,Y)
    INC $6E00,X          ; FE 00 6E | Increment (absolute,X)
    ROL $2647            ; 2E 47 26 | Rotate left (absolute)
    AND ($68),Y          ; 31 68 | Logical AND with accumulator ((zero page),Y)
    ROR $4725            ; 6E 25 47 | Rotate right (absolute)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0BD
; Address: $E4AB2D
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0BD:
    JSL $4E2543          ; 22 43 25 4E | Jump to subroutine long
    ORA ($46),Y          ; 11 46 | Logical OR with accumulator ((zero page),Y)
    ORA $0D52,Y          ; 19 52 0D | Logical OR with accumulator (absolute,Y)
    EOR ($0E),Y          ; 51 0E | Exclusive OR with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    WDM #$1D             ; 42 1D | Reserved instruction
    EOR ($1E,X)          ; 41 1E | Exclusive OR with accumulator ((zero page,X))
    ROR $FF41,X          ; 7E 41 FF | Rotate right (absolute,X)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    EOR ($41,X)          ; 41 41 | Exclusive OR with accumulator ((zero page,X))
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BRA $FF              ; 80 FF | Branch always
    LDX $49FF,Y          ; BE FF 49 | Load from absolute,Y into X register
    EOR #$FF             ; 49 FF | Exclusive OR with accumulator (immediate)
    DEC $07F9            ; CE F9 07 | Decrement (absolute)
    ROR $21FE,X          ; 7E FE 21 | PPU graphics register access
    INC $86FE,X          ; FE FE 86 | Increment (absolute,X)
    STX $00              ; 86 00 | Store X register to zero page
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ADC $2EFF,Y          ; 79 FF 2E | Add with carry (absolute,Y)
    PLP                  ; 28 | Pull processor status from stack
    BIT $123F            ; 2C 3F 12 | Test bits in accumulator (absolute)
    ADC $20              ; 65 20 | Add with carry (zero page)
    EOR $4040            ; 4D 40 40 | Exclusive OR with accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    BRA $B1              ; 80 B1 | Branch always
    LSR $4FB1            ; 4E B1 4F | Logical shift right (absolute)
    LDA                  ; BF 40 BF C0 | Load from absolute long,X into accumulator
    BRA $FD              ; 80 FD | Branch always

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0BE
; Address: $E4AB9C
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0BE:
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    PLA                  ; 68 | Pull accumulator from stack
    CLI                  ; 58 | Clear interrupt disable flag
    PLA                  ; 68 | Pull accumulator from stack
    BPL $F8              ; 10 F8 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    PEA #$5E04           ; F4 04 5E | Push effective address to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA $F58B71          ; 8F 71 8B F5 | Store accumulator to absolute long address
    SBC $F903,X          ; FD 03 F9 | Subtract with carry (absolute,X)
    ORA ($5F,X)          ; 01 5F | Logical OR with accumulator ((zero page,X))
    LDA ($06,X)          ; A1 06 | Load from (zero page,X) into accumulator
    SBC $AFFC,Y          ; F9 FC AF | Subtract with carry (absolute,Y)
    BCS $EF              ; B0 EF | Branch if carry set
    LDA                  ; BF F0 DF BF | Load from absolute long,X into accumulator
    BMI $0F              ; 30 0F | Branch if negative
    LDA #$CD             ; A9 CD | Load immediate value into accumulator
    PLP                  ; 28 | Pull processor status from stack
    BNE $B0              ; D0 B0 | Branch if not equal
    RTI                  ; 40 | Return from interrupt
    STY $12FF            ; 8C FF 12 | Store Y register to absolute address
    STA $C399,Y          ; 99 99 C3 | Store accumulator to absolute,Y
    BIT $3C              ; 24 3C | Test bits in accumulator (zero page)
    ROR $FF              ; 66 FF | Rotate right (zero page)
    CLC                  ; 18 | Clear carry flag
    ORA $FDF7            ; 0D F7 FD | Logical OR with accumulator (absolute)
    SBC $F00C,X          ; FD 0C F0 | Subtract with carry (absolute,X)
    DEC $95CE            ; CE CE 95 | Decrement (absolute)
    ORA $FF00            ; 0D 00 FF | Logical OR with accumulator (absolute)
    INC $FF31,X          ; FE 31 FF | Increment (absolute,X)
    PHA                  ; 48 | Push accumulator to stack
    REP #$FE             ; C2 FE | Reset processor status bits
    BEQ $FF              ; F0 FF | Branch if equal
    EOR ($32),Y          ; 51 32 | Exclusive OR with accumulator ((zero page),Y)
    BVS $31              ; 70 31 | Branch if overflow set
    CLI                  ; 58 | Clear interrupt disable flag
    CLI                  ; 58 | Clear interrupt disable flag
    AND $3B5C,Y          ; 39 5C 3B | Logical AND with accumulator (absolute,Y)
    ROL $3C5D            ; 2E 5D 3C | Rotate left (absolute)
    BVC $0F              ; 50 0F | Branch if overflow clear
    BVC $0F              ; 50 0F | Branch if overflow clear
    BVC $0F              ; 50 0F | Branch if overflow clear
    CLI                  ; 58 | Clear interrupt disable flag
    CLI                  ; 58 | Clear interrupt disable flag
    LSR $5C11            ; 4E 11 5C | Logical shift right (absolute)
    ORA #$40             ; 09 40 | Logical OR with accumulator (immediate)
    EOR ($6C,X)          ; 41 6C | Exclusive OR with accumulator ((zero page,X))
    ADC $7F73            ; 6D 73 7F | Add with carry (absolute)
    CPY $FFF3            ; CC F3 FF | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0BF
; Address: $E4AC4A
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0BF:
    CPX $3FFF            ; EC FF 3F | Compare X register (absolute)
    CPY #$DC             ; C0 DC | Compare Y register (immediate)
    LDX $92FF,Y          ; BE FF 92 | Load from absolute,Y into X register
    BRA $FF              ; 80 FF | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    STX $30              ; 86 30 | Store X register to zero page
    LDX $F050,Y          ; BE 50 F0 | Load from absolute,Y into X register
    CPY $F0              ; C4 F0 | Compare Y register (zero page)
    SBC $F232,X          ; FD 32 F2 | Subtract with carry (absolute,X)
    AND $FF79,X          ; 3D 79 FF | Logical AND with accumulator (absolute,X)
    EOR ($F1,X)          ; 41 F1 | Exclusive OR with accumulator ((zero page,X))
    SBC ($0B),Y          ; F1 0B | Subtract with carry ((zero page),Y)
    SBC ($03),Y          ; F1 03 | Subtract with carry ((zero page),Y)
    ORA $09ED            ; 0D ED 09 | Logical OR with accumulator (absolute)
    SBC $C2F3            ; ED F3 C2 | Subtract with carry (absolute)
    BRA $57              ; 80 57 | Branch always
    ADC $4067,X          ; 7D 67 40 | Add with carry (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0C0
; Address: $E4AC8C
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0C0:
    AND $F500            ; 2D 00 F5 | Logical AND with accumulator (absolute)
    NOP                  ; EA | No operation
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    LDA $FF00            ; AD 00 FF | Load from absolute address into accumulator
    ORA ($EA,X)          ; 01 EA | Logical OR with accumulator ((zero page,X))
    INC $23              ; E6 23 | Increment (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    INC $00DA,X          ; FE DA 00 | Increment (absolute,X)
    ROR                  ; 6A | Rotate right (accumulator)
    INC $0055,X          ; FE 55 00 | Increment (absolute,X)
    BRA $FF              ; 80 FF | Branch always
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    BIT $DB              ; 24 DB | Test bits in accumulator (zero page)
    CLI                  ; 58 | Clear interrupt disable flag
    SEC                  ; 38 | Set carry flag
    LSR $483F,X          ; 5E 3F 48 | Logical shift right (absolute,X)
    ROL $3C50            ; 2E 50 3C | Rotate left (absolute)
    RTI                  ; 40 | Return from interrupt
    SEC                  ; 38 | Set carry flag
    RTI                  ; 40 | Return from interrupt
    BMI $20              ; 30 20 | Branch if negative
    EOR $5D06,Y          ; 59 06 5D | Exclusive OR with accumulator (absolute,Y)
    LSR                  ; 4A | Logical shift right (accumulator)
    BPL $54              ; 10 54 | Branch if positive
    PHA                  ; 48 | Push accumulator to stack
    BVC $00              ; 50 00 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0C1
; Address: $E4ACDE
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0C1:
    JSR $C100            ; 20 00 C1 | Jump to subroutine
    AND ($CD,X)          ; 21 CD | Logical AND with accumulator ((zero page,X))
    CMP $CD0D            ; CD 0D CD | Compare accumulator (absolute)
    ADC ($7F,X)          ; 61 7F | Add with carry ((zero page,X))
    ORA ($81,X)          ; 01 81 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0C2
; Address: $E4ACEC
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0C2:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    STZ $1FFE            ; 9C FE 1F | Store zero to absolute
    BRA $FF              ; 80 FF | Branch always
    INC $C07F,X          ; FE 7F C0 | Increment (absolute,X)
    LDA                  ; BF FF FF 63 | Load from absolute long,X into accumulator
    BRA $C1              ; 80 C1 | Branch always
    STX $FF              ; 86 FF | Store X register to zero page
    BRA $81              ; 80 81 | Branch always
    INC $02FF,X          ; FE FF 02 | Increment (absolute,X)
    CMP $BE7F,X          ; DD 7F BE | Compare accumulator (absolute,X)
    ADC #$FF             ; 69 FF | Add with carry (immediate)
    EOR #$FF             ; 49 FF | Exclusive OR with accumulator (immediate)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    SBC $FFFE,X          ; FD FE FF | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0C3
; Address: $E4AD1F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0C3:
    JSL $80E040          ; 22 40 E0 80 | Jump to subroutine long
    BCC $B0              ; 90 B0 | Branch if carry clear
    BCC $10              ; 90 10 | Branch if carry clear
    BCS $E0              ; B0 E0 | Game work RAM access
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    CPX #$00             ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0C5
; Address: $E4AD31
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0C5:
    JSR $3040            ; 20 40 30 | Jump to subroutine
    BVS $00              ; 70 00 | Branch if overflow set
    BVS $00              ; 70 00 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0C7
; Address: $E4AD3C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0C7:
    BRA $60              ; 80 60 | Branch always
    BMI $40              ; 30 40 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    EOR $A34D            ; 4D 4D A3 | Exclusive OR with accumulator (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0C8
; Address: $E4AD4C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0C8:
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    LDA                  ; BF FF F5 FF | Load from absolute long,X into accumulator
    JMP $FF6BFF          ; 5C FF 6B FF | Jump to address long
    STA $F6FF,X          ; 9D FF F6 | Store accumulator to absolute,X
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0CA
; Address: $E4AD66
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0CA:
    JSR $0220            ; 20 20 02 | Jump to subroutine
    SBC $24F9,Y          ; F9 F9 24 | Subtract with carry (absolute,Y)
    BIT $F9              ; 24 F9 | Test bits in accumulator (zero page)
    SBC $FFB2,Y          ; F9 B2 FF | Subtract with carry (absolute,Y)
    STA $E4FF            ; 8D FF E4 | Store accumulator to absolute address
    SBC $06FF            ; ED FF 06 | Subtract with carry (absolute)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0CC
; Address: $E4AD85
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0CC:
    JSR $6020            ; 20 20 60 | Jump to subroutine
    LDY #$60             ; A0 60 | Load immediate value into Y register
    CPX #$60             ; E0 60 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BVS $B4              ; 70 B4 | Branch if overflow set
    BIT $1157            ; 2C 57 11 | Test bits in accumulator (absolute)
    BVS $20              ; 70 20 | Branch if overflow set
    BPL $EF              ; 10 EF | Branch if positive
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    AND #$2D             ; 29 2D | Logical AND with accumulator (immediate)
    ROL $1E37            ; 2E 37 1E | Rotate left (absolute)
    AND $902A            ; 2D 2A 90 | Logical AND with accumulator (absolute)
    STZ $0000,X          ; 9E 00 00 | Store zero to absolute,X
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0CD
; Address: $E4ADE0
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0CD:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BMI $30              ; 30 30 | Branch if negative

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0CE
; Address: $E4ADE6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0CE:
    JSR $3090            ; 20 90 30 | Jump to subroutine
    BNE $88              ; D0 88 | Branch if not equal
    JMP $244C            ; 4C 4C 24 | Jump to address
    XBA                  ; EB | Exchange accumulator bytes
    ORA $0000,Y          ; 19 00 00 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0D0
; Address: $E4ADF7
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0D0:
    BRA $20              ; 80 20 | Branch always
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    CPY #$1A             ; C0 1A | Compare Y register (immediate)
    CPX #$06             ; E0 06 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    INY                  ; C8 | Increment Y register
    INC $FB05            ; EE 05 FB | Increment (absolute)
    DEX                  ; CA | Decrement X register
    AND $1824,X          ; 3D 24 18 | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0D1
; Address: $E4AE0F
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0D1:
    BPL $08              ; 10 08 | Branch if positive
    STY $08              ; 84 08 | Store Y register to zero page
    BCC $4E              ; 90 4E | Branch if carry clear
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    LSR $F74D            ; 4E 4D F7 | Logical shift right (absolute)
    SBC ($BF),Y          ; F1 BF | Subtract with carry ((zero page),Y)
    ADC $FE              ; 65 FE | Add with carry (zero page)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    EOR ($B8),Y          ; 51 B8 | Exclusive OR with accumulator ((zero page),Y)
    INC $C610            ; EE 10 C6 | Increment (absolute)
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    LDY $1A              ; A4 1A | Load from zero page into Y register
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 00 FF 00 | Load from absolute long,X into accumulator
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    CPY #$A0             ; C0 A0 | Compare Y register (immediate)
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BVC $E0              ; 50 E0 | Game work RAM access
    BNE $A0              ; D0 A0 | Branch if not equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0D7
; Address: $E4AE5F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0D7:
    JSR $BFFF            ; 20 FF BF | Jump to subroutine
    JMP $FD6BFF          ; 5C FF 6B FD | Jump to address long
    STA $F6FF,X          ; 9D FF F6 | Store accumulator to absolute,X
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0D8
; Address: $E4AE82
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0D8:
    LDA                  ; BF 8D FC E4 | Load from absolute long,X into accumulator
    SBC $06FF            ; ED FF 06 | Subtract with carry (absolute)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    BPL $FF              ; 10 FF | Branch if positive
    BRA $80              ; 80 80 | Branch always
    BRA $40              ; 80 40 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0D9
; Address: $E4AEB5
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0D9:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA $1533            ; 0D 33 15 | Logical OR with accumulator (absolute)
    BNE $00              ; D0 00 | Branch if not equal
    BPL $EF              ; 10 EF | Branch if positive
    CMP $38EF,Y          ; D9 EF 38 | Compare accumulator (absolute,Y)
    SEC                  ; 38 | Set carry flag
    XBA                  ; EB | Exchange accumulator bytes
    BIT $36              ; 24 36 | Test bits in accumulator (zero page)
    CLD                  ; D8 | Clear decimal mode flag
    CMP #$36             ; C9 36 | Compare accumulator (immediate)
    ADC $FF6D            ; 6D 6D FF | Add with carry (absolute)
    ADC $FF92            ; 6D 92 FF | Add with carry (absolute)
    CLC                  ; 18 | Clear carry flag
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0DA
; Address: $E4AF30
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0DA:
    JSR $501F            ; 20 1F 50 | Jump to subroutine
    PLA                  ; 68 | Pull accumulator from stack
    BPL $03              ; 10 03 | Branch if positive
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    BMI $E0              ; 30 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0DB
; Address: $E4AF43
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0DB:
    JSR $D010            ; 20 10 D0 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    ORA $12F0            ; 0D F0 12 | Logical OR with accumulator (absolute)
    CPX #$28             ; E0 28 | Compare X register (immediate)
    CPY #$24             ; C0 24 | Compare Y register (immediate)
    CPY #$90             ; C0 90 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    DEC $0C21,X          ; DE 21 0C | Decrement (absolute,X)
    CLC                  ; 18 | Clear carry flag
    BNE $0F              ; D0 0F | Branch if not equal
    BMI $00              ; 30 00 | Branch if negative
    BMI $B0              ; 30 B0 | Branch if negative

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0DC
; Address: $E4AF81
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0DC:
    JSR $8043            ; 20 43 80 | Jump to subroutine
    BRA $9C              ; 80 9C | Branch always
    LDY $0704,X          ; BC 04 07 | Load from absolute,X into Y register
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0DD
; Address: $E4AF99
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0DD:
    LDA                  ; BF F8 07 86 | Load from absolute long,X into accumulator
    ORA ($23,X)          ; 01 23 | Logical OR with accumulator ((zero page,X))
    BEQ $D9              ; F0 D9 | Branch if equal
    INC $8F              ; E6 8F | Increment (zero page)
    BEQ $09              ; F0 09 | Branch if equal
    BNE $F6              ; D0 F6 | Branch if not equal
    ASL $43              ; 06 43 | Arithmetic shift left (zero page)
    BPL $00              ; 10 00 | Branch if positive
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    ORA ($17),Y          ; 11 17 | Logical OR with accumulator ((zero page),Y)
    CPY $F803            ; CC 03 F8 | Compare Y register (absolute)
    RTI                  ; 40 | Return from interrupt
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    INC $C610            ; EE 10 C6 | Increment (absolute)
    SEC                  ; 38 | Set carry flag
    BPL $EF              ; 10 EF | Branch if positive
    BVC $E8              ; 50 E8 | Branch if overflow clear
    TAY                  ; A8 | Transfer accumulator to Y register
    CPY $E4B0            ; CC B0 E4 | Compare Y register (absolute)
    LSR $3252            ; 4E 52 32 | Logical shift right (absolute)
    ADC $FAD5,Y          ; 79 D5 FA | Add with carry (absolute,Y)
    BMI $B7              ; 30 B7 | Branch if negative
    ADC #$7B             ; 69 7B | Add with carry (immediate)
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    LDY #$1E             ; A0 1E | Load immediate value into Y register
    BRA $1F              ; 80 1F | Branch always
    PHA                  ; 48 | Push accumulator to stack
    ASL $84              ; 06 84 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0DE
; Address: $E4B001
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0DE:
    JSR $2619            ; 20 19 26 | Jump to subroutine
    BMI $69              ; 30 69 | Branch if negative
    BVS $22              ; 70 22 | Branch if overflow set
    DEC                  ; 3A | Decrement accumulator
    AND #$31             ; 29 31 | Logical AND with accumulator (immediate)
    BIT $38              ; 24 38 | Test bits in accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ORA $3E81,X          ; 1D 81 3E | Logical OR with accumulator (absolute,X)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CLV                  ; B8 | Clear overflow flag
    ASL $0C              ; 06 0C | Arithmetic shift left (zero page)
    CMP $EA05,Y          ; D9 05 EA | Compare accumulator (absolute,Y)
    INC                  ; 1A | Increment accumulator
    LSR $243E            ; 4E 3E 24 | Logical shift right (absolute)
    INX                  ; E8 | Increment X register
    CLC                  ; 18 | Clear carry flag
    BNE $28              ; D0 28 | Branch if not equal

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0DF
; Address: $E4B030
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0DF:
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ORA $F8              ; 05 F8 | Logical OR with accumulator (zero page)
    ASL $F8              ; 06 F8 | Arithmetic shift left (zero page)
    LDA                  ; BF 40 0F F0 | Load from absolute long,X into accumulator
    JMP $7880            ; 4C 80 78 | Jump to address
    BRA $B8              ; 80 B8 | Branch always
    ASL $1700            ; 0E 00 17 | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    PHP                  ; 08 | Push processor status to stack
    AND $1800,X          ; 3D 00 18 | Logical AND with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    DEC $0C21,X          ; DE 21 0C | Decrement (absolute,X)
    TXA                  ; 8A | Transfer X register to accumulator
    CPY #$95             ; C0 95 | Compare Y register (immediate)
    CPX $DF              ; E4 DF | Compare X register (zero page)
    CPX #$00             ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0E0
; Address: $E4B0A1
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0E0:
    JSR $8043            ; 20 43 80 | Jump to subroutine
    BRA $3E              ; 80 3E | Branch always
    CMP ($58,X)          ; C1 58 | Compare accumulator ((zero page,X))
    DEC $01              ; C6 01 | Decrement (zero page)
    AND $B7C7,Y          ; 39 C7 B7 | Logical AND with accumulator (absolute,Y)
    AND ($3E),Y          ; 31 3E | Logical AND with accumulator ((zero page),Y)
    ASL $19              ; 06 19 | Arithmetic shift left (zero page)
    BMI $3F              ; 30 3F | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    AND $2730,X          ; 3D 30 27 | Logical AND with accumulator (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    RTI                  ; 40 | Return from interrupt
    LDY #$1F             ; A0 1F | Load immediate value into Y register
    BPL $0F              ; 10 0F | Branch if positive
    BMI $0F              ; 30 0F | Branch if negative

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0E1
; Address: $E4B0DA
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0E1:
    JSR $401F            ; 20 1F 40 | Jump to subroutine
    BPL $0F              ; 10 0F | Branch if positive
    AND $966A            ; 2D 6A 96 | Logical AND with accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    CPY $54              ; C4 54 | Compare Y register (zero page)
    BIT $0EC2            ; 2C C2 0E | Test bits in accumulator (absolute)
    PLP                  ; 28 | Pull processor status from stack
    CPY $B0              ; C4 B0 | Compare Y register (zero page)
    LSR $FC02            ; 4E 02 FC | Logical shift right (absolute)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    BMI $3E              ; 30 3E | Branch if negative

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0E2
; Address: $E4B107
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0E2:
    CMP ($C5,X)          ; C1 C5 | Compare accumulator ((zero page,X))
    ORA #$80             ; 09 80 | Logical OR with accumulator (immediate)
    SEP #$22             ; E2 22 | Set processor status bits
    XBA                  ; EB | Exchange accumulator bytes
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0E3
; Address: $E4B11C
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0E3:
    JSL $F708DD          ; 22 DD 08 F7 | Jump to subroutine long
    BPL $E1              ; 10 E1 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    CPY #$2F             ; C0 2F | Compare Y register (immediate)
    BPL $E1              ; 10 E1 | Branch if positive
    STA                  ; 9F 60 FF 00 | Store accumulator to absolute long,X
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 00 FF 00 | Load from absolute long,X into accumulator
    BMI $FF              ; 30 FF | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0E4
; Address: $E4B14C
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0E4:
    INC $7F62,X          ; FE 62 7F | Increment (absolute,X)
    BPL $00              ; 10 00 | Branch if positive
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BCS $30              ; B0 30 | Branch if carry set
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ROL $0000,X          ; 3E 00 00 | Rotate left (absolute,X)
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0E5
; Address: $E4B19A
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0E5:
    JSL $000000          ; 22 00 00 00 | Jump to subroutine long
    CMP $B400,Y          ; D9 00 B4 | Compare accumulator (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    CPX $04              ; E4 04 | Compare X register (zero page)
    BMI $00              ; 30 00 | Branch if negative
    SBC $FB00,X          ; FD 00 FB | Subtract with carry (absolute,X)
    STA ($00),Y          ; 91 00 | Store accumulator to (zero page),Y
    ORA $860F            ; 0D 0F 86 | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    SBC $F000,X          ; FD 00 F0 | Subtract with carry (absolute,X)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0E6
; Address: $E4B1E1
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0E6:
    JSR $0717            ; 20 17 07 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    LSR $3C0C            ; 4E 0C 3C | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0E7
; Address: $E4B210
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0E7:
    JSR $8000            ; 20 00 80 | Jump to subroutine
    LDA ($00),Y          ; B1 00 | Load from (zero page),Y into accumulator
    WDM #$00             ; 42 00 | Reserved instruction
    LDA ($DD,X)          ; A1 DD | Load from (zero page,X) into accumulator
    CMP $02FD,X          ; DD FD 02 | Compare accumulator (absolute,X)
    SBC $1A02,X          ; FD 02 1A | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0E8
; Address: $E4B229
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0E8:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SBC $FFED            ; ED ED FF | Subtract with carry (absolute)
    BPL $5E              ; 10 5E | Branch if positive

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0E9
; Address: $E4B232
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0E9:
    JSL $00FF00          ; 22 00 FF 00 | Jump to subroutine long
    PLY                  ; 7A | Pull Y register from stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0EA
; Address: $E4B260
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0EA:
    JSR $D7D8            ; 20 D8 D7 | Jump to subroutine
    AND $6A10            ; 2D 10 6A | Logical AND with accumulator (absolute)
    CMP $D8              ; C5 D8 | Compare accumulator (zero page)
    PLP                  ; 28 | Pull processor status from stack
    SED                  ; F8 | Set decimal mode flag
    AND $0AFB            ; 2D FB 0A | Logical AND with accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    BPL $C5              ; 10 C5 | Branch if positive

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0EB
; Address: $E4B280
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0EB:
    JSL $F3E31D          ; 22 1D E3 F3 | Jump to subroutine long
    CPY $FD              ; C4 FD | Compare Y register (zero page)
    DEC                  ; 3A | Decrement accumulator
    INC                  ; 1A | Increment accumulator
    XBA                  ; EB | Exchange accumulator bytes
    BPL $91              ; 10 91 | Branch if positive
    ORA $F3FF,X          ; 1D FF F3 | Logical OR with accumulator (absolute,X)
    SBC $221B            ; ED 1B 22 | Subtract with carry (absolute)
    PHP                  ; 08 | Push processor status to stack
    STA ($EF),Y          ; 91 EF | Store accumulator to (zero page),Y
    JMP $B30C43          ; 5C 43 0C B3 | Jump to address long
    RTI                  ; 40 | Return from interrupt
    STA $A3BF43          ; 8F 43 BF A3 | Store accumulator to absolute long address
    BEQ $8F              ; F0 8F | Branch if equal
    BRA $7F              ; 80 7F | Branch always
    BRA $DC              ; 80 DC | Branch always
    LDA                  ; BF 6D E1 69 | Load from absolute long,X into accumulator
    SBC ($48,X)          ; E1 48 | Subtract with carry ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    STZ $E867,X          ; 9E 67 E8 | Store zero to absolute,X
    INX                  ; E8 | Increment X register
    INC $4C4A            ; EE 4A 4C | Increment (absolute)
    SBC ($9E,X)          ; E1 9E | Subtract with carry ((zero page,X))
    SBC ($9E,X)          ; E1 9E | Subtract with carry ((zero page,X))
    ADC $BF              ; 65 BF | Add with carry (zero page)
    LDX #$FF             ; A2 FF | Load immediate value into X register
    CPX #$9F             ; E0 9F | Compare X register (immediate)
    SEP #$1F             ; E2 1F | Set processor status bits
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF FF 00 FF | Load from absolute long,X into accumulator
    CMP #$08             ; C9 08 | Compare accumulator (immediate)
    LDX #$22             ; A2 22 | Load immediate value into X register
    TXS                  ; 9A | Transfer X register to stack pointer

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0EC
; Address: $E4B2EB
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0EC:
    INC                  ; 1A | Increment accumulator
    EOR $05              ; 45 05 | Exclusive OR with accumulator (zero page)
    BCS $00              ; B0 00 | Branch if carry set
    CMP $9C00,X          ; DD 00 9C | Compare accumulator (absolute,X)
    SBC $00              ; E5 00 | Subtract with carry (zero page)
    PLX                  ; FA | Pull X register from stack
    LDA $24              ; A5 24 | Load from zero page into accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    ASL $AF              ; 06 AF | Arithmetic shift left (zero page)
    STY $00C4            ; 8C C4 00 | Store Y register to absolute address
    STZ $F900            ; 9C 00 F9 | Store zero to absolute
    DEC $CC02            ; CE 02 CC | Decrement (absolute)
    PHA                  ; 48 | Push accumulator to stack
    DEY                  ; 88 | Decrement Y register
    JMP $04DD04          ; 5C 04 DD 04 | Jump to address long

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0ED
; Address: $E4B32F
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0ED:
    JSR $00FD            ; 20 FD 00 | Jump to subroutine
    CPX $3F40            ; EC 40 3F | Compare X register (absolute)
    CMP $FA84            ; CD 84 FA | Compare accumulator (absolute)
    DEY                  ; 88 | Decrement Y register
    PLY                  ; 7A | Pull Y register from stack
    LDA                  ; BF 00 FC 00 | Load from absolute long,X into accumulator
    STA ($2C),Y          ; 91 2C | Store accumulator to (zero page),Y
    PHY                  ; 5A | Push Y register to stack
    STA                  ; 9F FE 0F 38 | Store accumulator to absolute long,X
    WDM #$FF             ; 42 FF | Reserved instruction
    BVS $FF              ; 70 FF | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    BPL $80              ; 10 80 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    EOR ($BE),Y          ; 51 BE | Exclusive OR with accumulator ((zero page),Y)
    JMP ($C09F)          ; 6C 9F C0 | Jump to address (absolute indirect)
    BEQ $3F              ; F0 3F | Branch if equal
    TYA                  ; 98 | Transfer Y register to accumulator
    BPL $00              ; 10 00 | Branch if positive
    STY $00              ; 84 00 | Store Y register to zero page
    BRA $01              ; 80 01 | Branch always
    AND ($61,X)          ; 21 61 | Logical AND with accumulator ((zero page,X))
    BMI $3E              ; 30 3E | Branch if negative
    ROL $FF98,X          ; 3E 98 FF | Rotate left (absolute,X)
    BCC $FF              ; 90 FF | Branch if carry clear
    BRA $FF              ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0EE
; Address: $E4B3B8
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0EE:
    JSR $3EFF            ; 20 FF 3E | Jump to subroutine
    TYA                  ; 98 | Transfer Y register to accumulator
    CPX #$81             ; E0 81 | Compare X register (immediate)
    BIT $EFDA            ; 2C DA EF | Test bits in accumulator (absolute)
    LSR $F80F,X          ; 5E 0F F8 | Logical shift right (absolute,X)
    INC $1F              ; E6 1F | Increment (zero page)
    REP #$FF             ; C2 FF | Reset processor status bits
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0EF
; Address: $E4B3FC
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0EF:
    BNE $3F              ; D0 3F | Branch if not equal
    SED                  ; F8 | Set decimal mode flag
    STA ($0C,X)          ; 81 0C | Store accumulator to (zero page,X)
    ROR                  ; 6A | Rotate right (accumulator)
    TYA                  ; 98 | Transfer Y register to accumulator
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INC                  ; 1A | Increment accumulator
    ADC $A236,Y          ; 79 36 A2 | Add with carry (absolute,Y)
    STZ $FA85            ; 9C 85 FA | Store zero to absolute
    LDA ($43),Y          ; B1 43 | Load from (zero page),Y into accumulator
    LDA $F2AF,Y          ; B9 AF F2 | Load from absolute,Y into accumulator
    SBC $00AD            ; ED AD 00 | Subtract with carry (absolute)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    EOR $9220,X          ; 5D 20 92 | Exclusive OR with accumulator (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0F0
; Address: $E4B440
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0F0:
    ROR $33F9            ; 6E F9 33 | Rotate right (absolute)
    DEC $3FF8            ; CE F8 3F | Decrement (absolute)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    BEQ $FF              ; F0 FF | Branch if equal
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    EOR ($BA),Y          ; 51 BA | Exclusive OR with accumulator ((zero page),Y)
    TSX                  ; BA | Transfer stack pointer to X register
    CMP ($B6),Y          ; D1 B6 | Compare accumulator ((zero page),Y)
    SBC $FE29,X          ; FD 29 FE | Subtract with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    STA $7CED            ; 8D ED 7C | Store accumulator to absolute address
    INC $00EF,X          ; FE EF 00 | Increment (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SBC ($9E,X)          ; E1 9E | Subtract with carry ((zero page,X))
    SBC $E391,Y          ; F9 91 E3 | Subtract with carry (absolute,Y)
    LDA #$5E             ; A9 5E | Load immediate value into accumulator
    STZ $E5BB            ; 9C BB E5 | Store zero to absolute
    ROL $7E00,X          ; 3E 00 7E | Rotate left (absolute,X)
    ASL $F800,X          ; 1E 00 F8 | Arithmetic shift left (absolute,X)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($7A,X)          ; 01 7A | Logical OR with accumulator ((zero page,X))
    ORA $61C2,Y          ; 19 C2 61 | Logical OR with accumulator (absolute,Y)
    BMI $35              ; 30 35 | Branch if negative
    STZ $C001            ; 9C 01 C0 | Store zero to absolute
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ADC $D99F,Y          ; 79 9F D9 | Add with carry (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    SBC $FD03,X          ; FD 03 FD | Subtract with carry (absolute,X)
    BVS $38              ; 70 38 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0F1
; Address: $E4B4C3
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0F1:
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    CPX #$1B             ; E0 1B | Compare X register (immediate)
    CPY $23              ; C4 23 | Compare Y register (zero page)
    SBC $EB02,Y          ; F9 02 EB | Subtract with carry (absolute,Y)
    BPL $F7              ; 10 F7 | Branch if positive
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    PLX                  ; FA | Pull X register from stack
    INX                  ; E8 | Increment X register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0F2
; Address: $E4B4E5
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0F2:
    ADC ($42,X)          ; 61 42 | Hardware register operation
    LDA ($AD,X)          ; A1 AD | Load from (zero page,X) into accumulator
    STA ($91,X)          ; 81 91 | Store accumulator to (zero page,X)
    LSR $527F            ; 4E 7F 52 | Logical shift right (absolute)
    LSR $BFFE,X          ; 5E FE BF | Logical shift right (absolute,X)
    INC $FEBF,X          ; FE BF FE | Increment (absolute,X)
    ROR $72FF,X          ; 7E FF 72 | Rotate right (absolute,X)
    ROR $00FF            ; 6E FF 00 | Rotate right (absolute)
    AND ($7E,X)          ; 21 7E | Logical AND with accumulator ((zero page,X))
    BNE $01              ; D0 01 | Branch if not equal
    INC                  ; 1A | Increment accumulator
    ORA $2102,Y          ; 19 02 21 | PPU graphics register access
    BVS $35              ; 70 35 | Branch if overflow set
    CPY #$84             ; C0 84 | Compare Y register (immediate)
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    SBC #$37             ; E9 37 | Subtract with carry (immediate)
    SBC $D93F,Y          ; F9 3F D9 | Subtract with carry (absolute,Y)
    SEI                  ; 78 | Set interrupt disable flag
    LDA                  ; BF FB 3C E2 | Load from absolute long,X into accumulator
    AND $25DB,X          ; 3D DB 25 | Logical AND with accumulator (absolute,X)
    BVS $38              ; 70 38 | Branch if overflow set
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    DEC $24              ; C6 24 | Decrement (zero page)
    ORA ($F8,X)          ; 01 F8 | Logical OR with accumulator ((zero page,X))
    BPL $F7              ; 10 F7 | Branch if positive
    ASL $17F5            ; 0E F5 17 | Arithmetic shift left (absolute)
    XBA                  ; EB | Exchange accumulator bytes
    DEC $E7BE,X          ; DE BE E7 | Decrement (absolute,X)
    CPX $D9B5            ; EC B5 D9 | Compare X register (absolute)
    CMP $9DF6,Y          ; D9 F6 9D | Compare accumulator (absolute,Y)
    LDX #$35             ; A2 35 | Load immediate value into X register
    CPY #$A1             ; C0 A1 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    CPX #$13             ; E0 13 | Compare X register (immediate)
    CPX #$66             ; E0 66 | Compare X register (immediate)
    BRA $18              ; 80 18 | Branch always
    CPX #$2D             ; E0 2D | Compare X register (immediate)
    BNE $7F              ; D0 7F | Branch if not equal
    BRA $FF              ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0F3
; Address: $E4B562
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0F3:
    ADC #$37             ; 69 37 | Add with carry (immediate)
    SBC $9C              ; E5 9C | Subtract with carry (zero page)
    STA $5B93,X          ; 9D 93 5B | Store accumulator to absolute,X
    ASL $BA              ; 06 BA | Arithmetic shift left (zero page)
    BVS $6C              ; 70 6C | Branch if overflow set
    LDY $98DB,X          ; BC DB 98 | Load from absolute,X into Y register
    INY                  ; C8 | Increment Y register
    BVS $0F              ; 70 0F | Branch if overflow set
    JMP ($E803)          ; 6C 03 E8 | Jump to address (absolute indirect)
    SBC $9F06,Y          ; F9 06 9F | Subtract with carry (absolute,Y)
    REP #$16             ; C2 16 | Reset processor status bits
    STA ($40,X)          ; 81 40 | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0F4
; Address: $E4B586
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0F4:
    JSR $0022            ; 20 22 00 | Jump to subroutine
    LSR $86              ; 46 86 | Logical shift right (zero page)
    ROL $9C1C,X          ; 3E 1C 9C | Rotate left (absolute,X)
    CPY $C933            ; CC 33 C9 | Compare Y register (absolute)
    INC $CDB3,X          ; FE B3 CD | Increment (absolute,X)
    LDX $FD7F,Y          ; BE 7F FD | Load from absolute,Y into X register
    INC $7FB9,X          ; FE B9 7F | Increment (absolute,X)
    EOR ($FF,X)          ; 41 FF | Exclusive OR with accumulator ((zero page,X))
    LDX $FF00,Y          ; BE 00 FF | Load from absolute,Y into X register
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    ADC ($09),Y          ; 71 09 | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0F5
; Address: $E4B5A8
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0F5:
    JSR $0058            ; 20 58 00 | Jump to subroutine
    AND $D0              ; 25 D0 | Logical AND with accumulator (zero page)
    CLV                  ; B8 | Clear overflow flag
    LDA $337F,Y          ; B9 7F 33 | Load from absolute,Y into accumulator
    INC $FF03,X          ; FE 03 FF | Increment (absolute,X)
    STY $7B              ; 84 7B | Store Y register to zero page
    SBC $FFD7,X          ; FD D7 FF | Subtract with carry (absolute,X)
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    STA ($9C,X)          ; 81 9C | Store accumulator to (zero page,X)
    ORA $0518            ; 0D 18 05 | Logical OR with accumulator (absolute)
    TYA                  ; 98 | Transfer Y register to accumulator
    ROL $5910            ; 2E 10 59 | Rotate left (absolute)
    STA $D1              ; 85 D1 | Store accumulator to zero page
    ORA $F55A            ; 0D 5A F5 | Logical OR with accumulator (absolute)
    LDX $D9              ; A6 D9 | Load from zero page into X register
    CMP $D9FF,X          ; DD FF D9 | Compare accumulator (absolute,X)
    EOR $10FF,Y          ; 59 FF 10 | Exclusive OR with accumulator (absolute,Y)
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0F6
; Address: $E4B5E0
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0F6:
    JSR $0227            ; 20 27 02 | Jump to subroutine
    AND $330C,X          ; 3D 0C 33 | Logical AND with accumulator (absolute,X)
    BIT $2672            ; 2C 72 26 | Test bits in accumulator (absolute)
    LDX $407F            ; AE 7F 40 | Load from absolute address into X register
    ROR $A322,X          ; 7E 22 A3 | Rotate right (absolute,X)
    ASL $3F              ; 06 3F | Arithmetic shift left (zero page)
    BPL $3F              ; 10 3F | Branch if positive

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0F7
; Address: $E4B5F6
; Size: 118 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0F7:
    JSR $707F            ; 20 7F 70 | Jump to subroutine
    INC $FEC1,X          ; FE C1 FE | Increment (absolute,X)
    ROR $32FF,X          ; 7E FF 32 | Rotate right (absolute,X)
    ASL $0709            ; 0E 09 07 | Arithmetic shift left (absolute)
    ASL $0D              ; 06 0D | Arithmetic shift left (zero page)
    ORA $0407,Y          ; 19 07 04 | Logical OR with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    ORA ($3C,X)          ; 01 3C | Logical OR with accumulator ((zero page,X))
    ASL $0601            ; 0E 01 06 | Arithmetic shift left (absolute)
    ASL $0601            ; 0E 01 06 | Arithmetic shift left (absolute)
    ASL $0601,X          ; 1E 01 06 | Arithmetic shift left (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    CPX $18              ; E4 18 | Compare X register (zero page)
    XBA                  ; EB | Exchange accumulator bytes
    SBC ($09),Y          ; F1 09 | Subtract with carry ((zero page),Y)
    CPX #$18             ; E0 18 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    AND $90              ; 25 90 | Logical AND with accumulator (zero page)
    SED                  ; F8 | Set decimal mode flag
    CMP $D33F,Y          ; D9 3F D3 | Compare accumulator (absolute,Y)
    ROL $3FC3,X          ; 3E C3 3F | Rotate left (absolute,X)
    LDA $7F97,X          ; BD 97 7F | Load from absolute,X into accumulator
    BIT $07              ; 24 07 | Test bits in accumulator (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator
    CLC                  ; 18 | Clear carry flag
    ASL $98              ; 06 98 | Arithmetic shift left (zero page)
    BPL $5A              ; 10 5A | Branch if positive
    STY $D3              ; 84 D3 | Store Y register to zero page
    PEA #$DCA3           ; F4 A3 DC | Push effective address to stack
    PHY                  ; 5A | Push Y register to stack
    SBC $FC13,X          ; FD 13 FC | Subtract with carry (absolute,X)
    SBC $FC03,X          ; FD 03 FC | Subtract with carry (absolute,X)
    CMP $F5FF,X          ; DD FF F5 | Compare accumulator (absolute,X)
    LDY $77FF,X          ; BC FF 77 | Load from absolute,X into Y register
    LDY $FFFF,X          ; BC FF FF | Load from absolute,X into Y register
    BIT #$77             ; 89 77 | Test bits in accumulator (immediate)
    CMP $0037,Y          ; D9 37 00 | Compare accumulator (absolute,Y)
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA $210A,Y          ; 19 0A 21 | PPU graphics register access
    ORA $0058,Y          ; 19 58 00 | Logical OR with accumulator (absolute,Y)
    SBC ($04,X)          ; E1 04 | Subtract with carry ((zero page,X))
    BCC $FC              ; 90 FC | Branch if carry clear
    ADC ($E0,X)          ; 61 E0 | Game work RAM access
    SBC ($CF),Y          ; F1 CF | Subtract with carry ((zero page),Y)
    SBC $D9FF,Y          ; F9 FF D9 | Subtract with carry (absolute,Y)
    LDY $1CFB,X          ; BC FB 1C | Load from absolute,X into Y register
    SBC $F51F,X          ; FD 1F F5 | Subtract with carry (absolute,X)
    JMP ($6C83)          ; 6C 83 6C | Jump to address (absolute indirect)
    BRA $40              ; 80 40 | Branch always
    BIT $2A38            ; 2C 38 2A | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0F8
; Address: $E4B6AC
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0F8:
    BMI $32              ; 30 32 | Branch if negative
    ROR $EF14            ; 6E 14 EF | Rotate right (absolute)
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    ORA $BEFA,X          ; 1D FA BE | Logical OR with accumulator (absolute,X)
    LDY $7D6F,X          ; BC 6F 7D | Load from absolute,X into Y register
    INC $7F91,X          ; FE 91 7F | Increment (absolute,X)
    CPY #$7C             ; C0 7C | Compare Y register (immediate)
    LDY $9110,X          ; BC 10 91 | Load from absolute,X into Y register
    REP #$17             ; C2 17 | Reset processor status bits
    REP #$16             ; C2 16 | Reset processor status bits
    STA ($40,X)          ; 81 40 | Store accumulator to (zero page,X)
    CLC                  ; 18 | Clear carry flag
    ROL $3EFF,X          ; 3E FF 3E | Rotate left (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0F9
; Address: $E4B6D7
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0F9:
    LDA                  ; BF E8 FF C9 | Load from absolute long,X into accumulator
    INC $CDBB,X          ; FE BB CD | Increment (absolute,X)
    LDY $0077,X          ; BC 77 00 | Load from absolute,X into Y register
    STA $9310            ; 8D 10 93 | Store accumulator to absolute address
    AND ($63,X)          ; 21 63 | Logical AND with accumulator ((zero page,X))
    ORA ($6F,X)          ; 01 6F | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    LDY $8041,X          ; BC 41 80 | Load from absolute,X into Y register
    ORA $113F,Y          ; 19 3F 11 | Logical OR with accumulator (absolute,Y)
    LDA                  ; BF 0C F3 0D | Load from absolute long,X into accumulator
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    BIT $16              ; 24 16 | Test bits in accumulator (zero page)
    ORA $3205,Y          ; 19 05 32 | Logical OR with accumulator (absolute,Y)
    ASL $0E00            ; 0E 00 0E | Arithmetic shift left (absolute)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ORA #$30             ; 09 30 | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    ORA ($3C,X)          ; 01 3C | Logical OR with accumulator ((zero page,X))
    BIT $6C03            ; 2C 03 6C | Test bits in accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    SEC                  ; 38 | Set carry flag
    ROL                  ; 2A | Rotate left (accumulator)
    BPL $12              ; 10 12 | Branch if positive
    ROL $AF74            ; 2E 74 AF | Rotate left (absolute)
    BCC $6F              ; 90 6F | Branch if carry clear
    BVC $AF              ; 50 AF | Branch if overflow clear
    SBC $BE3A,X          ; FD 3A BE | Subtract with carry (absolute,X)
    LDA $D17EBD          ; AF BD 7E D1 | Load from absolute long address into accumulator
    CPY #$7C             ; C0 7C | Compare Y register (immediate)
    CLV                  ; B8 | Clear overflow flag
    BCC $00              ; 90 00 | Branch if carry clear
    CLC                  ; 18 | Clear carry flag
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    CPY $14              ; C4 14 | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0FA
; Address: $E4B74C
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0FA:
    BRA $40              ; 80 40 | Branch always
    CLC                  ; 18 | Clear carry flag
    ROL $DD              ; 26 DD | Rotate left (zero page)
    AND $3AFE,Y          ; 39 FE 3A | Logical AND with accumulator (absolute,Y)
    SBC $BE65,X          ; FD 65 BE | Subtract with carry (absolute,X)
    SBC $CEFE            ; ED FE CE | Subtract with carry (absolute)
    SBC $CEBD,X          ; FD BD CE | Subtract with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SBC ($FE,X)          ; E1 FE | Subtract with carry ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    INC $80F1            ; EE F1 80 | Increment (absolute)
    DEC $FF              ; C6 FF | Decrement (zero page)
    SBC $C7FE,Y          ; F9 FE C7 | Subtract with carry (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    ROR $3081,X          ; 7E 81 30 | Rotate right (absolute,X)
    CMP $38              ; C5 38 | Compare accumulator (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0FB
; Address: $E4B7A9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0FB:
    JSR $5F1F            ; 20 1F 5F | Jump to subroutine
    BMI $34              ; 30 34 | Branch if negative
    SBC ($6F,X)          ; E1 6F | Subtract with carry ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0FC
; Address: $E4B7BE
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0FC:
    STZ $2871,X          ; 9E 71 28 | Store zero to absolute,X
    ROR $790D,X          ; 7E 0D 79 | Rotate right (absolute,X)
    CLV                  ; B8 | Clear overflow flag
    BRA $5F              ; 80 5F | Branch always

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0FD
; Address: $E4B7CD
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0FD:
    JSR $741B            ; 20 1B 74 | Jump to subroutine
    PHX                  ; DA | Push X register to stack
    SBC $FDC3,X          ; FD C3 FD | Subtract with carry (absolute,X)
    INC $FF83,X          ; FE 83 FF | Increment (absolute,X)
    SBC $FF84,X          ; FD 84 FF | Subtract with carry (absolute,X)
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    STA ($9C,X)          ; 81 9C | Store accumulator to (zero page,X)
    ORA $0518            ; 0D 18 05 | Logical OR with accumulator (absolute)
    TYA                  ; 98 | Transfer Y register to accumulator
    ROL $5910            ; 2E 10 59 | Rotate left (absolute)
    STA $51              ; 85 51 | Store accumulator to zero page
    CMP $F55A            ; CD 5A F5 | Compare accumulator (absolute)
    LDX $D9              ; A6 D9 | Load from zero page into X register
    CMP $D9FF,X          ; DD FF D9 | Compare accumulator (absolute,X)
    EOR $90FF,Y          ; 59 FF 90 | Exclusive OR with accumulator (absolute,Y)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ROR $3F              ; 66 3F | Rotate right (zero page)
    CLC                  ; 18 | Clear carry flag
    BIT #$76             ; 89 76 | Test bits in accumulator (immediate)
    CLI                  ; 58 | Clear interrupt disable flag
    BRA $FF              ; 80 FF | Branch always
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0FE
; Address: $E4B820
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0FE:
    ORA ($77,X)          ; 01 77 | Logical OR with accumulator ((zero page,X))
    STA ($30,X)          ; 81 30 | Store accumulator to (zero page,X)
    BPL $14              ; 10 14 | Branch if positive
    LSR $86              ; 46 86 | Logical shift right (zero page)
    ROL $BE9C,X          ; 3E 9C BE | Rotate left (absolute,X)
    STZ $735D            ; 9C 5D 73 | Store zero to absolute
    DEY                  ; 88 | Decrement Y register
    LDA ($7E),Y          ; B1 7E | Load from (zero page),Y into accumulator
    LDA $417F,Y          ; B9 7F 41 | Load from absolute,Y into accumulator
    EOR ($BF,X)          ; 41 BF | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank48_DmaFunction_0FF
; Address: $E4B83C
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_0FF:
    JSL $FF00FF          ; 22 FF 00 FF | Jump to subroutine long
    ORA ($44,X)          ; 01 44 | Logical OR with accumulator ((zero page,X))
    LDA $7906,Y          ; B9 06 79 | Load from absolute,Y into accumulator
    LDA $6FBF,X          ; BD BF 6F | Load from absolute,X into accumulator
    INC $B485            ; EE 85 B4 | Increment (absolute)
    STY $BF              ; 84 BF | Store Y register to zero page
    SBC $7F00,X          ; FD 00 7F | Subtract with carry (absolute,X)
    RTI                  ; 40 | Return from interrupt
    SEI                  ; 78 | Set interrupt disable flag
    LSR                  ; 4A | Logical shift right (accumulator)
    SBC $FF40,X          ; FD 40 FF | Subtract with carry (absolute,X)
    ROL $3F              ; 26 3F | Rotate left (zero page)
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    ORA #$16             ; 09 16 | Logical OR with accumulator (immediate)
    PHA                  ; 48 | Push accumulator to stack
    LDA                  ; BF BD 0F 0F | Load from absolute long,X into accumulator
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    XBA                  ; EB | Exchange accumulator bytes
    SBC ($1F,X)          ; E1 1F | Subtract with carry ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 00 FF 04 | Load from absolute long,X into accumulator
    DEY                  ; 88 | Decrement Y register
    BMI $17              ; 30 17 | Branch if negative
    BRA $38              ; 80 38 | Branch always
    LDA $509D,X          ; BD 9D 50 | Load from absolute,X into accumulator
    BVS $FF              ; 70 FF | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 22 FD 00 | Load from absolute long,X into accumulator
    ADC $3686,Y          ; 79 86 36 | Add with carry (absolute,Y)
    CMP #$C5             ; C9 C5 | Compare accumulator (immediate)
    SED                  ; F8 | Set decimal mode flag
    ASL $35E1,X          ; 1E E1 35 | Arithmetic shift left (absolute,X)
    REP #$19             ; C2 19 | Reset processor status bits
    CPX #$22             ; E0 22 | Compare X register (immediate)
    REP #$6B             ; C2 6B | Reset processor status bits
    DEY                  ; 88 | Decrement Y register
    SBC $F708,X          ; FD 08 F7 | Subtract with carry (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank48_DmaFunction_100
; Address: $E4B8C5
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_100:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CMP ($5F,X)          ; C1 5F | Compare accumulator ((zero page,X))
    CMP ($1D,X)          ; C1 1D | Compare accumulator ((zero page,X))
    BRA $5D              ; 80 5D | Branch always
    LSR $5C9D,X          ; 5E 9D 5C | Logical shift right (absolute,X)
    CMP ($1C,X)          ; C1 1C | Compare accumulator ((zero page,X))
    CMP ($1C,X)          ; C1 1C | Compare accumulator ((zero page,X))
    BRA $5D              ; 80 5D | Branch always
    LDX $BE61,Y          ; BE 61 BE | Load from absolute,Y into X register
    LDX $A063,Y          ; BE 63 A0 | Load from absolute,Y into X register
    LDX #$7F             ; A2 7F | Load immediate value into X register
    LDX $BE63,Y          ; BE 63 BE | Load from absolute,Y into X register
    LDX $3463,Y          ; BE 63 34 | Load from absolute,Y into X register
    ORA $272F            ; 0D 2F 27 | Logical OR with accumulator (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    ORA ($40,X)          ; 01 40 | Logical OR with accumulator ((zero page,X))
    ORA ($26,X)          ; 01 26 | Logical OR with accumulator ((zero page,X))
    INC $FE6E            ; EE 6E FE | Increment (absolute)
    BRA $FF              ; 80 FF | Branch always
    BNE $FF              ; D0 FF | Branch if not equal
    BRA $FF              ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank48_DmaFunction_101
; Address: $E4B916
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_101:
    JSR $FEFF            ; 20 FF FE | Jump to subroutine
    CLD                  ; D8 | Clear decimal mode flag
    BPL $FF              ; 10 FF | Branch if positive
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    CPY #$DC             ; C0 DC | Compare Y register (immediate)
    STZ $A1E0            ; 9C E0 A1 | Store zero to absolute
    LDY #$3F             ; A0 3F | Load immediate value into Y register
    REP #$17             ; C2 17 | Reset processor status bits
    LDA ($40,X)          ; A1 40 | Load from (zero page,X) into accumulator
    CLI                  ; 58 | Clear interrupt disable flag
    ROL $3EFF,X          ; 3E FF 3E | Rotate left (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_103
; Address: $E4B940
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_103:
    JSR $D7D8            ; 20 D8 D7 | Jump to subroutine
    AND $6A10            ; 2D 10 6A | Logical AND with accumulator (absolute)
    BIT $CB20            ; 2C 20 CB | Test bits in accumulator (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    PLP                  ; 28 | Pull processor status from stack
    SED                  ; F8 | Set decimal mode flag
    AND $0AFB            ; 2D FB 0A | Logical AND with accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    XBA                  ; EB | Exchange accumulator bytes

;------------------------------------------------------------------------------
; Bank48_DmaFunction_104
; Address: $E4B960
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_104:
    JSL $F3E31D          ; 22 1D E3 F3 | Jump to subroutine long
    CPY $FD              ; C4 FD | Compare Y register (zero page)
    DEC                  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank48_DmaFunction_105
; Address: $E4B968
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_105:
    INC                  ; 1A | Increment accumulator
    XBA                  ; EB | Exchange accumulator bytes
    ORA $F3FF,X          ; 1D FF F3 | Logical OR with accumulator (absolute,X)
    SBC $221B            ; ED 1B 22 | Subtract with carry (absolute)
    TYA                  ; 98 | Transfer Y register to accumulator
    BVS $7C              ; 70 7C | Branch if overflow set
    JMP ($8D63)          ; 6C 63 8D | Jump to address (absolute indirect)
    BCS $05              ; B0 05 | Branch if carry set
    ADC $E9E7            ; 6D E7 E9 | Add with carry (absolute)
    TYA                  ; 98 | Transfer Y register to accumulator
    BRA $7C              ; 80 7C | Branch always
    STA $A09F63          ; 8F 63 9F A0 | Store accumulator to absolute long address
    INC $9E61,X          ; FE 61 9E | Increment (absolute,X)
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    CMP $3F3B,X          ; DD 3B 3F | Compare accumulator (absolute,X)
    BPL $B9              ; 10 B9 | Branch if positive
    STY $32              ; 84 32 | Store Y register to zero page
    SBC $DD90,Y          ; F9 90 DD | Subtract with carry (absolute,Y)
    CPY $B9              ; C4 B9 | Compare Y register (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    BRA $7F              ; 80 7F | Branch always
    BCC $FF              ; 90 FF | Branch if carry clear
    LDA ($F7),Y          ; B1 F7 | Load from (zero page),Y into accumulator
    ADC $F9              ; 65 F9 | Add with carry (zero page)
    LDA $E35B0D          ; AF 0D 5B E3 | Load from absolute long address into accumulator
    INC $0500,X          ; FE 00 05 | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    BRA $3F              ; 80 3F | Branch always
    ROL $0000,X          ; 3E 00 00 | Rotate left (absolute,X)
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    LSR $5C9D,X          ; 5E 9D 5C | Logical shift right (absolute,X)
    CPY #$1D             ; C0 1D | Compare Y register (immediate)
    BRA $5D              ; 80 5D | Branch always
    BRA $5D              ; 80 5D | Branch always
    LSR $5C9D,X          ; 5E 9D 5C | Logical shift right (absolute,X)
    CPY #$1D             ; C0 1D | Compare Y register (immediate)
    LDY #$7F             ; A0 7F | Load immediate value into Y register
    LDX #$7F             ; A2 7F | Load immediate value into X register
    LDX $BE63,Y          ; BE 63 BE | Load from absolute,Y into X register
    LDX $A063,Y          ; BE 63 A0 | Load from absolute,Y into X register
    LDX #$7F             ; A2 7F | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank48_DmaFunction_106
; Address: $E4BA1E
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_106:
    LDX $3E63,Y          ; BE 63 3E | Load from absolute,Y into X register
    CPY #$02             ; C0 02 | Compare Y register (immediate)
    ORA #$EE             ; 09 EE | Logical OR with accumulator (immediate)
    BEQ $7F              ; F0 7F | Branch if equal
    TYA                  ; 98 | Transfer Y register to accumulator
    LDA $FFFF,X          ; BD FF FF | Load from absolute,X into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    ORA ($77,X)          ; 01 77 | Logical OR with accumulator ((zero page,X))
    BPL $95              ; 10 95 | Branch if positive
    ORA ($C7,X)          ; 01 C7 | Logical OR with accumulator ((zero page,X))
    STX $3F              ; 86 3F | Store X register to zero page
    STA $9EBF,X          ; 9D BF 9E | Store accumulator to absolute,X
    DEY                  ; 88 | Decrement Y register
    SEC                  ; 38 | Set carry flag
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 00 FF 00 | Load from absolute long,X into accumulator
    CPY #$58             ; C0 58 | Compare Y register (immediate)
    AND $6A10            ; 2D 10 6A | Logical AND with accumulator (absolute)
    CMP $58              ; C5 58 | Compare accumulator (zero page)
    LDA                  ; BF D7 38 C7 | Load from absolute long,X into accumulator
    SED                  ; F8 | Set decimal mode flag
    AND $0AFB            ; 2D FB 0A | Logical AND with accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    BPL $C5              ; 10 C5 | Branch if positive

;------------------------------------------------------------------------------
; Bank48_DmaFunction_107
; Address: $E4BA80
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_107:
    JSR $EF1C            ; 20 1C EF | Jump to subroutine
    INY                  ; C8 | Increment Y register
    SBC ($34),Y          ; F1 34 | Subtract with carry ((zero page),Y)
    DEC                  ; 3A | Decrement accumulator
    INC                  ; 1A | Increment accumulator
    XBA                  ; EB | Exchange accumulator bytes
    BPL $91              ; 10 91 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    SBC ($1F,X)          ; E1 1F | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank48_DmaFunction_108
; Address: $E4BA96
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_108:
    JSL $FF00DF          ; 22 DF 00 FF | Jump to subroutine long
    PHP                  ; 08 | Push processor status to stack
    STA ($EF),Y          ; 91 EF | Store accumulator to (zero page),Y
    AND $4AE0,X          ; 3D E0 4A | Logical AND with accumulator (absolute,X)
    CPX #$80             ; E0 80 | Compare X register (immediate)
    BCC $40              ; 90 40 | Branch if carry clear
    BNE $B0              ; D0 B0 | Branch if not equal
    BNE $90              ; D0 90 | Branch if not equal
    BCS $60              ; B0 60 | Branch if carry set
    LDY #$C0             ; A0 C0 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank48_DmaFunction_109
; Address: $E4BAB1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_109:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank48_DmaFunction_10A
; Address: $E4BAB9
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_10A:
    BVS $00              ; 70 00 | Branch if overflow set
    BVS $00              ; 70 00 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_10B
; Address: $E4BABF
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_10B:
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    DEC $AF10            ; CE 10 AF | Decrement (absolute)
    CLC                  ; 18 | Clear carry flag
    BRA $2C              ; 80 2C | Branch always
    PEA #$9B77           ; F4 77 9B | Push effective address to stack
    CLC                  ; 18 | Clear carry flag
    INC $FFDF            ; EE DF FF | Increment (absolute)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank48_DmaFunction_10C
; Address: $E4BADB
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_10C:
    SED                  ; F8 | Set decimal mode flag
    SBC $FC3F,Y          ; F9 3F FC | Subtract with carry (absolute,Y)
    SEC                  ; 38 | Set carry flag
    PLP                  ; 28 | Pull processor status from stack
    LDA                  ; BF 0F D9 DE | Load from absolute long,X into accumulator
    JMP $C00F            ; 4C 0F C0 | Jump to address
    BCS $CF              ; B0 CF | Branch if carry set
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    BNE $3F              ; D0 3F | Branch if not equal
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank48_DmaFunction_10D
; Address: $E4BB02
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_10D:
    JSR $4CA0            ; 20 A0 4C | Jump to subroutine
    CPY $FF7F            ; CC 7F FF | Compare Y register (absolute)
    RTI                  ; 40 | Return from interrupt
    LDY #$DF             ; A0 DF | Load immediate value into Y register
    LDA                  ; BF 73 8F C0 | Load from absolute long,X into accumulator
    LDA                  ; BF FF 80 7F | Load from absolute long,X into accumulator
    BRA $DC              ; 80 DC | Branch always
    LDA                  ; BF 04 88 DB | Load from absolute long,X into accumulator
    CPY $59              ; C4 59 | Compare Y register (zero page)
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    STZ $EC81,X          ; 9E 81 EC | Store zero to absolute,X
    DEY                  ; 88 | Decrement Y register
    CPY $3F              ; C4 3F | Compare Y register (zero page)
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    STA ($7F,X)          ; 81 7F | Store accumulator to (zero page,X)
    BVC $F0              ; 50 F0 | Branch if overflow clear
    DEC $F5F0,X          ; DE F0 F5 | Decrement (absolute,X)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_110
; Address: $E4BB78
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_110:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank48_DmaFunction_111
; Address: $E4BB8E
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_111:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    EOR $685F,X          ; 5D 5F 68 | Exclusive OR with accumulator (absolute,X)
    PLA                  ; 68 | Pull accumulator from stack
    RTI                  ; 40 | Return from interrupt
    INC $BEE0            ; EE E0 BE | Increment (absolute)
    LDX $81FF,Y          ; BE FF 81 | Load from absolute,Y into X register
    STA ($FB,X)          ; 81 FB | Store accumulator to (zero page,X)
    STA $DF              ; 85 DF | Store accumulator to zero page
    LDA ($E9,X)          ; A1 E9 | Load from (zero page,X) into accumulator
    CMP $BB              ; C5 BB | Compare accumulator (zero page)
    STA ($7F),Y          ; 91 7F | Store accumulator to (zero page),Y
    PLY                  ; 7A | Pull Y register from stack
    CLC                  ; 18 | Clear carry flag
    STZ $97              ; 64 97 | Store zero to zero page
    INC                  ; 1A | Increment accumulator
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    TYA                  ; 98 | Transfer Y register to accumulator
    REP #$07             ; C2 07 | Reset processor status bits
    STA                  ; 9F DB 7F F7 | Store accumulator to absolute long,X
    SEI                  ; 78 | Set interrupt disable flag
    INC $FFFD,X          ; FE FD FF | Increment (absolute,X)
    INC $FC03,X          ; FE 03 FC | Increment (absolute,X)
    BPL $18              ; 10 18 | Branch if positive

;------------------------------------------------------------------------------
; Bank48_DmaFunction_112
; Address: $E4BBE3
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_112:
    JSR $2B50            ; 20 50 2B | Jump to subroutine
    CPX #$5B             ; E0 5B | Compare X register (immediate)
    LDA #$32             ; A9 32 | Load immediate value into accumulator
    XBA                  ; EB | Exchange accumulator bytes
    BMI $B7              ; 30 B7 | Branch if negative
    CPY #$BF             ; C0 BF | Compare Y register (immediate)
    DEX                  ; CA | Decrement X register
    LDA                  ; BF C8 3F 20 | Load from absolute long,X into accumulator
    CLD                  ; D8 | Clear decimal mode flag
    AND $6A10            ; 2D 10 6A | Logical AND with accumulator (absolute)
    CPY #$DF             ; C0 DF | Compare Y register (immediate)
    SBC ($EF),Y          ; F1 EF | Subtract with carry ((zero page),Y)
    CPY $FFD8            ; CC D8 FF | Compare Y register (absolute)
    PLP                  ; 28 | Pull processor status from stack
    SED                  ; F8 | Set decimal mode flag
    AND $0AFB            ; 2D FB 0A | Logical AND with accumulator (absolute)
    ASL $DEED            ; 0E ED DE | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_113
; Address: $E4BC20
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_113:
    JSL $F3E31D          ; 22 1D E3 F3 | Jump to subroutine long
    CPY $FD              ; C4 FD | Compare Y register (zero page)
    DEC                  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank48_DmaFunction_114
; Address: $E4BC29
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_114:
    ORA $936B,X          ; 1D 6B 93 | Logical OR with accumulator (absolute,X)
    DEC $BE              ; C6 BE | Decrement (zero page)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    ORA $F3FF,X          ; 1D FF F3 | Logical OR with accumulator (absolute,X)
    SBC $221B            ; ED 1B 22 | Subtract with carry (absolute)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    INC $FF39,X          ; FE 39 FF | Increment (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BMI $38              ; 30 38 | Branch if negative
    BEQ $C8              ; F0 C8 | Branch if equal
    INY                  ; C8 | Increment Y register
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    ORA $0099,X          ; 1D 99 00 | Logical OR with accumulator (absolute,X)
    ORA $00E6,Y          ; 19 E6 00 | Logical OR with accumulator (absolute,Y)
    BRA $70              ; 80 70 | Branch always
    BEQ $DC              ; F0 DC | Branch if equal
    CLC                  ; 18 | Clear carry flag
    INC                  ; 1A | Increment accumulator
    PLX                  ; FA | Pull X register from stack
    AND $0000,Y          ; 39 00 00 | Logical AND with accumulator (absolute,Y)
    BEQ $C0              ; F0 C0 | Branch if equal
    CLC                  ; 18 | Clear carry flag
    INC $38              ; E6 38 | Increment (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    INC $FCC6,X          ; FE C6 FC | Increment (absolute,X)
    STY $BC              ; 84 BC | Store Y register to zero page
    LDY $1E              ; A4 1E | Load from zero page into Y register
    SBC $BDC1,X          ; FD C1 BD | Subtract with carry (absolute,X)
    STA ($FC,X)          ; 81 FC | Store accumulator to (zero page,X)
    BRA $7C              ; 80 7C | Branch always
    CPX $FE              ; E4 FE | Compare X register (zero page)
    BRA $FE              ; 80 FE | Branch always
    STA ($7C,X)          ; 81 7C | Store accumulator to (zero page,X)
    BMI $B0              ; 30 B0 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank48_DmaFunction_115
; Address: $E4BCEE
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_115:
    BRA $00              ; 80 00 | Branch always
    BMI $FF              ; 30 FF | Branch if negative
    RTI                  ; 40 | Return from interrupt
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$80             ; E0 80 | Compare X register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $13              ; 80 13 | Branch always
    ROL $3B07            ; 2E 07 3B | Rotate left (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    EOR $0207,Y          ; 59 07 02 | Exclusive OR with accumulator (absolute,Y)
    BIT $D3              ; 24 D3 | Test bits in accumulator (zero page)
    ROL $BF              ; 26 BF | Rotate left (zero page)
    JMP ($7CBB)          ; 6C BB 7C | Jump to address (absolute indirect)
    SBC $FCD3,X          ; FD D3 FC | Subtract with carry (absolute,X)
    CMP ($60),Y          ; D1 60 | Compare accumulator ((zero page),Y)
    BNE $E0              ; D0 E0 | Game work RAM access
    SBC ($BC,X)          ; E1 BC | Subtract with carry ((zero page,X))
    SBC $D568,X          ; FD 68 D5 | Subtract with carry (absolute,X)
    TAY                  ; A8 | Transfer accumulator to Y register
    DEC $6970            ; CE 70 69 | Decrement (absolute)
    LDA ($3D,X)          ; A1 3D | Load from (zero page,X) into accumulator
    DEX                  ; CA | Decrement X register
    DEC $39              ; C6 39 | Decrement (zero page)
    CMP $C93F            ; CD 3F C9 | Compare accumulator (absolute)
    CMP #$3F             ; C9 3F | Compare accumulator (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    EOR ($BF,X)          ; 41 BF | Exclusive OR with accumulator ((zero page,X))
    STA ($7F,X)          ; 81 7F | Store accumulator to (zero page,X)
    CPY #$07             ; C0 07 | Compare Y register (immediate)
    SBC $95FF,X          ; FD FF 95 | Subtract with carry (absolute,X)
    LDA                  ; BF FF 3F FF | Load from absolute long,X into accumulator
    ORA #$67             ; 09 67 | Logical OR with accumulator (immediate)
    CPX $1DFF            ; EC FF 1D | Compare X register (absolute)
    SBC $FFFF,X          ; FD FF FF | Subtract with carry (absolute,X)
    BCC $FF              ; 90 FF | Branch if carry clear
    CLC                  ; 18 | Clear carry flag
    BMI $70              ; 30 70 | Branch if negative
    EOR $C5              ; 45 C5 | Exclusive OR with accumulator (zero page)
    DEY                  ; 88 | Decrement Y register
    ORA $9D99            ; 0D 99 9D | Logical OR with accumulator (absolute)
    STA $9D89,X          ; 9D 89 9D | Store accumulator to absolute,X
    STA $389D,X          ; 9D 9D 38 | Store accumulator to absolute,X
    INC                  ; 1A | Increment accumulator
    INX                  ; E8 | Increment X register
    EOR $5466,Y          ; 59 66 54 | Exclusive OR with accumulator (absolute,Y)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank48_DmaFunction_117
; Address: $E4BD9E
; Size: 114 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_117:
    EOR $E062,X          ; 5D 62 E0 | Game work RAM access
    CPX $0E0C            ; EC 0C 0E | Compare X register (absolute)
    BIT #$D8             ; 89 D8 | Test bits in accumulator (immediate)
    EOR #$D9             ; 49 D9 | Exclusive OR with accumulator (immediate)
    CMP ($41),Y          ; D1 41 | Compare accumulator ((zero page),Y)
    PHX                  ; DA | Push X register to stack
    INC $1C              ; E6 1C | Increment (zero page)
    CPX #$55             ; E0 55 | Compare X register (immediate)
    TAY                  ; A8 | Transfer accumulator to Y register
    PHB                  ; 8B | Push data bank register to stack
    LSR                  ; 4A | Logical shift right (accumulator)
    JMP ($A441)          ; 6C 41 A4 | Jump to address (absolute indirect)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    LSR $46              ; 46 46 | Logical shift right (zero page)
    SEP #$A2             ; E2 A2 | Set processor status bits
    INC $7EC0,X          ; FE C0 7E | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    STA $64BEC0          ; 8F C0 BE 64 | Store accumulator to absolute long address
    LDX $BC7F,Y          ; BE 7F BC | Load from absolute,Y into X register
    INC $7F83,X          ; FE 83 7F | Increment (absolute,X)
    STA ($0B,X)          ; 81 0B | Store accumulator to (zero page,X)
    INC $EF82            ; EE 82 EF | Increment (absolute)
    RTI                  ; 40 | Return from interrupt
    DEC                  ; 3A | Decrement accumulator
    PLP                  ; 28 | Pull processor status from stack
    AND $332C,X          ; 3D 2C 33 | Logical AND with accumulator (absolute,X)
    AND ($02),Y          ; 31 02 | Logical AND with accumulator ((zero page),Y)
    ROR $EC17            ; 6E 17 EC | Rotate right (absolute)
    SBC $FC83,X          ; FD 83 FC | Subtract with carry (absolute,X)
    LDX $BF6D,Y          ; BE 6D BF | Load from absolute,Y into X register
    JMP ($FD7F)          ; 6C 7F FD | Jump to address (absolute indirect)
    ROR $2050,X          ; 7E 50 20 | Rotate right (absolute,X)
    BVC $31              ; 50 31 | Branch if overflow clear
    CPX #$BF             ; E0 BF | Compare X register (immediate)
    LDA                  ; BF C2 76 81 | Load from absolute long,X into accumulator
    BCC $48              ; 90 48 | Branch if carry clear
    LSR                  ; 4A | Logical shift right (accumulator)
    STZ $5E7F,X          ; 9E 7F 5E | Store zero to absolute,X
    LDA                  ; BF C0 BF C0 | Load from absolute long,X into accumulator
    LDA                  ; BF C9 7E AB | Load from absolute long,X into accumulator
    SBC $77CC,X          ; FD CC 77 | Subtract with carry (absolute,X)
    ASL $10E1            ; 0E E1 10 | Arithmetic shift left (absolute)
    PHB                  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank48_DmaFunction_118
; Address: $E4BE60
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_118:
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    TYA                  ; 98 | Transfer Y register to accumulator
    BPL $E3              ; 10 E3 | Branch if positive
    PHB                  ; 8B | Push data bank register to stack
    INX                  ; E8 | Increment X register
    BPL $C8              ; 10 C8 | Branch if positive
    ROR                  ; 6A | Rotate right (accumulator)
    REP #$7F             ; C2 7F | Reset processor status bits
    STY $00              ; 84 00 | Store Y register to zero page
    INX                  ; E8 | Increment X register
    XBA                  ; EB | Exchange accumulator bytes
    TXS                  ; 9A | Transfer X register to stack pointer
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($45,X)          ; 01 45 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SBC $F9FC,X          ; FD FC F9 | Subtract with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    STA $64              ; 85 64 | Store accumulator to zero page
    ROL $FC              ; 26 FC | Rotate left (zero page)
    SED                  ; F8 | Set decimal mode flag
    SBC $1CC5,Y          ; F9 C5 1C | Subtract with carry (absolute,Y)
    LDY $007E,X          ; BC 7E 00 | Load from absolute,X into Y register
    RTI                  ; 40 | Return from interrupt
    REP #$40             ; C2 40 | Reset processor status bits
    PLX                  ; FA | Pull X register from stack
    WDM #$C7             ; 42 C7 | Reserved instruction
    LDX $FE              ; A6 FE | Load from zero page into X register
    SEC                  ; 38 | Set carry flag
    SBC $FF41,X          ; FD 41 FF | Subtract with carry (absolute,X)
    SBC $7D82,X          ; FD 82 7D | Subtract with carry (absolute,X)
    INC $FE45,X          ; FE 45 FE | Increment (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    STA ($9C,X)          ; 81 9C | Store accumulator to (zero page,X)
    ORA $18              ; 05 18 | Logical OR with accumulator (zero page)
    BIT $5910            ; 2C 10 59 | Test bits in accumulator (absolute)
    STA $80              ; 85 80 | Store accumulator to zero page
    RTI                  ; 40 | Return from interrupt
    LDY $1E00,X          ; BC 00 1E | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank48_DmaFunction_119
; Address: $E4BED0
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_119:
    JSL $FFDDDD          ; 22 DD DD FF | Jump to subroutine long
    CMP $12FF,Y          ; D9 FF 12 | Compare accumulator (absolute,Y)
    SBC $FF81,X          ; FD 81 FF | Subtract with carry (absolute,X)
    ROL $61FF,X          ; 3E FF 61 | Rotate left (absolute,X)
    LDX $B8FE,Y          ; BE FE B8 | Load from absolute,Y into X register
    INC $E4              ; E6 E4 | Increment (zero page)
    DEC $DFCC            ; CE CC DF | Decrement (absolute)
    CMP $BFBF,X          ; DD BF BF | Compare accumulator (absolute,X)
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    LDX $81BE,Y          ; BE BE 81 | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank48_DmaFunction_11A
; Address: $E4BEEF
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_11A:
    STA ($7F,X)          ; 81 7F | Store accumulator to (zero page,X)
    LDA $FD7F,Y          ; B9 7F FD | Load from absolute,Y into accumulator
    SBC $FD7E,X          ; FD 7E FD | Subtract with carry (absolute,X)
    ROR $3EFF,X          ; 7E FF 3E | Rotate right (absolute,X)
    ROR $64FF,X          ; 7E FF 64 | Rotate right (absolute,X)
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    LDY $5F              ; A4 5F | Load from zero page into Y register
    STX $5A72            ; 8E 72 5A | Store X register to absolute address
    LDA $F2BE,Y          ; B9 BE F2 | Load from absolute,Y into accumulator
    SBC ($83),Y          ; F1 83 | Subtract with carry ((zero page),Y)
    SBC $E55B,X          ; FD 5B E5 | Subtract with carry (absolute,X)
    CPX $47              ; E4 47 | Compare X register (zero page)
    SBC ($77,X)          ; E1 77 | Subtract with carry ((zero page,X))
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    BEQ $54              ; F0 54 | Branch if equal

;------------------------------------------------------------------------------
; Bank48_DmaFunction_11B
; Address: $E4BF26
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_11B:
    JSR $66E6            ; 20 E6 66 | Jump to subroutine
    LSR $9E1C            ; 4E 1C 9E | Logical shift right (absolute)
    ORA $8F0F            ; 0D 0F 8F | Logical OR with accumulator (absolute)
    PHA                  ; 48 | Push accumulator to stack
    CMP ($BE),Y          ; D1 BE | Compare accumulator ((zero page),Y)
    SBC $F1FF,Y          ; F9 FF F1 | Subtract with carry (absolute,Y)
    ADC ($FF),Y          ; 71 FF | Add with carry ((zero page),Y)
    STA $FFEF70          ; 8F 70 EF FF | Store accumulator to absolute long address
    LDA $FFC6,Y          ; B9 C6 FF | Load from absolute,Y into accumulator
    LDA                  ; BF E4 BB EF | Load from absolute long,X into accumulator
    LDA                  ; BF E2 AE FF | Load from absolute long,X into accumulator
    SBC $00BB            ; ED BB 00 | Subtract with carry (absolute)
    CPY $44              ; C4 44 | Compare Y register (zero page)
    CMP $584D            ; CD 4D 58 | Compare accumulator (absolute)
    STA                  ; 9F 58 B8 A6 | Store accumulator to absolute long,X
    ROR $708F,X          ; 7E 8F 70 | Rotate right (absolute,X)
    PHA                  ; 48 | Push accumulator to stack
    CPX #$00             ; E0 00 | Compare X register (immediate)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    STA                  ; 9F 00 EC 00 | Store accumulator to absolute long,X
    CPX $F3              ; E4 F3 | Compare X register (zero page)
    SEP #$75             ; E2 75 | Set processor status bits
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_11C
; Address: $E4BF89
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_11C:
    SBC $CE              ; E5 CE | Subtract with carry (zero page)
    ORA $3E33            ; 0D 33 3E | Logical OR with accumulator (absolute)
    ASL $00EC            ; 0E EC 00 | Arithmetic shift left (absolute)
    INC                  ; 1A | Increment accumulator
    ORA $9F00,X          ; 1D 00 9F | Logical OR with accumulator (absolute,X)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    SBC $8000,Y          ; F9 00 80 | Subtract with carry (absolute,Y)
    WDM #$00             ; 42 00 | Reserved instruction
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    AND $7FFF,X          ; 3D FF 7F | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_11D
; Address: $E4BFB4
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_11D:
    REP #$7F             ; C2 7F | Reset processor status bits
    DEC $D763,X          ; DE 63 D7 | Decrement (absolute,X)
    ROR                  ; 6A | Rotate right (accumulator)
    LDX $3F              ; A6 3F | Load from zero page into X register
    BRA $00              ; 80 00 | Branch always
    BIT $03              ; 24 03 | Test bits in accumulator (zero page)
    ORA ($1B,X)          ; 01 1B | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    RTI                  ; 40 | Return from interrupt
    EOR ($03,X)          ; 41 03 | Exclusive OR with accumulator ((zero page,X))
    INC $FFFE,X          ; FE FE FF | Increment (absolute,X)
    CLD                  ; D8 | Clear decimal mode flag
    INC $05FC,X          ; FE FC 05 | Increment (absolute,X)
    CPX $9F              ; E4 9F | Compare X register (zero page)
    RTI                  ; 40 | Return from interrupt
    LDY $3D              ; A4 3D | Load from zero page into Y register
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDX $F8E0,Y          ; BE E0 F8 | Load from absolute,Y into X register
    ORA ($44,X)          ; 01 44 | Logical OR with accumulator ((zero page,X))
    LDA $F99F,Y          ; B9 9F F9 | Load from absolute,Y into accumulator
    STA ($84,X)          ; 81 84 | Store accumulator to (zero page,X)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    PLY                  ; 7A | Pull Y register from stack
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    CPY $A3EF            ; CC EF A3 | Compare Y register (absolute)
    LSR                  ; 4A | Logical shift right (accumulator)
    SED                  ; F8 | Set decimal mode flag
    TYA                  ; 98 | Transfer Y register to accumulator
    BVC $50              ; 50 50 | Branch if overflow clear
    LDY $0C00,X          ; BC 00 0C | Load from absolute,X into Y register
    JMP $00FC40          ; 5C 40 FC 00 | Jump to address long
    BPL $0C              ; 10 0C | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    CPX $380E            ; EC 0E 38 | Compare X register (absolute)
    CPY $F8C8            ; CC C8 F8 | Compare Y register (absolute)
    BPL $EE              ; 10 EE | Branch if positive
    SED                  ; F8 | Set decimal mode flag
    PLA                  ; 68 | Pull accumulator from stack
    INC $42              ; E6 42 | Hardware register operation
    STA $33              ; 85 33 | Store accumulator to zero page
    JMP $2013            ; 4C 13 20 | Jump to address
    AND #$28             ; 29 28 | Logical AND with accumulator (immediate)
    JMP $476F            ; 4C 6F 47 | Jump to address
    LDA                  ; BF 00 BD 00 | Load from absolute long,X into accumulator
    INC $7F00,X          ; FE 00 7F | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_11F
; Address: $E4C09F
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_11F:
    BVS $EA              ; 70 EA | Branch if overflow set
    CPY $A1              ; C4 A1 | Compare Y register (zero page)
    BNE $22              ; D0 22 | Branch if not equal
    INX                  ; E8 | Increment X register
    SED                  ; F8 | Set decimal mode flag
    CPY #$C4             ; C0 C4 | Compare Y register (immediate)
    SBC $FD00,X          ; FD 00 FD | Subtract with carry (absolute,X)
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    INC $3A06,X          ; FE 06 3A | Increment (absolute,X)
    ASL $0EF2            ; 0E F2 0E | Arithmetic shift left (absolute)
    BMI $10              ; 30 10 | Branch if negative
    BCS $A3              ; B0 A3 | Branch if carry set
    LDY $1B              ; A4 1B | Load from zero page into Y register
    PHP                  ; 08 | Push processor status to stack
    ORA $1966,X          ; 1D 66 19 | Logical OR with accumulator (absolute,X)
    ROR $3F              ; 66 3F | Rotate right (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_120
; Address: $E4C0D6
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_120:
    STZ $FF00            ; 9C 00 FF | Store zero to absolute
    LDA                  ; BF 00 BB 00 | Load from absolute long,X into accumulator
    CLC                  ; 18 | Clear carry flag
    PLX                  ; FA | Pull X register from stack
    SBC $E4              ; E5 E4 | Subtract with carry (zero page)
    LDA $3289,Y          ; B9 89 32 | Load from absolute,Y into accumulator
    CMP $9E63,Y          ; D9 63 9E | Compare accumulator (absolute,Y)
    STZ $FC              ; 64 FC | Store zero to zero page
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    LDY $BB00,X          ; BC 00 BB | Load from absolute,X into Y register
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    JMP $186F2B          ; 5C 2B 6F 18 | Jump to address long
    ADC $6C1A            ; 6D 1A 6C | Add with carry (absolute)
    PHP                  ; 08 | Push processor status to stack
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    JMP $C490            ; 4C 90 C4 | Jump to address
    CLC                  ; 18 | Clear carry flag
    TYA                  ; 98 | Transfer Y register to accumulator
    RTI                  ; 40 | Return from interrupt
    STZ $18C4            ; 9C C4 18 | Store zero to absolute
    CPY #$1C             ; C0 1C | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_121
; Address: $E4C130
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_121:
    JSR $20E0            ; 20 E0 20 | Jump to subroutine
    CPX #$22             ; E0 22 | Compare X register (immediate)
    INC $FE22,X          ; FE 22 FE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_123
; Address: $E4C13C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_123:
    JSL $FE22FE          ; 22 FE 22 FE | Jump to subroutine long
    BVS $5F              ; 70 5F | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    ASL $34B1            ; 0E B1 34 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_124
; Address: $E4C147
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_124:
    SEC                  ; 38 | Set carry flag
    SBC $F27D,X          ; FD 7D F2 | Subtract with carry (absolute,X)
    ADC $4872,X          ; 7D 72 48 | Add with carry (absolute,X)
    STY $BC43            ; 8C 43 BC | Store Y register to absolute address
    LDA ($FF,X)          ; A1 FF | Load from (zero page,X) into accumulator
    CPY $8FF1            ; CC F1 8F | Compare Y register (absolute)
    STX $8E73            ; 8E 73 8E | Store X register to absolute address
    LDA                  ; BF 00 00 00 | Load from absolute long,X into accumulator
    CLC                  ; 18 | Clear carry flag
    ROL                  ; 2A | Rotate left (accumulator)
    BVS $62              ; 70 62 | Branch if overflow set
    BIT $78              ; 24 78 | Test bits in accumulator (zero page)
    LSR $3C00,X          ; 5E 00 3C | Logical shift right (absolute,X)
    ROL $7F58,X          ; 3E 58 7F | Rotate left (absolute,X)
    BVS $7F              ; 70 7F | Branch if overflow set
    LDX #$BB             ; A2 BB | Load immediate value into X register
    DEC $4D71            ; CE 71 4D | Decrement (absolute)
    PHY                  ; 5A | Push Y register to stack
    INC $FE95,X          ; FE 95 FE | Increment (absolute,X)
    ORA ($E2,X)          ; 01 E2 | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF 44 FF 70 | Load from absolute long,X into accumulator
    BRA $FF              ; 80 FF | Branch always
    BPL $77              ; 10 77 | Branch if positive
    SBC $70C8            ; ED C8 70 | Subtract with carry (absolute)
    BIT $88              ; 24 88 | Test bits in accumulator (zero page)
    LSR $EE15            ; 4E 15 EE | Logical shift right (absolute)
    LSR                  ; 4A | Logical shift right (accumulator)
    DEY                  ; 88 | Decrement Y register
    ROL $10              ; 26 10 | Rotate left (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    BRA $7B              ; 80 7B | Branch always
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 00 FF 81 | Load from absolute long,X into accumulator
    INC $80              ; E6 80 | Increment (zero page)
    INC $40              ; E6 40 | Increment (zero page)
    ROR $BD              ; 66 BD | Rotate right (zero page)
    ASL $10              ; 06 10 | Arithmetic shift left (zero page)
    BEQ $90              ; F0 90 | Branch if equal
    CLI                  ; 58 | Clear interrupt disable flag
    ROL                  ; 2A | Rotate left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    PLA                  ; 68 | Pull accumulator from stack
    LDA $00EF00          ; AF 00 EF 00 | Load from absolute long address into accumulator
    ADC $00              ; 65 00 | Add with carry (zero page)
    STZ $00              ; 64 00 | Store zero to zero page
    ADC $EF              ; 65 EF | Add with carry (zero page)
    CMP $8932            ; CD 32 89 | Compare accumulator (absolute)
    BMI $BA              ; 30 BA | Branch if negative
    PLB                  ; AB | Pull data bank register from stack
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank48_DmaFunction_125
; Address: $E4C1FE
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_125:
    SBC $4C00,X          ; FD 00 4C | Subtract with carry (absolute,X)
    CLC                  ; 18 | Clear carry flag
    JMP ($4D1B)          ; 6C 1B 4D | Jump to address (absolute indirect)
    DEC                  ; 3A | Decrement accumulator
    ROR $6C19            ; 6E 19 6C | Rotate right (absolute)
    JMP $6F3B            ; 4C 3B 6F | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    STZ $9844            ; 9C 44 98 | Store zero to absolute
    CPY #$1C             ; C0 1C | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    STZ $1CC0            ; 9C C0 1C | Store zero to absolute
    CPY #$1C             ; C0 1C | Compare Y register (immediate)
    CPY $18              ; C4 18 | Compare Y register (zero page)
    RTI                  ; 40 | Return from interrupt
    STZ $FE22            ; 9C 22 FE | Store zero to absolute

;------------------------------------------------------------------------------
; Bank48_DmaFunction_129
; Address: $E4C23E
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_129:
    JSL $0066FE          ; 22 FE 66 00 | Jump to subroutine long
    ADC $73EC,X          ; 7D EC 73 | Add with carry (absolute,X)
    ROR                  ; 6A | Rotate right (accumulator)
    SBC ($91),Y          ; F1 91 | Subtract with carry ((zero page),Y)
    SBC ($AD,X)          ; E1 AD | Subtract with carry ((zero page,X))
    STA $D3ED,X          ; 9D ED D3 | Store accumulator to absolute,X
    LDA $FF00D3          ; AF D3 00 FF | Load from absolute long address into accumulator
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    STA $7EE084          ; 8F 84 E0 7E | Store accumulator to absolute long address
    EOR $BA              ; 45 BA | Exclusive OR with accumulator (zero page)
    JMP $4A7F            ; 4C 7F 4A | Jump to address
    LDX $E09F,Y          ; BE 9F E0 | Game work RAM access
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    STY $7B              ; 84 7B | Store Y register to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_12A
; Address: $E4C275
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_12A:
    STA                  ; 9F 00 FF 00 | Store accumulator to absolute long,X
    ORA $0A              ; 05 0A | Logical OR with accumulator (zero page)
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    ASL $0B              ; 06 0B | Arithmetic shift left (zero page)
    ORA #$02             ; 09 02 | Logical OR with accumulator (immediate)
    ORA #$18             ; 09 18 | Logical OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CPY $6D35            ; CC 35 6D | Compare Y register (absolute)
    STA                  ; 9F 76 06 CD | Store accumulator to absolute long,X
    STA                  ; 9F 00 06 00 | Store accumulator to absolute long,X
    LDA $E11D,Y          ; B9 1D E1 | Load from absolute,Y into accumulator
    SBC $73FB            ; ED FB 73 | Subtract with carry (absolute)
    ASL $0034,X          ; 1E 34 00 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_12B
; Address: $E4C2DD
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_12B:
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    PEA #$B440           ; F4 40 B4 | Push effective address to stack
    LDY $04              ; A4 04 | Load from zero page into Y register
    CPX #$44             ; E0 44 | Compare X register (immediate)
    CPY $BB77            ; CC 77 BB | Compare Y register (absolute)
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    INX                  ; E8 | Increment X register
    TAY                  ; A8 | Transfer accumulator to Y register
    ADC $FF00,X          ; 7D 00 FF | Add with carry (absolute,X)
    LSR $4544            ; 4E 44 45 | Logical shift right (absolute)
    EOR $04              ; 45 04 | Exclusive OR with accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    CMP $BB76            ; CD 76 BB | Compare accumulator (absolute)
    STY $8B00            ; 8C 00 8B | Store Y register to absolute address
    TXA                  ; 8A | Transfer X register to accumulator
    STA $BB00            ; 8D 00 BB | Store accumulator to absolute address
    ROR $4F09,X          ; 7E 09 4F | Rotate right (absolute,X)
    SEC                  ; 38 | Set carry flag
    JMP ($4F1B)          ; 6C 1B 4F | Jump to address (absolute indirect)
    SEC                  ; 38 | Set carry flag
    CPY #$1C             ; C0 1C | Compare Y register (immediate)
    CPY $18              ; C4 18 | Compare Y register (zero page)
    CPY #$1C             ; C0 1C | Compare Y register (immediate)
    CPY #$1C             ; C0 1C | Compare Y register (immediate)
    STY $D8              ; 84 D8 | Store Y register to zero page
    CPX #$FC             ; E0 FC | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_12E
; Address: $E4C358
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_12E:
    JSL $FE02FE          ; 22 FE 02 FE | Jump to subroutine long
    REP #$FE             ; C2 FE | Reset processor status bits
    REP #$FE             ; C2 FE | Reset processor status bits
    INC                  ; 1A | Increment accumulator
    BCS $3D              ; B0 3D | Branch if carry set
    WDM #$12             ; 42 12 | Reserved instruction
    AND $0000            ; 2D 00 00 | Logical AND with accumulator (absolute)
    ROL $6302,X          ; 3E 02 63 | Rotate left (absolute,X)
    ORA $B3FC,X          ; 1D FC B3 | Logical OR with accumulator (absolute,X)
    RTI                  ; 40 | Return from interrupt
    AND ($3F,X)          ; 21 3F | Logical AND with accumulator ((zero page,X))
    ROL $C5FE,X          ; 3E FE C5 | Rotate left (absolute,X)
    CPY #$98             ; C0 98 | Compare Y register (immediate)
    BRA $44              ; 80 44 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    INC $C000,X          ; FE 00 C0 | Increment (absolute,X)
    BRA $00              ; 80 00 | Branch always
    XBA                  ; EB | Exchange accumulator bytes
    CMP $01              ; C5 01 | Compare accumulator (zero page)
    ORA $0000            ; 0D 00 00 | Logical OR with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank48_DmaFunction_12F
; Address: $E4C3C2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_12F:
    ROL $533A            ; 2E 3A 53 | Rotate left (absolute)
    STZ $8C2B            ; 9C 2B 8C | Store zero to absolute
    AND $44              ; 25 44 | Logical AND with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank48_DmaFunction_130
; Address: $E4C3CD
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_130:
    JSR $0F00            ; 20 00 0F | Jump to subroutine
    AND $4520,X          ; 3D 20 45 | Logical AND with accumulator (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $1F              ; F0 1F | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BVC $00              ; 50 00 | Branch if overflow clear
    LSR                  ; 4A | Logical shift right (accumulator)
    ADC $F532,Y          ; 79 32 F5 | Add with carry (absolute,Y)
    DEC $D1              ; C6 D1 | Decrement (zero page)
    STY $3002            ; 8C 02 30 | Store Y register to absolute address
    BEQ $FC              ; F0 FC | Branch if equal
    SEP #$3E             ; E2 3E | Set processor status bits
    SED                  ; F8 | Set decimal mode flag
    CPX #$FE             ; E0 FE | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    ORA $25              ; 05 25 | Logical OR with accumulator (zero page)
    ORA $0400            ; 0D 00 04 | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    DEC                  ; 3A | Decrement accumulator
    ADC $5322            ; 6D 22 53 | Add with carry (absolute)
    LSR                  ; 4A | Logical shift right (accumulator)
    ADC $2D23            ; 6D 23 2D | Add with carry (absolute)
    BIT $3E              ; 24 3E | Test bits in accumulator (zero page)
    SBC $DF20            ; ED 20 DF | Subtract with carry (absolute)
    SBC $FD02,X          ; FD 02 FD | Subtract with carry (absolute,X)
    BIT $00D3            ; 2C D3 00 | Test bits in accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    WDM #$3C             ; 42 3C | Reserved instruction
    WDM #$DB             ; 42 DB | Reserved instruction
    LDA $18A5,X          ; BD A5 18 | Load from absolute,X into accumulator
    BIT $FF              ; 24 FF | Test bits in accumulator (zero page)
    WDM #$BD             ; 42 BD | Reserved instruction
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    CLI                  ; 58 | Clear interrupt disable flag
    TYA                  ; 98 | Transfer Y register to accumulator
    LDX #$B8             ; A2 B8 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank48_DmaFunction_131
; Address: $E4C46C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_131:
    JSR $40CB            ; 20 CB 40 | Jump to subroutine
    PHB                  ; 8B | Push data bank register to stack
    CLI                  ; 58 | Clear interrupt disable flag
    LSR $BC00,X          ; 5E 00 BC | Logical shift right (absolute,X)
    TSX                  ; BA | Transfer stack pointer to X register
    PLY                  ; 7A | Pull Y register from stack
    CLD                  ; D8 | Clear decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_133
; Address: $E4C488
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_133:
    SEC                  ; 38 | Set carry flag
    INC $361E,X          ; FE 1E 36 | Increment (absolute,X)
    TYA                  ; 98 | Transfer Y register to accumulator
    CMP $2200,Y          ; D9 00 22 | Compare accumulator (absolute,Y)
    REP #$00             ; C2 00 | Reset processor status bits
    PLP                  ; 28 | Pull processor status from stack
    ADC $4242,X          ; 7D 42 42 | Hardware register operation
    PLY                  ; 7A | Pull Y register from stack
    PLY                  ; 7A | Pull Y register from stack
    SBC $0830,X          ; FD 30 08 | Subtract with carry (absolute,X)
    BMI $30              ; 30 30 | Branch if negative
    INC $BD5A,X          ; FE 5A BD | Increment (absolute,X)
    PLY                  ; 7A | Pull Y register from stack
    STA $72              ; 85 72 | Store accumulator to zero page
    STA $8D72            ; 8D 72 8D | Store accumulator to absolute address
    SEC                  ; 38 | Set carry flag
    CMP $41F9,Y          ; D9 F9 41 | Compare accumulator (absolute,Y)
    EOR ($74,X)          ; 41 74 | Exclusive OR with accumulator ((zero page,X))
    STZ $64              ; 64 64 | Store zero to zero page
    STZ $64              ; 64 64 | Store zero to zero page
    ROR $EB              ; 66 EB | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_134
; Address: $E4C4CC
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_134:
    JSR $4050            ; 20 50 40 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    STA $7E              ; 85 7E | Store accumulator to zero page
    ADC ($BE),Y          ; 71 BE | Add with carry ((zero page),Y)
    PHB                  ; 8B | Push data bank register to stack
    STZ $9B              ; 64 9B | Store zero to zero page
    STZ $9B              ; 64 9B | Store zero to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_135
; Address: $E4C4DB
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_135:
    STA                  ; 9F 8F FF C9 | Store accumulator to absolute long,X
    LDA                  ; BF 80 80 7F | Load from absolute long,X into accumulator
    AND ($47),Y          ; 31 47 | Logical AND with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    BRA $8E              ; 80 8E | Branch always
    STX $8E8A            ; 8E 8A 8E | Store X register to absolute address
    BMI $0B              ; 30 0B | Branch if negative
    XBA                  ; EB | Exchange accumulator bytes
    BRA $FF              ; 80 FF | Branch always
    BRA $71              ; 80 71 | Branch always
    STA                  ; 9F 71 EF F4 | Store accumulator to absolute long,X
    STA $182C04          ; 8F 04 2C 18 | Store accumulator to absolute long address
    PLP                  ; 28 | Pull processor status from stack
    ROL $3A              ; 26 3A | Rotate left (zero page)
    ROL $3A              ; 26 3A | Rotate left (zero page)
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    BIT $FF00            ; 2C 00 FF | Test bits in accumulator (absolute)
    BPL $EF              ; 10 EF | Branch if positive
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank48_DmaFunction_137
; Address: $E4C524
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_137:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $FF              ; 80 FF | Branch always
    BMI $DF              ; 30 DF | Branch if negative

;------------------------------------------------------------------------------
; Bank48_DmaFunction_138
; Address: $E4C536
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_138:
    JSR $02FF            ; 20 FF 02 | Jump to subroutine
    JMP $00FF            ; 4C FF 00 | Jump to address
    PHB                  ; 8B | Push data bank register to stack
    RTI                  ; 40 | Return from interrupt
    BRA $CF              ; 80 CF | Branch always
    EOR $80              ; 45 80 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_139
; Address: $E4C549
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_139:
    JSL $389746          ; 22 46 97 38 | Jump to subroutine long
    DEC $631C            ; CE 1C 63 | Decrement (absolute)
    PLY                  ; 7A | Pull Y register from stack
    AND $3E00,Y          ; 39 00 3E | Logical AND with accumulator (absolute,Y)
    LDA $DF00,X          ; BD 00 DF | Load from absolute,X into accumulator
    INX                  ; E8 | Increment X register
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    PLA                  ; 68 | Pull accumulator from stack
    STZ $FC10            ; 9C 10 FC | Store zero to absolute
    BMI $FC              ; 30 FC | Branch if negative
    INC $F301            ; EE 01 F3 | Increment (absolute)
    BMI $E1              ; 30 E1 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_13A
; Address: $E4C56D
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_13A:
    TYA                  ; 98 | Transfer Y register to accumulator
    CLV                  ; B8 | Clear overflow flag
    STZ $00              ; 64 00 | Store zero to zero page
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    JMP $005200          ; 5C 00 52 00 | Jump to address long
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    INX                  ; E8 | Increment X register
    PEA #$3800           ; F4 00 38 | Push effective address to stack
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank48_DmaFunction_13B
; Address: $E4C594
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_13B:
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    STZ $64              ; 64 64 | Store zero to zero page
    STZ $64              ; 64 64 | Store zero to zero page
    STZ $64              ; 64 64 | Store zero to zero page
    STZ $64              ; 64 64 | Store zero to zero page
    STZ $64              ; 64 64 | Store zero to zero page
    STZ $64              ; 64 64 | Store zero to zero page
    CMP #$BF             ; C9 BF | Compare accumulator (immediate)
    INY                  ; C8 | Increment Y register
    LDA                  ; BF E4 9B 64 | Load from absolute long,X into accumulator
    STZ $9B              ; 64 9B | Store zero to zero page
    STZ $9B              ; 64 9B | Store zero to zero page
    CPX $9B              ; E4 9B | Compare X register (zero page)
    CPX $9B              ; E4 9B | Compare X register (zero page)
    ASL $27              ; 06 27 | Arithmetic shift left (zero page)
    ASL $0A70,X          ; 1E 70 0A | Arithmetic shift left (absolute,X)
    DEY                  ; 88 | Decrement Y register
    PHA                  ; 48 | Push accumulator to stack
    BEQ $0F              ; F0 0F | Branch if equal
    SBC ($8E),Y          ; F1 8E | Subtract with carry ((zero page),Y)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BRA $F0              ; 80 F0 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BMI $80              ; 30 80 | Branch if negative
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $80              ; 80 80 | Branch always
    BMI $00              ; 30 00 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_13D
; Address: $E4C5FA
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_13D:
    JSR $9000            ; 20 00 90 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$80             ; C0 80 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_13F
; Address: $E4C624
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_13F:
    JSR $4140            ; 20 40 41 | Jump to subroutine
    EOR ($49,X)          ; 41 49 | Exclusive OR with accumulator ((zero page,X))
    EOR #$04             ; 49 04 | Exclusive OR with accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    EOR ($5A,X)          ; 41 5A | Exclusive OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    LDA                  ; BF 00 BE 00 | Load from absolute long,X into accumulator
    LDA                  ; BF 00 BE 00 | Load from absolute long,X into accumulator
    LDY $00              ; A4 00 | Load from zero page into Y register
    TSX                  ; BA | Transfer stack pointer to X register
    SBC $FDFD,X          ; FD FD FD | Subtract with carry (absolute,X)
    SBC $FA8B,X          ; FD 8B FA | Subtract with carry (absolute,X)
    STA $FF9B,Y          ; 99 9B FF | Store accumulator to absolute,Y
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    STZ $00              ; 64 00 | Store zero to zero page
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    AND $3A39,Y          ; 39 39 3A | Logical AND with accumulator (absolute,Y)
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    STZ $64              ; 64 64 | Store zero to zero page
    STZ $64              ; 64 64 | Store zero to zero page
    STZ $64              ; 64 64 | Store zero to zero page
    STZ $64              ; 64 64 | Store zero to zero page
    STZ $64              ; 64 64 | Store zero to zero page
    STZ $64              ; 64 64 | Store zero to zero page
    INC $E6              ; E6 E6 | Increment (zero page)
    JMP ($E4EB)          ; 6C EB E4 | Jump to address (absolute indirect)
    CPX $9B              ; E4 9B | Compare X register (zero page)
    CPX $9B              ; E4 9B | Compare X register (zero page)
    STZ $9B              ; 64 9B | Store zero to zero page
    STZ $9B              ; 64 9B | Store zero to zero page

;------------------------------------------------------------------------------
; Bank48_DmaFunction_140
; Address: $E4C69A
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_140:
    STZ $9B              ; 64 9B | Store zero to zero page
    STZ $9B              ; 64 9B | Store zero to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_141
; Address: $E4C69F
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_141:
    STA                  ; 9F 72 0E 48 | Store accumulator to absolute long,X
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BRA $FF              ; 80 FF | Branch always
    PLP                  ; 28 | Pull processor status from stack
    SBC ($0F),Y          ; F1 0F | Subtract with carry ((zero page),Y)
    STX $DBFF            ; 8E FF DB | Store X register to absolute address
    BCS $00              ; B0 00 | Branch if carry set
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank48_DmaFunction_144
; Address: $E4C6DA
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_144:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    ORA $185D,X          ; 1D 5D 18 | Logical OR with accumulator (absolute,X)
    JMP $595C18          ; 5C 18 5C 59 | Jump to address long
    EOR $5D5D,X          ; 5D 5D 5D | Exclusive OR with accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag
    CLI                  ; 58 | Clear interrupt disable flag
    LSR $47              ; 46 47 | Logical shift right (zero page)
    ORA $A25B,X          ; 1D 5B A2 | Logical OR with accumulator (absolute,X)
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDX #$00             ; A2 00 | Load immediate value into X register
    CLV                  ; B8 | Clear overflow flag
    LDY $00              ; A4 00 | Load from zero page into Y register
    BIT #$D1             ; 89 D1 | Test bits in accumulator (immediate)
    PLP                  ; 28 | Pull processor status from stack
    PLY                  ; 7A | Pull Y register from stack
    PHY                  ; 5A | Push Y register to stack
    PLY                  ; 7A | Pull Y register from stack
    CLV                  ; B8 | Clear overflow flag
    TSX                  ; BA | Transfer stack pointer to X register
    ROR $C0C1,X          ; 7E C1 C0 | Rotate right (absolute,X)
    STY $8500            ; 8C 00 85 | Store Y register to absolute address
    STA $00              ; 85 00 | Store accumulator to zero page
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    SBC $8100,X          ; FD 00 81 | Subtract with carry (absolute,X)
    CMP $97AB,X          ; DD AB 97 | Compare accumulator (absolute,X)
    LDA $C6BD            ; AD BD C6 | Load from absolute address into accumulator
    SBC $D6BC,X          ; FD BC D6 | Subtract with carry (absolute,X)
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank48_DmaFunction_145
; Address: $E4C732
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_145:
    JSR $95FF            ; 20 FF 95 | Jump to subroutine
    XBA                  ; EB | Exchange accumulator bytes
    STZ $0CE3            ; 9C E3 0C | Store zero to absolute
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ADC $451B            ; 6D 1B 45 | Add with carry (absolute)
    CPX $E4              ; E4 E4 | Compare X register (zero page)
    AND $E7              ; 25 E7 | Logical AND with accumulator (zero page)
    SBC $23DF            ; ED DF 23 | Subtract with carry (absolute)
    BIT #$38             ; 89 38 | Test bits in accumulator (immediate)
    SEC                  ; 38 | Set carry flag
    BRA $FF              ; 80 FF | Branch always
    TAX                  ; AA | Transfer accumulator to X register
    STZ $9B              ; 64 9B | Store zero to zero page

;------------------------------------------------------------------------------
; Bank48_DmaFunction_146
; Address: $E4C758
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_146:
    JSR $00DF            ; 20 DF 00 | Jump to subroutine
    BRA $80              ; 80 80 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_147
; Address: $E4C766
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_147:
    SEI                  ; 78 | Set interrupt disable flag
    STA $8EFE8F          ; 8F 8F FE 8E | Store accumulator to absolute long address
    PLX                  ; FA | Pull X register from stack
    STX $0B70            ; 8E 70 0B | Store X register to absolute address
    BRA $FF              ; 80 FF | Branch always
    BVS $DF              ; 70 DF | Branch if overflow set
    ADC ($8F),Y          ; 71 8F | Add with carry ((zero page),Y)
    ADC ($8F),Y          ; 71 8F | Add with carry ((zero page),Y)
    PEA #$208F           ; F4 8F 20 | Push effective address to stack
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $D0              ; F0 D0 | Branch if equal

;------------------------------------------------------------------------------
; Bank48_DmaFunction_148
; Address: $E4C787
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_148:
    JSR $00F0            ; 20 F0 00 | Jump to subroutine
    BMI $40              ; 30 40 | Branch if negative
    BCC $E0              ; 90 E0 | Game work RAM access
    BPL $60              ; 10 60 | Branch if positive
    CPY #$E0             ; C0 E0 | Game work RAM access
    BEQ $10              ; F0 10 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal

;------------------------------------------------------------------------------
; Bank48_DmaFunction_149
; Address: $E4C796
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_149:
    JSR $00F0            ; 20 F0 00 | Jump to subroutine
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $80              ; F0 80 | Branch if equal
    BVS $00              ; 70 00 | Branch if overflow set
    BEQ $00              ; F0 00 | Branch if equal
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CPX #$84             ; E0 84 | Compare X register (immediate)
    CPY #$9E             ; C0 9E | Compare Y register (immediate)
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SBC $7E9F,X          ; FD 9F 7E | Subtract with carry (absolute,X)
    STA                  ; 9F 10 10 04 | Store accumulator to absolute long,X
    BPL $10              ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank48_DmaFunction_14B
; Address: $E4C7CC
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_14B:
    AND ($78,X)          ; 21 78 | Logical AND with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ASL $3F              ; 06 3F | Arithmetic shift left (zero page)
    INC $FF22,X          ; FE 22 FF | Increment (absolute,X)
    CPX #$7F             ; E0 7F | Compare X register (immediate)
    CMP ($FE,X)          ; C1 FE | Compare accumulator ((zero page,X))
    SBC $E71C,X          ; FD 1C E7 | Subtract with carry (absolute,X)
    ORA $1303,X          ; 1D 03 13 | Logical OR with accumulator (absolute,X)
    INC                  ; 1A | Increment accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND ($1D,X)          ; 21 1D | Logical AND with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    AND ($3F,X)          ; 21 3F | Logical AND with accumulator ((zero page,X))
    BIT #$89             ; 89 89 | Test bits in accumulator (immediate)
    STX $2F8E            ; 8E 8E 2F | Store X register to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank48_DmaFunction_14C
; Address: $E4C80D
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_14C:
    JMP $09A4A7          ; 5C A7 A4 09 | Jump to address long
    BVC $AF              ; 50 AF | Branch if overflow clear
    AND $DA              ; 25 DA | Logical AND with accumulator (zero page)
    LDA $738C            ; AD 8C 73 | Load from absolute address into accumulator
    AND #$D6             ; 29 D6 | Logical AND with accumulator (immediate)
    BPL $EF              ; 10 EF | Branch if positive
    LDY $5B              ; A4 5B | Load from zero page into Y register
    BIT #$88             ; 89 88 | Test bits in accumulator (immediate)
    BVS $8E              ; 70 8E | Branch if overflow set
    STY $5E27            ; 8C 27 5E | Store Y register to absolute address
    EOR $A54C            ; 4D 4C A5 | Exclusive OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    BVC $AF              ; 50 AF | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank48_DmaFunction_14D
; Address: $E4C834
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_14D:
    JSR $50DF            ; 20 DF 50 | Jump to subroutine
    LDA $04738C          ; AF 8C 73 04 | Load from absolute long address into accumulator
    STZ $CBB8            ; 9C B8 CB | Store zero to absolute
    LDY $84BB,X          ; BC BB 84 | Load from absolute,X into Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    LDX $BE3E,Y          ; BE 3E BE | Load from absolute,Y into X register
    ROL $3FBF,X          ; 3E BF 3F | Rotate left (absolute,X)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    JMP $734C            ; 4C 4C 73 | Jump to address
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    LDY $84BB,X          ; BC BB 84 | Load from absolute,X into Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    LDX $BE3E,Y          ; BE 3E BE | Load from absolute,Y into X register
    ROL $3FBF,X          ; 3E BF 3F | Rotate left (absolute,X)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_14E
; Address: $E4C8A6
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_14E:
    JMP $734C            ; 4C 4C 73 | Jump to address
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_14F
; Address: $E4C8C1
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_14F:
    BVS $10              ; 70 10 | Branch if overflow set
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BNE $28              ; D0 28 | Branch if not equal
    CLI                  ; 58 | Clear interrupt disable flag
    PEA #$B17F           ; F4 7F B1 | Push effective address to stack
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BEQ $E0              ; F0 E0 | Game work RAM access
    BEQ $B0              ; F0 B0 | Branch if equal
    BEQ $40              ; F0 40 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SBC ($5F),Y          ; F1 5F | Subtract with carry ((zero page),Y)
    ROL $00FF            ; 2E FF 00 | Rotate left (absolute)
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $40              ; 80 40 | Branch always
    RTI                  ; 40 | Return from interrupt
    INY                  ; C8 | Increment Y register
    JMP ($EE11)          ; 6C 11 EE | Jump to address (absolute indirect)
    BVC $AF              ; 50 AF | Branch if overflow clear
    BRA $CB              ; 80 CB | Branch always
    STA                  ; 9F EF FF EF | Store accumulator to absolute long,X
    ADC ($FF,X)          ; 61 FF | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank48_DmaFunction_151
; Address: $E4C940
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_151:
    JSR $3017            ; 20 17 30 | Jump to subroutine
    BPL $09              ; 10 09 | Branch if positive
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    STA $1757E8          ; 8F E8 57 17 | Store accumulator to absolute long address
    ASL $1F00,X          ; 1E 00 1F | Arithmetic shift left (absolute,X)
    BRA $FF              ; 80 FF | Branch always
    BEQ $1F              ; F0 1F | Branch if equal
    DEY                  ; 88 | Decrement Y register
    BIT #$53             ; 89 53 | Test bits in accumulator (immediate)
    ORA ($72),Y          ; 11 72 | Logical OR with accumulator ((zero page),Y)
    BIT #$8E             ; 89 8E | Test bits in accumulator (immediate)
    ROR $C444,X          ; 7E 44 C4 | Rotate right (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    BVC $AF              ; 50 AF | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank48_DmaFunction_152
; Address: $E4C974
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_152:
    JSR $50DF            ; 20 DF 50 | Jump to subroutine
    LDA $0D7788          ; AF 88 77 0D | Load from absolute long address into accumulator
    PHB                  ; 8B | Push data bank register to stack
    ORA #$53             ; 09 53 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_153
; Address: $E4C984
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_153:
    AND $6204,X          ; 3D 04 62 | Logical AND with accumulator (absolute,X)
    BVC $AD              ; 50 AD | Branch if overflow clear
    LSR $85EF            ; 4E EF 85 | Logical shift right (absolute)
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    BPL $EF              ; 10 EF | Branch if positive
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 80 7F 21 | Load from absolute long,X into accumulator
    DEC $FD02,X          ; DE 02 FD | Decrement (absolute,X)
    STA $7A              ; 85 7A | Store accumulator to zero page
    STY $00              ; 84 00 | Store Y register to zero page
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    LDX $BE3E,Y          ; BE 3E BE | Load from absolute,Y into X register
    ROL $3FBF,X          ; 3E BF 3F | Rotate left (absolute,X)
    STY $00              ; 84 00 | Store Y register to zero page
    STY $00              ; 84 00 | Store Y register to zero page
    STY $00              ; 84 00 | Store Y register to zero page
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SBC $F1F0,Y          ; F9 F0 F1 | Subtract with carry (absolute,Y)
    BEQ $69              ; F0 69 | Branch if equal
    BEQ $49              ; F0 49 | Branch if equal
    PHA                  ; 48 | Push accumulator to stack
    INC $FE7E,X          ; FE 7E FE | Increment (absolute,X)
    ROL $09FE            ; 2E FE 09 | Rotate left (absolute)
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SBC ($EF,X)          ; E1 EF | Subtract with carry ((zero page,X))
    BEQ $FF              ; F0 FF | Branch if equal
    AND $7D38,Y          ; 39 38 7D | Logical AND with accumulator (absolute,Y)
    INC $FE4C,X          ; FE 4C FE | Increment (absolute,X)
    INC $0001,X          ; FE 01 00 | Increment (absolute,X)
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    STY $00              ; 84 00 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank48_DmaFunction_154
; Address: $E4CA0E
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_154:
    JSL $000822          ; 22 22 08 00 | Jump to subroutine long
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CMP $0000,X          ; DD 00 00 | Compare accumulator (absolute,X)
    CMP $AA00,X          ; DD 00 AA | Compare accumulator (absolute,X)
    RTI                  ; 40 | Return from interrupt
    EOR ($70,X)          ; 41 70 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank48_DmaFunction_157
; Address: $E4CA33
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_157:
    JSL $BF55FF          ; 22 FF 55 BF | Jump to subroutine long
    INC $F98F,X          ; FE 8F F9 | Increment (absolute,X)
    PHB                  ; 8B | Push data bank register to stack
    SBC $9F77,Y          ; F9 77 9F | Subtract with carry (absolute,Y)
    CMP $EB00,X          ; DD 00 EB | Compare accumulator (absolute,X)
    EOR ($20,X)          ; 41 20 | Exclusive OR with accumulator ((zero page,X))
    ADC ($2A,X)          ; 61 2A | Add with carry ((zero page,X))
    STZ $00DD            ; 9C DD 00 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank48_DmaFunction_158
; Address: $E4CA53
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_158:
    JSL $FF14FF          ; 22 FF 14 FF | Jump to subroutine long
    LDX $BEDF,Y          ; BE DF BE | Load from absolute,Y into X register
    INC $BE63,X          ; FE 63 BE | Increment (absolute,X)
    SEC                  ; 38 | Set carry flag
    BRA $08              ; 80 08 | Branch always
    BRA $BC              ; 80 BC | Branch always
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    CPY #$4E             ; C0 4E | Compare Y register (immediate)
    REP #$1F             ; C2 1F | Reset processor status bits
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    BCC $30              ; 90 30 | Branch if carry clear
    BRA $A2              ; 80 A2 | Branch always
    STY $3C79            ; 8C 79 3C | Store Y register to absolute address
    SBC ($3A,X)          ; E1 3A | Subtract with carry ((zero page,X))
    ROL                  ; 2A | Rotate left (accumulator)
    BMI $31              ; 30 31 | Branch if negative
    ROR $E0A0            ; 6E A0 E0 | Game work RAM access
    BNE $70              ; D0 70 | Branch if not equal
    INC $F30E,X          ; FE 0E F3 | Increment (absolute,X)
    ROL $BFE3,X          ; 3E E3 BF | Rotate left (absolute,X)
    ROR $91FF,X          ; 7E FF 91 | Rotate right (absolute,X)
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    BRA $BD              ; 80 BD | Branch always
    LDA $07E3,X          ; BD E3 07 | Load from absolute,X into accumulator
    ORA $0F03            ; 0D 03 0F | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BIT $59              ; 24 59 | Test bits in accumulator (zero page)
    BPL $0F              ; 10 0F | Branch if positive
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank48_DmaFunction_159
; Address: $E4CADF
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_159:
    ADC $00              ; 65 00 | Add with carry (zero page)
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    BMI $31              ; 30 31 | Branch if negative

;------------------------------------------------------------------------------
; Bank48_DmaFunction_15A
; Address: $E4CAE9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_15A:
    JSR $76F6            ; 20 F6 76 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    BRA $11              ; 80 11 | Branch always
    BPL $1F              ; 10 1F | Branch if positive

;------------------------------------------------------------------------------
; Bank48_DmaFunction_15B
; Address: $E4CAF3
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_15B:
    JSR $261F            ; 20 1F 26 | Jump to subroutine
    AND ($07,X)          ; 21 07 | Logical AND with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    BIT #$3F             ; 89 3F | Test bits in accumulator (immediate)
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    DEC $0200            ; CE 00 02 | Decrement (absolute)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    DEC $F300            ; CE 00 F3 | Decrement (absolute)
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    INC $CF00,X          ; FE 00 CF | Increment (absolute,X)
    AND ($FF),Y          ; 31 FF | Logical AND with accumulator ((zero page),Y)
    ADC $F9FF,Y          ; 79 FF F9 | Add with carry (absolute,Y)
    AND ($F7),Y          ; 31 F7 | Logical AND with accumulator ((zero page),Y)
    SBC ($EF,X)          ; E1 EF | Subtract with carry ((zero page,X))
    BEQ $FF              ; F0 FF | Branch if equal
    AND $7D38,Y          ; 39 38 7D | Logical AND with accumulator (absolute,Y)
    INC $FE4C,X          ; FE 4C FE | Increment (absolute,X)
    INC $80CD,X          ; FE CD 80 | Increment (absolute,X)
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    STY $00              ; 84 00 | Store Y register to zero page
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    LDA                  ; BF 00 FF 00 | Load from absolute long,X into accumulator
    ADC ($6F,X)          ; 61 6F | Add with carry ((zero page,X))
    BVS $7F              ; 70 7F | Branch if overflow set
    LDA $3D38,Y          ; B9 38 3D | Load from absolute,Y into accumulator
    ROR $7E0C,X          ; 7E 0C 7E | Rotate right (absolute,X)
    ROR $0081,X          ; 7E 81 00 | Rotate right (absolute,X)
    BCC $00              ; 90 00 | Branch if carry clear
    BCC $00              ; 90 00 | Branch if carry clear
    BRA $00              ; 80 00 | Branch always
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_15C
; Address: $E4CB7A
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_15C:
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    BEQ $EB              ; F0 EB | Branch if equal
    PLX                  ; FA | Pull X register from stack
    AND #$28             ; 29 28 | Logical AND with accumulator (immediate)
    STA $00              ; 85 00 | Store accumulator to zero page
    ROR $7E7E,X          ; 7E 7E 7E | Rotate right (absolute,X)
    ROR $2223,X          ; 7E 23 22 | Rotate right (absolute,X)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $D700            ; 0D 00 D7 | Logical OR with accumulator (absolute)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    CMP $E700,X          ; DD 00 E7 | Compare accumulator (absolute,X)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    AND $80C2,X          ; 3D C2 80 | Logical AND with accumulator (absolute,X)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    XBA                  ; EB | Exchange accumulator bytes
    CMP $DDB3,X          ; DD B3 DD | Compare accumulator (absolute,X)
    BCS $C0              ; B0 C0 | Branch if carry set
    LDA                  ; BF FD 82 5E | Load from absolute long,X into accumulator
    LDA                  ; BF 20 FF 00 | Load from absolute long,X into accumulator
    ROR $FF00,X          ; 7E 00 FF | Rotate right (absolute,X)
    LDX $FF              ; A6 FF | Load from zero page into X register
    LDX $FF              ; A6 FF | Load from zero page into X register
    BRA $FF              ; 80 FF | Branch always
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPX #$29             ; E0 29 | Compare X register (immediate)
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    CPX #$40             ; E0 40 | Compare X register (immediate)
    EOR ($4D,X)          ; 41 4D | Exclusive OR with accumulator ((zero page,X))
    LDA $913C,X          ; BD 3C 91 | Load from absolute,X into accumulator
    ORA ($C0),Y          ; 11 C0 | Logical OR with accumulator ((zero page),Y)
    ASL $12C0,X          ; 1E C0 12 | Arithmetic shift left (absolute,X)
    BRA $40              ; 80 40 | Branch always
    TYA                  ; 98 | Transfer Y register to accumulator
    BPL $9E              ; 10 9E | Branch if positive
    ROL $BED1            ; 2E D1 BE | Rotate left (absolute)
    INC $E1BF,X          ; FE BF E1 | Increment (absolute,X)
    CMP $BBFF            ; CD FF BB | Compare accumulator (absolute)
    CPY $F1BF            ; CC BF F1 | Compare Y register (absolute)
    BRA $80              ; 80 80 | Branch always
    BVS $40              ; 70 40 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank48_DmaFunction_15D
; Address: $E4CC4C
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_15D:
    BMI $34              ; 30 34 | Branch if negative
    PLA                  ; 68 | Pull accumulator from stack
    BVS $F0              ; 70 F0 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    INY                  ; C8 | Increment Y register
    LDY $786C,X          ; BC 6C 78 | Load from absolute,X into Y register
    BCC $78              ; 90 78 | Branch if carry clear
    BRA $B1              ; 80 B1 | Branch always
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    ADC $B1E3,X          ; 7D E3 B1 | Add with carry (absolute,X)
    INC $B87F,X          ; FE 7F B8 | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 24 FF 00 | Load from absolute long,X into accumulator
    PHP                  ; 08 | Push processor status to stack
    STZ $18              ; 64 18 | Store zero to zero page
    AND ($C9),Y          ; 31 C9 | Logical AND with accumulator ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    BVS $A0              ; 70 A0 | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    ORA $50              ; 05 50 | Logical OR with accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    ORA $037F,Y          ; 19 7F 03 | Logical OR with accumulator (absolute,Y)
    ROR $FF03,X          ; 7E 03 FF | Rotate right (absolute,X)
    ADC $7FD7,X          ; 7D D7 7F | Add with carry (absolute,X)
    INY                  ; C8 | Increment Y register
    LSR $56D6            ; 4E D6 56 | Logical shift right (absolute)
    PHA                  ; 48 | Push accumulator to stack
    JMP $0F71            ; 4C 71 0F | Jump to address
    ROR $7F7E,X          ; 7E 7E 7F | Rotate right (absolute,X)
    STZ $A956,X          ; 9E 56 A9 | Store zero to absolute,X
    NOP                  ; EA | No operation
    INC $FFE2            ; EE E2 FF | Increment (absolute)
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    ORA #$6B             ; 09 6B | Logical OR with accumulator (immediate)
    TAY                  ; A8 | Transfer accumulator to Y register
    TAX                  ; AA | Transfer accumulator to X register
    PHP                  ; 08 | Push processor status to stack
    TYA                  ; 98 | Transfer Y register to accumulator
    CLC                  ; 18 | Clear carry flag
    SEI                  ; 78 | Set interrupt disable flag
    PLP                  ; 28 | Pull processor status from stack
    JMP ($A420)          ; 6C 20 A4 | Jump to address (absolute indirect)
    CPX $FDFC            ; EC FC FD | Compare X register (absolute)
    LDA $FC57            ; AD 57 FC | Load from absolute address into accumulator
    JMP ($8CFC)          ; 6C FC 8C | Jump to address (absolute indirect)
    TYA                  ; 98 | Transfer Y register to accumulator
    CLI                  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank48_DmaFunction_15E
; Address: $E4CCE0
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_15E:
    STZ $20              ; 64 20 | Store zero to zero page
    BMI $43              ; 30 43 | Branch if negative
    STY $3F              ; 84 3F | Store Y register to zero page
    CPY #$41             ; C0 41 | Compare Y register (immediate)
    BRA $41              ; 80 41 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $DF              ; 80 DF | Branch always
    PHP                  ; 08 | Push processor status to stack
    STZ $B390            ; 9C 90 B3 | Store zero to absolute
    STY $808C            ; 8C 8C 80 | Store Y register to absolute address
    BRA $D0              ; 80 D0 | Branch always
    BNE $F7              ; D0 F7 | Branch if not equal
    BIT $DF              ; 24 DF | Test bits in accumulator (zero page)
    INY                  ; C8 | Increment Y register
    LDA                  ; BF 81 FE B8 | Load from absolute long,X into accumulator
    STZ $C0E1,X          ; 9E E1 C0 | Store zero to absolute,X
    CPY $00F3            ; CC F3 00 | Compare Y register (absolute)
    DEC $1F31            ; CE 31 1F | Decrement (absolute)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$01             ; E0 01 | Compare X register (immediate)
    INC $D728,X          ; FE 28 D7 | Increment (absolute,X)
    SBC ($06),Y          ; F1 06 | Subtract with carry ((zero page),Y)
    SBC $EC13,Y          ; F9 13 EC | Subtract with carry (absolute,Y)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $C6              ; 80 C6 | Branch always
    BRA $C6              ; 80 C6 | Branch always
    STY $C2              ; 84 C2 | Store Y register to zero page
    STX $C6              ; 86 C6 | Store X register to zero page
    ASL $46              ; 06 46 | Arithmetic shift left (zero page)
    AND $3FFF,Y          ; 39 FF 3F | Logical AND with accumulator (absolute,Y)
    SBC $F93F,Y          ; F9 3F F9 | Subtract with carry (absolute,Y)
    AND $B9F9,Y          ; 39 F9 B9 | Logical AND with accumulator (absolute,Y)
    LDA                  ; BF F0 00 00 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank48_DmaFunction_15F
; Address: $E4CD82
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_15F:
    JSR $3020            ; 20 20 30 | Jump to subroutine
    ORA ($11,X)          ; 01 11 | Logical OR with accumulator ((zero page,X))
    BMI $00              ; 30 00 | Branch if negative
    EOR #$30             ; 49 30 | Exclusive OR with accumulator (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    SEC                  ; 38 | Set carry flag
    DEC $CEFF            ; CE FF CE | Decrement (absolute)
    CPY $CCFF            ; CC FF CC | Compare Y register (absolute)
    STX $DC              ; 86 DC | Store X register to zero page
    STX $FC              ; 86 FC | Store X register to zero page
    PEA #$0060           ; F4 60 00 | Push effective address to stack
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_160
; Address: $E4CDA6
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_160:
    RTI                  ; 40 | Return from interrupt
    BMI $30              ; 30 30 | Branch if negative
    BIT $241F            ; 2C 1F 24 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_161
; Address: $E4CDAF
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_161:
    BIT $90              ; 24 90 | Test bits in accumulator (zero page)
    BEQ $60              ; F0 60 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_162
; Address: $E4CDB4
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_162:
    BPL $30              ; 10 30 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_166
; Address: $E4CDCC
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_166:
    CPX #$10             ; E0 10 | Compare X register (immediate)
    BEQ $18              ; F0 18 | Branch if equal
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    ROL $12              ; 26 12 | Rotate left (zero page)
    AND $2D12            ; 2D 12 2D | Logical AND with accumulator (absolute)
    AND $2D12            ; 2D 12 2D | Logical AND with accumulator (absolute)
    INC                  ; 1A | Increment accumulator
    AND $02              ; 25 02 | Logical AND with accumulator (zero page)
    AND $2D12,X          ; 3D 12 2D | Logical AND with accumulator (absolute,X)
    AND $FF83            ; 2D 83 FF | Logical AND with accumulator (absolute)
    JMP ($7CFF)          ; 6C FF 7C | Jump to address (absolute indirect)
    JMP ($FFFF)          ; 6C FF FF | Jump to address (absolute indirect)
    ADC $7C83,X          ; 7D 83 7C | Add with carry (absolute,X)
    ASL $1C0E,X          ; 1E 0E 1C | Arithmetic shift left (absolute,X)
    DEC $01              ; C6 01 | Decrement (zero page)
    DEX                  ; CA | Decrement X register
    INC $F101,X          ; FE 01 F1 | Increment (absolute,X)
    BEQ $00              ; F0 00 | Branch if equal
    ADC $4D00,X          ; 7D 00 4D | Add with carry (absolute,X)
    TYA                  ; 98 | Transfer Y register to accumulator
    BCC $10              ; 90 10 | Branch if carry clear
    BPL $38              ; 10 38 | Branch if positive
    BMI $D7              ; 30 D7 | Branch if negative
    STY $80              ; 84 80 | Store Y register to zero page
    BRA $00              ; 80 00 | Branch always
    CMP $6F00,X          ; DD 00 6F | Compare accumulator (absolute,X)
    SBC $FCFF,Y          ; F9 FF FC | Subtract with carry (absolute,Y)
    REP #$FD             ; C2 FD | Reset processor status bits
    SED                  ; F8 | Set decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    SEC                  ; 38 | Set carry flag
    CPY $FF              ; C4 FF | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_167
; Address: $E4CEA8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_167:
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    XBA                  ; EB | Exchange accumulator bytes
    PHP                  ; 08 | Push processor status to stack
    LSR $5F1F            ; 4E 1F 5F | Logical shift right (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_168
; Address: $E4CECC
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_168:
    ASL $485B            ; 0E 5B 48 | Arithmetic shift left (absolute)
    SBC $FFA0,Y          ; F9 A0 FF | Subtract with carry (absolute,Y)
    BRA $FF              ; 80 FF | Branch always
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    BRA $FF              ; 80 FF | Branch always
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    LDY $FF              ; A4 FF | Load from zero page into Y register
    TAX                  ; AA | Transfer accumulator to X register
    LDA $FFFF,Y          ; B9 FF FF | Load from absolute,Y into accumulator
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    CPX $FF00            ; EC 00 FF | Compare X register (absolute)
    SBC ($1F,X)          ; E1 1F | Subtract with carry ((zero page,X))
    BIT $3F              ; 24 3F | Test bits in accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    BMI $01              ; 30 01 | Branch if negative

;------------------------------------------------------------------------------
; Bank48_DmaFunction_16A
; Address: $E4CF0C
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_16A:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_16B
; Address: $E4CF14
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_16B:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BVC $70              ; 50 70 | Branch if overflow clear
    BVC $70              ; 50 70 | Branch if overflow clear
    BVC $70              ; 50 70 | Branch if overflow clear
    BVC $70              ; 50 70 | Branch if overflow clear
    BVC $70              ; 50 70 | Branch if overflow clear
    BEQ $18              ; F0 18 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    ROL $1E01,X          ; 3E 01 1E | Rotate left (absolute,X)
    AND ($1C,X)          ; 21 1C | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank48_DmaFunction_16C
; Address: $E4CF2B
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_16C:
    JSL $001408          ; 22 08 14 00 | Jump to subroutine long
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BPL $33              ; 10 33 | Branch if positive
    ORA $2F00,X          ; 1D 00 2F | Logical OR with accumulator (absolute,X)
    BPL $30              ; 10 30 | Branch if positive
    BPL $30              ; 10 30 | Branch if positive

;------------------------------------------------------------------------------
; Bank48_DmaFunction_16D
; Address: $E4CF4F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_16D:
    JSR $2D12            ; 20 12 2D | Jump to subroutine
    BIT $231C            ; 2C 1C 23 | Test bits in accumulator (absolute)
    BPL $2F              ; 10 2F | Branch if positive

;------------------------------------------------------------------------------
; Bank48_DmaFunction_16F
; Address: $E4CF5D
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_16F:
    JSR $3F00            ; 20 00 3F | Jump to subroutine
    ROL $FF              ; 26 FF | Rotate left (zero page)
    BRA $00              ; 80 00 | Branch always
    BRA $5F              ; 80 5F | Branch always
    BRA $FF              ; 80 FF | Branch always
    BRA $00              ; 80 00 | Branch always
    LDY #$FF             ; A0 FF | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank48_DmaFunction_170
; Address: $E4CF84
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_170:
    JSL $CA0AFF          ; 22 FF 0A CA | Jump to subroutine long
    BIT $FF              ; 24 FF | Test bits in accumulator (zero page)
    ORA #$C9             ; 09 C9 | Logical OR with accumulator (immediate)
    BRA $FF              ; 80 FF | Branch always
    PLB                  ; AB | Pull data bank register from stack
    BRA $4A              ; 80 4A | Branch always
    BRA $49              ; 80 49 | Branch always
    LDY #$00             ; A0 00 | Load immediate value into Y register
    ASL $33F1            ; 0E F1 33 | Arithmetic shift left (absolute)
    CPY $A058            ; CC 58 A0 | Compare Y register (absolute)
    ROL $77C0            ; 2E C0 77 | Rotate left (absolute)
    DEY                  ; 88 | Decrement Y register
    STA $20FF,Y          ; 99 FF 20 | Store accumulator to absolute,Y
    INC $8D01,X          ; FE 01 8D | Increment (absolute,X)
    BVS $18              ; 70 18 | Branch if overflow set
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    ASL $4A5B            ; 0E 5B 4A | Arithmetic shift left (absolute)
    EOR ($51),Y          ; 51 51 | Exclusive OR with accumulator ((zero page),Y)
    BVS $6F              ; 70 6F | Branch if overflow set

;------------------------------------------------------------------------------
; Bank48_DmaFunction_171
; Address: $E4CFEE
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_171:
    JSR $A060            ; 20 60 A0 | Jump to subroutine
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    LDY $FF              ; A4 FF | Load from zero page into Y register
    LDX $80FF            ; AE FF 80 | Load from absolute address into X register
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    STA                  ; 9F FF 16 04 | Store accumulator to absolute long,X
    LSR                  ; 4A | Logical shift right (accumulator)
    ORA $7C1B,Y          ; 19 1B 7C | Logical OR with accumulator (absolute,Y)
    ADC $63              ; 65 63 | Add with carry (zero page)
    STY $7BF4            ; 8C F4 7B | Store Y register to absolute address
    BEQ $00              ; F0 00 | Branch if equal
    SBC #$FF             ; E9 FF | Subtract with carry (immediate)
    SBC ($A4,X)          ; E1 A4 | Subtract with carry ((zero page,X))
    STZ $0BF8            ; 9C F8 0B | Store zero to absolute
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    CPX #$20             ; E0 20 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_173
; Address: $E4D027
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_173:
    JSR $7010            ; 20 10 70 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_174
; Address: $E4D02C
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_174:
    BVC $20              ; 50 20 | Branch if overflow clear
    BVC $70              ; 50 70 | Branch if overflow clear
    BVC $70              ; 50 70 | Branch if overflow clear
    BVC $70              ; 50 70 | Branch if overflow clear
    BVC $70              ; 50 70 | Branch if overflow clear
    DEY                  ; 88 | Decrement Y register
    SED                  ; F8 | Set decimal mode flag
    TYA                  ; 98 | Transfer Y register to accumulator
    SED                  ; F8 | Set decimal mode flag
    DEY                  ; 88 | Decrement Y register
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CMP $44              ; C5 44 | Compare accumulator (zero page)
    INC $40CB,X          ; FE CB 40 | Increment (absolute,X)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    INC $FC83,X          ; FE 83 FC | Increment (absolute,X)
    LDA                  ; BF 44 FF FE | Load from absolute long,X into accumulator
    PHB                  ; 8B | Push data bank register to stack
    DEC $44BF,X          ; DE BF 44 | Decrement (absolute,X)
    INC $44BF,X          ; FE BF 44 | Increment (absolute,X)
    CMP $EBBF,Y          ; D9 BF EB | Compare accumulator (absolute,Y)
    LSR $AD76,X          ; 5E 76 AD | Logical shift right (absolute,X)
    LDY $335B            ; AC 5B 33 | Load from absolute address into Y register
    CLD                  ; D8 | Clear decimal mode flag
    ADC $BC              ; 65 BC | Add with carry (zero page)
    PHX                  ; DA | Push X register to stack
    ROR $FFB5,X          ; 7E B5 FF | Rotate right (absolute,X)
    CMP $E3BF,Y          ; D9 BF E3 | Compare accumulator (absolute,Y)
    LSR $AD76,X          ; 5E 76 AD | Logical shift right (absolute,X)
    SBC $3A1A            ; ED 1A 3A | Subtract with carry (absolute)
    CMP $BC65,Y          ; D9 65 BC | Compare accumulator (absolute,Y)
    PHX                  ; DA | Push X register to stack
    ROR $FEAC,X          ; 7E AC FE | Rotate right (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ADC #$F0             ; 69 F0 | Add with carry (immediate)
    BEQ $86              ; F0 86 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $C0              ; F0 C0 | Branch if equal
    BEQ $70              ; F0 70 | Branch if equal
    BEQ $09              ; F0 09 | Branch if equal
    BEQ $8F              ; F0 8F | Branch if equal
    BEQ $F9              ; F0 F9 | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    SBC $FFFF,Y          ; F9 FF FF | Subtract with carry (absolute,Y)
    ADC #$F0             ; 69 F0 | Add with carry (immediate)
    ASL $06F1            ; 0E F1 06 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_176
; Address: $E4D0D0
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_176:
    SBC $66FF,Y          ; F9 FF 66 | Subtract with carry (absolute,Y)
    BCC $FF              ; 90 FF | Branch if carry clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_177
; Address: $E4D0D7
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_177:
    ROR $00              ; 66 00 | Rotate right (zero page)
    BMI $E0              ; 30 E0 | Game work RAM access
    CPX #$18             ; E0 18 | Compare X register (immediate)
    CLC                  ; 18 | Clear carry flag
    CPY $7462            ; CC 62 74 | Compare Y register (absolute)
    PLY                  ; 7A | Pull Y register from stack
    PLY                  ; 7A | Pull Y register from stack
    INC                  ; 1A | Increment accumulator
    PLY                  ; 7A | Pull Y register from stack
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    LDA                  ; BF FF 5A FF | Load from absolute long,X into accumulator
    AND $FF              ; 25 FF | Logical AND with accumulator (zero page)
    BIT $34DB            ; 2C DB 34 | Test bits in accumulator (absolute)
    ADC $BC              ; 65 BC | Add with carry (zero page)
    PHX                  ; DA | Push X register to stack
    ROR $FFB5,X          ; 7E B5 FF | Rotate right (absolute,X)
    LDA                  ; BF FF 5B FE | Load from absolute long,X into accumulator
    LDX $FD              ; A6 FD | Load from zero page into X register
    ORA $3AFA            ; 0D FA 3A | Logical OR with accumulator (absolute)
    CMP $BC65,Y          ; D9 65 BC | Compare accumulator (absolute,Y)
    PHX                  ; DA | Push X register to stack
    ROR $FEAC,X          ; 7E AC FE | Rotate right (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF 77 37 7A | Load from absolute long,X into accumulator
    PLY                  ; 7A | Pull Y register from stack
    ROR                  ; 6A | Rotate right (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    NOP                  ; EA | No operation
    PLB                  ; AB | Pull data bank register from stack
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF C4 FF 44 | Load from absolute long,X into accumulator
    ASL $190A            ; 0E 0A 19 | Arithmetic shift left (absolute)
    ORA ($16),Y          ; 11 16 | Logical OR with accumulator ((zero page),Y)
    ASL $2C1C            ; 0E 1C 2C | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    BPL $38              ; 10 38 | Branch if positive
    ASL $1F08            ; 0E 08 1F | Arithmetic shift left (absolute)
    ORA ($0F),Y          ; 11 0F | Logical OR with accumulator ((zero page),Y)
    BPL $2C              ; 10 2C | Branch if positive
    BPL $28              ; 10 28 | Branch if positive
    BPL $28              ; 10 28 | Branch if positive

;------------------------------------------------------------------------------
; Bank48_DmaFunction_178
; Address: $E4D180
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_178:
    EOR $FBBF            ; 4D BF FB | Exclusive OR with accumulator (absolute)
    LSR $2CF7,X          ; 5E F7 2C | Logical shift right (absolute,X)
    LDA $7A5A            ; AD 5A 7A | Load from absolute address into accumulator
    STA $BC65,Y          ; 99 65 BC | Store accumulator to absolute,Y
    ROR $FF29,X          ; 7E 29 FF | Rotate right (absolute,X)
    LDA                  ; BF AB 5E F7 | Load from absolute long,X into accumulator
    BIT $D92E            ; 2C 2E D9 | Test bits in accumulator (absolute)
    SBC $651A,Y          ; F9 1A 65 | Subtract with carry (absolute,Y)
    LDY $7ECA,X          ; BC CA 7E | Load from absolute,X into Y register
    CLC                  ; 18 | Clear carry flag
    ADC #$F0             ; 69 F0 | Add with carry (immediate)
    BEQ $86              ; F0 86 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $69              ; F0 69 | Branch if equal
    BEQ $0E              ; F0 0E | Branch if equal
    SBC ($06),Y          ; F1 06 | Subtract with carry ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_179
; Address: $E4D1D0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_179:
    SBC $FFFF,Y          ; F9 FF FF | Subtract with carry (absolute,Y)
    BEQ $FF              ; F0 FF | Branch if equal
    SBC $66FF,Y          ; F9 FF 66 | Subtract with carry (absolute,Y)
    BCC $FF              ; 90 FF | Branch if carry clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_17A
; Address: $E4D1DF
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_17A:
    ROR $24              ; 66 24 | Rotate right (zero page)
    BIT $DB              ; 24 DB | Test bits in accumulator (zero page)
    LDA $BD81,X          ; BD 81 BD | Load from absolute,X into accumulator
    ROR $08              ; 66 08 | Rotate right (zero page)
    LDA $D7              ; A5 D7 | Load from zero page into accumulator
    LDA $0074,X          ; BD 74 00 | Load from absolute,X into accumulator
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    BIT $DB              ; 24 DB | Test bits in accumulator (zero page)
    BPL $EF              ; 10 EF | Branch if positive
    STA                  ; 9F 43 79 41 | Store accumulator to absolute long,X
    RTI                  ; 40 | Return from interrupt
    REP #$62             ; C2 62 | Reset processor status bits
    PHX                  ; DA | Push X register to stack
    PHX                  ; DA | Push X register to stack
    JMP $FF7CFF          ; 5C FF 7C FF | Jump to address long
    CPY $FF              ; C4 FF | Compare Y register (zero page)
    ADC $7DFF,X          ; 7D FF 7D | Add with carry (absolute,X)
    INC $FF7C,X          ; FE 7C FF | Increment (absolute,X)
    ADC $10FE,X          ; 7D FE 10 | Add with carry (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    RTI                  ; 40 | Return from interrupt
    SEC                  ; 38 | Set carry flag
    BPL $54              ; 10 54 | Branch if positive
    BPL $14              ; 10 14 | Branch if positive
    PLA                  ; 68 | Pull accumulator from stack
    BVS $45              ; 70 45 | Branch if overflow set
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank48_DmaFunction_17B
; Address: $E4D231
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_17B:
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    JMP ($7C38)          ; 6C 38 7C | Jump to address (absolute indirect)
    SEI                  ; 78 | Set interrupt disable flag
    INC $FEBA,X          ; FE BA FE | Increment (absolute,X)
    DEC $7C              ; C6 7C | Decrement (zero page)
    ROL $66              ; 26 66 | Rotate left (zero page)
    BIT #$DB             ; 89 DB | Test bits in accumulator (immediate)
    CMP #$EF             ; C9 EF | Compare accumulator (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    AND $A4              ; 25 A4 | Logical AND with accumulator (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    STA $4AFF,Y          ; 99 FF 4A | Store accumulator to absolute,Y
    BIT $FF              ; 24 FF | Test bits in accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    BPL $FF              ; 10 FF | Branch if positive
    BIT $FF              ; 24 FF | Test bits in accumulator (zero page)
    PHY                  ; 5A | Push Y register to stack
    ROL $66              ; 26 66 | Rotate left (zero page)
    STA $89BD,X          ; 9D BD 89 | Store accumulator to absolute,X
    CMP ($E7,X)          ; C1 E7 | Compare accumulator ((zero page,X))
    TYA                  ; 98 | Transfer Y register to accumulator
    AND $A4              ; 25 A4 | Logical AND with accumulator (zero page)
    STA $42FF,Y          ; 99 FF 42 | Hardware register operation
    BIT $FF              ; 24 FF | Test bits in accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    BIT $FF              ; 24 FF | Test bits in accumulator (zero page)
    PHY                  ; 5A | Push Y register to stack
    LDA $00FF            ; AD FF 00 | Load from absolute address into accumulator
    STA $6F00,Y          ; 99 00 6F | Store accumulator to absolute,Y
    STA $F606,Y          ; 99 06 F6 | Store accumulator to absolute,Y

;------------------------------------------------------------------------------
; Bank48_DmaFunction_17C
; Address: $E4D28E
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_17C:
    JSR $00F0            ; 20 F0 00 | Jump to subroutine
    STA $FF00,Y          ; 99 00 FF | Store accumulator to absolute,Y
    BCC $F6              ; 90 F6 | Branch if carry clear
    SBC $FFF0,Y          ; F9 F0 FF | Subtract with carry (absolute,Y)
    ADC $F97A,Y          ; 79 7A F9 | Add with carry (absolute,Y)
    PLX                  ; FA | Pull X register from stack
    INC $FA98,X          ; FE 98 FA | Increment (absolute,X)
    SBC $A89E            ; ED 9E A8 | Subtract with carry (absolute)
    LDX #$79             ; A2 79 | Load immediate value into X register
    PLY                  ; 7A | Pull Y register from stack
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    BRA $7F              ; 80 7F | Branch always
    STY $7B              ; 84 7B | Store Y register to zero page
    BRA $7F              ; 80 7F | Branch always
    STY $7B              ; 84 7B | Store Y register to zero page
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    STY $7B              ; 84 7B | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank48_DmaFunction_17D
; Address: $E4D2C4
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_17D:
    LDA $5BAD,Y          ; B9 AD 5B | Load from absolute,Y into accumulator
    ADC ($5D,X)          ; 61 5D | Add with carry ((zero page,X))
    LDA $4A62            ; AD 62 4A | Load from absolute address into accumulator
    LDA $AD52            ; AD 52 AD | Load from absolute address into accumulator
    AND #$D6             ; 29 D6 | Logical AND with accumulator (immediate)
    EOR $BA              ; 45 BA | Exclusive OR with accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 29 D6 52 | Load from absolute long,X into accumulator
    LDA $AD52            ; AD 52 AD | Load from absolute address into accumulator
    LDA                  ; BF 00 01 FD | Load from absolute long,X into accumulator
    AND $F980,X          ; 3D 80 F9 | Logical AND with accumulator (absolute,X)
    ORA ($7D,X)          ; 01 7D | Logical OR with accumulator ((zero page,X))
    ORA ($55,X)          ; 01 55 | Logical OR with accumulator ((zero page,X))
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    INC $FE7F,X          ; FE 7F FE | Increment (absolute,X)
    STX $FF              ; 86 FF | Store X register to zero page
    TAX                  ; AA | Transfer accumulator to X register
    TAX                  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank48_DmaFunction_17E
; Address: $E4D300
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_17E:
    JSR $80A3            ; 20 A3 80 | Jump to subroutine
    ORA $7DFF            ; 0D FF 7D | Logical OR with accumulator (absolute)
    INC $EA              ; E6 EA | Increment (zero page)
    ADC #$D7             ; 69 D7 | Add with carry (immediate)
    INC $FF7D,X          ; FE 7D FF | Increment (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ADC $FFFE,X          ; 7D FE FF | Add with carry (absolute,X)
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    LDA $89              ; A5 89 | Load from zero page into accumulator
    STA ($E7,X)          ; 81 E7 | Store accumulator to (zero page,X)
    TXS                  ; 9A | Transfer X register to stack pointer
    CMP $AC2D,Y          ; D9 2D AC | Compare accumulator (absolute,Y)
    ORA $5AFF            ; 0D FF 5A | Logical OR with accumulator (absolute)
    BIT $FF              ; 24 FF | Test bits in accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    BIT $FF              ; 24 FF | Test bits in accumulator (zero page)
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    PLB                  ; AB | Pull data bank register from stack
    XBA                  ; EB | Exchange accumulator bytes
    TXA                  ; 8A | Transfer X register to accumulator
    CMP ($F7),Y          ; D1 F7 | Compare accumulator ((zero page),Y)
    TYA                  ; 98 | Transfer Y register to accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BIT $FF              ; 24 FF | Test bits in accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    BIT $FF              ; 24 FF | Test bits in accumulator (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank48_DmaFunction_17F
; Address: $E4D361
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_17F:
    PLX                  ; FA | Pull X register from stack
    LDA $29FA,Y          ; B9 FA 29 | Load from absolute,Y into accumulator
    PHY                  ; 5A | Push Y register to stack
    ADC ($0A),Y          ; 71 0A | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_180
; Address: $E4D368
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_180:
    JSR $FC22            ; 20 22 FC | Jump to subroutine
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always

;------------------------------------------------------------------------------
; Bank48_DmaFunction_181
; Address: $E4D378
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_181:
    JSR $00DE            ; 20 DE 00 | Jump to subroutine
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    STY $00              ; 84 00 | Store Y register to zero page
    BRA $00              ; 80 00 | Branch always
    LDY #$00             ; A0 00 | Load immediate value into Y register
    PLY                  ; 7A | Pull Y register from stack
    ASL $05              ; 06 05 | Arithmetic shift left (zero page)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ADC $0400,X          ; 7D 00 04 | Add with carry (absolute,X)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $0A00,X          ; 1D 00 0A | Logical OR with accumulator (absolute,X)
    ASL $3E7E,X          ; 1E 7E 3E | Arithmetic shift left (absolute,X)
    BEQ $70              ; F0 70 | Branch if equal
    CMP ($01,X)          ; C1 01 | Compare accumulator ((zero page,X))
    STZ $2EAE            ; 9C AE 2E | Store zero to absolute
    BMI $0F              ; 30 0F | Branch if negative
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    STA $00FE00          ; 8F 00 FE 00 | Store accumulator to absolute long address
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    SBC $9DE1            ; ED E1 9D | Subtract with carry (absolute)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PHX                  ; DA | Push X register to stack
    DEC $F0D1,X          ; DE D1 F0 | Decrement (absolute,X)
    SBC ($F5),Y          ; F1 F5 | Subtract with carry ((zero page),Y)
    ASL $3000,X          ; 1E 00 30 | Arithmetic shift left (absolute,X)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    EOR #$B4             ; 49 B4 | Exclusive OR with accumulator (immediate)
    BCC $3F              ; 90 3F | Branch if carry clear
    STA $7F8017          ; 8F 17 80 7F | Store accumulator to absolute long address
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    BEQ $00              ; F0 00 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    SBC $FB6D            ; ED 6D FB | Subtract with carry (absolute)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_182
; Address: $E4D424
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_182:
    CMP ($71),Y          ; D1 71 | Compare accumulator ((zero page),Y)
    SEP #$60             ; E2 60 | Set processor status bits
    RTI                  ; 40 | Return from interrupt
    CPY $B900            ; CC 00 B9 | Compare Y register (absolute)
    LSR $92              ; 46 92 | Logical shift right (zero page)
    BRA $00              ; 80 00 | Branch always
    STX $9F00            ; 8E 00 9F | Store X register to absolute address
    LDA                  ; BF 00 FF 00 | Load from absolute long,X into accumulator
    LDA $AE00,Y          ; B9 00 AE | Load from absolute,Y into accumulator
    LDA $00DB51          ; AF 51 DB 00 | Load from absolute long address into accumulator
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    LDY $ED34,X          ; BC 34 ED | Load from absolute,X into Y register
    RTI                  ; 40 | Return from interrupt
    DEC $43              ; C6 43 | Decrement (zero page)
    BVC $00              ; 50 00 | Branch if overflow clear
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    LDA                  ; BF 00 FE 01 | Load from absolute long,X into accumulator
    PHX                  ; DA | Push X register to stack
    PHA                  ; 48 | Push accumulator to stack
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    ORA ($7D,X)          ; 01 7D | Logical OR with accumulator ((zero page,X))
    LDA #$2E             ; A9 2E | Load immediate value into accumulator
    PLY                  ; 7A | Pull Y register from stack
    STY $B1              ; 84 B1 | Store Y register to zero page
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    CMP $1F36,Y          ; D9 36 1F | Compare accumulator (absolute,Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_183
; Address: $E4D485
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_183:
    STA $403F90          ; 8F 90 3F 40 | Store accumulator to absolute long address
    INC $F781,X          ; FE 81 F7 | Increment (absolute,X)
    AND #$FD             ; 29 FD | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_185
; Address: $E4D497
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_185:
    JSR $817E            ; 20 7E 81 | Jump to subroutine
    ORA #$FD             ; 09 FD | Logical OR with accumulator (immediate)
    LDA $06D933          ; AF 33 D9 06 | Load from absolute long address into accumulator
    ROR $2980,X          ; 7E 80 29 | Rotate right (absolute,X)
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    AND $4C86,Y          ; 39 86 4C | Logical AND with accumulator (absolute,Y)
    ROR $BB00,X          ; 7E 00 BB | Rotate right (absolute,X)
    DEC $7A39,X          ; DE 39 7A | Decrement (absolute,X)
    INC $65DD,X          ; FE DD 65 | Increment (absolute,X)
    LSR $02              ; 46 02 | Logical shift right (zero page)
    INC                  ; 1A | Increment accumulator
    CPY $EC1F            ; CC 1F EC | Compare Y register (absolute)
    BMI $23              ; 30 23 | Branch if negative
    BCC $FD              ; 90 FD | Branch if carry clear
    BCS $C9              ; B0 C9 | Branch if carry set
    PLX                  ; FA | Pull X register from stack
    BEQ $03              ; F0 03 | Branch if equal
    BMI $1F              ; 30 1F | Branch if negative

;------------------------------------------------------------------------------
; Bank48_DmaFunction_187
; Address: $E4D4EA
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_187:
    EOR ($07),Y          ; 51 07 | Exclusive OR with accumulator ((zero page),Y)
    BMI $93              ; 30 93 | Branch if negative
    BPL $08              ; 10 08 | Branch if positive
    SEI                  ; 78 | Set interrupt disable flag
    BNE $E0              ; D0 E0 | Game work RAM access
    SEC                  ; 38 | Set carry flag
    BNE $CC              ; D0 CC | Branch if not equal
    SEC                  ; 38 | Set carry flag
    BIT $18D8            ; 2C D8 18 | Test bits in accumulator (absolute)
    PEA #$EC72           ; F4 72 EC | Push effective address to stack
    PHP                  ; 08 | Push processor status to stack
    STA $1068,Y          ; 99 68 10 | Store accumulator to absolute,Y
    INX                  ; E8 | Increment X register
    PEA #$F400           ; F4 00 F4 | Push effective address to stack
    CPX $1E00            ; EC 00 1E | Compare X register (absolute)
    INC $F700,X          ; FE 00 F7 | Increment (absolute,X)
    BCS $1C              ; B0 1C | Branch if carry set
    TAY                  ; A8 | Transfer accumulator to Y register
    STA $4F19,Y          ; 99 19 4F | Store accumulator to absolute,Y
    AND ($40),Y          ; 31 40 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_188
; Address: $E4D52B
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_188:
    JSR $1A05            ; 20 05 1A | Jump to subroutine
    ORA $E3              ; 05 E3 | Logical OR with accumulator (zero page)
    BNE $00              ; D0 00 | Branch if not equal
    INC $00              ; E6 00 | Increment (zero page)
    BVS $00              ; 70 00 | Branch if overflow set
    PEA #$6A11           ; F4 11 6A | Push effective address to stack
    SBC ($06,X)          ; E1 06 | Subtract with carry ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    EOR ($38,X)          ; 41 38 | Exclusive OR with accumulator ((zero page,X))
    NOP                  ; EA | No operation

;------------------------------------------------------------------------------
; Bank48_DmaFunction_189
; Address: $E4D54C
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_189:
    JSR $00D8            ; 20 D8 00 | Jump to subroutine
    CPX #$EF             ; E0 EF | Compare X register (immediate)
    LDA                  ; BF 00 FE 00 | Load from absolute long,X into accumulator
    INC $F800,X          ; FE 00 F8 | Increment (absolute,X)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ASL $25              ; 06 25 | Arithmetic shift left (zero page)
    EOR ($71),Y          ; 51 71 | Exclusive OR with accumulator ((zero page),Y)
    ROR                  ; 6A | Rotate right (accumulator)
    AND $022E            ; 2D 2E 02 | Logical AND with accumulator (absolute)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ADC ($71),Y          ; 71 71 | Add with carry ((zero page),Y)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank48_DmaFunction_18D
; Address: $E4D58A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_18D:
    CPX $E4              ; E4 E4 | Compare X register (zero page)
    LDY #$E0             ; A0 E0 | Game work RAM access
    PEA #$0000           ; F4 00 00 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank48_DmaFunction_191
; Address: $E4D59A
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_191:
    CPX $E4              ; E4 E4 | Compare X register (zero page)
    CPX #$E0             ; E0 E0 | Game work RAM access
    PEA #$FFF4           ; F4 F4 FF | Push effective address to stack
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    INC                  ; 1A | Increment accumulator
    AND $6229,Y          ; 39 29 62 | Logical AND with accumulator (absolute,Y)
    TSX                  ; BA | Transfer stack pointer to X register
    LDA $B7F7FE          ; AF FE F7 B7 | Load from absolute long address into accumulator
    SED                  ; F8 | Set decimal mode flag
    LDX $00FF,Y          ; BE FF 00 | Load from absolute,Y into X register
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    ASL $3F              ; 06 3F | Arithmetic shift left (zero page)
    PLP                  ; 28 | Pull processor status from stack
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 00 BF 00 | Load from absolute long,X into accumulator
    LDY #$60             ; A0 60 | Load immediate value into Y register
    CLI                  ; 58 | Clear interrupt disable flag
    PLA                  ; 68 | Pull accumulator from stack
    PEA #$FCB6           ; F4 B6 FC | Push effective address to stack
    AND $BAF5            ; 2D F5 BA | Logical AND with accumulator (absolute)
    SBC $B951            ; ED 51 B9 | Subtract with carry (absolute)
    SEP #$00             ; E2 00 | Set processor status bits
    CPX #$80             ; E0 80 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SBC $FC03,X          ; FD 03 FC | Subtract with carry (absolute,X)
    ASL $FB              ; 06 FB | Arithmetic shift left (zero page)
    ORA $DDE7,X          ; 1D E7 DD | Logical OR with accumulator (absolute,X)
    LDA $BF3A,X          ; BD 3A BF | Load from absolute,X into accumulator
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    ASL $010C            ; 0E 0C 01 | Arithmetic shift left (absolute)
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    BEQ $C2              ; F0 C2 | Branch if equal
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_192
; Address: $E4D618
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_192:
    BVS $47              ; 70 47 | Branch if overflow set
    AND $1330            ; 2D 30 13 | Logical AND with accumulator (absolute)
    ORA $0706,X          ; 1D 06 07 | Logical OR with accumulator (absolute,X)
    STZ $EC8D,X          ; 9E 8D EC | Store zero to absolute,X
    SBC $FD6C,X          ; FD 6C FD | Subtract with carry (absolute,X)
    CLI                  ; 58 | Clear interrupt disable flag
    PHX                  ; DA | Push X register to stack
    CPY $C0              ; C4 C0 | Compare Y register (zero page)
    CLI                  ; 58 | Clear interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    BNE $50              ; D0 50 | Branch if not equal

;------------------------------------------------------------------------------
; Bank48_DmaFunction_193
; Address: $E4D62E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_193:
    BRA $80              ; 80 80 | Branch always
    ROL $F8              ; 26 F8 | Rotate left (zero page)
    ROL $F4E2,X          ; 3E E2 F4 | Rotate left (absolute,X)
    TAY                  ; A8 | Transfer accumulator to Y register
    SEI                  ; 78 | Set interrupt disable flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_194
; Address: $E4D63F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_194:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank48_DmaFunction_195
; Address: $E4D652
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_195:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    INC $FA03,X          ; FE 03 FA | Increment (absolute,X)
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDA ($A4,X)          ; A1 A4 | Load from (zero page,X) into accumulator
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank48_DmaFunction_196
; Address: $E4D687
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_196:
    SBC ($04,X)          ; E1 04 | Subtract with carry ((zero page,X))
    CPX #$0A             ; E0 0A | Compare X register (immediate)
    LSR                  ; 4A | Logical shift right (accumulator)
    LDX $8E              ; A6 8E | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank48_DmaFunction_197
; Address: $E4D68E
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_197:
    JSR $2624            ; 20 24 26 | Jump to subroutine
    LDY $00              ; A4 00 | Load from zero page into Y register
    EOR ($00),Y          ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
    INC                  ; 1A | Increment accumulator
    ASL $1400            ; 0E 00 14 | Arithmetic shift left (absolute)
    BMI $00              ; 30 00 | Branch if negative
    TYA                  ; 98 | Transfer Y register to accumulator
    SBC ($73),Y          ; F1 73 | Subtract with carry ((zero page),Y)
    AND $C47B,Y          ; 39 7B C4 | Logical AND with accumulator (absolute,Y)
    WDM #$FF             ; 42 FF | Reserved instruction
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    STA $8C00            ; 8D 00 8C | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank48_DmaFunction_198
; Address: $E4D6BC
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_198:
    STY $00              ; 84 00 | Store Y register to zero page
    LDA $8800,X          ; BD 00 88 | Load from absolute,X into accumulator
    ORA $CF              ; 05 CF | Logical OR with accumulator (zero page)
    DEC $04CE            ; CE CE 04 | Decrement (absolute)
    BPL $FF              ; 10 FF | Branch if positive
    BMI $00              ; 30 00 | Branch if negative
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    CLI                  ; 58 | Clear interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    BVC $73              ; 50 73 | Branch if overflow clear
    CLI                  ; 58 | Clear interrupt disable flag
    SEC                  ; 38 | Set carry flag
    BVS $5B              ; 70 5B | Branch if overflow set
    LDY $50              ; A4 50 | Load from zero page into Y register
    LDA $8FA758          ; AF 58 A7 8F | Load from absolute long address into accumulator
    BEQ $00              ; F0 00 | Branch if equal
    LDA                  ; BF 3F 3F FF | Load from absolute long,X into accumulator
    BRA $3F              ; 80 3F | Branch always
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY $42              ; C4 42 | Hardware register operation
    DEC                  ; 3A | Decrement accumulator
    PLY                  ; 7A | Pull Y register from stack
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    AND ($73),Y          ; 31 73 | Logical AND with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    PLY                  ; 7A | Pull Y register from stack
    LDA $8D00,X          ; BD 00 8D | Load from absolute,X into accumulator
    STA $00              ; 85 00 | Store accumulator to zero page
    STY $8D00            ; 8C 00 8D | Store Y register to absolute address
    STA $00              ; 85 00 | Store accumulator to zero page
    STA $8E00            ; 8D 00 8E | Store accumulator to absolute address
    DEC $B9B9            ; CE B9 B9 | Decrement (absolute)
    LDA ($A9,X)          ; A1 A9 | Load from (zero page,X) into accumulator
    SBC $FC74,X          ; FD 74 FC | Subtract with carry (absolute,X)
    STA                  ; 9F 9F 84 84 | Store accumulator to absolute long,X
    ADC ($75,X)          ; 61 75 | Add with carry ((zero page,X))
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_199
; Address: $E4D77E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_199:
    TXA                  ; 8A | Transfer X register to accumulator
    CPY #$BC             ; C0 BC | Compare Y register (immediate)
    CPX $5490            ; EC 90 54 | Compare X register (absolute)
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    SED                  ; F8 | Set decimal mode flag
    BCC $6C              ; 90 6C | Branch if carry clear
    TAY                  ; A8 | Transfer accumulator to Y register
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank48_DmaFunction_19A
; Address: $E4D796
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_19A:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    EOR $535E,X          ; 5D 5E 53 | Exclusive OR with accumulator (absolute,X)
    ORA ($09),Y          ; 11 09 | Logical OR with accumulator ((zero page),Y)
    AND $8938,Y          ; 39 38 89 | Logical AND with accumulator (absolute,Y)
    SBC #$C0             ; E9 C0 | Subtract with carry (immediate)
    LDY $0000            ; AC 00 00 | Load from absolute address into Y register
    CPX $FE25            ; EC 25 FE | Compare X register (absolute)
    CLI                  ; 58 | Clear interrupt disable flag
    ORA ($FE),Y          ; 11 FE | Logical OR with accumulator ((zero page),Y)
    JMP ($FF6C)          ; 6C 6C FF | Jump to address (absolute indirect)
    STZ $FF              ; 64 FF | Store zero to zero page
    ORA $9199,Y          ; 19 99 91 | Logical OR with accumulator (absolute,Y)
    BIT #$FD             ; 89 FD | Test bits in accumulator (immediate)
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    STZ $1D              ; 64 1D | Store zero to zero page
    INC $81              ; E6 81 | Increment (zero page)
    ROR $FF00,X          ; 7E 00 FF | Rotate right (absolute,X)
    CPY $FFFF            ; CC FF FF | Compare Y register (absolute)
    PHP                  ; 08 | Push processor status to stack
    JMP $4CB3            ; 4C B3 4C | Jump to address
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA #$79             ; A9 79 | Load immediate value into accumulator
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    STX $BE              ; 86 BE | Store X register to zero page
    LSR $937F,X          ; 5E 7F 93 | Logical shift right (absolute,X)
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    INC $C100,X          ; FE 00 C1 | Increment (absolute,X)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    REP #$C5             ; C2 C5 | Reset processor status bits
    SBC $C0              ; E5 C0 | Subtract with carry (zero page)
    DEC $1E6E            ; CE 6E 1E | Decrement (absolute)
    CMP #$EF             ; C9 EF | Compare accumulator (immediate)
    STA $F4              ; 85 F4 | Store accumulator to zero page
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank48_DmaFunction_19B
; Address: $E4D83A
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_19B:
    JSR $1000            ; 20 00 10 | Jump to subroutine
    CPY #$3C             ; C0 3C | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    TAY                  ; A8 | Transfer accumulator to Y register
    BCC $30              ; 90 30 | Branch if carry clear
    PHP                  ; 08 | Push processor status to stack
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    STY $C8              ; 84 C8 | Store Y register to zero page
    BVC $00              ; 50 00 | Branch if overflow clear
    INY                  ; C8 | Increment Y register
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank48_DmaFunction_19C
; Address: $E4D862
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_19C:
    ROL $762E            ; 2E 2E 76 | Rotate left (absolute)
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    EOR ($00),Y          ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    BPL $10              ; 10 10 | Branch if positive
    SEC                  ; 38 | Set carry flag
    BPL $28              ; 10 28 | Branch if positive
    BPL $28              ; 10 28 | Branch if positive
    BPL $6C              ; 10 6C | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    BPL $7C              ; 10 7C | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    INC $6C00,X          ; FE 00 6C | Increment (absolute,X)
    ORA $541D            ; 0D 1D 54 | Logical OR with accumulator (absolute)
    ROR $7E08,X          ; 7E 08 7E | Rotate right (absolute,X)
    ORA $130D            ; 0D 0D 13 | Logical OR with accumulator (absolute)
    ADC $FE98,X          ; 7D 98 FE | Add with carry (absolute,X)
    JMP ($7200)          ; 6C 00 72 | Jump to address (absolute indirect)
    JMP ($0200)          ; 6C 00 02 | Jump to address (absolute indirect)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    LDY $47BD            ; AC BD 47 | Load from absolute address into Y register
    AND ($DE,X)          ; 21 DE | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank48_DmaFunction_19D
; Address: $E4D8CC
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_19D:
    JSR $0093            ; 20 93 00 | Jump to subroutine
    BVS $00              ; 70 00 | Branch if overflow set
    CLV                  ; B8 | Clear overflow flag
    CPX $FA00            ; EC 00 FA | Compare X register (absolute)
    BVS $00              ; 70 00 | Branch if overflow set
    CMP ($A0,X)          ; C1 A0 | Compare accumulator ((zero page,X))
    STA $006A,X          ; 9D 6A 00 | Store accumulator to absolute,X
    DEY                  ; 88 | Decrement Y register
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    STA $0C00            ; 8D 00 0C | Store accumulator to absolute address
    BVS $70              ; 70 70 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PLY                  ; 7A | Pull Y register from stack
    PLY                  ; 7A | Pull Y register from stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA $00              ; 85 00 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank48_DmaFunction_19E
; Address: $E4D920
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_19E:
    BPL $28              ; 10 28 | Branch if positive
    BPL $28              ; 10 28 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    BPL $00              ; 10 00 | Branch if positive
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BCC $F8              ; 90 F8 | Branch if carry clear
    BIT #$FB             ; 89 FB | Test bits in accumulator (immediate)
    STA                  ; 9F 01 00 06 | Store accumulator to absolute long,X
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1A0
; Address: $E4D961
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1A0:
    STA ($1D,X)          ; 81 1D | Store accumulator to (zero page,X)
    BRA $B0              ; 80 B0 | Branch always
    ORA ($A6,X)          ; 01 A6 | Logical OR with accumulator ((zero page,X))
    ORA $8039,Y          ; 19 39 80 | Logical OR with accumulator (absolute,Y)
    LDX $0111            ; AE 11 01 | Load from absolute address into X register
    PHB                  ; 8B | Push data bank register to stack
    ORA $1904            ; 0D 04 19 | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    ASL $0007,X          ; 1E 07 00 | Arithmetic shift left (absolute,X)
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BNE $00              ; D0 00 | Branch if not equal
    INX                  ; E8 | Increment X register
    BCC $88              ; 90 88 | Branch if carry clear
    RTI                  ; 40 | Return from interrupt
    BMI $00              ; 30 00 | Branch if negative
    CPX #$0C             ; E0 0C | Compare X register (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ROR $C17E,X          ; 7E 7E C1 | Rotate right (absolute,X)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ASL $81              ; 06 81 | Arithmetic shift left (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    STA $FF68            ; 8D 68 FF | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1A1
; Address: $E4D9E5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1A1:
    STZ $C2              ; 64 C2 | Store zero to zero page
    CPX $FC              ; E4 FC | Compare X register (zero page)
    CLD                  ; D8 | Clear decimal mode flag
    PHB                  ; 8B | Push data bank register to stack
    CLI                  ; 58 | Clear interrupt disable flag
    CLI                  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1A2
; Address: $E4D9F0
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1A2:
    JSL $000000          ; 22 00 00 00 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    BCC $90              ; 90 90 | Branch if carry clear
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    BPL $38              ; 10 38 | Branch if positive
    BPL $80              ; 10 80 | Branch if positive
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1A3
; Address: $E4DA14
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1A3:
    JSR $1000            ; 20 00 10 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    BPL $04              ; 10 04 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA $0A              ; 05 0A | Logical OR with accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    INY                  ; C8 | Increment Y register
    SEC                  ; 38 | Set carry flag
    BEQ $18              ; F0 18 | Branch if equal
    BNE $24              ; D0 24 | Branch if not equal
    PLA                  ; 68 | Pull accumulator from stack
    CLD                  ; D8 | Clear decimal mode flag
    CPY $30              ; C4 30 | Compare Y register (zero page)
    CPX #$18             ; E0 18 | Compare X register (immediate)
    BRA $70              ; 80 70 | Branch always
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $FC              ; F0 FC | Branch if equal
    CPX #$FC             ; E0 FC | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    PLY                  ; 7A | Pull Y register from stack
    STA ($A0,X)          ; 81 A0 | Store accumulator to (zero page,X)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    REP #$C2             ; C2 C2 | Reset processor status bits
    ROR $4A              ; 66 4A | Rotate right (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    EOR ($7C),Y          ; 51 7C | Exclusive OR with accumulator ((zero page),Y)
    SBC $3D00,Y          ; F9 00 3D | Subtract with carry (absolute,Y)
    STA $B500,Y          ; 99 00 B5 | Store accumulator to absolute,Y
    ASL $00E0,X          ; 1E E0 00 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1A4
; Address: $E4DAB0
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1A4:
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    PHA                  ; 48 | Push accumulator to stack
    BNE $A1              ; D0 A1 | Branch if not equal
    LDA $FBBB,Y          ; B9 BB FB | Load from absolute,Y into accumulator
    CMP $F5BA            ; CD BA F5 | Compare accumulator (absolute)
    TXA                  ; 8A | Transfer X register to accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LSR $0400,X          ; 5E 00 04 | Logical shift right (absolute,X)
    BRA $00              ; 80 00 | Branch always
    ADC $0A00            ; 6D 00 0A | Add with carry (absolute)
    ORA $0F04,X          ; 1D 04 0F | Logical OR with accumulator (absolute,X)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($13,X)          ; 01 13 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BVC $B8              ; 50 B8 | Branch if overflow clear
    LDY #$78             ; A0 78 | Load immediate value into Y register
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    BRA $60              ; 80 60 | Branch always
    BRA $20              ; 80 20 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1A5
; Address: $E4DB2D
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1A5:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $C8              ; 80 C8 | Branch always
    BMI $18              ; 30 18 | Branch if negative
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ASL $010D            ; 0E 0D 01 | Arithmetic shift left (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1A6
; Address: $E4DB62
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1A6:
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BPL $10              ; 10 10 | Branch if positive
    BVC $50              ; 50 50 | Branch if overflow clear
    BNE $D0              ; D0 D0 | Branch if not equal
    BVS $F0              ; 70 F0 | Branch if overflow set
    TAY                  ; A8 | Transfer accumulator to Y register
    SEI                  ; 78 | Set interrupt disable flag
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BPL $10              ; 10 10 | Branch if positive
    BVC $50              ; 50 50 | Branch if overflow clear
    BNE $D0              ; D0 D0 | Branch if not equal
    BEQ $F0              ; F0 F0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    EOR $ED0D,X          ; 5D 0D ED | Exclusive OR with accumulator (absolute,X)
    EOR #$41             ; 49 41 | Exclusive OR with accumulator (immediate)
    ASL $7FE0,X          ; 1E E0 7F | Arithmetic shift left (absolute,X)
    BNE $6F              ; D0 6F | Branch if not equal
    AND $40D0            ; 2D D0 40 | Logical AND with accumulator (absolute)
    STA                  ; 9F 00 BF 00 | Store accumulator to absolute long,X
    STA                  ; 9F 00 9F 00 | Store accumulator to absolute long,X
    LDA                  ; BF 00 B4 CD | Load from absolute long,X into accumulator
    STX $FF              ; 86 FF | Store X register to zero page
    EOR $667D,Y          ; 59 7D 66 | Exclusive OR with accumulator (absolute,Y)
    ROR $B4B3,X          ; 7E B3 B4 | Rotate right (absolute,X)
    DEC $A849            ; CE 49 A8 | Decrement (absolute)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    JMP $B100            ; 4C 00 B1 | Jump to address
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $9F              ; F0 9F | Branch if equal
    EOR $9EB2            ; 4D B2 9E | Exclusive OR with accumulator (absolute)
    SBC ($CD,X)          ; E1 CD | Subtract with carry ((zero page,X))
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    LDA $0647,Y          ; B9 47 06 | Load from absolute,Y into accumulator
    PHP                  ; 08 | Push processor status to stack
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    ROL $3E              ; 26 3E | Rotate left (zero page)
    LDA $BEC3,X          ; BD C3 BE | Load from absolute,X into accumulator
    CMP ($94,X)          ; C1 94 | Compare accumulator ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1A7
; Address: $E4DBE8
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1A7:
    LDA ($7F,X)          ; A1 7F | Load from (zero page,X) into accumulator
    ADC $BE83,X          ; 7D 83 BE | Add with carry (absolute,X)
    EOR ($18,X)          ; 41 18 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1A8
; Address: $E4DBF2
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1A8:
    RTI                  ; 40 | Return from interrupt
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    TYA                  ; 98 | Transfer Y register to accumulator
    RTI                  ; 40 | Return from interrupt
    ORA #$0F             ; 09 0F | Logical OR with accumulator (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $9F              ; F0 9F | Branch if equal
    STA $9EF2            ; 8D F2 9E | Store accumulator to absolute address
    SBC ($4D,X)          ; E1 4D | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1A9
; Address: $E4DC0C
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1A9:
    JSL $C7FD3D          ; 22 3D FD C7 | Jump to subroutine long
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    BCC $00              ; 90 00 | Branch if carry clear
    RTI                  ; 40 | Return from interrupt
    BIT $BE3C            ; 2C 3C BE | Test bits in accumulator (absolute)
    REP #$BD             ; C2 BD | Reset processor status bits
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1AB
; Address: $E4DC2E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1AB:
    LDX $1040,Y          ; BE 40 10 | Load from absolute,Y into X register
    RTI                  ; 40 | Return from interrupt
    PHA                  ; 48 | Push accumulator to stack
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    STZ $0000,X          ; 9E 00 00 | Store zero to absolute,X
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1AD
; Address: $E4DC4A
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1AD:
    JSR $08BF            ; 20 BF 08 | Jump to subroutine
    DEX                  ; CA | Decrement X register
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    LDA ($00,X)          ; A1 00 | Load from (zero page,X) into accumulator
    BMI $00              ; 30 00 | Branch if negative
    CPY $FE8A            ; CC 8A FE | Compare Y register (absolute)
    STX $347E            ; 8E 7E 34 | Store X register to absolute address
    CMP $03FF            ; CD FF 03 | Compare accumulator (absolute)
    SBC $4907,Y          ; F9 07 49 | Subtract with carry (absolute,Y)
    LDA                  ; BF 03 00 01 | Load from absolute long,X into accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    ASL $3F              ; 06 3F | Arithmetic shift left (zero page)
    DEC                  ; 3A | Decrement accumulator
    CMP $FF86            ; CD 86 FF | Compare accumulator (absolute)
    EOR $667D,Y          ; 59 7D 66 | Exclusive OR with accumulator (absolute,Y)
    ROR $B4B3,X          ; 7E B3 B4 | Rotate right (absolute,X)
    DEC $A849            ; CE 49 A8 | Decrement (absolute)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1AE
; Address: $E4DCB8
; Size: 110 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1AE:
    JMP $B100            ; 4C 00 B1 | Jump to address
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLI                  ; 58 | Clear interrupt disable flag
    LDA                  ; BF A5 FB C3 | Load from absolute long,X into accumulator
    JMP $9ECD            ; 4C CD 9E | Jump to address
    JMP $A2F961          ; 5C 61 F9 A2 | Jump to address long
    LSR                  ; 4A | Logical shift right (accumulator)
    LDA $00              ; A5 00 | Load from zero page into accumulator
    BIT $B200            ; 2C 00 B2 | Test bits in accumulator (absolute)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    EOR $FF86            ; 4D 86 FF | Exclusive OR with accumulator (absolute)
    EOR $267D,Y          ; 59 7D 26 | Exclusive OR with accumulator (absolute,Y)
    ROL $1413,X          ; 3E 13 14 | Rotate left (absolute,X)
    LSR $A849            ; 4E 49 A8 | Logical shift right (absolute)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    JMP ($B100)          ; 6C 00 B1 | Jump to address (absolute indirect)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLI                  ; 58 | Clear interrupt disable flag
    LDX $FEA2,Y          ; BE A2 FE | Load from absolute,Y into X register
    CPY $FC              ; C4 FC | Compare Y register (zero page)
    EOR #$C9             ; 49 C9 | Exclusive OR with accumulator (immediate)
    LSR $FE62,X          ; 5E 62 FE | Logical shift right (absolute,X)
    LDX $FE              ; A6 FE | Load from zero page into X register
    LSR                  ; 4A | Logical shift right (accumulator)
    LDA $00              ; A5 00 | Load from zero page into accumulator
    EOR ($00),Y          ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    TAX                  ; AA | Transfer accumulator to X register
    SEI                  ; 78 | Set interrupt disable flag
    INC $B5F1,X          ; FE F1 B5 | Increment (absolute,X)
    PHX                  ; DA | Push X register to stack
    CPY $10F3            ; CC F3 10 | Compare Y register (absolute)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    WDM #$00             ; 42 00 | Reserved instruction
    BPL $00              ; 10 00 | Branch if positive
    STX $5CFE            ; 8E FE 5C | Store X register to absolute address
    DEC $FF33,X          ; DE 33 FF | Decrement (absolute,X)
    BIT $52DC            ; 2C DC 52 | Test bits in accumulator (absolute)
    LDX $17E9            ; AE E9 17 | Load from absolute address into X register
    STZ $00              ; 64 00 | Store zero to zero page
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    LDA ($00,X)          ; A1 00 | Load from (zero page,X) into accumulator
    BIT $FB              ; 24 FB | Test bits in accumulator (zero page)
    BMI $FF              ; 30 FF | Branch if negative

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1AF
; Address: $E4DD64
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1AF:
    BMI $FF              ; 30 FF | Branch if negative
    SBC $F906,Y          ; F9 06 F9 | Subtract with carry (absolute,Y)
    SBC $E718,X          ; FD 18 E7 | Subtract with carry (absolute,X)
    ASL $26FF            ; 0E FF 26 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1B0
; Address: $E4DD75
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1B0:
    JSR $00F9            ; 20 F9 00 | Jump to subroutine
    SBC $FD00,Y          ; F9 00 FD | Subtract with carry (absolute,Y)
    SEC                  ; 38 | Set carry flag
    PHY                  ; 5A | Push Y register to stack
    BRA $63              ; 80 63 | Branch always
    BCC $B9              ; 90 B9 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1B1
; Address: $E4DD85
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1B1:
    JSL $33804E          ; 22 4E 80 33 | Jump to subroutine long
    CPY $04DB            ; CC DB 04 | Compare Y register (absolute)
    JMP $00B3            ; 4C B3 00 | Jump to address
    STX $89              ; 86 89 | Store X register to zero page
    ORA $62D2            ; 0D D2 62 | Logical OR with accumulator (absolute)
    SBC $FFB3,X          ; FD B3 FF | Subtract with carry (absolute,X)
    TAX                  ; AA | Transfer accumulator to X register
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    BVS $00              ; 70 00 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1B2
; Address: $E4DDB8
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1B2:
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BCS $00              ; B0 00 | Branch if carry set
    DEX                  ; CA | Decrement X register
    ORA $D9DB,X          ; 1D DB D9 | Logical OR with accumulator (absolute,X)
    LDA #$EF             ; A9 EF | Load immediate value into accumulator
    INC $89CF            ; EE CF 89 | Increment (absolute)
    SBC $0034,Y          ; F9 34 00 | Subtract with carry (absolute,Y)
    SEP #$00             ; E2 00 | Set processor status bits
    ROL $00              ; 26 00 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1B3
; Address: $E4DDDA
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1B3:
    JSR $3100            ; 20 00 31 | Jump to subroutine
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PLB                  ; AB | Pull data bank register from stack
    ORA #$0D             ; 09 0D | Logical OR with accumulator (immediate)
    ADC $7F33,X          ; 7D 33 7F | Add with carry (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BCS $00              ; B0 00 | Branch if carry set
    CMP #$C8             ; C9 C8 | Compare accumulator (immediate)
    ORA $D8DA,X          ; 1D DA D8 | Logical OR with accumulator (absolute,X)
    INC $A8              ; E6 A8 | Increment (zero page)
    INC $DE5E            ; EE 5E DE | Increment (absolute)
    SBC $8ACC            ; ED CC 8A | Subtract with carry (absolute)
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1B4
; Address: $E4DE12
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1B4:
    SEP #$00             ; E2 00 | Set processor status bits
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1B5
; Address: $E4DE25
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1B5:
    STA                  ; 9F 55 AA 26 | Store accumulator to absolute long,X
    CMP $AA55,Y          ; D9 55 AA | Compare accumulator (absolute,Y)
    CPX $1B              ; E4 1B | Compare X register (zero page)
    BEQ $00              ; F0 00 | Branch if equal
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    CPX $B54A            ; EC 4A B5 | Compare X register (absolute)
    PHY                  ; 5A | Push Y register to stack
    LDA $9B              ; A5 9B | Load from zero page into accumulator
    JMP $001BCA          ; 5C CA 1B 00 | Jump to address long
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1B6
; Address: $E4DE5C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1B6:
    JSR $2400            ; 20 00 24 | Jump to subroutine
    ROL $1EFF,X          ; 3E FF 1E | Rotate left (absolute,X)
    ASL $06FF            ; 0E FF 06 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1B7
; Address: $E4DE68
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1B7:
    JSR $26DF            ; 20 DF 26 | Jump to subroutine
    CMP $F906,Y          ; D9 06 F9 | Compare accumulator (absolute,Y)
    BIT $FF              ; 24 FF | Test bits in accumulator (zero page)
    BMI $FF              ; 30 FF | Branch if negative
    BMI $F9              ; 30 F9 | Branch if negative
    BMI $F9              ; 30 F9 | Branch if negative
    BMI $FF              ; 30 FF | Branch if negative
    STX $09              ; 86 09 | Store X register to zero page
    PHY                  ; 5A | Push Y register to stack
    PLY                  ; 7A | Pull Y register from stack
    ADC $EFEB,X          ; 7D EB EF | Add with carry (absolute,X)
    TAX                  ; AA | Transfer accumulator to X register
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    STZ $F000            ; 9C 00 F0 | Store zero to absolute
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BRA $00              ; 80 00 | Branch always
    BPL $00              ; 10 00 | Branch if positive
    CLV                  ; B8 | Clear overflow flag
    LDA $DD              ; A5 DD | Load from zero page into accumulator
    STA $DDFD            ; 8D FD DD | Store accumulator to absolute address
    SBC $7070,X          ; FD 70 70 | Subtract with carry (absolute,X)
    PLA                  ; 68 | Pull accumulator from stack
    STA $369F,X          ; 9D 9F 36 | Store accumulator to absolute,X
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1B8
; Address: $E4DEB2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1B8:
    JSL $000200          ; 22 00 02 00 | Jump to subroutine long
    STA $000000          ; 8F 00 00 00 | Store accumulator to absolute long address
    BCS $00              ; B0 00 | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1B9
; Address: $E4DEBE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1B9:
    SBC $6500,Y          ; F9 00 65 | Subtract with carry (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    CPY $20CC            ; CC CC 20 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1BA
; Address: $E4DECA
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1BA:
    PHX                  ; DA | Push X register to stack
    PLB                  ; AB | Pull data bank register from stack
    PHB                  ; 8B | Push data bank register to stack
    BPL $00              ; 10 00 | Branch if positive
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    LDA $1D              ; A5 1D | Load from zero page into accumulator
    EOR $597D            ; 4D 7D 59 | Exclusive OR with accumulator (absolute)
    ADC $3636,X          ; 7D 36 36 | Add with carry (absolute,X)
    BRA $7F              ; 80 7F | Branch always
    DEX                  ; CA | Decrement X register
    NOP                  ; EA | No operation
    REP #$00             ; C2 00 | Reset processor status bits
    LDX #$00             ; A2 00 | Load immediate value into X register
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BRA $00              ; 80 00 | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    INY                  ; C8 | Increment Y register
    ADC $6700,X          ; 7D 00 67 | Add with carry (absolute,X)
    TXS                  ; 9A | Transfer X register to stack pointer
    ORA $B6FE,Y          ; 19 FE B6 | Logical OR with accumulator (absolute,Y)
    PLX                  ; FA | Pull X register from stack
    JMP ($026C)          ; 6C 6C 02 | Jump to address (absolute indirect)
    INC $D8D1,X          ; FE D1 D8 | Increment (absolute,X)
    LDX $3588            ; AE 88 35 | Load from absolute address into X register
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC $B100,X          ; FE 00 B1 | Increment (absolute,X)
    LDA                  ; BF 07 20 00 | Load from absolute long,X into accumulator
    LSR $9CCE            ; 4E CE 9C | Logical shift right (absolute)
    BRA $08              ; 80 08 | Branch always
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    LDA ($00),Y          ; B1 00 | Load from (zero page),Y into accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1BB
; Address: $E4DF3C
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1BB:
    CLV                  ; B8 | Clear overflow flag
    CPY #$EC             ; C0 EC | Compare Y register (immediate)
    AND #$0F             ; 29 0F | Logical AND with accumulator (immediate)
    STA                  ; 9F 9F EE CF | Store accumulator to absolute long,X
    BIT #$F9             ; 89 F9 | Test bits in accumulator (immediate)
    STZ $00              ; 64 00 | Store zero to zero page
    PEA #$6000           ; F4 00 60 | Push effective address to stack
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CMP $7D              ; C5 7D | Compare accumulator (zero page)
    EOR $75              ; 45 75 | Exclusive OR with accumulator (zero page)
    ADC $3A7D,X          ; 7D 7D 3A | Add with carry (absolute,X)
    DEC                  ; 3A | Decrement accumulator
    STZ $ED17            ; 9C 17 ED | Store zero to absolute

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1BC
; Address: $E4DF6F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1BC:
    ASL $82              ; 06 82 | Arithmetic shift left (zero page)
    TXA                  ; 8A | Transfer X register to accumulator
    CMP $00              ; C5 00 | Compare accumulator (zero page)
    INX                  ; E8 | Increment X register
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SBC $0000,Y          ; F9 00 00 | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1BD
; Address: $E4DF84
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1BD:
    JSR $54DC            ; 20 DC 54 | Jump to subroutine
    TAY                  ; A8 | Transfer accumulator to Y register
    BIT $C4D0            ; 2C D0 C4 | Test bits in accumulator (absolute)
    CLV                  ; B8 | Clear overflow flag
    BRA $FC              ; 80 FC | Branch always

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1BE
; Address: $E4DFA0
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1BE:
    JSR $40E0            ; 20 E0 40 | Jump to subroutine
    CPX #$80             ; E0 80 | Compare X register (immediate)
    BCC $40              ; 90 40 | Branch if carry clear
    BNE $A0              ; D0 A0 | Branch if not equal
    BNE $B0              ; D0 B0 | Branch if not equal
    BCC $50              ; 90 50 | Branch if carry clear
    BCS $10              ; B0 10 | Branch if carry set
    BCS $00              ; B0 00 | Branch if carry set

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1BF
; Address: $E4DFB1
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1BF:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    BVS $00              ; 70 00 | Branch if overflow set
    BVS $00              ; 70 00 | Branch if overflow set
    BVS $00              ; 70 00 | Branch if overflow set
    BVS $01              ; 70 01 | Branch if overflow set
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    AND #$2D             ; 29 2D | Logical AND with accumulator (immediate)
    ROL $9F2B            ; 2E 2B 9F | Rotate left (absolute)
    STZ $0000,X          ; 9E 00 00 | Store zero to absolute,X
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1C0
; Address: $E4DFE0
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1C0:
    LDA $00BD,X          ; BD BD 00 | Load from absolute,X into accumulator
    ROR $7E3C,X          ; 7E 3C 7E | Rotate right (absolute,X)
    STA $27FF,X          ; 9D FF 27 | Store accumulator to absolute,X
    AND $807F            ; 2D 7F 80 | Logical AND with accumulator (absolute)
    INC $2424,X          ; FE 24 24 | Increment (absolute,X)
    WDM #$00             ; 42 00 | Reserved instruction
    CLD                  ; D8 | Clear decimal mode flag
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ASL $180F            ; 0E 0F 18 | Arithmetic shift left (absolute)
    ORA $002A,X          ; 1D 2A 00 | Logical OR with accumulator (absolute,X)
    ASL $3100            ; 0E 00 31 | Arithmetic shift left (absolute)
    ADC $7700            ; 6D 00 77 | Add with carry (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1C1
; Address: $E4E028
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1C1:
    ASL $05              ; 06 05 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    BVS $A0              ; 70 A0 | Branch if overflow set
    BEQ $78              ; F0 78 | Branch if equal
    INX                  ; E8 | Increment X register
    CLC                  ; 18 | Clear carry flag
    PHA                  ; 48 | Push accumulator to stack
    PLP                  ; 28 | Pull processor status from stack
    TYA                  ; 98 | Transfer Y register to accumulator
    BVC $90              ; 50 90 | Branch if overflow clear
    BVC $B0              ; 50 B0 | Branch if overflow clear
    LDY #$E0             ; A0 E0 | Game work RAM access
    BRA $10              ; 80 10 | Branch always

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1C2
; Address: $E4E092
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1C2:
    JSR $2010            ; 20 10 20 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    BRA $78              ; 80 78 | Branch always
    SED                  ; F8 | Set decimal mode flag
    BVS $00              ; 70 00 | Branch if overflow set
    BEQ $00              ; F0 00 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1C3
; Address: $E4E0A0
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1C3:
    ROL $193F,X          ; 3E 3F 19 | Rotate left (absolute,X)
    ORA $180E            ; 0D 0E 18 | Logical OR with accumulator (absolute)
    AND $2F28,X          ; 3D 28 2F | Logical AND with accumulator (absolute,X)
    RTI                  ; 40 | Return from interrupt
    LDY #$1F             ; A0 1F | Load immediate value into Y register
    BPL $0F              ; 10 0F | Branch if positive
    BMI $0F              ; 30 0F | Branch if negative

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1C4
; Address: $E4E0BA
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1C4:
    JSR $401F            ; 20 1F 40 | Jump to subroutine
    BPL $0F              ; 10 0F | Branch if positive
    LDA $02BD,X          ; BD BD 02 | Load from absolute,X into accumulator
    ROR $7E0C,X          ; 7E 0C 7E | Rotate right (absolute,X)
    AND $AC7F,X          ; 3D 7F AC | Logical AND with accumulator (absolute,X)
    INC $7E3C,X          ; FE 3C 7E | Increment (absolute,X)
    WDM #$00             ; 42 00 | Reserved instruction
    SBC $00              ; E5 00 | Subtract with carry (zero page)
    LDA ($00),Y          ; B1 00 | Load from (zero page),Y into accumulator
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    XBA                  ; EB | Exchange accumulator bytes
    DEC                  ; 3A | Decrement accumulator
    ROL $2B1D            ; 2E 1D 2B | Rotate left (absolute)
    DEC                  ; 3A | Decrement accumulator
    EOR $5F2A,X          ; 5D 2A 5F | Exclusive OR with accumulator (absolute,X)
    ROL $2A5F            ; 2E 5F 2A | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1C5
; Address: $E4E0F2
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1C5:
    CMP $7300            ; CD 00 73 | Compare accumulator (absolute)
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    AND $3F28            ; 2D 28 3F | Logical AND with accumulator (absolute)
    AND $0222,X          ; 3D 22 02 | Logical AND with accumulator (absolute,X)
    BIT $3C              ; 24 3C | Test bits in accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    CLI                  ; 58 | Clear interrupt disable flag
    CLD                  ; D8 | Clear decimal mode flag
    SEC                  ; 38 | Set carry flag
    INC $FDFE,X          ; FE FE FD | Increment (absolute,X)
    LDA $EFA7            ; AD A7 EF | Load from absolute address into accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1C6
; Address: $E4E128
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1C6:
    INC $4B3E,X          ; FE 3E 4B | Increment (absolute,X)
    LDA ($21,X)          ; A1 21 | PPU graphics register access
    JMP ($FF60)          ; 6C 60 FF | Jump to address (absolute indirect)
    DEC $DC00,X          ; DE 00 DC | Decrement (absolute,X)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    DEC $9F00,X          ; DE 00 9F | Decrement (absolute,X)
    CMP $8F9F            ; CD 9F 8F | Compare accumulator (absolute)
    CMP ($31),Y          ; D1 31 | Compare accumulator ((zero page),Y)
    CMP #$A9             ; C9 A9 | Compare accumulator (immediate)
    ROL $06              ; 26 06 | Rotate left (zero page)
    EOR ($50),Y          ; 51 50 | Exclusive OR with accumulator ((zero page),Y)
    AND $7F00,X          ; 3D 00 7F | Logical AND with accumulator (absolute,X)
    PEA #$EE00           ; F4 00 EE | Push effective address to stack
    SBC $AF00,Y          ; F9 00 AF | Subtract with carry (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $16              ; 05 16 | Logical OR with accumulator (zero page)
    ORA #$20             ; 09 20 | Logical OR with accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    EOR ($3F,X)          ; 41 3F | Exclusive OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $1E00            ; 0E 00 1E | Arithmetic shift left (absolute)
    ROL $6000,X          ; 3E 00 60 | Rotate left (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1C7
; Address: $E4E17E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1C7:
    ROR $0000,X          ; 7E 00 00 | Rotate right (absolute,X)
    BEQ $40              ; F0 40 | Branch if equal
    LDY $BE48,X          ; BC 48 BE | Load from absolute,X into Y register
    BEQ $00              ; F0 00 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1C8
; Address: $E4E19A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1C8:
    INC $FF60,X          ; FE 60 FF | Increment (absolute,X)
    CLI                  ; 58 | Clear interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ROL $3C              ; 26 3C | Rotate left (zero page)
    CPX $7D              ; E4 7D | Compare X register (zero page)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1C9
; Address: $E4E1A8
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1C9:
    CLV                  ; B8 | Clear overflow flag
    AND $8142,Y          ; 39 42 81 | Logical AND with accumulator (absolute,Y)
    WDM #$02             ; 42 02 | Reserved instruction
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    WDM #$00             ; 42 00 | Reserved instruction
    ROR $7E00,X          ; 7E 00 7E | Rotate right (absolute,X)
    DEY                  ; 88 | Decrement Y register
    BNE $A1              ; D0 A1 | Branch if not equal
    SBC $FBBB,Y          ; F9 BB FB | Subtract with carry (absolute,Y)
    CMP $F5BA            ; CD BA F5 | Compare accumulator (absolute)
    TXA                  ; 8A | Transfer X register to accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $0400,X          ; 1E 00 04 | Arithmetic shift left (absolute,X)
    BRA $00              ; 80 00 | Branch always
    ROR $427E,X          ; 7E 7E 42 | Hardware register operation
    WDM #$62             ; 42 62 | Reserved instruction
    CLI                  ; 58 | Clear interrupt disable flag
    CLI                  ; 58 | Clear interrupt disable flag
    ROR $007E,X          ; 7E 7E 00 | Rotate right (absolute,X)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    LDA $9D00,X          ; BD 00 9D | Load from absolute,X into accumulator
    LDA $8100            ; AD 00 81 | Load from absolute address into accumulator
    STA                  ; 9F 80 2B 1B | Store accumulator to absolute long,X
    CMP ($31),Y          ; D1 31 | Compare accumulator ((zero page),Y)
    INY                  ; C8 | Increment Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    ROL $06              ; 26 06 | Rotate left (zero page)
    EOR ($50),Y          ; 51 50 | Exclusive OR with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    LDY $7F00,X          ; BC 00 7F | Load from absolute,X into Y register
    PEA #$EE00           ; F4 00 EE | Push effective address to stack
    SBC $AF00,Y          ; F9 00 AF | Subtract with carry (absolute,Y)
    BRA $FF              ; 80 FF | Branch always
    INC $5491            ; EE 91 54 | Increment (absolute)
    ROL                  ; 2A | Rotate left (accumulator)
    SED                  ; F8 | Set decimal mode flag
    BCC $6C              ; 90 6C | Branch if carry clear
    TAY                  ; A8 | Transfer accumulator to Y register
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    AND ($1F,X)          ; 21 1F | Logical AND with accumulator ((zero page,X))
    EOR #$0B             ; 49 0B | Exclusive OR with accumulator (immediate)
    AND $05              ; 25 05 | Logical AND with accumulator (zero page)
    ORA #$03             ; 09 03 | Logical OR with accumulator (immediate)
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ROR $7E00,X          ; 7E 00 7E | Rotate right (absolute,X)
    ROL $1E00,X          ; 3E 00 1E | Rotate left (absolute,X)
    ASL $0600            ; 0E 00 06 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1CA
; Address: $E4E262
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1CA:
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    ROL $DF              ; 26 DF | Rotate left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL $3EE1,X          ; 1E E1 3E | Arithmetic shift left (absolute,X)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    BMI $F7              ; 30 F7 | Branch if negative

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1CB
; Address: $E4E279
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1CB:
    JSR $00E1            ; 20 E1 00 | Jump to subroutine
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    JMP ($19A4)          ; 6C A4 19 | Jump to address (absolute indirect)
    SEI                  ; 78 | Set interrupt disable flag
    STZ $5401,X          ; 9E 01 54 | Store zero to absolute,X
    CLC                  ; 18 | Clear carry flag
    STZ $00              ; 64 00 | Store zero to zero page
    ROR $FF00,X          ; 7E 00 FF | Rotate right (absolute,X)
    INC $7C00            ; EE 00 7C | Increment (absolute)
    EOR $47              ; 45 47 | Exclusive OR with accumulator (zero page)
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    STZ $6D6D,X          ; 9E 6D 6D | Store zero to absolute,X
    ORA ($73),Y          ; 11 73 | Logical OR with accumulator ((zero page),Y)
    LDX $B966            ; AE 66 B9 | Load from absolute address into X register
    AND $00B8,Y          ; 39 B8 00 | Logical AND with accumulator (absolute,Y)
    LDY $B000            ; AC 00 B0 | Load from absolute address into Y register
    ADC #$00             ; 69 00 | Add with carry (immediate)
    STY $9900            ; 8C 00 99 | Store Y register to absolute address
    DEC $00              ; C6 00 | Decrement (zero page)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ASL $05              ; 06 05 | Arithmetic shift left (zero page)
    STZ $EA98,X          ; 9E 98 EA | Store zero to absolute,X
    TAY                  ; A8 | Transfer accumulator to Y register
    BMI $E6              ; 30 E6 | Branch if negative
    LSR $F8              ; 46 F8 | Logical shift right (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHY                  ; 5A | Push Y register to stack
    SBC ($E7),Y          ; F1 E7 | Subtract with carry ((zero page),Y)
    STA $B900,X          ; 9D 00 B9 | Store accumulator to absolute,X
    PEA #$1800           ; F4 00 18 | Push effective address to stack
    TAX                  ; AA | Transfer accumulator to X register
    EOR ($FD,X)          ; 41 FD | Exclusive OR with accumulator ((zero page,X))
    BVS $94              ; 70 94 | Branch if overflow set
    ASL $F6              ; 06 F6 | Arithmetic shift left (zero page)
    EOR ($86),Y          ; 51 86 | Exclusive OR with accumulator ((zero page),Y)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    LDA                  ; BF D4 00 BE | Load from absolute long,X into accumulator
    STA $00FB00          ; 8F 00 FB 00 | Store accumulator to absolute long address
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    LDX $3F00            ; AE 00 3F | Load from absolute address into X register
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1CC
; Address: $E4E32A
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1CC:
    ORA #$0F             ; 09 0F | Logical OR with accumulator (immediate)
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    STX $9A71            ; 8E 71 9A | Store X register to absolute address
    BIT $48              ; 24 48 | Test bits in accumulator (zero page)
    ROL $12              ; 26 12 | Rotate left (zero page)
    ASL $041F            ; 0E 1F 04 | Arithmetic shift left (absolute)
    AND $0C21            ; 2D 21 0C | Logical AND with accumulator (absolute)
    ROR $3E01,X          ; 7E 01 3E | Rotate right (absolute,X)
    BRA $FF              ; 80 FF | Branch always
    BCS $00              ; B0 00 | Branch if carry set
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA #$0F             ; 09 0F | Logical OR with accumulator (immediate)
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    BPL $00              ; 10 00 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ASL $1800            ; 0E 00 18 | Arithmetic shift left (absolute)
    ASL $1202            ; 0E 02 12 | Arithmetic shift left (absolute)
    ORA $13              ; 05 13 | Logical OR with accumulator (zero page)
    ORA $11              ; 05 11 | Logical OR with accumulator (zero page)
    ORA #$03             ; 09 03 | Logical OR with accumulator (immediate)
    ORA $0903,Y          ; 19 03 09 | Logical OR with accumulator (absolute,Y)
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1CD
; Address: $E4E3C4
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1CD:
    JSR $2467            ; 20 67 24 | Jump to subroutine
    PLP                  ; 28 | Pull processor status from stack
    CLI                  ; 58 | Clear interrupt disable flag
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    STA ($FF),Y          ; 91 FF | Store accumulator to (zero page),Y
    STA $99FF,Y          ; 99 FF 99 | Store accumulator to absolute,Y
    BIT #$FF             ; 89 FF | Test bits in accumulator (immediate)
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    STA ($FF),Y          ; 91 FF | Store accumulator to (zero page),Y
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    ROR $B186,X          ; 7E 86 B1 | Rotate right (absolute,X)
    ROL $9814,X          ; 3E 14 98 | Rotate left (absolute,X)
    STY $847B            ; 8C 7B 84 | Store Y register to absolute address
    LDA                  ; BF 01 81 01 | Load from absolute long,X into accumulator
    STA ($86,X)          ; 81 86 | Store accumulator to (zero page,X)
    ADC $C13E,Y          ; 79 3E C1 | Add with carry (absolute,Y)
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1CE
; Address: $E4E3F6
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1CE:
    STY $8473            ; 8C 73 84 | Store Y register to absolute address
    LDA                  ; BF 40 81 7E | Load from absolute long,X into accumulator
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    TYA                  ; 98 | Transfer Y register to accumulator
    BPL $00              ; 10 00 | Branch if positive
    STY $00              ; 84 00 | Store Y register to zero page
    BRA $01              ; 80 01 | Branch always
    AND ($61,X)          ; 21 61 | Logical AND with accumulator ((zero page,X))
    BMI $7E              ; 30 7E | Branch if negative
    ROR $FF98,X          ; 7E 98 FF | Rotate right (absolute,X)
    BCC $FF              ; 90 FF | Branch if carry clear
    BRA $FF              ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1CF
; Address: $E4E418
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1CF:
    JSR $3EFF            ; 20 FF 3E | Jump to subroutine
    PLP                  ; 28 | Pull processor status from stack
    AND ($49),Y          ; 31 49 | Logical AND with accumulator ((zero page),Y)
    BNE $27              ; D0 27 | Branch if not equal
    JMP ($8083)          ; 6C 83 80 | Jump to address (absolute indirect)
    RTI                  ; 40 | Return from interrupt
    CLV                  ; B8 | Clear overflow flag
    INC $FF43,X          ; FE 43 FF | Increment (absolute,X)
    STY $7B              ; 84 7B | Store Y register to zero page
    BRA $FF              ; 80 FF | Branch always
    ORA $00E2,X          ; 1D E2 00 | Logical OR with accumulator (absolute,X)
    BVS $82              ; 70 82 | Branch if overflow set
    AND #$D2             ; 29 D2 | Logical AND with accumulator (immediate)
    EOR $0CA2,Y          ; 59 A2 0C | Exclusive OR with accumulator (absolute,Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BIT $FFD1            ; 2C D1 FF | Test bits in accumulator (absolute)
    ADC $2DD2,X          ; 7D D2 2D | Add with carry (absolute,X)
    LDX #$5D             ; A2 5D | Load immediate value into X register
    CMP ($2E),Y          ; D1 2E | Compare accumulator ((zero page),Y)
    BVS $81              ; 70 81 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1D1
; Address: $E4E468
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1D1:
    JSL $8843C9          ; 22 C9 43 88 | Jump to subroutine long
    ROL $C9              ; 26 C9 | Rotate left (zero page)
    INY                  ; C8 | Increment Y register
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    LDA $778850          ; AF 50 88 77 | Load from absolute long address into accumulator
    CMP #$36             ; C9 36 | Compare accumulator (immediate)
    DEY                  ; 88 | Decrement Y register
    CMP #$36             ; C9 36 | Compare accumulator (immediate)
    INY                  ; C8 | Increment Y register
    BIT $3230            ; 2C 30 32 | Test bits in accumulator (absolute)
    ROL $C0              ; 26 C0 | Rotate left (zero page)
    BVC $89              ; 50 89 | Branch if overflow clear
    PLB                  ; AB | Pull data bank register from stack
    LDX $7D6F,Y          ; BE 6F 7D | Load from absolute,Y into X register
    INC $3FD9,X          ; FE D9 3F | Increment (absolute,X)
    CPY #$4F             ; C0 4F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1D2
; Address: $E4E49A
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1D2:
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    SED                  ; F8 | Set decimal mode flag
    SBC $1CC5,Y          ; F9 C5 1C | Subtract with carry (absolute,Y)
    LDY $1C7E,X          ; BC 7E 1C | Load from absolute,X into Y register
    RTI                  ; 40 | Return from interrupt
    REP #$40             ; C2 40 | Reset processor status bits
    PLX                  ; FA | Pull X register from stack
    WDM #$C7             ; 42 C7 | Reserved instruction
    LDX $FE              ; A6 FE | Load from zero page into X register
    SEC                  ; 38 | Set carry flag
    SBC $FF41,X          ; FD 41 FF | Subtract with carry (absolute,X)
    SBC $7D9F,X          ; FD 9F 7D | Subtract with carry (absolute,X)
    EOR $FF              ; 45 FF | Exclusive OR with accumulator (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $19              ; 05 19 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $00              ; 10 00 | Branch if positive
    BRA $FF              ; 80 FF | Branch always
    AND ($21,X)          ; 21 21 | PPU graphics register access
    SBC ($31,X)          ; E1 31 | Subtract with carry ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1D4
; Address: $E4E4EC
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1D4:
    JSR $42D6            ; 20 D6 42 | Hardware register operation
    DEC                  ; 3A | Decrement accumulator
    DEC $DEFF,X          ; DE FF DE | Decrement (absolute,X)
    SBC $FDFF,X          ; FD FF FD | Subtract with carry (absolute,X)
    SBC $01FF,X          ; FD FF 01 | Subtract with carry (absolute,X)
    LDA $F8E0,X          ; BD E0 F8 | Load from absolute,X into accumulator
    ORA #$40             ; 09 40 | Logical OR with accumulator (immediate)
    LDA                  ; BF 8F E9 47 | Load from absolute long,X into accumulator
    BRA $84              ; 80 84 | Branch always
    WDM #$FF             ; 42 FF | Reserved instruction
    PHB                  ; 8B | Push data bank register to stack
    BPL $FF              ; 10 FF | Branch if positive
    SEI                  ; 78 | Set interrupt disable flag
    ROL $01              ; 26 01 | Rotate left (zero page)
    PLP                  ; 28 | Pull processor status from stack
    AND ($52),Y          ; 31 52 | Logical AND with accumulator ((zero page),Y)
    ROL $68              ; 26 68 | Rotate left (zero page)
    INC $62              ; E6 62 | Increment (zero page)
    CPX #$5D             ; E0 5D | Compare X register (immediate)
    CPY $3E17            ; CC 17 3E | Compare Y register (absolute)
    EOR $7800,Y          ; 59 00 78 | Exclusive OR with accumulator (absolute,Y)
    STA $A600,X          ; 9D 00 A6 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1D5
; Address: $E4E541
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1D5:
    ASL $AF4E,X          ; 1E 4E AF | Arithmetic shift left (absolute,X)
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $00AA40          ; 5C 40 AA 00 | Jump to address long
    STA $47              ; 85 47 | Store accumulator to zero page
    LDA $AA02,X          ; BD 02 AA | Load from absolute,X into accumulator
    BEQ $FF              ; F0 FF | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CMP $55FF,X          ; DD FF 55 | Compare accumulator (absolute,X)
    INC $FFFF            ; EE FF FF | Increment (absolute)
    EOR $DBF7,Y          ; 59 F7 DB | Exclusive OR with accumulator (absolute,Y)
    EOR $CFFF,X          ; 5D FF CF | Exclusive OR with accumulator (absolute,X)
    DEC $FFFF,X          ; DE FF FF | Decrement (absolute,X)
    CMP $BF7F,X          ; DD 7F BF | Compare accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1D6
; Address: $E4E596
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1D6:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    CPY $C7              ; C4 C7 | Compare Y register (zero page)
    BCS $30              ; B0 30 | Branch if carry set
    AND $321F,Y          ; 39 1F 32 | Logical AND with accumulator (absolute,Y)
    SEC                  ; 38 | Set carry flag
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1D9
; Address: $E4E5C2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1D9:
    ORA $E04B,Y          ; 19 4B E0 | Game work RAM access
    SBC $5A              ; E5 5A | Subtract with carry (zero page)
    BNE $3A              ; D0 3A | Branch if not equal
    DEY                  ; 88 | Decrement Y register
    ASL $166A            ; 0E 6A 16 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1DA
; Address: $E4E5CF
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1DA:
    JSL $B60094          ; 22 94 00 B6 | Jump to subroutine long
    LDA                  ; BF 00 BF 00 | Load from absolute long,X into accumulator
    LDA                  ; BF 00 F7 00 | Load from absolute long,X into accumulator
    AND $0100,X          ; 3D 00 01 | Logical AND with accumulator (absolute,X)
    INC $FFEB,X          ; FE EB FF | Increment (absolute,X)
    STX $FF              ; 86 FF | Store X register to zero page
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    ADC $3CFF,Y          ; 79 FF 3C | Add with carry (absolute,Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDA #$57             ; A9 57 | Load immediate value into accumulator
    LDX #$5C             ; A2 5C | Load immediate value into X register
    BCS $FF              ; B0 FF | Branch if carry set
    ROL                  ; 2A | Rotate left (accumulator)
    PEA #$FEFF           ; F4 FF FE | Push effective address to stack
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    ASL $0A              ; 06 0A | Arithmetic shift left (zero page)
    ORA ($1D,X)          ; 01 1D | Logical OR with accumulator ((zero page,X))
    ASL $0F0E            ; 0E 0E 0F | Arithmetic shift left (absolute)
    ROL $4A38,X          ; 3E 38 4A | Rotate left (absolute,X)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1DB
; Address: $E4E642
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1DB:
    PHX                  ; DA | Push X register to stack
    LSR $1B              ; 46 1B | Logical shift right (zero page)
    EOR $61              ; 45 61 | Exclusive OR with accumulator (zero page)
    SBC ($11,X)          ; E1 11 | Subtract with carry ((zero page,X))
    CMP $9376,Y          ; D9 76 93 | Compare accumulator (absolute,Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1DC
; Address: $E4E64D
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1DC:
    LDA $7629,Y          ; B9 29 76 | Load from absolute,Y into accumulator
    ADC $B900,X          ; 7D 00 B9 | Add with carry (absolute,X)
    TSX                  ; BA | Transfer stack pointer to X register
    STZ $E600,X          ; 9E 00 E6 | Store zero to absolute,X
    CPX $DF00            ; EC 00 DF | Compare X register (absolute)
    RTI                  ; 40 | Return from interrupt
    CMP #$08             ; C9 08 | Compare accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    SBC $FD02,X          ; FD 02 FD | Subtract with carry (absolute,X)
    LDA $0741,Y          ; B9 41 07 | Load from absolute,Y into accumulator
    BNE $F7              ; D0 F7 | Branch if not equal
    PHP                  ; 08 | Push processor status to stack
    LDY $FF53            ; AC 53 FF | Load from absolute address into Y register
    BCS $4F              ; B0 4F | Branch if carry set
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    BMI $3F              ; 30 3F | Branch if negative
    RTI                  ; 40 | Return from interrupt
    BRA $73              ; 80 73 | Branch always
    RTI                  ; 40 | Return from interrupt
    LDX #$46             ; A2 46 | Load immediate value into X register
    LDY $22              ; A4 22 | Load from zero page into Y register
    STY $FF              ; 84 FF | Store Y register to zero page
    INC $00              ; E6 00 | Increment (zero page)
    SEP #$00             ; E2 00 | Set processor status bits
    SEP #$00             ; E2 00 | Set processor status bits
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    AND #$FE             ; 29 FE | Logical AND with accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    LDX $2606,Y          ; BE 06 26 | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1DD
; Address: $E4E6CC
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1DD:
    JSR $6706            ; 20 06 67 | Jump to subroutine
    LSR $FF              ; 46 FF | Logical shift right (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SBC $6100,Y          ; F9 00 61 | Subtract with carry (absolute,Y)
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    CPY #$83             ; C0 83 | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    LDA $9139            ; AD 39 91 | Load from absolute address into accumulator
    STZ $E102            ; 9C 02 E1 | Store zero to absolute
    BRA $7C              ; 80 7C | Branch always
    CPX $00              ; E4 00 | Compare X register (zero page)
    DEC $00              ; C6 00 | Decrement (zero page)
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1DE
; Address: $E4E705
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1DE:
    BEQ $15              ; F0 15 | Branch if equal
    INY                  ; C8 | Increment Y register
    ORA $23C0            ; 0D C0 23 | Logical OR with accumulator (absolute)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BPL $00              ; 10 00 | Branch if positive
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1DF
; Address: $E4E721
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1DF:
    STY $E0              ; 84 E0 | Game work RAM access
    CPY $B1              ; C4 B1 | Compare Y register (zero page)
    ROL                  ; 2A | Rotate left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    BCS $BF              ; B0 BF | Branch if carry set
    CPY $FB              ; C4 FB | Compare Y register (zero page)
    CPY #$22             ; C0 22 | Compare Y register (immediate)
    LSR $A4              ; 46 A4 | Logical shift right (zero page)
    SEP #$00             ; E2 00 | Set processor status bits

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1E0
; Address: $E4E732
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1E0:
    JSL $00FB00          ; 22 00 FB 00 | Jump to subroutine long
    RTI                  ; 40 | Return from interrupt
    INC $00              ; E6 00 | Increment (zero page)
    SEP #$00             ; E2 00 | Set processor status bits
    ASL $46              ; 06 46 | Arithmetic shift left (zero page)
    LSR $17              ; 46 17 | Logical shift right (zero page)
    LSR $A5              ; 46 A5 | Logical shift right (zero page)
    STY $06              ; 84 06 | Store Y register to zero page
    TSX                  ; BA | Transfer stack pointer to X register
    AND $62              ; 25 62 | Logical AND with accumulator (zero page)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    LDA $7B00,Y          ; B9 00 7B | Load from absolute,Y into accumulator
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    SBC $6300,X          ; FD 00 63 | Subtract with carry (absolute,X)
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    CLI                  ; 58 | Clear interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    BIT $67              ; 24 67 | Test bits in accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    CLI                  ; 58 | Clear interrupt disable flag
    BIT #$FF             ; 89 FF | Test bits in accumulator (immediate)
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    STA ($FF),Y          ; 91 FF | Store accumulator to (zero page),Y
    STA $C9FF,Y          ; 99 FF C9 | Store accumulator to absolute,Y
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    STA ($FF),Y          ; 91 FF | Store accumulator to (zero page),Y
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    LDX $D820,Y          ; BE 20 D8 | Load from absolute,Y into X register
    STZ $1C04            ; 9C 04 1C | Store zero to absolute
    STY $14              ; 84 14 | Store Y register to zero page
    STY $FC04            ; 8C 04 FC | Store Y register to absolute address
    STZ $FF00            ; 9C 00 FF | Store zero to absolute

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1E1
; Address: $E4E792
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1E1:
    LDX $D841,Y          ; BE 41 D8 | Load from absolute,Y into X register
    STY $7B              ; 84 7B | Store Y register to zero page
    STY $FC73            ; 8C 73 FC | Store Y register to absolute address
    STZ $7963            ; 9C 63 79 | Store zero to absolute
    LDA $FF25,Y          ; B9 25 FF | Load from absolute,Y into accumulator
    SED                  ; F8 | Set decimal mode flag
    EOR $FFFF,Y          ; 59 FF FF | Exclusive OR with accumulator (absolute,Y)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    STA ($7F),Y          ; 91 7F | Store accumulator to (zero page),Y
    LDA $6FFF            ; AD FF 6F | Load from absolute address into accumulator
    CPY $62              ; C4 62 | Compare Y register (zero page)
    CPY $7F              ; C4 7F | Compare Y register (zero page)
    CPY $B3              ; C4 B3 | Compare Y register (zero page)
    LDX #$44             ; A2 44 | Load immediate value into X register
    INC $A2              ; E6 A2 | Increment (zero page)
    LDX #$00             ; A2 00 | Load immediate value into X register
    INC $00              ; E6 00 | Increment (zero page)
    LDX #$00             ; A2 00 | Load immediate value into X register
    SEC                  ; 38 | Set carry flag
    EOR ($21,X)          ; 41 21 | PPU graphics register access
    LSR $49E0,X          ; 5E E0 49 | Logical shift right (absolute,X)
    ASL $DB12            ; 0E 12 DB | Arithmetic shift left (absolute)
    TSX                  ; BA | Transfer stack pointer to X register
    ROL $6F40,X          ; 3E 40 6F | Rotate left (absolute,X)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    SBC $2D00,X          ; FD 00 2D | Subtract with carry (absolute,X)
    SBC $00              ; E5 00 | Subtract with carry (zero page)
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    STA $B726,X          ; 9D 26 B7 | Store accumulator to absolute,X
    BRA $FF              ; 80 FF | Branch always
    LDA                  ; BF C4 BB 40 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1E2
; Address: $E4E829
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1E2:
    JSL $1BFB00          ; 22 00 FB 1B | Jump to subroutine long
    LDY $74              ; A4 74 | Load from zero page into Y register
    RTI                  ; 40 | Return from interrupt
    INC $00              ; E6 00 | Increment (zero page)
    DEC $6661,X          ; DE 61 66 | Decrement (absolute,X)
    ORA #$F5             ; 09 F5 | Logical OR with accumulator (immediate)
    BEQ $40              ; F0 40 | Branch if equal
    LDA $2104,Y          ; B9 04 21 | PPU graphics register access
    LDA $49B4,Y          ; B9 B4 49 | Load from absolute,Y into accumulator
    STZ $BF01,X          ; 9E 01 BF | Store zero to absolute,X
    STA $F965,Y          ; 99 65 F9 | Store accumulator to absolute,Y
    ORA $A8              ; 05 A8 | Logical OR with accumulator (zero page)
    EOR ($E8),Y          ; 51 E8 | Exclusive OR with accumulator ((zero page),Y)
    BPL $2E              ; 10 2E | Branch if positive
    PLA                  ; 68 | Pull accumulator from stack
    BCC $6E              ; 90 6E | Branch if carry clear
    ADC $FE              ; 65 FE | Add with carry (zero page)
    ORA $FE              ; 05 FE | Logical OR with accumulator (zero page)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1E4
; Address: $E4E87B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1E4:
    LDA                  ; BF 62 FF 00 | Load from absolute long,X into accumulator
    BVC $10              ; 50 10 | Branch if overflow clear
    ROL $26              ; 26 26 | Rotate left (zero page)
    ROR                  ; 6A | Rotate right (accumulator)
    ROR                  ; 6A | Rotate right (accumulator)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1E5
; Address: $E4E88A
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1E5:
    JSR $9020            ; 20 20 90 | Jump to subroutine
    CMP ($BF,X)          ; C1 BF | Compare accumulator ((zero page,X))
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    SEP #$9D             ; E2 9D | Set processor status bits
    SBC $24FF            ; ED FF 24 | Subtract with carry (absolute)
    ROR                  ; 6A | Rotate right (accumulator)
    WDM #$55             ; 42 55 | Reserved instruction
    ROR                  ; 6A | Rotate right (accumulator)
    ROR                  ; 6A | Rotate right (accumulator)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    INX                  ; E8 | Increment X register
    TAX                  ; AA | Transfer accumulator to X register
    ROR                  ; 6A | Rotate right (accumulator)
    LDA                  ; BF FF BC FB | Load from absolute long,X into accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    AND #$09             ; 29 09 | Logical AND with accumulator (immediate)
    ORA #$20             ; 09 20 | Logical OR with accumulator (immediate)
    LSR                  ; 4A | Logical shift right (accumulator)
    SBC $4AB5,X          ; FD B5 4A | Subtract with carry (absolute,X)
    AND #$D6             ; 29 D6 | Logical AND with accumulator (immediate)
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1E6
; Address: $E4E8DD
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1E6:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CPX #$9F             ; E0 9F | Compare X register (immediate)
    SBC $E391,Y          ; F9 91 E3 | Subtract with carry (absolute,Y)
    LDA #$5E             ; A9 5E | Load immediate value into accumulator
    STZ $E5BB            ; 9C BB E5 | Store zero to absolute
    ROL $7E00,X          ; 3E 00 7E | Rotate left (absolute,X)
    ASL $F800,X          ; 1E 00 F8 | Arithmetic shift left (absolute,X)
    ASL $12              ; 06 12 | Arithmetic shift left (zero page)
    ROL $00              ; 26 00 | Rotate left (zero page)
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1E7
; Address: $E4E905
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1E7:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    SBC $D9A6            ; ED A6 D9 | Subtract with carry (absolute)
    TAY                  ; A8 | Transfer accumulator to Y register
    PHY                  ; 5A | Push Y register to stack
    LDA                  ; BF 9A 7F 3F | Load from absolute long,X into accumulator
    BPL $10              ; 10 10 | Branch if positive
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1E8
; Address: $E4E932
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1E8:
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    SBC $DA              ; E5 DA | Subtract with carry (zero page)
    SBC $9AFA,X          ; FD FA 9A | Subtract with carry (absolute,X)
    SBC $FD1A,X          ; FD 1A FD | Subtract with carry (absolute,X)
    DEY                  ; 88 | Decrement Y register
    INC $FE44,X          ; FE 44 FE | Increment (absolute,X)
    LDX $09F9,Y          ; BE F9 09 | Load from absolute,Y into X register
    SBC $FE19,Y          ; F9 19 FE | Subtract with carry (absolute,Y)
    BEQ $50              ; F0 50 | Branch if equal
    LDA #$A9             ; A9 A9 | Load immediate value into accumulator
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BMI $0F              ; 30 0F | Branch if negative
    LSR $9031            ; 4E 31 90 | Logical shift right (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1E9
; Address: $E4E966
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1E9:
    ADC $828D            ; 6D 8D 82 | Add with carry (absolute)
    DEC $DE82            ; CE 82 DE | Decrement (absolute)
    LDA #$D4             ; A9 D4 | Load immediate value into accumulator
    BMI $00              ; 30 00 | Branch if negative
    LDA                  ; BF 00 72 00 | Load from absolute long,X into accumulator
    ADC $7D00,X          ; 7D 00 7D | Add with carry (absolute,X)
    ADC $7F00,X          ; 7D 00 7F | Add with carry (absolute,X)
    LDY $1EF0,X          ; BC F0 1E | Load from absolute,X into Y register
    CPX $02BB            ; EC BB 02 | Compare X register (absolute)
    EOR $9640            ; 4D 40 96 | Exclusive OR with accumulator (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1EA
; Address: $E4E98A
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1EA:
    STX $70              ; 86 70 | Store X register to zero page
    STA $54A353          ; 8F 53 A3 54 | Store accumulator to absolute long address
    SBC $BF00,X          ; FD 00 BF | Subtract with carry (absolute,X)
    ADC $3427,Y          ; 79 27 34 | Add with carry (absolute,Y)
    BIT $086F            ; 2C 6F 08 | Test bits in accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BVC $07              ; 50 07 | Branch if overflow clear
    INY                  ; C8 | Increment Y register
    TSX                  ; BA | Transfer stack pointer to X register
    BEQ $36              ; F0 36 | Branch if equal
    CPX $74E2            ; EC E2 74 | Compare X register (absolute)
    ROL                  ; 2A | Rotate left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LSR $BC              ; 46 BC | Logical shift right (zero page)
    ASL $1EF8            ; 0E F8 1E | Arithmetic shift left (absolute)
    BEQ $DE              ; F0 DE | Branch if equal
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1EB
; Address: $E4E9DC
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1EB:
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    ADC #$37             ; 69 37 | Add with carry (immediate)
    SBC $9C              ; E5 9C | Subtract with carry (zero page)
    STA $5B93,X          ; 9D 93 5B | Store accumulator to absolute,X
    ASL $BA              ; 06 BA | Arithmetic shift left (zero page)
    BVS $6C              ; 70 6C | Branch if overflow set
    LDY $98DA,X          ; BC DA 98 | Load from absolute,X into Y register
    INY                  ; C8 | Increment Y register
    BVS $0F              ; 70 0F | Branch if overflow set
    JMP ($E803)          ; 6C 03 E8 | Jump to address (absolute indirect)
    SBC $9F06,Y          ; F9 06 9F | Subtract with carry (absolute,Y)
    ROL $00              ; 26 00 | Rotate left (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    ROR $722A,X          ; 7E 2A 72 | Rotate right (absolute,X)
    BNE $EC              ; D0 EC | Branch if not equal
    EOR $C3EC            ; 4D EC C3 | Exclusive OR with accumulator (absolute)
    SEP #$C1             ; E2 C1 | Set processor status bits
    CLV                  ; B8 | Clear overflow flag
    CMP #$10             ; C9 10 | Compare accumulator (immediate)
    PHA                  ; 48 | Push accumulator to stack
    STA ($58,X)          ; 81 58 | Store accumulator to (zero page,X)
    STY $59              ; 84 59 | Store Y register to zero page
    STA ($36,X)          ; 81 36 | Store accumulator to (zero page,X)
    LDA                  ; BF 00 FF 08 | Load from absolute long,X into accumulator
    STZ $7F              ; 64 7F | Store zero to zero page
    SBC $EDFF,Y          ; F9 FF ED | Subtract with carry (absolute,Y)
    LDY $FF              ; A4 FF | Load from zero page into Y register
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    ADC $4BFF,Y          ; 79 FF 4B | Add with carry (absolute,Y)
    PHA                  ; 48 | Push accumulator to stack
    LSR                  ; 4A | Logical shift right (accumulator)
    INC $FEF0,X          ; FE F0 FE | Increment (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    INC $FE78,X          ; FE 78 FE | Increment (absolute,X)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    ROR                  ; 6A | Rotate right (accumulator)
    EOR #$FF             ; 49 FF | Exclusive OR with accumulator (immediate)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ADC #$FF             ; 69 FF | Add with carry (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1EC
; Address: $E4EA64
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1EC:
    JSR $52DF            ; 20 DF 52 | Jump to subroutine
    LDA $151D            ; AD 1D 15 | Load from absolute address into accumulator
    LDA #$56             ; A9 56 | Load immediate value into accumulator
    ROL                  ; 2A | Rotate left (accumulator)
    LDY #$DF             ; A0 DF | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1EE
; Address: $E4EA79
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1EE:
    NOP                  ; EA | No operation
    PHP                  ; 08 | Push processor status to stack
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    JMP $EEFFC7          ; 5C C7 FF EE | Jump to address long
    EOR ($FF),Y          ; 51 FF | Exclusive OR with accumulator ((zero page),Y)
    EOR $BB37,Y          ; 59 37 BB | Exclusive OR with accumulator (absolute,Y)
    BRA $FF              ; 80 FF | Branch always
    RTI                  ; 40 | Return from interrupt
    EOR $D7              ; 45 D7 | Exclusive OR with accumulator (zero page)
    ROR $DFC5            ; 6E C5 DF | Rotate right (absolute)
    DEC $FFBF            ; CE BF FF | Decrement (absolute)
    ORA $99FF,X          ; 1D FF 99 | Logical OR with accumulator (absolute,X)
    LDA                  ; BF 00 FF 28 | Load from absolute long,X into accumulator
    BPL $FF              ; 10 FF | Branch if positive

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1EF
; Address: $E4EAB6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1EF:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    LDA ($DC,X)          ; A1 DC | Load from (zero page,X) into accumulator
    ORA ($5C,X)          ; 01 5C | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1F0
; Address: $E4EAC6
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1F0:
    JSL $A4295C          ; 22 5C 29 A4 | Jump to subroutine long
    BIT #$74             ; 89 74 | Test bits in accumulator (immediate)
    PHB                  ; 8B | Push data bank register to stack
    LDX $8C52            ; AE 52 8C | Load from absolute address into X register
    STY $72              ; 84 72 | Store Y register to zero page
    STA $AD73            ; 8D 73 AD | Store accumulator to absolute address
    LDY $AD52            ; AC 52 AD | Load from absolute address into Y register
    LDA $00FD50          ; AF 50 FD 00 | Load from absolute long address into accumulator
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    WDM #$0A             ; 42 0A | Reserved instruction
    LSR                  ; 4A | Logical shift right (accumulator)
    ADC $7500,X          ; 7D 00 75 | Add with carry (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    ORA $271E,Y          ; 19 1E 27 | Logical OR with accumulator (absolute,Y)
    SEC                  ; 38 | Set carry flag
    BMI $2B              ; 30 2B | Branch if negative

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1F1
; Address: $E4EB48
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1F1:
    SEI                  ; 78 | Set interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    BIT $07              ; 24 07 | Test bits in accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    NOP                  ; EA | No operation
    ASL $3ECA,X          ; 1E CA 3E | Arithmetic shift left (absolute,X)
    LDX $FA7C,Y          ; BE 7C FA | Load from absolute,Y into X register
    INX                  ; E8 | Increment X register
    PEA #$6C10           ; F4 10 6C | Push effective address to stack
    CPX #$F6             ; E0 F6 | Compare X register (immediate)
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    INC $FCFC,X          ; FE FC FC | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    SED                  ; F8 | Set decimal mode flag
    CPX #$EC             ; E0 EC | Compare X register (immediate)
    BVS $F5              ; 70 F5 | Branch if overflow set
    PLP                  ; 28 | Pull processor status from stack
    INX                  ; E8 | Increment X register
    BRA $50              ; 80 50 | Branch always
    SED                  ; F8 | Set decimal mode flag
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BRA $FF              ; 80 FF | Branch always
    SED                  ; F8 | Set decimal mode flag
    DEY                  ; 88 | Decrement Y register
    SBC $0DFA,Y          ; F9 FA 0D | Subtract with carry (absolute,Y)
    ASL $5655            ; 0E 55 56 | Arithmetic shift left (absolute)
    ROR                  ; 6A | Rotate right (accumulator)
    ORA ($64,X)          ; 01 64 | Logical OR with accumulator ((zero page,X))
    CPY #$A1             ; C0 A1 | Compare Y register (immediate)
    DEC $9EAD,X          ; DE AD 9E | Decrement (absolute,X)
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF 5C FD EE | Load from absolute long,X into accumulator
    INC $FFFB,X          ; FE FB FF | Increment (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDA #$57             ; A9 57 | Load immediate value into accumulator
    BPL $EF              ; 10 EF | Branch if positive
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF DE FF D4 | Load from absolute long,X into accumulator
    DEC $5F              ; C6 5F | Decrement (zero page)
    ORA $FDF1,X          ; 1D F1 FD | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1F2
; Address: $E4EBF4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1F2:
    JSL $FE01FD          ; 22 FD 01 FE | Jump to subroutine long
    JMP $3B542B          ; 5C 2B 54 3B | Jump to address long
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1F4
; Address: $E4EC24
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1F4:
    LDA $8840,X          ; BD 40 88 | Load from absolute,X into accumulator
    PLX                  ; FA | Pull X register from stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    BIT $6F00            ; 2C 00 6F | Test bits in accumulator (absolute)
    BIT $66              ; 24 66 | Test bits in accumulator (zero page)
    BVC $10              ; 50 10 | Branch if overflow clear
    BIT $1A0C            ; 2C 0C 1A | Test bits in accumulator (absolute)
    ASL $3F00,X          ; 1E 00 3F | Arithmetic shift left (absolute,X)
    JMP $006F00          ; 5C 00 6F 00 | Jump to address long
    CLC                  ; 18 | Clear carry flag
    LSR $9A90            ; 4E 90 9A | Logical shift right (absolute)
    LDY #$F2             ; A0 F2 | Load immediate value into Y register
    BMI $34              ; 30 34 | Branch if negative
    BVC $C8              ; 50 C8 | Branch if overflow clear
    BRA $60              ; 80 60 | Branch always
    SED                  ; F8 | Set decimal mode flag
    INC $7E00,X          ; FE 00 7E | Increment (absolute,X)
    INC $CC00,X          ; FE 00 CC | Increment (absolute,X)
    SEC                  ; 38 | Set carry flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BVS $E1              ; 70 E1 | Branch if overflow set
    ADC ($1E,X)          ; 61 1E | Add with carry ((zero page,X))
    BRA $FE              ; 80 FE | Branch always
    ORA $EF              ; 05 EF | Logical OR with accumulator (zero page)
    EOR ($30),Y          ; 51 30 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1F5
; Address: $E4EC8F
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1F5:
    JSR $00FC            ; 20 FC 00 | Jump to subroutine
    STA $009E00          ; 8F 00 9E 00 | Store accumulator to absolute long address
    XBA                  ; EB | Exchange accumulator bytes
    JMP $FD40            ; 4C 40 FD | Jump to address
    CPX #$EB             ; E0 EB | Compare X register (immediate)
    BNE $20              ; D0 20 | Branch if not equal
    PHA                  ; 48 | Push accumulator to stack
    TAY                  ; A8 | Transfer accumulator to Y register
    ROL $7CE6,X          ; 3E E6 7C | Rotate left (absolute,X)
    BCS $1C              ; B0 1C | Branch if carry set
    LDA                  ; BF 00 1F 00 | Load from absolute long,X into accumulator
    CMP $CF00,Y          ; D9 00 CF | Compare accumulator (absolute,Y)
    ORA ($C7,X)          ; 01 C7 | Logical OR with accumulator ((zero page,X))
    BIT $FF              ; 24 FF | Test bits in accumulator (zero page)
    AND $FFFE,Y          ; 39 FE FF | Logical AND with accumulator (absolute,Y)
    AND ($E1,X)          ; 21 E1 | Logical AND with accumulator ((zero page,X))
    ORA ($21,X)          ; 01 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1F6
; Address: $E4ECE6
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1F6:
    JSR $E420            ; 20 20 E4 | Jump to subroutine
    PLB                  ; AB | Pull data bank register from stack
    TAX                  ; AA | Transfer accumulator to X register
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    ASL $DEFF,X          ; 1E FF DE | Arithmetic shift left (absolute,X)
    ADC $7DFF,X          ; 7D FF 7D | Add with carry (absolute,X)
    AND #$3A             ; 29 3A | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1F7
; Address: $E4ED02
; Size: 112 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1F7:
    ADC #$FA             ; 69 FA | Add with carry (immediate)
    EOR $597A,Y          ; 59 7A 59 | Exclusive OR with accumulator (absolute,Y)
    PLX                  ; FA | Pull X register from stack
    SEI                  ; 78 | Set interrupt disable flag
    ORA $23BE,Y          ; 19 BE 23 | Logical OR with accumulator (absolute,Y)
    BEQ $59              ; F0 59 | Branch if equal
    PLY                  ; 7A | Pull Y register from stack
    STA $FF97FF          ; 8F FF 97 FF | Store accumulator to absolute long address
    BVS $8F              ; 70 8F | Branch if overflow set
    EOR ($46,X)          ; 41 46 | Exclusive OR with accumulator ((zero page,X))
    CPX $0C6B            ; EC 6B 0C | Compare X register (absolute)
    PHB                  ; 8B | Push data bank register to stack
    ROL $0C40            ; 2E 40 0C | Rotate left (absolute)
    BMI $FF              ; 30 FF | Branch if negative
    LDA                  ; BF 00 97 00 | Load from absolute long,X into accumulator
    STZ $AA69            ; 9C 69 AA | Store zero to absolute
    BNE $04              ; D0 04 | Branch if not equal
    CMP ($27,X)          ; C1 27 | Compare accumulator ((zero page,X))
    ORA #$71             ; 09 71 | Logical OR with accumulator (immediate)
    DEY                  ; 88 | Decrement Y register
    BCS $17              ; B0 17 | Branch if carry set
    INC $7F00,X          ; FE 00 7F | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BPL $9E              ; 10 9E | Branch if positive
    BCC $9D              ; 90 9D | Branch if carry clear
    BRA $9E              ; 80 9E | Branch always
    LDX $BF              ; A6 BF | Load from zero page into X register
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    PLY                  ; 7A | Pull Y register from stack
    BRA $FF              ; 80 FF | Branch always
    BVC $FF              ; 50 FF | Branch if overflow clear
    LDA                  ; BF FF BF FF | Load from absolute long,X into accumulator
    CPX #$E2             ; E0 E2 | Compare X register (immediate)
    ASL $109F            ; 0E 9F 10 | Arithmetic shift left (absolute)
    BPL $97              ; 10 97 | Branch if positive
    BCC $93              ; 90 93 | Branch if carry clear
    EOR $407F            ; 4D 7F 40 | Exclusive OR with accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    LSR                  ; 4A | Logical shift right (accumulator)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BRA $FF              ; 80 FF | Branch always
    LDA                  ; BF FF BF FF | Load from absolute long,X into accumulator
    STA $CC0360          ; 8F 60 03 CC | Store accumulator to absolute long address
    ADC ($F6,X)          ; 61 F6 | Add with carry ((zero page,X))
    ADC ($F6,X)          ; 61 F6 | Add with carry ((zero page,X))
    ADC ($F6),Y          ; 71 F6 | Add with carry ((zero page),Y)
    ORA ($5E),Y          ; 11 5E | Logical OR with accumulator ((zero page),Y)
    STA $FF8FFF          ; 8F FF 8F FF | Store accumulator to absolute long address
    STA $FF9FFF          ; 8F FF 9F FF | Store accumulator to absolute long address

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1F8
; Address: $E4EDC0
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1F8:
    EOR $597A,Y          ; 59 7A 59 | Exclusive OR with accumulator (absolute,Y)
    PLX                  ; FA | Pull X register from stack
    EOR $5B7A,Y          ; 59 7A 5B | Exclusive OR with accumulator (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    EOR #$7A             ; 49 7A | Exclusive OR with accumulator (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    EOR #$FA             ; 49 FA | Exclusive OR with accumulator (immediate)
    CLV                  ; B8 | Clear overflow flag
    SED                  ; F8 | Set decimal mode flag
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    BIT $EF              ; 24 EF | Test bits in accumulator (zero page)
    STA $67              ; 85 67 | Store accumulator to zero page
    INC $CCFF,X          ; FE FF CC | Increment (absolute,X)
    TXA                  ; 8A | Transfer X register to accumulator
    STZ $8CFF            ; 9C FF 8C | Store zero to absolute
    STZ $00FF            ; 9C FF 00 | Store zero to absolute
    STA ($61,X)          ; 81 61 | Store accumulator to (zero page,X)
    SBC ($11,X)          ; E1 11 | Subtract with carry ((zero page,X))
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    STY $1C              ; 84 1C | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1F9
; Address: $E4EE0C
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1F9:
    JSL $2A42D6          ; 22 D6 42 2A | Jump to subroutine long
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    SBC $FDFF,X          ; FD FF FD | Subtract with carry (absolute,X)
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    PHY                  ; 5A | Push Y register to stack
    WDM #$62             ; 42 62 | Reserved instruction
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    SBC $FDFF,X          ; FD FF FD | Subtract with carry (absolute,X)
    LSR $00FF            ; 4E FF 00 | Logical shift right (absolute)
    INC                  ; 1A | Increment accumulator
    BPL $13              ; 10 13 | Branch if positive
    BIT $00FE            ; 2C FE 00 | Test bits in accumulator (absolute)
    SBC $8F04,X          ; FD 04 8F | Subtract with carry (absolute,X)
    SBC $00FF,X          ; FD FF 00 | Subtract with carry (absolute,X)
    CPX $23FF            ; EC FF 23 | Compare X register (absolute)
    BPL $7C              ; 10 7C | Branch if positive
    STY $87              ; 84 87 | Store Y register to zero page
    STX $84              ; 86 84 | Store X register to zero page
    STY $04              ; 84 04 | Store Y register to zero page
    CPX $0E              ; E4 0E | Compare X register (zero page)
    LDA                  ; BF 10 50 00 | Load from absolute long,X into accumulator
    BNE $93              ; D0 93 | Branch if not equal
    SEI                  ; 78 | Set interrupt disable flag
    ADC $7BFF,Y          ; 79 FF 7B | Add with carry (absolute,Y)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    DEX                  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1FA
; Address: $E4EE85
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1FA:
    PLB                  ; AB | Pull data bank register from stack
    AND $C0              ; 25 C0 | Logical AND with accumulator (zero page)
    LDX $59              ; A6 59 | Load from zero page into X register
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    DEC $FEFF,X          ; DE FF FE | Decrement (absolute,X)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    ROR $017F,X          ; 7E 7F 01 | Rotate right (absolute,X)
    STA ($01),Y          ; 91 01 | Store accumulator to (zero page),Y
    ADC #$01             ; 69 01 | Add with carry (immediate)
    ORA ($69,X)          ; 01 69 | Logical OR with accumulator ((zero page,X))
    INC $42FE            ; EE FE 42 | Hardware register operation
    NOP                  ; EA | No operation
    RTI                  ; 40 | Return from interrupt
    BRA $FF              ; 80 FF | Branch always
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    LDA $BFFF,X          ; BD FF BF | Load from absolute,X into accumulator
    EOR ($7A,X)          ; 41 7A | Exclusive OR with accumulator ((zero page,X))
    AND $21B8,Y          ; 39 B8 21 | PPU graphics register access
    TSX                  ; BA | Transfer stack pointer to X register
    ORA ($BA),Y          ; 11 BA | Logical OR with accumulator ((zero page),Y)
    ORA #$BA             ; 09 BA | Logical OR with accumulator (immediate)
    AND #$BA             ; 29 BA | Logical AND with accumulator (immediate)
    LDY $DA19,X          ; BC 19 DA | Load from absolute,X into Y register
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    TSX                  ; BA | Transfer stack pointer to X register
    BCC $D5              ; 90 D5 | Branch if carry clear
    ADC $6BFF,Y          ; 79 FF 6B | Add with carry (absolute,Y)
    ROR $00FF            ; 6E FF 00 | Rotate right (absolute)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1FB
; Address: $E4EEFE
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1FB:
    JMP ($3FFF)          ; 6C FF 3F | Jump to address (absolute indirect)
    CPY #$21             ; C0 21 | PPU graphics register access
    ASL $9EA1,X          ; 1E A1 9E | Arithmetic shift left (absolute,X)
    LDA $859C            ; AD 9C 85 | Load from absolute address into accumulator
    LDA ($92,X)          ; A1 92 | Load from (zero page,X) into accumulator
    LDA $96              ; A5 96 | Load from zero page into accumulator
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ASL $080C            ; 0E 0C 08 | Arithmetic shift left (absolute)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1FC
; Address: $E4EF42
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1FC:
    LDX $F05F,Y          ; BE 5F F0 | Load from absolute,Y into X register
    BEQ $17              ; F0 17 | Branch if equal
    BEQ $13              ; F0 13 | Branch if equal
    STA $A05F            ; 8D 5F A0 | Store accumulator to absolute address
    LDY #$4A             ; A0 4A | Load immediate value into Y register
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    INC                  ; 1A | Increment accumulator
    CPY $AC              ; C4 AC | Compare Y register (zero page)
    LDY #$74             ; A0 74 | Load immediate value into Y register
    STX $F0              ; 86 F0 | Store X register to zero page
    BNE $EE              ; D0 EE | Branch if not equal
    PLP                  ; 28 | Pull processor status from stack
    STA $52F4,Y          ; 99 F4 52 | Store accumulator to absolute,Y
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1FD
; Address: $E4EF72
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1FD:
    JSR $10DC            ; 20 DC 10 | Jump to subroutine
    INC $FE00            ; EE 00 FE | Increment (absolute)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    BEQ $93              ; F0 93 | Branch if equal
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA #$2B             ; 09 2B | Logical OR with accumulator (immediate)
    INY                  ; C8 | Increment Y register
    INX                  ; E8 | Increment X register
    CLI                  ; 58 | Clear interrupt disable flag
    PLA                  ; 68 | Pull accumulator from stack
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    INC $08FF,X          ; FE FF 08 | Increment (absolute,X)
    ASL $17              ; 06 17 | Arithmetic shift left (zero page)
    SEC                  ; 38 | Set carry flag
    REP #$FB             ; C2 FB | Reset processor status bits
    BRA $80              ; 80 80 | Branch always
    BRA $E8              ; 80 E8 | Branch always
    INC $BB05,X          ; FE 05 BB | Increment (absolute,X)
    LDY $5D51            ; AC 51 5D | Load from absolute address into Y register
    LDY #$F5             ; A0 F5 | Load immediate value into Y register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND ($D6,X)          ; 21 D6 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1FE
; Address: $E4EFCC
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1FE:
    JSL $FF356E          ; 22 6E 35 FF | Jump to subroutine long
    STA ($00),Y          ; 91 00 | Store accumulator to (zero page),Y
    CMP $6F              ; C5 6F | Compare accumulator (zero page)
    TXS                  ; 9A | Transfer X register to stack pointer
    SBC $5A05,X          ; FD 05 5A | Subtract with carry (absolute,X)
    LDA #$CF             ; A9 CF | Load immediate value into accumulator
    BMI $B0              ; 30 B0 | Branch if negative
    EOR $3818            ; 4D 18 38 | Exclusive OR with accumulator (absolute)
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    CLV                  ; B8 | Clear overflow flag
    STA ($56),Y          ; 91 56 | Store accumulator to (zero page),Y
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank48_DmaFunction_1FF
; Address: $E4F005
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_1FF:
    SBC $7E              ; E5 7E | Subtract with carry (zero page)
    ORA ($9C,X)          ; 01 9C | Logical OR with accumulator ((zero page,X))
    STA ($0C,X)          ; 81 0C | Store accumulator to (zero page,X)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    LDA                  ; BF FF 81 FF | Load from absolute long,X into accumulator
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    DEC                  ; 3A | Decrement accumulator
    ADC ($7F),Y          ; 71 7F | Add with carry ((zero page),Y)
    BRA $3F              ; 80 3F | Branch always
    CPY #$7E             ; C0 7E | Compare Y register (immediate)
    CMP ($71,X)          ; C1 71 | Compare accumulator ((zero page,X))
    LDA                  ; BF FF 80 FF | Load from absolute long,X into accumulator
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    LDA                  ; BF FF BE FF | Load from absolute long,X into accumulator
    STA $FFFF,X          ; 9D FF FF | Store accumulator to absolute,X
    LDY $FF              ; A4 FF | Load from zero page into Y register
    RTI                  ; 40 | Return from interrupt
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank48_DmaFunction_201
; Address: $E4F05E
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_201:
    JMP ($01FF)          ; 6C FF 01 | Jump to address (absolute indirect)
    PEA #$FCA9           ; F4 A9 FC | Push effective address to stack
    ORA ($FC),Y          ; 11 FC | Logical OR with accumulator ((zero page),Y)
    ROL $3637            ; 2E 37 36 | Rotate left (absolute)
    SBC $C9FF,X          ; FD FF C9 | Subtract with carry (absolute,X)
    SBC $9FFF            ; ED FF 9F | Subtract with carry (absolute)
    ADC ($91,X)          ; 61 91 | Add with carry ((zero page,X))
    LDA ($49,X)          ; A1 49 | Load from (zero page,X) into accumulator
    ADC ($95,X)          ; 61 95 | Add with carry ((zero page,X))
    SBC ($09,X)          ; E1 09 | Subtract with carry ((zero page,X))
    ASL $AA5E            ; 0E 5E AA | Arithmetic shift left (absolute)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    SBC $FFFF,X          ; FD FF FF | Subtract with carry (absolute,X)
    CPX $D060            ; EC 60 D0 | Compare X register (absolute)
    RTI                  ; 40 | Return from interrupt
    INX                  ; E8 | Increment X register
    RTI                  ; 40 | Return from interrupt
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_202
; Address: $E4F0B9
; Size: 115 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_202:
    BRA $00              ; 80 00 | Branch always
    SBC ($67,X)          ; E1 67 | Subtract with carry ((zero page,X))
    STY $04              ; 84 04 | Store Y register to zero page
    BIT $FF              ; 24 FF | Test bits in accumulator (zero page)
    AND $FFFE,Y          ; 39 FE FF | Logical AND with accumulator (absolute,Y)
    BRA $FF              ; 80 FF | Branch always
    EOR $EF              ; 45 EF | Exclusive OR with accumulator (zero page)
    STA                  ; 9F F8 57 A8 | Store accumulator to absolute long,X
    LDY $FF53            ; AC 53 FF | Load from absolute address into Y register
    BCS $4D              ; B0 4D | Branch if carry set
    CLV                  ; B8 | Clear overflow flag
    ADC $7D01,Y          ; 79 01 7D | Add with carry (absolute,Y)
    STZ $E4              ; 64 E4 | Store zero to zero page
    ASL $101F            ; 0E 1F 10 | Arithmetic shift left (absolute)
    BPL $00              ; 10 00 | Branch if positive
    BPL $FF              ; 10 FF | Branch if positive
    INC $FBFF,X          ; FE FF FB | Increment (absolute,X)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CMP $B2CD            ; CD CD B2 | Compare accumulator (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    SEP #$F2             ; E2 F2 | Set processor status bits
    ADC $F459,Y          ; 79 59 F4 | Add with carry (absolute,Y)
    SBC ($A1,X)          ; E1 A1 | Subtract with carry ((zero page,X))
    ORA $24FF            ; 0D FF 24 | Logical OR with accumulator (absolute)
    ORA $86FF            ; 0D FF 86 | Logical OR with accumulator (absolute)
    ASL $99FF,X          ; 1E FF 99 | Arithmetic shift left (absolute,X)
    STA $DD73,X          ; 9D 73 DD | Store accumulator to absolute,X
    BIT #$77             ; 89 77 | Test bits in accumulator (immediate)
    STA $DD77,Y          ; 99 77 DD | Store accumulator to absolute,Y
    DEY                  ; 88 | Decrement Y register
    STA $0073,X          ; 9D 73 00 | Store accumulator to absolute,X
    CPX $CCFF            ; EC FF CC | Compare X register (absolute)
    INC $FFEE            ; EE EE FF | Increment (absolute)
    CMP $CEFE            ; CD FE CE | Compare accumulator (absolute)
    DEC $00FF            ; CE FF 00 | Decrement (absolute)
    LDA ($A1,X)          ; A1 A1 | Load from (zero page,X) into accumulator
    INC                  ; 1A | Increment accumulator
    PLX                  ; FA | Pull X register from stack
    BPL $13              ; 10 13 | Branch if positive
    LDY $00FC            ; AC FC 00 | Load from absolute address into Y register
    STY $FFFD            ; 8C FD FF | Store Y register to absolute address
    LSR $EFFF,X          ; 5E FF EF | Logical shift right (absolute,X)
    CPX $03FF            ; EC FF 03 | Compare X register (absolute)
    PLX                  ; FA | Pull X register from stack
    TXA                  ; 8A | Transfer X register to accumulator
    BEQ $40              ; F0 40 | Branch if equal
    PLX                  ; FA | Pull X register from stack
    TSX                  ; BA | Transfer stack pointer to X register
    SBC $FD09,Y          ; F9 09 FD | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_203
; Address: $E4F1A9
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_203:
    ORA $F6FE,X          ; 1D FE F6 | Logical OR with accumulator (absolute,X)
    INC $FD42,X          ; FE 42 FD | Increment (absolute,X)
    LDA $05              ; A5 05 | Load from zero page into accumulator
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    AND $3B68            ; 2D 68 3B | Logical AND with accumulator (absolute)
    PLA                  ; 68 | Pull accumulator from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_206
; Address: $E4F1CC
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_206:
    JMP $F040            ; 4C 40 F0 | Jump to address
    BRA $17              ; 80 17 | Branch always
    STA                  ; 9F 00 80 00 | Store accumulator to absolute long,X
    STA                  ; 9F 00 9F 00 | Store accumulator to absolute long,X
    LDY $7000,X          ; BC 00 70 | Load from absolute,X into Y register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDA ($08,X)          ; A1 08 | Load from (zero page,X) into accumulator
    SEP #$0B             ; E2 0B | Set processor status bits
    LDX $EAAF            ; AE AF EA | Load from absolute address into X register
    ROR                  ; 6A | Rotate right (accumulator)
    ORA ($20),Y          ; 11 20 | Logical OR with accumulator ((zero page),Y)
    ASL $FC00            ; 0E 00 FC | Arithmetic shift left (absolute)
    SBC $5100,X          ; FD 00 51 | Subtract with carry (absolute,X)
    SBC $FD00,X          ; FD 00 FD | Subtract with carry (absolute,X)
    CMP $9933,X          ; DD 33 99 | Compare accumulator (absolute,X)
    STY $DD73            ; 8C 73 DD | Store Y register to absolute address
    CMP $8C37,Y          ; D9 37 8C | Compare accumulator (absolute,Y)
    STA $0077,Y          ; 99 77 00 | Store accumulator to absolute,Y
    INC $EFDC,X          ; FE DC EF | Increment (absolute,X)
    INC $CEFF            ; EE FF CE | Increment (absolute)
    INC $FFCE,X          ; FE CE FF | Increment (absolute,X)
    INC $00FF            ; EE FF 00 | Increment (absolute)
    ORA $BB              ; 05 BB | Logical OR with accumulator (zero page)
    LDA $5D50            ; AD 50 5D | Load from absolute address into accumulator
    LDY #$F7             ; A0 F7 | Load immediate value into Y register
    PHP                  ; 08 | Push processor status to stack
    AND ($D6,X)          ; 21 D6 | Logical AND with accumulator ((zero page,X))
    EOR $40              ; 45 40 | Exclusive OR with accumulator (zero page)
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    EOR $0000,X          ; 5D 00 00 | Exclusive OR with accumulator (absolute,X)
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank48_DmaFunction_207
; Address: $E4F276
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_207:
    JSR $407F            ; 20 7F 40 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    WDM #$02             ; 42 02 | Reserved instruction
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank48_DmaFunction_208
; Address: $E4F28F
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_208:
    STZ $00              ; 64 00 | Store zero to zero page
    INC $FE04,X          ; FE 04 FE | Increment (absolute,X)
    INC $FE10,X          ; FE 10 FE | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    INC $FE80,X          ; FE 80 FE | Increment (absolute,X)
    CPX $5E0C            ; EC 0C 5E | Compare X register (absolute)
    CMP $FF02,X          ; DD 02 FF | Compare accumulator (absolute,X)
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    BPL $FF              ; 10 FF | Branch if positive
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    EOR ($FF),Y          ; 51 FF | Exclusive OR with accumulator ((zero page),Y)
    XBA                  ; EB | Exchange accumulator bytes
    XBA                  ; EB | Exchange accumulator bytes
    ASL $BF              ; 06 BF | Arithmetic shift left (zero page)
    LDA $04BF04          ; AF 04 BF 04 | Load from absolute long address into accumulator
    EOR ($FF,X)          ; 41 FF | Exclusive OR with accumulator ((zero page,X))
    ADC ($FF),Y          ; 71 FF | Add with carry ((zero page),Y)
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ROR                  ; 6A | Rotate right (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($0A),Y          ; 11 0A | Logical OR with accumulator ((zero page),Y)
    ORA ($0A),Y          ; 11 0A | Logical OR with accumulator ((zero page),Y)
    ORA ($0A),Y          ; 11 0A | Logical OR with accumulator ((zero page),Y)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA ($04),Y          ; 11 04 | Logical OR with accumulator ((zero page),Y)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ASL $1F00            ; 0E 00 1F | Arithmetic shift left (absolute)
    ORA ($2C,X)          ; 01 2C | Logical OR with accumulator ((zero page,X))
    JMP ($74FF)          ; 6C FF 74 | Jump to address (absolute indirect)
    ADC ($FF),Y          ; 71 FF | Add with carry ((zero page),Y)
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    EOR ($FF),Y          ; 51 FF | Exclusive OR with accumulator ((zero page),Y)
    EOR ($FF),Y          ; 51 FF | Exclusive OR with accumulator ((zero page),Y)
    ROR $FE04,X          ; 7E 04 FE | Rotate right (absolute,X)
    INC $FE04,X          ; FE 04 FE | Increment (absolute,X)
    LDA                  ; BF 04 BF 6E | Load from absolute long,X into accumulator
    ROR $6AFF            ; 6E FF 6A | Rotate right (absolute)
    NOP                  ; EA | No operation
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    ROR $DD6E            ; 6E 6E DD | Rotate right (absolute)
    EOR ($FF,X)          ; 41 FF | Exclusive OR with accumulator ((zero page,X))
    BCS $48              ; B0 48 | Branch if carry set
    STA ($FF),Y          ; 91 FF | Store accumulator to (zero page),Y

;------------------------------------------------------------------------------
; Bank48_DmaFunction_209
; Address: $E4F363
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_209:
    SEI                  ; 78 | Set interrupt disable flag
    ROL $5A00,X          ; 3E 00 5A | Rotate left (absolute,X)
    ROL $00              ; 26 00 | Rotate left (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ROL $7F08,X          ; 3E 08 7F | Rotate left (absolute,X)
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    PHY                  ; 5A | Push Y register to stack
    ASL $EC00,X          ; 1E 00 EC | Arithmetic shift left (absolute,X)
    CLV                  ; B8 | Clear overflow flag
    CPY $00              ; C4 00 | Compare Y register (zero page)
    CPY $A400            ; CC 00 A4 | Compare Y register (absolute)
    BRA $FE              ; 80 FE | Branch always
    BRA $FE              ; 80 FE | Branch always
    CPX #$FE             ; E0 FE | Compare X register (immediate)
    BPL $FE              ; 10 FE | Branch if positive
    INC $FE0A,X          ; FE 0A FE | Increment (absolute,X)
    INC $FE02,X          ; FE 02 FE | Increment (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_20B
; Address: $E4F3A8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_20B:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BPL $20              ; 10 20 | Branch if positive
    LDX $00FF,Y          ; BE FF 00 | Load from absolute,Y into X register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_20C
; Address: $E4F3B5
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_20C:
    STA                  ; 9F 1F E0 00 | Store accumulator to absolute long,X
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    CLC                  ; 18 | Clear carry flag
    BRA $7F              ; 80 7F | Branch always
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    ASL $0E11            ; 0E 11 0E | Arithmetic shift left (absolute)
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    INC $D501,X          ; FE 01 D5 | Increment (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    CPY #$37             ; C0 37 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    LDA $FFB6,X          ; BD B6 FF | Load from absolute,X into accumulator
    ADC $82FB,Y          ; 79 FB 82 | Add with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_20D
; Address: $E4F42F
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_20D:
    DEC $FF              ; C6 FF | Decrement (zero page)
    AND $00FF,X          ; 3D FF 00 | Logical AND with accumulator (absolute,X)
    CMP $4100,X          ; DD 00 41 | Compare accumulator (absolute,X)
    BIT $0C5E            ; 2C 5E 0C | Test bits in accumulator (absolute)
    INC $FD1D,X          ; FE 1D FD | Increment (absolute,X)
    ORA $11FD,X          ; 1D FD 11 | Logical OR with accumulator (absolute,X)
    ORA $1CFF,X          ; 1D FF 1C | Logical OR with accumulator (absolute,X)
    BPL $FF              ; 10 FF | Branch if positive
    BEQ $FF              ; F0 FF | Branch if equal
    AND ($FF,X)          ; 21 FF | Logical AND with accumulator ((zero page,X))
    AND ($FF,X)          ; 21 FF | Logical AND with accumulator ((zero page,X))
    LDA $062F06          ; AF 06 2F 06 | Load from absolute long address into accumulator
    LDA                  ; BF 12 FB 02 | Load from absolute long,X into accumulator
    XBA                  ; EB | Exchange accumulator bytes
    SBC #$0C             ; E9 0C | Subtract with carry (immediate)
    SBC #$04             ; E9 04 | Subtract with carry (immediate)
    SBC ($09,X)          ; E1 09 | Subtract with carry ((zero page,X))
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    ADC ($FF),Y          ; 71 FF | Add with carry ((zero page),Y)
    EOR ($FF,X)          ; 41 FF | Exclusive OR with accumulator ((zero page,X))
    EOR ($FF,X)          ; 41 FF | Exclusive OR with accumulator ((zero page,X))
    EOR ($FF,X)          ; 41 FF | Exclusive OR with accumulator ((zero page,X))
    EOR ($FF,X)          ; 41 FF | Exclusive OR with accumulator ((zero page,X))
    EOR ($FF,X)          ; 41 FF | Exclusive OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $0E7F            ; 0E 7F 0E | Arithmetic shift left (absolute)
    ASL $F7              ; 06 F7 | Arithmetic shift left (zero page)
    ROL $D7              ; 26 D7 | Rotate left (zero page)
    BRA $67              ; 80 67 | Branch always
    CMP ($FF),Y          ; D1 FF | Compare accumulator ((zero page),Y)
    EOR ($FF),Y          ; 51 FF | Exclusive OR with accumulator ((zero page),Y)
    EOR ($FF),Y          ; 51 FF | Exclusive OR with accumulator ((zero page),Y)
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    SBC $79FF,Y          ; F9 FF 79 | Subtract with carry (absolute,Y)
    ADC #$FF             ; 69 FF | Add with carry (immediate)
    ADC #$FF             ; 69 FF | Add with carry (immediate)
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    ORA $15              ; 05 15 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    ORA ($0A),Y          ; 11 0A | Logical OR with accumulator ((zero page),Y)
    ORA ($0A),Y          ; 11 0A | Logical OR with accumulator ((zero page),Y)
    ORA ($0A),Y          ; 11 0A | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_20E
; Address: $E4F4E9
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_20E:
    ORA ($0A),Y          ; 11 0A | Logical OR with accumulator ((zero page),Y)
    ORA ($0A),Y          ; 11 0A | Logical OR with accumulator ((zero page),Y)
    ORA ($0A),Y          ; 11 0A | Logical OR with accumulator ((zero page),Y)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    BIT $DB              ; 24 DB | Test bits in accumulator (zero page)
    JMP $00FF            ; 4C FF 00 | Jump to address
    CPY $CD02            ; CC 02 CD | Compare Y register (absolute)
    STA $9F00,X          ; 9D 00 9F | Store accumulator to absolute,X
    STA                  ; 9F 00 B7 00 | Store accumulator to absolute long,X
    BMI $FF              ; 30 FF | Branch if negative
    BMI $FF              ; 30 FF | Branch if negative
    BCS $FF              ; B0 FF | Branch if carry set
    BEQ $FF              ; F0 FF | Branch if equal
    BCC $FF              ; 90 FF | Branch if carry clear
    STA $2F00            ; 8D 00 2F | Store accumulator to absolute address
    SBC $FD60            ; ED 60 FD | Subtract with carry (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_20F
; Address: $E4F54D
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_20F:
    INC $BC20,X          ; FE 20 BC | Increment (absolute,X)
    ADC $7CFF            ; 6D FF 7C | Add with carry (absolute)
    PEA #$90FF           ; F4 FF 90 | Push effective address to stack
    BCC $FF              ; 90 FF | Branch if carry clear
    BRA $6F              ; 80 6F | Branch always
    STA                  ; 9F 00 9D 00 | Store accumulator to absolute long,X
    SBC $FD00,X          ; FD 00 FD | Subtract with carry (absolute,X)
    EOR $FDFF,X          ; 5D FF FD | Exclusive OR with accumulator (absolute,X)
    STZ $FF              ; 64 FF | Store zero to zero page
    STZ $FF              ; 64 FF | Store zero to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_213
; Address: $E4F581
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_213:
    ADC $0500,X          ; 7D 00 05 | Add with carry (absolute,X)
    STA                  ; 9F 28 BF 28 | Store accumulator to absolute long,X
    SEC                  ; 38 | Set carry flag
    AND ($29),Y          ; 31 29 | Logical AND with accumulator ((zero page),Y)
    PLY                  ; 7A | Pull Y register from stack
    BVC $FF              ; 50 FF | Branch if overflow clear
    LSR $FF              ; 46 FF | Logical shift right (zero page)
    ROR $15FF,X          ; 7E FF 15 | Rotate right (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $1102            ; 0E 02 11 | Arithmetic shift left (absolute)
    ORA ($02),Y          ; 11 02 | Logical OR with accumulator ((zero page),Y)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA ($04),Y          ; 11 04 | Logical OR with accumulator ((zero page),Y)
    ORA ($04),Y          ; 11 04 | Logical OR with accumulator ((zero page),Y)
    SBC ($02),Y          ; F1 02 | Subtract with carry ((zero page),Y)
    BEQ $00              ; F0 00 | Branch if equal
    RTI                  ; 40 | Return from interrupt
    CPY #$40             ; C0 40 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_214
; Address: $E4F5ED
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_214:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank48_DmaFunction_216
; Address: $E4F604
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_216:
    JSR $48B7            ; 20 B7 48 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    SBC $FF13            ; ED 13 FF | Subtract with carry (absolute)
    ASL $DEFF,X          ; 1E FF DE | Arithmetic shift left (absolute,X)
    INC $FBFF,X          ; FE FF FB | Increment (absolute,X)
    PEA #$A7B0           ; F4 B0 A7 | Push effective address to stack
    CPY $FE7E            ; CC 7E FE | Compare Y register (absolute)
    AND $CB4B,X          ; 3D 4B CB | Logical AND with accumulator (absolute,X)
    LDA ($21,X)          ; A1 21 | PPU graphics register access
    JMP ($FC60)          ; 6C 60 FC | Jump to address (absolute indirect)
    DEC $9F00,X          ; DE 00 9F | Decrement (absolute,X)
    LDA $3D199F          ; AF 9F 19 3D | Load from absolute long address into accumulator
    ROL $C9D9,X          ; 3E D9 C9 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_217
; Address: $E4F64D
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_217:
    JSL $1F707E          ; 22 7E 70 1F | Jump to subroutine long
    LDA                  ; BF 00 7F 00 | Load from absolute long,X into accumulator
    SBC $3600,Y          ; F9 00 36 | Subtract with carry (absolute,Y)
    CMP $8F00,X          ; DD 00 8F | Compare accumulator (absolute,X)
    ORA ($F7),Y          ; 11 F7 | Logical OR with accumulator ((zero page),Y)
    BPL $F7              ; 10 F7 | Branch if positive
    BMI $FF              ; 30 FF | Branch if negative
    EOR ($CD,X)          ; 41 CD | Exclusive OR with accumulator ((zero page,X))
    STZ $88FF            ; 9C FF 88 | Store zero to absolute
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    TSX                  ; BA | Transfer stack pointer to X register
    AND ($C2,X)          ; 21 C2 | Logical AND with accumulator ((zero page,X))
    AND #$DE             ; 29 DE | Logical AND with accumulator (immediate)
    AND ($D6,X)          ; 21 D6 | Logical AND with accumulator ((zero page,X))
    AND $C6              ; 25 C6 | Logical AND with accumulator (zero page)
    AND ($DA,X)          ; 21 DA | Logical AND with accumulator ((zero page,X))
    AND $187F,X          ; 3D 7F 18 | Logical AND with accumulator (absolute,X)
    BIT $30EF            ; 2C EF 30 | Test bits in accumulator (absolute)
    LDY $A4FF,X          ; BC FF A4 | Load from absolute,X into Y register
    BRA $FF              ; 80 FF | Branch always
    DEY                  ; 88 | Decrement Y register
    STX $94FF            ; 8E FF 94 | Store X register to absolute address
    DEY                  ; 88 | Decrement Y register
    STY $31FF            ; 8C FF 31 | Store Y register to absolute address
    STX $29              ; 86 29 | Store X register to zero page

;------------------------------------------------------------------------------
; Bank48_DmaFunction_219
; Address: $E4F6C6
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_219:
    JSR $8CD5            ; 20 D5 8C | Jump to subroutine
    LDA $96A1,X          ; BD A1 96 | Load from absolute,X into accumulator
    AND $D6              ; 25 D6 | Logical AND with accumulator (zero page)
    BIT $D6              ; 24 D6 | Test bits in accumulator (zero page)
    PLY                  ; 7A | Pull Y register from stack
    INC $20A2,X          ; FE A2 20 | Increment (absolute,X)
    CMP $C240,Y          ; D9 40 C2 | Compare accumulator (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    CLV                  ; B8 | Clear overflow flag
    SEC                  ; 38 | Set carry flag
    STA $F261,Y          ; 99 61 F2 | Store accumulator to absolute,Y
    LDA                  ; BF 00 BF 00 | Load from absolute long,X into accumulator
    SED                  ; F8 | Set decimal mode flag
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    INC                  ; 1A | Increment accumulator
    ORA $29AB,Y          ; 19 AB 29 | Logical OR with accumulator (absolute,Y)
    ORA $E51D,X          ; 1D 1D E5 | Logical OR with accumulator (absolute,X)
    STA $3D4B,Y          ; 99 4B 3D | Store accumulator to absolute,Y
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BEQ $F0              ; F0 F0 | Branch if equal
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    INY                  ; C8 | Increment Y register
    SED                  ; F8 | Set decimal mode flag
    CPX $FFED            ; EC ED FF | Compare X register (absolute)
    CPY $00FF            ; CC FF 00 | Compare Y register (absolute)
    EOR #$7F             ; 49 7F | Exclusive OR with accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    AND ($3D,X)          ; 21 3D | Logical AND with accumulator ((zero page,X))
    WDM #$7B             ; 42 7B | Reserved instruction
    INC $28              ; E6 28 | Increment (zero page)
    AND $FF00            ; 2D 00 FF | Logical AND with accumulator (absolute)
    CMP #$7F             ; C9 7F | Compare accumulator (immediate)
    BRA $FC              ; 80 FC | Branch always
    AND $7BC2,X          ; 3D C2 7B | Logical AND with accumulator (absolute,X)
    STY $E6              ; 84 E6 | Store Y register to zero page
    ORA $D22D,Y          ; 19 2D D2 | Logical OR with accumulator (absolute,Y)
    ROR $EE              ; 66 EE | Rotate right (zero page)
    STY $FE32            ; 8C 32 FE | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank48_DmaFunction_21A
; Address: $E4F766
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_21A:
    JSR $C0F8            ; 20 F8 C0 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    STA $7BFF,Y          ; 99 FF 7B | Store accumulator to absolute,Y
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    LDA                  ; BF FF FF FF | Load from absolute long,X into accumulator
    LDA ($D2,X)          ; A1 D2 | Load from (zero page,X) into accumulator
    LDY #$DE             ; A0 DE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank48_DmaFunction_21B
; Address: $E4F784
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_21B:
    LDX $D7              ; A6 D7 | Load from zero page into X register
    SBC $6D00,X          ; FD 00 6D | Subtract with carry (absolute,X)
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    ADC $E1FF,Y          ; 79 FF E1 | Add with carry (absolute,Y)
    ORA ($F7),Y          ; 11 F7 | Logical OR with accumulator ((zero page),Y)
    ASL $14FF,X          ; 1E FF 14 | Arithmetic shift left (absolute,X)
    BIT $E7              ; 24 E7 | Test bits in accumulator (zero page)
    BVC $F7              ; 50 F7 | Branch if overflow clear
    CLV                  ; B8 | Clear overflow flag
    LDY $FF              ; A4 FF | Load from zero page into Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    STX $FF              ; 86 FF | Store X register to zero page
    STY $9CFF            ; 8C FF 9C | Store Y register to absolute address
    DEY                  ; 88 | Decrement Y register
    LDA ($DA,X)          ; A1 DA | Load from (zero page,X) into accumulator
    PLP                  ; 28 | Pull processor status from stack
    STA $D621,X          ; 9D 21 D6 | Store accumulator to absolute,X
    AND $289E            ; 2D 9E 28 | Logical AND with accumulator (absolute)
    CMP $BD8C,X          ; DD 8C BD | Compare accumulator (absolute,X)
    AND $D6              ; 25 D6 | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_21C
; Address: $E4F7CE
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_21C:
    JSR $7F9A            ; 20 9A 7F | Jump to subroutine
    ROR $01FE,X          ; 7E FE 01 | Rotate right (absolute,X)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA #$0F             ; 09 0F | Logical OR with accumulator (immediate)
    ORA #$07             ; 09 07 | Logical OR with accumulator (immediate)
    ORA $3913,X          ; 1D 13 39 | Logical OR with accumulator (absolute,X)
    STA $DDF7,Y          ; 99 F7 DD | Store accumulator to absolute,Y
    CPY $6CFF            ; CC FF 6C | Compare Y register (absolute)
    ROL $1F0E,X          ; 3E 0E 1F | Rotate left (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BVC $50              ; 50 50 | Branch if overflow clear
    RTI                  ; 40 | Return from interrupt
    CPY #$01             ; C0 01 | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    TYA                  ; 98 | Transfer Y register to accumulator
    BVC $AF              ; 50 AF | Branch if overflow clear
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    BVS $1A              ; 70 1A | Branch if overflow set
    BPL $44              ; 10 44 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_21D
; Address: $E4F849
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_21D:
    CPX #$01             ; E0 01 | Compare X register (immediate)
    INC $EF10,X          ; FE 10 EF | Increment (absolute,X)
    BIT $70              ; 24 70 | Test bits in accumulator (zero page)
    STA $60EF10          ; 8F 10 EF 60 | Store accumulator to absolute long address
    STA                  ; 9F E0 1F FE | Store accumulator to absolute long,X
    ORA ($EF,X)          ; 01 EF | Logical OR with accumulator ((zero page,X))
    BPL $FF              ; 10 FF | Branch if positive
    LDA                  ; BF 40 03 FC | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank48_DmaFunction_21E
; Address: $E4F865
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_21E:
    LDA                  ; BF 00 FF 00 | Load from absolute long,X into accumulator
    LDA $BF00,X          ; BD 00 BF | Load from absolute,X into accumulator
    LDA                  ; BF FF 03 BF | Load from absolute long,X into accumulator
    RTI                  ; 40 | Return from interrupt
    LDA $BF42,X          ; BD 42 BF | Load from absolute,X into accumulator
    RTI                  ; 40 | Return from interrupt
    LDA ($19,X)          ; A1 19 | Load from (zero page,X) into accumulator
    RTI                  ; 40 | Return from interrupt
    AND ($83,X)          ; 21 83 | Logical AND with accumulator ((zero page,X))
    WDM #$82             ; 42 82 | Reserved instruction
    ASL $05              ; 06 05 | Arithmetic shift left (zero page)
    BRA $0A              ; 80 0A | Branch always
    ORA $0C03            ; 0D 03 0C | Logical OR with accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    ORA ($E2,X)          ; 01 E2 | Logical OR with accumulator ((zero page,X))
    CPY $07              ; C4 07 | Compare Y register (zero page)
    STA ($07,X)          ; 81 07 | Store accumulator to (zero page,X)
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    ASL $0F00            ; 0E 00 0F | Arithmetic shift left (absolute)
    BCC $40              ; 90 40 | Branch if carry clear
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $40              ; 80 40 | Branch always
    CPY #$57             ; C0 57 | Compare Y register (immediate)
    SBC $FF              ; E5 FF | Subtract with carry (zero page)
    BCC $6F              ; 90 6F | Branch if carry clear
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BRA $7F              ; 80 7F | Branch always
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    TAY                  ; A8 | Transfer accumulator to Y register
    SBC $1A              ; E5 1A | Subtract with carry (zero page)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_21F
; Address: $E4F8C3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_21F:
    JSR $301A            ; 20 1A 30 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    AND ($14),Y          ; 31 14 | Logical AND with accumulator ((zero page),Y)
    BMI $DB              ; 30 DB | Branch if negative

;------------------------------------------------------------------------------
; Bank48_DmaFunction_220
; Address: $E4F8D2
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_220:
    JSR $30DF            ; 20 DF 30 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 31 CE 30 | Load from absolute long,X into accumulator
    BIT $D7              ; 24 D7 | Test bits in accumulator (zero page)
    PLP                  ; 28 | Pull processor status from stack
    LDA                  ; BF 00 FF 00 | Load from absolute long,X into accumulator
    LDA                  ; BF 00 A8 00 | Load from absolute long,X into accumulator
    ADC #$BF             ; 69 BF | Add with carry (immediate)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 40 A8 57 | Load from absolute long,X into accumulator
    PLB                  ; AB | Pull data bank register from stack
    LDA                  ; BF 00 EE 00 | Load from absolute long,X into accumulator
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    PLB                  ; AB | Pull data bank register from stack
    BPL $BF              ; 10 BF | Branch if positive

;------------------------------------------------------------------------------
; Bank48_DmaFunction_221
; Address: $E4F917
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_221:
    RTI                  ; 40 | Return from interrupt
    INC $EF11            ; EE 11 EF | Increment (absolute)
    BPL $24              ; 10 24 | Branch if positive
    PLA                  ; 68 | Pull accumulator from stack
    CPX #$EF             ; E0 EF | Compare X register (immediate)
    AND $6218            ; 2D 18 62 | Logical AND with accumulator (absolute)
    CPY #$DF             ; C0 DF | Compare Y register (immediate)
    SBC ($EF),Y          ; F1 EF | Subtract with carry ((zero page),Y)
    CPY $9FE0            ; CC E0 9F | Compare Y register (absolute)
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    AND $02FB            ; 2D FB 02 | Logical AND with accumulator (absolute)
    ASL $DEED            ; 0E ED DE | Arithmetic shift left (absolute)
    AND $06              ; 25 06 | Logical AND with accumulator (zero page)
    CPY $FD              ; C4 FD | Compare Y register (zero page)
    DEC                  ; 3A | Decrement accumulator
    ORA $936B,X          ; 1D 6B 93 | Logical OR with accumulator (absolute,X)
    DEC $BE              ; C6 BE | Decrement (zero page)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    ASL $FB              ; 06 FB | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    SBC $221B            ; ED 1B 22 | Subtract with carry (absolute)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    INC $FF39,X          ; FE 39 FF | Increment (absolute,X)
    STA $D873,X          ; 9D 73 D8 | Store accumulator to absolute,X
    STZ $D870            ; 9C 70 D8 | Store zero to absolute
    BMI $D0              ; 30 D0 | Branch if negative
    BMI $80              ; 30 80 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_222
; Address: $E4F96C
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_222:
    BRA $40              ; 80 40 | Branch always
    BRA $00              ; 80 00 | Branch always
    ROR $5C6F            ; 6E 6F 5C | Rotate right (absolute)
    BNE $56              ; D0 56 | Branch if not equal
    PHP                  ; 08 | Push processor status to stack
    LSR $C3              ; 46 C3 | Logical shift right (zero page)
    PHA                  ; 48 | Push accumulator to stack
    CPY #$3C             ; C0 3C | Compare Y register (immediate)
    AND $F700,X          ; 3D 00 F7 | Logical AND with accumulator (absolute,X)
    BCC $D0              ; 90 D0 | Branch if carry clear
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    AND $F7C2,X          ; 3D C2 F7 | Logical AND with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    CPY #$42             ; C0 42 | Hardware register operation
    WDM #$42             ; 42 42 | Hardware register operation
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    PLP                  ; 28 | Pull processor status from stack
    LDA #$52             ; A9 52 | Load immediate value into accumulator
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank48_DmaFunction_223
; Address: $E4F9B1
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_223:
    DEX                  ; CA | Decrement X register
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    WDM #$BD             ; 42 BD | Reserved instruction
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF A9 56 D2 | Load from absolute long,X into accumulator
    AND $946B            ; 2D 6B 94 | Logical AND with accumulator (absolute)
    STA ($00),Y          ; 91 00 | Store accumulator to (zero page),Y
    LDA $00BD00          ; AF 00 BD 00 | Load from absolute long address into accumulator
    LDA $BF00,X          ; BD 00 BF | Load from absolute,X into accumulator
    STA ($6E),Y          ; 91 6E | Store accumulator to (zero page),Y
    LDA $42BD50          ; AF 50 BD 42 | Hardware register operation
    LDA $BF42,X          ; BD 42 BF | Load from absolute,X into accumulator
    RTI                  ; 40 | Return from interrupt
    ORA #$0E             ; 09 0E | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BPL $2F              ; 10 2F | Branch if positive
    AND $1232            ; 2D 32 12 | Logical AND with accumulator (absolute)
    ORA $0303,X          ; 1D 03 03 | Logical OR with accumulator (absolute,X)
    BPL $1F              ; 10 1F | Branch if positive
    ASL $0F0C,X          ; 1E 0C 0F | Arithmetic shift left (absolute,X)
    ROR                  ; 6A | Rotate right (accumulator)
    PHP                  ; 08 | Push processor status to stack
    BPL $EC              ; 10 EC | Branch if positive

;------------------------------------------------------------------------------
; Bank48_DmaFunction_224
; Address: $E4FA07
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_224:
    JSL $B0009A          ; 22 9A 00 B0 | Jump to subroutine long
    PHA                  ; 48 | Push accumulator to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TYA                  ; 98 | Transfer Y register to accumulator
    INC                  ; 1A | Increment accumulator
    INC $FEEE,X          ; FE EE FE | Increment (absolute,X)
    DEC $FEFE,X          ; DE FE FE | Decrement (absolute,X)
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    INC $FEE6,X          ; FE E6 FE | Increment (absolute,X)
    BVC $50              ; 50 50 | Branch if overflow clear
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $40              ; 80 40 | Branch always
    CPY #$57             ; C0 57 | Compare Y register (immediate)
    SBC $67              ; E5 67 | Subtract with carry (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator
    BVC $AF              ; 50 AF | Branch if overflow clear
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BRA $7F              ; 80 7F | Branch always
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    TAY                  ; A8 | Transfer accumulator to Y register
    SBC $1A              ; E5 1A | Subtract with carry (zero page)
    BVS $1A              ; 70 1A | Branch if overflow set
    BPL $44              ; 10 44 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    AND ($14),Y          ; 31 14 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_225
; Address: $E4FA4B
; Size: 131 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_225:
    BMI $DB              ; 30 DB | Branch if negative
    BIT $70              ; 24 70 | Test bits in accumulator (zero page)
    STA $40EF10          ; 8F 10 EF 40 | Store accumulator to absolute long address
    LDA                  ; BF 31 CE 30 | Load from absolute long,X into accumulator
    BIT $D7              ; 24 D7 | Test bits in accumulator (zero page)
    PLP                  ; 28 | Pull processor status from stack
    TYA                  ; 98 | Transfer Y register to accumulator
    LDA $00BF00          ; AF 00 BF 00 | Load from absolute long address into accumulator
    LDA                  ; BF 00 A8 00 | Load from absolute long,X into accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    LDA $40BF50          ; AF 50 BF 40 | Load from absolute long address into accumulator
    LDA                  ; BF 40 A8 57 | Load from absolute long,X into accumulator
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    LDA $00EF00          ; AF 00 EF 00 | Load from absolute long address into accumulator
    LDA                  ; BF 00 EE 00 | Load from absolute long,X into accumulator
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    BIT $DB              ; 24 DB | Test bits in accumulator (zero page)
    LDA $10EF50          ; AF 50 EF 10 | Load from absolute long address into accumulator
    LDA                  ; BF 40 EE 11 | Load from absolute long,X into accumulator
    BPL $24              ; 10 24 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ASL $0B              ; 06 0B | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    ORA $5A11            ; 0D 11 5A | Logical OR with accumulator (absolute)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ROL $1D3F            ; 2E 3F 1D | Rotate left (absolute)
    TSX                  ; BA | Transfer stack pointer to X register
    STA                  ; 9F 76 FB 36 | Store accumulator to absolute long,X
    EOR $4CFF            ; 4D FF 4C | Exclusive OR with accumulator (absolute)
    ROR $6EFF            ; 6E FF 6E | Rotate right (absolute)
    JMP $5EFF            ; 4C FF 5E | Jump to address
    ROR $6AFF            ; 6E FF 6A | Rotate right (absolute)
    BMI $30              ; 30 30 | Branch if negative
    INC $FF5E,X          ; FE 5E FF | Increment (absolute,X)
    INC $EE2B,X          ; FE 2B EE | Increment (absolute,X)
    AND $35EE            ; 2D EE 35 | Logical AND with accumulator (absolute)
    STA $FF81FF          ; 8F FF 81 FF | Store accumulator to absolute long address
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    STA ($FF),Y          ; 91 FF | Store accumulator to (zero page),Y
    STA ($FF),Y          ; 91 FF | Store accumulator to (zero page),Y
    BIT #$FF             ; 89 FF | Test bits in accumulator (immediate)
    BIT #$FF             ; 89 FF | Test bits in accumulator (immediate)
    CLV                  ; B8 | Clear overflow flag
    CMP $9E              ; C5 9E | Compare accumulator (zero page)
    EOR $677E,Y          ; 59 7E 67 | Exclusive OR with accumulator (absolute,Y)
    LDY $3FE0,X          ; BC E0 3F | Load from absolute,X into Y register
    ADC $B686,Y          ; 79 86 B6 | Add with carry (absolute,Y)
    BRA $00              ; 80 00 | Branch always
    LDY $0400            ; AC 00 04 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank48_DmaFunction_226
; Address: $E4FB3E
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_226:
    RTI                  ; 40 | Return from interrupt
    CLI                  ; 58 | Clear interrupt disable flag
    LDA $FB              ; A5 FB | Load from zero page into accumulator
    INC $9E6D,X          ; FE 6D 9E | Increment (absolute,X)
    NOP                  ; EA | No operation
    LDA ($6E),Y          ; B1 6E | Load from (zero page),Y into accumulator
    DEY                  ; 88 | Decrement Y register
    WDM #$00             ; 42 00 | Reserved instruction
    LDA ($00,X)          ; A1 00 | Load from (zero page,X) into accumulator
    JMP ($0200)          ; 6C 00 02 | Jump to address (absolute indirect)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    LDY $06              ; A4 06 | Load from zero page into Y register
    ORA $A4              ; 05 A4 | Logical OR with accumulator (zero page)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))
    NOP                  ; EA | No operation
    PLY                  ; 7A | Pull Y register from stack
    ROL                  ; 2A | Rotate left (accumulator)
    SED                  ; F8 | Set decimal mode flag
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    NOP                  ; EA | No operation
    PLY                  ; 7A | Pull Y register from stack
    STA $FE              ; 85 FE | Store accumulator to zero page
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    TAX                  ; AA | Transfer accumulator to X register
    BRA $15              ; 80 15 | Branch always
    TAX                  ; AA | Transfer accumulator to X register
    BRA $00              ; 80 00 | Branch always
    INC $0001,X          ; FE 01 00 | Increment (absolute,X)
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    CLI                  ; 58 | Clear interrupt disable flag
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    ROL                  ; 2A | Rotate left (accumulator)
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    INC $9700,X          ; FE 00 97 | Increment (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    PLX                  ; FA | Pull X register from stack
    ORA $FB              ; 05 FB | Logical OR with accumulator (zero page)
    PLX                  ; FA | Pull X register from stack
    ORA $FB              ; 05 FB | Logical OR with accumulator (zero page)
    INC $9701,X          ; FE 01 97 | Increment (absolute,X)
    PLA                  ; 68 | Pull accumulator from stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CLI                  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank48_DmaFunction_227
; Address: $E4FBD0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_227:
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    CLI                  ; 58 | Clear interrupt disable flag
    CPY $6A              ; C4 6A | Compare Y register (zero page)
    DEY                  ; 88 | Decrement Y register
    BPL $A8              ; 10 A8 | Branch if positive

;------------------------------------------------------------------------------
; Bank48_DmaFunction_228
; Address: $E4FBE7
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_228:
    JSR $4050            ; 20 50 40 | Jump to subroutine
    LDY #$80             ; A0 80 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    INC $FCEC,X          ; FE EC FC | Increment (absolute,X)
    CLD                  ; D8 | Clear decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BCS $F0              ; B0 F0 | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_229
; Address: $E4FBFB
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_229:
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $98              ; 80 98 | Branch always
    STA                  ; 9F 76 8F 76 | Store accumulator to absolute long,X
    STA $FB76,Y          ; 99 76 FB | Store accumulator to absolute,Y
    STA                  ; 9F 76 00 00 | Store accumulator to absolute long,X
    JMP ($4DFF)          ; 6C FF 4D | Jump to address (absolute indirect)
    INC $EF5E,X          ; FE 5E EF | Increment (absolute,X)
    ROR $6CFF            ; 6E FF 6C | Rotate right (absolute)
    LSR $5EFF            ; 4E FF 5E | Logical shift right (absolute)
    ROR                  ; 6A | Rotate right (accumulator)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    ORA $38              ; 05 38 | Logical OR with accumulator (zero page)
    ORA $3D38,X          ; 1D 38 3D | Logical OR with accumulator (absolute,X)
    SEC                  ; 38 | Set carry flag
    LSR                  ; 4A | Logical shift right (accumulator)
    ORA #$4C             ; 09 4C | Logical OR with accumulator (immediate)
    ORA #$82             ; 09 82 | Logical OR with accumulator (immediate)
    LDA $B89F,Y          ; B9 9F B8 | Load from absolute,Y into accumulator
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    SEC                  ; 38 | Set carry flag
    ORA $FE38,X          ; 1D 38 FE | Logical OR with accumulator (absolute,X)
    SBC $C1C6,Y          ; F9 C6 C1 | Subtract with carry (absolute,Y)
    ORA ($39,X)          ; 01 39 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank48_DmaFunction_22A
; Address: $E4FC8E
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_22A:
    ADC $387C,X          ; 7D 7C 38 | Add with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ORA $837C            ; 0D 7C 83 | Logical OR with accumulator (absolute)
    ORA $070D            ; 0D 0D 07 | Logical OR with accumulator (absolute)
    INC                  ; 1A | Increment accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLC                  ; 18 | Clear carry flag
    ORA $1F              ; 05 1F | Logical OR with accumulator (zero page)
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPY #$E0             ; C0 E0 | Game work RAM access
    LDY #$A0             ; A0 A0 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank48_DmaFunction_22B
; Address: $E4FCC9
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_22B:
    JSR $6060            ; 20 60 60 | Jump to subroutine
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    BVC $70              ; 50 70 | Branch if overflow clear
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPX #$80             ; E0 80 | Compare X register (immediate)
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPX #$80             ; E0 80 | Compare X register (immediate)
    BEQ $0E              ; F0 0E | Branch if equal
    AND $C021,X          ; 3D 21 C0 | Logical AND with accumulator (absolute,X)
    WDM #$24             ; 42 24 | Reserved instruction
    AND $98              ; 25 98 | Logical AND with accumulator (zero page)
    STA                  ; 9F 31 CA 03 | Store accumulator to absolute long,X
    SED                  ; F8 | Set decimal mode flag
    SBC $DB24,X          ; FD 24 DB | Subtract with carry (absolute,X)
    STZ $0063            ; 9C 63 00 | Store zero to absolute
    ORA $1E13            ; 0D 13 1E | Logical OR with accumulator (absolute)
    AND ($1E,X)          ; 21 1E | Logical AND with accumulator ((zero page,X))
    AND ($37,X)          ; 21 37 | Logical AND with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    ASL $000F            ; 0E 0F 00 | Arithmetic shift left (absolute)
    PHA                  ; 48 | Push accumulator to stack
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    INX                  ; E8 | Increment X register
    CLD                  ; D8 | Clear decimal mode flag
    PLP                  ; 28 | Pull processor status from stack
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    BVC $B0              ; 50 B0 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank48_DmaFunction_22C
; Address: $E4FD2A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_22C:
    JSR $80E0            ; 20 E0 80 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank48_DmaFunction_22D
; Address: $E4FD36
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_22D:
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    BPL $F0              ; 10 F0 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_22E
; Address: $E4FD3D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_22E:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BPL $EC              ; 10 EC | Branch if positive
    INY                  ; C8 | Increment Y register
    ORA ($30,X)          ; 01 30 | Logical OR with accumulator ((zero page,X))
    BIT $DB              ; 24 DB | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_22F
; Address: $E4FD48
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_22F:
    JSR $98DF            ; 20 DF 98 | Jump to subroutine
    CLI                  ; 58 | Clear interrupt disable flag
    CLI                  ; 58 | Clear interrupt disable flag
    BMI $CF              ; 30 CF | Branch if negative
    CPY $BD42            ; CC 42 BD | Compare Y register (absolute)
    LDA #$4F             ; A9 4F | Load immediate value into accumulator
    ORA $79E6,X          ; 1D E6 79 | Logical OR with accumulator (absolute,X)
    STX $B94F            ; 8E 4F B9 | Store X register to absolute address
    CPX #$60             ; E0 60 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_232
; Address: $E4FD88
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_232:
    JSL $B6499C          ; 22 9C 49 B6 | Jump to subroutine long
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_233
; Address: $E4FD91
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_233:
    STA                  ; 9F 60 9F 41 | Store accumulator to absolute long,X
    LDX $9A65,Y          ; BE 65 9A | Load from absolute,Y into X register
    SED                  ; F8 | Set decimal mode flag
    SBC ($71),Y          ; F1 71 | Subtract with carry ((zero page),Y)
    ADC $7B79,Y          ; 79 79 7B | Add with carry (absolute,Y)
    STZ $BF00,X          ; 9E 00 BF | Store zero to absolute,X
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_234
; Address: $E4FDAF
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_234:
    TYA                  ; 98 | Transfer Y register to accumulator
    ADC ($8E),Y          ; 71 8E | Add with carry ((zero page),Y)
    TXA                  ; 8A | Transfer X register to accumulator
    ADC $7B86,Y          ; 79 86 7B | Add with carry (absolute,Y)
    STY $00              ; 84 00 | Store Y register to zero page
    DEC $2C06            ; CE 06 2C | Decrement (absolute)
    EOR #$F1             ; 49 F1 | Exclusive OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    INX                  ; E8 | Increment X register
    SED                  ; F8 | Set decimal mode flag
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank48_DmaFunction_236
; Address: $E4FDE9
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_236:
    BRA $F7              ; 80 F7 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank48_DmaFunction_237
; Address: $E4FDF0
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_237:
    JSR $81DF            ; 20 DF 81 | Jump to subroutine
    ROR $EA15,X          ; 7E 15 EA | Rotate right (absolute,X)
    BMI $CF              ; 30 CF | Branch if negative
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    STA $E766,Y          ; 99 66 E7 | Store accumulator to absolute,Y
    CLC                  ; 18 | Clear carry flag
    ROR $99              ; 66 99 | Rotate right (zero page)
    STA $0066,Y          ; 99 66 00 | Store accumulator to absolute,Y
    CPY #$3C             ; C0 3C | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    LDA $3692            ; AD 92 36 | Load from absolute address into accumulator
    ORA #$05             ; 09 05 | Logical OR with accumulator (immediate)
    PLY                  ; 7A | Pull Y register from stack
    SEI                  ; 78 | Set interrupt disable flag
    BVC $00              ; 50 00 | Branch if overflow clear
    INY                  ; C8 | Increment Y register
    BRA $00              ; 80 00 | Branch always
    SBC #$4C             ; E9 4C | Subtract with carry (immediate)
    BCS $40              ; B0 40 | Branch if carry set
    LDX $619E,Y          ; BE 9E 61 | Load from absolute,Y into X register
    AND $0000            ; 2D 00 00 | Logical AND with accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA $7EFF,X          ; BD FF 7E | Load from absolute,X into accumulator
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    LDA $9DFF,X          ; BD FF 9D | Load from absolute,X into accumulator
    LDA $81FE            ; AD FE 81 | Load from absolute address into accumulator
    BIT $FF              ; 24 FF | Test bits in accumulator (zero page)
    PHY                  ; 5A | Push Y register to stack
    CLI                  ; 58 | Clear interrupt disable flag
    LDA $7EFF,X          ; BD FF 7E | Load from absolute,X into accumulator
    ROR $7F8D,X          ; 7E 8D 7F | Rotate right (absolute,X)
    LDA $ADFE,X          ; BD FE AD | Load from absolute,X into accumulator
    ROR $7FBD,X          ; 7E BD 7F | Rotate right (absolute,X)
    STZ $FF              ; 64 FF | Store zero to zero page
    BMI $FF              ; 30 FF | Branch if negative
    WDM #$FF             ; 42 FF | Reserved instruction
    RTI                  ; 40 | Return from interrupt
    BPL $FF              ; 10 FF | Branch if positive
    ROR $A7A7,X          ; 7E A7 A7 | Rotate right (absolute,X)
    SBC $BF4A,X          ; FD 4A BF | Subtract with carry (absolute,X)
    SBC $FB7E,X          ; FD 7E FB | Subtract with carry (absolute,X)
    CLI                  ; 58 | Clear interrupt disable flag
    RTI                  ; 40 | Return from interrupt
    CPY #$B0             ; C0 B0 | Compare Y register (immediate)
    BRA $F0              ; 80 F0 | Branch always

;------------------------------------------------------------------------------
; Bank48_DmaFunction_239
; Address: $E4FEC8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_239:
    JSR $6820            ; 20 20 68 | Jump to subroutine
    PLA                  ; 68 | Pull accumulator from stack
    DEY                  ; 88 | Decrement Y register
    INX                  ; E8 | Increment X register
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank48_DmaFunction_23A
; Address: $E4FED0
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_23A:
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    DEY                  ; 88 | Decrement Y register
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    STZ $4EFC            ; 9C FC 4E | Store zero to absolute
    EOR $5BFF            ; 4D FF 5B | Exclusive OR with accumulator (absolute)
    LDA                  ; BF FE FF FE | Load from absolute long,X into accumulator
    LDX $11F9,Y          ; BE F9 11 | Load from absolute,Y into X register
    INC $FE39,X          ; FE 39 FE | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    LDY $1A              ; A4 1A | Load from zero page into Y register
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 00 FF 00 | Load from absolute long,X into accumulator
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    BEQ $FF              ; F0 FF | Branch if equal
    CPY $F887            ; CC 87 F8 | Compare Y register (absolute)
    CLV                  ; B8 | Clear overflow flag
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank48_DmaFunction_23B
; Address: $E4FF20
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_23B:
    JSR $74DF            ; 20 DF 74 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    REP #$3D             ; C2 3D | Reset processor status bits
    CLC                  ; 18 | Clear carry flag
    DEY                  ; 88 | Decrement Y register
    SBC $7C83,X          ; FD 83 7C | Subtract with carry (absolute,X)
    SBC $BBEF,X          ; FD EF BB | Subtract with carry (absolute,X)
    AND $EFDC,X          ; 3D DC EF | Logical AND with accumulator (absolute,X)
    ROL $FFC9,X          ; 3E C9 FF | Rotate left (absolute,X)
    BMI $FF              ; 30 FF | Branch if negative
    BMI $FF              ; 30 FF | Branch if negative
    BPL $FF              ; 10 FF | Branch if positive
    CMP $7EEB,X          ; DD EB 7E | Compare accumulator (absolute,X)
    INC $7F09,X          ; FE 09 7F | Increment (absolute,X)
    STA $B37F,X          ; 9D 7F B3 | Store accumulator to absolute,X
    ADC $FED7,X          ; 7D D7 FE | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank48_DmaFunction_23C
; Address: $E4FF6F
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank48_DmaFunction_23C:
    STA $14FF,Y          ; 99 FF 14 | Store accumulator to absolute,Y
    ROL                  ; 2A | Rotate left (accumulator)
    BIT $00FF            ; 2C FF 00 | Test bits in accumulator (absolute)
    LDA                  ; BF 5D FF F5 | Load from absolute long,X into accumulator
    DEC $FBFF,X          ; DE FF FB | Decrement (absolute,X)
    SBC $F3BD,X          ; FD BD F3 | Subtract with carry (absolute,X)
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    BPL $EF              ; 10 EF | Branch if positive
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 00 FF 00 | Load from absolute long,X into accumulator
    BMI $FF              ; 30 FF | Branch if negative
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    DEC                  ; 3A | Decrement accumulator
    BIT #$1D             ; 89 1D | Test bits in accumulator (immediate)
    CPY #$14             ; C0 14 | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    ASL $0CA1,X          ; 1E A1 0C | Arithmetic shift left (absolute,X)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BNE $3F              ; D0 3F | Branch if not equal
    ASL $60E1,X          ; 1E E1 60 | Arithmetic shift left (absolute,X)
    LDX $D967,Y          ; BE 67 D9 | Load from absolute,Y into X register
    STA $BF77FC          ; 8F FC 77 BF | Store accumulator to absolute long address
    SED                  ; F8 | Set decimal mode flag
    STA $FB77            ; 8D 77 FB | Store accumulator to absolute address
    STA                  ; 9F 7C FF 18 | Store accumulator to absolute long,X
