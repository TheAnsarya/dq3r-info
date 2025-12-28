;==============================================================================
; Dragon Quest III - Bank $46
; Type: Dma
; Purpose: DMA operations and data transfer
; Address Range: $E30000-$E37FFF
; Instructions: 8616
; Bytes: 32768
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_46"

;------------------------------------------------------------------------------
; Bank46_DmaFunction_000
; Address: $E38000
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_000:
    SBC $FAE2,X          ; FD E2 FA | Subtract with carry (absolute,X)
    SBC $FA              ; E5 FA | Subtract with carry (zero page)
    SBC $F8              ; E5 F8 | Subtract with carry (zero page)
    INC $FEF1,X          ; FE F1 FE | Increment (absolute,X)
    SBC $FCFF,Y          ; F9 FF FC | Subtract with carry (absolute,Y)
    CPX $0000            ; EC 00 00 | Compare X register (absolute)
    BPL $00              ; 10 00 | Branch if positive
    ROR $7EFF,X          ; 7E FF 7E | Rotate right (absolute,X)
    ROR $5EFF,X          ; 7E FF 5E | Rotate right (absolute,X)
    INC $FF1D,X          ; FE 1D FF | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    INC $F7FF,X          ; FE FF F7 | Increment (absolute,X)
    ROR                  ; 6A | Rotate right (accumulator)
    DEC $FD23,X          ; DE 23 FD | Decrement (absolute,X)
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    INC $F201,X          ; FE 01 F2 | Increment (absolute,X)
    ORA $FF68            ; 0D 68 FF | Logical OR with accumulator (absolute)
    STZ $28FF            ; 9C FF 28 | Store zero to absolute
    TXS                  ; 9A | Transfer X register to stack pointer
    ROR $20FF,X          ; 7E FF 20 | Rotate right (absolute,X)
    INC $3FFF            ; EE FF 3F | Increment (absolute)
    INC $E0FF,X          ; FE FF E0 | Game work RAM access
    CPX #$FF             ; E0 FF | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_001
; Address: $E3809E
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_001:
    JSR $FCFF            ; 20 FF FC | Jump to subroutine
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    REP #$C3             ; C2 C3 | Reset processor status bits
    ORA $02FF            ; 0D FF 02 | Logical OR with accumulator (absolute)
    INC $8000,X          ; FE 00 80 | Increment (absolute,X)
    BRA $1C              ; 80 1C | Branch always
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    ORA $03FF            ; 0D FF 03 | Logical OR with accumulator (absolute)
    SBC $CEFE,Y          ; F9 FE CE | Subtract with carry (absolute,Y)
    PLX                  ; FA | Pull X register from stack
    SBC $FFFF,X          ; FD FF FF | Subtract with carry (absolute,X)
    CPX #$97             ; E0 97 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    XBA                  ; EB | Exchange accumulator bytes
    ORA $191E,X          ; 1D 1E 19 | Logical OR with accumulator (absolute,X)
    ASL $FF87,X          ; 1E 87 FF | Arithmetic shift left (absolute,X)
    BIT #$FF             ; 89 FF | Test bits in accumulator (immediate)
    CPX $FF              ; E4 FF | Compare X register (zero page)
    PEA #$F4FF           ; F4 FF F4 | Push effective address to stack
    PLX                  ; FA | Pull X register from stack
    CMP ($BE,X)          ; C1 BE | Compare accumulator ((zero page,X))
    STA $C0FFF0          ; 8F F0 FF C0 | Store accumulator to absolute long address
    PHA                  ; 48 | Push accumulator to stack
    PLY                  ; 7A | Pull Y register from stack
    ADC $7A              ; 65 7A | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_002
; Address: $E3812D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_002:
    ADC $F8              ; 65 F8 | Add with carry (zero page)
    RTI                  ; 40 | Return from interrupt
    ASL $1E00            ; 0E 00 1E | Arithmetic shift left (absolute)
    STY $00              ; 84 00 | Store Y register to zero page
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank46_DmaFunction_003
; Address: $E38141
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_003:
    JSR $008D            ; 20 8D 00 | Jump to subroutine
    CPY $8671            ; CC 71 86 | Compare Y register (absolute)
    BVS $86              ; 70 86 | Branch if overflow set
    BPL $10              ; 10 10 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    SBC ($3F,X)          ; E1 3F | Subtract with carry ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $FF              ; 10 FF | Branch if positive
    BPL $FF              ; 10 FF | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    ADC $D052,X          ; 7D 52 D0 | Add with carry (absolute,X)
    LDA $F3BDC2          ; AF C2 BD F3 | Load from absolute long address into accumulator
    CMP $7FF1            ; CD F1 7F | Compare accumulator (absolute)
    ADC $7AFF,Y          ; 79 FF 7A | Add with carry (absolute,Y)
    SEI                  ; 78 | Set interrupt disable flag
    STY $0000            ; 8C 00 00 | Store Y register to absolute address
    INC $F7              ; E6 F7 | Increment (zero page)
    SEC                  ; 38 | Set carry flag
    TYA                  ; 98 | Transfer Y register to accumulator
    CLD                  ; D8 | Clear decimal mode flag
    INY                  ; C8 | Increment Y register
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    JMP $4CFF            ; 4C FF 4C | Jump to address
    INC $F828,X          ; FE 28 F8 | Increment (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    AND ($70),Y          ; 31 70 | Logical AND with accumulator ((zero page),Y)
    BVS $36              ; 70 36 | Branch if overflow set
    BVS $15              ; 70 15 | Branch if overflow set
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    STX $86              ; 86 86 | Store X register to zero page
    TXA                  ; 8A | Transfer X register to accumulator
    TXA                  ; 8A | Transfer X register to accumulator
    BIT #$89             ; 89 89 | Test bits in accumulator (immediate)
    TXA                  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank46_DmaFunction_004
; Address: $E381DF
; Size: 112 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_004:
    TXA                  ; 8A | Transfer X register to accumulator
    SBC $FEFF,Y          ; F9 FF FE | Subtract with carry (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    SBC $FC03,X          ; FD 03 FC | Subtract with carry (absolute,X)
    INC $F601,X          ; FE 01 F6 | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    BEQ $FF              ; F0 FF | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SBC $F1FF,Y          ; F9 FF F1 | Subtract with carry (absolute,Y)
    CMP $FF              ; C5 FF | Compare accumulator (zero page)
    SBC ($1F,X)          ; E1 1F | Subtract with carry ((zero page,X))
    SEC                  ; 38 | Set carry flag
    CMP ($FF),Y          ; D1 FF | Compare accumulator ((zero page),Y)
    LDA $72FF,X          ; BD FF 72 | Load from absolute,X into accumulator
    PEA #$6FFC           ; F4 FC 6F | Push effective address to stack
    SBC ($F1),Y          ; F1 F1 | Subtract with carry ((zero page),Y)
    STA                  ; 9F FF F3 FF | Store accumulator to absolute long,X
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BRA $FF              ; 80 FF | Branch always
    STA $FF1FFF          ; 8F FF 1F FF | Store accumulator to absolute long address
    STA                  ; 9F FF F3 FF | Store accumulator to absolute long,X
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    INC $FFFE,X          ; FE FE FF | Increment (absolute,X)
    STA $BFBF8F          ; 8F 8F BF BF | Store accumulator to absolute long address
    INC $F3FF,X          ; FE FF F3 | Increment (absolute,X)
    INC $F3FF,X          ; FE FF F3 | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    INX                  ; E8 | Increment X register
    SBC ($FE),Y          ; F1 FE | Subtract with carry ((zero page),Y)
    STA $07FF            ; 8D FF 07 | Store accumulator to absolute address
    ORA $3FFF,X          ; 1D FF 3F | Logical OR with accumulator (absolute,X)
    BMI $FF              ; 30 FF | Branch if negative
    STY $07FF            ; 8C FF 07 | Store Y register to absolute address
    STA                  ; 9F 60 83 FC | Store accumulator to absolute long,X
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPX #$7F             ; E0 7F | Compare X register (immediate)
    BRA $7F              ; 80 7F | Branch always
    ADC ($FF,X)          ; 61 FF | Add with carry ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    LDA                  ; BF FF FE F9 | Load from absolute long,X into accumulator
    BEQ $C7              ; F0 C7 | Branch if equal
    CPY $C7              ; C4 C7 | Compare Y register (zero page)
    CPY $CF              ; C4 CF | Compare Y register (zero page)
    PHA                  ; 48 | Push accumulator to stack
    STY $4EF1            ; 8C F1 4E | Store Y register to absolute address
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank46_DmaFunction_005
; Address: $E38300
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_005:
    BVS $83              ; 70 83 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    LDA                  ; BF 40 CF 70 | Load from absolute long,X into accumulator
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    INY                  ; C8 | Increment Y register
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPX #$E0             ; E0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank46_DmaFunction_007
; Address: $E3833D
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_007:
    JSR $3030            ; 20 30 30 | Jump to subroutine
    AND $39FF,X          ; 3D FF 39 | Logical AND with accumulator (absolute,X)
    STA                  ; 9F 0C 8F 08 | Store accumulator to absolute long,X
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_009
; Address: $E3835A
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_009:
    BVS $70              ; 70 70 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    CPY $F9              ; C4 F9 | Compare Y register (zero page)
    STX $B9              ; 86 B9 | Store X register to zero page
    CPY #$FD             ; C0 FD | Compare Y register (immediate)
    BPL $8C              ; 10 8C | Branch if positive
    CPY $79              ; C4 79 | Compare Y register (zero page)
    PEA #$F649           ; F4 49 F6 | Push effective address to stack
    PLA                  ; 68 | Pull accumulator from stack
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BCS $12              ; B0 12 | Branch if carry set
    BCS $03              ; B0 03 | Branch if carry set
    BNE $01              ; D0 01 | Branch if not equal
    BEQ $00              ; F0 00 | Branch if equal
    BVS $00              ; 70 00 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    EOR $4C4D            ; 4D 4D 4C | Exclusive OR with accumulator (absolute)
    JMP $2E2E            ; 4C 2E 2E | Jump to address
    STA $C7C78F          ; 8F 8F C7 C7 | Store accumulator to absolute long address
    PEA #$C70B           ; F4 0B C7 | Push effective address to stack
    BEQ $0F              ; F0 0F | Branch if equal

;------------------------------------------------------------------------------
; Bank46_DmaFunction_00A
; Address: $E383AC
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_00A:
    INC $C301,X          ; FE 01 C3 | Increment (absolute,X)
    CPX $FF              ; E4 FF | Compare X register (zero page)
    XBA                  ; EB | Exchange accumulator bytes
    CLV                  ; B8 | Clear overflow flag
    STA $FFC1FF          ; 8F FF C1 FF | Store accumulator to absolute long address
    SBC ($1F,X)          ; E1 1F | Subtract with carry ((zero page,X))
    EOR $FF              ; 45 FF | Exclusive OR with accumulator (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    SBC $1FFF,Y          ; F9 FF 1F | Subtract with carry (absolute,Y)
    LDA ($7F,X)          ; A1 7F | Load from (zero page,X) into accumulator
    DEC $CCFF,X          ; DE FF CC | Decrement (absolute,X)
    BRA $FF              ; 80 FF | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    SBC $1FFF,Y          ; F9 FF 1F | Subtract with carry (absolute,Y)
    EOR $79FF,Y          ; 59 FF 79 | Exclusive OR with accumulator (absolute,Y)
    STA $E6FF            ; 8D FF E6 | Store accumulator to absolute address
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    BVS $FF              ; 70 FF | Branch if overflow set
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    BRA $FF              ; 80 FF | Branch always
    RTI                  ; 40 | Return from interrupt
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    SEI                  ; 78 | Set interrupt disable flag
    INC $DFFF,X          ; FE FF DF | Increment (absolute,X)
    BRA $FF              ; 80 FF | Branch always
    LDA                  ; BF C0 1F E0 | Load from absolute long,X into accumulator
    JMP $FFEEFF          ; 5C FF EE FF | Jump to address long
    BMI $FF              ; 30 FF | Branch if negative
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BRA $FF              ; 80 FF | Branch always
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_00B
; Address: $E38465
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_00B:
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    CPY #$1B             ; C0 1B | Compare Y register (immediate)
    CPX $3F              ; E4 3F | Compare X register (zero page)
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    ORA $0BFF,X          ; 1D FF 0B | Logical OR with accumulator (absolute,X)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPX $FF              ; E4 FF | Compare X register (zero page)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    SBC $BF16,Y          ; F9 16 BF | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_00C
; Address: $E384A3
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_00C:
    LSR $7EBE,X          ; 5E BE 7E | Logical shift right (absolute,X)
    INC $FE3E,X          ; FE 3E FE | Increment (absolute,X)
    STZ $DCFE            ; 9C FE DC | Store zero to absolute
    DEC $DEFC,X          ; DE FC DE | Decrement (absolute,X)
    ROL $0000,X          ; 3E 00 00 | Rotate left (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CPY #$EF             ; C0 EF | Compare Y register (immediate)
    BNE $EB              ; D0 EB | Branch if not equal
    BNE $F3              ; D0 F3 | Branch if not equal
    JMP $0C33            ; 4C 33 0C | Jump to address
    INY                  ; C8 | Increment Y register
    STZ $10              ; 64 10 | Store zero to zero page
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    BMI $30              ; 30 30 | Branch if negative
    BMI $30              ; 30 30 | Branch if negative

;------------------------------------------------------------------------------
; Bank46_DmaFunction_00F
; Address: $E384FA
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_00F:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CPY #$18             ; C0 18 | Compare Y register (immediate)
    SBC ($0E,X)          ; E1 0E | Subtract with carry ((zero page,X))
    SBC ($06,X)          ; E1 06 | Subtract with carry ((zero page,X))
    ORA ($F9,X)          ; 01 F9 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BPL $10              ; 10 10 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ASL $070C            ; 0E 0C 07 | Arithmetic shift left (absolute)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ROR $7F30,X          ; 7E 30 7F | Rotate right (absolute,X)
    BMI $3F              ; 30 3F | Branch if negative
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    LDA                  ; BF 08 BF 08 | Load from absolute long,X into accumulator
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    BRA $80              ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank46_DmaFunction_010
; Address: $E38534
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_010:
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank46_DmaFunction_011
; Address: $E3853C
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_011:
    JSR $3020            ; 20 20 30 | Jump to subroutine
    BMI $3A              ; 30 3A | Branch if negative
    DEC                  ; 3A | Decrement accumulator
    LDY $BC00,X          ; BC 00 BC | Load from absolute,X into Y register
    LDX $BC01,Y          ; BE 01 BC | Load from absolute,Y into X register
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    ORA #$FC             ; 09 FC | Logical OR with accumulator (immediate)
    ORA #$C5             ; 09 C5 | Logical OR with accumulator (immediate)
    CMP $C5              ; C5 C5 | Compare accumulator (zero page)
    CMP $43              ; C5 43 | Compare accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    WDM #$42             ; 42 42 | Hardware register operation
    PHP                  ; 08 | Push processor status to stack
    INY                  ; C8 | Increment Y register
    BEQ $FF              ; F0 FF | Branch if equal
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    DEY                  ; 88 | Decrement Y register
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    STA $FFFFFF          ; 8F FF FF FF | Store accumulator to absolute long address
    BVS $FF              ; 70 FF | Branch if overflow set
    STZ $E37F            ; 9C 7F E3 | Store zero to absolute
    BVS $FF              ; 70 FF | Branch if overflow set
    BCC $FF              ; 90 FF | Branch if carry clear
    RTI                  ; 40 | Return from interrupt
    STZ $C7FF,X          ; 9E FF C7 | Store zero to absolute,X
    INY                  ; C8 | Increment Y register
    SBC $F00F,X          ; FD 0F F0 | Subtract with carry (absolute,X)
    BRA $7F              ; 80 7F | Branch always
    BRA $FF              ; 80 FF | Branch always
    CMP $F0FF            ; CD FF F0 | Compare accumulator (absolute)
    LDA $FFFF,X          ; BD FF FF | Load from absolute,X into accumulator
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    ROL $FFFF,X          ; 3E FF FF | Rotate left (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BEQ $FF              ; F0 FF | Branch if equal
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    BEQ $FF              ; F0 FF | Branch if equal
    ADC ($FF,X)          ; 61 FF | Add with carry ((zero page,X))
    ADC $0FFF,Y          ; 79 FF 0F | Add with carry (absolute,Y)
    EOR ($FF,X)          ; 41 FF | Exclusive OR with accumulator ((zero page,X))
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_012
; Address: $E38656
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_012:
    SED                  ; F8 | Set decimal mode flag
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    CPX #$CF             ; E0 CF | Compare X register (immediate)
    BMI $FF              ; 30 FF | Branch if negative
    INC $0FFF,X          ; FE FF 0F | Increment (absolute,X)
    BMI $FF              ; 30 FF | Branch if negative
    CPX $FF              ; E4 FF | Compare X register (zero page)
    BPL $FF              ; 10 FF | Branch if positive
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    LDA                  ; BF 4E AF D2 | Load from absolute long,X into accumulator
    CPX #$9F             ; E0 9F | Compare X register (immediate)
    BRA $97              ; 80 97 | Branch always
    TYA                  ; 98 | Transfer Y register to accumulator
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank46_DmaFunction_013
; Address: $E386B2
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_013:
    JSR $8000            ; 20 00 80 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_014
; Address: $E386BC
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_014:
    STZ $00              ; 64 00 | Store zero to zero page
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CMP ($24,X)          ; C1 24 | Compare accumulator ((zero page,X))
    CMP ($10,X)          ; C1 10 | Compare accumulator ((zero page,X))
    SBC ($40,X)          ; E1 40 | Subtract with carry ((zero page,X))
    CPX #$40             ; E0 40 | Compare X register (immediate)
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank46_DmaFunction_015
; Address: $E386CB
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_015:
    JSR $00FA            ; 20 FA 00 | Jump to subroutine
    SBC $1A00,X          ; FD 00 1A | Subtract with carry (absolute,X)
    INC                  ; 1A | Increment accumulator
    ROL $1E2E            ; 2E 2E 1E | Rotate left (absolute)
    ASL $1F1F,X          ; 1E 1F 1F | Arithmetic shift left (absolute,X)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    ASL $7F              ; 06 7F | Arithmetic shift left (zero page)
    ASL $7F              ; 06 7F | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    BRA $FE              ; 80 FE | Branch always
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    BRA $03              ; 80 03 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_016
; Address: $E38725
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_016:
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    ADC ($FF,X)          ; 61 FF | Add with carry ((zero page,X))
    INC $FE08,X          ; FE 08 FE | Increment (absolute,X)
    BRA $FF              ; 80 FF | Branch always
    CPY #$FC             ; C0 FC | Compare Y register (immediate)
    CMP $FC              ; C5 FC | Compare accumulator (zero page)
    INC $FED4,X          ; FE D4 FE | Increment (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BPL $3C              ; 10 3C | Branch if positive
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    BMI $7E              ; 30 7E | Branch if negative
    CLC                  ; 18 | Clear carry flag
    ROR $3CFF,X          ; 7E FF 3C | Rotate right (absolute,X)
    BPL $00              ; 10 00 | Branch if positive
    WDM #$40             ; 42 40 | Reserved instruction
    SBC #$04             ; E9 04 | Subtract with carry (immediate)
    BPL $FF              ; 10 FF | Branch if positive
    WDM #$FF             ; 42 FF | Reserved instruction
    SBC #$FF             ; E9 FF | Subtract with carry (immediate)
    CLC                  ; 18 | Clear carry flag
    STA                  ; 9F 10 FF 70 | Store accumulator to absolute long,X

;------------------------------------------------------------------------------
; Bank46_DmaFunction_017
; Address: $E387E7
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_017:
    JSR $32FF            ; 20 FF 32 | Jump to subroutine
    EOR ($E0,X)          ; 41 E0 | Game work RAM access
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_018
; Address: $E387F6
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_018:
    BPL $00              ; 10 00 | Branch if positive
    LDA                  ; BF 02 0F 40 | Load from absolute long,X into accumulator
    ADC ($87,X)          ; 61 87 | Add with carry ((zero page,X))
    AND ($87),Y          ; 31 87 | Logical AND with accumulator ((zero page),Y)
    BPL $C7              ; 10 C7 | Branch if positive
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BCS $B0              ; B0 B0 | Branch if carry set
    BCC $90              ; 90 90 | Branch if carry clear
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_019
; Address: $E3882F
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_019:
    CMP #$C0             ; C9 C0 | Compare accumulator (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    BPL $FF              ; 10 FF | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    DEY                  ; 88 | Decrement Y register
    INC $FEDC,X          ; FE DC FE | Increment (absolute,X)
    LDY $9CFF,X          ; BC FF 9C | Load from absolute,X into Y register
    STZ $3EFF,X          ; 9E FF 3E | Store zero to absolute,X
    LDA                  ; BF FF BF FF | Load from absolute long,X into accumulator
    LDA                  ; BF 01 01 01 | Load from absolute long,X into accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    ADC ($FF,X)          ; 61 FF | Add with carry ((zero page,X))
    ADC ($FF),Y          ; 71 FF | Add with carry ((zero page),Y)
    AND $3CFF,X          ; 3D FF 3C | Logical AND with accumulator (absolute,X)
    ASL $1EFF,X          ; 1E FF 1E | Arithmetic shift left (absolute,X)
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    INY                  ; C8 | Increment Y register
    CPY #$FA             ; C0 FA | Compare Y register (immediate)
    BEQ $FA              ; F0 FA | Branch if equal
    SBC $F9FF,Y          ; F9 FF F9 | Subtract with carry (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    BPL $10              ; 10 10 | Branch if positive
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    CMP $6DFF            ; CD FF 6D | Compare accumulator (absolute)
    LDA                  ; BF 37 BF 33 | Load from absolute long,X into accumulator
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_01A
; Address: $E38925
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_01A:
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BRA $FF              ; 80 FF | Branch always
    CPY $FF              ; C4 FF | Compare Y register (zero page)
    DEC $FF              ; C6 FF | Decrement (zero page)
    INC $FF              ; E6 FF | Increment (zero page)
    INC $FF              ; E6 FF | Increment (zero page)
    ROR $66FF            ; 6E FF 66 | Rotate right (absolute)
    ROL $EEFF            ; 2E FF EE | Rotate left (absolute)
    INC $FF              ; E6 FF | Increment (zero page)
    LDX $FF              ; A6 FF | Load from zero page into X register
    STX $FF              ; 86 FF | Store X register to zero page
    LDX $00              ; A6 00 | Load from zero page into X register
    LDA                  ; BF 00 FF 30 | Load from absolute long,X into accumulator
    AND $13F3            ; 2D F3 13 | Logical AND with accumulator (absolute)
    PEA #$F810           ; F4 10 F8 | Push effective address to stack
    PHP                  ; 08 | Push processor status to stack
    LDA                  ; BF CF CF D2 | Load from absolute long,X into accumulator
    REP #$EC             ; C2 EC | Reset processor status bits
    CPX #$EF             ; E0 EF | Compare X register (immediate)
    CPX #$F7             ; E0 F7 | Compare X register (immediate)
    BEQ $FF              ; F0 FF | Branch if equal
    INC $EEFE,X          ; FE FE EE | Increment (absolute,X)
    INC $E8E8            ; EE E8 E8 | Increment (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_01B
; Address: $E389B2
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_01B:
    TAY                  ; A8 | Transfer accumulator to Y register
    DEY                  ; 88 | Decrement Y register
    BNE $D0              ; D0 D0 | Branch if not equal
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    STA                  ; 9F 00 FF 00 | Store accumulator to absolute long,X
    ASL $8EFF            ; 0E FF 8E | Arithmetic shift left (absolute)
    STX $FF              ; 86 FF | Store X register to zero page
    WDM #$FF             ; 42 FF | Reserved instruction
    AND ($FF,X)          ; 21 FF | Logical AND with accumulator ((zero page,X))
    AND ($FF,X)          ; 21 FF | Logical AND with accumulator ((zero page,X))
    CLV                  ; B8 | Clear overflow flag
    SBC $EFEC            ; ED EC EF | Subtract with carry (absolute)
    INC $FEFE            ; EE FE FE | Increment (absolute)
    PLX                  ; FA | Pull X register from stack
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    SBC $00BD,X          ; FD BD 00 | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_01D
; Address: $E389F8
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_01D:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPY $ECFF            ; CC FF EC | Compare Y register (absolute)
    INC $7EFF,X          ; FE FF 7E | Increment (absolute,X)
    ROR $7FFF,X          ; 7E FF 7F | Rotate right (absolute,X)
    ROL $FF              ; 26 FF | Rotate left (zero page)
    LSR $FF              ; 46 FF | Logical shift right (zero page)
    LSR $FF              ; 46 FF | Logical shift right (zero page)
    ROR $FF              ; 66 FF | Rotate right (zero page)
    LSR $FF              ; 46 FF | Logical shift right (zero page)
    ROL $FF              ; 26 FF | Rotate left (zero page)
    SBC $FD08,Y          ; F9 08 FD | Subtract with carry (absolute,Y)
    STY $DC              ; 84 DC | Store Y register to zero page
    JMP $FD10F1          ; 5C F1 10 FD | Jump to address long
    PHP                  ; 08 | Push processor status to stack
    PLX                  ; FA | Pull X register from stack
    ORA #$FA             ; 09 FA | Logical OR with accumulator (immediate)
    ORA #$F7             ; 09 F7 | Logical OR with accumulator (immediate)
    BEQ $7B              ; F0 7B | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    BRA $EF              ; 80 EF | Branch always
    CPX #$FB             ; E0 FB | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BEQ $F7              ; F0 F7 | Branch if equal
    BEQ $F7              ; F0 F7 | Branch if equal
    BEQ $B3              ; F0 B3 | Branch if equal
    CPY $903C            ; CC 3C 90 | Compare Y register (absolute)
    BVS $A0              ; 70 A0 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_01E
; Address: $E38AA8
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_01E:
    RTI                  ; 40 | Return from interrupt
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $FF              ; 80 FF | Branch always
    BEQ $0F              ; F0 0F | Branch if equal
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank46_DmaFunction_020
; Address: $E38ACA
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_020:
    ASL $1E1E,X          ; 1E 1E 1E | Arithmetic shift left (absolute,X)
    ASL $0F0F,X          ; 1E 0F 0F | Arithmetic shift left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    STY $8400            ; 8C 00 84 | Store Y register to absolute address
    REP #$00             ; C2 00 | Reset processor status bits
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    BEQ $00              ; F0 00 | Branch if equal
    LDA                  ; BF FD 7D FE | Load from absolute long,X into accumulator
    ROL $BFFF,X          ; 3E FF BF | Rotate left (absolute,X)
    LDA                  ; BF FF DF 7F | Load from absolute long,X into accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    LDA                  ; BF 81 9F 80 | Load from absolute long,X into accumulator
    STA                  ; 9F 80 8F 80 | Store accumulator to absolute long,X
    REP #$C5             ; C2 C5 | Reset processor status bits
    CMP ($C5,X)          ; C1 C5 | Compare accumulator ((zero page,X))
    CMP ($E4,X)          ; C1 E4 | Compare accumulator ((zero page,X))
    CPX $40              ; E4 40 | Compare X register (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_022
; Address: $E38B16
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_022:
    BVS $00              ; 70 00 | Branch if overflow set
    BMI $00              ; 30 00 | Branch if negative
    DEC                  ; 3A | Decrement accumulator
    DEC                  ; 3A | Decrement accumulator
    INC $FF              ; E6 FF | Increment (zero page)
    INC $FF              ; E6 FF | Increment (zero page)
    INC $FF              ; E6 FF | Increment (zero page)
    ORA ($FA),Y          ; 11 FA | Logical OR with accumulator ((zero page),Y)
    ORA #$F9             ; 09 F9 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    SBC $FC04,X          ; FD 04 FC | Subtract with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    LDA                  ; BF B1 EF E0 | Load from absolute long,X into accumulator
    BEQ $F7              ; F0 F7 | Branch if equal
    BEQ $FB              ; F0 FB | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $D8              ; F0 D8 | Branch if equal
    CPY #$4E             ; C0 4E | Compare Y register (immediate)
    ASL $8080            ; 0E 80 80 | Arithmetic shift left (absolute)
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$A0             ; C0 A0 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_025
; Address: $E38BB0
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_025:
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    AND $1D39,Y          ; 39 39 1D | Logical AND with accumulator (absolute,Y)
    ORA $0E0E,X          ; 1D 0E 0E | Logical OR with accumulator (absolute,X)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    DEC $00              ; C6 00 | Decrement (zero page)
    SEP #$00             ; E2 00 | Set processor status bits
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    SBC $FC00,Y          ; F9 00 FC | Subtract with carry (absolute,Y)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    SBC $FCF5,X          ; FD F5 FC | Subtract with carry (absolute,X)
    INC $7EFA,X          ; FE FA 7E | Increment (absolute,X)
    ROR $3F3F,X          ; 7E 3F 3F | Rotate right (absolute,X)
    STA                  ; 9F 9F 00 00 | Store accumulator to absolute long,X
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_026
; Address: $E38C04
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_026:
    LDA $DDB9,Y          ; B9 B9 DD | Load from absolute,Y into accumulator
    CMP $ECEC,X          ; DD EC EC | Compare accumulator (absolute,X)
    ROR $66              ; 66 66 | Rotate right (zero page)
    ORA $8400            ; 0D 00 84 | Logical OR with accumulator (absolute)
    LSR $00              ; 46 00 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_027
; Address: $E38C16
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_027:
    JSL $001300          ; 22 00 13 00 | Jump to subroutine long
    STA $8D00,Y          ; 99 00 8D | Store accumulator to absolute,Y
    CPY $7F00            ; CC 00 7F | Compare Y register (absolute)
    ROL $BE38,X          ; 3E 38 BE | Rotate left (absolute,X)
    CLV                  ; B8 | Clear overflow flag
    STA                  ; 9F 9D DF DD | Store accumulator to absolute long,X
    DEC $C6C7            ; CE C7 C6 | Decrement (absolute)
    BRA $00              ; 80 00 | Branch always
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_028
; Address: $E38C38
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_028:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    BMI $00              ; 30 00 | Branch if negative
    SEC                  ; 38 | Set carry flag
    SBC $7D7F,Y          ; F9 7F 7D | Subtract with carry (absolute,Y)
    ADC $7E7F,X          ; 7D 7F 7E | Add with carry (absolute,X)
    ROL $A6A7            ; 2E A7 A6 | Rotate left (absolute)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank46_DmaFunction_029
; Address: $E38C5A
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_029:
    BNE $00              ; D0 00 | Branch if not equal
    CLI                  ; 58 | Clear interrupt disable flag
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank46_DmaFunction_02C
; Address: $E38C7E
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_02C:
    JSR $FF00            ; 20 00 FF | Jump to subroutine
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    INC $FE06,X          ; FE 06 FE | Increment (absolute,X)
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    SBC $FE04,X          ; FD 04 FE | Subtract with carry (absolute,X)
    INC $FCFC,X          ; FE FC FC | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SBC $F9F8,Y          ; F9 F8 F9 | Subtract with carry (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BIT $67              ; 24 67 | Test bits in accumulator (zero page)
    JMP ($78B7)          ; 6C B7 78 | Jump to address (absolute indirect)
    LDX $D070            ; AE 70 D0 | Load from absolute address into X register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_02D
; Address: $E38CAA
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_02D:
    STZ $C4              ; 64 C4 | Store zero to zero page
    STA                  ; 9F E7 18 EF | Store accumulator to absolute long,X
    BPL $FF              ; 10 FF | Branch if positive
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    INC $8F8F,X          ; FE 8F 8F | Increment (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BVS $00              ; 70 00 | Branch if overflow set
    CLV                  ; B8 | Clear overflow flag
    CLD                  ; D8 | Clear decimal mode flag
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    LDA $9CB9,Y          ; B9 B9 9C | Load from absolute,Y into accumulator
    STZ $DCDC            ; 9C DC DC | Store zero to absolute
    INC $E6EE            ; EE EE E6 | Increment (absolute)
    INC $F3              ; E6 F3 | Increment (zero page)
    ADC ($71),Y          ; 71 71 | Add with carry ((zero page),Y)
    BMI $30              ; 30 30 | Branch if negative
    LSR $00              ; 46 00 | Logical shift right (zero page)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA $0C00,Y          ; 19 00 0C | Logical OR with accumulator (absolute,Y)
    STX $CF00            ; 8E 00 CF | Store X register to absolute address
    INC $E3              ; E6 E3 | Increment (zero page)
    ADC ($61,X)          ; 61 61 | Add with carry ((zero page,X))
    AND ($31),Y          ; 31 31 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_02E
; Address: $E38D28
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_02E:
    BPL $10              ; 10 10 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    BRA $80              ; 80 80 | Branch always
    CLC                  ; 18 | Clear carry flag
    STZ $CE00,X          ; 9E 00 CE | Store zero to absolute,X
    CMP $C9D9,Y          ; D9 D9 C9 | Compare accumulator (absolute,Y)
    CMP #$E9             ; C9 E9 | Compare accumulator (immediate)
    SBC #$E8             ; E9 E8 | Subtract with carry (immediate)
    INX                  ; E8 | Increment X register
    JMP ($746C)          ; 6C 6C 74 | Jump to address (absolute indirect)
    JMP ($2600)          ; 6C 00 26 | Jump to address (absolute indirect)
    PHB                  ; 8B | Push data bank register to stack
    SBC $E5ED            ; ED ED E5 | Subtract with carry (absolute)
    SBC $E5              ; E5 E5 | Subtract with carry (zero page)
    SBC $65              ; E5 65 | Subtract with carry (zero page)
    ADC $65              ; 65 65 | Add with carry (zero page)
    ADC $30              ; 65 30 | Add with carry (zero page)
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    TXS                  ; 9A | Transfer X register to stack pointer
    TXS                  ; 9A | Transfer X register to stack pointer
    PLX                  ; FA | Pull X register from stack
    ORA #$FB             ; 09 FB | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    INC $F718,X          ; FE 18 F7 | Increment (absolute,X)
    ORA ($F5),Y          ; 11 F5 | Logical OR with accumulator ((zero page),Y)
    ORA ($EB),Y          ; 11 EB | Logical OR with accumulator ((zero page),Y)
    BIT $FB              ; 24 FB | Test bits in accumulator (zero page)
    SED                  ; F8 | Set decimal mode flag
    BEQ $F7              ; F0 F7 | Branch if equal
    BEQ $E7              ; F0 E7 | Branch if equal
    CPX #$EE             ; E0 EE | Compare X register (immediate)
    CPX #$EE             ; E0 EE | Compare X register (immediate)
    CPX #$FD             ; E0 FD | Compare X register (immediate)
    SBC ($DB,X)          ; E1 DB | Subtract with carry ((zero page,X))
    LDA                  ; BF 3F 3F 3F | Load from absolute long,X into accumulator
    SED                  ; F8 | Set decimal mode flag
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    BPL $FF              ; 10 FF | Branch if positive
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ASL $FB              ; 06 FB | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    INC $FDFE,X          ; FE FE FD | Increment (absolute,X)
    SBC $FDF9,Y          ; F9 F9 FD | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_02F
; Address: $E38DD9
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_02F:
    SBC $F3F3,Y          ; F9 F3 F3 | Subtract with carry (absolute,Y)
    BRA $FF              ; 80 FF | Branch always
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    SBC $F900,Y          ; F9 00 F9 | Subtract with carry (absolute,Y)
    SBC $FE00,X          ; FD 00 FE | Subtract with carry (absolute,X)
    INC $8000,X          ; FE 00 80 | Increment (absolute,X)
    BRA $40              ; 80 40 | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank46_DmaFunction_030
; Address: $E38E26
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_030:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    LDA                  ; BF 00 FF 00 | Load from absolute long,X into accumulator
    ASL $0E1E,X          ; 1E 1E 0E | Arithmetic shift left (absolute,X)
    ASL $0E0E            ; 0E 0E 0E | Arithmetic shift left (absolute)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    SBC $FC00,Y          ; F9 00 FC | Subtract with carry (absolute,Y)
    ROL $DF              ; 26 DF | Rotate left (zero page)
    JMP $58DF            ; 4C DF 58 | Jump to address
    BVC $BF              ; 50 BF | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank46_DmaFunction_031
; Address: $E38E89
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_031:
    JSR $A0BF            ; 20 BF A0 | Jump to subroutine
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BRA $D9              ; 80 D9 | Branch always
    CMP ($B3,X)          ; C1 B3 | Compare accumulator ((zero page,X))
    LDA $9FDF8F          ; AF 8F DF 9F | Load from absolute long address into accumulator
    BPL $FF              ; 10 FF | Branch if positive
    BMI $FF              ; 30 FF | Branch if negative

;------------------------------------------------------------------------------
; Bank46_DmaFunction_032
; Address: $E38EA5
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_032:
    JSR $40FF            ; 20 FF 40 | Jump to subroutine
    LDA                  ; BF BF FF FF | Load from absolute long,X into accumulator
    PHP                  ; 08 | Push processor status to stack
    ORA $0A              ; 05 0A | Logical OR with accumulator (zero page)
    ORA $0A              ; 05 0A | Logical OR with accumulator (zero page)
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA $0A              ; 05 0A | Logical OR with accumulator (zero page)
    ORA $0A              ; 05 0A | Logical OR with accumulator (zero page)
    ORA $1A              ; 05 1A | Logical OR with accumulator (zero page)
    ORA $1A              ; 05 1A | Logical OR with accumulator (zero page)
    CPX $93              ; E4 93 | Compare X register (zero page)
    CPX $90              ; E4 90 | Compare X register (zero page)
    CLV                  ; B8 | Clear overflow flag
    BEQ $E7              ; F0 E7 | Branch if equal
    PEA #$E4B3           ; F4 B3 E4 | Push effective address to stack
    PEA #$3CC0           ; F4 C0 3C | Push effective address to stack
    CPX #$1C             ; E0 1C | Compare X register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_033
; Address: $E38EF6
; Size: 109 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_033:
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BRA $7F              ; 80 7F | Branch always
    BCC $6C              ; 90 6C | Branch if carry clear
    CPY #$3C             ; C0 3C | Compare Y register (immediate)
    BVC $AC              ; 50 AC | Branch if overflow clear
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    INC $1EFE,X          ; FE FE 1E | Increment (absolute,X)
    INC $FC1C,X          ; FE 1C FC | Increment (absolute,X)
    STY $8C7C            ; 8C 7C 8C | Store Y register to absolute address
    BIT #$79             ; 89 79 | Test bits in accumulator (immediate)
    BIT #$79             ; 89 79 | Test bits in accumulator (immediate)
    LDA                  ; BF 7F FE 01 | Load from absolute long,X into accumulator
    INC $FC01,X          ; FE 01 FC | Increment (absolute,X)
    ADC $7986,Y          ; 79 86 79 | Add with carry (absolute,Y)
    STX $7F              ; 86 7F | Store X register to zero page
    BRA $01              ; 80 01 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    ROR $FF7E,X          ; 7E 7E FF | Rotate right (absolute,X)
    SBC $FFFF,X          ; FD FF FF | Subtract with carry (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    ROR $FF81,X          ; 7E 81 FF | Rotate right (absolute,X)
    CMP ($80,X)          ; C1 80 | Compare accumulator ((zero page,X))
    BIT $23              ; 24 23 | Test bits in accumulator (zero page)
    ASL $8C1E,X          ; 1E 1E 8C | Arithmetic shift left (absolute,X)
    STY $8080            ; 8C 80 80 | Store Y register to absolute address
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    CPX #$0F             ; E0 0F | Compare X register (immediate)
    BEQ $1E              ; F0 1E | Branch if equal
    SBC ($8C,X)          ; E1 8C | Subtract with carry ((zero page,X))
    BRA $7F              ; 80 7F | Branch always
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    STA $804F00          ; 8F 00 4F 80 | Store accumulator to absolute long address
    CPY #$DF             ; C0 DF | Compare Y register (immediate)
    CPX #$7B             ; E0 7B | Compare X register (immediate)
    ORA $1F0D            ; 0D 0D 1F | Logical OR with accumulator (absolute)
    BRA $33              ; 80 33 | Branch always
    CPY $F20D            ; CC 0D F2 | Compare Y register (absolute)
    CPX #$94             ; E0 94 | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    CPX $1C              ; E4 1C | Compare X register (zero page)
    CPX $F81F            ; EC 1F F8 | Compare X register (absolute)
    STZ $8D01,X          ; 9E 01 8D | Store zero to absolute,X

;------------------------------------------------------------------------------
; Bank46_DmaFunction_034
; Address: $E38FB1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_034:
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))
    BRA $C0              ; 80 C0 | Branch always
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank46_DmaFunction_035
; Address: $E38FC7
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_035:
    JSR $8191            ; 20 91 81 | Jump to subroutine
    JMP $D04CC0          ; 5C C0 4C D0 | Jump to address long
    JMP $FFF0            ; 4C F0 FF | Jump to address
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$9E             ; C0 9E | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_036
; Address: $E38FDB
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_036:
    BMI $D7              ; 30 D7 | Branch if negative
    PLP                  ; 28 | Pull processor status from stack
    AND $0601,X          ; 3D 01 06 | Logical AND with accumulator (absolute,X)
    ASL $C7CF            ; 0E CF C7 | Arithmetic shift left (absolute)
    STX $60              ; 86 60 | Store X register to zero page
    PLX                  ; FA | Pull X register from stack
    ASL $7E              ; 06 7E | Arithmetic shift left (zero page)
    ASL $FC              ; 06 FC | Arithmetic shift left (zero page)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    ROR $FC01,X          ; 7E 01 FC | Rotate right (absolute,X)
    STZ $CE61,X          ; 9E 61 CE | Store zero to absolute,X
    AND ($9E),Y          ; 31 9E | Logical AND with accumulator ((zero page),Y)
    STA ($F6,X)          ; 81 F6 | Store accumulator to (zero page,X)
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    SBC $FBFD,Y          ; F9 FD FB | Subtract with carry (absolute,Y)
    BIT $96CB            ; 2C CB 96 | Test bits in accumulator (absolute)
    SBC ($53,X)          ; E1 53 | Subtract with carry ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_037
; Address: $E3900E
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_037:
    CLV                  ; B8 | Clear overflow flag
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    BRA $FF              ; 80 FF | Branch always
    BRA $07              ; 80 07 | Branch always
    DEC $3B              ; C6 3B | Decrement (zero page)
    INC $FF3F,X          ; FE 3F FF | Increment (absolute,X)
    ROL $1F              ; 26 1F | Rotate left (zero page)
    BPL $0F              ; 10 0F | Branch if positive
    SED                  ; F8 | Set decimal mode flag
    ORA ($8E),Y          ; 11 8E | Logical OR with accumulator ((zero page),Y)
    BIT $37E3            ; 2C E3 37 | Test bits in accumulator (absolute)
    BEQ $9B              ; F0 9B | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    STA ($6F),Y          ; 91 6F | Store accumulator to (zero page),Y
    STY $CFF3            ; 8C F3 CF | Store Y register to absolute address
    BCS $7F              ; B0 7F | Branch if carry set
    BRA $00              ; 80 00 | Branch always
    DEC $39              ; C6 39 | Decrement (zero page)
    PEA #$5988           ; F4 88 59 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank46_DmaFunction_038
; Address: $E39065
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_038:
    SBC ($71,X)          ; E1 71 | Subtract with carry ((zero page,X))
    SBC ($05,X)          ; E1 05 | Subtract with carry ((zero page,X))
    SBC $8894,Y          ; F9 94 88 | Subtract with carry (absolute,Y)
    BIT $D7E0            ; 2C E0 D7 | Test bits in accumulator (absolute)
    AND $AFC6,Y          ; 39 C6 AF | Logical AND with accumulator (absolute,Y)
    BVC $FE              ; 50 FE | Branch if overflow clear
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    INC $1F              ; E6 1F | Increment (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator
    SBC $F9E7,Y          ; F9 E7 F9 | Subtract with carry (absolute,Y)
    LDA $CDF3,X          ; BD F3 CD | Load from absolute,X into accumulator
    CPX #$C7             ; E0 C7 | Compare X register (immediate)
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    AND ($FE,X)          ; 21 FE | Logical AND with accumulator ((zero page,X))
    ORA $C4EE            ; 0D EE C4 | Logical OR with accumulator (absolute)
    CPY $4CF7            ; CC F7 4C | Compare Y register (absolute)
    EOR ($76,X)          ; 41 76 | Exclusive OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_039
; Address: $E390B1
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_039:
    BRA $C0              ; 80 C0 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    BRA $78              ; 80 78 | Branch always
    BRA $A1              ; 80 A1 | Branch always
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SBC ($1F,X)          ; E1 1F | Subtract with carry ((zero page,X))
    REP #$3F             ; C2 3F | Reset processor status bits
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    LDA                  ; BF C0 FF C0 | Load from absolute long,X into accumulator
    CPX #$0E             ; E0 0E | Compare X register (immediate)
    SBC ($DF),Y          ; F1 DF | Subtract with carry ((zero page),Y)
    LDY #$3F             ; A0 3F | Load immediate value into Y register
    CPY #$FE             ; C0 FE | Compare Y register (immediate)
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    BRA $7F              ; 80 7F | Branch always
    SED                  ; F8 | Set decimal mode flag
    BRA $DF              ; 80 DF | Branch always
    LDA                  ; BF 0F FF 89 | Load from absolute long,X into accumulator
    ADC $FD0D,Y          ; 79 0D FD | Add with carry (absolute,Y)
    ORA $FD              ; 05 FD | Logical OR with accumulator (zero page)
    CPY #$BF             ; C0 BF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_03A
; Address: $E39133
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_03A:
    RTI                  ; 40 | Return from interrupt
    ADC $FD86,Y          ; 79 86 FD | Add with carry (absolute,Y)
    SBC $FF02,X          ; FD 02 FF | Subtract with carry (absolute,X)
    BNE $F0              ; D0 F0 | Branch if not equal
    INY                  ; C8 | Increment Y register
    SED                  ; F8 | Set decimal mode flag
    CPX $FC              ; E4 FC | Compare X register (zero page)
    INC $EEFE,X          ; FE FE EE | Increment (absolute,X)
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    INC $F0FE,X          ; FE FE F0 | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    ROL $383F,X          ; 3E 3F 38 | Rotate left (absolute,X)
    ROL $7C62,X          ; 3E 62 7C | Rotate left (absolute,X)
    LSR $7F              ; 46 7F | Logical shift right (zero page)
    JMP $211E63          ; 5C 63 1E 21 | PPU graphics register access
    ADC $3F70            ; 6D 70 3F | Add with carry (absolute)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $3F              ; 80 3F | Branch always
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    BRA $05              ; 80 05 | Branch always
    BIT $23              ; 24 23 | Test bits in accumulator (zero page)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    SBC $7EF8,Y          ; F9 F8 7E | Subtract with carry (absolute,Y)
    ROR $7FFF,X          ; 7E FF 7F | Rotate right (absolute,X)
    STA                  ; 9F 1F 9F FF | Store accumulator to absolute long,X
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_03B
; Address: $E391A2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_03B:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $80              ; 80 80 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($10),Y          ; 11 10 | Logical OR with accumulator ((zero page),Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_03C
; Address: $E391C0
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_03C:
    STZ $1C              ; 64 1C | Store zero to zero page
    ADC #$19             ; 69 19 | Add with carry (immediate)
    BVS $10              ; 70 10 | Branch if overflow set
    STA $F379,Y          ; 99 79 F3 | Store accumulator to absolute,Y
    STA                  ; 9F 00 0F 00 | Store accumulator to absolute long,X
    CMP $D026,Y          ; D9 26 D0 | Compare accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_03D
; Address: $E391D6
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_03D:
    SBC $8B06,Y          ; F9 06 8B | Subtract with carry (absolute,Y)
    DEC $FFE0,X          ; DE E0 FF | Decrement (absolute,X)
    CPY #$0E             ; C0 0E | Compare Y register (immediate)
    AND ($CA),Y          ; 31 CA | Logical AND with accumulator ((zero page),Y)
    CMP $E362            ; CD 62 E3 | Compare accumulator (absolute)
    BRA $73              ; 80 73 | Branch always
    INX                  ; E8 | Increment X register
    CLC                  ; 18 | Clear carry flag
    CPY #$CF             ; C0 CF | Compare Y register (immediate)
    BMI $E3              ; 30 E3 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    STY $6798            ; 8C 98 67 | Store Y register to absolute address
    CLC                  ; 18 | Clear carry flag
    TYA                  ; 98 | Transfer Y register to accumulator
    CPY #$74             ; C0 74 | Compare Y register (immediate)
    BEQ $9F              ; F0 9F | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    TYA                  ; 98 | Transfer Y register to accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_03E
; Address: $E3921B
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_03E:
    CPX #$3C             ; E0 3C | Compare X register (immediate)
    CPY #$3C             ; C0 3C | Compare Y register (immediate)
    CPY #$F7             ; C0 F7 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    JMP $583E51          ; 5C 51 3E 58 | Jump to address long
    TXS                  ; 9A | Transfer X register to stack pointer
    STA                  ; 9F B9 BE 00 | Store accumulator to absolute long,X
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_03F
; Address: $E3923E
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_03F:
    RTI                  ; 40 | Return from interrupt
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    LDX $379E            ; AE 9E 37 | Load from absolute address into X register
    STA $37C34C          ; 8F 4C C3 37 | Store accumulator to absolute long address
    BEQ $07              ; F0 07 | Branch if equal
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ROR $7F01,X          ; 7E 01 7F | Rotate right (absolute,X)
    CPX $C0AF            ; EC AF C0 | Compare X register (absolute)
    DEY                  ; 88 | Decrement Y register
    STY $FB              ; 84 FB | Store Y register to zero page
    ASL $F600            ; 0E 00 F6 | Arithmetic shift left (absolute)
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BCS $40              ; B0 40 | Branch if carry set

;------------------------------------------------------------------------------
; Bank46_DmaFunction_040
; Address: $E39296
; Size: 112 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_040:
    CLV                  ; B8 | Clear overflow flag
    RTI                  ; 40 | Return from interrupt
    BEQ $FC              ; F0 FC | Branch if equal
    BRA $BF              ; 80 BF | Branch always
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$BF             ; C0 BF | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    ROL $7FFF,X          ; 3E FF 7F | Rotate left (absolute,X)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    BVS $8F              ; 70 8F | Branch if overflow set
    LSR $13BF            ; 4E BF 13 | Logical shift right (absolute)
    CPX #$E0             ; E0 E0 | Game work RAM access
    SEI                  ; 78 | Set interrupt disable flag
    STA $40BF70          ; 8F 70 BF 40 | Store accumulator to absolute long address
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BEQ $FC              ; F0 FC | Branch if equal
    SBC $F8F9,Y          ; F9 F9 F8 | Subtract with carry (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    BEQ $0F              ; F0 0F | Branch if equal
    SBC $F806,Y          ; F9 06 F8 | Subtract with carry (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    BRA $C0              ; 80 C0 | Branch always
    DEC $86              ; C6 86 | Decrement (zero page)
    ORA ($81,X)          ; 01 81 | Logical OR with accumulator ((zero page,X))
    LSR $B780,X          ; 5E 80 B7 | Logical shift right (absolute,X)
    CMP $E0C0            ; CD C0 E0 | Game work RAM access
    BRA $FF              ; 80 FF | Branch always
    SBC $F800,Y          ; F9 00 F8 | Subtract with carry (absolute,Y)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    STZ $0C1E,X          ; 9E 1E 0C | Store zero to absolute,X
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    SBC $9BF0            ; ED F0 9B | Subtract with carry (absolute)
    STZ $00E1            ; 9C E1 00 | Store zero to absolute
    STA                  ; 9F 60 60 00 | Store accumulator to absolute long,X
    PHA                  ; 48 | Push accumulator to stack
    LDA $3FBF2F          ; AF 2F BF 3F | Load from absolute long address into accumulator
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BCC $00              ; 90 00 | Branch if carry clear
    BNE $00              ; D0 00 | Branch if not equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$CF             ; C0 CF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_041
; Address: $E393C5
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_041:
    CPY #$EF             ; C0 EF | Compare Y register (immediate)
    CPX #$E7             ; E0 E7 | Compare X register (immediate)
    CPX #$F7             ; E0 F7 | Compare X register (immediate)
    BEQ $E7              ; F0 E7 | Branch if equal
    CPX #$C1             ; E0 C1 | Compare X register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    ASL $1F01,X          ; 1E 01 1F | Arithmetic shift left (absolute,X)
    JMP $7CE4            ; 4C E4 7C | Jump to address
    JMP $4158D8          ; 5C D8 58 41 | Jump to address long
    CMP ($41,X)          ; C1 41 | Compare accumulator ((zero page,X))
    CMP ($7C,X)          ; C1 7C | Compare accumulator ((zero page,X))
    CPY $FC33            ; CC 33 FC | Compare Y register (absolute)
    JMP $A758A3          ; 5C A3 58 A7 | Jump to address long
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    BPL $10              ; 10 10 | Branch if positive
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BEQ $F7              ; F0 F7 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BPL $EF              ; 10 EF | Branch if positive
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    PHP                  ; 08 | Push processor status to stack
    ORA $99D6,Y          ; 19 D6 99 | Logical OR with accumulator (absolute,Y)
    SEI                  ; 78 | Set interrupt disable flag
    CLI                  ; 58 | Clear interrupt disable flag
    BIT $4637            ; 2C 37 46 | Test bits in accumulator (absolute)
    ADC $C8B7,Y          ; 79 B7 C8 | Add with carry (absolute,Y)
    CPX $00E0            ; EC E0 00 | Compare X register (absolute)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_042
; Address: $E39435
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_042:
    BRA $70              ; 80 70 | Branch always
    BRA $38              ; 80 38 | Branch always
    CPY #$7E             ; C0 7E | Compare Y register (immediate)
    BRA $CB              ; 80 CB | Branch always
    SBC $FF12            ; ED 12 FF | Subtract with carry (absolute)
    BRA $7F              ; 80 7F | Branch always
    BRA $3F              ; 80 3F | Branch always
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BRA $7F              ; 80 7F | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal

;------------------------------------------------------------------------------
; Bank46_DmaFunction_043
; Address: $E3946A
; Size: 109 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_043:
    BEQ $0F              ; F0 0F | Branch if equal
    BNE $2F              ; D0 2F | Branch if not equal
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPX $11EC            ; EC EC 11 | Compare X register (absolute)
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $01              ; F0 01 | Branch if equal
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$CF             ; E0 CF | Compare X register (immediate)
    BMI $FF              ; 30 FF | Branch if negative
    INC $F801,X          ; FE 01 F8 | Increment (absolute,X)
    SBC $8007,Y          ; F9 07 80 | Subtract with carry (absolute,Y)
    SBC ($0F),Y          ; F1 0F | Subtract with carry ((zero page),Y)
    DEC $9A3E            ; CE 3E 9A | Decrement (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    STA $6760            ; 8D 60 67 | Store accumulator to absolute address
    CPX #$CE             ; E0 CE | Compare X register (immediate)
    CMP ($EC,X)          ; C1 EC | Compare accumulator ((zero page,X))
    BCC $8F              ; 90 8F | Branch if carry clear
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($1B,X)          ; 01 1B | Logical OR with accumulator ((zero page,X))
    CMP $DC3F,X          ; DD 3F DC | Compare accumulator (absolute,X)
    STA                  ; 9F 77 9F FF | Store accumulator to absolute long,X
    CPY #$BF             ; C0 BF | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    STA                  ; 9F 80 0F 00 | Store accumulator to absolute long,X
    BEQ $F0              ; F0 F0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INC $FBFE,X          ; FE FE FB | Increment (absolute,X)
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    BEQ $0F              ; F0 0F | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    ADC $007D,X          ; 7D 7D 00 | Add with carry (absolute,X)
    BRA $7D              ; 80 7D | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BEQ $F0              ; F0 F0 | Branch if equal
    STA $FF9FFF          ; 8F FF 9F FF | Store accumulator to absolute long address
    BEQ $F0              ; F0 F0 | Branch if equal
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank46_DmaFunction_044
; Address: $E3957C
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_044:
    BEQ $0F              ; F0 0F | Branch if equal
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    LDX $CD3E,Y          ; BE 3E CD | Load from absolute,Y into X register
    CPY $E60D            ; CC 0D E6 | Compare Y register (absolute)
    STA ($9A,X)          ; 81 9A | Store accumulator to (zero page,X)
    INC $58              ; E6 58 | Increment (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    INC $7801,X          ; FE 01 78 | Increment (absolute,X)
    BPL $25              ; 10 25 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    CPY $0605            ; CC 05 06 | Compare Y register (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    BMI $06              ; 30 06 | Branch if negative
    SBC $FC03,Y          ; F9 03 FC | Subtract with carry (absolute,Y)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    BRA $7F              ; 80 7F | Branch always
    STA $F97D,X          ; 9D 7D F9 | Store accumulator to absolute,X
    ADC ($8E),Y          ; 71 8E | Add with carry ((zero page),Y)
    LDX $E2E3,Y          ; BE E3 E2 | Load from absolute,Y into X register
    ADC $8782,X          ; 7D 82 87 | Add with carry (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    STA $40BF70          ; 8F 70 BF 40 | Store accumulator to absolute long address
    BCS $FF              ; B0 FF | Branch if carry set
    STA                  ; 9F E0 7F 80 | Store accumulator to absolute long,X
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    ASL $9F0E            ; 0E 0E 9F | Arithmetic shift left (absolute)
    SBC #$0F             ; E9 0F | Subtract with carry (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    STY $7F73            ; 8C 73 7F | Store Y register to absolute address
    BRA $FF              ; 80 FF | Branch always
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank46_DmaFunction_045
; Address: $E39620
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_045:
    EOR ($FE,X)          ; 41 FE | Exclusive OR with accumulator ((zero page,X))
    ASL $84F0            ; 0E F0 84 | Arithmetic shift left (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    NOP                  ; EA | No operation
    CPX $661E            ; EC 1E 66 | Compare X register (absolute)
    STY $C0DF            ; 8C DF C0 | Store Y register to absolute address
    STY $1F              ; 84 1F | Store Y register to zero page
    CPX #$DF             ; E0 DF | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_046
; Address: $E39639
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_046:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    ADC $3302,X          ; 7D 02 33 | Add with carry (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_047
; Address: $E39643
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_047:
    BVS $CF              ; 70 CF | Branch if overflow set
    BEQ $BF              ; F0 BF | Branch if equal
    CPY #$9F             ; C0 9F | Compare Y register (immediate)
    CPX #$C7             ; E0 C7 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BVS $C1              ; 70 C1 | Branch if overflow set
    STA $CC7A            ; 8D 7A CC | Store accumulator to absolute address
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_048
; Address: $E39687
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_048:
    RTI                  ; 40 | Return from interrupt
    STA                  ; 9F E0 DF E0 | Store accumulator to absolute long,X
    LDA                  ; BF C0 7F 80 | Load from absolute long,X into accumulator
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    EOR $F1BC            ; 4D BC F1 | Exclusive OR with accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank46_DmaFunction_049
; Address: $E396C0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_049:
    JSR $501F            ; 20 1F 50 | Jump to subroutine
    LDY #$8F             ; A0 8F | Load immediate value into Y register
    SBC ($8D,X)          ; E1 8D | Subtract with carry ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_04A
; Address: $E396CC
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_04A:
    TXS                  ; 9A | Transfer X register to stack pointer
    SEI                  ; 78 | Set interrupt disable flag
    CPX $FF1C            ; EC 1C FF | Compare X register (absolute)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($35,X)          ; 01 35 | Logical OR with accumulator ((zero page,X))
    ORA #$F8             ; 09 F8 | Logical OR with accumulator (immediate)
    DEY                  ; 88 | Decrement Y register
    SEI                  ; 78 | Set interrupt disable flag
    CPX #$18             ; E0 18 | Compare X register (immediate)
    CPX #$98             ; E0 98 | Compare X register (immediate)
    ASL $1EF6,X          ; 1E F6 1E | Arithmetic shift left (absolute,X)
    PLX                  ; FA | Pull X register from stack
    BRA $73              ; 80 73 | Branch always

;------------------------------------------------------------------------------
; Bank46_DmaFunction_04B
; Address: $E396FB
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_04B:
    BEQ $11              ; F0 11 | Branch if equal
    PEA #$FA19           ; F4 19 FA | Push effective address to stack
    CPY $27F3            ; CC F3 27 | Compare Y register (absolute)
    CPY #$83             ; C0 83 | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_04C
; Address: $E39712
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_04C:
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    STZ $7F03            ; 9C 03 7F | Store zero to absolute
    STA                  ; 9F 7F 9F 7F | Store accumulator to absolute long,X
    LDA                  ; BF 7F 3F FF | Load from absolute long,X into accumulator
    STA ($7F,X)          ; 81 7F | Store accumulator to (zero page,X)
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $FF              ; 80 FF | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    BCS $BF              ; B0 BF | Branch if carry set
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    LDA                  ; BF C0 00 FF | Load from absolute long,X into accumulator
    BRA $7F              ; 80 7F | Branch always
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank46_DmaFunction_04D
; Address: $E39757
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_04D:
    JSR $40BF            ; 20 BF 40 | Jump to subroutine
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    ASL $04FF            ; 0E FF 04 | Arithmetic shift left (absolute)
    CPX $1F              ; E4 1F | Compare X register (zero page)
    SED                  ; F8 | Set decimal mode flag
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$F7             ; E0 F7 | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    SBC ($E1,X)          ; E1 E1 | Subtract with carry ((zero page,X))
    ORA #$F7             ; 09 F7 | Logical OR with accumulator (immediate)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    BRA $E1              ; 80 E1 | Branch always
    ASL $807F,X          ; 1E 7F 80 | Arithmetic shift left (absolute,X)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BRA $7F              ; 80 7F | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    ROL $7FC1,X          ; 3E C1 7F | Rotate left (absolute,X)
    BRA $BF              ; 80 BF | Branch always
    RTI                  ; 40 | Return from interrupt
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    BRA $E0              ; 80 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank46_DmaFunction_04E
; Address: $E397C1
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_04E:
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BEQ $F8              ; F0 F8 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ORA $07FD            ; 0D FD 07 | Logical OR with accumulator (absolute)
    SBC $E003,X          ; FD 03 E0 | Game work RAM access
    BEQ $0F              ; F0 0F | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SBC $FF02,X          ; FD 02 FF | Subtract with carry (absolute,X)
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BCC $9F              ; 90 9F | Branch if carry clear
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    STA                  ; 9F E0 06 F9 | Store accumulator to absolute long,X
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    STA                  ; 9F 60 FF 00 | Store accumulator to absolute long,X
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CLV                  ; B8 | Clear overflow flag
    STX $FEF3            ; 8E F3 FE | Store X register to absolute address
    CMP ($DF,X)          ; C1 DF | Compare accumulator ((zero page,X))
    SBC ($79,X)          ; E1 79 | Subtract with carry ((zero page,X))
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    BCS $F0              ; B0 F0 | Branch if carry set
    PHP                  ; 08 | Push processor status to stack
    PEA #$8408           ; F4 08 84 | Push effective address to stack
    SEI                  ; 78 | Set interrupt disable flag
    DEC $FE20,X          ; DE 20 FE | Decrement (absolute,X)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    LSR $6CC0            ; 4E C0 6C | Logical shift right (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND $3EC3,X          ; 3D C3 3E | Logical AND with accumulator (absolute,X)
    CMP ($04,X)          ; C1 04 | Compare accumulator ((zero page,X))
    BRA $FF              ; 80 FF | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BPL $A3              ; 10 A3 | Branch if positive
    LDY #$71             ; A0 71 | Load immediate value into Y register
    ROR $30FF,X          ; 7E FF 30 | Rotate right (absolute,X)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    JMP $000C00          ; 5C 00 0C 00 | Jump to address long
    BRA $7F              ; 80 7F | Branch always

;------------------------------------------------------------------------------
; Bank46_DmaFunction_04F
; Address: $E39864
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_04F:
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    STA                  ; 9F 60 C7 38 | Store accumulator to absolute long,X
    SBC $1E              ; E5 1E | Subtract with carry (zero page)
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    BMI $CF              ; 30 CF | Branch if negative
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    STY $7F              ; 84 7F | Store Y register to zero page
    BRA $7F              ; 80 7F | Branch always
    BRA $00              ; 80 00 | Branch always
    ROL $3EC2,X          ; 3E C2 3E | Rotate left (absolute,X)
    BEQ $0E              ; F0 0E | Branch if equal
    SBC ($0F),Y          ; F1 0F | Subtract with carry ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    LDA $F843,X          ; BD 43 F8 | Load from absolute,X into accumulator
    INC $0101,X          ; FE 01 01 | Increment (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC $3FFF,X          ; FE FF 3F | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SBC $F8FC,X          ; FD FC F8 | Subtract with carry (absolute,X)
    DEC $CFF9            ; CE F9 CF | Decrement (absolute)
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    BCS $81              ; B0 81 | Branch if carry set
    INY                  ; C8 | Increment Y register
    BRA $C8              ; 80 C8 | Branch always
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SBC ($1F,X)          ; E1 1F | Subtract with carry ((zero page,X))
    LDA                  ; BF 80 3F 00 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank46_DmaFunction_050
; Address: $E39931
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_050:
    JSR $0CF3            ; 20 F3 0C | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    INC $7F01,X          ; FE 01 7F | Increment (absolute,X)
    LDA                  ; BF C0 7F 80 | Load from absolute long,X into accumulator
    TXS                  ; 9A | Transfer X register to stack pointer
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank46_DmaFunction_051
; Address: $E39951
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_051:
    JSR $40BF            ; 20 BF 40 | Jump to subroutine
    BRA $7F              ; 80 7F | Branch always
    BRA $FF              ; 80 FF | Branch always
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SBC $F803,X          ; FD 03 F8 | Subtract with carry (absolute,X)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    SED                  ; F8 | Set decimal mode flag
    ASL $FC              ; 06 FC | Arithmetic shift left (zero page)
    SBC $7F07,X          ; FD 07 7F | Subtract with carry (absolute,X)
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank46_DmaFunction_052
; Address: $E39985
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_052:
    CPX #$8F             ; E0 8F | Compare X register (immediate)
    BRA $66              ; 80 66 | Branch always
    CPX #$14             ; E0 14 | Compare X register (immediate)
    BEQ $08              ; F0 08 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BRA $F8              ; 80 F8 | Branch always
    BRA $7F              ; 80 7F | Branch always
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    BRA $7F              ; 80 7F | Branch always
    BRA $FF              ; 80 FF | Branch always
    CLC                  ; 18 | Clear carry flag
    STA                  ; 9F 60 9F 60 | Store accumulator to absolute long,X

;------------------------------------------------------------------------------
; Bank46_DmaFunction_053
; Address: $E399B5
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_053:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    AND $FFC2,X          ; 3D C2 FF | Logical AND with accumulator (absolute,X)
    LDA                  ; BF 40 19 E6 | Load from absolute long,X into accumulator
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    ADC ($61,X)          ; 61 61 | Add with carry ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    SBC $9E02,X          ; FD 02 9E | Subtract with carry (absolute,X)
    BRA $00              ; 80 00 | Branch always
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    STZ $FF63            ; 9C 63 FF | Store zero to absolute
    CPY #$C8             ; C0 C8 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    STZ $8E71            ; 9C 71 8E | Store zero to absolute
    ROR $7A83,X          ; 7E 83 7A | Rotate right (absolute,X)
    SBC $F901,Y          ; F9 01 F9 | Subtract with carry (absolute,Y)
    ORA ($0B,X)          ; 01 0B | Logical OR with accumulator ((zero page,X))
    STZ $8C60            ; 9C 60 8C | Store zero to absolute
    BVS $E6              ; 70 E6 | Branch if overflow set
    CLC                  ; 18 | Clear carry flag
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$9F             ; E0 9F | Compare X register (immediate)
    CPX #$90             ; E0 90 | Compare X register (immediate)
    BRA $FF              ; 80 FF | Branch always
    SEC                  ; 38 | Set carry flag
    ROR $FE81,X          ; 7E 81 FE | Rotate right (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank46_DmaFunction_054
; Address: $E39A6D
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_054:
    BRA $FF              ; 80 FF | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    SBC $FF7E,Y          ; F9 7E FF | Subtract with carry (absolute,Y)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BRA $1F              ; 80 1F | Branch always
    CPX #$DB             ; E0 DB | Compare X register (immediate)
    CPX $8F              ; E4 8F | Compare X register (zero page)
    BCS $47              ; B0 47 | Branch if carry set
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BPL $F8              ; 10 F8 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    INC $FD01,X          ; FE 01 FD | Increment (absolute,X)
    SBC $0007,Y          ; F9 07 00 | Subtract with carry (absolute,Y)
    ORA $FC              ; 05 FC | Logical OR with accumulator (zero page)
    ASL $FE              ; 06 FE | Arithmetic shift left (zero page)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA $FE              ; 05 FE | Logical OR with accumulator (zero page)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BRA $BF              ; 80 BF | Branch always
    RTI                  ; 40 | Return from interrupt
    SBC $3100,Y          ; F9 00 31 | Subtract with carry (absolute,Y)
    BPL $00              ; 10 00 | Branch if positive
    DEC $C6              ; C6 C6 | Decrement (zero page)
    SED                  ; F8 | Set decimal mode flag
    LDA                  ; BF 40 4F B0 | Load from absolute long,X into accumulator
    BMI $EF              ; 30 EF | Branch if negative
    BPL $FF              ; 10 FF | Branch if positive
    AND $0000,Y          ; 39 00 00 | Logical AND with accumulator (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    AND $F001,X          ; 3D 01 F0 | Logical AND with accumulator (absolute,X)
    CPX #$F7             ; E0 F7 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    BRA $F0              ; 80 F0 | Branch always
    CLV                  ; B8 | Clear overflow flag
    RTI                  ; 40 | Return from interrupt
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank46_DmaFunction_055
; Address: $E39B3B
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_055:
    JSR $00FE            ; 20 FE 00 | Jump to subroutine
    STA ($87,X)          ; 81 87 | Store accumulator to (zero page,X)
    SED                  ; F8 | Set decimal mode flag
    INC $EF              ; E6 EF | Increment (zero page)
    STA $6F0FE7          ; 8F E7 0F 6F | Store accumulator to absolute long address
    ADC $0001,Y          ; 79 01 00 | Add with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_056
; Address: $E39B57
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_056:
    ASL $67              ; 06 67 | Arithmetic shift left (zero page)
    LDA                  ; BF 4F FF 0F | Load from absolute long,X into accumulator
    CPX $FC              ; E4 FC | Compare X register (zero page)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CLV                  ; B8 | Clear overflow flag
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$03             ; E0 03 | Compare X register (immediate)
    BRA $80              ; 80 80 | Branch always
    CPX #$E0             ; E0 E0 | Game work RAM access
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    CPX #$E0             ; E0 E0 | Game work RAM access
    ROL $1C00,X          ; 3E 00 1C | Rotate left (absolute,X)
    INY                  ; C8 | Increment Y register
    CPY #$E1             ; C0 E1 | Compare Y register (immediate)
    SBC ($07,X)          ; E1 07 | Subtract with carry ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CPY #$FD             ; C0 FD | Compare Y register (immediate)
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    BMI $30              ; 30 30 | Branch if negative
    SBC $38C7,X          ; FD C7 38 | Subtract with carry (absolute,X)
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_057
; Address: $E39BC2
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_057:
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BVC $6F              ; 50 6F | Branch if overflow clear
    PHA                  ; 48 | Push accumulator to stack
    STA $F847B0          ; 8F B0 47 F8 | Store accumulator to absolute long address
    SED                  ; F8 | Set decimal mode flag
    STZ $8061,X          ; 9E 61 80 | Store zero to absolute,X
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    ASL $3FF1            ; 0E F1 3F | Arithmetic shift left (absolute)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ADC $7887,Y          ; 79 87 78 | Add with carry (absolute,Y)
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    BMI $CF              ; 30 CF | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    CMP $FF22,X          ; DD 22 FF | Compare accumulator (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    INC $FC01,X          ; FE 01 FC | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_059
; Address: $E39CA3
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_059:
    SBC $F904,X          ; FD 04 F9 | Subtract with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    INC $F600,X          ; FE 00 F6 | Increment (absolute,X)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    CPX #$BF             ; E0 BF | Compare X register (immediate)
    CPX #$BF             ; E0 BF | Compare X register (immediate)
    CPX #$BF             ; E0 BF | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    CPX #$21             ; E0 21 | PPU graphics register access
    CPX #$38             ; E0 38 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    ASL $DFFE,X          ; 1E FE DF | Arithmetic shift left (absolute,X)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($8D,X)          ; 01 8D | Logical OR with accumulator ((zero page,X))
    STA                  ; 9F 1F 13 3F | Store accumulator to absolute long,X
    BVC $7F              ; 50 7F | Branch if overflow clear
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    SBC $FF0F            ; ED 0F FF | Subtract with carry (absolute)
    BCC $1F              ; 90 1F | Branch if carry clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_05A
; Address: $E39D1E
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_05A:
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    ASL $82FF,X          ; 1E FF 82 | Arithmetic shift left (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ASL $82FE,X          ; 1E FE 82 | Arithmetic shift left (absolute,X)
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    SBC $F4BE,Y          ; F9 BE F4 | Subtract with carry (absolute,Y)
    LDA                  ; BF E1 FF 43 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank46_DmaFunction_05C
; Address: $E39D59
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_05C:
    CLV                  ; B8 | Clear overflow flag
    LDY $FCA0,X          ; BC A0 FC | Load from absolute,X into Y register
    RTI                  ; 40 | Return from interrupt
    INC $00FF,X          ; FE FF 00 | Increment (absolute,X)
    BMI $C1              ; 30 C1 | Branch if negative
    ROL $FF10,X          ; 3E 10 FF | Rotate left (absolute,X)
    DEC $FF              ; C6 FF | Decrement (zero page)
    SBC $00FE,X          ; FD FE 00 | Subtract with carry (absolute,X)
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    BPL $EF              ; 10 EF | Branch if positive
    INC $F801,X          ; FE 01 F8 | Increment (absolute,X)
    SBC $7907,Y          ; F9 07 79 | Subtract with carry (absolute,Y)
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    BMI $0F              ; 30 0F | Branch if negative
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    LDX $FF41,Y          ; BE 41 FF | Load from absolute,Y into X register
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    BRA $3F              ; 80 3F | Branch always
    BNE $1F              ; D0 1F | Branch if not equal
    INX                  ; E8 | Increment X register
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $20              ; 80 20 | Branch always
    CPY #$31             ; C0 31 | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BRA $07              ; 80 07 | Branch always
    SED                  ; F8 | Set decimal mode flag
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ADC ($FE,X)          ; 61 FE | Add with carry ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ASL $00F1            ; 0E F1 00 | Arithmetic shift left (absolute)
    BRA $00              ; 80 00 | Branch always
    PLX                  ; FA | Pull X register from stack
    ORA $FC              ; 05 FC | Logical OR with accumulator (zero page)
    SED                  ; F8 | Set decimal mode flag
    ASL $F0              ; 06 F0 | Arithmetic shift left (zero page)
    INC $1E              ; E6 1E | Increment (zero page)
    CMP $3D              ; C5 3D | Compare accumulator (zero page)
    DEC $3E              ; C6 3E | Decrement (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_05D
; Address: $E39E87
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_05D:
    BRA $F4              ; 80 F4 | Branch always
    STX $06              ; 86 06 | Store X register to zero page
    ASL $09E7            ; 0E E7 09 | Arithmetic shift left (absolute)
    ASL $F7              ; 06 F7 | Arithmetic shift left (zero page)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    BRA $7F              ; 80 7F | Branch always
    BPL $6F              ; 10 6F | Branch if positive
    CLD                  ; D8 | Clear decimal mode flag
    RTI                  ; 40 | Return from interrupt
    STA                  ; 9F F0 5F F3 | Store accumulator to absolute long,X
    LSR $5CF7,X          ; 5E F7 5C | Logical shift right (absolute,X)
    BPL $FF              ; 10 FF | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BRA $F0              ; 80 F0 | Branch always
    RTI                  ; 40 | Return from interrupt
    BVC $F7              ; 50 F7 | Branch if overflow clear
    BPL $FF              ; 10 FF | Branch if positive
    ADC ($9F,X)          ; 61 9F | Add with carry ((zero page,X))
    SBC ($1F),Y          ; F1 1F | Subtract with carry ((zero page),Y)
    SBC ($0F),Y          ; F1 0F | Subtract with carry ((zero page),Y)
    SBC $FB0F,Y          ; F9 0F FB | Subtract with carry (absolute,Y)
    ASL $0CFF            ; 0E FF 0C | Arithmetic shift left (absolute)
    ADC ($80,X)          ; 61 80 | Add with carry ((zero page,X))
    SBC ($01),Y          ; F1 01 | Subtract with carry ((zero page),Y)
    SBC ($01),Y          ; F1 01 | Subtract with carry ((zero page),Y)
    SBC $FB01,Y          ; F9 01 FB | Subtract with carry (absolute,Y)
    BMI $0F              ; 30 0F | Branch if negative
    SEI                  ; 78 | Set interrupt disable flag
    ADC $FE06,Y          ; 79 06 FE | Add with carry (absolute,Y)
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    BRA $08              ; 80 08 | Branch always
    BRA $7F              ; 80 7F | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_05E
; Address: $E39F29
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_05E:
    STA                  ; 9F 10 EF 00 | Store accumulator to absolute long,X
    INC $FF06,X          ; FE 06 FF | Increment (absolute,X)
    INC $E2FF,X          ; FE FF E2 | Increment (absolute,X)
    SEP #$CF             ; E2 CF | Set processor status bits
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    ORA $3F00,X          ; 1D 00 3F | Logical OR with accumulator (absolute,X)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BEQ $9F              ; F0 9F | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_05F
; Address: $E39F8E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_05F:
    INC $7C00,X          ; FE 00 7C | Increment (absolute,X)
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    STA                  ; 9F FE A3 20 | Store accumulator to absolute long,X
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank46_DmaFunction_060
; Address: $E39FB0
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_060:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BEQ $00              ; F0 00 | Branch if equal
    ROR $8400,X          ; 7E 00 84 | Rotate right (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    SEP #$03             ; E2 03 | Set processor status bits
    CPX $07              ; E4 07 | Compare X register (zero page)
    AND ($01,X)          ; 21 01 | Logical AND with accumulator ((zero page,X))
    LDA $809F80          ; AF 80 9F 80 | Load from absolute long address into accumulator
    BVS $E0              ; 70 E0 | Game work RAM access
    BRA $B8              ; 80 B8 | Branch always
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    INC $7F00,X          ; FE 00 7F | Increment (absolute,X)
    STA $FF0000          ; 8F 00 00 FF | Store accumulator to absolute long address
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    CPX $F60F            ; EC 0F F6 | Compare X register (absolute)
    BRA $00              ; 80 00 | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $07              ; F0 07 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SBC ($1F,X)          ; E1 1F | Subtract with carry ((zero page,X))
    BVS $8F              ; 70 8F | Branch if overflow set
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BPL $CF              ; 10 CF | Branch if positive
    CLC                  ; 18 | Clear carry flag
    DEC $1B30,X          ; DE 30 1B | Decrement (absolute,X)
    SBC ($07,X)          ; E1 07 | Subtract with carry ((zero page,X))
    EOR ($0F,X)          ; 41 0F | Exclusive OR with accumulator ((zero page,X))
    CMP #$0F             ; C9 0F | Compare accumulator (immediate)
    DEC $CB0C            ; CE 0C CB | Decrement (absolute)
    ASL $3E87,X          ; 1E 87 3E | Arithmetic shift left (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    INC $F861            ; EE 61 F8 | Increment (absolute)
    BEQ $7F              ; F0 7F | Branch if equal
    BEQ $3F              ; F0 3F | Branch if equal
    ROL $3F01,X          ; 3E 01 3F | Rotate left (absolute,X)
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPX #$7F             ; E0 7F | Compare X register (immediate)
    BEQ $3F              ; F0 3F | Branch if equal
    BEQ $3F              ; F0 3F | Branch if equal
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF F8 07 34 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank46_DmaFunction_061
; Address: $E3A0CA
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_061:
    ROR $3E81,X          ; 7E 81 3E | Rotate right (absolute,X)
    CMP ($E2,X)          ; C1 E2 | Compare accumulator ((zero page,X))
    ORA $FF00,X          ; 1D 00 FF | Logical OR with accumulator (absolute,X)
    ASL $0CF1            ; 0E F1 0C | Arithmetic shift left (absolute)
    BEQ $03              ; F0 03 | Branch if equal
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BPL $0F              ; 10 0F | Branch if positive
    INC $0001            ; EE 01 00 | Increment (absolute)
    BRA $FF              ; 80 FF | Branch always
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SBC $C080,Y          ; F9 80 C0 | Subtract with carry (absolute,Y)
    CPY #$70             ; C0 70 | Compare Y register (immediate)
    BEQ $38              ; F0 38 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    ORA $0CFD            ; 0D FD 0C | Logical OR with accumulator (absolute)
    CPX #$BF             ; E0 BF | Compare X register (immediate)
    CPY #$6F             ; C0 6F | Compare Y register (immediate)
    BEQ $37              ; F0 37 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    INC $7D00,X          ; FE 00 7D | Increment (absolute,X)
    ORA ($3D,X)          ; 01 3D | Logical OR with accumulator ((zero page,X))
    ORA ($1D,X)          ; 01 1D | Logical OR with accumulator ((zero page,X))
    ORA ($E1,X)          ; 01 E1 | Logical OR with accumulator ((zero page,X))
    SBC ($F7,X)          ; E1 F7 | Subtract with carry ((zero page,X))
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    INC $1E00,X          ; FE 00 1E | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    LDA ($B1),Y          ; B1 B1 | Load from (zero page),Y into accumulator
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    INC $4E00,X          ; FE 00 4E | Increment (absolute,X)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))
    BRA $99              ; 80 99 | Branch always
    STA $B9B9,Y          ; 99 B9 B9 | Store accumulator to absolute,Y
    SBC ($EF),Y          ; F1 EF | Subtract with carry ((zero page),Y)
    BEQ $EF              ; F0 EF | Branch if equal
    BEQ $0F              ; F0 0F | Branch if equal
    BRA $7F              ; 80 7F | Branch always
    ROR $00              ; 66 00 | Rotate right (zero page)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    ASL $4F00,X          ; 1E 00 4F | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_062
; Address: $E3A1E0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_062:
    SBC $FEFC,X          ; FD FC FE | Subtract with carry (absolute,X)
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_063
; Address: $E3A1F2
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_063:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    BRA $FA              ; 80 FA | Branch always
    ASL $0C03,X          ; 1E 03 0C | Arithmetic shift left (absolute,X)
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    ORA ($E8,X)          ; 01 E8 | Logical OR with accumulator ((zero page,X))
    CPX #$E7             ; E0 E7 | Compare X register (immediate)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    CLC                  ; 18 | Clear carry flag
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CMP $F033,Y          ; D9 33 F0 | Compare accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_064
; Address: $E3A264
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_064:
    JSL $E062F0          ; 22 F0 62 E0 | Game work RAM access
    WDM #$E0             ; 42 E0 | Game work RAM access
    CPX $C7              ; E4 C7 | Compare X register (zero page)
    CPX #$E7             ; E0 E7 | Compare X register (immediate)
    CPX #$26             ; E0 26 | Compare X register (immediate)
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    LDY $D83B,X          ; BC 3B D8 | Load from absolute,X into Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    DEY                  ; 88 | Decrement Y register
    BEQ $7F              ; F0 7F | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    LDA                  ; BF C8 BF C4 | Load from absolute long,X into accumulator
    STA                  ; 9F 8C 9B 04 | Store accumulator to absolute long,X
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    SBC $FF00            ; ED 00 FF | Subtract with carry (absolute)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    BEQ $00              ; F0 00 | Branch if equal
    JMP ($7E93)          ; 6C 93 7E | Jump to address (absolute indirect)
    STA ($1B,X)          ; 81 1B | Store accumulator to (zero page,X)
    CPX #$07             ; E0 07 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    BEQ $0F              ; F0 0F | Branch if equal
    AND ($C0,X)          ; 21 C0 | Logical AND with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank46_DmaFunction_065
; Address: $E3A2E4
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_065:
    BRA $00              ; 80 00 | Branch always
    BVS $00              ; 70 00 | Branch if overflow set
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BMI $00              ; 30 00 | Branch if negative
    DEC $38              ; C6 38 | Decrement (zero page)
    INX                  ; E8 | Increment X register
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    ORA ($81,X)          ; 01 81 | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BEQ $FF              ; F0 FF | Branch if equal
    ROR $C7FE,X          ; 7E FE C7 | Rotate right (absolute,X)
    SBC $00FF,Y          ; F9 FF 00 | Subtract with carry (absolute,Y)
    ADC $C6FE,X          ; 7D FE C6 | Add with carry (absolute,X)
    SBC $FFFF,Y          ; F9 FF FF | Subtract with carry (absolute,Y)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    CLV                  ; B8 | Clear overflow flag
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    BPL $00              ; 10 00 | Branch if positive
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BRA $FF              ; 80 FF | Branch always
    SEP #$FF             ; E2 FF | Set processor status bits
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    SBC ($03,X)          ; E1 03 | Subtract with carry ((zero page,X))
    SBC ($03),Y          ; F1 03 | Subtract with carry ((zero page),Y)
    SBC $0703,Y          ; F9 03 07 | Subtract with carry (absolute,Y)
    INC $F93E,X          ; FE 3E F9 | Increment (absolute,X)
    BVS $CF              ; 70 CF | Branch if overflow set
    BRA $FF              ; 80 FF | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BEQ $FF              ; F0 FF | Branch if equal
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BEQ $FF              ; F0 FF | Branch if equal
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CPX #$07             ; E0 07 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    ROR $7FC1,X          ; 7E C1 7F | Rotate right (absolute,X)
    CMP ($7F,X)          ; C1 7F | Compare accumulator ((zero page,X))
    DEC $FC              ; C6 FC | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_066
; Address: $E3A3EC
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_066:
    JSR $D8DF            ; 20 DF D8 | Jump to subroutine
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_067
; Address: $E3A3F5
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_067:
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    DEC $C0              ; C6 C0 | Decrement (zero page)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_068
; Address: $E3A406
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_068:
    BCS $FF              ; B0 FF | Branch if carry set
    SEC                  ; 38 | Set carry flag
    RTI                  ; 40 | Return from interrupt
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    INY                  ; C8 | Increment Y register
    BVS $FF              ; 70 FF | Branch if overflow set
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    BMI $00              ; 30 00 | Branch if negative
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    INC $E0              ; E6 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    BEQ $D1              ; F0 D1 | Branch if equal
    SBC ($DB),Y          ; F1 DB | Subtract with carry ((zero page),Y)
    LSR $6AFE,X          ; 5E FE 6A | Logical shift right (absolute,X)
    INC $FC28,X          ; FE 28 FC | Increment (absolute,X)
    ASL $1F              ; 06 1F | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL $0400            ; 0E 00 04 | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    JMP $0679            ; 4C 79 06 | Jump to address
    AND $2D16,Y          ; 39 16 2D | Logical AND with accumulator (absolute,Y)
    LDA $8DF6            ; AD F6 8D | Load from absolute address into accumulator
    CMP $CF1C            ; CD 1C CF | Compare accumulator (absolute)
    ASL $CD              ; 06 CD | Arithmetic shift left (zero page)
    ASL $86              ; 06 86 | Arithmetic shift left (zero page)
    ORA $C6              ; 05 C6 | Logical OR with accumulator (zero page)
    REP #$07             ; C2 07 | Reset processor status bits
    WDM #$C3             ; 42 C3 | Reserved instruction
    CMP ($F9,X)          ; C1 F9 | Compare accumulator ((zero page,X))
    CMP #$F9             ; C9 F9 | Compare accumulator (immediate)
    CMP #$03             ; C9 03 | Compare accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    CPX #$0C             ; E0 0C | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    PEA #$FC03           ; F4 03 FC | Push effective address to stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank46_DmaFunction_069
; Address: $E3A522
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_069:
    SBC $C002,X          ; FD 02 C0 | Subtract with carry (absolute,X)
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    BEQ $00              ; F0 00 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$03             ; C0 03 | Compare Y register (immediate)
    INC $FFFE,X          ; FE FE FF | Increment (absolute,X)
    ADC ($FF),Y          ; 71 FF | Add with carry ((zero page),Y)
    AND ($FF),Y          ; 31 FF | Logical AND with accumulator ((zero page),Y)
    BRA $00              ; 80 00 | Branch always
    CPY #$81             ; C0 81 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$60             ; E0 60 | Compare X register (immediate)
    BEQ $60              ; F0 60 | Branch if equal
    SBC ($20),Y          ; F1 20 | Subtract with carry ((zero page),Y)
    SBC ($87),Y          ; F1 87 | Subtract with carry ((zero page),Y)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    STA                  ; 9F FF 00 FF | Store accumulator to absolute long,X
    ADC $F903,Y          ; 79 03 F9 | Add with carry (absolute,Y)
    PLX                  ; FA | Pull X register from stack
    STY $77              ; 84 77 | Store Y register to zero page
    SED                  ; F8 | Set decimal mode flag
    ROL $00C1,X          ; 3E C1 00 | Rotate left (absolute,X)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    BCS $4F              ; B0 4F | Branch if carry set
    BRA $7F              ; 80 7F | Branch always
    SED                  ; F8 | Set decimal mode flag
    SBC $F10F,Y          ; F9 0F F1 | Subtract with carry (absolute,Y)
    ROL $3DFA,X          ; 3E FA 3D | Rotate left (absolute,X)
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    ASL $F6              ; 06 F6 | Arithmetic shift left (zero page)
    ASL $1CFF            ; 0E FF 1C | Arithmetic shift left (absolute)
    ORA ($DE,X)          ; 01 DE | Logical OR with accumulator ((zero page,X))
    INC $FC01,X          ; FE 01 FC | Increment (absolute,X)
    SBC $E13F,Y          ; F9 3F E1 | Subtract with carry (absolute,Y)
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    INC $E01F,X          ; FE 1F E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank46_DmaFunction_06A
; Address: $E3A5FB
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_06A:
    JSL $FD04FF          ; 22 FF 04 FD | Jump to subroutine long
    ASL $CCFC            ; 0E FC CC | Arithmetic shift left (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    ROR $FD              ; 66 FD | Rotate right (zero page)
    CMP $011E,X          ; DD 1E 01 | Compare accumulator (absolute,X)
    ASL $30              ; 06 30 | Arithmetic shift left (zero page)
    STA $6AEF,Y          ; 99 EF 6A | Store accumulator to absolute,Y
    CPX $E00C            ; EC 0C E0 | Game work RAM access
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    BRA $E0              ; 80 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank46_DmaFunction_06B
; Address: $E3A622
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_06B:
    BEQ $00              ; F0 00 | Branch if equal
    STA $05              ; 85 05 | Store accumulator to zero page
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ROR $FFA0,X          ; 7E A0 FF | Rotate right (absolute,X)
    ROR                  ; 6A | Rotate right (accumulator)
    LDA                  ; BF FF EF F7 | Load from absolute long,X into accumulator
    XBA                  ; EB | Exchange accumulator bytes
    REP #$B8             ; C2 B8 | Reset processor status bits
    CLD                  ; D8 | Clear decimal mode flag
    LDX $1FD1            ; AE D1 1F | Load from absolute address into X register
    ROR $3E1F            ; 6E 1F 3E | Rotate right (absolute)
    ASL $9800            ; 0E 00 98 | Arithmetic shift left (absolute)
    BRA $20              ; 80 20 | Branch always

;------------------------------------------------------------------------------
; Bank46_DmaFunction_06C
; Address: $E3A64B
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_06C:
    JSR $B989            ; 20 89 B9 | Jump to subroutine
    STY $FF              ; 84 FF | Store Y register to zero page
    SBC ($7F),Y          ; F1 7F | Subtract with carry ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    BIT $DB              ; 24 DB | Test bits in accumulator (zero page)
    LDA $FF66,Y          ; B9 66 FF | Load from absolute,Y into accumulator
    ROL $DE              ; 26 DE | Rotate left (zero page)
    LSR $CFBE            ; 4E BE CF | Logical shift right (absolute)
    SBC $FD07,Y          ; F9 07 FD | Subtract with carry (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STZ $26              ; 64 26 | Store zero to zero page
    RTI                  ; 40 | Return from interrupt
    ROL $50              ; 26 50 | Rotate left (zero page)
    EOR #$3F             ; 49 3F | Exclusive OR with accumulator (immediate)
    STA $FACABF          ; 8F BF CA FA | Store accumulator to absolute long address
    SBC ($4D),Y          ; F1 4D | Subtract with carry ((zero page),Y)
    SBC $40D9,X          ; FD D9 40 | Subtract with carry (absolute,X)
    CMP $C940,Y          ; D9 40 C9 | Compare accumulator (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ASL $0206            ; 0E 06 02 | Arithmetic shift left (absolute)
    SBC ($07),Y          ; F1 07 | Subtract with carry ((zero page),Y)
    PEA #$FC05           ; F4 05 FC | Push effective address to stack
    SED                  ; F8 | Set decimal mode flag
    ORA $85FC            ; 0D FC 85 | Logical OR with accumulator (absolute)
    ADC $7F87,X          ; 7D 87 7F | Add with carry (absolute,X)
    ASL $0BF7            ; 0E F7 0B | Arithmetic shift left (absolute)
    SBC ($07),Y          ; F1 07 | Subtract with carry ((zero page),Y)
    SBC ($82),Y          ; F1 82 | Subtract with carry ((zero page),Y)
    SBC ($80),Y          ; F1 80 | Subtract with carry ((zero page),Y)
    SBC ($90),Y          ; F1 90 | Subtract with carry ((zero page),Y)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $FF              ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank46_DmaFunction_06D
; Address: $E3A6C4
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_06D:
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    BVS $1F              ; 70 1F | Branch if overflow set
    BCS $0F              ; B0 0F | Branch if carry set
    CPX #$87             ; E0 87 | Compare X register (immediate)
    BVS $37              ; 70 37 | Branch if overflow set
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPX #$7F             ; E0 7F | Compare X register (immediate)
    BEQ $BF              ; F0 BF | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    INY                  ; C8 | Increment Y register
    ASL $F0              ; 06 F0 | Arithmetic shift left (zero page)
    LDX $FF40,Y          ; BE 40 FF | Load from absolute,Y into X register
    BRA $01              ; 80 01 | Branch always
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ASL $00E1,X          ; 1E E1 00 | Arithmetic shift left (absolute,X)
    SBC $FBFF,Y          ; F9 FF FB | Subtract with carry (absolute,Y)
    ASL $00FF            ; 0E FF 00 | Arithmetic shift left (absolute)
    BEQ $F9              ; F0 F9 | Branch if equal
    BEQ $FB              ; F0 FB | Branch if equal
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BEQ $01              ; F0 01 | Branch if equal
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    INC $F800,X          ; FE 00 F8 | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    BRA $8C              ; 80 8C | Branch always
    BRA $7F              ; 80 7F | Branch always
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    INX                  ; E8 | Increment X register
    ASL $1ED0            ; 0E D0 1E | Arithmetic shift left (absolute)
    LDY #$3F             ; A0 3F | Load immediate value into Y register
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ADC $CA3D,X          ; 7D 3D CA | Add with carry (absolute,X)
    AND #$E2             ; 29 E2 | Logical AND with accumulator (immediate)
    BMI $E7              ; 30 E7 | Branch if negative

;------------------------------------------------------------------------------
; Bank46_DmaFunction_06E
; Address: $E3A7B6
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_06E:
    JSR $40CF            ; 20 CF 40 | Jump to subroutine
    STA                  ; 9F 00 BF 00 | Store accumulator to absolute long,X
    LDA                  ; BF 00 BF 42 | Load from absolute long,X into accumulator
    INC $F68A,X          ; FE 8A F6 | Increment (absolute,X)
    STA                  ; 9F F3 DF FB | Store accumulator to absolute long,X
    EOR $1D7F,X          ; 5D 7F 1D | Exclusive OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_06F
; Address: $E3A7CC
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_06F:
    AND $7DBB,X          ; 3D BB 7D | Logical AND with accumulator (absolute,X)
    INC $FE0D,X          ; FE 0D FE | Increment (absolute,X)
    BPL $BF              ; 10 BF | Branch if positive
    CLI                  ; 58 | Clear interrupt disable flag
    STZ $D83F            ; 9C 3F D8 | Store zero to absolute
    SED                  ; F8 | Set decimal mode flag
    STZ $9D12            ; 9C 12 9D | Store zero to absolute
    ASL $19D1            ; 0E D1 19 | Arithmetic shift left (absolute)
    BIT $79              ; 24 79 | Test bits in accumulator (zero page)
    ADC $9E91            ; 6D 91 9E | Add with carry (absolute)
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_070
; Address: $E3A7F1
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_070:
    BRA $20              ; 80 20 | Branch always
    BRA $04              ; 80 04 | Branch always
    CPY #$18             ; C0 18 | Compare Y register (immediate)
    CPY #$1B             ; C0 1B | Compare Y register (immediate)
    INY                  ; C8 | Increment Y register
    BCS $81              ; B0 81 | Branch if carry set
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    CPX #$56             ; E0 56 | Compare X register (immediate)
    SBC $D5FE,X          ; FD FE D5 | Subtract with carry (absolute,X)
    INC $DCCD,X          ; FE CD DC | Increment (absolute,X)
    INC                  ; 1A | Increment accumulator
    ROR $7F3F            ; 6E 3F 7F | Rotate right (absolute)
    PLY                  ; 7A | Pull Y register from stack
    PLY                  ; 7A | Pull Y register from stack
    AND #$D6             ; 29 D6 | Logical AND with accumulator (immediate)
    AND #$D7             ; 29 D7 | Logical AND with accumulator (immediate)
    AND #$DF             ; 29 DF | Logical AND with accumulator (immediate)
    CMP $EF3B,X          ; DD 3B EF | Compare accumulator (absolute,X)
    XBA                  ; EB | Exchange accumulator bytes
    XBA                  ; EB | Exchange accumulator bytes
    EOR $6FFF,X          ; 5D FF 6F | Exclusive OR with accumulator (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank46_DmaFunction_071
; Address: $E3A83D
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_071:
    XBA                  ; EB | Exchange accumulator bytes
    SBC $FC03,Y          ; F9 03 FC | Subtract with carry (absolute,Y)
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    ASL $06F9            ; 0E F9 06 | Arithmetic shift left (absolute)
    ORA $0CF1            ; 0D F1 0C | Logical OR with accumulator (absolute)
    BEQ $5C              ; F0 5C | Branch if equal
    PLX                  ; FA | Pull X register from stack
    ROR $3FD9,X          ; 7E D9 3F | Rotate right (absolute,X)
    BNE $3E              ; D0 3E | Branch if not equal
    CMP ($1F,X)          ; C1 1F | Compare accumulator ((zero page,X))
    SBC ($8E,X)          ; E1 8E | Subtract with carry ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_073
; Address: $E3A884
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_073:
    PLX                  ; FA | Pull X register from stack
    TYA                  ; 98 | Transfer Y register to accumulator
    BEQ $87              ; F0 87 | Branch if equal
    SBC $77CE,X          ; FD CE 77 | Subtract with carry (absolute,X)
    CPY $405F            ; CC 5F 40 | Compare Y register (absolute)
    BCS $40              ; B0 40 | Branch if carry set

;------------------------------------------------------------------------------
; Bank46_DmaFunction_074
; Address: $E3A892
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_074:
    JSL $000000          ; 22 00 00 00 | Jump to subroutine long
    PHP                  ; 08 | Push processor status to stack
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CPY #$CF             ; C0 CF | Compare Y register (immediate)
    CPY #$BF             ; C0 BF | Compare Y register (immediate)
    DEY                  ; 88 | Decrement Y register
    CPX $67              ; E4 67 | Compare X register (zero page)
    CPX $B7              ; E4 B7 | Compare X register (zero page)
    BPL $7F              ; 10 7F | Branch if positive
    TYA                  ; 98 | Transfer Y register to accumulator
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    BVS $3F              ; 70 3F | Branch if overflow set
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    JMP ($E027)          ; 6C 27 E0 | Game work RAM access
    ROR $43              ; 66 43 | Rotate right (zero page)
    BRA $7F              ; 80 7F | Branch always
    BEQ $0F              ; F0 0F | Branch if equal
    SBC $F802,X          ; FD 02 F8 | Subtract with carry (absolute,X)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SBC $0FF0,X          ; FD F0 0F | Subtract with carry (absolute,X)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    BRA $7F              ; 80 7F | Branch always
    INC $FC03,X          ; FE 03 FC | Increment (absolute,X)
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    ORA ($F8,X)          ; 01 F8 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ORA #$58             ; 09 58 | Logical OR with accumulator (immediate)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    SBC $FA06,Y          ; F9 06 FA | Subtract with carry (absolute,Y)
    ASL $F0              ; 06 F0 | Arithmetic shift left (zero page)
    CPX $0F              ; E4 0F | Compare X register (zero page)
    BEQ $23              ; F0 23 | Branch if equal
    PHA                  ; 48 | Push accumulator to stack
    ROR $5C74            ; 6E 74 5C | Rotate right (absolute)
    LDY $D9              ; A4 D9 | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank46_DmaFunction_075
; Address: $E3A94D
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_075:
    AND ($FB,X)          ; 21 FB | Logical AND with accumulator ((zero page,X))
    BEQ $07              ; F0 07 | Branch if equal
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $58              ; 80 58 | Branch always
    LDX $9FBF,Y          ; BE BF 9F | Load from absolute,Y into X register
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BRA $BF              ; 80 BF | Branch always
    JMP $3E3CF3          ; 5C F3 3C 3E | Jump to address long
    AND $427D,X          ; 3D 7D 42 | Hardware register operation
    ADC $5B02,X          ; 7D 02 5B | Add with carry (absolute,X)
    RTI                  ; 40 | Return from interrupt
    BRA $FC              ; 80 FC | Branch always
    STX $CA44            ; 8E 44 CA | Store X register to absolute address
    DEX                  ; CA | Decrement X register
    STZ $EA              ; 64 EA | Store zero to zero page
    CPY $C8              ; C4 C8 | Compare Y register (zero page)
    LDA                  ; BF 80 3F 80 | Load from absolute long,X into accumulator
    BRA $7F              ; 80 7F | Branch always
    CPY #$3B             ; C0 3B | Compare Y register (immediate)
    BRA $7B              ; 80 7B | Branch always
    LDY #$5B             ; A0 5B | Load immediate value into Y register
    CPY #$BB             ; C0 BB | Compare Y register (immediate)
    ROL $3EBE,X          ; 3E BE 3E | Rotate left (absolute,X)
    ROL $7E              ; 26 7E | Rotate left (zero page)
    ASL $5C22,X          ; 1E 22 5C | Arithmetic shift left (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_076
; Address: $E3A9AA
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_076:
    PHX                  ; DA | Push X register to stack
    INC $DA              ; E6 DA | Increment (zero page)
    INC $98              ; E6 98 | Increment (zero page)
    CPX $3C              ; E4 3C | Compare X register (zero page)
    ROL $5EC5,X          ; 3E C5 5E | Rotate left (absolute,X)
    LDA ($3E,X)          ; A1 3E | Load from (zero page,X) into accumulator
    SBC ($7C,X)          ; E1 7C | Subtract with carry ((zero page,X))
    LDX $BE65,Y          ; BE 65 BE | Load from absolute,Y into X register
    ADC $FC              ; 65 FC | Add with carry (zero page)
    CLI                  ; 58 | Clear interrupt disable flag
    ROL $2C51            ; 2E 51 2C | Rotate left (absolute)
    ADC $7E82,X          ; 7D 82 7E | Add with carry (absolute,X)
    STA $8566,Y          ; 99 66 85 | Store accumulator to absolute,Y
    ROR $71A0,X          ; 7E A0 71 | Rotate right (absolute,X)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    STA ($18,X)          ; 81 18 | Store accumulator to (zero page,X)
    STA ($1C,X)          ; 81 1C | Store accumulator to (zero page,X)
    STA $B23D,X          ; 9D 3D B2 | Store accumulator to absolute,X
    STZ $1CFB            ; 9C FB 1C | Store zero to absolute

;------------------------------------------------------------------------------
; Bank46_DmaFunction_077
; Address: $E3A9E6
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_077:
    LDX $BCD9,Y          ; BE D9 BC | Load from absolute,Y into X register
    LDY $BEDB,X          ; BC DB BE | Load from absolute,X into Y register
    CMP $FDBE,Y          ; D9 BE FD | Compare accumulator (absolute,Y)
    LDA                  ; BF 7F BA FF | Load from absolute long,X into accumulator
    EOR $DF7F,Y          ; 59 7F DF | Exclusive OR with accumulator (absolute,Y)
    CMP $FD7F,Y          ; D9 7F FD | Compare accumulator (absolute,Y)
    LDA                  ; BF 7F BF 7F | Load from absolute long,X into accumulator
    LDA                  ; BF 7F BF 7F | Load from absolute long,X into accumulator
    LDA                  ; BF FF BF FF | Load from absolute long,X into accumulator
    LDA                  ; BF FF BF FF | Load from absolute long,X into accumulator
    BEQ $03              ; F0 03 | Branch if equal
    CPY $A7              ; C4 A7 | Compare Y register (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register
    PHP                  ; 08 | Push processor status to stack
    CPY #$27             ; C0 27 | Compare Y register (immediate)
    CPY #$27             ; C0 27 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$3C             ; C0 3C | Compare Y register (immediate)
    LDY #$58             ; A0 58 | Load immediate value into Y register
    CLV                  ; B8 | Clear overflow flag
    LDX $FE70,Y          ; BE 70 FE | Load from absolute,Y into X register
    AND $1CDF,Y          ; 39 DF 1C | Logical AND with accumulator (absolute,Y)
    CMP $C20C            ; CD 0C C2 | Compare accumulator (absolute)
    ROL $1EEA,X          ; 3E EA 1E | Rotate left (absolute,X)
    SBC $12              ; E5 12 | Subtract with carry (zero page)
    INC $17              ; E6 17 | Increment (zero page)
    AND ($40),Y          ; 31 40 | Logical AND with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank46_DmaFunction_078
; Address: $E3AA53
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_078:
    JSR $2814            ; 20 14 28 | Jump to subroutine
    ROL $310E,X          ; 3E 0E 31 | Rotate left (absolute,X)
    ASL $18              ; 06 18 | Arithmetic shift left (zero page)
    ASL $19              ; 06 19 | Arithmetic shift left (zero page)
    LSR $3F41,X          ; 5E 41 3F | Logical shift right (absolute,X)
    BVS $8F              ; 70 8F | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_079
; Address: $E3AA69
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_079:
    TSX                  ; BA | Transfer stack pointer to X register
    TSX                  ; BA | Transfer stack pointer to X register
    ADC $DE              ; 65 DE | Add with carry (zero page)
    CMP ($0E),Y          ; D1 0E | Compare accumulator ((zero page),Y)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BRA $00              ; 80 00 | Branch always
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank46_DmaFunction_07A
; Address: $E3AA7C
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_07A:
    JSR $3020            ; 20 20 30 | Jump to subroutine
    BPL $1F              ; 10 1F | Branch if positive
    LDY $F849,X          ; BC 49 F8 | Load from absolute,X into Y register
    AND ($E0,X)          ; 21 E0 | Game work RAM access
    LSR $9FE5,X          ; 5E E5 9F | Logical shift right (absolute,X)
    CMP #$38             ; C9 38 | Compare accumulator (immediate)
    STX $7E              ; 86 7E | Store X register to zero page
    WDM #$03             ; 42 03 | Reserved instruction

;------------------------------------------------------------------------------
; Bank46_DmaFunction_07B
; Address: $E3AA92
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_07B:
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ASL $1A01,X          ; 1E 01 1A | Arithmetic shift left (absolute,X)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $7F              ; 80 7F | Branch always
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    STA                  ; 9F 07 51 08 | Store accumulator to absolute long,X
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_07C
; Address: $E3AAAF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_07C:
    LSR $FF00,X          ; 5E 00 FF | Logical shift right (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    STA                  ; 9F F7 51 A1 | Store accumulator to absolute long,X

;------------------------------------------------------------------------------
; Bank46_DmaFunction_07D
; Address: $E3AABF
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_07D:
    JSR $F708            ; 20 08 F7 | Jump to subroutine
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BRA $5F              ; 80 5F | Branch always
    BRA $6F              ; 80 6F | Branch always
    BPL $EF              ; 10 EF | Branch if positive
    DEY                  ; 88 | Decrement Y register
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank46_DmaFunction_07E
; Address: $E3AAD6
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_07E:
    JSR $10DF            ; 20 DF 10 | Jump to subroutine
    BPL $9F              ; 10 9F | Branch if positive
    TYA                  ; 98 | Transfer Y register to accumulator
    STA $004FC0          ; 8F C0 4F 00 | Store accumulator to absolute long address
    SED                  ; F8 | Set decimal mode flag
    ORA $03E1            ; 0D E1 03 | Logical OR with accumulator (absolute)
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    PEA #$003F           ; F4 3F 00 | Push effective address to stack
    INC $BD80,X          ; FE 80 BD | Increment (absolute,X)
    CPY #$CB             ; C0 CB | Compare Y register (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    INC                  ; 1A | Increment accumulator
    AND $9D26,X          ; 3D 26 9D | Logical AND with accumulator (absolute,X)
    STX $A0              ; 86 A0 | Store X register to zero page
    LDX #$AD             ; A2 AD | Load immediate value into X register
    JMP ($6966)          ; 6C 66 69 | Jump to address (absolute indirect)
    BEQ $04              ; F0 04 | Branch if equal
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_080
; Address: $E3AB3A
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_080:
    JSR $6058            ; 20 58 60 | Jump to subroutine
    TYA                  ; 98 | Transfer Y register to accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_081
; Address: $E3AB3F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_081:
    STA $4339,Y          ; 99 39 43 | Store accumulator to absolute,Y
    EOR $FBA7,X          ; 5D A7 FB | Exclusive OR with accumulator (absolute,X)
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    ORA $B1              ; 05 B1 | Logical OR with accumulator (zero page)
    LSR $F7              ; 46 F7 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_082
; Address: $E3AB4F
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_082:
    PHP                  ; 08 | Push processor status to stack
    STY $00              ; 84 00 | Store Y register to zero page
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    DEC $6D              ; C6 6D | Decrement (zero page)
    LDY $4F              ; A4 4F | Load from zero page into Y register
    CPX $C903            ; EC 03 C9 | Compare X register (absolute)
    CMP #$07             ; C9 07 | Compare accumulator (immediate)
    ASL $1B47,X          ; 1E 47 1B | Arithmetic shift left (absolute,X)
    ORA $1E0F,X          ; 1D 0F 1E | Logical OR with accumulator (absolute,X)
    BPL $0F              ; 10 0F | Branch if positive
    BMI $0D              ; 30 0D | Branch if negative
    PLY                  ; 7A | Pull Y register from stack
    ASL $1969,X          ; 1E 69 19 | Arithmetic shift left (absolute,X)
    LDA $B8              ; A5 B8 | Load from zero page into accumulator
    STY $B8              ; 84 B8 | Store Y register to zero page
    STX $30              ; 86 30 | Store X register to zero page
    STA $00BF00          ; 8F 00 BF 00 | Store accumulator to absolute long address
    SEI                  ; 78 | Set interrupt disable flag
    ADC $1C60,Y          ; 79 60 1C | Add with carry (absolute,Y)
    STA ($66,X)          ; 81 66 | Store accumulator to (zero page,X)
    BRA $47              ; 80 47 | Branch always
    BRA $4F              ; 80 4F | Branch always
    BRA $7F              ; 80 7F | Branch always
    STA                  ; 9F 80 FD C5 | Store accumulator to absolute long,X
    ADC $7D44,X          ; 7D 44 7D | Add with carry (absolute,X)
    ADC $BC04,X          ; 7D 04 BC | Add with carry (absolute,X)
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    SED                  ; F8 | Set decimal mode flag
    ROL $BB7C,X          ; 3E 7C BB | Rotate left (absolute,X)
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    BEQ $06              ; F0 06 | Branch if equal
    CPY #$17             ; C0 17 | Compare Y register (immediate)
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    CPY #$37             ; C0 37 | Compare Y register (immediate)
    EOR ($B7,X)          ; 41 B7 | Exclusive OR with accumulator ((zero page,X))
    AND $DB              ; 25 DB | Logical AND with accumulator (zero page)
    ADC $7583,X          ; 7D 83 75 | Add with carry (absolute,X)
    STA $003B30          ; 8F 30 3B 00 | Store accumulator to absolute long address
    ORA ($9E,X)          ; 01 9E | Logical OR with accumulator ((zero page,X))
    ORA ($DA,X)          ; 01 DA | Logical OR with accumulator ((zero page,X))
    ORA ($82,X)          ; 01 82 | Logical OR with accumulator ((zero page,X))
    PHB                  ; 8B | Push data bank register to stack
    LDA $3DFE,X          ; BD FE 3D | Load from absolute,X into accumulator
    PLX                  ; FA | Pull X register from stack
    ADC $7EBA,X          ; 7D BA 7E | Add with carry (absolute,X)
    LDA $B97E,Y          ; B9 7E B9 | Load from absolute,Y into accumulator

;------------------------------------------------------------------------------
; Bank46_DmaFunction_083
; Address: $E3ABEB
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_083:
    SED                  ; F8 | Set decimal mode flag
    ADC $7FFA,X          ; 7D FA 7F | Add with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    INC $7AFF,X          ; FE FF 7A | Increment (absolute,X)
    DEC                  ; 3A | Decrement accumulator
    AND $B9FF,Y          ; 39 FF B9 | Logical AND with accumulator (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    PLX                  ; FA | Pull X register from stack
    SED                  ; F8 | Set decimal mode flag
    CPX $10              ; E4 10 | Compare X register (zero page)
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    WDM #$55             ; 42 55 | Reserved instruction
    CPY #$DB             ; C0 DB | Compare Y register (immediate)
    BPL $EF              ; 10 EF | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 00 FD 00 | Load from absolute long,X into accumulator
    SBC $BD40,X          ; FD 40 BD | Subtract with carry (absolute,X)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    DEC $27              ; C6 27 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_084
; Address: $E3AC42
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_084:
    JSL $4F42AF          ; 22 AF 42 4F | Jump to subroutine long
    WDM #$5F             ; 42 5F | Reserved instruction
    ROL $2F13            ; 2E 13 2F | Rotate left (absolute)
    ASL $39              ; 06 39 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_085
; Address: $E3AC52
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_085:
    JSR $42DF            ; 20 DF 42 | Hardware register operation
    LDA $BD42,X          ; BD 42 BD | Load from absolute,X into accumulator
    WDM #$AD             ; 42 AD | Reserved instruction
    SBC $EC03            ; ED 03 EC | Subtract with carry (absolute)
    CPX $0CC3            ; EC C3 0C | Compare X register (absolute)
    BIT $1CEF            ; 2C EF 1C | Test bits in accumulator (absolute)
    STY $8C73            ; 8C 73 8C | Store Y register to absolute address
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    BRA $30              ; 80 30 | Branch always
    BPL $00              ; 10 00 | Branch if positive
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $91              ; 80 91 | Branch always
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    STA $B363,Y          ; 99 63 B3 | Store accumulator to absolute,Y
    EOR #$E0             ; 49 E0 | Game work RAM access
    ORA $1DE4,X          ; 1D E4 1D | Logical OR with accumulator (absolute,X)
    INC $1F              ; E6 1F | Increment (zero page)
    STA $000020          ; 8F 20 00 00 | Store accumulator to absolute long address
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    BPL $00              ; 10 00 | Branch if positive
    CMP $8EF3            ; CD F3 8E | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_086
; Address: $E3ACA3
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_086:
    STA ($9F),Y          ; 91 9F | Store accumulator to (zero page),Y
    LDY #$9F             ; A0 9F | Load immediate value into Y register
    LDY #$DD             ; A0 DD | Load immediate value into Y register
    BRA $A3              ; 80 A3 | Branch always
    INC $DF              ; E6 DF | Increment (zero page)
    LSR $00C1,X          ; 5E C1 00 | Logical shift right (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_087
; Address: $E3ACB4
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_087:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    EOR ($44,X)          ; 41 44 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank46_DmaFunction_089
; Address: $E3ACBE
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_089:
    JSR $7C00            ; 20 00 7C | Jump to subroutine
    ASL $B1              ; 06 B1 | Arithmetic shift left (zero page)
    LDY $6D95            ; AC 95 6D | Load from absolute address into Y register
    CLV                  ; B8 | Clear overflow flag
    EOR $FA              ; 45 FA | Exclusive OR with accumulator (zero page)
    ADC $CCC2,X          ; 7D C2 CC | Add with carry (absolute,X)
    CPX $4C1F            ; EC 1F 4C | Compare X register (absolute)
    ORA $40              ; 05 40 | Logical OR with accumulator (zero page)
    ORA ($82,X)          ; 01 82 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    BPL $F0              ; 10 F0 | Branch if positive
    ASL $D7              ; 06 D7 | Arithmetic shift left (zero page)
    ROL $F7              ; 26 F7 | Rotate left (zero page)
    ORA $2C00            ; 0D 00 2C | Logical OR with accumulator (absolute)
    BRA $28              ; 80 28 | Branch always
    BRA $C8              ; 80 C8 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PEA #$FD06           ; F4 06 FD | Push effective address to stack
    AND ($F8,X)          ; 21 F8 | Logical AND with accumulator ((zero page,X))
    EOR $DB              ; 45 DB | Exclusive OR with accumulator (zero page)
    STA $B965,Y          ; 99 65 B9 | Store accumulator to absolute,Y
    ORA $F8              ; 05 F8 | Logical OR with accumulator (zero page)
    SBC ($E2,X)          ; E1 E2 | Subtract with carry ((zero page,X))
    CMP ($C2,X)          ; C1 C2 | Compare accumulator ((zero page,X))
    STA ($86,X)          ; 81 86 | Store accumulator to (zero page,X)
    AND $03              ; 25 03 | Logical AND with accumulator (zero page)
    STZ $00              ; 64 00 | Store zero to zero page
    BCC $EE              ; 90 EE | Branch if carry clear
    INY                  ; C8 | Increment Y register
    PLB                  ; AB | Pull data bank register from stack
    STZ $3CE1            ; 9C E1 3C | Store zero to absolute
    PLY                  ; 7A | Pull Y register from stack
    STA $F0              ; 85 F0 | Store accumulator to zero page
    BEQ $0D              ; F0 0D | Branch if equal

;------------------------------------------------------------------------------
; Bank46_DmaFunction_08A
; Address: $E3AD30
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_08A:
    CPY #$2B             ; C0 2B | Compare Y register (immediate)
    CPY #$03             ; C0 03 | Compare Y register (immediate)
    ADC ($80,X)          ; 61 80 | Add with carry ((zero page,X))
    STA $00              ; 85 00 | Store accumulator to zero page
    ADC $6C82,X          ; 7D 82 6C | Add with carry (absolute,X)
    DEC $EE31            ; CE 31 EE | Decrement (absolute)
    ORA ($9F),Y          ; 11 9F | Logical OR with accumulator ((zero page),Y)
    STZ $9F              ; 64 9F | Store zero to zero page

;------------------------------------------------------------------------------
; Bank46_DmaFunction_08B
; Address: $E3AD4B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_08B:
    JSR $609B            ; 20 9B 60 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    BCC $00              ; 90 00 | Branch if carry clear
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_08C
; Address: $E3AD5B
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_08C:
    STZ $0C              ; 64 0C | Store zero to zero page
    PLA                  ; 68 | Pull accumulator from stack
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    STY $4E              ; 84 4E | Store Y register to zero page
    STA                  ; 9F 5E D5 1C | Store accumulator to absolute long,X
    EOR $9E              ; 45 9E | Exclusive OR with accumulator (zero page)
    STZ $DD14            ; 9C 14 DD | Store zero to absolute
    DEC $710E,X          ; DE 0E 71 | Decrement (absolute,X)
    PLA                  ; 68 | Pull accumulator from stack
    CLC                  ; 18 | Clear carry flag
    ROL $18              ; 26 18 | Rotate left (zero page)
    LDX $08              ; A6 08 | Load from zero page into X register
    ROR $621C,X          ; 7E 1C 62 | Rotate right (absolute,X)
    ASL $EC21,X          ; 1E 21 EC | Arithmetic shift left (absolute,X)
    INC $FC01,X          ; FE 01 FC | Increment (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA #$B8             ; 09 B8 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    LDA $3A09,Y          ; B9 09 3A | Load from absolute,Y into accumulator
    EOR #$3A             ; 49 3A | Exclusive OR with accumulator (immediate)
    EOR #$7A             ; 49 7A | Exclusive OR with accumulator (immediate)
    EOR $7E              ; 45 7E | Exclusive OR with accumulator (zero page)
    EOR $3C              ; 45 3C | Exclusive OR with accumulator (zero page)
    ORA $30BC            ; 0D BC 30 | Logical OR with accumulator (absolute)
    BMI $DF              ; 30 DF | Branch if negative
    SEC                  ; 38 | Set carry flag
    DEC $38              ; C6 38 | Decrement (zero page)
    INC $78              ; E6 78 | Increment (zero page)
    REP #$6F             ; C2 6F | Reset processor status bits
    STA                  ; 9F F2 0F C6 | Store accumulator to absolute long,X
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_08D
; Address: $E3ADE1
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_08D:
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    SEC                  ; 38 | Set carry flag
    PLY                  ; 7A | Pull Y register from stack
    PLY                  ; 7A | Pull Y register from stack
    CMP $78FF,Y          ; D9 FF 78 | Compare accumulator (absolute,Y)
    SEI                  ; 78 | Set interrupt disable flag
    SEC                  ; 38 | Set carry flag
    PLY                  ; 7A | Pull Y register from stack
    PLY                  ; 7A | Pull Y register from stack
    CMP $7FFF,Y          ; D9 FF 7F | Compare accumulator (absolute,Y)
    CPY #$DB             ; C0 DB | Compare Y register (immediate)
    CPX #$EB             ; E0 EB | Compare X register (immediate)
    LDA ($FA),Y          ; B1 FA | Load from (zero page),Y into accumulator
    LDA ($FE),Y          ; B1 FE | Load from (zero page),Y into accumulator
    EOR ($6E,X)          ; 41 6E | Exclusive OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_090
; Address: $E3AE32
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_090:
    JSR $50DF            ; 20 DF 50 | Jump to subroutine
    LDX $2ED0            ; AE D0 2E | Load from absolute address into X register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_092
; Address: $E3AE3D
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_092:
    STA                  ; 9F 60 9F 1B | Store accumulator to absolute long,X
    INC                  ; 1A | Increment accumulator
    ORA $5BC3,X          ; 1D C3 5B | Logical OR with accumulator (absolute,X)
    SBC $03              ; E5 03 | Subtract with carry (zero page)
    CPX $02              ; E4 02 | Compare X register (zero page)
    ADC $6403            ; 6D 03 64 | Add with carry (absolute)
    STZ $01              ; 64 01 | Store zero to zero page
    SEP #$03             ; E2 03 | Set processor status bits
    LDY $03              ; A4 03 | Load from zero page into Y register
    STZ $FF              ; 64 FF | Store zero to zero page
    BRA $BF              ; 80 BF | Branch always
    CPY #$BF             ; C0 BF | Compare Y register (immediate)
    CPY #$BF             ; C0 BF | Compare Y register (immediate)
    CPY #$BF             ; C0 BF | Compare Y register (immediate)
    CPY #$BE             ; C0 BE | Compare Y register (immediate)
    CMP ($BF,X)          ; C1 BF | Compare accumulator ((zero page,X))
    CPY #$BF             ; C0 BF | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always

;------------------------------------------------------------------------------
; Bank46_DmaFunction_093
; Address: $E3AE81
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_093:
    LDA                  ; BF 61 9F 86 | Load from absolute long,X into accumulator
    STA $38C778          ; 8F 78 C7 38 | Store accumulator to absolute long address
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank46_DmaFunction_094
; Address: $E3AE94
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_094:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    LDX $9EE1,Y          ; BE E1 9E | Load from absolute,Y into X register
    ADC ($DF,X)          ; 61 DF | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank46_DmaFunction_095
; Address: $E3AEA5
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_095:
    JSR $04FB            ; 20 FB 04 | Jump to subroutine
    REP #$37             ; C2 37 | Reset processor status bits
    INY                  ; C8 | Increment Y register
    BRA $BF              ; 80 BF | Branch always
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 40 BE 41 | Load from absolute long,X into accumulator
    LDA $0842,X          ; BD 42 08 | Load from absolute,X into accumulator
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SBC $F10E,Y          ; F9 0E F1 | Subtract with carry (absolute,Y)
    ASL $1AF5            ; 0E F5 1A | Arithmetic shift left (absolute)
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank46_DmaFunction_096
; Address: $E3AEE9
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_096:
    JSR $20DF            ; 20 DF 20 | Jump to subroutine
    LDA                  ; BF 40 00 00 | Load from absolute long,X into accumulator
    LDA $B847,Y          ; B9 47 B8 | Load from absolute,Y into accumulator
    DEC                  ; 3A | Decrement accumulator
    DEC                  ; 3A | Decrement accumulator
    TSX                  ; BA | Transfer stack pointer to X register
    TSX                  ; BA | Transfer stack pointer to X register
    LSR $F8              ; 46 F8 | Logical shift right (zero page)
    ORA $F8              ; 05 F8 | Logical OR with accumulator (zero page)
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    CMP $02              ; C5 02 | Compare accumulator (zero page)
    CMP $02              ; C5 02 | Compare accumulator (zero page)
    EOR $02              ; 45 02 | Exclusive OR with accumulator (zero page)
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    INC $7C03,X          ; FE 03 7C | Increment (absolute,X)
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    STA ($7C,X)          ; 81 7C | Store accumulator to (zero page,X)
    STA ($7B,X)          ; 81 7B | Store accumulator to (zero page,X)
    STY $F9              ; 84 F9 | Store Y register to zero page
    ASL $FB              ; 06 FB | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STX $00              ; 86 00 | Store X register to zero page
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BIT $DF              ; 24 DF | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_097
; Address: $E3AF4B
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_097:
    JSR $02FD            ; 20 FD 02 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_098
; Address: $E3AF62
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_098:
    TXS                  ; 9A | Transfer X register to stack pointer
    DEX                  ; CA | Decrement X register
    TAY                  ; A8 | Transfer accumulator to Y register
    ADC $35D0,X          ; 7D D0 35 | Add with carry (absolute,X)
    BCC $7D              ; 90 7D | Branch if carry clear
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC                  ; 1A | Increment accumulator
    AND $12              ; 25 12 | Logical AND with accumulator (zero page)
    ADC $4738            ; 6D 38 47 | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_099
; Address: $E3AF7A
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_099:
    JSR $301F            ; 20 1F 30 | Jump to subroutine
    CMP $FF              ; C5 FF | Compare accumulator (zero page)
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    EOR $FC              ; 45 FC | Exclusive OR with accumulator (zero page)
    EOR ($FA),Y          ; 51 FA | Exclusive OR with accumulator ((zero page),Y)
    CLI                  ; 58 | Clear interrupt disable flag
    PLX                  ; FA | Pull X register from stack
    CLI                  ; 58 | Clear interrupt disable flag
    ROR $3F49,X          ; 7E 49 3F | Rotate right (absolute,X)
    BIT #$7B             ; 89 7B | Test bits in accumulator (immediate)
    PLA                  ; 68 | Pull accumulator from stack
    SEI                  ; 78 | Set interrupt disable flag
    PLA                  ; 68 | Pull accumulator from stack
    SEC                  ; 38 | Set carry flag
    SBC $543B            ; ED 3B 54 | Subtract with carry (absolute)
    AND $FA56,Y          ; 39 56 FA | Logical AND with accumulator (absolute,Y)
    ADC ($0E),Y          ; 71 0E | Add with carry ((zero page),Y)
    SBC ($8A),Y          ; F1 8A | Subtract with carry ((zero page),Y)
    STZ $DEE3,X          ; 9E E3 DE | Store zero to absolute,X
    INC $D2D1            ; EE D1 D2 | Increment (absolute)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    STY $0C83            ; 8C 83 0C | Store Y register to absolute address
    STA ($5E,X)          ; 81 5E | Store accumulator to (zero page,X)
    CMP ($1E,X)          ; C1 1E | Compare accumulator ((zero page,X))
    EOR ($BE,X)          ; 41 BE | Exclusive OR with accumulator ((zero page,X))
    JMP ($58FF)          ; 6C FF 58 | Jump to address (absolute indirect)
    JMP $FFDCFF          ; 5C FF DC FF | Jump to address long
    INC $FF              ; E6 FF | Increment (zero page)
    CLI                  ; 58 | Clear interrupt disable flag
    JMP $FFDCFF          ; 5C FF DC FF | Jump to address long
    INC $FF              ; E6 FF | Increment (zero page)
    LDA                  ; BF FF EF FF | Load from absolute long,X into accumulator
    LDA                  ; BF FF EF FF | Load from absolute long,X into accumulator
    ADC ($6E,X)          ; 61 6E | Add with carry ((zero page,X))
    BIT $6C63            ; 2C 63 6C | Test bits in accumulator (absolute)
    STZ $63              ; 64 63 | Store zero to zero page
    STZ $23              ; 64 23 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank46_DmaFunction_09A
; Address: $E3B02B
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_09A:
    LDY $27              ; A4 27 | Load from zero page into Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_09F
; Address: $E3B03C
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_09F:
    JSR $60D8            ; 20 D8 60 | Jump to subroutine
    TYA                  ; 98 | Transfer Y register to accumulator
    LDA $BD25,Y          ; B9 25 BD | Load from absolute,Y into accumulator
    ADC ($B9,X)          ; 61 B9 | Add with carry ((zero page,X))
    ADC $F9              ; 65 F9 | Add with carry (zero page)
    AND $9C              ; 25 9C | Logical AND with accumulator (zero page)
    ADC ($B8,X)          ; 61 B8 | Add with carry ((zero page,X))
    ADC $EB              ; 65 EB | Add with carry (zero page)
    STZ $21              ; 64 21 | PPU graphics register access
    LSR $21              ; 46 21 | PPU graphics register access
    WDM #$20             ; 42 20 | Reserved instruction
    AND ($06,X)          ; 21 06 | Logical AND with accumulator ((zero page,X))
    ORA ($62,X)          ; 01 62 | Logical OR with accumulator ((zero page,X))
    AND ($46,X)          ; 21 46 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0A1
; Address: $E3B065
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0A1:
    JSR $B08F            ; 20 8F B0 | Jump to subroutine
    STA $D0AFB0          ; 8F B0 AF D0 | Store accumulator to absolute long address
    LDA $B08FD0          ; AF D0 8F B0 | Load from absolute long address into accumulator
    BRA $40              ; 80 40 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$80             ; E0 80 | Compare X register (immediate)
    BVS $80              ; 70 80 | Branch if overflow set
    BVS $80              ; 70 80 | Branch if overflow set
    BVC $80              ; 50 80 | Branch if overflow clear
    BVC $80              ; 50 80 | Branch if overflow clear
    BVS $FF              ; 70 FF | Branch if overflow set

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0A3
; Address: $E3B087
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0A3:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    SBC $FD02,X          ; FD 02 FD | Subtract with carry (absolute,X)
    SBC $FF02,X          ; FD 02 FF | Subtract with carry (absolute,X)
    SBC $FF02,X          ; FD 02 FF | Subtract with carry (absolute,X)
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PLX                  ; FA | Pull X register from stack
    SED                  ; F8 | Set decimal mode flag
    ORA $F0              ; 05 F0 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0A4
; Address: $E3B0E5
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0A4:
    PHP                  ; 08 | Push processor status to stack
    SEI                  ; 78 | Set interrupt disable flag
    STY $F2              ; 84 F2 | Store Y register to zero page
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BEQ $09              ; F0 09 | Branch if equal
    BEQ $0D              ; F0 0D | Branch if equal
    CMP ($38,X)          ; C1 38 | Compare accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $0F00            ; 0D 00 0F | Logical OR with accumulator (absolute)
    ROL $04FB,X          ; 3E FB 04 | Rotate left (absolute,X)
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $FF              ; 80 FF | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BEQ $0F              ; F0 0F | Branch if equal
    CPY #$3B             ; C0 3B | Compare Y register (immediate)
    BRA $70              ; 80 70 | Branch always
    BRA $4F              ; 80 4F | Branch always
    STA                  ; 9F 0E 99 9B | Store accumulator to absolute long,X
    CLI                  ; 58 | Clear interrupt disable flag
    ADC ($1B),Y          ; 71 1B | Add with carry ((zero page),Y)
    INX                  ; E8 | Increment X register
    PHP                  ; 08 | Push processor status to stack
    JMP $2171            ; 4C 71 21 | PPU graphics register access
    ROR $FE91            ; 6E 91 FE | Rotate right (absolute)
    BVC $BD              ; 50 BD | Branch if overflow clear
    CPX #$2D             ; E0 2D | Compare X register (immediate)
    REP #$CD             ; C2 CD | Reset processor status bits
    BIT $60              ; 24 60 | Test bits in accumulator (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0A5
; Address: $E3B153
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0A5:
    STZ $4EF0,X          ; 9E F0 4E | Store zero to absolute,X
    BEQ $0F              ; F0 0F | Branch if equal
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPY #$BF             ; C0 BF | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDA $5C20,X          ; BD 20 5C | Load from absolute,X into accumulator
    BRA $FF              ; 80 FF | Branch always
    SBC $0006,Y          ; F9 06 00 | Subtract with carry (absolute,Y)
    BRA $00              ; 80 00 | Branch always
    ASL $A0              ; 06 A0 | Arithmetic shift left (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register
    BIT $39FB            ; 2C FB 39 | Test bits in accumulator (absolute)
    INC $BE39,X          ; FE 39 BE | Increment (absolute,X)
    AND $B9BE,Y          ; 39 BE B9 | Logical AND with accumulator (absolute,Y)
    ROL $5E89,X          ; 3E 89 5E | Rotate left (absolute,X)
    SEC                  ; 38 | Set carry flag
    BPL $6F              ; 10 6F | Branch if positive
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0A6
; Address: $E3B196
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0A6:
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    INC $38              ; E6 38 | Increment (zero page)
    DEC $28              ; C6 28 | Decrement (zero page)
    CLC                  ; 18 | Clear carry flag
    ROR $DD              ; 66 DD | Rotate right (zero page)
    INC $665D,X          ; FE 5D 66 | Increment (absolute,X)
    ORA ($9E,X)          ; 01 9E | Logical OR with accumulator ((zero page,X))
    PHX                  ; DA | Push X register to stack
    STA $56              ; 85 56 | Store accumulator to zero page
    ORA $D6              ; 05 D6 | Logical OR with accumulator (zero page)
    ROL $47              ; 26 47 | Rotate left (zero page)
    LDY #$01             ; A0 01 | Load immediate value into Y register
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    STY $FF              ; 84 FF | Store Y register to zero page
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0A8
; Address: $E3B1CF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0A8:
    JSR $56FF            ; 20 FF 56 | Jump to subroutine
    STY $FF              ; 84 FF | Store Y register to zero page
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0AC
; Address: $E3B201
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0AC:
    JSR $C847            ; 20 47 C8 | Jump to subroutine
    INX                  ; E8 | Increment X register
    INY                  ; C8 | Increment Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    INX                  ; E8 | Increment X register
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0AD
; Address: $E3B210
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0AD:
    JSR $40D8            ; 20 D8 40 | Jump to subroutine
    CLV                  ; B8 | Clear overflow flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0AE
; Address: $E3B215
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0AE:
    TYA                  ; 98 | Transfer Y register to accumulator
    RTI                  ; 40 | Return from interrupt
    CLV                  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0AF
; Address: $E3B218
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0AF:
    JSR $20D8            ; 20 D8 20 | Jump to subroutine
    CLD                  ; D8 | Clear decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0B0
; Address: $E3B21D
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0B0:
    TYA                  ; 98 | Transfer Y register to accumulator
    SED                  ; F8 | Set decimal mode flag
    PLB                  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0B1
; Address: $E3B224
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0B1:
    LDX $67              ; A6 67 | Load from zero page into X register
    EOR $3EE7,Y          ; 59 E7 3E | Exclusive OR with accumulator (absolute,Y)
    ADC $7F01,X          ; 7D 01 7F | Add with carry (absolute,X)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    JMP $605827          ; 5C 27 58 60 | Jump to address long
    LSR $A1              ; 46 A1 | Logical shift right (zero page)
    CPY #$01             ; C0 01 | Compare Y register (immediate)
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))
    STA $908F90          ; 8F 90 8F 90 | Store accumulator to absolute long address
    STA ($8C,X)          ; 81 8C | Store accumulator to (zero page,X)
    CPY #$CF             ; C0 CF | Compare Y register (immediate)
    CPY #$C3             ; C0 C3 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0B2
; Address: $E3B24C
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0B2:
    JSR $60E3            ; 20 E3 60 | Jump to subroutine
    BRA $70              ; 80 70 | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    INC $3FC0,X          ; FE C0 3F | Increment (absolute,X)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BVC $AC              ; 50 AC | Branch if overflow clear
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    SBC $FF02,X          ; FD 02 FF | Subtract with carry (absolute,X)
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $79              ; 80 79 | Branch always
    STY $44              ; 84 44 | Store Y register to zero page
    STZ $1E1F            ; 9C 1F 1E | Store zero to absolute
    CPY #$07             ; C0 07 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    ASL $14E0,X          ; 1E E0 14 | Arithmetic shift left (absolute,X)
    INX                  ; E8 | Increment X register
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    STZ $A641            ; 9C 41 A6 | Store zero to absolute
    BPL $D7              ; 10 D7 | Branch if positive
    ORA $8DC2            ; 0D C2 8D | Logical OR with accumulator (absolute)
    STA                  ; 9F 40 9F 40 | Store accumulator to absolute long,X

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0B3
; Address: $E3B2CF
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0B3:
    JSR $9C00            ; 20 00 9C | Jump to subroutine
    LDX $EF10,Y          ; BE 10 EF | Load from absolute,Y into X register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0B5
; Address: $E3B2DF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0B5:
    JSR $7CAB            ; 20 AB 7C | Jump to subroutine
    SEI                  ; 78 | Set interrupt disable flag
    SEC                  ; 38 | Set carry flag
    PLB                  ; AB | Pull data bank register from stack
    BIT $3C              ; 24 3C | Test bits in accumulator (zero page)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0B6
; Address: $E3B2F2
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0B6:
    BMI $4C              ; 30 4C | Branch if negative
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    BMI $4C              ; 30 4C | Branch if negative

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0B7
; Address: $E3B2FA
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0B7:
    JSR $305C            ; 20 5C 30 | Jump to subroutine
    JMP $5C20            ; 4C 20 5C | Jump to address
    LDY #$21             ; A0 21 | PPU graphics register access
    LDX #$21             ; A2 21 | PPU graphics register access
    TAX                  ; AA | Transfer accumulator to X register
    LDA ($6A,X)          ; A1 6A | Load from (zero page,X) into accumulator
    STA ($4E,X)          ; 81 4E | Store accumulator to (zero page,X)
    SBC ($3A,X)          ; E1 3A | Subtract with carry ((zero page,X))
    CMP ($0A,X)          ; C1 0A | Compare accumulator ((zero page,X))
    CMP ($0E,X)          ; C1 0E | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0B9
; Address: $E3B316
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0B9:
    JSR $005E            ; 20 5E 00 | Jump to subroutine
    ROR $1E20,X          ; 7E 20 1E | Rotate right (absolute,X)
    ROL $3E00,X          ; 3E 00 3E | Rotate left (absolute,X)
    CPY #$39             ; C0 39 | Compare Y register (immediate)
    TXA                  ; 8A | Transfer X register to accumulator
    STA $9961,Y          ; 99 61 99 | Store accumulator to absolute,Y
    ADC $82              ; 65 82 | Add with carry (zero page)
    ASL $209F            ; 0E 9F 20 | Arithmetic shift left (absolute)
    PLP                  ; 28 | Pull processor status from stack
    ORA ($66,X)          ; 01 66 | Logical OR with accumulator ((zero page,X))
    SBC ($27),Y          ; F1 27 | Subtract with carry ((zero page),Y)
    CMP $D02F,Y          ; D9 2F D0 | Compare accumulator (absolute,Y)
    AND #$BE             ; 29 BE | Logical AND with accumulator (immediate)
    SBC #$FE             ; E9 FE | Subtract with carry (immediate)
    AND #$FA             ; 29 FA | Logical AND with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    SEI                  ; 78 | Set interrupt disable flag
    TXS                  ; 9A | Transfer X register to stack pointer
    CLD                  ; D8 | Clear decimal mode flag
    BIT #$7A             ; 89 7A | Test bits in accumulator (immediate)
    CMP #$3A             ; C9 3A | Compare accumulator (immediate)
    SEC                  ; 38 | Set carry flag
    DEC $90              ; C6 90 | Decrement (zero page)
    ROR $26D8            ; 6E D8 26 | Rotate right (absolute)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    INX                  ; E8 | Increment X register
    BEQ $6E              ; F0 6E | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    STY $73              ; 84 73 | Store Y register to zero page
    ORA ($FA,X)          ; 01 FA | Logical OR with accumulator ((zero page,X))
    DEC $1AE3,X          ; DE E3 1A | Decrement (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0BA
; Address: $E3B36E
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0BA:
    SBC $0102,Y          ; F9 02 01 | Subtract with carry (absolute,Y)
    ADC $FA05,X          ; 7D 05 FA | Add with carry (absolute,X)
    ORA ($DE,X)          ; 01 DE | Logical OR with accumulator ((zero page,X))
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    BIT $FF              ; 24 FF | Test bits in accumulator (zero page)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    ASL $7F              ; 06 7F | Arithmetic shift left (zero page)
    STY $7F              ; 84 7F | Store Y register to zero page
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0BB
; Address: $E3B38D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0BB:
    PLA                  ; 68 | Pull accumulator from stack
    INY                  ; C8 | Increment Y register
    BIT $FF              ; 24 FF | Test bits in accumulator (zero page)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    STY $FF              ; 84 FF | Store Y register to zero page
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0BC
; Address: $E3B39D
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0BC:
    PLA                  ; 68 | Pull accumulator from stack
    INY                  ; C8 | Increment Y register
    BCC $7F              ; 90 7F | Branch if carry clear
    BRA $FF              ; 80 FF | Branch always
    BCC $FF              ; 90 FF | Branch if carry clear
    BRA $07              ; 80 07 | Branch always
    CLD                  ; D8 | Clear decimal mode flag
    TYA                  ; 98 | Transfer Y register to accumulator
    INY                  ; C8 | Increment Y register
    ASL $C9              ; 06 C9 | Arithmetic shift left (zero page)
    STX $59              ; 86 59 | Store X register to zero page
    ASL $D9              ; 06 D9 | Arithmetic shift left (zero page)
    STX $69              ; 86 69 | Store X register to zero page
    STX $59              ; 86 59 | Store X register to zero page
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SBC $7900,Y          ; F9 00 79 | Subtract with carry (absolute,Y)
    SBC $7900,Y          ; F9 00 79 | Subtract with carry (absolute,Y)
    ADC $027C,Y          ; 79 7C 02 | Add with carry (absolute,Y)
    SEI                  ; 78 | Set interrupt disable flag
    ASL $78              ; 06 78 | Arithmetic shift left (zero page)
    STY $7C              ; 84 7C | Store Y register to zero page
    CPY #$DF             ; C0 DF | Compare Y register (immediate)
    CMP #$D6             ; C9 D6 | Compare accumulator (immediate)
    BNE $CF              ; D0 CF | Branch if not equal
    BNE $CF              ; D0 CF | Branch if not equal
    BNE $4F              ; D0 4F | Branch if not equal
    BVC $E7              ; 50 E7 | Branch if overflow clear
    INX                  ; E8 | Increment X register
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0BD
; Address: $E3B410
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0BD:
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 40 B6 C0 | Load from absolute long,X into accumulator
    BMI $80              ; 30 80 | Branch if negative
    BVS $80              ; 70 80 | Branch if overflow set
    BVS $40              ; 70 40 | Branch if overflow set
    BCS $E0              ; B0 E0 | Game work RAM access
    CLC                  ; 18 | Clear carry flag
    CPY #$28             ; C0 28 | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    LDX #$5D             ; A2 5D | Load immediate value into X register
    CPX #$1B             ; E0 1B | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    ORA $FC              ; 05 FC | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    EOR $1F00,X          ; 5D 00 1F | Exclusive OR with accumulator (absolute,X)
    BRA $3E              ; 80 3E | Branch always
    CMP ($7F,X)          ; C1 7F | Compare accumulator ((zero page,X))
    BRA $FF              ; 80 FF | Branch always
    BRA $00              ; 80 00 | Branch always
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    BRA $FF              ; 80 FF | Branch always
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0BE
; Address: $E3B481
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0BE:
    JSR $B047            ; 20 47 B0 | Jump to subroutine
    BMI $8F              ; 30 8F | Branch if negative
    BVS $CF              ; 70 CF | Branch if overflow set
    BMI $CF              ; 30 CF | Branch if negative
    BMI $C7              ; 30 C7 | Branch if negative
    SEC                  ; 38 | Set carry flag
    PLA                  ; 68 | Pull accumulator from stack
    SEC                  ; 38 | Set carry flag
    CLV                  ; B8 | Clear overflow flag
    BMI $00              ; 30 00 | Branch if negative
    BVS $00              ; 70 00 | Branch if overflow set
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    SEC                  ; 38 | Set carry flag
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0C5
; Address: $E3B4BF
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0C5:
    JSR $B433            ; 20 33 B4 | Jump to subroutine
    AND ($B6),Y          ; 31 B6 | Logical AND with accumulator ((zero page),Y)
    LDA $897E,Y          ; B9 7E 89 | Load from absolute,Y into accumulator
    PHY                  ; 5A | Push Y register to stack
    STA $295A,Y          ; 99 5A 29 | Store accumulator to absolute,Y
    TSX                  ; BA | Transfer stack pointer to X register

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0C7
; Address: $E3B4D0
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0C7:
    JSR $20DC            ; 20 DC 20 | Jump to subroutine
    DEC $4638,X          ; DE 38 46 | Decrement (absolute,X)
    CLC                  ; 18 | Clear carry flag
    ROR $08              ; 66 08 | Rotate right (zero page)
    SEC                  ; 38 | Set carry flag
    DEC $30              ; C6 30 | Decrement (zero page)
    DEC $CE30            ; CE 30 CE | Decrement (absolute)
    SBC ($3E,X)          ; E1 3E | Subtract with carry ((zero page,X))
    LDA ($6E,X)          ; A1 6E | Load from (zero page,X) into accumulator
    LDA ($6A,X)          ; A1 6A | Load from (zero page,X) into accumulator
    BIT #$56             ; 89 56 | Test bits in accumulator (immediate)
    BIT #$56             ; 89 56 | Test bits in accumulator (immediate)
    BIT #$52             ; 89 52 | Test bits in accumulator (immediate)
    CMP #$36             ; C9 36 | Compare accumulator (immediate)
    CMP ($1A,X)          ; C1 1A | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0C8
; Address: $E3B4F0
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0C8:
    JSR $201E            ; 20 1E 20 | Jump to subroutine
    LSR $5E20,X          ; 5E 20 5E | Logical shift right (absolute,X)
    ROL $8F08,X          ; 3E 08 8F | Rotate left (absolute,X)
    BRA $67              ; 80 67 | Branch always
    SBC ($17,X)          ; E1 17 | Subtract with carry ((zero page,X))
    SBC ($17,X)          ; E1 17 | Subtract with carry ((zero page,X))
    SBC ($17,X)          ; E1 17 | Subtract with carry ((zero page,X))
    SBC ($17,X)          ; E1 17 | Subtract with carry ((zero page,X))
    SBC #$1F             ; E9 1F | Subtract with carry (immediate)
    SBC #$1F             ; E9 1F | Subtract with carry (immediate)
    ROR $1F06,X          ; 7E 06 1F | Rotate right (absolute,X)
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CMP $083C,Y          ; D9 3C 08 | Compare accumulator (absolute,Y)
    SBC $E40C            ; ED 0C E4 | Subtract with carry (absolute)
    ASL $E4              ; 06 E4 | Arithmetic shift left (zero page)
    STY $ED              ; 84 ED | Store Y register to zero page
    STA $EE              ; 85 EE | Store accumulator to zero page
    STA $EE              ; 85 EE | Store accumulator to zero page
    LDA ($E2,X)          ; A1 E2 | Load from (zero page,X) into accumulator
    CPX $EC12            ; EC 12 EC | Compare X register (absolute)
    CPX $DB              ; E4 DB | Compare X register (zero page)
    CPX $5B              ; E4 5B | Compare X register (zero page)
    STZ $9B              ; 64 9B | Store zero to zero page
    STZ $9A              ; 64 9A | Store zero to zero page
    STZ $DA              ; 64 DA | Store zero to zero page
    CPY #$7E             ; C0 7E | Compare Y register (immediate)
    SBC $F802,Y          ; F9 02 F8 | Subtract with carry (absolute,Y)
    SEI                  ; 78 | Set interrupt disable flag
    BVS $8F              ; 70 8F | Branch if overflow set
    CPX #$1B             ; E0 1B | Compare X register (immediate)
    DEC $23              ; C6 23 | Decrement (zero page)
    CMP $EF26            ; CD 26 EF | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0C9
; Address: $E3B553
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0C9:
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    STA $03              ; 85 03 | Store accumulator to zero page
    STA $1D03            ; 8D 03 1D | Store accumulator to absolute address
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register
    RTI                  ; 40 | Return from interrupt
    INY                  ; C8 | Increment Y register
    BRA $77              ; 80 77 | Branch always
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    INY                  ; C8 | Increment Y register
    RTI                  ; 40 | Return from interrupt
    INY                  ; C8 | Increment Y register
    BRA $FF              ; 80 FF | Branch always
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    STY $FB              ; 84 FB | Store Y register to zero page
    STY $FF              ; 84 FF | Store Y register to zero page
    LDX #$5D             ; A2 5D | Load immediate value into X register
    STX $79              ; 86 79 | Store X register to zero page
    DEC $39              ; C6 39 | Decrement (zero page)
    STY $7B              ; 84 7B | Store Y register to zero page
    DEC $39              ; C6 39 | Decrement (zero page)
    LDX $59              ; A6 59 | Load from zero page into X register
    TYA                  ; 98 | Transfer Y register to accumulator
    ROR $99              ; 66 99 | Rotate right (zero page)
    EOR $7900,X          ; 5D 00 79 | Exclusive OR with accumulator (absolute,X)
    AND $7B00,Y          ; 39 00 7B | Logical AND with accumulator (absolute,Y)
    AND $5900,Y          ; 39 00 59 | Logical AND with accumulator (absolute,Y)
    TYA                  ; 98 | Transfer Y register to accumulator
    STA $837C,Y          ; 99 7C 83 | Store accumulator to absolute,Y
    SED                  ; F8 | Set decimal mode flag
    ASL $78              ; 06 78 | Arithmetic shift left (zero page)
    STX $7C              ; 86 7C | Store X register to zero page
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    PLA                  ; 68 | Pull accumulator from stack
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0CA
; Address: $E3B5E7
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0CA:
    JSR $2817            ; 20 17 28 | Jump to subroutine
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    STA                  ; 9F A0 40 A8 | Store accumulator to absolute long,X
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0CB
; Address: $E3B5F3
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0CB:
    DEY                  ; 88 | Decrement Y register
    RTI                  ; 40 | Return from interrupt
    TAY                  ; A8 | Transfer accumulator to Y register
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    BRA $60              ; 80 60 | Branch always
    INC $FC01,X          ; FE 01 FC | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    CPX #$80             ; E0 80 | Compare X register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    DEC $FF31            ; CE 31 FF | Decrement (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPX #$00             ; E0 00 | Compare X register (immediate)
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    LDY $C631,X          ; BC 31 C6 | Load from absolute,X into Y register
    DEC                  ; 3A | Decrement accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BEQ $C0              ; F0 C0 | Branch if equal
    BMI $00              ; 30 00 | Branch if negative
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    CPX #$13             ; E0 13 | Compare X register (immediate)
    STZ $0041            ; 9C 41 00 | Store zero to absolute
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ASL $0700            ; 0E 00 07 | Arithmetic shift left (absolute)
    ROL $1F00,X          ; 3E 00 1F | Rotate left (absolute,X)
    AND ($8E),Y          ; 31 8E | Logical AND with accumulator ((zero page),Y)
    SBC $FC32,Y          ; F9 32 FC | Subtract with carry (absolute,Y)
    AND ($F0,X)          ; 21 F0 | Logical AND with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    INC $CE30,X          ; FE 30 CE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0CC
; Address: $E3B67A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0CC:
    JSR $00DF            ; 20 DF 00 | Jump to subroutine
    INC $48A7,X          ; FE A7 48 | Increment (absolute,X)
    PHA                  ; 48 | Push accumulator to stack
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PLA                  ; 68 | Pull accumulator from stack
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0CD
; Address: $E3B699
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0CD:
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    INC $0001,X          ; FE 01 00 | Increment (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($2C,X)          ; 01 2C | Logical OR with accumulator ((zero page,X))
    AND $39BA,Y          ; 39 BA 39 | Logical AND with accumulator (absolute,Y)
    EOR $597A,Y          ; 59 7A 59 | Exclusive OR with accumulator (absolute,Y)
    PLY                  ; 7A | Pull Y register from stack
    CLI                  ; 58 | Clear interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    LDA $CF30,Y          ; B9 30 CF | Load from absolute,Y into accumulator
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    DEC $20              ; C6 20 | Decrement (zero page)
    DEC $9668,X          ; DE 68 96 | Decrement (absolute,X)
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    CMP $1E              ; C5 1E | Compare accumulator (zero page)
    LDA ($6A,X)          ; A1 6A | Load from (zero page,X) into accumulator
    JMP ($4CA3)          ; 6C A3 4C | Jump to address (absolute indirect)
    CPY $EA21            ; CC 21 EA | Compare Y register (absolute)
    AND ($1A,X)          ; 21 1A | Logical AND with accumulator ((zero page,X))
    ADC ($3A,X)          ; 61 3A | Add with carry ((zero page,X))
    DEC                  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0CF
; Address: $E3B6FA
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0CF:
    JSR $00DE            ; 20 DE 00 | Jump to subroutine
    INC $DE20,X          ; FE 20 DE | Increment (absolute,X)
    XBA                  ; EB | Exchange accumulator bytes
    XBA                  ; EB | Exchange accumulator bytes
    XBA                  ; EB | Exchange accumulator bytes
    PHB                  ; 8B | Push data bank register to stack
    ORA $0D12            ; 0D 12 0D | Logical OR with accumulator (absolute)
    ORA $0912            ; 0D 12 09 | Logical OR with accumulator (absolute)
    ORA #$16             ; 09 16 | Logical OR with accumulator (immediate)
    ORA #$16             ; 09 16 | Logical OR with accumulator (immediate)
    ORA #$36             ; 09 36 | Logical OR with accumulator (immediate)
    ORA $B172            ; 0D 72 B1 | Logical OR with accumulator (absolute)
    INC $90              ; E6 90 | Increment (zero page)
    BRA $EF              ; 80 EF | Branch always

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0D0
; Address: $E3B726
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0D0:
    LDY #$EF             ; A0 EF | Load immediate value into Y register
    BCS $E7              ; B0 E7 | Branch if carry set
    BEQ $F7              ; F0 F7 | Branch if equal
    BEQ $E3              ; F0 E3 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPY #$3E             ; C0 3E | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0D1
; Address: $E3B734
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0D1:
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BCS $4F              ; B0 4F | Branch if carry set
    BRA $7F              ; 80 7F | Branch always
    BPL $EF              ; 10 EF | Branch if positive
    ORA $06F6            ; 0D F6 06 | Logical OR with accumulator (absolute)
    ASL $F3              ; 06 F3 | Arithmetic shift left (zero page)
    ASL $F3              ; 06 F3 | Arithmetic shift left (zero page)
    CPY $33              ; C4 33 | Compare Y register (zero page)
    CPY $33              ; C4 33 | Compare Y register (zero page)
    LSR $A3              ; 46 A3 | Logical shift right (zero page)
    SED                  ; F8 | Set decimal mode flag
    ORA $FB              ; 05 FB | Logical OR with accumulator (zero page)
    SBC $FF01,Y          ; F9 01 FF | Subtract with carry (absolute,Y)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    AND $3D03,X          ; 3D 03 3D | Logical AND with accumulator (absolute,X)
    ORA ($BF,X)          ; 01 BF | Logical OR with accumulator ((zero page,X))
    ROR $99              ; 66 99 | Rotate right (zero page)
    ROR $7791            ; 6E 91 77 | Rotate right (absolute)
    DEY                  ; 88 | Decrement Y register
    LDY #$56             ; A0 56 | Load immediate value into Y register
    LDA #$57             ; A9 57 | Load immediate value into accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA #$5E             ; A9 5E | Load immediate value into accumulator
    LDA ($FF,X)          ; A1 FF | Load from (zero page,X) into accumulator
    STA $91FF,Y          ; 99 FF 91 | Store accumulator to absolute,Y
    DEY                  ; 88 | Decrement Y register
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    LDA ($DF,X)          ; A1 DF | Load from (zero page,X) into accumulator

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0D7
; Address: $E3B79D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0D7:
    JSR $20FF            ; 20 FF 20 | Jump to subroutine
    SEI                  ; 78 | Set interrupt disable flag
    LDY $E1E1,X          ; BC E1 E1 | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0D8
; Address: $E3B7B0
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0D8:
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    CPY $1E8C            ; CC 8C 1E | Compare Y register (absolute)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    BPL $10              ; 10 10 | Branch if positive
    CPX #$00             ; E0 00 | Compare X register (immediate)
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    STY $B280            ; 8C 80 B2 | Store Y register to absolute address
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    STZ $6FDE,X          ; 9E DE 6F | Store zero to absolute,X
    BRA $7F              ; 80 7F | Branch always
    LDA                  ; BF 0F 61 40 | Load from absolute long,X into accumulator
    BCC $80              ; 90 80 | Branch if carry clear
    SBC ($E2,X)          ; E1 E2 | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0DA
; Address: $E3B7EA
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0DA:
    JSR $84F1            ; 20 F1 84 | Jump to subroutine
    LDA $5E27,X          ; BD 27 5E | Load from absolute,X into accumulator
    BEQ $72              ; F0 72 | Branch if equal
    BEQ $FB              ; F0 FB | Branch if equal
    SEP #$E9             ; E2 E9 | Set processor status bits
    SBC ($6C,X)          ; E1 6C | Subtract with carry ((zero page,X))
    CPX #$EE             ; E0 EE | Compare X register (immediate)
    CPY $82              ; C4 82 | Compare Y register (zero page)
    DEC $61              ; C6 61 | Decrement (zero page)
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    ROR $3F01,X          ; 7E 01 3F | Rotate right (absolute,X)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 80 DF E0 | Load from absolute long,X into accumulator
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $08              ; F0 08 | Branch if equal

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0DC
; Address: $E3B829
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0DC:
    STA                  ; 9F C0 3F FA | Store accumulator to absolute long,X
    ORA $FC              ; 05 FC | Logical OR with accumulator (zero page)
    STA                  ; 9F 00 3F 00 | Store accumulator to absolute long,X
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CPX #$7F             ; E0 7F | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    INC $E000,X          ; FE 00 E0 | Game work RAM access
    BRA $0F              ; 80 0F | Branch always
    BCC $07              ; 90 07 | Branch if carry clear
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0DD
; Address: $E3B865
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0DD:
    JSL $00C008          ; 22 08 C0 00 | Jump to subroutine long
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    PLA                  ; 68 | Pull accumulator from stack
    INX                  ; E8 | Increment X register
    BEQ $07              ; F0 07 | Branch if equal
    SEC                  ; 38 | Set carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($21,X)          ; 01 21 | PPU graphics register access
    LSR $00              ; 46 00 | Logical shift right (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    STA                  ; 9F 60 1F E0 | Store accumulator to absolute long,X
    LDY #$0E             ; A0 0E | Load immediate value into Y register
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0DE
; Address: $E3B8BB
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0DE:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SBC ($2C),Y          ; F1 2C | Subtract with carry ((zero page),Y)
    LDA                  ; BF 3A BF 3C | Load from absolute long,X into accumulator
    LDA                  ; BF 3C B6 35 | Load from absolute long,X into accumulator
    ROR                  ; 6A | Rotate right (accumulator)
    CMP #$3A             ; C9 3A | Compare accumulator (immediate)
    CMP $32              ; C5 32 | Compare accumulator (zero page)
    CMP $E817            ; CD 17 E8 | Compare accumulator (absolute)
    AND ($CE),Y          ; 31 CE | Logical AND with accumulator ((zero page),Y)
    STZ $956A            ; 9C 6A 95 | Store zero to absolute
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    ORA #$EE             ; 09 EE | Logical OR with accumulator (immediate)
    ORA ($1F),Y          ; 11 1F | Logical OR with accumulator ((zero page),Y)
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    BRA $7F              ; 80 7F | Branch always
    BRA $00              ; 80 00 | Branch always
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SBC $F100,Y          ; F9 00 F1 | Subtract with carry (absolute,Y)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $99              ; 80 99 | Branch always
    CPX #$7F             ; E0 7F | Compare X register (immediate)
    ROL $BF              ; 26 BF | Rotate left (zero page)
    STA $5D              ; 85 5D | Store accumulator to zero page
    STA $DD7D            ; 8D 7D DD | Store accumulator to absolute address
    AND $39DD,Y          ; 39 DD 39 | Logical AND with accumulator (absolute,Y)
    SEI                  ; 78 | Set interrupt disable flag
    EOR $3BB6            ; 4D B6 3B | Exclusive OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0DF
; Address: $E3B917
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0DF:
    CMP $1D              ; C5 1D | Compare accumulator (zero page)
    ROR                  ; 6A | Rotate right (accumulator)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0E0
; Address: $E3B91C
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0E0:
    ORA #$36             ; 09 36 | Logical OR with accumulator (immediate)
    PLP                  ; 28 | Pull processor status from stack
    PLA                  ; 68 | Pull accumulator from stack
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    BRA $E1              ; 80 E1 | Branch always
    BRA $E0              ; 80 E0 | Game work RAM access
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    DEY                  ; 88 | Decrement Y register
    BRA $7F              ; 80 7F | Branch always
    DEY                  ; 88 | Decrement Y register
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    ASL $E3              ; 06 E3 | Arithmetic shift left (zero page)
    ASL $E3              ; 06 E3 | Arithmetic shift left (zero page)
    ASL $0EC3            ; 0E C3 0E | Arithmetic shift left (absolute)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    LSR $56A1,X          ; 5E A1 56 | Logical shift right (absolute,X)
    LDA #$57             ; A9 57 | Load immediate value into accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    SBC #$8E             ; E9 8E | Subtract with carry (immediate)
    ADC ($D4),Y          ; 71 D4 | Add with carry ((zero page),Y)
    ADC #$9A             ; 69 9A | Add with carry (immediate)
    ADC $FF              ; 65 FF | Add with carry (zero page)
    LDA ($FF,X)          ; A1 FF | Load from (zero page,X) into accumulator
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    SBC #$FF             ; E9 FF | Subtract with carry (immediate)
    ADC ($FF),Y          ; 71 FF | Add with carry ((zero page),Y)
    ADC #$FF             ; 69 FF | Add with carry (immediate)
    ADC $DF              ; 65 DF | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0E1
; Address: $E3B981
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0E1:
    JSR $28D7            ; 20 D7 28 | Jump to subroutine
    JMP ($2CD3)          ; 6C D3 2C | Jump to address (absolute indirect)
    JMP ($A45B)          ; 6C 5B A4 | Jump to address (absolute indirect)
    STY $A857            ; 8C 57 A8 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0E2
; Address: $E3B991
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0E2:
    JSR $28FF            ; 20 FF 28 | Jump to subroutine
    JMP ($2CFF)          ; 6C FF 2C | Jump to address (absolute indirect)
    JMP ($A4FF)          ; 6C FF A4 | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0E3
; Address: $E3B99D
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0E3:
    STY $A8FF            ; 8C FF A8 | Store Y register to absolute address
    XBA                  ; EB | Exchange accumulator bytes
    CPY $C8              ; C4 C8 | Compare Y register (zero page)
    BRA $87              ; 80 87 | Branch always
    BPL $16              ; 10 16 | Branch if positive
    LDY #$A4             ; A0 A4 | Load immediate value into Y register
    CMP ($D1,X)          ; C1 D1 | Compare accumulator ((zero page,X))
    TXS                  ; 9A | Transfer X register to stack pointer
    REP #$10             ; C2 10 | Reset processor status bits
    SEI                  ; 78 | Set interrupt disable flag
    SBC #$00             ; E9 00 | Subtract with carry (immediate)
    ROL $1C00            ; 2E 00 1C | Rotate left (absolute)
    AND $FC00,X          ; 3D 00 FC | Logical AND with accumulator (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    INC $9F15,X          ; FE 15 9F | Increment (absolute,X)
    ROL $D73F,X          ; 3E 3F D7 | Rotate left (absolute,X)
    LDA #$BF             ; A9 BF | Load immediate value into accumulator
    ASL $9EFE            ; 0E FE 9E | Arithmetic shift left (absolute)
    ROL $FC16,X          ; 3E 16 FC | Rotate left (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    CLV                  ; B8 | Clear overflow flag
    ROR $613E,X          ; 7E 3E 61 | Rotate right (absolute,X)
    BCS $CD              ; B0 CD | Branch if carry set
    AND ($CE),Y          ; 31 CE | Logical AND with accumulator ((zero page),Y)
    ORA $1CD6,Y          ; 19 D6 1C | Logical OR with accumulator (absolute,Y)
    ASL $06A1            ; 0E A1 06 | Arithmetic shift left (absolute)
    SBC ($84,X)          ; E1 84 | Subtract with carry ((zero page,X))
    BVS $80              ; 70 80 | Branch if overflow set
    BRA $B1              ; 80 B1 | Branch always
    BPL $29              ; 10 29 | Branch if positive
    BPL $2C              ; 10 2C | Branch if positive
    LSR $1E00,X          ; 5E 00 1E | Logical shift right (absolute,X)
    STY $DC1B            ; 8C 1B DC | Store Y register to absolute address
    STY $BA29            ; 8C 29 BA | Store Y register to absolute address
    ORA ($56,X)          ; 01 56 | Logical OR with accumulator ((zero page,X))
    STA $AB53            ; 8D 53 AB | Store accumulator to absolute address
    BVS $70              ; 70 70 | Branch if overflow set
    BPL $28              ; 10 28 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BVS $28              ; 70 28 | Branch if overflow set
    TAY                  ; A8 | Transfer accumulator to Y register
    TXA                  ; 8A | Transfer X register to accumulator
    BVS $FF              ; 70 FF | Branch if overflow set
    SEP #$1C             ; E2 1C | Set processor status bits
    STA ($F1,X)          ; 81 F1 | Store accumulator to (zero page,X)
    STA                  ; 9F 00 00 00 | Store accumulator to absolute long,X
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SBC ($FE),Y          ; F1 FE | Subtract with carry ((zero page),Y)
    DEC $FC              ; C6 FC | Decrement (zero page)
    STZ $00FF            ; 9C FF 00 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0E4
; Address: $E3BA46
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0E4:
    STA                  ; 9F 18 63 7E | Store accumulator to absolute long,X
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    DEC $BBBB,X          ; DE BB BB | Decrement (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    INC $FF7E,X          ; FE 7E FF | Increment (absolute,X)
    INC $5B7A,X          ; FE 7A 5B | Increment (absolute,X)
    DEC                  ; 3A | Decrement accumulator
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($5E,X)          ; 01 5E | Logical OR with accumulator ((zero page,X))
    AND ($0E,X)          ; 21 0E | Logical AND with accumulator ((zero page,X))
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA ($00,X)          ; A1 00 | Load from (zero page,X) into accumulator
    SBC ($20),Y          ; F1 20 | Subtract with carry ((zero page),Y)
    CPY $D028            ; CC 28 D0 | Compare Y register (absolute)
    BIT $59              ; 24 59 | Test bits in accumulator (zero page)
    ADC $6990            ; 6D 90 69 | Add with carry (absolute)
    ADC #$94             ; 69 94 | Add with carry (immediate)
    ADC #$96             ; 69 96 | Add with carry (immediate)
    ADC #$96             ; 69 96 | Add with carry (immediate)
    INC $9F01,X          ; FE 01 9F | Increment (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0E5
; Address: $E3BAA6
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0E5:
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC $F3B3,Y          ; 79 B3 F3 | Add with carry (absolute,Y)
    ADC ($63),Y          ; 71 63 | Add with carry ((zero page),Y)
    ADC $D186,Y          ; 79 86 D1 | Add with carry (absolute,Y)
    ROL $0DF2            ; 2E F2 0D | Rotate left (absolute)
    STA $9C63,X          ; 9D 63 9C | Store accumulator to absolute,X
    AND $EBC6,Y          ; 39 C6 EB | Logical AND with accumulator (absolute,Y)
    CMP $403F            ; CD 3F 40 | Compare accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BRA $1F              ; 80 1F | Branch always

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0E7
; Address: $E3BAEF
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0E7:
    SEC                  ; 38 | Set carry flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    STA $9D79,X          ; 9D 79 9D | Store accumulator to absolute,X
    ADC $589C,Y          ; 79 9C 58 | Add with carry (absolute,Y)
    STA $9F59,X          ; 9D 59 9F | Store accumulator to absolute,X
    CLI                  ; 58 | Clear interrupt disable flag
    STA                  ; 9F 51 9B 51 | Store accumulator to absolute long,X
    EOR ($08,X)          ; 41 08 | Exclusive OR with accumulator ((zero page,X))
    ORA ($6E),Y          ; 11 6E | Logical OR with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    ORA $0866,Y          ; 19 66 08 | Logical OR with accumulator (absolute,Y)
    ORA ($6E),Y          ; 11 6E | Logical OR with accumulator ((zero page),Y)
    ORA ($6E),Y          ; 11 6E | Logical OR with accumulator ((zero page),Y)
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    BRA $E0              ; 80 E0 | Game work RAM access
    DEY                  ; 88 | Decrement Y register
    PLA                  ; 68 | Pull accumulator from stack
    PHP                  ; 08 | Push processor status to stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    DEY                  ; 88 | Decrement Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    DEY                  ; 88 | Decrement Y register
    LDY #$89             ; A0 89 | Load immediate value into Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA #$20             ; 09 20 | Logical OR with accumulator (immediate)
    BRA $7F              ; 80 7F | Branch always
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    BRA $7F              ; 80 7F | Branch always
    DEY                  ; 88 | Decrement Y register
    ROR $7E07,X          ; 7E 07 7E | Rotate right (absolute,X)
    INC $FF3F,X          ; FE 3F FF | Increment (absolute,X)
    INC $0CFF,X          ; FE FF 0C | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    AND $FCC6,Y          ; 39 C6 FC | Logical AND with accumulator (absolute,Y)
    SBC $1202,X          ; FD 02 12 | Subtract with carry (absolute,X)
    SBC $2DD2            ; ED D2 2D | Subtract with carry (absolute)
    SBC $ED12            ; ED 12 ED | Subtract with carry (absolute)
    PLB                  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0E8
; Address: $E3BB6C
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0E8:
    WDM #$BD             ; 42 BD | Reserved instruction
    SBC $EDFF            ; ED FF ED | Subtract with carry (absolute)
    AND $FBFF            ; 2D FF FB | Logical AND with accumulator (absolute)
    SBC $EDFF            ; ED FF ED | Subtract with carry (absolute)
    PLB                  ; AB | Pull data bank register from stack
    LDA $EDFF,X          ; BD FF ED | Load from absolute,X into accumulator
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    NOP                  ; EA | No operation
    TAX                  ; AA | Transfer accumulator to X register
    LSR $B9              ; 46 B9 | Logical shift right (zero page)
    AND $DA              ; 25 DA | Logical AND with accumulator (zero page)
    LDA $5A              ; A5 5A | Load from zero page into accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    ROR                  ; 6A | Rotate right (accumulator)
    PLX                  ; FA | Pull X register from stack
    NOP                  ; EA | No operation
    TAX                  ; AA | Transfer accumulator to X register
    LDA $DAFF,Y          ; B9 FF DA | Load from absolute,Y into accumulator
    PHY                  ; 5A | Push Y register to stack
    LSR                  ; 4A | Logical shift right (accumulator)
    ROR                  ; 6A | Rotate right (accumulator)
    AND $77AD,X          ; 3D AD 77 | Logical AND with accumulator (absolute,X)
    BIT $FF              ; 24 FF | Test bits in accumulator (zero page)
    CPY $888F            ; CC 8F 88 | Compare Y register (absolute)
    BVC $07              ; 50 07 | Branch if overflow clear
    DEY                  ; 88 | Decrement Y register
    PLP                  ; 28 | Pull processor status from stack
    STA $F00820          ; 8F 20 08 F0 | Store accumulator to absolute long address
    INY                  ; C8 | Increment Y register
    CMP #$EC             ; C9 EC | Compare accumulator (immediate)
    SBC $D1DE            ; ED DE D1 | Subtract with carry (absolute)
    DEC $FAD1,X          ; DE D1 FA | Decrement (absolute,X)
    CPX $FC              ; E4 FC | Compare X register (zero page)
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    ORA #$10             ; 09 10 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0E9
; Address: $E3BBD4
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0E9:
    JSR $200E            ; 20 0E 20 | Jump to subroutine
    ASL $1A01            ; 0E 01 1A | Arithmetic shift left (absolute)
    STA ($79,X)          ; 81 79 | Store accumulator to (zero page,X)
    DEC $882E            ; CE 2E 88 | Decrement (absolute)
    PHP                  ; 08 | Push processor status to stack
    STX $158F            ; 8E 8F 15 | Store X register to absolute address
    ORA #$0B             ; 09 0B | Logical OR with accumulator (immediate)
    STA ($1F,X)          ; 81 1F | Store accumulator to (zero page,X)
    DEC $887F            ; CE 7F 88 | Decrement (absolute)
    STA $FF17FF          ; 8F FF 17 FF | Store accumulator to absolute long address
    STY $1E8C            ; 8C 8C 1E | Store Y register to absolute address
    ROL $C644,X          ; 3E 44 C6 | Rotate left (absolute,X)
    STA ($8D,X)          ; 81 8D | Store accumulator to (zero page,X)
    ORA ($11,X)          ; 01 11 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0EA
; Address: $E3BC0E
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0EA:
    ADC ($75),Y          ; 71 75 | Add with carry ((zero page),Y)
    STY $1FFF            ; 8C FF 1F | Store Y register to absolute address
    ROL $C6FF,X          ; 3E FF C6 | Rotate left (absolute,X)
    STA $0CFF            ; 8D FF 0C | Store accumulator to absolute address
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    ORA ($B9,X)          ; 01 B9 | Logical OR with accumulator ((zero page,X))
    LDY $EE62            ; AC 62 EE | Load from absolute address into Y register
    ROR $48FF            ; 6E FF 48 | Rotate right (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    BCS $B2              ; B0 B2 | Branch if carry set
    BCC $B2              ; 90 B2 | Branch if carry clear
    ASL $26              ; 06 26 | Arithmetic shift left (zero page)
    INC $FFB8,X          ; FE B8 FF | Increment (absolute,X)
    LDY $EEFF            ; AC FF EE | Load from absolute address into Y register
    CLD                  ; D8 | Clear decimal mode flag
    SBC $C020,Y          ; F9 20 C0 | Subtract with carry (absolute,Y)
    CMP ($0F,X)          ; C1 0F | Compare accumulator ((zero page,X))
    STA $9D9A1A          ; 8F 1A 9A 9D | Store accumulator to absolute long address
    STA $FB7A,X          ; 9D 7A FB | Store accumulator to absolute,X
    STA                  ; 9F 1C 1E F8 | Store accumulator to absolute long,X
    ORA ($F1,X)          ; 01 F1 | Logical OR with accumulator ((zero page,X))
    STA ($FD,X)          ; 81 FD | Store accumulator to (zero page,X)
    TYA                  ; 98 | Transfer Y register to accumulator
    SEP #$80             ; E2 80 | Set processor status bits
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    LSR $D9              ; 46 D9 | Logical shift right (zero page)
    SBC $BDC2            ; ED C2 BD | Subtract with carry (absolute)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0EB
; Address: $E3BC66
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0EB:
    JSR $E0DF            ; 20 DF E0 | Game work RAM access
    TYA                  ; 98 | Transfer Y register to accumulator
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    AND $1D00,Y          ; 39 00 1D | Logical AND with accumulator (absolute,Y)
    EOR $E7C0            ; 4D C0 E7 | Exclusive OR with accumulator (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0EC
; Address: $E3BC7D
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0EC:
    ORA $1C00,Y          ; 19 00 1C | Logical OR with accumulator (absolute,Y)
    ADC ($9E,X)          ; 61 9E | Add with carry ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 00 FF 00 | Load from absolute long,X into accumulator
    STZ $BF00,X          ; 9E 00 BF | Store zero to absolute,X
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    STY $31              ; 84 31 | Store Y register to zero page
    CMP $F408            ; CD 08 F4 | Compare accumulator (absolute)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC $0700,X          ; FE 00 07 | Increment (absolute,X)
    ORA ($CE,X)          ; 01 CE | Logical OR with accumulator ((zero page,X))
    SEP #$E6             ; E2 E6 | Set processor status bits
    INC $EE              ; E6 EE | Increment (zero page)
    INC $7FFF            ; EE FF 7F | Increment (absolute)
    LDA $AE51            ; AD 51 AE | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0ED
; Address: $E3BCD6
; Size: 118 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0ED:
    LDX #$5D             ; A2 5D | Load immediate value into X register
    LDY $5B              ; A4 5B | Load from zero page into Y register
    LDY $7F53            ; AC 53 7F | Load from absolute address into Y register
    BRA $7B              ; 80 7B | Branch always
    STY $03              ; 84 03 | Store Y register to zero page
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    ASL $29              ; 06 29 | Arithmetic shift left (zero page)
    SBC $F900,Y          ; F9 00 F9 | Subtract with carry (absolute,Y)
    ORA $19D9,Y          ; 19 D9 19 | Logical OR with accumulator (absolute,Y)
    CMP $D119,Y          ; D9 19 D1 | Compare accumulator (absolute,Y)
    ORA $19D9,Y          ; 19 D9 19 | Logical OR with accumulator (absolute,Y)
    CMP ($09,X)          ; C1 09 | Compare accumulator ((zero page,X))
    CMP ($19,X)          ; C1 19 | Compare accumulator ((zero page,X))
    CMP ($19,X)          ; C1 19 | Compare accumulator ((zero page,X))
    CMP ($19,X)          ; C1 19 | Compare accumulator ((zero page,X))
    INC $18              ; E6 18 | Increment (zero page)
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    ORA $01E6,Y          ; 19 E6 01 | Logical OR with accumulator (absolute,Y)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    STA $8F80            ; 8D 80 8F | Store accumulator to absolute address
    BRA $8F              ; 80 8F | Branch always
    BRA $9F              ; 80 9F | Branch always
    PHP                  ; 08 | Push processor status to stack
    STA                  ; 9F 09 BF 01 | Store accumulator to absolute long,X
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    PHP                  ; 08 | Push processor status to stack
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    INC $FF7F,X          ; FE 7F FF | Increment (absolute,X)
    INC $FAFF,X          ; FE FF FA | Increment (absolute,X)
    INC $F8FF,X          ; FE FF F8 | Increment (absolute,X)
    BEQ $FF              ; F0 FF | Branch if equal
    ADC $7C82,X          ; 7D 82 7C | Add with carry (absolute,X)
    PLA                  ; 68 | Pull accumulator from stack
    SBC #$16             ; E9 16 | Subtract with carry (immediate)
    CMP $C132            ; CD 32 C1 | Compare accumulator (absolute)
    ROL $38C7,X          ; 3E C7 38 | Rotate left (absolute,X)
    STA $EF1070          ; 8F 70 10 EF | Store accumulator to absolute long address
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    CPX $FF00            ; EC 00 FF | Compare X register (absolute)
    SBC $EF10,X          ; FD 10 EF | Subtract with carry (absolute,X)
    ROR $6EFF            ; 6E FF 6E | Rotate right (absolute)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0EE
; Address: $E3BD77
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0EE:
    JMP ($7FFF)          ; 6C FF 7F | Jump to address (absolute indirect)
    ADC $6FFF,X          ; 7D FF 6F | Add with carry (absolute,X)
    EOR #$B6             ; 49 B6 | Exclusive OR with accumulator (immediate)
    EOR ($BE,X)          ; 41 BE | Exclusive OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    XBA                  ; EB | Exchange accumulator bytes
    AND ($DE,X)          ; 21 DE | Logical AND with accumulator ((zero page,X))
    LDX $77FF,Y          ; BE FF 77 | Load from absolute,Y into X register
    ROL $7BFF,X          ; 3E FF 7B | Rotate left (absolute,X)
    LDX $63FF            ; AE FF 63 | Load from absolute address into X register
    BVS $59              ; 70 59 | Branch if overflow set
    STY $3DFC            ; 8C FC 3D | Store Y register to absolute address
    ROR $3866,X          ; 7E 66 38 | Rotate right (absolute,X)
    SEC                  ; 38 | Set carry flag
    BRA $00              ; 80 00 | Branch always
    PHY                  ; 5A | Push Y register to stack
    LDY #$83             ; A0 83 | Load immediate value into Y register
    STY $3C73            ; 8C 73 3C | Store Y register to absolute address
    REP #$66             ; C2 66 | Reset processor status bits
    STA $C738,Y          ; 99 38 C7 | Store accumulator to absolute,Y
    BRA $25              ; 80 25 | Branch always
    AND $B980,Y          ; 39 80 B9 | Logical AND with accumulator (absolute,Y)
    PLX                  ; FA | Pull X register from stack
    ASL $9E              ; 06 9E | Arithmetic shift left (zero page)
    ORA ($11,X)          ; 01 11 | Logical OR with accumulator ((zero page,X))
    CPX #$E6             ; E0 E6 | Compare X register (immediate)
    ASL $C0              ; 06 C0 | Arithmetic shift left (zero page)
    STX $40              ; 86 40 | Store X register to zero page
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    CPX #$0C             ; E0 0C | Compare X register (immediate)
    ROR $01              ; 66 01 | Rotate right (zero page)
    ORA ($EE,X)          ; 01 EE | Logical OR with accumulator ((zero page,X))
    CPX #$19             ; E0 19 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0EF
; Address: $E3BDE1
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0EF:
    ROR $00              ; 66 00 | Rotate right (zero page)
    STY $E800            ; 8C 00 E8 | Store Y register to absolute address
    ORA ($F8,X)          ; 01 F8 | Logical OR with accumulator ((zero page,X))
    CPX #$C2             ; E0 C2 | Compare X register (immediate)
    JMP $CBC0            ; 4C C0 CB | Jump to address
    ADC $0380,Y          ; 79 80 03 | Add with carry (absolute,Y)
    BVS $07              ; 70 07 | Branch if overflow set
    BPL $06              ; 10 06 | Branch if positive
    EOR ($B0,X)          ; 41 B0 | Exclusive OR with accumulator ((zero page,X))
    CPY $30              ; C4 30 | Compare Y register (zero page)
    PHP                  ; 08 | Push processor status to stack
    STZ $00              ; 64 00 | Store zero to zero page
    ORA ($B3,X)          ; 01 B3 | Logical OR with accumulator ((zero page,X))
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0F0
; Address: $E3BE0D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0F0:
    STA $9BDB1B          ; 8F 1B DB 9B | Store accumulator to absolute long address
    STA $4C00            ; 8D 00 4C | Store accumulator to absolute address
    PEA #$F900           ; F4 00 F9 | Push effective address to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0F1
; Address: $E3BE1E
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0F1:
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    DEC $DE5E,X          ; DE 5E DE | Decrement (absolute,X)
    DEC $9CFC,X          ; DE FC 9C | Decrement (absolute,X)
    SBC $F399,Y          ; F9 99 F3 | Subtract with carry (absolute,Y)
    BNE $00              ; D0 00 | Branch if not equal
    BNE $00              ; D0 00 | Branch if not equal
    LDA ($00,X)          ; A1 00 | Load from (zero page,X) into accumulator
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ROR $00              ; 66 00 | Rotate right (zero page)
    BPL $00              ; 10 00 | Branch if positive
    CPX $E9              ; E4 E9 | Compare X register (zero page)
    ORA $309C,X          ; 1D 9C 30 | Logical OR with accumulator (absolute,X)
    ADC $9E9E,X          ; 7D 9E 9E | Add with carry (absolute,X)
    BRA $00              ; 80 00 | Branch always
    INY                  ; C8 | Increment Y register
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    PLB                  ; AB | Pull data bank register from stack
    ROR $18              ; 66 18 | Rotate right (zero page)
    ASL $38              ; 06 38 | Arithmetic shift left (zero page)
    INC                  ; 1A | Increment accumulator
    JMP $D966E2          ; 5C E2 66 D9 | Jump to address long
    PLX                  ; FA | Pull X register from stack
    CPX #$FC             ; E0 FC | Compare X register (immediate)
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    STA ($66,X)          ; 81 66 | Store accumulator to (zero page,X)
    SBC ($36,X)          ; E1 36 | Subtract with carry ((zero page,X))
    CMP ($6A),Y          ; D1 6A | Compare accumulator ((zero page),Y)
    STA ($BC,X)          ; 81 BC | Store accumulator to (zero page,X)
    BRA $B6              ; 80 B6 | Branch always
    INC $0080,X          ; FE 80 00 | Increment (absolute,X)
    BRA $7F              ; 80 7F | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0F2
; Address: $E3BE8A
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0F2:
    JSR $101F            ; 20 1F 10 | Jump to subroutine
    STY $86              ; 84 86 | Store Y register to zero page
    BRA $FF              ; 80 FF | Branch always
    BRA $7F              ; 80 7F | Branch always
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    BEQ $1F              ; F0 1F | Branch if equal
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BRA $7F              ; 80 7F | Branch always
    BRA $FF              ; 80 FF | Branch always
    BEQ $E0              ; F0 E0 | Game work RAM access
    SBC $7969            ; ED 69 79 | Subtract with carry (absolute)
    BMI $16              ; 30 16 | Branch if negative
    BPL $06              ; 10 06 | Branch if positive

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0F3
; Address: $E3BECE
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0F3:
    BPL $87              ; 10 87 | Branch if positive
    CPX $CD32            ; EC 32 CD | Compare X register (absolute)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    ADC #$96             ; 69 96 | Add with carry (immediate)
    ADC ($8E),Y          ; 71 8E | Add with carry ((zero page),Y)
    BPL $EF              ; 10 EF | Branch if positive
    ORA $1BC0,Y          ; 19 C0 1B | Logical OR with accumulator (absolute,Y)
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    STA ($3F,X)          ; 81 3F | Store accumulator to (zero page,X)
    STA $9B3F,Y          ; 99 3F 9B | Store accumulator to absolute,Y
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA $1BE6,Y          ; 19 E6 1B | Logical OR with accumulator (absolute,Y)
    CPX $03              ; E4 03 | Compare X register (zero page)
    SBC $FD02,X          ; FD 02 FD | Subtract with carry (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BMI $FF              ; 30 FF | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BRA $FF              ; 80 FF | Branch always
    STA $FF1FFF          ; 8F FF 1F FF | Store accumulator to absolute long address
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    BMI $CF              ; 30 CF | Branch if negative
    INX                  ; E8 | Increment X register
    SED                  ; F8 | Set decimal mode flag
    BRA $7F              ; 80 7F | Branch always
    STA $E01F70          ; 8F 70 1F E0 | Game work RAM access
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $7F              ; F0 7F | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    STA $30CF70          ; 8F 70 CF 30 | Store accumulator to absolute long address
    BCC $67              ; 90 67 | Branch if carry clear
    TYA                  ; 98 | Transfer Y register to accumulator
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    STA $F10F71          ; 8F 71 0F F1 | Store accumulator to absolute long address
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    AND ($DE,X)          ; 21 DE | Logical AND with accumulator ((zero page,X))
    AND $34C6,Y          ; 39 C6 34 | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0F4
; Address: $E3BF6E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0F4:
    JSL $F7FFDD          ; 22 DD FF F7 | Jump to subroutine long
    PLX                  ; FA | Pull X register from stack
    DEC $C6FF,X          ; DE FF C6 | Decrement (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0F6
; Address: $E3BF86
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0F6:
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    BRA $7F              ; 80 7F | Branch always
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0F7
; Address: $E3BF95
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0F7:
    ROR $FF              ; 66 FF | Rotate right (zero page)
    STA $004300          ; 8F 00 43 00 | Store accumulator to absolute long address
    ORA ($C0),Y          ; 11 C0 | Logical OR with accumulator ((zero page),Y)
    CPY $C1              ; C4 C1 | Compare Y register (zero page)
    EOR ($6A),Y          ; 51 6A | Exclusive OR with accumulator ((zero page),Y)
    ROL                  ; 2A | Rotate left (accumulator)
    INC $F8FB,X          ; FE FB F8 | Increment (absolute,X)
    BRA $3C              ; 80 3C | Branch always
    CPX #$0E             ; E0 0E | Compare X register (immediate)
    CLC                  ; 18 | Clear carry flag
    LDX $5500            ; AE 00 55 | Load from absolute address into X register
    BRA $01              ; 80 01 | Branch always
    BVS $01              ; 70 01 | Branch if overflow set
    SBC $03              ; E5 03 | Subtract with carry (zero page)
    DEC $EFEE            ; CE EE EF | Decrement (absolute)
    INC $C7C0            ; EE C0 C7 | Increment (absolute)
    CPY #$0F             ; C0 0F | Compare Y register (immediate)
    BRA $1A              ; 80 1A | Branch always
    CLC                  ; 18 | Clear carry flag
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    BPL $00              ; 10 00 | Branch if positive
    SEC                  ; 38 | Set carry flag
    ROL                  ; 2A | Rotate left (accumulator)
    INC $DFDF,X          ; FE DF DF | Increment (absolute,X)
    LDA $3A3D,Y          ; B9 3D 3A | Load from absolute,Y into accumulator
    ORA $80              ; 05 80 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    BEQ $00              ; F0 00 | Branch if equal
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0F8
; Address: $E3BFFA
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0F8:
    JSR $4600            ; 20 00 46 | Jump to subroutine
    ROR $E5              ; 66 E5 | Rotate right (zero page)
    STA                  ; 9F 90 7C 63 | Store accumulator to absolute long,X
    SED                  ; F8 | Set decimal mode flag
    LDA                  ; BF 42 FF F1 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0F9
; Address: $E3C010
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0F9:
    JSR $8AC0            ; 20 C0 8A | Jump to subroutine
    STA                  ; 9F 00 0F 00 | Store accumulator to absolute long,X
    SBC $0E00,X          ; FD 00 0E | Subtract with carry (absolute,X)
    INC $C4FF,X          ; FE FF C4 | Increment (absolute,X)
    SBC $FF62,X          ; FD 62 FF | Subtract with carry (absolute,X)
    CLD                  ; D8 | Clear decimal mode flag
    ROR $857F,X          ; 7E 7F 85 | Rotate right (absolute,X)
    DEC $FF              ; C6 FF | Decrement (zero page)
    STA $0001,X          ; 9D 01 00 | Store accumulator to absolute,X
    STA                  ; 9F 00 27 00 | Store accumulator to absolute long,X
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    PLX                  ; FA | Pull X register from stack
    LDA $6200,Y          ; B9 00 62 | Load from absolute,Y into accumulator

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0FA
; Address: $E3C042
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0FA:
    INC $F90E,X          ; FE 0E F9 | Increment (absolute,X)
    ORA $1BFB,Y          ; 19 FB 1B | Logical OR with accumulator (absolute,Y)
    LDA $BE7FFF          ; AF FF 7F BE | Load from absolute long address into accumulator
    LDX $FDFC,Y          ; BE FC FD | Load from absolute,Y into X register
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    INC $00              ; E6 00 | Increment (zero page)
    CPX $00              ; E4 00 | Compare X register (zero page)
    BVC $00              ; 50 00 | Branch if overflow clear
    BRA $00              ; 80 00 | Branch always
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    DEC $9BDE,X          ; DE DE 9B | Decrement (absolute,X)
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    AND $23F9,Y          ; 39 F9 23 | Logical AND with accumulator (absolute,Y)
    CPX $00              ; E4 00 | Compare X register (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ASL $3F              ; 06 3F | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    SBC $23FF,Y          ; F9 FF 23 | Subtract with carry (absolute,Y)
    INY                  ; C8 | Increment Y register
    BIT #$9F             ; 89 9F | Test bits in accumulator (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0FC
; Address: $E3C08A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0FC:
    BIT #$89             ; 89 89 | Test bits in accumulator (immediate)
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    ROR $E41E,X          ; 7E 1E E4 | Rotate right (absolute,X)
    STZ $FF              ; 64 FF | Store zero to zero page
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0FD
; Address: $E3C09B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0FD:
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    INC                  ; 1A | Increment accumulator
    BVC $CF              ; 50 CF | Branch if overflow clear
    TAY                  ; A8 | Transfer accumulator to Y register
    INY                  ; C8 | Increment Y register
    ASL $CC0D            ; 0E 0D CC | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0FE
; Address: $E3C0AA
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0FE:
    JSL $FBF83D          ; 22 3D F8 FB | Jump to subroutine long
    CPX $F3              ; E4 F3 | Compare X register (zero page)
    BEQ $DF              ; F0 DF | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    INC $FE0F,X          ; FE 0F FE | Increment (absolute,X)
    INC $0C3F,X          ; FE 3F 0C | Increment (absolute,X)
    BMI $11              ; 30 11 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    ROL $38B6,X          ; 3E B6 38 | Rotate left (absolute,X)
    TYA                  ; 98 | Transfer Y register to accumulator
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank46_DmaFunction_0FF
; Address: $E3C0CB
; Size: 110 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_0FF:
    BRA $06              ; 80 06 | Branch always
    STY $0E              ; 84 0E | Store Y register to zero page
    CPY $EF10            ; CC 10 EF | Compare Y register (absolute)
    CMP $C936            ; CD 36 C9 | Compare accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    ROL $FE00,X          ; 3E 00 FE | Rotate left (absolute,X)
    CMP ($07,X)          ; C1 07 | Compare accumulator ((zero page,X))
    ASL $3C07,X          ; 1E 07 3C | Arithmetic shift left (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SBC $F807,X          ; FD 07 F8 | Subtract with carry (absolute,X)
    SBC #$0C             ; E9 0C | Subtract with carry (immediate)
    ORA $0DF2            ; 0D F2 0D | Logical OR with accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    BPL $6F              ; 10 6F | Branch if positive
    BCC $6C              ; 90 6C | Branch if carry clear
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    BCS $4F              ; B0 4F | Branch if carry set
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF E0 FF E0 | Load from absolute long,X into accumulator
    BEQ $FF              ; F0 FF | Branch if equal
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    SBC ($1F,X)          ; E1 1F | Subtract with carry ((zero page,X))
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    PHP                  ; 08 | Push processor status to stack
    DEC                  ; 3A | Decrement accumulator
    CMP $FD0E            ; CD 0E FD | Compare accumulator (absolute)
    CMP #$FB             ; C9 FB | Compare accumulator (immediate)
    SBC $E7              ; E5 E7 | Subtract with carry (zero page)
    SBC $A1FF,Y          ; F9 FF A1 | Subtract with carry (absolute,Y)
    LDA ($FF,X)          ; A1 FF | Load from (zero page,X) into accumulator
    STA ($FB,X)          ; 81 FB | Store accumulator to (zero page,X)
    ORA $B3              ; 05 B3 | Logical OR with accumulator (zero page)
    JMP $FB04            ; 4C 04 FB | Jump to address
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    TXA                  ; 8A | Transfer X register to accumulator
    LDA $FFDFFF          ; AF FF DF FF | Load from absolute long address into accumulator
    INC $5DFE            ; EE FE 5D | Increment (absolute)
    INC $FCFD,X          ; FE FD FC | Increment (absolute,X)
    SBC $DFF1,Y          ; F9 F1 DF | Subtract with carry (absolute,Y)
    ROL $7B7E,X          ; 3E 7E 7B | Rotate left (absolute,X)
    PLY                  ; 7A | Pull Y register from stack
    SBC ($F1),Y          ; F1 F1 | Subtract with carry ((zero page),Y)
    TAX                  ; AA | Transfer accumulator to X register
    TAX                  ; AA | Transfer accumulator to X register
    SBC $CFFD,X          ; FD FD CF | Subtract with carry (absolute,X)
    ASL $2000            ; 0E 00 20 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_100
; Address: $E3C1B4
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_100:
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    STA $00              ; 85 00 | Store accumulator to zero page
    ASL $5500            ; 0E 00 55 | Arithmetic shift left (absolute)
    BMI $00              ; 30 00 | Branch if negative
    BRA $92              ; 80 92 | Branch always
    BMI $30              ; 30 30 | Branch if negative
    EOR $BB              ; 45 BB | Exclusive OR with accumulator (zero page)
    LDA                  ; BF BF FF FF | Load from absolute long,X into accumulator
    SBC $F9DD,X          ; FD DD F9 | Subtract with carry (absolute,X)
    ORA $006D,Y          ; 19 6D 00 | Logical OR with accumulator (absolute,Y)
    TSX                  ; BA | Transfer stack pointer to X register
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank46_DmaFunction_101
; Address: $E3C1DC
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_101:
    JSL $00E600          ; 22 00 E6 00 | Jump to subroutine long
    SBC $F0F9,Y          ; F9 F9 F0 | Subtract with carry (absolute,Y)
    SBC $F6F0,Y          ; F9 F0 F6 | Subtract with carry (absolute,Y)
    CPY #$FE             ; C0 FE | Compare Y register (immediate)
    STX $23E0            ; 8E E0 23 | Store X register to absolute address
    BRA $9C              ; 80 9C | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    STA $88FF,Y          ; 99 FF 88 | Store accumulator to absolute,Y
    STA ($00),Y          ; 91 00 | Store accumulator to (zero page),Y
    CPX $08              ; E4 08 | Compare X register (zero page)
    EOR #$3D             ; 49 3D | Exclusive OR with accumulator (immediate)
    LDY #$66             ; A0 66 | Load immediate value into Y register
    JMP ($0E00)          ; 6C 00 0E | Jump to address (absolute indirect)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_102
; Address: $E3C219
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_102:
    CLC                  ; 18 | Clear carry flag
    DEY                  ; 88 | Decrement Y register
    REP #$20             ; C2 20 | Reset processor status bits
    BVC $FF              ; 50 FF | Branch if overflow clear
    SED                  ; F8 | Set decimal mode flag
    SBC $EEF1,Y          ; F9 F1 EE | Subtract with carry (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    JMP $0C38C7          ; 5C C7 38 0C | Jump to address long
    STZ $00              ; 64 00 | Store zero to zero page
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPX $1C              ; E4 1C | Compare X register (zero page)
    BRA $11              ; 80 11 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_103
; Address: $E3C24A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_103:
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    CPY $00              ; C4 00 | Compare Y register (zero page)
    ROR $9800            ; 6E 00 98 | Rotate right (absolute)
    JMP $B800            ; 4C 00 B8 | Jump to address
    CPY #$C2             ; C0 C2 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_104
; Address: $E3C262
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_104:
    ROL                  ; 2A | Rotate left (accumulator)
    DEC                  ; 3A | Decrement accumulator
    BIT $1B2C            ; 2C 2C 1B | Test bits in accumulator (absolute)
    ROR $66              ; 66 66 | Rotate right (zero page)
    DEC                  ; 3A | Decrement accumulator
    BIT $EC              ; 24 EC | Test bits in accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    JMP $9900            ; 4C 00 99 | Jump to address
    STY $87              ; 84 87 | Store Y register to zero page
    ROL $583F,X          ; 3E 3F 58 | Rotate left (absolute,X)
    XBA                  ; EB | Exchange accumulator bytes
    INY                  ; C8 | Increment Y register
    AND $5D72,X          ; 3D 72 5D | Logical AND with accumulator (absolute,X)
    INC $FC              ; E6 FC | Increment (zero page)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_105
; Address: $E3C291
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_105:
    JSR $87FF            ; 20 FF 87 | Jump to subroutine
    LDA                  ; BF 1F 7C 78 | Load from absolute long,X into accumulator
    BVS $70              ; 70 70 | Branch if overflow set
    CPY #$4D             ; C0 4D | Compare Y register (immediate)
    BRA $B9              ; 80 B9 | Branch always
    CPY #$D7             ; C0 D7 | Compare Y register (immediate)
    CPX #$F7             ; E0 F7 | Compare X register (immediate)
    BPL $F7              ; 10 F7 | Branch if positive
    BIT $04EB            ; 2C EB 04 | Test bits in accumulator (absolute)
    CPX $93              ; E4 93 | Compare X register (zero page)
    CPX $1B              ; E4 1B | Compare X register (zero page)
    LDX $69              ; A6 69 | Load from zero page into X register
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    CPX #$EB             ; E0 EB | Compare X register (immediate)
    INY                  ; C8 | Increment Y register
    CPY #$1F             ; C0 1F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_106
; Address: $E3C2BE
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_106:
    JSL $C00497          ; 22 97 04 C0 | Jump to subroutine long
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$08             ; C0 08 | Compare Y register (immediate)
    BRA $38              ; 80 38 | Branch always
    BRA $7D              ; 80 7D | Branch always
    ROL $7F7F,X          ; 3E 7F 7F | Rotate left (absolute,X)
    ROL $73C1,X          ; 3E C1 73 | Rotate left (absolute,X)
    STY $3C00            ; 8C 00 3C | Store Y register to absolute address
    ASL $7F00,X          ; 1E 00 7F | Arithmetic shift left (absolute,X)
    STA $00FF00          ; 8F 00 FF 00 | Store accumulator to absolute long address
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    STA $030F70          ; 8F 70 0F 03 | Store accumulator to absolute long address
    SED                  ; F8 | Set decimal mode flag
    ORA $10E6,Y          ; 19 E6 10 | Logical OR with accumulator (absolute,Y)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    BRA $7F              ; 80 7F | Branch always
    STA $FFBFFF          ; 8F FF BF FF | Store accumulator to absolute long address
    SBC $F0FF,Y          ; F9 FF F0 | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_107
; Address: $E3C32C
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_107:
    BEQ $FF              ; F0 FF | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BRA $7F              ; 80 7F | Branch always
    BMI $CF              ; 30 CF | Branch if negative
    BVS $8F              ; 70 8F | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 86 79 0F | Load from absolute long,X into accumulator
    BEQ $0F              ; F0 0F | Branch if equal
    SBC $FF00,Y          ; F9 00 FF | Subtract with carry (absolute,Y)
    STY $1EFF            ; 8C FF 1E | Store Y register to absolute address
    ASL $10FF,X          ; 1E FF 10 | Arithmetic shift left (absolute,X)
    STY $1EE1            ; 8C E1 1E | Store Y register to absolute address
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    BPL $FF              ; 10 FF | Branch if positive
    BRA $FF              ; 80 FF | Branch always
    BRA $7E              ; 80 7E | Branch always
    ROR $3CFF,X          ; 7E FF 3C | Rotate right (absolute,X)
    BIT $24FF            ; 2C FF 24 | Test bits in accumulator (absolute)
    BRA $FF              ; 80 FF | Branch always
    BNE $FF              ; D0 FF | Branch if not equal
    LDA ($4E),Y          ; B1 4E | Load from (zero page),Y into accumulator
    LDA ($5E,X)          ; A1 5E | Load from (zero page,X) into accumulator
    AND $2CD3,X          ; 3D D3 2C | Logical AND with accumulator (absolute,X)
    AND $7F              ; 25 7F | Logical AND with accumulator (zero page)
    BRA $2F              ; 80 2F | Branch always
    BNE $F3              ; D0 F3 | Branch if not equal
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    AND ($FF,X)          ; 21 FF | Logical AND with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_108
; Address: $E3C389
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_108:
    STA                  ; 9F 00 FF 06 | Store accumulator to absolute long,X
    SBC $F10E,Y          ; F9 0E F1 | Subtract with carry (absolute,Y)
    INC $DED9,X          ; FE D9 DE | Increment (absolute,X)
    ADC #$FF             ; 69 FF | Add with carry (immediate)
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    BCC $FF              ; 90 FF | Branch if carry clear
    AND $71FF,Y          ; 39 FF 71 | Logical AND with accumulator (absolute,Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_109
; Address: $E3C3A5
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_109:
    BRA $FE              ; 80 FE | Branch always
    ORA $0405,X          ; 1D 05 04 | Logical OR with accumulator (absolute,X)
    BIT $E0              ; 24 E0 | Game work RAM access
    INX                  ; E8 | Increment X register
    CPY #$D8             ; C0 D8 | Compare Y register (immediate)
    STA                  ; 9F 00 7F 00 | Store accumulator to absolute long,X
    PLX                  ; FA | Pull X register from stack
    CPY #$E7             ; C0 E7 | Compare Y register (immediate)
    BPL $C1              ; 10 C1 | Branch if positive
    ROL $FC              ; 26 FC | Rotate left (zero page)
    CPX $6CFC            ; EC FC 6C | Compare X register (absolute)
    BEQ $F1              ; F0 F1 | Branch if equal

;------------------------------------------------------------------------------
; Bank46_DmaFunction_10B
; Address: $E3C3C8
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_10B:
    STX $86              ; 86 86 | Store X register to zero page
    ORA $2C0E,Y          ; 19 0E 2C | Logical OR with accumulator (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    ASL $9C00            ; 0E 00 9C | Arithmetic shift left (absolute)
    ADC $E600,Y          ; 79 00 E6 | Add with carry (absolute,Y)
    ORA $F332            ; 0D 32 F3 | Logical OR with accumulator (absolute)
    SBC ($12,X)          ; E1 12 | Subtract with carry ((zero page,X))
    TYA                  ; 98 | Transfer Y register to accumulator
    AND $D7C8,X          ; 3D C8 D7 | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_10C
; Address: $E3C3EE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_10C:
    JSR $D059            ; 20 59 D0 | Jump to subroutine
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_10D
; Address: $E3C3FC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_10D:
    JSR $8000            ; 20 00 80 | Jump to subroutine
    ASL $7E              ; 06 7E | Arithmetic shift left (zero page)
    STA ($0C,X)          ; 81 0C | Store accumulator to (zero page,X)
    SED                  ; F8 | Set decimal mode flag
    CLV                  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank46_DmaFunction_10E
; Address: $E3C408
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_10E:
    JSR $009F            ; 20 9F 00 | Jump to subroutine
    LDA                  ; BF 01 60 13 | Load from absolute long,X into accumulator
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    STZ $8800,X          ; 9E 00 88 | Store zero to absolute,X
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank46_DmaFunction_110
; Address: $E3C42A
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_110:
    JSR $E0DC            ; 20 DC E0 | Game work RAM access
    BPL $05              ; 10 05 | Branch if positive
    SBC $00              ; E5 00 | Subtract with carry (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    INC                  ; 1A | Increment accumulator
    STA $1D3F3B          ; 8F 3B 3F 1D | Store accumulator to absolute long address
    CMP $BF3F,X          ; DD 3F BF | Compare accumulator (absolute,X)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    ASL $7303,X          ; 1E 03 73 | Arithmetic shift left (absolute,X)
    BVS $00              ; 70 00 | Branch if overflow set
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_111
; Address: $E3C454
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_111:
    JSL $004000          ; 22 00 40 00 | Jump to subroutine long
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    STY $FF00            ; 8C 00 FF | Store Y register to absolute address
    INC $DEDE,X          ; FE DE DE | Increment (absolute,X)
    STA                  ; 9F 9F 3F 3F | Store accumulator to absolute long,X
    INC $FBFE,X          ; FE FE FB | Increment (absolute,X)
    ORA $2518,Y          ; 19 18 25 | Logical OR with accumulator (absolute,Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_113
; Address: $E3C47E
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_113:
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    INC $FF10,X          ; FE 10 FF | Increment (absolute,X)
    SBC ($F1),Y          ; F1 F1 | Subtract with carry ((zero page),Y)
    SEP #$E2             ; E2 E2 | Set processor status bits
    BMI $30              ; 30 30 | Branch if negative
    ADC $FF79,Y          ; 79 79 FF | Add with carry (absolute,Y)
    BRA $C5              ; 80 C5 | Branch always
    AND ($7F),Y          ; 31 7F | Logical AND with accumulator ((zero page),Y)
    STX $00              ; 86 00 | Store X register to zero page
    DEC $28              ; C6 28 | Decrement (zero page)
    ORA #$B4             ; 09 B4 | Logical OR with accumulator (immediate)
    BRA $C3              ; 80 C3 | Branch always
    ROL $26              ; 26 26 | Rotate left (zero page)
    BEQ $F2              ; F0 F2 | Branch if equal
    SEP #$FB             ; E2 FB | Set processor status bits
    BIT #$FF             ; 89 FF | Test bits in accumulator (immediate)
    ROL $0F              ; 26 0F | Rotate left (zero page)
    STX $86              ; 86 86 | Store X register to zero page
    ROR $C1FE,X          ; 7E FE C1 | Rotate right (absolute,X)
    ROR $00FF,X          ; 7E FF 00 | Rotate right (absolute,X)
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    ASL $81F1            ; 0E F1 81 | Arithmetic shift left (absolute)
    SBC $3CF9,Y          ; F9 F9 3C | Subtract with carry (absolute,Y)
    SBC $37FD,X          ; FD FD 37 | Subtract with carry (absolute,X)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    AND $F339,Y          ; 39 39 F3 | Logical AND with accumulator (absolute,Y)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    STY $0081            ; 8C 81 00 | Store Y register to absolute address
    INY                  ; C8 | Increment Y register
    LDA                  ; BF FF FE FF | Load from absolute long,X into accumulator
    BVS $70              ; 70 70 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    SBC $FFFD,X          ; FD FD FF | Subtract with carry (absolute,X)
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    BVS $8F              ; 70 8F | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    BVS $8F              ; 70 8F | Branch if overflow set
    ORA $0FE2,X          ; 1D E2 0F | Logical OR with accumulator (absolute,X)
    BEQ $CF              ; F0 CF | Branch if equal
    BEQ $C0              ; F0 C0 | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    BRA $FF              ; 80 FF | Branch always
    CLC                  ; 18 | Clear carry flag
    ROL $E7              ; 26 E7 | Rotate left (zero page)
    ADC $7E7D,X          ; 7D 7D 7E | Add with carry (absolute,X)
    ROR $FC03,X          ; 7E 03 FC | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_114
; Address: $E3C533
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_114:
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    STA ($FE,X)          ; 81 FE | Store accumulator to (zero page,X)
    BRA $FF              ; 80 FF | Branch always
    JMP $02B3            ; 4C B3 02 | Jump to address
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    BRA $FF              ; 80 FF | Branch always
    SBC $F3FF,X          ; FD FF F3 | Subtract with carry (absolute,X)
    LDA ($00,X)          ; A1 00 | Load from (zero page,X) into accumulator
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    AND ($FF,X)          ; 21 FF | Logical AND with accumulator ((zero page,X))
    ASL $C0FF,X          ; 1E FF C0 | Arithmetic shift left (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ADC ($8E),Y          ; 71 8E | Add with carry ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    INC $FCFF,X          ; FE FF FC | Increment (absolute,X)
    STX $00FF            ; 8E FF 00 | Store X register to absolute address
    BEQ $70              ; F0 70 | Branch if equal
    CPX #$26             ; E0 26 | Compare X register (immediate)
    BEQ $F2              ; F0 F2 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    CPY #$16             ; C0 16 | Compare Y register (immediate)
    SBC #$70             ; E9 70 | Subtract with carry (immediate)
    STA $F0D920          ; 8F 20 D9 F0 | Store accumulator to absolute long address
    ORA $E718            ; 0D 18 E7 | Logical OR with accumulator (absolute)
    BEQ $7F              ; F0 7F | Branch if equal
    BRA $00              ; 80 00 | Branch always
    BRA $A1              ; 80 A1 | Branch always
    SBC $20FB,Y          ; F9 FB 20 | Subtract with carry (absolute,Y)
    ROL $20              ; 26 20 | Rotate left (zero page)
    AND #$F6             ; 29 F6 | Logical AND with accumulator (immediate)
    CPY #$C9             ; C0 C9 | Compare Y register (immediate)
    BEQ $36              ; F0 36 | Branch if equal
    BRA $9E              ; 80 9E | Branch always
    RTI                  ; 40 | Return from interrupt
    SBC $2004,Y          ; F9 04 20 | Subtract with carry (absolute,Y)
    CMP $D620,Y          ; D9 20 D6 | Compare accumulator (absolute,Y)
    ORA #$C0             ; 09 C0 | Logical OR with accumulator (immediate)
    AND ($C8),Y          ; 31 C8 | Logical AND with accumulator ((zero page),Y)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SBC ($03,X)          ; E1 03 | Subtract with carry ((zero page,X))
    LDX $0404,Y          ; BE 04 04 | Load from absolute,Y into X register
    BPL $57              ; 10 57 | Branch if positive
    ASL $8820,X          ; 1E 20 88 | Arithmetic shift left (absolute,X)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    BCS $90              ; B0 90 | Branch if carry set
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank46_DmaFunction_115
; Address: $E3C5FF
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_115:
    BMI $0C              ; 30 0C | Branch if negative
    LDX $1960,Y          ; BE 60 19 | Load from absolute,Y into X register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_116
; Address: $E3C608
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_116:
    CPY #$2C             ; C0 2C | Compare Y register (immediate)
    DEY                  ; 88 | Decrement Y register
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BMI $00              ; 30 00 | Branch if negative
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    STX $00              ; 86 00 | Store X register to zero page
    STY $1300            ; 8C 00 13 | Store Y register to absolute address
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    BPL $00              ; 10 00 | Branch if positive
    STA ($18,X)          ; 81 18 | Store accumulator to (zero page,X)
    AND ($71),Y          ; 31 71 | Logical AND with accumulator ((zero page),Y)
    ASL $46              ; 06 46 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA $0EEC            ; 0D EC 0E | Logical OR with accumulator (absolute)
    DEC $007E            ; CE 7E 00 | Decrement (absolute)
    STX $B900            ; 8E 00 B9 | Store X register to absolute address
    SBC $E000,Y          ; F9 00 E0 | Game work RAM access
    ASL $0F31            ; 0E 31 0F | Arithmetic shift left (absolute)
    INC $1FFE,X          ; FE FE 1F | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_117
; Address: $E3C64A
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_117:
    JSR $0310            ; 20 10 03 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    EOR ($30,X)          ; 41 30 | Exclusive OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BRA $3E              ; 80 3E | Branch always
    BRA $FF              ; 80 FF | Branch always
    BEQ $9F              ; F0 9F | Branch if equal
    STA ($3F),Y          ; 91 3F | Store accumulator to (zero page),Y
    ADC $7B4F,Y          ; 79 4F 7B | Add with carry (absolute,Y)
    SBC $000F,X          ; FD 0F 00 | Subtract with carry (absolute,X)
    ROR $CC00            ; 6E 00 CC | Rotate right (absolute)
    BCS $00              ; B0 00 | Branch if carry set
    LDY #$00             ; A0 00 | Load immediate value into Y register
    INC $FCFE,X          ; FE FE FC | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CPX #$C7             ; E0 C7 | Compare X register (immediate)
    BRA $8F              ; 80 8F | Branch always
    RTI                  ; 40 | Return from interrupt
    CMP ($DD,X)          ; C1 DD | Compare accumulator ((zero page,X))
    ORA $0100            ; 0D 00 01 | Logical OR with accumulator (absolute)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank46_DmaFunction_119
; Address: $E3C6B6
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_119:
    JSL $004B00          ; 22 00 4B 00 | Jump to subroutine long
    INC $C300,X          ; FE 00 C3 | Increment (absolute,X)
    CPX $F4              ; E4 F4 | Compare X register (zero page)
    TSX                  ; BA | Transfer stack pointer to X register
    CLV                  ; B8 | Clear overflow flag
    LDX $A6              ; A6 A6 | Load from zero page into X register
    ORA $DC1D,X          ; 1D 1D DC | Logical OR with accumulator (absolute,X)
    CMP $FFFF,X          ; DD FF FF | Compare accumulator (absolute,X)
    STX $40CC            ; 8E CC 40 | Store X register to absolute address
    CMP $F080,Y          ; D9 80 F0 | Compare accumulator (absolute,Y)
    CPY #$E2             ; C0 E2 | Compare Y register (immediate)
    STA ($1B,X)          ; 81 1B | Store accumulator to (zero page,X)
    BIT $04              ; 24 04 | Test bits in accumulator (zero page)
    BPL $18              ; 10 18 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_11B
; Address: $E3C6F5
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_11B:
    JSR $08EF            ; 20 EF 08 | Jump to subroutine
    STA                  ; 9F 12 32 00 | Store accumulator to absolute long,X
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $0499,Y          ; 19 99 04 | Logical OR with accumulator (absolute,Y)
    LDY $04              ; A4 04 | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank46_DmaFunction_11C
; Address: $E3C706
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_11C:
    JSL $80C202          ; 22 02 C2 80 | Jump to subroutine long
    LDX $AE08,Y          ; BE 08 AE | Load from absolute,Y into X register
    INC $FF              ; E6 FF | Increment (zero page)
    LDA                  ; BF FD 3F 7F | Load from absolute long,X into accumulator
    LDA $185FFF          ; AF FF 5F 18 | Load from absolute long address into accumulator
    CLC                  ; 18 | Clear carry flag
    SBC $C04D            ; ED 4D C0 | Subtract with carry (absolute)
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_11D
; Address: $E3C730
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_11D:
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BRA $FF              ; 80 FF | Branch always
    CPY #$DF             ; C0 DF | Compare Y register (immediate)
    LDA                  ; BF FF FF FF | Load from absolute long,X into accumulator
    SBC $3EFF,X          ; FD FF 3E | Subtract with carry (absolute,X)
    BRA $83              ; 80 83 | Branch always
    CPX #$7D             ; E0 7D | Compare X register (immediate)
    ROR $7F7E,X          ; 7E 7E 7F | Rotate right (absolute,X)
    CPY #$07             ; C0 07 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SBC ($FE),Y          ; F1 FE | Subtract with carry ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    ADC $3586,X          ; 7D 86 35 | Add with carry (absolute,X)
    DEC $3EC7            ; CE C7 3E | Decrement (absolute)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_11E
; Address: $E3C76A
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_11E:
    SBC $1A              ; E5 1A | Subtract with carry (zero page)
    STY $C3              ; 84 C3 | Store Y register to zero page
    STA                  ; 9F 60 FF 00 | Store accumulator to absolute long,X
    INC $E301,X          ; FE 01 E3 | Increment (absolute,X)
    STA $7777FF          ; 8F FF 77 77 | Store accumulator to absolute long address
    BMI $CF              ; 30 CF | Branch if negative
    CPX #$E0             ; E0 E0 | Game work RAM access
    SBC ($3D,X)          ; E1 3D | Subtract with carry ((zero page,X))
    AND $7C7F,X          ; 3D 7F 7C | Logical AND with accumulator (absolute,X)
    LDA $2CD3,Y          ; B9 D3 2C | Load from absolute,Y into accumulator
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$1E             ; E0 1E | Compare X register (immediate)
    REP #$00             ; C2 00 | Reset processor status bits
    LSR $00              ; 46 00 | Logical shift right (zero page)
    STA $FBF8,X          ; 9D F8 FB | Store accumulator to absolute,X
    AND $043B,Y          ; 39 3B 04 | Logical AND with accumulator (absolute,Y)
    STA $02              ; 85 02 | Store accumulator to zero page
    CPY $2A94            ; CC 94 2A | Compare Y register (absolute)
    LDA ($CD,X)          ; A1 CD | Load from (zero page,X) into accumulator
    ORA ($A9,X)          ; 01 A9 | Logical OR with accumulator ((zero page,X))
    STZ $F862            ; 9C 62 F8 | Store zero to absolute
    SEC                  ; 38 | Set carry flag
    CPY $04              ; C4 04 | Compare Y register (zero page)
    PLY                  ; 7A | Pull Y register from stack
    ORA ($30,X)          ; 01 30 | Logical OR with accumulator ((zero page,X))
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    CLD                  ; D8 | Clear decimal mode flag
    LDA $30              ; A5 30 | Load from zero page into accumulator

;------------------------------------------------------------------------------
; Bank46_DmaFunction_11F
; Address: $E3C7E6
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_11F:
    JSR $5427            ; 20 27 54 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    EOR #$27             ; 49 27 | Exclusive OR with accumulator (immediate)
    PHY                  ; 5A | Push Y register to stack
    INY                  ; C8 | Increment Y register
    ORA ($D8,X)          ; 01 D8 | Logical OR with accumulator ((zero page,X))
    PLB                  ; AB | Pull data bank register from stack
    ADC $4D00,X          ; 7D 00 4D | Add with carry (absolute,X)
    BRA $36              ; 80 36 | Branch always
    SED                  ; F8 | Set decimal mode flag
    STA ($1E,X)          ; 81 1E | Store accumulator to (zero page,X)
    BVC $40              ; 50 40 | Branch if overflow clear
    STA $C4240F          ; 8F 0F 24 C4 | Store accumulator to absolute long address
    ORA #$60             ; 09 60 | Logical OR with accumulator (immediate)
    BCC $88              ; 90 88 | Branch if carry clear
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_120
; Address: $E3C814
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_120:
    RTI                  ; 40 | Return from interrupt
    LDA $04700F          ; AF 0F 70 04 | Load from absolute long address into accumulator
    BRA $16              ; 80 16 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_121
; Address: $E3C81E
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_121:
    BEQ $00              ; F0 00 | Branch if equal
    INC $1F7E,X          ; FE 7E 1F | Increment (absolute,X)
    ORA $080F,Y          ; 19 0F 08 | Logical OR with accumulator (absolute,Y)
    ORA #$F1             ; 09 F1 | Logical OR with accumulator (immediate)
    CPX $C100            ; EC 00 C1 | Compare X register (absolute)
    DEX                  ; CA | Decrement X register
    ROR $1901,X          ; 7E 01 19 | Rotate right (absolute,X)
    INC $08              ; E6 08 | Increment (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    BPL $03              ; 10 03 | Branch if positive
    ROL $0700,X          ; 3E 00 07 | Rotate left (absolute,X)
    INY                  ; C8 | Increment Y register
    BRA $93              ; 80 93 | Branch always
    CPY #$4C             ; C0 4C | Compare Y register (immediate)
    BRA $B8              ; 80 B8 | Branch always
    BRA $BD              ; 80 BD | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_122
; Address: $E3C850
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_122:
    SED                  ; F8 | Set decimal mode flag
    BMI $8C              ; 30 8C | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_123
; Address: $E3C856
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_123:
    RTI                  ; 40 | Return from interrupt
    BRA $47              ; 80 47 | Branch always
    WDM #$1F             ; 42 1F | Reserved instruction
    DEY                  ; 88 | Decrement Y register
    BRA $6F              ; 80 6F | Branch always
    STA                  ; 9F 0B C3 07 | Store accumulator to absolute long,X
    DEC $90DE,X          ; DE DE 90 | Decrement (absolute,X)
    BRA $E0              ; 80 E0 | Game work RAM access
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_124
; Address: $E3C878
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_124:
    CLC                  ; 18 | Clear carry flag
    BRA $7C              ; 80 7C | Branch always
    BRA $00              ; 80 00 | Branch always
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    DEC $BFDE,X          ; DE DE BF | Decrement (absolute,X)
    LDA                  ; BF FE FC FC | Load from absolute long,X into accumulator
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    SBC $73F1,Y          ; F9 F1 73 | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_125
; Address: $E3C890
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_125:
    JSR $2100            ; 20 00 21 | PPU graphics register access
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    STA $7800            ; 8D 00 78 | Store accumulator to absolute address
    SEI                  ; 78 | Set interrupt disable flag
    CMP ($D1),Y          ; D1 D1 | Compare accumulator ((zero page),Y)
    ROR $796E            ; 6E 6E 79 | Rotate right (absolute)
    AND $FBFB,Y          ; 39 FB FB | Logical AND with accumulator (absolute,Y)
    ROL $C800            ; 2E 00 C8 | Rotate left (absolute)
    STA ($00),Y          ; 91 00 | Store accumulator to (zero page),Y

;------------------------------------------------------------------------------
; Bank46_DmaFunction_126
; Address: $E3C8B8
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_126:
    DEC $00              ; C6 00 | Decrement (zero page)
    CLC                  ; 18 | Clear carry flag
    BCS $00              ; B0 00 | Branch if carry set
    ROR $FB7E,X          ; 7E 7E FB | Rotate right (absolute,X)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_127
; Address: $E3C8D6
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_127:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    INC $FFFE,X          ; FE FE FF | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    INC $FCFC,X          ; FE FC FC | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    LDA $808280          ; AF 80 82 80 | Load from absolute long address into accumulator
    ROL                  ; 2A | Rotate left (accumulator)
    BEQ $C0              ; F0 C0 | Branch if equal
    BNE $00              ; D0 00 | Branch if not equal

;------------------------------------------------------------------------------
; Bank46_DmaFunction_128
; Address: $E3C91A
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_128:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ASL $BB              ; 06 BB | Arithmetic shift left (zero page)
    LDA $80              ; A5 80 | Load from zero page into accumulator
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SBC ($F0),Y          ; F1 F0 | Subtract with carry ((zero page),Y)
    XBA                  ; EB | Exchange accumulator bytes
    INX                  ; E8 | Increment X register
    BNE $F9              ; D0 F9 | Branch if not equal
    AND $07              ; 25 07 | Logical AND with accumulator (zero page)
    ORA ($17,X)          ; 01 17 | Logical OR with accumulator ((zero page,X))
    BNE $50              ; D0 50 | Branch if not equal
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $FF              ; F0 FF | Branch if equal
    LDA $FFFFFF          ; AF FF FF FF | Load from absolute long address into accumulator
    SBC $7FF9,Y          ; F9 F9 7F | Subtract with carry (absolute,Y)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    CMP ($01,X)          ; C1 01 | Compare accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    BRA $FF              ; 80 FF | Branch always
    SBC $FEFF,Y          ; F9 FF FE | Subtract with carry (absolute,Y)
    LDA                  ; BF BF 5E 5E | Load from absolute long,X into accumulator
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDA ($FF,X)          ; A1 FF | Load from (zero page,X) into accumulator
    PLX                  ; FA | Pull X register from stack
    INC $FCF6,X          ; FE F6 FC | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_129
; Address: $E3C9A5
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_129:
    INC $FCFC,X          ; FE FC FC | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SBC #$E9             ; E9 E9 | Subtract with carry (immediate)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack
    PHB                  ; 8B | Push data bank register to stack
    ASL $1EAE            ; 0E AE 1E | Arithmetic shift left (absolute)
    ROL $FE22,X          ; 3E 22 FE | Rotate left (absolute,X)
    INC $FCFC            ; EE FC FC | Increment (absolute)
    PEA #$E7B0           ; F4 B0 E7 | Push effective address to stack
    SBC ($74,X)          ; E1 74 | Subtract with carry ((zero page,X))
    EOR ($01),Y          ; 51 01 | Exclusive OR with accumulator ((zero page),Y)
    SBC $DD00            ; ED 00 DD | Subtract with carry (absolute)
    BRA $11              ; 80 11 | Branch always
    CLC                  ; 18 | Clear carry flag
    EOR $2600,Y          ; 59 00 26 | Exclusive OR with accumulator (absolute,Y)
    ORA $3A1D,X          ; 1D 1D 3A | Logical OR with accumulator (absolute,X)
    DEC                  ; 3A | Decrement accumulator
    CPX $64              ; E4 64 | Compare X register (zero page)
    CMP $1BCD            ; CD CD 1B | Compare accumulator (absolute)
    BRA $26              ; 80 26 | Branch always
    CMP $E200,Y          ; D9 00 E2 | Compare accumulator (absolute,Y)
    CMP $C0              ; C5 C0 | Compare accumulator (zero page)
    CMP #$C1             ; C9 C1 | Compare accumulator (immediate)
    CPX $00              ; E4 00 | Compare X register (zero page)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_12A
; Address: $E3CA00
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_12A:
    JSR $3CA0            ; 20 A0 3C | Jump to subroutine
    LDA                  ; BF 33 3F 3D | Load from absolute long,X into accumulator
    LDA                  ; BF A3 FF F9 | Load from absolute long,X into accumulator
    JMP $C200            ; 4C 00 C2 | Jump to address
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    JMP $000640          ; 5C 40 06 00 | Jump to address long
    STY $07              ; 84 07 | Store Y register to zero page
    ROL $BF3F,X          ; 3E 3F BF | Rotate left (absolute,X)
    AND ($F8),Y          ; 31 F8 | Logical AND with accumulator ((zero page),Y)
    BMI $F0              ; 30 F0 | Branch if negative
    BRA $C0              ; 80 C0 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    LDA                  ; BF FF FD FF | Load from absolute long,X into accumulator
    STA $B7878F          ; 8F 8F 87 B7 | Store accumulator to absolute long address
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    BVS $00              ; 70 00 | Branch if overflow set
    PHA                  ; 48 | Push accumulator to stack
    LDY $F9BC,X          ; BC BC F9 | Load from absolute,X into Y register
    SBC $FBFB,Y          ; F9 FB FB | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_12B
; Address: $E3CA6A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_12B:
    SBC $8DFD,X          ; FD FD 8D | Subtract with carry (absolute,X)
    STA $716D            ; 8D 6D 71 | Store accumulator to absolute address
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    INC $EF              ; E6 EF | Increment (zero page)
    XBA                  ; EB | Exchange accumulator bytes
    LDA $19BA,X          ; BD BA 19 | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank46_DmaFunction_12C
; Address: $E3CA94
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_12C:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    STA                  ; 9F 1F FF FB | Store accumulator to absolute long,X
    STA $F5DF3F          ; 8F 3F DF F5 | Store accumulator to absolute long address
    SBC ($7D),Y          ; F1 7D | Subtract with carry ((zero page),Y)
    SBC $00E0,X          ; FD E0 00 | Subtract with carry (absolute,X)
    BMI $00              ; 30 00 | Branch if negative
    BVS $00              ; 70 00 | Branch if overflow set
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC $FFDE,X          ; FE DE FF | Increment (absolute,X)
    XBA                  ; EB | Exchange accumulator bytes
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    BRA $00              ; 80 00 | Branch always
    DEC $3FFF,X          ; DE FF 3F | Decrement (absolute,X)
    INC $EEFF,X          ; FE FF EE | Increment (absolute,X)
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank46_DmaFunction_12D
; Address: $E3CAF2
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_12D:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    SBC $25FF,Y          ; F9 FF 25 | Subtract with carry (absolute,Y)
    LDA $E7              ; A5 E7 | Load from zero page into accumulator
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    SED                  ; F8 | Set decimal mode flag
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BRA $00              ; 80 00 | Branch always
    LDA ($A0,X)          ; A1 A0 | Load from (zero page,X) into accumulator
    SBC ($E0,X)          ; E1 E0 | Game work RAM access
    CPX #$CA             ; E0 CA | Compare X register (immediate)
    CPY #$84             ; C0 84 | Compare Y register (immediate)
    DEY                  ; 88 | Decrement Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    BCC $81              ; 90 81 | Branch if carry clear
    BCC $00              ; 90 00 | Branch if carry clear
    BPL $5F              ; 10 5F | Branch if positive

;------------------------------------------------------------------------------
; Bank46_DmaFunction_12E
; Address: $E3CB31
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_12E:
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    ASL $0C7F            ; 0E 7F 0C | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    BPL $9F              ; 10 9F | Branch if positive
    DEC                  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank46_DmaFunction_12F
; Address: $E3CB47
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_12F:
    JSR $3175            ; 20 75 31 | Jump to subroutine
    INC $8320            ; EE 20 83 | Increment (absolute)
    CPY #$41             ; C0 41 | Compare Y register (immediate)
    REP #$FF             ; C2 FF | Reset processor status bits
    STA                  ; 9F FF 1B FF | Store accumulator to absolute long,X
    DEC $DF47            ; CE 47 DF | Decrement (absolute)
    ROL $6400,X          ; 3E 00 64 | Rotate left (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_130
; Address: $E3CB68
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_130:
    STA $1D80            ; 8D 80 1D | Store accumulator to absolute address
    INC $FC9F,X          ; FE 9F FC | Increment (absolute,X)
    SBC $FDFF,X          ; FD FF FD | Subtract with carry (absolute,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    REP #$00             ; C2 00 | Reset processor status bits
    STA $BA00            ; 8D 00 BA | Store accumulator to absolute address
    ROR $FF00,X          ; 7E 00 FF | Rotate right (absolute,X)
    INC $CF00            ; EE 00 CF | Increment (absolute)
    ROL $703E,X          ; 3E 3E 70 | Rotate left (absolute,X)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STZ $C0              ; 64 C0 | Store zero to zero page
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    PHB                  ; 8B | Push data bank register to stack
    LDA                  ; BF 00 F6 10 | Load from absolute long,X into accumulator
    CPY #$F5             ; C0 F5 | Compare Y register (immediate)
    CPY #$9B             ; C0 9B | Compare Y register (immediate)
    LDX $86              ; A6 86 | Load from zero page into X register
    LDY #$03             ; A0 03 | Load immediate value into Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    STX $30              ; 86 30 | Store X register to zero page
    SEI                  ; 78 | Set interrupt disable flag
    BVS $FF              ; 70 FF | Branch if overflow set
    EOR $5C00,Y          ; 59 00 5C | Exclusive OR with accumulator (absolute,Y)
    BVC $07              ; 50 07 | Branch if overflow clear
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($49,X)          ; 01 49 | Logical OR with accumulator ((zero page,X))
    ORA ($8F,X)          ; 01 8F | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    SEP #$00             ; E2 00 | Set processor status bits
    STA ($88,X)          ; 81 88 | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_131
; Address: $E3CBE9
; Size: 116 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_131:
    STA                  ; 9F 7F 7F FF | Store accumulator to absolute long,X
    DEC $F8FF,X          ; DE FF F8 | Decrement (absolute,X)
    ORA $0300,X          ; 1D 00 03 | Logical OR with accumulator (absolute,X)
    BEQ $87              ; F0 87 | Branch if equal
    BVS $0C              ; 70 0C | Branch if overflow set
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    DEC                  ; 3A | Decrement accumulator
    CPX #$FD             ; E0 FD | Compare X register (immediate)
    REP #$E1             ; C2 E1 | Reset processor status bits
    STZ $FD83,X          ; 9E 83 FD | Store zero to absolute,X
    ADC $00D6,Y          ; 79 D6 00 | Add with carry (absolute,Y)
    CMP $00              ; C5 00 | Compare accumulator (zero page)
    ROR $FE00,X          ; 7E 00 FE | Rotate right (absolute,X)
    SBC $FF19,Y          ; F9 19 FF | Subtract with carry (absolute,Y)
    AND ($F6),Y          ; 31 F6 | Logical AND with accumulator ((zero page),Y)
    PLP                  ; 28 | Pull processor status from stack
    INC $A8F6            ; EE F6 A8 | Increment (absolute)
    BVS $54              ; 70 54 | Branch if overflow set
    CPX #$2C             ; E0 2C | Compare X register (immediate)
    CMP ($09,X)          ; C1 09 | Compare accumulator ((zero page,X))
    INC $00              ; E6 00 | Increment (zero page)
    DEC $DF00            ; CE 00 DF | Decrement (absolute)
    ORA $D400,Y          ; 19 00 D4 | Logical OR with accumulator (absolute,Y)
    TAY                  ; A8 | Transfer accumulator to Y register
    BNE $03              ; D0 03 | Branch if not equal
    SBC ($06),Y          ; F1 06 | Subtract with carry ((zero page),Y)
    EOR #$20             ; 49 20 | Exclusive OR with accumulator (immediate)
    LDA $3FA020          ; AF 20 A0 3F | Load from absolute long address into accumulator
    LDA $607F,Y          ; B9 7F 60 | Load from absolute,Y into accumulator
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    STA $203086          ; 8F 86 30 20 | Store accumulator to absolute long address
    BVC $20              ; 50 20 | Branch if overflow clear
    AND $6046,Y          ; 39 46 60 | Logical AND with accumulator (absolute,Y)
    STA                  ; 9F C1 3E 00 | Store accumulator to absolute long,X
    STA $887070          ; 8F 70 70 88 | Store accumulator to absolute long address
    BVS $48              ; 70 48 | Branch if overflow set
    CPX #$AC             ; E0 AC | Compare X register (immediate)
    CMP ($CD,X)          ; C1 CD | Compare accumulator ((zero page,X))
    SBC ($E5,X)          ; E1 E5 | Subtract with carry ((zero page,X))
    INX                  ; E8 | Increment X register
    SBC #$07             ; E9 07 | Subtract with carry (immediate)
    LDY #$A3             ; A0 A3 | Load immediate value into Y register
    BVC $E0              ; 50 E0 | Game work RAM access
    BPL $C2              ; 10 C2 | Branch if positive
    BMI $C0              ; 30 C0 | Branch if negative
    SEC                  ; 38 | Set carry flag
    SEP #$18             ; E2 18 | Set processor status bits

;------------------------------------------------------------------------------
; Bank46_DmaFunction_132
; Address: $E3CC7E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_132:
    NOP                  ; EA | No operation
    AND $E3FF,Y          ; 39 FF E3 | Logical AND with accumulator (absolute,Y)
    STA                  ; 9F FF 87 FF | Store accumulator to absolute long,X
    INC $01              ; E6 01 | Increment (zero page)
    EOR #$30             ; 49 30 | Exclusive OR with accumulator (immediate)
    DEC $00              ; C6 00 | Decrement (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_133
; Address: $E3CC96
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_133:
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $00              ; F0 00 | Branch if equal
    ORA $8600,Y          ; 19 00 86 | Logical OR with accumulator (absolute,Y)
    BMI $30              ; 30 30 | Branch if negative
    PHA                  ; 48 | Push accumulator to stack
    CPY #$FE             ; C0 FE | Compare Y register (immediate)
    STX $A3E7            ; 8E E7 A3 | Store X register to absolute address
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    REP #$3F             ; C2 3F | Reset processor status bits
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    CLI                  ; 58 | Clear interrupt disable flag
    SBC $FD00,Y          ; F9 00 FD | Subtract with carry (absolute,Y)
    AND $FF00,X          ; 3D 00 FF | Logical AND with accumulator (absolute,X)
    LDA                  ; BF 7F 6F F7 | Load from absolute long,X into accumulator
    SBC $F118,Y          ; F9 18 F1 | Subtract with carry (absolute,Y)
    ORA ($F7,X)          ; 01 F7 | Logical OR with accumulator ((zero page,X))
    SBC $0005,X          ; FD 05 00 | Subtract with carry (absolute,X)
    BRA $00              ; 80 00 | Branch always
    PLA                  ; 68 | Pull accumulator from stack
    INC $00              ; E6 00 | Increment (zero page)
    INC $F800,X          ; FE 00 F8 | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    SBC $F3FF,X          ; FD FF F3 | Subtract with carry (absolute,X)
    ROR $FC7E,X          ; 7E 7E FC | Rotate right (absolute,X)
    BEQ $F1              ; F0 F1 | Branch if equal
    CPX $E3              ; E4 E3 | Compare X register (zero page)
    CPY #$C7             ; C0 C7 | Compare Y register (immediate)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    ASL $1800            ; 0E 00 18 | Arithmetic shift left (absolute)
    SEC                  ; 38 | Set carry flag
    ASL $9F0E            ; 0E 0E 9F | Arithmetic shift left (absolute)
    ASL $381E,X          ; 1E 1E 38 | Arithmetic shift left (absolute,X)
    SEC                  ; 38 | Set carry flag
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BMI $00              ; 30 00 | Branch if negative
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    STY $838C            ; 8C 8C 83 | Store Y register to absolute address
    CLV                  ; B8 | Clear overflow flag
    DEY                  ; 88 | Decrement Y register
    ASL $6000            ; 0E 00 60 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_134
; Address: $E3CD30
; Size: 116 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_134:
    SBC $7330,X          ; FD 30 73 | Subtract with carry (absolute,X)
    STA ($89,X)          ; 81 89 | Store accumulator to (zero page,X)
    INC $F3FE,X          ; FE FE F3 | Increment (absolute,X)
    BRA $0E              ; 80 0E | Branch always
    CPY $0EC0            ; CC C0 0E | Compare Y register (absolute)
    SBC ($E0,X)          ; E1 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INC $FF88,X          ; FE 88 FF | Increment (absolute,X)
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    INC $FC3F,X          ; FE 3F FC | Increment (absolute,X)
    INC $FF1F,X          ; FE 1F FF | Increment (absolute,X)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    BMI $00              ; 30 00 | Branch if negative
    LDA                  ; BF 04 FF 04 | Load from absolute long,X into accumulator
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    BEQ $9F              ; F0 9F | Branch if equal
    STX $2E00            ; 8E 00 2E | Store X register to absolute address
    JMP $4400            ; 4C 00 44 | Jump to address
    STX $2EFF            ; 8E FF 2E | Store X register to absolute address
    JMP $44FF            ; 4C FF 44 | Jump to address
    BRA $83              ; 80 83 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    EOR ($5D,X)          ; 41 5D | Exclusive OR with accumulator ((zero page,X))
    PHB                  ; 8B | Push data bank register to stack
    STX $86              ; 86 86 | Store X register to zero page
    AND $9C3D,X          ; 3D 3D 9C | Logical AND with accumulator (absolute,X)
    LDX #$00             ; A2 00 | Load immediate value into X register
    BPL $FD              ; 10 FD | Branch if positive
    ADC $C200,Y          ; 79 00 C2 | Add with carry (absolute,Y)
    CMP $FFFF,Y          ; D9 FF FF | Compare accumulator (absolute,Y)
    LDA                  ; BF BC 7F 7C | Load from absolute long,X into accumulator
    INC $FF              ; E6 FF | Increment (zero page)
    CPX $FF              ; E4 FF | Compare X register (zero page)
    SBC $00F3,Y          ; F9 F3 00 | Subtract with carry (absolute,Y)
    ROL $00              ; 26 00 | Rotate left (zero page)
    ORA $1B00,Y          ; 19 00 1B | Logical OR with accumulator (absolute,Y)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    STY $CF              ; 84 CF | Store Y register to zero page
    BCS $CF              ; B0 CF | Branch if carry set
    AND ($FF),Y          ; 31 FF | Logical AND with accumulator ((zero page),Y)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank46_DmaFunction_135
; Address: $E3CDF8
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_135:
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INY                  ; C8 | Increment Y register
    STA                  ; 9F FE 9C FE | Store accumulator to absolute long,X
    ROR $FCFC,X          ; 7E FC FC | Rotate right (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BCS $00              ; B0 00 | Branch if carry set
    BCS $00              ; B0 00 | Branch if carry set
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_136
; Address: $E3CE1C
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_136:
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    CMP ($D1,X)          ; C1 D1 | Compare accumulator ((zero page,X))
    CPY #$CE             ; C0 CE | Compare Y register (immediate)
    CPX #$3E             ; E0 3E | Compare X register (immediate)
    BRA $98              ; 80 98 | Branch always
    ORA ($C5,X)          ; 01 C5 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    AND ($0E,X)          ; 21 0E | Logical AND with accumulator ((zero page,X))
    BMI $01              ; 30 01 | Branch if negative
    CPY #$01             ; C0 01 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_137
; Address: $E3CE3A
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_137:
    CPY #$43             ; C0 43 | Compare Y register (immediate)
    ORA ($3A,X)          ; 01 3A | Logical OR with accumulator ((zero page,X))
    ROR $FC7E,X          ; 7E 7E FC | Rotate right (absolute,X)
    STY $FF              ; 84 FF | Store Y register to zero page
    CPY #$F7             ; C0 F7 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    BRA $7E              ; 80 7E | Branch always
    STA ($DC,X)          ; 81 DC | Store accumulator to (zero page,X)
    STY $7B              ; 84 7B | Store Y register to zero page
    SED                  ; F8 | Set decimal mode flag
    CPX #$E8             ; E0 E8 | Compare X register (immediate)
    STA ($A1,X)          ; 81 A1 | Store accumulator to (zero page,X)
    LSR $7D7F,X          ; 5E 7F 7D | Logical shift right (absolute,X)
    CPX #$17             ; E0 17 | Compare X register (immediate)
    PHB                  ; 8B | Push data bank register to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_138
; Address: $E3CE76
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_138:
    STA ($5E,X)          ; 81 5E | Store accumulator to (zero page,X)
    BEQ $5E              ; F0 5E | Branch if equal
    LDA ($7D,X)          ; A1 7D | Load from (zero page,X) into accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_139
; Address: $E3CE81
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_139:
    ADC ($C0,X)          ; 61 C0 | Add with carry ((zero page,X))
    CPY #$B0             ; C0 B0 | Compare Y register (immediate)
    BCS $FC              ; B0 FC | Branch if carry set
    SBC $3DFC,X          ; FD FC 3D | Subtract with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    ADC $F3F0,Y          ; 79 F0 F3 | Add with carry (absolute,Y)
    CPY #$C7             ; C0 C7 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_13B
; Address: $E3CE99
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_13B:
    REP #$78             ; C2 78 | Reset processor status bits
    STX $F0              ; 86 F0 | Store X register to zero page
    CPY #$38             ; C0 38 | Compare Y register (immediate)
    CPX $FF7F            ; EC 7F FF | Compare X register (absolute)
    EOR $7B7F,X          ; 5D 7F 7B | Exclusive OR with accumulator (absolute,X)
    TYA                  ; 98 | Transfer Y register to accumulator
    CLV                  ; B8 | Clear overflow flag
    LDX #$00             ; A2 00 | Load immediate value into X register
    STY $00              ; 84 00 | Store Y register to zero page
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    SBC $F7F9,Y          ; F9 F9 F7 | Subtract with carry (absolute,Y)
    DEC $FCDE,X          ; DE DE FC | Decrement (absolute,X)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    TXA                  ; 8A | Transfer X register to accumulator
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    LDA                  ; BF BF FD FD | Load from absolute long,X into accumulator
    BMI $75              ; 30 75 | Branch if negative
    BMI $EB              ; 30 EB | Branch if negative
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank46_DmaFunction_13C
; Address: $E3CEFA
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_13C:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    BRA $98              ; 80 98 | Branch always
    ORA ($39,X)          ; 01 39 | Logical OR with accumulator ((zero page,X))
    ORA ($C1,X)          ; 01 C1 | Logical OR with accumulator ((zero page,X))
    STA                  ; 9F 07 47 00 | Store accumulator to absolute long,X
    PHP                  ; 08 | Push processor status to stack
    ASL $C0              ; 06 C0 | Arithmetic shift left (zero page)
    BNE $60              ; D0 60 | Branch if not equal
    CMP ($06,X)          ; C1 06 | Compare accumulator ((zero page,X))
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_13D
; Address: $E3CF19
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_13D:
    SEC                  ; 38 | Set carry flag
    BEQ $07              ; F0 07 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    DEC $BFFF            ; CE FF BF | Decrement (absolute)
    SBC $F1B9,Y          ; F9 B9 F1 | Subtract with carry (absolute,Y)
    BEQ $F4              ; F0 F4 | Branch if equal
    CPY #$C7             ; C0 C7 | Compare Y register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    DEC $BF31            ; CE 31 BF | Decrement (absolute)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank46_DmaFunction_13E
; Address: $E3CF38
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_13E:
    LDA $F146,Y          ; B9 46 F1 | Load from absolute,Y into accumulator
    PHP                  ; 08 | Push processor status to stack
    BEQ $0B              ; F0 0B | Branch if equal
    CPY #$38             ; C0 38 | Compare Y register (immediate)
    AND $FCFC,X          ; 3D FC FC | Logical AND with accumulator (absolute,X)
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    BRA $80              ; 80 80 | Branch always
    REP #$FC             ; C2 FC | Reset processor status bits
    INY                  ; C8 | Increment Y register
    BRA $7F              ; 80 7F | Branch always
    INY                  ; C8 | Increment Y register
    BIT $7800            ; 2C 00 78 | Test bits in accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    BEQ $02              ; F0 02 | Branch if equal
    LDY #$37             ; A0 37 | Load immediate value into Y register
    CPY #$07             ; C0 07 | Compare Y register (immediate)
    BRA $07              ; 80 07 | Branch always
    BEQ $0F              ; F0 0F | Branch if equal
    CPX #$0F             ; E0 0F | Compare X register (immediate)
    ADC $5F00,X          ; 7D 00 5F | Add with carry (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    STA ($00),Y          ; 91 00 | Store accumulator to (zero page),Y
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $80              ; 05 80 | Logical OR with accumulator (zero page)
    STA $FE              ; 85 FE | Store accumulator to zero page
    ROR $FE00            ; 6E 00 FE | Rotate right (absolute)
    INC $FA00,X          ; FE 00 FA | Increment (absolute,X)
    PLY                  ; 7A | Pull Y register from stack
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    ORA ($D5),Y          ; 11 D5 | Logical OR with accumulator ((zero page),Y)
    DEC $03              ; C6 03 | Decrement (zero page)
    STA                  ; 9F 9F 87 84 | Store accumulator to absolute long,X
    BRA $00              ; 80 00 | Branch always
    BMI $00              ; 30 00 | Branch if negative
    ROL                  ; 2A | Rotate left (accumulator)
    AND $F800,Y          ; 39 00 F8 | Logical AND with accumulator (absolute,Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_13F
; Address: $E3CFC3
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_13F:
    STZ $F8F8,X          ; 9E F8 F8 | Store zero to absolute,X
    BEQ $F0              ; F0 F0 | Branch if equal
    LDA                  ; BF F7 9E F2 | Load from absolute long,X into accumulator
    PEA #$FAF8           ; F4 F8 FA | Push effective address to stack
    BPL $61              ; 10 61 | Branch if positive
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    ORA $0B00            ; 0D 00 0B | Logical OR with accumulator (absolute)
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank46_DmaFunction_140
; Address: $E3CFE1
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_140:
    AND $21E1,Y          ; 39 E1 21 | PPU graphics register access
    CPY #$CC             ; C0 CC | Compare Y register (immediate)
    INC                  ; 1A | Increment accumulator
    BPL $00              ; 10 00 | Branch if positive
    ORA ($F1,X)          ; 01 F1 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    DEC $00              ; C6 00 | Decrement (zero page)
    DEC $3300,X          ; DE 00 33 | Decrement (absolute,X)
    SBC ($64,X)          ; E1 64 | Subtract with carry ((zero page,X))
    SBC ($6E,X)          ; E1 6E | Subtract with carry ((zero page,X))
    BEQ $00              ; F0 00 | Branch if equal
    ASL $0700            ; 0E 00 07 | Arithmetic shift left (absolute)
    CPX #$FE             ; E0 FE | Compare X register (immediate)
    DEC $B2F6,X          ; DE F6 B2 | Decrement (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_142
; Address: $E3D006
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_142:
    JSR $0003            ; 20 03 00 | Jump to subroutine
    TYA                  ; 98 | Transfer Y register to accumulator
    DEC $D6              ; C6 D6 | Decrement (zero page)
    AND ($21,X)          ; 21 21 | PPU graphics register access
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    STZ $DC05,X          ; 9E 05 DC | Store zero to absolute,X
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_143
; Address: $E3D01C
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_143:
    ROL $09              ; 26 09 | Rotate left (zero page)
    CPY #$1E             ; C0 1E | Compare Y register (immediate)
    STZ $9C1F            ; 9C 1F 9C | Store zero to absolute
    BMI $00              ; 30 00 | Branch if negative
    STA $1C631C          ; 8F 1C 63 1C | Store accumulator to absolute long address
    CLD                  ; D8 | Clear decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    INY                  ; C8 | Increment Y register
    BVS $00              ; 70 00 | Branch if overflow set
    INC $98FF,X          ; FE FF 98 | Increment (absolute,X)
    TYA                  ; 98 | Transfer Y register to accumulator
    BRA $83              ; 80 83 | Branch always
    ORA ($1D,X)          ; 01 1D | Logical OR with accumulator ((zero page,X))
    ORA #$19             ; 09 19 | Logical OR with accumulator (immediate)
    INC $9800,X          ; FE 00 98 | Increment (absolute,X)
    BRA $7C              ; 80 7C | Branch always
    CPX #$06             ; E0 06 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$08             ; E0 08 | Compare X register (immediate)
    CPY #$08             ; C0 08 | Compare Y register (immediate)
    SEC                  ; 38 | Set carry flag
    CLV                  ; B8 | Clear overflow flag
    BRA $00              ; 80 00 | Branch always
    ADC ($80,X)          ; 61 80 | Add with carry ((zero page,X))
    BRA $9C              ; 80 9C | Branch always
    SBC ($81,X)          ; E1 81 | Subtract with carry ((zero page,X))
    INC $F79E,X          ; FE 9E F7 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_144
; Address: $E3D070
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_144:
    SEC                  ; 38 | Set carry flag
    BRA $1E              ; 80 1E | Branch always
    EOR ($0C,X)          ; 41 0C | Exclusive OR with accumulator ((zero page,X))
    ROR $6100,X          ; 7E 00 61 | Rotate right (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ROL $C000,X          ; 3E 00 C0 | Rotate left (absolute,X)
    STA                  ; 9F 3F BF 3D | Store accumulator to absolute long,X
    AND $3333,X          ; 3D 33 33 | Logical AND with accumulator (absolute,X)
    INC $01              ; E6 01 | Increment (zero page)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_145
; Address: $E3D096
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_145:
    RTI                  ; 40 | Return from interrupt
    REP #$00             ; C2 00 | Reset processor status bits
    CPY $0800            ; CC 00 08 | Compare Y register (absolute)
    CLC                  ; 18 | Clear carry flag
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$E7             ; E0 E7 | Compare X register (immediate)
    CPY #$C8             ; C0 C8 | Compare Y register (immediate)
    BRA $B8              ; 80 B8 | Branch always
    SEC                  ; 38 | Set carry flag
    BRA $00              ; 80 00 | Branch always
    BPL $10              ; 10 10 | Branch if positive
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))
    BMI $07              ; 30 07 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    CPY #$07             ; C0 07 | Compare Y register (immediate)
    SBC ($F1),Y          ; F1 F1 | Subtract with carry ((zero page),Y)
    DEC                  ; 3A | Decrement accumulator
    BVS $23              ; 70 23 | Branch if overflow set
    ASL $DC00            ; 0E 00 DC | Arithmetic shift left (absolute)
    BEQ $80              ; F0 80 | Branch if equal
    BPL $00              ; 10 00 | Branch if positive
    CPX #$05             ; E0 05 | Compare X register (immediate)
    CPY #$0F             ; C0 0F | Compare Y register (immediate)
    BRA $7D              ; 80 7D | Branch always
    ADC $D7F7,X          ; 7D F7 D7 | Add with carry (absolute,X)
    STA                  ; 9F FD 1D FF | Store accumulator to absolute long,X
    PLP                  ; 28 | Pull processor status from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_146
; Address: $E3D0F6
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_146:
    SEP #$02             ; E2 02 | Set processor status bits
    CLC                  ; 18 | Clear carry flag
    BEQ $20              ; F0 20 | Branch if equal
    CMP $C000            ; CD 00 C0 | Compare accumulator (absolute)
    CMP ($C8,X)          ; C1 C8 | Compare accumulator ((zero page,X))
    CMP ($86,X)          ; C1 86 | Compare accumulator ((zero page,X))
    TYA                  ; 98 | Transfer Y register to accumulator
    STY $BA              ; 84 BA | Store Y register to zero page
    ORA ($0D,X)          ; 01 0D | Logical OR with accumulator ((zero page,X))
    AND ($49),Y          ; 31 49 | Logical AND with accumulator ((zero page),Y)
    BMI $0E              ; 30 0E | Branch if negative

;------------------------------------------------------------------------------
; Bank46_DmaFunction_147
; Address: $E3D112
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_147:
    BMI $06              ; 30 06 | Branch if negative
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    STX $00              ; 86 00 | Store X register to zero page
    STZ $3000            ; 9C 00 30 | Store zero to absolute
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    BRA $83              ; 80 83 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    ASL $031E,X          ; 1E 1E 03 | Arithmetic shift left (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_148
; Address: $E3D133
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_148:
    CPY #$0E             ; C0 0E | Compare Y register (immediate)
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    BVS $00              ; 70 00 | Branch if overflow set
    REP #$00             ; C2 00 | Reset processor status bits
    ASL $F800            ; 0E 00 F8 | Arithmetic shift left (absolute)
    BMI $00              ; 30 00 | Branch if negative
    BRA $0F              ; 80 0F | Branch always
    AND $FC00,X          ; 3D 00 FC | Logical AND with accumulator (absolute,X)
    ORA ($F0,X)          ; 01 F0 | Logical OR with accumulator ((zero page,X))
    ASL $E6              ; 06 E6 | Arithmetic shift left (zero page)
    ASL $3E8E            ; 0E 8E 3E | Arithmetic shift left (absolute)
    ROL $3434,X          ; 3E 34 34 | Rotate left (absolute,X)
    ADC $4848,X          ; 7D 48 48 | Add with carry (absolute,X)
    STA $1900,X          ; 9D 00 19 | Store accumulator to absolute,X
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    PHB                  ; 8B | Push data bank register to stack
    BRA $88              ; 80 88 | Branch always
    BRA $8A              ; 80 8A | Branch always
    CPY #$D1             ; C0 D1 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    EOR $40              ; 45 40 | Exclusive OR with accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    JMP $0400            ; 4C 00 04 | Jump to address
    ROL $BA00            ; 2E 00 BA | Rotate left (absolute)
    PLB                  ; AB | Pull data bank register from stack
    PHP                  ; 08 | Push processor status to stack
    SBC ($0C,X)          ; E1 0C | Subtract with carry ((zero page,X))
    ORA ($38,X)          ; 01 38 | Logical OR with accumulator ((zero page,X))
    ORA ($25,X)          ; 01 25 | Logical OR with accumulator ((zero page,X))
    PLX                  ; FA | Pull X register from stack
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    CPY #$D0             ; C0 D0 | Compare Y register (immediate)
    INC $C71A,X          ; FE 1A C7 | Increment (absolute,X)
    REP #$18             ; C2 18 | Reset processor status bits
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ASL $00C0,X          ; 1E C0 00 | Arithmetic shift left (absolute,X)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_149
; Address: $E3D1BD
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_149:
    CLD                  ; D8 | Clear decimal mode flag
    INC                  ; 1A | Increment accumulator
    SBC $E0              ; E5 E0 | Game work RAM access
    STZ $80              ; 64 80 | Store zero to zero page
    STA $00              ; 85 00 | Store accumulator to zero page
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    STA $00BD00          ; 8F 00 BD 00 | Store accumulator to absolute long address
    SBC ($0E,X)          ; E1 0E | Subtract with carry ((zero page,X))
    ROL $C707            ; 2E 07 C7 | Rotate left (absolute)
    TYA                  ; 98 | Transfer Y register to accumulator
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $06              ; F0 06 | Branch if equal
    BVS $10              ; 70 10 | Branch if overflow set
    WDM #$00             ; 42 00 | Reserved instruction
    ASL $1100,X          ; 1E 00 11 | Arithmetic shift left (absolute,X)
    CPY #$38             ; C0 38 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    EOR $0C00,X          ; 5D 00 0C | Exclusive OR with accumulator (absolute,X)
    BMI $30              ; 30 30 | Branch if negative
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    PLA                  ; 68 | Pull accumulator from stack
    WDM #$A2             ; 42 A2 | Reserved instruction
    BMI $CF              ; 30 CF | Branch if negative
    SEC                  ; 38 | Set carry flag
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    BPL $83              ; 10 83 | Branch if positive
    LDA $13C000          ; AF 00 C0 13 | Load from absolute long address into accumulator
    ORA ($89,X)          ; 01 89 | Logical OR with accumulator ((zero page,X))
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_14A
; Address: $E3D20B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_14A:
    JSL $900C10          ; 22 10 0C 90 | Jump to subroutine long
    DEY                  ; 88 | Decrement Y register
    RTI                  ; 40 | Return from interrupt
    BPL $3F              ; 10 3F | Branch if positive
    BIT $7680            ; 2C 80 76 | Test bits in accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    CMP ($1C,X)          ; C1 1C | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank46_DmaFunction_14B
; Address: $E3D220
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_14B:
    JSR $402F            ; 20 2F 40 | Jump to subroutine
    JMP $9B83            ; 4C 83 9B | Jump to address
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    SBC ($E1,X)          ; E1 E1 | Subtract with carry ((zero page,X))
    ROR $66              ; 66 66 | Rotate right (zero page)
    SEP #$A2             ; E2 A2 | Set processor status bits
    BNE $00              ; D0 00 | Branch if not equal
    STZ $00              ; 64 00 | Store zero to zero page
    ASL $A400,X          ; 1E 00 A4 | Arithmetic shift left (absolute,X)
    STA $5D00,Y          ; 99 00 5D | Store accumulator to absolute,Y
    ASL $BFBF,X          ; 1E BF BF | Arithmetic shift left (absolute,X)
    LDA                  ; BF BC DF DC | Load from absolute long,X into accumulator
    ROR $7D7E,X          ; 7E 7E 7D | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_14C
; Address: $E3D24F
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_14C:
    ADC $00E1,X          ; 7D E1 00 | Add with carry (absolute,X)
    RTI                  ; 40 | Return from interrupt
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    SBC ($61,X)          ; E1 61 | Subtract with carry ((zero page,X))
    CPX #$EE             ; E0 EE | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $8C              ; 80 8C | Branch always
    PHP                  ; 08 | Push processor status to stack
    STZ $1100,X          ; 9E 00 11 | Store zero to absolute,X
    LDY #$0C             ; A0 0C | Load immediate value into Y register
    DEC $82DC,X          ; DE DC 82 | Decrement (absolute,X)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$C3             ; C0 C3 | Compare Y register (immediate)
    CPY #$DF             ; C0 DF | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    BPL $01              ; 10 01 | Branch if positive
    ADC ($21,X)          ; 61 21 | PPU graphics register access
    ADC $1F00,X          ; 7D 00 1F | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_14D
; Address: $E3D298
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_14D:
    JSR $B000            ; 20 00 B0 | Jump to subroutine
    ASL $E0              ; 06 E0 | Game work RAM access
    STA ($1E,X)          ; 81 1E | Store accumulator to (zero page,X)
    ORA $3000            ; 0D 00 30 | Logical OR with accumulator (absolute)
    BRA $0E              ; 80 0E | Branch always
    ASL $BC3C            ; 0E 3C BC | Arithmetic shift left (absolute)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $0D              ; F0 0D | Branch if equal
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    LDA $801E,Y          ; B9 1E 80 | Load from absolute,Y into accumulator
    SED                  ; F8 | Set decimal mode flag
    ORA ($F8,X)          ; 01 F8 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    STY $7B              ; 84 7B | Store Y register to zero page
    AND $0046,Y          ; 39 46 00 | Logical AND with accumulator (absolute,Y)
    CMP ($20,X)          ; C1 20 | Compare accumulator ((zero page,X))
    LDA $3FA020          ; AF 20 A0 3F | Load from absolute long address into accumulator
    LDA $607F,Y          ; B9 7F 60 | Load from absolute,Y into accumulator
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    STA $20300E          ; 8F 0E 30 20 | Store accumulator to absolute long address
    BVC $20              ; 50 20 | Branch if overflow clear
    AND $6046,Y          ; 39 46 60 | Logical AND with accumulator (absolute,Y)
    STA                  ; 9F C1 3E 00 | Store accumulator to absolute long,X
    STA $887070          ; 8F 70 70 88 | Store accumulator to absolute long address
    BVS $48              ; 70 48 | Branch if overflow set
    CPX #$AC             ; E0 AC | Compare X register (immediate)
    CPX #$EC             ; E0 EC | Compare X register (immediate)
    CPY #$CC             ; C0 CC | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_14E
; Address: $E3D30A
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_14E:
    CPY #$C6             ; C0 C6 | Compare Y register (immediate)
    CPX #$E3             ; E0 E3 | Compare X register (immediate)
    INX                  ; E8 | Increment X register
    XBA                  ; EB | Exchange accumulator bytes
    LDY #$A3             ; A0 A3 | Load immediate value into Y register
    BVC $E3              ; 50 E3 | Branch if overflow clear
    BPL $C3              ; 10 C3 | Branch if positive
    BMI $C1              ; 30 C1 | Branch if negative
    SEC                  ; 38 | Set carry flag
    CPX #$1C             ; E0 1C | Compare X register (immediate)
    INX                  ; E8 | Increment X register
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    ORA $7800,Y          ; 19 00 78 | Logical OR with accumulator (absolute,Y)
    STY $3730            ; 8C 30 37 | Store Y register to absolute address
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    INC $00              ; E6 00 | Increment (zero page)
    BVS $30              ; 70 30 | Branch if overflow set
    INY                  ; C8 | Increment Y register
    STA $85              ; 85 85 | Store accumulator to zero page
    STX $86              ; 86 86 | Store X register to zero page
    PHA                  ; 48 | Push accumulator to stack
    STY $00              ; 84 00 | Store Y register to zero page
    LSR $00              ; 46 00 | Logical shift right (zero page)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    CPY $007A            ; CC 7A 00 | Compare Y register (absolute)
    ADC $8700,Y          ; 79 00 87 | Add with carry (absolute,Y)
    BMI $03              ; 30 03 | Branch if negative
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    STA ($38,X)          ; 81 38 | Store accumulator to (zero page,X)
    STA ($38,X)          ; 81 38 | Store accumulator to (zero page,X)
    BMI $C8              ; 30 C8 | Branch if negative
    DEX                  ; CA | Decrement X register
    INY                  ; C8 | Increment Y register
    DEX                  ; CA | Decrement X register
    INY                  ; C8 | Increment Y register
    DEC $8E88            ; CE 88 8E | Decrement (absolute)
    LDY #$A4             ; A0 A4 | Load immediate value into Y register
    ROL $7B00,X          ; 3E 00 7B | Rotate left (absolute,X)
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    BRA $04              ; 80 04 | Branch always
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank46_DmaFunction_14F
; Address: $E3D384
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_14F:
    JSL $222222          ; 22 22 22 22 | Jump to subroutine long
    LDY $A4              ; A4 A4 | Load from zero page into Y register
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_150
; Address: $E3D38C
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_150:
    RTI                  ; 40 | Return from interrupt
    CLI                  ; 58 | Clear interrupt disable flag
    BPL $C1              ; 10 C1 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    CMP $DD00,X          ; DD 00 DD | Compare accumulator (absolute,X)
    INC $F01E,X          ; FE 1E F0 | Increment (absolute,X)
    SBC ($C0),Y          ; F1 C0 | Subtract with carry ((zero page),Y)
    CPX #$EC             ; E0 EC | Compare X register (immediate)
    BRA $88              ; 80 88 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_151
; Address: $E3D3AD
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_151:
    SEC                  ; 38 | Set carry flag
    ASL $F0E1,X          ; 1E E1 F0 | Arithmetic shift left (absolute,X)
    ASL $B840            ; 0E 40 B8 | Arithmetic shift left (absolute)
    BPL $87              ; 10 87 | Branch if positive
    BVS $1F              ; 70 1F | Branch if overflow set
    BRA $07              ; 80 07 | Branch always
    CPY #$88             ; C0 88 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    ORA ($E1,X)          ; 01 E1 | Logical OR with accumulator ((zero page,X))
    BNE $07              ; D0 07 | Branch if not equal
    SBC $6B0F            ; ED 0F 6B | Subtract with carry (absolute)
    JMP ($5E61)          ; 6C 61 5E | Jump to address (absolute indirect)
    LSR $96F0            ; 4E F0 96 | Logical shift right (absolute)
    ASL $0F00,X          ; 1E 00 0F | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_152
; Address: $E3D3D3
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_152:
    JSR $1002            ; 20 02 10 | Jump to subroutine
    STZ $B100,X          ; 9E 00 B1 | Store zero to absolute,X
    PLA                  ; 68 | Pull accumulator from stack
    ORA ($D3,X)          ; 01 D3 | Logical OR with accumulator ((zero page,X))
    STA $81              ; 85 81 | Store accumulator to zero page
    INC $00EF,X          ; FE EF 00 | Increment (absolute,X)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    ASL $38              ; 06 38 | Arithmetic shift left (zero page)
    LDA $7E7E,Y          ; B9 7E 7E | Load from absolute,Y into accumulator
    ROR $EC00,X          ; 7E 00 EC | Rotate right (absolute,X)
    BPL $00              ; 10 00 | Branch if positive
    STA ($38,X)          ; 81 38 | Store accumulator to (zero page,X)
    ORA ($F8,X)          ; 01 F8 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    LSR $7E              ; 46 7E | Logical shift right (zero page)
    STA ($E7,X)          ; 81 E7 | Store accumulator to (zero page,X)
    CLC                  ; 18 | Clear carry flag
    STA ($99,X)          ; 81 99 | Store accumulator to (zero page,X)
    BPL $04              ; 10 04 | Branch if positive
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    STX $6F60            ; 8E 60 6F | Store X register to absolute address
    BEQ $F1              ; F0 F1 | Branch if equal
    ROR $00              ; 66 00 | Rotate right (zero page)
    DEC $8500,X          ; DE 00 85 | Decrement (absolute,X)
    BMI $01              ; 30 01 | Branch if negative

;------------------------------------------------------------------------------
; Bank46_DmaFunction_153
; Address: $E3D41B
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_153:
    BVS $60              ; 70 60 | Branch if overflow set
    BCC $F0              ; 90 F0 | Branch if carry clear
    ASL $8B8B            ; 0E 8B 8B | Arithmetic shift left (absolute)
    ROL $1C3E,X          ; 3E 3E 1C | Rotate left (absolute,X)
    DEC $74              ; C6 74 | Decrement (zero page)
    CPX $E800            ; EC 00 E8 | Compare X register (absolute)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_154
; Address: $E3D436
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_154:
    JSR $C100            ; 20 00 C1 | Jump to subroutine
    STZ $3900            ; 9C 00 39 | Store zero to absolute
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $F6              ; F0 F6 | Branch if equal
    BRA $9C              ; 80 9C | Branch always
    CLD                  ; D8 | Clear decimal mode flag
    ASL $C6              ; 06 C6 | Arithmetic shift left (zero page)
    STY $0007            ; 8C 07 00 | Store Y register to absolute address
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    SBC ($08,X)          ; E1 08 | Subtract with carry ((zero page,X))
    BRA $10              ; 80 10 | Branch always
    ASL $39              ; 06 39 | Arithmetic shift left (zero page)
    ADC $647C,X          ; 7D 7C 64 | Add with carry (absolute,X)
    SBC $7EE9,Y          ; F9 E9 7E | Subtract with carry (absolute,Y)
    ROR $DE1E,X          ; 7E 1E DE | Rotate right (absolute,X)
    STY $04              ; 84 04 | Store Y register to zero page
    BVS $10              ; 70 10 | Branch if overflow set
    SBC ($82,X)          ; E1 82 | Subtract with carry ((zero page,X))
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    BRA $0E              ; 80 0E | Branch always
    EOR ($09,X)          ; 41 09 | Exclusive OR with accumulator ((zero page,X))
    CPY #$38             ; C0 38 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_155
; Address: $E3D48D
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_155:
    STA $074F4F          ; 8F 4F 4F 07 | Store accumulator to absolute long address
    CLC                  ; 18 | Clear carry flag
    LDA ($06),Y          ; B1 06 | Load from (zero page),Y into accumulator
    BRA $1F              ; 80 1F | Branch always
    BVS $4F              ; 70 4F | Branch if overflow set
    BCS $BC              ; B0 BC | Branch if carry set
    LDY $C7FF,X          ; BC FF C7 | Load from absolute,X into Y register
    STA $70FCFC          ; 8F FC FC 70 | Store accumulator to absolute long address
    CPX #$E6             ; E0 E6 | Compare X register (immediate)
    BRA $84              ; 80 84 | Branch always
    BRA $A0              ; 80 A0 | Branch always
    LDY $C743,X          ; BC 43 C7 | Load from absolute,X into Y register
    SEC                  ; 38 | Set carry flag
    STA $03FC70          ; 8F 70 FC 03 | Store accumulator to absolute long address
    BVS $8C              ; 70 8C | Branch if overflow set
    SBC ($18,X)          ; E1 18 | Subtract with carry ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    STA                  ; 9F 40 3F 37 | Store accumulator to absolute long,X
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank46_DmaFunction_157
; Address: $E3D4C6
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_157:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_158
; Address: $E3D4CE
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_158:
    ORA ($61,X)          ; 01 61 | Logical OR with accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank46_DmaFunction_159
; Address: $E3D4D6
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_159:
    JSR $00DF            ; 20 DF 00 | Jump to subroutine
    BRA $1F              ; 80 1F | Branch always
    STA ($1E,X)          ; 81 1E | Store accumulator to (zero page,X)
    ROL $7C3E,X          ; 3E 3E 7C | Rotate left (absolute,X)
    JMP $FF84FC          ; 5C FC 84 FF | Jump to address long
    CPY #$F7             ; C0 F7 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    BRA $3E              ; 80 3E | Branch always
    CMP ($5C,X)          ; C1 5C | Compare accumulator ((zero page,X))
    STY $7B              ; 84 7B | Store Y register to zero page
    SED                  ; F8 | Set decimal mode flag
    CPX #$E0             ; E0 E0 | Game work RAM access
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    SBC ($E0,X)          ; E1 E0 | Game work RAM access
    ADC $7E81,X          ; 7D 81 7E | Add with carry (absolute,X)
    BEQ $5F              ; F0 5F | Branch if equal
    LDY #$73             ; A0 73 | Load immediate value into Y register
    STY $1EE1            ; 8C E1 1E | Store Y register to absolute address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_15B
; Address: $E3D522
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_15B:
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    SBC $E0FF,Y          ; F9 FF E0 | Game work RAM access
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BRA $FF              ; 80 FF | Branch always
    BVC $60              ; 50 60 | Branch if overflow clear
    STA                  ; 9F C1 3E 33 | Store accumulator to absolute long,X
    CPY $06F9            ; CC F9 06 | Compare Y register (absolute)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BRA $7F              ; 80 7F | Branch always
    BVC $AF              ; 50 AF | Branch if overflow clear
    CLC                  ; 18 | Clear carry flag
    BPL $40              ; 10 40 | Branch if positive
    CPX #$EF             ; E0 EF | Compare X register (immediate)
    CPX #$68             ; E0 68 | Compare X register (immediate)
    CPX #$62             ; E0 62 | Compare X register (immediate)
    BEQ $70              ; F0 70 | Branch if equal
    INC $073E,X          ; FE 3E 07 | Increment (absolute,X)
    CPX #$0F             ; E0 0F | Compare X register (immediate)
    CPX #$44             ; E0 44 | Compare X register (immediate)
    LDY #$E0             ; A0 E0 | Game work RAM access
    BPL $60              ; 10 60 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_15C
; Address: $E3D55B
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_15C:
    STA $8F70,X          ; 9D 70 8F | Store accumulator to absolute,X
    ROL $00C1,X          ; 3E C1 00 | Rotate left (absolute,X)
    BMI $00              ; 30 00 | Branch if negative
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$01             ; C0 01 | Compare Y register (immediate)
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    ASL $C0              ; 06 C0 | Arithmetic shift left (zero page)
    ASL $0380,X          ; 1E 80 03 | Arithmetic shift left (absolute,X)
    CPX #$01             ; E0 01 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BIT #$89             ; 89 89 | Test bits in accumulator (immediate)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    PEA #$6400           ; F4 00 64 | Push effective address to stack
    BEQ $00              ; F0 00 | Branch if equal
    ROL $3F              ; 26 3F | Rotate left (zero page)
    BEQ $B5              ; F0 B5 | Branch if equal
    DEC $3F21,X          ; DE 21 3F | Decrement (absolute,X)
    DEC $F3FE            ; CE FE F3 | Decrement (absolute)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    STY $00              ; 84 00 | Store Y register to zero page
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $6400            ; 0D 00 64 | Logical OR with accumulator (absolute)
    PLX                  ; FA | Pull X register from stack
    CPY #$FC             ; C0 FC | Compare Y register (immediate)
    PLP                  ; 28 | Pull processor status from stack
    CMP $6A21,Y          ; D9 21 6A | Compare accumulator (absolute,Y)
    EOR $98              ; 45 98 | Exclusive OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    SED                  ; F8 | Set decimal mode flag
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    SEC                  ; 38 | Set carry flag
    REP #$1D             ; C2 1D | Reset processor status bits
    STA ($06),Y          ; 91 06 | Store accumulator to (zero page),Y
    JMP ($6BA4)          ; 6C A4 6B | Jump to address (absolute indirect)
    TSX                  ; BA | Transfer stack pointer to X register
    PEA #$104F           ; F4 4F 10 | Push effective address to stack
    PLA                  ; 68 | Pull accumulator from stack
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    PLA                  ; 68 | Pull accumulator from stack
    BPL $FF              ; 10 FF | Branch if positive
    BPL $FF              ; 10 FF | Branch if positive
    EOR ($FF,X)          ; 41 FF | Exclusive OR with accumulator ((zero page,X))
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank46_DmaFunction_15D
; Address: $E3D601
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_15D:
    ROR $0C              ; 66 0C | Rotate right (zero page)
    ORA $8C4A,Y          ; 19 4A 8C | Logical OR with accumulator (absolute,Y)
    TYA                  ; 98 | Transfer Y register to accumulator
    ADC $E8              ; 65 E8 | Add with carry (zero page)
    EOR ($84,X)          ; 41 84 | Exclusive OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ROL $01              ; 26 01 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_15E
; Address: $E3D612
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_15E:
    JSL $FF01FF          ; 22 FF 01 FF | Jump to subroutine long
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STY $FF              ; 84 FF | Store Y register to zero page
    PHP                  ; 08 | Push processor status to stack
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    BPL $14              ; 10 14 | Branch if positive
    ORA $0006,Y          ; 19 06 00 | Logical OR with accumulator (absolute,Y)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($11,X)          ; 01 11 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    LDA #$A8             ; A9 A8 | Load immediate value into accumulator
    INC $19              ; E6 19 | Increment (zero page)
    PLY                  ; 7A | Pull Y register from stack
    LDY #$42             ; A0 42 | Hardware register operation
    STA ($84),Y          ; 91 84 | Store accumulator to (zero page),Y
    DEX                  ; CA | Decrement X register
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 00 FF 01 | Load from absolute long,X into accumulator
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    WDM #$7F             ; 42 7F | Reserved instruction
    STY $7F              ; 84 7F | Store Y register to zero page
    ASL $0609            ; 0E 09 06 | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    ORA ($12,X)          ; 01 12 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    TYA                  ; 98 | Transfer Y register to accumulator
    ROR $0C              ; 66 0C | Rotate right (zero page)
    ORA $0CCA,Y          ; 19 CA 0C | Logical OR with accumulator (absolute,Y)
    TYA                  ; 98 | Transfer Y register to accumulator
    AND $E8              ; 25 E8 | Logical AND with accumulator (zero page)
    EOR ($C4,X)          ; 41 C4 | Exclusive OR with accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register
    LDX $01              ; A6 01 | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank46_DmaFunction_15F
; Address: $E3D692
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_15F:
    JSL $7F81FF          ; 22 FF 81 7F | Jump to subroutine long
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    AND ($A1,X)          ; 21 A1 | Logical AND with accumulator ((zero page,X))
    STZ $256F            ; 9C 6F 25 | Store zero to absolute
    DEC $F4              ; C6 F4 | Decrement (zero page)
    PLP                  ; 28 | Pull processor status from stack
    BPL $B5              ; 10 B5 | Branch if positive
    STY $E3              ; 84 E3 | Store Y register to zero page
    CPX #$5E             ; E0 5E | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SBC $A2FC,X          ; FD FC A2 | Subtract with carry (absolute,X)
    SBC ($55,X)          ; E1 55 | Subtract with carry ((zero page,X))
    INY                  ; C8 | Increment Y register
    SEC                  ; 38 | Set carry flag
    CPX #$C7             ; E0 C7 | Compare X register (immediate)
    INC                  ; 1A | Increment accumulator
    ASL $1C44,X          ; 1E 44 1C | Arithmetic shift left (absolute,X)
    SEC                  ; 38 | Set carry flag
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ROL $3F              ; 26 3F | Rotate left (zero page)
    BEQ $C5              ; F0 C5 | Branch if equal
    STX $31              ; 86 31 | Store X register to zero page
    CPY $FAF8            ; CC F8 FA | Compare Y register (absolute)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    STY $00              ; 84 00 | Store Y register to zero page
    SEC                  ; 38 | Set carry flag
    ADC $C000,Y          ; 79 00 C0 | Add with carry (absolute,Y)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    STZ $FA              ; 64 FA | Store zero to zero page
    CLD                  ; D8 | Clear decimal mode flag
    BIT $CF              ; 24 CF | Test bits in accumulator (zero page)
    CMP $6A21,Y          ; D9 21 6A | Compare accumulator (absolute,Y)
    CMP $98              ; C5 98 | Compare accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    ORA ($26,X)          ; 01 26 | Logical OR with accumulator ((zero page,X))
    CMP ($95,X)          ; C1 95 | Compare accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    LSR                  ; 4A | Logical shift right (accumulator)
    ORA ($88,X)          ; 01 88 | Logical OR with accumulator ((zero page,X))
    ROL $28              ; 26 28 | Rotate left (zero page)
    CPY $C8              ; C4 C8 | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_161
; Address: $E3D734
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_161:
    JSL $FF24FF          ; 22 FF 24 FF | Jump to subroutine long
    EOR ($FF),Y          ; 51 FF | Exclusive OR with accumulator ((zero page),Y)
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    CPY #$3C             ; C0 3C | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_162
; Address: $E3D747
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_162:
    INC $C8D3            ; EE D3 C8 | Increment (absolute)
    LDA $90              ; A5 90 | Load from zero page into accumulator
    STX $38              ; 86 38 | Store X register to zero page
    CPY $13              ; C4 13 | Compare Y register (zero page)
    DEY                  ; 88 | Decrement Y register
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ASL $6E02            ; 0E 02 6E | Arithmetic shift left (absolute)
    JMP ($252E)          ; 6C 2E 25 | Jump to address (absolute indirect)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BVS $01              ; 70 01 | Branch if overflow set
    ORA ($5B,X)          ; 01 5B | Logical OR with accumulator ((zero page,X))
    LDY #$1B             ; A0 1B | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_164
; Address: $E3D787
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_164:
    INC $4853            ; EE 53 48 | Increment (absolute)
    LDA $10              ; A5 10 | Load from zero page into accumulator
    STX $38              ; 86 38 | Store X register to zero page
    CPY $7F              ; C4 7F | Compare Y register (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    STA ($7F,X)          ; 81 7F | Store accumulator to (zero page,X)
    PLP                  ; 28 | Pull processor status from stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ASL $0B04            ; 0E 04 0B | Arithmetic shift left (absolute)
    ASL $10              ; 06 10 | Arithmetic shift left (zero page)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    ORA ($11,X)          ; 01 11 | Logical OR with accumulator ((zero page,X))
    ORA ($40,X)          ; 01 40 | Logical OR with accumulator ((zero page,X))
    CPY #$3C             ; C0 3C | Compare Y register (immediate)
    CPX #$2E             ; E0 2E | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_165
; Address: $E3D7C9
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_165:
    PHA                  ; 48 | Push accumulator to stack
    LDA $90              ; A5 90 | Load from zero page into accumulator
    ASL $38              ; 06 38 | Arithmetic shift left (zero page)
    LDY $D3              ; A4 D3 | Load from zero page into Y register
    DEY                  ; 88 | Decrement Y register
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    CMP ($3F),Y          ; D1 3F | Compare accumulator ((zero page),Y)
    STY $7F              ; 84 7F | Store Y register to zero page
    PHP                  ; 08 | Push processor status to stack
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ROL                  ; 2A | Rotate left (accumulator)
    ORA ($10),Y          ; 11 10 | Logical OR with accumulator ((zero page),Y)
    ROL $0A13            ; 2E 13 0A | Rotate left (absolute)
    ADC $6A00,Y          ; 79 00 6A | Add with carry (absolute,Y)
    LSR $5A              ; 46 5A | Logical shift right (zero page)
    ADC $BF              ; 65 BF | Add with carry (zero page)
    LDY $3564            ; AC 64 35 | Load from absolute address into Y register
    BIT $03              ; 24 03 | Test bits in accumulator (zero page)
    AND ($06),Y          ; 31 06 | Logical AND with accumulator ((zero page),Y)
    BIT $1B              ; 24 1B | Test bits in accumulator (zero page)
    BPL $0B              ; 10 0B | Branch if positive
    BRA $08              ; 80 08 | Branch always
    RTI                  ; 40 | Return from interrupt
    LSR                  ; 4A | Logical shift right (accumulator)
    TYA                  ; 98 | Transfer Y register to accumulator
    ROR $0C              ; 66 0C | Rotate right (zero page)
    ORA $8C4A,Y          ; 19 4A 8C | Logical OR with accumulator (absolute,Y)
    TYA                  ; 98 | Transfer Y register to accumulator
    ADC $E8              ; 65 E8 | Add with carry (zero page)
    EOR ($04,X)          ; 41 04 | Exclusive OR with accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register
    LDX $01              ; A6 01 | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank46_DmaFunction_166
; Address: $E3D812
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_166:
    JSL $FF01FF          ; 22 FF 01 FF | Jump to subroutine long
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHA                  ; 48 | Push accumulator to stack
    PLP                  ; 28 | Pull processor status from stack
    STA $BC0F73          ; 8F 73 0F BC | Store accumulator to absolute long address
    BRA $D4              ; 80 D4 | Branch always
    BPL $1D              ; 10 1D | Branch if positive
    CPX #$77             ; E0 77 | Compare X register (immediate)
    LDA $CADC,X          ; BD DC CA | Load from absolute,X into accumulator
    SBC ($35),Y          ; F1 35 | Subtract with carry ((zero page),Y)
    INY                  ; C8 | Increment Y register
    SED                  ; F8 | Set decimal mode flag
    TXS                  ; 9A | Transfer X register to stack pointer
    ASL $9C44,X          ; 1E 44 9C | Arithmetic shift left (absolute,X)
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank46_DmaFunction_167
; Address: $E3D85A
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_167:
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CMP ($1E,X)          ; C1 1E | Compare accumulator ((zero page,X))
    BCC $00              ; 90 00 | Branch if carry clear
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ADC #$A1             ; 69 A1 | Add with carry (immediate)
    ROR $B837            ; 6E 37 B8 | Rotate right (absolute)
    DEC                  ; 3A | Decrement accumulator
    BEQ $4F              ; F0 4F | Branch if equal
    JMP ($0085)          ; 6C 85 00 | Jump to address (absolute indirect)
    JMP ($10FF)          ; 6C FF 10 | Jump to address (absolute indirect)
    BPL $FF              ; 10 FF | Branch if positive
    RTI                  ; 40 | Return from interrupt
    LDY #$FC             ; A0 FC | Load immediate value into Y register
    SED                  ; F8 | Set decimal mode flag
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    INY                  ; C8 | Increment Y register
    BVC $9E              ; 50 9E | Branch if overflow clear
    PHY                  ; 5A | Push Y register to stack
    LDX $FD              ; A6 FD | Load from zero page into X register
    ROL $AC              ; 26 AC | Rotate left (zero page)
    BIT $C0              ; 24 C0 | Test bits in accumulator (zero page)
    STY $2460            ; 8C 60 24 | Store Y register to absolute address
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank46_DmaFunction_169
; Address: $E3D89D
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_169:
    JSR $0052            ; 20 52 00 | Jump to subroutine
    ORA $0F04            ; 0D 04 0F | Logical OR with accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($0D,X)          ; 01 0D | Logical OR with accumulator ((zero page,X))
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    ORA ($0B,X)          ; 01 0B | Logical OR with accumulator ((zero page,X))
    ORA ($12,X)          ; 01 12 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    CLD                  ; D8 | Clear decimal mode flag
    ROL $CC              ; 26 CC | Rotate left (zero page)
    LDA #$AA             ; A9 AA | Load immediate value into accumulator
    JMP ($95C0)          ; 6C C0 95 | Jump to address (absolute indirect)
    CPX #$42             ; E0 42 | Hardware register operation
    EOR ($84,X)          ; 41 84 | Exclusive OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ROL $01              ; 26 01 | Rotate left (zero page)
    LDA                  ; BF 02 1F 81 | Load from absolute long,X into accumulator
    STA                  ; 9F 3D C7 1A | Store accumulator to absolute long,X
    STY $FF              ; 84 FF | Store Y register to zero page
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank46_DmaFunction_16A
; Address: $E3D8E0
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_16A:
    BCC $67              ; 90 67 | Branch if carry clear
    CPY #$9C             ; C0 9C | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_16B
; Address: $E3D8E7
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_16B:
    DEC $0893            ; CE 93 08 | Decrement (absolute)
    LDA $90              ; A5 90 | Load from zero page into accumulator
    STX $38              ; 86 38 | Store X register to zero page
    DEY                  ; 88 | Decrement Y register
    AND ($DF,X)          ; 21 DF | Logical AND with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    CPY $3F              ; C4 3F | Compare Y register (zero page)
    PHA                  ; 48 | Push accumulator to stack
    LDA                  ; BF 41 BF A8 | Load from absolute long,X into accumulator
    INY                  ; C8 | Increment Y register
    EOR $C3              ; 45 C3 | Exclusive OR with accumulator (zero page)
    EOR ($01,X)          ; 41 01 | Exclusive OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    BRA $C1              ; 80 C1 | Branch always
    JMP $209C            ; 4C 9C 20 | Jump to address
    PHA                  ; 48 | Push accumulator to stack
    TSX                  ; BA | Transfer stack pointer to X register
    BVS $B3              ; 70 B3 | Branch if overflow set
    PHP                  ; 08 | Push processor status to stack
    LDX $19              ; A6 19 | Load from zero page into X register
    LDX $3B              ; A6 3B | Load from zero page into X register
    ORA $0380            ; 0D 80 03 | Logical OR with accumulator (absolute)
    ORA ($C4,X)          ; 01 C4 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    EOR $53              ; 45 53 | Exclusive OR with accumulator (zero page)
    EOR #$01             ; 49 01 | Exclusive OR with accumulator (immediate)
    CLI                  ; 58 | Clear interrupt disable flag
    LDY #$F1             ; A0 F1 | Load immediate value into Y register
    BIT $00FC            ; 2C FC 00 | Test bits in accumulator (absolute)
    PLA                  ; 68 | Pull accumulator from stack
    TXS                  ; 9A | Transfer X register to stack pointer
    BVS $3B              ; 70 3B | Branch if overflow set
    ROL $01              ; 26 01 | Rotate left (zero page)
    LDX $23              ; A6 23 | Load from zero page into X register
    ORA $0380            ; 0D 80 03 | Logical OR with accumulator (absolute)
    ORA ($C4,X)          ; 01 C4 | Logical OR with accumulator ((zero page,X))
    ORA ($49,X)          ; 01 49 | Logical OR with accumulator ((zero page,X))
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    CMP ($96,X)          ; C1 96 | Compare accumulator ((zero page,X))
    EOR $4E              ; 45 4E | Exclusive OR with accumulator (zero page)
    BIT #$20             ; 89 20 | Test bits in accumulator (immediate)
    AND $C9C1            ; 2D C1 C9 | Logical AND with accumulator (absolute)
    CPY $A2              ; C4 A2 | Compare Y register (zero page)
    BVC $C1              ; 50 C1 | Branch if overflow clear
    INC $FB04,X          ; FE 04 FB | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_16C
; Address: $E3D954
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_16C:
    JSR $20FF            ; 20 FF 20 | Jump to subroutine
    SBC $FD32,X          ; FD 32 FD | Subtract with carry (absolute,X)
    ORA $12FE            ; 0D FE 12 | Logical OR with accumulator (absolute)
    LDX #$C2             ; A2 C2 | Load immediate value into X register
    BRA $02              ; 80 02 | Branch always
    ORA ($83,X)          ; 01 83 | Logical OR with accumulator ((zero page,X))
    ROL $3932            ; 2E 32 39 | Rotate left (absolute)
    EOR $0E4C,X          ; 5D 4C 0E | Exclusive OR with accumulator (absolute,X)
    STZ $98              ; 64 98 | Store zero to zero page
    ADC $DC              ; 65 DC | Add with carry (zero page)
    JMP $01B0            ; 4C B0 01 | Jump to address
    CPY #$C3             ; C0 C3 | Compare Y register (immediate)
    BRA $23              ; 80 23 | Branch always
    BRA $92              ; 80 92 | Branch always
    CPX #$38             ; E0 38 | Compare X register (immediate)
    AND ($66,X)          ; 21 66 | Logical AND with accumulator ((zero page,X))
    EOR ($55),Y          ; 51 55 | Exclusive OR with accumulator ((zero page),Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_16D
; Address: $E3D986
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_16D:
    LSR                  ; 4A | Logical shift right (accumulator)
    AND ($28,X)          ; 21 28 | Logical AND with accumulator ((zero page,X))
    STZ $50              ; 64 50 | Store zero to zero page
    RTI                  ; 40 | Return from interrupt
    BVS $49              ; 70 49 | Branch if overflow set
    NOP                  ; EA | No operation
    STZ $00              ; 64 00 | Store zero to zero page
    STY $1F              ; 84 1F | Store Y register to zero page
    ORA $0BB7,X          ; 1D B7 0B | Logical OR with accumulator (absolute,X)
    TSX                  ; BA | Transfer stack pointer to X register
    ORA $99              ; 05 99 | Logical OR with accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_16E
; Address: $E3D9A7
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_16E:
    INC $C8D3            ; EE D3 C8 | Increment (absolute)
    LDA $90              ; A5 90 | Load from zero page into accumulator
    STX $38              ; 86 38 | Store X register to zero page
    CPY $13              ; C4 13 | Compare Y register (zero page)
    DEY                  ; 88 | Decrement Y register
    STA ($7F,X)          ; 81 7F | Store accumulator to (zero page,X)
    PHP                  ; 08 | Push processor status to stack
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    ROL $1466,X          ; 3E 66 14 | Rotate left (absolute,X)
    AND ($53),Y          ; 31 53 | Logical AND with accumulator ((zero page),Y)
    AND ($4D),Y          ; 31 4D | Logical AND with accumulator ((zero page),Y)
    ASL $0C2D,X          ; 1E 2D 0C | Arithmetic shift left (absolute,X)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ADC #$00             ; 69 00 | Add with carry (immediate)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_16F
; Address: $E3D9D4
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_16F:
    JMP ($7E00)          ; 6C 00 7E | Jump to address (absolute indirect)
    ROL $3F00,X          ; 3E 00 3F | Rotate left (absolute,X)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    INC $56C0            ; EE C0 56 | Increment (absolute)
    LDY $FC              ; A4 FC | Load from zero page into Y register
    ASL $11D2            ; 0E D2 11 | Arithmetic shift left (absolute)
    LDX $917C,Y          ; BE 7C 91 | Load from absolute,Y into X register
    ROR $DF2E,X          ; 7E 2E DF | Rotate right (absolute,X)
    DEC $7F              ; C6 7F | Decrement (zero page)
    AND ($5E),Y          ; 31 5E | Logical AND with accumulator ((zero page),Y)
    SBC ($08),Y          ; F1 08 | Subtract with carry ((zero page),Y)
    INC $C300            ; EE 00 C3 | Increment (absolute)
    PHA                  ; 48 | Push accumulator to stack
    EOR $43              ; 45 43 | Exclusive OR with accumulator (zero page)
    EOR ($01,X)          ; 41 01 | Exclusive OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    BRA $C1              ; 80 C1 | Branch always
    DEX                  ; CA | Decrement X register
    DEC                  ; 3A | Decrement accumulator
    ROL $19              ; 26 19 | Rotate left (zero page)
    LDX $3B              ; A6 3B | Load from zero page into X register
    ORA $1FE0            ; 0D E0 1F | Logical OR with accumulator (absolute)
    STA $7F              ; 85 7F | Store accumulator to zero page
    BRA $7F              ; 80 7F | Branch always
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BCC $67              ; 90 67 | Branch if carry clear
    CPY #$9C             ; C0 9C | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_170
; Address: $E3DA27
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_170:
    DEC $0893            ; CE 93 08 | Decrement (absolute)
    LDA $D0              ; A5 D0 | Load from zero page into accumulator
    STX $78              ; 86 78 | Store X register to zero page
    DEY                  ; 88 | Decrement Y register
    AND ($DF,X)          ; 21 DF | Logical AND with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    CPY $3F              ; C4 3F | Compare Y register (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    ASL $0C00            ; 0E 00 0C | Arithmetic shift left (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PEA #$8871           ; F4 71 88 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank46_DmaFunction_171
; Address: $E3DA64
; Size: 110 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_171:
    NOP                  ; EA | No operation
    LDX #$8C             ; A2 8C | Load immediate value into X register
    CPY #$2A             ; C0 2A | Compare Y register (immediate)
    CPY $97              ; C4 97 | Compare Y register (zero page)
    SBC #$51             ; E9 51 | Subtract with carry (immediate)
    ADC $53EB,Y          ; 79 EB 53 | Add with carry (absolute,Y)
    STA $00CF00          ; 8F 00 CF 00 | Store accumulator to absolute long address
    CMP $7F00,X          ; DD 00 7F | Compare accumulator (absolute,X)
    ROR $FE00,X          ; 7E 00 FE | Rotate right (absolute,X)
    PEA #$6F26           ; F4 26 6F | Push effective address to stack
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ADC #$00             ; 69 00 | Add with carry (immediate)
    BIT $CE              ; 24 CE | Test bits in accumulator (zero page)
    ORA #$C6             ; 09 C6 | Logical OR with accumulator (immediate)
    CLV                  ; B8 | Clear overflow flag
    JMP ($44F5)          ; 6C F5 44 | Jump to address (absolute indirect)
    LDA $3E              ; A5 3E | Load from zero page into accumulator
    CPY $587F            ; CC 7F 58 | Compare Y register (absolute)
    BEQ $01              ; F0 01 | Branch if equal
    ORA ($D6,X)          ; 01 D6 | Logical OR with accumulator ((zero page,X))
    ORA ($9A,X)          ; 01 9A | Logical OR with accumulator ((zero page,X))
    ORA ($BF,X)          ; 01 BF | Logical OR with accumulator ((zero page,X))
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    LSR $DAE2,X          ; 5E E2 DA | Logical shift right (absolute,X)
    INC $F4              ; E6 F4 | Increment (zero page)
    CPY $CCB4            ; CC B4 CC | Compare Y register (absolute)
    JMP $FAECF8          ; 5C F8 EC FA | Jump to address long
    INC $001E            ; EE 1E 00 | Increment (absolute)
    ASL $3C00,X          ; 1E 00 3C | Arithmetic shift left (absolute,X)
    STY $8C00            ; 8C 00 8C | Store Y register to absolute address
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    STA ($04),Y          ; 91 04 | Store accumulator to (zero page),Y
    ORA #$6A             ; 09 6A | Logical OR with accumulator (immediate)
    LDY $6A              ; A4 6A | Load from zero page into Y register
    PLB                  ; AB | Pull data bank register from stack
    LSR $6911            ; 4E 11 69 | Logical shift right (absolute)
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ROR                  ; 6A | Rotate right (accumulator)
    SED                  ; F8 | Set decimal mode flag
    CPY $DC23            ; CC 23 DC | Compare Y register (absolute)
    TYA                  ; 98 | Transfer Y register to accumulator
    ROL $9C              ; 26 9C | Rotate left (zero page)
    ORA #$6A             ; 09 6A | Logical OR with accumulator (immediate)
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    CMP $A314,Y          ; D9 14 A3 | Compare accumulator (absolute,Y)
    SEC                  ; 38 | Set carry flag
    ORA $4136            ; 0D 36 41 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_172
; Address: $E3DB12
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_172:
    LDX #$7F             ; A2 7F | Load immediate value into X register
    STA ($7F,X)          ; 81 7F | Store accumulator to (zero page,X)
    SEP #$1F             ; E2 1F | Set processor status bits
    TAX                  ; AA | Transfer accumulator to X register
    SED                  ; F8 | Set decimal mode flag
    EOR $1239,X          ; 5D 39 12 | Exclusive OR with accumulator (absolute,X)
    ASL $15              ; 06 15 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL $0E08,X          ; 1E 08 0E | Arithmetic shift left (absolute,X)
    ASL $10              ; 06 10 | Arithmetic shift left (zero page)
    PLY                  ; 7A | Pull Y register from stack
    ORA $1800,Y          ; 19 00 18 | Logical OR with accumulator (absolute,Y)
    BPL $01              ; 10 01 | Branch if positive
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    ORA ($11,X)          ; 01 11 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $33              ; 10 33 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank46_DmaFunction_173
; Address: $E3DB60
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_173:
    JSR $A030            ; 20 30 A0 | Jump to subroutine
    JMP $3378AA          ; 5C AA 78 33 | Jump to address long
    BEQ $F8              ; F0 F8 | Branch if equal
    JMP $BF43            ; 4C 43 BF | Jump to address
    PHA                  ; 48 | Push accumulator to stack
    BEQ $00              ; F0 00 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_174
; Address: $E3DB8A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_174:
    CLI                  ; 58 | Clear interrupt disable flag
    LDA $9B              ; A5 9B | Load from zero page into accumulator
    BRA $00              ; 80 00 | Branch always
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    ROR $3800,X          ; 7E 00 38 | Rotate right (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    PEA #$0C12           ; F4 12 0C | Push effective address to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_175
; Address: $E3DBAF
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_175:
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    BMI $00              ; 30 00 | Branch if negative
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC $00              ; E6 00 | Increment (zero page)
    DEX                  ; CA | Decrement X register
    INC $760A,X          ; FE 0A 76 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_176
; Address: $E3DBC4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_176:
    JSL $DEB25E          ; 22 5E B2 DE | Jump to subroutine long
    STZ $480C            ; 9C 0C 48 | Store zero to absolute
    DEY                  ; 88 | Decrement Y register
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank46_DmaFunction_177
; Address: $E3DBCF
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_177:
    SEC                  ; 38 | Set carry flag
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    STZ $BE00,X          ; 9E 00 BE | Store zero to absolute,X
    ROL $3C00,X          ; 3E 00 3C | Rotate left (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    ASL $3000            ; 0E 00 30 | Arithmetic shift left (absolute)
    DEC $89              ; C6 89 | Decrement (zero page)
    LSR $4D              ; 46 4D | Logical shift right (zero page)
    ORA ($A2,X)          ; 01 A2 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    AND ($DE,X)          ; 21 DE | Logical AND with accumulator ((zero page,X))
    PEA #$A2E9           ; F4 E9 A2 | Push effective address to stack
    BEQ $1F              ; F0 1F | Branch if equal
    INX                  ; E8 | Increment X register
    BEQ $26              ; F0 26 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$0B             ; E0 0B | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDY $90              ; A4 90 | Load from zero page into Y register
    CLI                  ; 58 | Clear interrupt disable flag
    BIT $9311            ; 2C 11 93 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_178
; Address: $E3DC0B
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_178:
    JSR $1806            ; 20 06 18 | Jump to subroutine
    STY $B3              ; 84 B3 | Store Y register to zero page
    INY                  ; C8 | Increment Y register
    ADC $3F13            ; 6D 13 3F | Add with carry (absolute)
    INC $D819            ; EE 19 D8 | Increment (absolute)
    SBC ($3F,X)          ; E1 3F | Subtract with carry ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $C0              ; 80 C0 | Branch always
    BRA $40              ; 80 40 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPX #$E0             ; E0 E0 | Game work RAM access
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_17A
; Address: $E3DC4B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_17A:
    BNE $B0              ; D0 B0 | Branch if not equal
    BNE $C0              ; D0 C0 | Branch if not equal
    BEQ $40              ; F0 40 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_17B
; Address: $E3DC5A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_17B:
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_17C
; Address: $E3DC64
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_17C:
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    BRA $BE              ; 80 BE | Branch always
    BRA $19              ; 80 19 | Branch always
    LDX #$02             ; A2 02 | Load immediate value into X register
    STA ($01),Y          ; 91 01 | Store accumulator to (zero page),Y
    ASL $0E1E,X          ; 1E 1E 0E | Arithmetic shift left (absolute,X)
    ASL $0808            ; 0E 08 08 | Arithmetic shift left (absolute)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    INC $00              ; E6 00 | Increment (zero page)
    CPY $F3              ; C4 F3 | Compare Y register (zero page)
    ORA $C33F            ; 0D 3F C3 | Logical OR with accumulator (absolute)
    BMI $0E              ; 30 0E | Branch if negative
    SBC ($C4),Y          ; F1 C4 | Subtract with carry ((zero page),Y)
    CPY $0D              ; C4 0D | Compare Y register (zero page)
    ORA $C3C3            ; 0D C3 C3 | Logical OR with accumulator (absolute)
    PLB                  ; AB | Pull data bank register from stack
    BNE $10              ; D0 10 | Branch if not equal
    LDA ($B1),Y          ; B1 B1 | Load from (zero page),Y into accumulator
    SBC $FCFF,Y          ; F9 FF FC | Subtract with carry (absolute,Y)
    SBC $EEFE,X          ; FD FE EE | Subtract with carry (absolute,X)
    SBC $FCF9,Y          ; F9 F9 FC | Subtract with carry (absolute,Y)
    SBC $FEFF,X          ; FD FF FE | Subtract with carry (absolute,X)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    BCS $4F              ; B0 4F | Branch if carry set
    PLX                  ; FA | Pull X register from stack
    STA $FB              ; 85 FB | Store accumulator to zero page
    CPY $F3              ; C4 F3 | Compare Y register (zero page)
    CPY $08F7            ; CC F7 08 | Compare Y register (absolute)
    STY $7D              ; 84 7D | Store Y register to zero page
    BPL $9F              ; 10 9F | Branch if positive
    PHA                  ; 48 | Push accumulator to stack
    LDA $C5E786          ; AF 86 E7 C5 | Load from absolute long address into accumulator
    DEC $0FC1            ; CE C1 0F | Decrement (absolute)
    BCC $87              ; 90 87 | Branch if carry clear
    CLI                  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank46_DmaFunction_17E
; Address: $E3DCE6
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_17E:
    JSR $E0DF            ; 20 DF E0 | Game work RAM access
    ORA $CF30            ; 0D 30 CF | Logical OR with accumulator (absolute)
    BPL $EF              ; 10 EF | Branch if positive
    ROR $7EFF,X          ; 7E FF 7E | Rotate right (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank46_DmaFunction_17F
; Address: $E3DD06
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_17F:
    JSR $40DF            ; 20 DF 40 | Jump to subroutine
    LDA                  ; BF 00 FF 00 | Load from absolute long,X into accumulator
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    BCC $30              ; 90 30 | Branch if carry clear
    BMI $D0              ; 30 D0 | Branch if negative
    BEQ $60              ; F0 60 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_180
; Address: $E3DD1E
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_180:
    BRA $80              ; 80 80 | Branch always
    SBC $FC03,X          ; FD 03 FC | Subtract with carry (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CMP $C5              ; C5 C5 | Compare accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INX                  ; E8 | Increment X register
    LDX $F641,Y          ; BE 41 F6 | Load from absolute,Y into X register
    ORA #$78             ; 09 78 | Logical OR with accumulator (immediate)
    ORA $1EE2,X          ; 1D E2 1E | Logical OR with accumulator (absolute,X)
    SBC $EE1F            ; ED 1F EE | Subtract with carry (absolute)
    INX                  ; E8 | Increment X register
    XBA                  ; EB | Exchange accumulator bytes
    BIT $30CF            ; 2C CF 30 | Test bits in accumulator (absolute)
    BNE $47              ; D0 47 | Branch if not equal
    PHA                  ; 48 | Push accumulator to stack
    ORA ($0D,X)          ; 01 0D | Logical OR with accumulator ((zero page,X))
    ASL $FB0E            ; 0E 0E FB | Arithmetic shift left (absolute)
    STZ $FD              ; 64 FD | Store zero to zero page
    LDA $5FBF,Y          ; B9 BF 5F | Load from absolute,Y into accumulator
    STA $7E07FF          ; 8F FF 07 7E | Store accumulator to absolute long address
    ROR $69              ; 66 69 | Rotate right (zero page)
    SBC $00              ; E5 00 | Subtract with carry (zero page)
    STX $B9              ; 86 B9 | Store X register to zero page
    ADC $BF5F,Y          ; 79 5F BF | Add with carry (absolute,Y)
    STY $077C            ; 8C 7C 07 | Store Y register to absolute address
    BEQ $28              ; F0 28 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    DEC $EF3A            ; CE 3A EF | Decrement (absolute)
    PHP                  ; 08 | Push processor status to stack
    PHX                  ; DA | Push X register to stack
    BIT $ED              ; 24 ED | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_182
; Address: $E3DD94
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_182:
    EOR $45              ; 45 45 | Exclusive OR with accumulator (zero page)
    ROL                  ; 2A | Rotate left (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    AND $362D            ; 2D 2D 36 | Logical AND with accumulator (absolute)
    AND #$39             ; 29 39 | Logical AND with accumulator (immediate)
    AND $003D            ; 2D 3D 00 | Logical AND with accumulator (absolute)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF BF 00 03 | Load from absolute long,X into accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $0600            ; 0E 00 06 | Arithmetic shift left (absolute)
    INC $08FE,X          ; FE FE 08 | Increment (absolute,X)
    ORA $79E6,Y          ; 19 E6 79 | Logical OR with accumulator (absolute,Y)
    STX $31              ; 86 31 | Store X register to zero page
    LSR $5728            ; 4E 28 57 | Logical shift right (absolute)
    CLC                  ; 18 | Clear carry flag
    INC                  ; 1A | Increment accumulator
    AND $18              ; 25 18 | Logical AND with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA $F9FF,Y          ; 19 FF F9 | Logical OR with accumulator (absolute,Y)
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA                  ; BF FC FF DE | Load from absolute long,X into accumulator
    SBC $28FD,X          ; FD FD 28 | Subtract with carry (absolute,X)
    BMI $CC              ; 30 CC | Branch if negative
    DEY                  ; 88 | Decrement Y register
    RTI                  ; 40 | Return from interrupt
    BCS $08              ; B0 08 | Branch if carry set
    DEY                  ; 88 | Decrement Y register
    BVS $8C              ; 70 8C | Branch if overflow set
    CPY #$38             ; C0 38 | Compare Y register (immediate)
    AND $3BFD            ; 2D FD 3B | Logical AND with accumulator (absolute)
    PHB                  ; 8B | Push data bank register to stack
    EOR $8D7D            ; 4D 7D 8D | Exclusive OR with accumulator (absolute)
    LDA $FB7B,X          ; BD 7B FB | Load from absolute,X into accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA ($39,X)          ; 01 39 | Logical OR with accumulator ((zero page,X))
    INC $FAFE,X          ; FE FE FA | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    SBC $F9FD,X          ; FD FD F9 | Subtract with carry (absolute,X)
    SBC $F9F9,Y          ; F9 F9 F9 | Subtract with carry (absolute,Y)
    REP #$C2             ; C2 C2 | Reset processor status bits
    ORA $37F0,X          ; 1D F0 37 | Logical OR with accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank46_DmaFunction_183
; Address: $E3DE48
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_183:
    TYA                  ; 98 | Transfer Y register to accumulator
    CPY #$0F             ; C0 0F | Compare Y register (immediate)
    CPY #$DF             ; C0 DF | Compare Y register (immediate)
    AND $E200,X          ; 3D 00 E2 | Logical AND with accumulator (absolute,X)
    INY                  ; C8 | Increment Y register
    ADC $F101            ; 6D 01 F1 | Add with carry (absolute)
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    PEA #$0700           ; F4 00 07 | Push effective address to stack
    SED                  ; F8 | Set decimal mode flag
    SBC $E51B,X          ; FD 1B E5 | Subtract with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    ASL $0CF1            ; 0E F1 0C | Arithmetic shift left (absolute)
    BEQ $1F              ; F0 1F | Branch if equal
    CPX #$78             ; E0 78 | Compare X register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    ADC $E57D,X          ; 7D 7D E5 | Add with carry (absolute,X)
    SBC $98              ; E5 98 | Subtract with carry (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator
    CMP ($D1),Y          ; D1 D1 | Compare accumulator ((zero page),Y)
    BEQ $F0              ; F0 F0 | Branch if equal

;------------------------------------------------------------------------------
; Bank46_DmaFunction_184
; Address: $E3DE7E
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_184:
    JSR $F720            ; 20 20 F7 | Jump to subroutine
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    SBC $FD9A,X          ; FD 9A FD | Subtract with carry (absolute,X)
    STA                  ; 9F 9F FE 79 | Store accumulator to absolute long,X
    ROR $3EFD            ; 6E FD 3E | Rotate right (absolute)
    SBC $FB1C,X          ; FD 1C FB | Subtract with carry (absolute,X)
    ADC $5CFA,Y          ; 79 FA 5C | Add with carry (absolute,Y)
    JMP $6DCFCC          ; 5C CC CF 6D | Jump to address long
    ROR $3E3D            ; 6E 3D 3E | Rotate right (absolute)
    TYA                  ; 98 | Transfer Y register to accumulator
    STY $84              ; 84 84 | Store Y register to zero page
    BRA $7F              ; 80 7F | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_185
; Address: $E3DEC3
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_185:
    STA                  ; 9F B0 4F FE | Store accumulator to absolute long,X
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    SEI                  ; 78 | Set interrupt disable flag
    CLV                  ; B8 | Clear overflow flag
    STZ $487C            ; 9C 7C 48 | Store zero to absolute
    PLP                  ; 28 | Pull processor status from stack
    ASL $B6              ; 06 B6 | Arithmetic shift left (zero page)
    STA ($65,X)          ; 81 65 | Store accumulator to (zero page,X)
    BRA $FF              ; 80 FF | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BRA $FF              ; 80 FF | Branch always
    CPX #$E0             ; E0 E0 | Game work RAM access
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BRA $80              ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank46_DmaFunction_186
; Address: $E3DEFC
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_186:
    BNE $D0              ; D0 D0 | Branch if not equal
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    DEC $8F7F,X          ; DE 7F 8F | Decrement (absolute,X)
    CMP $1F              ; C5 1F | Compare accumulator (zero page)
    LSR $0F5E,X          ; 5E 5E 0F | Logical shift right (absolute,X)
    ORA $35              ; 05 35 | Logical OR with accumulator (zero page)
    CMP $FF              ; C5 FF | Compare accumulator (zero page)
    SEP #$FF             ; E2 FF | Set processor status bits
    LDA $06FD,X          ; BD FD 06 | Load from absolute,X into accumulator
    INC $8307,X          ; FE 07 83 | Increment (absolute,X)
    CMP $F5              ; C5 F5 | Compare accumulator (zero page)
    SEP #$F2             ; E2 F2 | Set processor status bits
    LDA $7B7B,X          ; BD 7B 7B | Load from absolute,X into accumulator
    LDA $04BD,X          ; BD BD 04 | Load from absolute,X into accumulator
    ASL $66              ; 06 66 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_187
; Address: $E3DF60
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_187:
    JSR $0CFD            ; 20 FD 0C | Jump to subroutine
    CPX $6887            ; EC 87 68 | Compare X register (absolute)
    CMP ($F6,X)          ; C1 F6 | Compare accumulator ((zero page,X))
    LDY #$F3             ; A0 F3 | Load immediate value into Y register
    BNE $F1              ; D0 F1 | Branch if not equal
    CPX #$70             ; E0 70 | Compare X register (immediate)
    ROL $3E              ; 26 3E | Rotate left (zero page)
    LDY $DEAC            ; AC AC DE | Load from absolute address into Y register
    DEC $6F6F,X          ; DE 6F 6F | Decrement (absolute,X)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_188
; Address: $E3DF81
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_188:
    JSR $8000            ; 20 00 80 | Jump to subroutine
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SBC $FEFD,X          ; FD FD FE | Subtract with carry (absolute,X)
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    CMP $A502            ; CD 02 A5 | Compare accumulator (absolute)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank46_DmaFunction_189
; Address: $E3DFCD
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_189:
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ROL $5F3E,X          ; 3E 3E 5F | Rotate left (absolute,X)
    CPX $FAEC            ; EC EC FA | Compare X register (absolute)
    PLX                  ; FA | Pull X register from stack
    SBC $00FD,X          ; FD FD 00 | Subtract with carry (absolute,X)
    ORA $1100,Y          ; 19 00 11 | Logical OR with accumulator (absolute,Y)
    BRA $00              ; 80 00 | Branch always
    PHB                  ; 8B | Push data bank register to stack
    INC $EF              ; E6 EF | Increment (zero page)
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PEA #$F9F4           ; F4 F4 F9 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank46_DmaFunction_18A
; Address: $E3DFFD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_18A:
    SBC $5B5A,Y          ; F9 5A 5B | Subtract with carry (absolute,Y)
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    ORA ($72,X)          ; 01 72 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank46_DmaFunction_18B
; Address: $E3E007
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_18B:
    JSR $0A0D            ; 20 0D 0A | Jump to subroutine
    AND $1E1E            ; 2D 1E 1E | Logical AND with accumulator (absolute)
    STX $8C              ; 86 8C | Store X register to zero page
    INY                  ; C8 | Increment Y register
    PLX                  ; FA | Pull X register from stack
    SBC $3333,X          ; FD 33 33 | Subtract with carry (absolute,X)
    AND $00FD,X          ; 3D FD 00 | Logical AND with accumulator (absolute,X)
    STA $803F00          ; 8F 00 3F 80 | Store accumulator to absolute long address
    STA                  ; 9F B0 9F E0 | Store accumulator to absolute long,X
    RTI                  ; 40 | Return from interrupt
    ASL $16              ; 06 16 | Arithmetic shift left (zero page)
    ASL $C6              ; 06 C6 | Arithmetic shift left (zero page)
    ASL $64              ; 06 64 | Arithmetic shift left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_18C
; Address: $E3E038
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_18C:
    CLV                  ; B8 | Clear overflow flag
    LDY $E900            ; AC 00 E9 | Load from absolute address into Y register
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank46_DmaFunction_18D
; Address: $E3E045
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_18D:
    PEA #$F20D           ; F4 0D F2 | Push effective address to stack
    TYA                  ; 98 | Transfer Y register to accumulator
    BEQ $77              ; F0 77 | Branch if equal
    BVC $F0              ; 50 F0 | Branch if overflow clear
    PLB                  ; AB | Pull data bank register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    TAY                  ; A8 | Transfer accumulator to Y register
    PHB                  ; 8B | Push data bank register to stack
    STA $99FE,Y          ; 99 FE 99 | Store accumulator to absolute,Y
    INC $FFF8,X          ; FE F8 FF | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INC $FF3F,X          ; FE 3F FF | Increment (absolute,X)
    STA $9F9F8F          ; 8F 8F 9F 9F | Store accumulator to absolute long address
    STA                  ; 9F 9F FB FB | Store accumulator to absolute long,X
    SBC $38F9,Y          ; F9 F9 38 | Subtract with carry (absolute,Y)
    SEC                  ; 38 | Set carry flag
    ROL $0F3E,X          ; 3E 3E 0F | Rotate left (absolute,X)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 08 F7 B8 | Load from absolute long,X into accumulator
    STZ $0C63            ; 9C 63 0C | Store zero to absolute
    BRA $B0              ; 80 B0 | Branch always
    RTI                  ; 40 | Return from interrupt
    BEQ $48              ; F0 48 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank46_DmaFunction_18E
; Address: $E3E09C
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_18E:
    JMP $2E4C            ; 4C 4C 2E | Jump to address
    ROL $21FF            ; 2E FF 21 | PPU graphics register access
    PLX                  ; FA | Pull X register from stack
    ADC $71              ; 65 71 | Add with carry (zero page)
    STX $FC0B            ; 8E 0B FC | Store X register to absolute address
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    SBC $2D21            ; ED 21 2D | Subtract with carry (absolute)
    STZ $6A              ; 64 6A | Store zero to zero page
    ASL $0C00            ; 0E 00 0C | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($12,X)          ; 01 12 | Logical OR with accumulator ((zero page,X))
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    BRA $FF              ; 80 FF | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    BNE $7F              ; D0 7F | Branch if not equal
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    BEQ $9F              ; F0 9F | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    BVC $50              ; 50 50 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank46_DmaFunction_18F
; Address: $E3E0DA
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_18F:
    JSR $90A0            ; 20 A0 90 | Jump to subroutine
    BCC $78              ; 90 78 | Branch if carry clear
    SEI                  ; 78 | Set interrupt disable flag
    INX                  ; E8 | Increment X register
    ORA $1DE6,Y          ; 19 E6 1D | Logical OR with accumulator (absolute,Y)
    SEP #$1E             ; E2 1E | Set processor status bits
    CPX #$19             ; E0 19 | Compare X register (immediate)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    ASL $0106            ; 0E 06 01 | Arithmetic shift left (absolute)
    ORA ($13,X)          ; 01 13 | Logical OR with accumulator ((zero page,X))
    ORA $09              ; 05 09 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ADC #$FB             ; 69 FB | Add with carry (immediate)
    STZ $FF              ; 64 FF | Store zero to zero page
    SEC                  ; 38 | Set carry flag
    PLB                  ; AB | Pull data bank register from stack
    SED                  ; F8 | Set decimal mode flag
    ADC #$69             ; 69 69 | Add with carry (immediate)
    STZ $6A              ; 64 6A | Store zero to zero page
    STX $38              ; 86 38 | Store X register to zero page

;------------------------------------------------------------------------------
; Bank46_DmaFunction_190
; Address: $E3E117
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_190:
    SBC $DC1C,Y          ; F9 1C DC | Subtract with carry (absolute,Y)
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    BNE $D0              ; D0 D0 | Branch if not equal
    JMP ($206C)          ; 6C 6C 20 | Jump to address (absolute indirect)
    BEQ $10              ; F0 10 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    BRA $FE              ; 80 FE | Branch always
    RTI                  ; 40 | Return from interrupt
    INC $FF20,X          ; FE 20 FF | Increment (absolute,X)
    BPL $FF              ; 10 FF | Branch if positive
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    EOR ($41,X)          ; 41 41 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank46_DmaFunction_191
; Address: $E3E13C
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_191:
    JSR $1020            ; 20 20 10 | Jump to subroutine
    BPL $00              ; 10 00 | Branch if positive
    SED                  ; F8 | Set decimal mode flag
    ROR $4000,X          ; 7E 00 40 | Rotate right (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    SEI                  ; 78 | Set interrupt disable flag
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA                  ; BF BF D5 D5 | Load from absolute long,X into accumulator
    TSX                  ; BA | Transfer stack pointer to X register
    TSX                  ; BA | Transfer stack pointer to X register
    STX $F78E            ; 8E 8E F7 | Store X register to absolute address
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    LDX $5000            ; AE 00 50 | Load from absolute address into X register
    INC $FFFE,X          ; FE FE FF | Increment (absolute,X)
    LDA                  ; BF BF 51 51 | Load from absolute long,X into accumulator
    LDA $0000AF          ; AF AF 00 00 | Load from absolute long address into accumulator
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    CLV                  ; B8 | Clear overflow flag
    BEQ $00              ; F0 00 | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    ROR $1F00,X          ; 7E 00 1F | Rotate right (absolute,X)
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $F0              ; F0 F0 | Branch if equal
    SBC ($07,X)          ; E1 07 | Subtract with carry ((zero page,X))
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank46_DmaFunction_192
; Address: $E3E1C4
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_192:
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    CMP ($03,X)          ; C1 03 | Compare accumulator ((zero page,X))
    BRA $03              ; 80 03 | Branch always
    EOR ($51),Y          ; 51 51 | Exclusive OR with accumulator ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    PLX                  ; FA | Pull X register from stack
    SBC $DCDB,X          ; FD DB DC | Subtract with carry (absolute,X)
    AND $7C3E,X          ; 3D 3E 7C | Logical AND with accumulator (absolute,X)
    LDA                  ; BF BF 7F 7F | Load from absolute long,X into accumulator
    LDA                  ; BF 3C BF A1 | Load from absolute long,X into accumulator
    INC $FF42,X          ; FE 42 FF | Increment (absolute,X)
    INC $FC8E,X          ; FE 8E FC | Increment (absolute,X)
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    INC                  ; 1A | Increment accumulator
    LSR $BD00,X          ; 5E 00 BD | Logical shift right (absolute,X)
    PEA #$6A00           ; F4 00 6A | Push effective address to stack
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    PLX                  ; FA | Pull X register from stack
    SBC $00              ; E5 00 | Subtract with carry (zero page)
    CPX #$EF             ; E0 EF | Compare X register (immediate)
    CMP ($DE,X)          ; C1 DE | Compare accumulator ((zero page,X))
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    BEQ $1F              ; F0 1F | Branch if equal
    CPX #$0C             ; E0 0C | Compare X register (immediate)
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    ROL                  ; 2A | Rotate left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDX $BE3E,Y          ; BE 3E BE | Load from absolute,Y into X register
    ROL $7070,X          ; 3E 70 70 | Rotate left (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_194
; Address: $E3E222
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_194:
    BEQ $0F              ; F0 0F | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    STA                  ; 9F 67 07 FD | Store accumulator to absolute long,X
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    STA $009D,X          ; 9D 9D 00 | Store accumulator to absolute,X
    REP #$3F             ; C2 3F | Reset processor status bits
    INC $F60B,X          ; FE 0B F6 | Increment (absolute,X)
    ORA #$E7             ; 09 E7 | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    SBC #$12             ; E9 12 | Subtract with carry (immediate)
    XBA                  ; EB | Exchange accumulator bytes
    BPL $0E              ; 10 0E | Branch if positive
    ASL $2020            ; 0E 20 20 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_196
; Address: $E3E25B
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_196:
    JSL $1E201E          ; 22 1E 20 1E | Jump to subroutine long
    ADC ($1B,X)          ; 61 1B | Add with carry ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPX $7B              ; E4 7B | Compare X register (zero page)
    STA $CFCF8F          ; 8F 8F CF CF | Store accumulator to absolute long address
    ADC $14ED            ; 6D ED 14 | Add with carry (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 00 FF 14 | Load from absolute long,X into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    BRA $80              ; 80 80 | Branch always
    ADC ($61,X)          ; 61 61 | Add with carry ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    BRA $FF              ; 80 FF | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank46_DmaFunction_197
; Address: $E3E2AE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_197:
    JSR $00DF            ; 20 DF 00 | Jump to subroutine
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank46_DmaFunction_198
; Address: $E3E2BC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_198:
    JSR $3860            ; 20 60 38 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    INC $F777,X          ; FE 77 F7 | Increment (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank46_DmaFunction_199
; Address: $E3E2C6
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_199:
    SBC ($3F,X)          ; E1 3F | Subtract with carry ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 00 FF 40 | Load from absolute long,X into accumulator
    LDA                  ; BF 60 9F 76 | Load from absolute long,X into accumulator
    AND ($21,X)          ; 21 21 | PPU graphics register access
    EOR ($41,X)          ; 41 41 | Exclusive OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_19B
; Address: $E3E2E0
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_19B:
    PHP                  ; 08 | Push processor status to stack
    BRA $FF              ; 80 FF | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank46_DmaFunction_19C
; Address: $E3E2EC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_19C:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank46_DmaFunction_19E
; Address: $E3E303
; Size: 109 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_19E:
    LDA                  ; BF 00 BF 00 | Load from absolute long,X into accumulator
    LDA                  ; BF 04 FB 42 | Load from absolute long,X into accumulator
    LDA $A65F,X          ; BD 5F A6 | Load from absolute,X into accumulator
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ROR                  ; 6A | Rotate right (accumulator)
    ROR $797F,X          ; 7E 7F 79 | Rotate right (absolute,X)
    CLV                  ; B8 | Clear overflow flag
    LDA                  ; BF 00 C0 00 | Load from absolute long,X into accumulator
    INC $FB00            ; EE 00 FB | Increment (absolute)
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    INC $7FFE,X          ; FE FE 7F | Increment (absolute,X)
    STA $1C008F          ; 8F 8F 00 1C | Store accumulator to absolute long address
    LDA                  ; BF 00 1F 00 | Load from absolute long,X into accumulator
    SED                  ; F8 | Set decimal mode flag
    BMI $E3              ; 30 E3 | Branch if negative
    ASL $410E            ; 0E 0E 41 | Arithmetic shift left (absolute)
    EOR ($E0,X)          ; 41 E0 | Game work RAM access
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    CPY #$02             ; C0 02 | Compare Y register (immediate)
    BRA $CF              ; 80 CF | Branch always
    SED                  ; F8 | Set decimal mode flag
    STA ($F1,X)          ; 81 F1 | Store accumulator to (zero page,X)
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    LDA                  ; BF BF FD FF | Load from absolute long,X into accumulator
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    ROR $037E,X          ; 7E 7E 03 | Rotate right (absolute,X)
    CLC                  ; 18 | Clear carry flag
    ORA ($1C,X)          ; 01 1C | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    AND $0100,X          ; 3D 00 01 | Logical AND with accumulator (absolute,X)
    BRA $E4              ; 80 E4 | Branch always
    CPX $E6              ; E4 E6 | Compare X register (zero page)
    SBC #$EF             ; E9 EF | Subtract with carry (immediate)
    INC $E8FF,X          ; FE FF E8 | Increment (absolute,X)
    INX                  ; E8 | Increment X register
    PHX                  ; DA | Push X register to stack
    PHX                  ; DA | Push X register to stack
    INC $7FFE,X          ; FE FE 7F | Increment (absolute,X)
    INC $FF1E,X          ; FE 1E FF | Increment (absolute,X)
    EOR ($FF,X)          ; 41 FF | Exclusive OR with accumulator ((zero page,X))
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    BIT $FF              ; 24 FF | Test bits in accumulator (zero page)
    ASL $00E1            ; 0E E1 00 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_19F
; Address: $E3E3B2
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_19F:
    LDX $BC00,Y          ; BE 00 BC | Load from absolute,Y into X register
    PLX                  ; FA | Pull X register from stack
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    ROL $5640,X          ; 3E 40 56 | Rotate left (absolute,X)
    BRA $BF              ; 80 BF | Branch always
    CPY #$4B             ; C0 4B | Compare Y register (immediate)
    BEQ $37              ; F0 37 | Branch if equal
    BEQ $37              ; F0 37 | Branch if equal
    STZ $D91C            ; 9C 1C D9 | Store zero to absolute
    CLC                  ; 18 | Clear carry flag
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    WDM #$02             ; 42 02 | Reserved instruction
    ORA ($CB,X)          ; 01 CB | Logical OR with accumulator ((zero page,X))
    DEX                  ; CA | Decrement X register
    SED                  ; F8 | Set decimal mode flag
    STY $8DFA            ; 8C FA 8D | Store Y register to absolute address
    SEI                  ; 78 | Set interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    PEA #$2CC3           ; F4 C3 2C | Push effective address to stack
    EOR ($BE,X)          ; 41 BE | Exclusive OR with accumulator ((zero page,X))
    ADC ($01),Y          ; 71 01 | Add with carry ((zero page),Y)
    STZ $4302,X          ; 9E 02 43 | Store zero to absolute,X
    CPX $14E4            ; EC E4 14 | Compare X register (absolute)
    TAX                  ; AA | Transfer accumulator to X register
    TAX                  ; AA | Transfer accumulator to X register
    LDA ($58,X)          ; A1 58 | Load from (zero page,X) into accumulator
    PEA #$F708           ; F4 08 F7 | Push effective address to stack
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    ORA #$E7             ; 09 E7 | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    LDY #$0F             ; A0 0F | Load immediate value into Y register
    BVS $0F              ; 70 0F | Branch if overflow set
    BPL $07              ; 10 07 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ORA $1866,Y          ; 19 66 18 | Logical OR with accumulator (absolute,Y)
    ADC $00              ; 65 00 | Add with carry (zero page)
    SEC                  ; 38 | Set carry flag
    BEQ $3F              ; F0 3F | Branch if equal
    BVS $BF              ; 70 BF | Branch if overflow set
    BEQ $5F              ; F0 5F | Branch if equal
    BEQ $7F              ; F0 7F | Branch if equal
    PLA                  ; 68 | Pull accumulator from stack
    LDA                  ; BF 64 9F FA | Load from absolute long,X into accumulator
    SED                  ; F8 | Set decimal mode flag
    LDA                  ; BF B7 77 D3 | Load from absolute long,X into accumulator
    LDA $8439,Y          ; B9 39 84 | Load from absolute,Y into accumulator
    BNE $20              ; D0 20 | Branch if not equal
    CPX $FB04            ; EC 04 FB | Compare X register (absolute)
    BPL $EF              ; 10 EF | Branch if positive

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1A0
; Address: $E3E44A
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1A0:
    CLC                  ; 18 | Clear carry flag
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    SBC ($E1,X)          ; E1 E1 | Subtract with carry ((zero page,X))
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    CLV                  ; B8 | Clear overflow flag
    LDA                  ; BF 2D 2F 08 | Load from absolute long,X into accumulator
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1A1
; Address: $E3E466
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1A1:
    JSR $C1DF            ; 20 DF C1 | Jump to subroutine
    ROL $1FE0,X          ; 3E E0 1F | Rotate left (absolute,X)
    XBA                  ; EB | Exchange accumulator bytes
    SBC $F012            ; ED 12 F0 | Subtract with carry (absolute)
    BEQ $E1              ; F0 E1 | Branch if equal
    SBC ($3F,X)          ; E1 3F | Subtract with carry ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    BEQ $FF              ; F0 FF | Branch if equal
    SBC $00FF            ; ED FF 00 | Subtract with carry (absolute)
    ORA $AD52            ; 0D 52 AD | Logical OR with accumulator (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    BMI $CF              ; 30 CF | Branch if negative
    BPL $F0              ; 10 F0 | Branch if positive
    CMP $F8F9,Y          ; D9 F9 F8 | Compare accumulator (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BRA $7F              ; 80 7F | Branch always
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    BEQ $F0              ; F0 F0 | Branch if equal
    BCS $F0              ; B0 F0 | Branch if carry set
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INC $EDFE,X          ; FE FE ED | Increment (absolute,X)
    SBC $E4E4            ; ED E4 E4 | Subtract with carry (absolute)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    INC $DB00,X          ; FE 00 DB | Increment (absolute,X)
    ORA $E0              ; 05 E0 | Game work RAM access
    BPL $1F              ; 10 1F | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    BIT $3E              ; 24 3E | Test bits in accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    CPY #$0F             ; C0 0F | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1A2
; Address: $E3E4EB
; Size: 117 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1A2:
    CPX $04F3            ; EC F3 04 | Compare X register (absolute)
    DEY                  ; 88 | Decrement Y register
    STX $438F            ; 8E 8F 43 | Store X register to absolute address
    STA                  ; 9F A7 87 0F | Store accumulator to absolute long,X
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    CPX $1F              ; E4 1F | Compare X register (zero page)
    DEY                  ; 88 | Decrement Y register
    BVS $8F              ; 70 8F | Branch if overflow set
    LDA $2F46,Y          ; B9 46 2F | Load from absolute,Y into accumulator
    BNE $F8              ; D0 F8 | Branch if not equal
    ROR $FF81,X          ; 7E 81 FF | Rotate right (absolute,X)
    SBC $89FB,X          ; FD FB 89 | Subtract with carry (absolute,X)
    LDA                  ; BF FF 2F FF | Load from absolute long,X into accumulator
    SED                  ; F8 | Set decimal mode flag
    INC $C8FF,X          ; FE FF C8 | Increment (absolute,X)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    SBC $1FE0,Y          ; F9 E0 1F | Subtract with carry (absolute,Y)
    INC $8001,X          ; FE 01 80 | Increment (absolute,X)
    BVS $8F              ; 70 8F | Branch if overflow set
    INY                  ; C8 | Increment Y register
    INC $7FFE,X          ; FE FE 7F | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    LDX $F000,Y          ; BE 00 F0 | Load from absolute,Y into X register
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    CPX $F1EC            ; EC EC F1 | Compare X register (absolute)
    SBC ($EF),Y          ; F1 EF | Subtract with carry ((zero page),Y)
    DEC $3BCE            ; CE CE 3B | Decrement (absolute)
    ASL $1D1E,X          ; 1E 1E 1D | Arithmetic shift left (absolute,X)
    ORA $8000,X          ; 1D 00 80 | Logical OR with accumulator (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    WDM #$00             ; 42 00 | Reserved instruction
    ASL $3C00            ; 0E 00 3C | Arithmetic shift left (absolute)
    INC $FDFE,X          ; FE FE FD | Increment (absolute,X)
    SBC $BDBC,X          ; FD BC BD | Subtract with carry (absolute,X)
    ROL $7A3E,X          ; 3E 3E 7A | Rotate left (absolute,X)
    PLY                  ; 7A | Pull Y register from stack
    SBC ($F1),Y          ; F1 F1 | Subtract with carry ((zero page),Y)
    SBC $FC19,Y          ; F9 19 FC | Subtract with carry (absolute,Y)
    BIT $2EFE            ; 2C FE 2E | Test bits in accumulator (absolute)
    INC $FE07,X          ; FE 07 FE | Increment (absolute,X)
    INC $E60E,X          ; FE 0E E6 | Increment (absolute,X)
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    STA $CA00,X          ; 9D 00 CA | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    CPY #$DE             ; C0 DE | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    CPY #$CF             ; C0 CF | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1A3
; Address: $E3E5B1
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1A3:
    ASL $06C6            ; 0E C6 06 | Arithmetic shift left (absolute)
    ASL $98              ; 06 98 | Arithmetic shift left (zero page)
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    STY $CE3F            ; 8C 3F CE | Store Y register to absolute address
    STA                  ; 9F 60 07 F8 | Store accumulator to absolute long,X
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    STY $CE8C            ; 8C 8C CE | Store Y register to absolute address
    DEC $6060            ; CE 60 60 | Decrement (absolute)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INC $F869,X          ; FE 69 F8 | Increment (absolute,X)
    SBC $FF02,X          ; FD 02 FF | Subtract with carry (absolute,X)
    BMI $FF              ; 30 FF | Branch if negative
    BMI $FF              ; 30 FF | Branch if negative
    BPL $FF              ; 10 FF | Branch if positive
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1A4
; Address: $E3E5F1
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1A4:
    JMP ($6067)          ; 6C 67 60 | Jump to address (absolute indirect)
    ORA $30              ; 05 30 | Logical OR with accumulator (zero page)
    BMI $31              ; 30 31 | Branch if negative
    BPL $10              ; 10 10 | Branch if positive
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    SBC $03FC,Y          ; F9 FC 03 | Subtract with carry (absolute,Y)
    ROR $7F81,X          ; 7E 81 7F | Rotate right (absolute,X)
    BRA $BF              ; 80 BF | Branch always
    RTI                  ; 40 | Return from interrupt
    TAY                  ; A8 | Transfer accumulator to Y register
    BRA $10              ; 80 10 | Branch always
    BRA $48              ; 80 48 | Branch always
    RTI                  ; 40 | Return from interrupt
    LDY $00              ; A4 00 | Load from zero page into Y register
    AND $1400,Y          ; 39 00 14 | Logical AND with accumulator (absolute,Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    STZ $BE41            ; 9C 41 BE | Store zero to absolute
    BRA $7F              ; 80 7F | Branch always
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    LSR $CB7F            ; 4E 7F CB | Logical shift right (absolute)
    ADC ($61,X)          ; 61 61 | Add with carry ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1A5
; Address: $E3E642
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1A5:
    XBA                  ; EB | Exchange accumulator bytes
    LDA $0846,Y          ; B9 46 08 | Load from absolute,Y into accumulator
    BRA $7F              ; 80 7F | Branch always
    INX                  ; E8 | Increment X register
    JMP ($7093)          ; 6C 93 70 | Jump to address (absolute indirect)
    STA $EFFF6F          ; 8F 6F FF EF | Store accumulator to absolute long address

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1A6
; Address: $E3E658
; Size: 110 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1A6:
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    BRA $7F              ; 80 7F | Branch always
    BEQ $F0              ; F0 F0 | Branch if equal
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BVS $70              ; 70 70 | Branch if overflow set
    BRA $80              ; 80 80 | Branch always
    SBC $F300,X          ; FD 00 F3 | Subtract with carry (absolute,X)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ORA ($1D),Y          ; 11 1D | Logical OR with accumulator ((zero page),Y)
    EOR ($79,X)          ; 41 79 | Exclusive OR with accumulator ((zero page,X))
    INC $FCFE,X          ; FE FE FC | Increment (absolute,X)
    SBC $FD00,X          ; FD 00 FD | Subtract with carry (absolute,X)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $030F            ; 0E 0F 03 | Arithmetic shift left (absolute)
    STY $84              ; 84 84 | Store Y register to zero page
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    CLI                  ; 58 | Clear interrupt disable flag
    TAY                  ; A8 | Transfer accumulator to Y register
    SED                  ; F8 | Set decimal mode flag
    PLA                  ; 68 | Pull accumulator from stack
    DEC                  ; 3A | Decrement accumulator
    ADC $7807,X          ; 7D 07 78 | Add with carry (absolute,X)
    LDA $84840F          ; AF 0F 84 84 | Load from absolute long address into accumulator
    LDA $F5F5EF          ; AF EF F5 F5 | Load from absolute long address into accumulator
    STA $FF00,X          ; 9D 00 FF | Store accumulator to absolute,X
    BRA $C0              ; 80 C0 | Branch always
    BMI $FC              ; 30 FC | Branch if negative
    ROR $67              ; 66 67 | Rotate right (zero page)
    LDY $7FBC,X          ; BC BC 7F | Load from absolute,X into Y register
    BCC $EF              ; 90 EF | Branch if carry clear
    BVS $8F              ; 70 8F | Branch if overflow set
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ROR $1B04,X          ; 7E 04 1B | Rotate right (absolute,X)
    STZ $7C7C            ; 9C 7C 7C | Store zero to absolute
    SBC $7BFD,X          ; FD FD 7B | Subtract with carry (absolute,X)
    INC $00EE            ; EE EE 00 | Increment (absolute)
    INC $F000,X          ; FE 00 F0 | Increment (absolute,X)
    BEQ $23              ; F0 23 | Branch if equal
    CPX $F1EC            ; EC EC F1 | Compare X register (absolute)
    SBC ($0F),Y          ; F1 0F | Subtract with carry ((zero page),Y)
    XBA                  ; EB | Exchange accumulator bytes
    XBA                  ; EB | Exchange accumulator bytes

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1A7
; Address: $E3E745
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1A7:
    STX $00              ; 86 00 | Store X register to zero page
    ASL $1800            ; 0E 00 18 | Arithmetic shift left (absolute)
    JMP ($DF6C)          ; 6C 6C DF | Jump to address (absolute indirect)
    PLY                  ; 7A | Pull Y register from stack
    INC $E8FF,X          ; FE FF E8 | Increment (absolute,X)
    CLD                  ; D8 | Clear decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    BEQ $F3              ; F0 F3 | Branch if equal
    CMP ($D1),Y          ; D1 D1 | Compare accumulator ((zero page),Y)
    ORA $FE              ; 05 FE | Logical OR with accumulator (zero page)
    INC $FFC6,X          ; FE C6 FF | Increment (absolute,X)
    INC $F306,X          ; FE 06 F3 | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    CLV                  ; B8 | Clear overflow flag
    AND $7800,Y          ; 39 00 78 | Logical AND with accumulator (absolute,Y)
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    SBC $2000,Y          ; F9 00 20 | Subtract with carry (absolute,Y)
    LDY $C703            ; AC 03 C7 | Load from absolute address into Y register
    AND $A180            ; 2D 80 A1 | Logical AND with accumulator (absolute)
    BRA $BC              ; 80 BC | Branch always
    LSR $0053,X          ; 5E 53 00 | Logical shift right (absolute,X)
    SEC                  ; 38 | Set carry flag
    AND $D200            ; 2D 00 D2 | Logical AND with accumulator (absolute)
    LSR $4300,X          ; 5E 00 43 | Logical shift right (absolute,X)
    PHB                  ; 8B | Push data bank register to stack
    PHP                  ; 08 | Push processor status to stack
    LDA ($00,X)          ; A1 00 | Load from (zero page,X) into accumulator
    ROR $7D01,X          ; 7E 01 7D | Rotate right (absolute,X)
    INC $BF40,X          ; FE 40 BF | Increment (absolute,X)
    BMI $CF              ; 30 CF | Branch if negative
    ROL $3EC1,X          ; 3E C1 3E | Rotate left (absolute,X)
    CMP ($1F,X)          ; C1 1F | Compare accumulator ((zero page,X))
    CPX #$BD             ; E0 BD | Compare X register (immediate)
    TSX                  ; BA | Transfer stack pointer to X register
    SEC                  ; 38 | Set carry flag
    ADC $BE78,Y          ; 79 78 BE | Add with carry (absolute,Y)
    LDX $4F4F,Y          ; BE 4F 4F | Load from absolute,Y into X register
    EOR ($41,X)          ; 41 41 | Exclusive OR with accumulator ((zero page,X))
    EOR ($41,X)          ; 41 41 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1A9
; Address: $E3E7C5
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1A9:
    JSR $F00F            ; 20 0F F0 | Jump to subroutine
    CLD                  ; D8 | Clear decimal mode flag
    CPX $CF              ; E4 CF | Compare X register (zero page)
    BMI $EE              ; 30 EE | Branch if negative
    ORA ($80),Y          ; 11 80 | Logical OR with accumulator ((zero page),Y)
    CPY $3B              ; C4 3B | Compare Y register (zero page)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1AA
; Address: $E3E7D8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1AA:
    CLD                  ; D8 | Clear decimal mode flag
    CPX $1B              ; E4 1B | Compare X register (zero page)
    BMI $CF              ; 30 CF | Branch if negative
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1AB
; Address: $E3E7E5
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1AB:
    PHP                  ; 08 | Push processor status to stack
    ROL $3FFF,X          ; 3E FF 3F | Rotate left (absolute,X)
    ORA ($60,X)          ; 01 60 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1AC
; Address: $E3E7F4
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1AC:
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ROL $3F3E,X          ; 3E 3E 3F | Rotate left (absolute,X)
    LDA                  ; BF 07 C7 07 | Load from absolute long,X into accumulator
    RTI                  ; 40 | Return from interrupt
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    CMP $00              ; C5 00 | Compare accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    CMP $C5              ; C5 C5 | Compare accumulator (zero page)
    BCS $4F              ; B0 4F | Branch if carry set
    TYA                  ; 98 | Transfer Y register to accumulator
    CPY $E233            ; CC 33 E2 | Compare Y register (absolute)
    AND $1FF0,X          ; 3D F0 1F | Logical AND with accumulator (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    JMP $1E1E5C          ; 5C 5C 1E 1E | Jump to address long
    BMI $00              ; 30 00 | Branch if negative
    BVC $20              ; 50 20 | Branch if overflow clear
    SBC ($F1),Y          ; F1 F1 | Subtract with carry ((zero page),Y)
    SBC ($F1),Y          ; F1 F1 | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1AD
; Address: $E3E854
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1AD:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    BRA $80              ; 80 80 | Branch always
    CMP $83D9,Y          ; D9 D9 83 | Compare accumulator (absolute,Y)
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ASL $180E            ; 0E 0E 18 | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    SBC $0000,X          ; FD 00 00 | Subtract with carry (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1AF
; Address: $E3E89F
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1AF:
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    SEP #$00             ; E2 00 | Set processor status bits
    ADC $00              ; 65 00 | Add with carry (zero page)
    ORA ($DA,X)          ; 01 DA | Logical OR with accumulator ((zero page,X))
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    SEP #$F2             ; E2 F2 | Set processor status bits
    ORA $0C0F            ; 0D 0F 0C | Logical OR with accumulator (absolute)
    BEQ $0A              ; F0 0A | Branch if equal
    BMI $C9              ; 30 C9 | Branch if negative
    SEC                  ; 38 | Set carry flag
    CMP ($88,X)          ; C1 88 | Compare accumulator ((zero page,X))
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDA $80FF00          ; AF 00 FF 80 | Load from absolute long address into accumulator
    LDX $7EFE,Y          ; BE FE 7E | Load from absolute,Y into X register
    ROR $DCDC,X          ; 7E DC DC | Rotate right (absolute,X)
    INC $DAEE            ; EE EE DA | Increment (absolute)
    PHX                  ; DA | Push X register to stack
    SBC ($F1),Y          ; F1 F1 | Subtract with carry ((zero page),Y)
    ROR $FC00,X          ; 7E 00 FC | Rotate right (absolute,X)
    SBC $F800,X          ; FD 00 F8 | Subtract with carry (absolute,X)
    INC $9F60,X          ; FE 60 9F | Increment (absolute,X)
    SBC ($1F,X)          ; E1 1F | Subtract with carry ((zero page,X))
    LDA ($4E),Y          ; B1 4E | Load from (zero page),Y into accumulator
    ADC ($71),Y          ; 71 71 | Add with carry ((zero page),Y)
    SBC $BCFD,X          ; FD FD BC | Subtract with carry (absolute,X)
    SBC $0300,X          ; FD 00 03 | Subtract with carry (absolute,X)
    ASL $F100            ; 0E 00 F1 | Arithmetic shift left (absolute)
    SED                  ; F8 | Set decimal mode flag
    BRA $E0              ; 80 E0 | Game work RAM access
    BRA $67              ; 80 67 | Branch always
    SBC ($F1),Y          ; F1 F1 | Subtract with carry ((zero page),Y)
    LSR $F44E            ; 4E 4E F4 | Logical shift right (absolute)
    PEA #$BFBF           ; F4 BF BF | Push effective address to stack
    LDA                  ; BF BF 38 B8 | Load from absolute long,X into accumulator
    INC $1F00,X          ; FE 00 1F | Increment (absolute,X)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1B0
; Address: $E3E930
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1B0:
    JSL $E6E623          ; 22 23 E6 E6 | Jump to subroutine long
    ORA $6362,X          ; 1D 62 63 | Logical OR with accumulator (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    ASL $1F              ; 06 1F | Arithmetic shift left (zero page)
    CMP $DD              ; C5 DD | Compare accumulator (zero page)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1B1
; Address: $E3E95A
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1B1:
    SBC $FE00,X          ; FD 00 FE | Subtract with carry (absolute,X)
    LDY #$A7             ; A0 A7 | Load immediate value into Y register
    CPY #$47             ; C0 47 | Compare Y register (immediate)
    BEQ $77              ; F0 77 | Branch if equal
    CPY #$4F             ; C0 4F | Compare Y register (immediate)
    CPY #$DF             ; C0 DF | Compare Y register (immediate)
    CPY #$CF             ; C0 CF | Compare Y register (immediate)
    CPX #$EB             ; E0 EB | Compare X register (immediate)
    INC $06              ; E6 06 | Increment (zero page)
    PHY                  ; 5A | Push Y register to stack
    TSX                  ; BA | Transfer stack pointer to X register
    PHB                  ; 8B | Push data bank register to stack
    LDA ($01),Y          ; B1 01 | Load from (zero page),Y into accumulator
    BMI $00              ; 30 00 | Branch if negative
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $BF              ; F0 BF | Branch if equal
    RTI                  ; 40 | Return from interrupt
    JMP $61BC43          ; 5C 43 BC 61 | Jump to address long
    STZ $DE21,X          ; 9E 21 DE | Store zero to absolute,X
    BVC $50              ; 50 50 | Branch if overflow clear
    BPL $10              ; 10 10 | Branch if positive
    BCC $90              ; 90 90 | Branch if carry clear
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    JMP $B4B45C          ; 5C 5C B4 B4 | Jump to address long
    DEC $FFDE,X          ; DE DE FF | Decrement (absolute,X)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1B2
; Address: $E3E9A7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1B2:
    JSR $70FF            ; 20 FF 70 | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    BIT $FF              ; 24 FF | Test bits in accumulator (zero page)
    AND $0600,X          ; 3D 00 06 | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1B3
; Address: $E3E9B6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1B3:
    JSR $7029            ; 20 29 70 | Jump to subroutine
    BVS $38              ; 70 38 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1B4
; Address: $E3E9D9
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1B4:
    JSR $0303            ; 20 03 03 | Jump to subroutine
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    INC $FC03,X          ; FE 03 FC | Increment (absolute,X)
    INC $FE07,X          ; FE 07 FE | Increment (absolute,X)
    INC $8007,X          ; FE 07 80 | Increment (absolute,X)
    STY $8F80            ; 8C 80 8F | Store Y register to absolute address
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    SED                  ; F8 | Set decimal mode flag
    BEQ $FF              ; F0 FF | Branch if equal

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1B5
; Address: $E3EA06
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1B5:
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    PLA                  ; 68 | Pull accumulator from stack
    INX                  ; E8 | Increment X register
    BEQ $F0              ; F0 F0 | Branch if equal
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 00 FF 00 | Load from absolute long,X into accumulator
    CPX #$E0             ; E0 E0 | Game work RAM access
    BVS $70              ; 70 70 | Branch if overflow set
    ORA $001D,X          ; 1D 1D 00 | Logical OR with accumulator (absolute,X)
    AND ($21,X)          ; 21 21 | PPU graphics register access
    BRA $80              ; 80 80 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    LSR $184E            ; 4E 4E 18 | Logical shift right (absolute)
    CLC                  ; 18 | Clear carry flag
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    BRA $80              ; 80 80 | Branch always
    CPX #$E0             ; E0 E0 | Game work RAM access
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    ORA ($F6,X)          ; 01 F6 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    CPX $C700            ; EC 00 C7 | Compare X register (absolute)
    ORA $6B0F            ; 0D 0F 6B | Logical OR with accumulator (absolute)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1B6
; Address: $E3EA9C
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1B6:
    PHY                  ; 5A | Push Y register to stack
    PLY                  ; 7A | Pull Y register from stack
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    INY                  ; C8 | Increment Y register
    BMI $CF              ; 30 CF | Branch if negative
    CPY #$BC             ; C0 BC | Compare Y register (immediate)
    CPY #$7E             ; C0 7E | Compare Y register (immediate)
    CPY $BA              ; C4 BA | Compare Y register (zero page)
    SBC ($F9),Y          ; F1 F9 | Subtract with carry ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    EOR ($C1,X)          ; 41 C1 | Exclusive OR with accumulator ((zero page,X))
    LDX $ECBE,Y          ; BE BE EC | Load from absolute,Y into X register
    CPX $FEFE            ; EC FE FE | Compare X register (absolute)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1B7
; Address: $E3EACA
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1B7:
    CLI                  ; 58 | Clear interrupt disable flag
    PHA                  ; 48 | Push accumulator to stack
    TXA                  ; 8A | Transfer X register to accumulator
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    BCS $B1              ; B0 B1 | Branch if carry set
    LDA $FFFFAF          ; AF AF FF FF | Load from absolute long address into accumulator
    SBC $EFFF,X          ; FD FF EF | Subtract with carry (absolute,X)
    STA $00CFDA          ; 8F DA CF 00 | Store accumulator to absolute long address
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ASL $E3              ; 06 E3 | Arithmetic shift left (zero page)
    INC $FFFE,X          ; FE FE FF | Increment (absolute,X)
    AND $0100,X          ; 3D 00 01 | Logical AND with accumulator (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $4500            ; 0D 00 45 | Logical OR with accumulator (absolute)
    REP #$C2             ; C2 C2 | Reset processor status bits
    SBC $FDFD,X          ; FD FD FD | Subtract with carry (absolute,X)
    INC $79FE,X          ; FE FE 79 | Increment (absolute,X)
    ADC $F7F5,Y          ; 79 F5 F7 | Add with carry (absolute,Y)
    TSX                  ; BA | Transfer stack pointer to X register
    TSX                  ; BA | Transfer stack pointer to X register
    BEQ $31              ; F0 31 | Branch if equal
    CPX #$2D             ; E0 2D | Compare X register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    INC $66              ; E6 66 | Increment (zero page)
    AND $07FF,X          ; 3D FF 07 | Logical AND with accumulator (absolute,X)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    DEC $D200            ; CE 00 D2 | Decrement (absolute)
    LDA                  ; BF 00 99 00 | Load from absolute long,X into accumulator
    REP #$00             ; C2 00 | Reset processor status bits
    SED                  ; F8 | Set decimal mode flag
    SBC $FF00,Y          ; F9 00 FF | Subtract with carry (absolute,Y)
    BEQ $27              ; F0 27 | Branch if equal
    CLV                  ; B8 | Clear overflow flag
    INY                  ; C8 | Increment Y register
    ORA ($BE,X)          ; 01 BE | Logical OR with accumulator ((zero page,X))
    CLD                  ; D8 | Clear decimal mode flag
    SBC $FC2A,Y          ; F9 2A FC | Subtract with carry (absolute,Y)
    BCC $90              ; 90 90 | Branch if carry clear
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    BMI $00              ; 30 00 | Branch if negative
    LSR $E60E            ; 4E 0E E6 | Logical shift right (absolute)
    ASL $21              ; 06 21 | PPU graphics register access
    ORA ($D6,X)          ; 01 D6 | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF 40 7F 83 | Load from absolute long,X into accumulator
    BMI $00              ; 30 00 | Branch if negative
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1B8
; Address: $E3EB97
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1B8:
    SEC                  ; 38 | Set carry flag
    LDA                  ; BF 3F BF 30 | Load from absolute long,X into accumulator
    BMI $FF              ; 30 FF | Branch if negative
    INC $FD01,X          ; FE 01 FD | Increment (absolute,X)
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    STX $9EFF            ; 8E FF 9E | Store X register to absolute address
    ASL $0300,X          ; 1E 00 03 | Arithmetic shift left (absolute,X)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    DEC $81              ; C6 81 | Decrement (zero page)
    STA ($8E),Y          ; 91 8E | Store accumulator to (zero page),Y
    LDX $DE9E,Y          ; BE 9E DE | Load from absolute,Y into X register
    ASL $FE5E,X          ; 1E 5E FE | Arithmetic shift left (absolute,X)
    INC $FF03,X          ; FE 03 FF | Increment (absolute,X)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    ADC $FF              ; 65 FF | Add with carry (zero page)
    LSR $8E06,X          ; 5E 06 8E | Logical shift right (absolute,X)
    SEP #$03             ; E2 03 | Set processor status bits
    CPX #$E8             ; E0 E8 | Compare X register (immediate)
    ADC $E5              ; 65 E5 | Add with carry (zero page)
    LSR $005E,X          ; 5E 5E 00 | Logical shift right (absolute,X)
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1B9
; Address: $E3EC05
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1B9:
    STA                  ; 9F E0 1F A0 | Store accumulator to absolute long,X
    XBA                  ; EB | Exchange accumulator bytes
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1BB
; Address: $E3EC16
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1BB:
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    ORA $08F2            ; 0D F2 08 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1BC
; Address: $E3EC2A
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1BC:
    JSR $1CDF            ; 20 DF 1C | Jump to subroutine
    BMI $30              ; 30 30 | Branch if negative
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    ORA $0F0F            ; 0D 0F 0F | Logical OR with accumulator (absolute)
    BCC $FF              ; 90 FF | Branch if carry clear
    CPY $2C3F            ; CC 3F 2C | Compare Y register (absolute)
    INC $C0C0,X          ; FE C0 C0 | Increment (absolute,X)
    BEQ $F0              ; F0 F0 | Branch if equal
    SEP #$E2             ; E2 E2 | Set processor status bits

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1BD
; Address: $E3EC56
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1BD:
    CPX $E8EC            ; EC EC E8 | Compare X register (absolute)
    INX                  ; E8 | Increment X register
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    STA                  ; 9F 00 D3 00 | Store accumulator to absolute long,X
    CLD                  ; D8 | Clear decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1BE
; Address: $E3EC6D
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1BE:
    INC $F2              ; E6 F2 | Increment (zero page)
    BIT $64              ; 24 64 | Test bits in accumulator (zero page)
    ROR $F67E,X          ; 7E 7E F6 | Rotate right (absolute,X)
    ROR $E909,X          ; 7E 09 E9 | Rotate right (absolute,X)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    STZ $C1              ; 64 C1 | Store zero to zero page
    INC $CF30,X          ; FE 30 CF | Increment (absolute,X)
    CPX #$7F             ; E0 7F | Compare X register (immediate)
    BEQ $5E              ; F0 5E | Branch if equal
    DEX                  ; CA | Decrement X register
    SBC $9CFF,X          ; FD FF 9C | Subtract with carry (absolute,X)
    STA                  ; 9F DE DF 0E | Store accumulator to absolute long,X
    ROL $E767,X          ; 3E 67 E7 | Rotate left (absolute,X)
    INC $FFFF            ; EE FF FF | Increment (absolute)
    INC $C8C6,X          ; FE C6 C8 | Increment (absolute,X)
    BCS $5C              ; B0 5C | Branch if carry set
    ADC $F77C            ; 6D 7C F7 | Add with carry (absolute)
    SEC                  ; 38 | Set carry flag
    CLD                  ; D8 | Clear decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    JMP ($23E0)          ; 6C E0 23 | Jump to address (absolute indirect)
    INC $F7DE            ; EE DE F7 | Increment (absolute)
    STA                  ; 9F BF 6B FB | Store accumulator to absolute long,X
    AND $0100,Y          ; 39 00 01 | Logical AND with accumulator (absolute,Y)
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    ROR $8010,X          ; 7E 10 80 | Rotate right (absolute,X)
    DEC $C6              ; C6 C6 | Decrement (zero page)
    BVS $78              ; 70 78 | Branch if overflow set
    AND #$2B             ; 29 2B | Logical AND with accumulator (immediate)
    STA                  ; 9F 9F EF FF | Store accumulator to absolute long,X
    REP #$00             ; C2 00 | Reset processor status bits
    STY $00              ; 84 00 | Store Y register to zero page
    ASL $0600            ; 0E 00 06 | Arithmetic shift left (absolute)
    ASL $3C              ; 06 3C | Arithmetic shift left (zero page)
    AND $7B78,X          ; 3D 78 7B | Logical AND with accumulator (absolute,X)
    CPX $E7              ; E4 E7 | Compare X register (zero page)
    PLX                  ; FA | Pull X register from stack
    CMP $FACD            ; CD CD FA | Compare accumulator (absolute)
    INC $FF06,X          ; FE 06 FF | Increment (absolute,X)
    ADC $FF              ; 65 FF | Add with carry (zero page)
    INX                  ; E8 | Increment X register
    SBC $FC00,Y          ; F9 00 FC | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1BF
; Address: $E3ED1A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1BF:
    TXS                  ; 9A | Transfer X register to stack pointer
    BCS $00              ; B0 00 | Branch if carry set
    CPX $FF00            ; EC 00 FF | Compare X register (absolute)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BNE $7F              ; D0 7F | Branch if not equal
    BVS $0F              ; 70 0F | Branch if overflow set
    PHP                  ; 08 | Push processor status to stack
    PLA                  ; 68 | Pull accumulator from stack
    SEC                  ; 38 | Set carry flag
    BEQ $F6              ; F0 F6 | Branch if equal

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1C0
; Address: $E3ED2E
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1C0:
    JSR $3F21            ; 20 21 3F | Jump to subroutine
    STA $00F000          ; 8F 00 F0 00 | Store accumulator to absolute long address
    DEC $F100,X          ; DE 00 F1 | Decrement (absolute,X)
    EOR $7FC1            ; 4D C1 7F | Exclusive OR with accumulator (absolute)
    LDY $B38F,X          ; BC 8F B3 | Load from absolute,X into Y register
    CLD                  ; D8 | Clear decimal mode flag
    ORA $CA              ; 05 CA | Logical OR with accumulator (zero page)
    TXA                  ; 8A | Transfer X register to accumulator
    ORA $8B              ; 05 8B | Logical OR with accumulator (zero page)
    JMP $530C            ; 4C 0C 53 | Jump to address
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    PLY                  ; 7A | Pull Y register from stack
    LSR                  ; 4A | Logical shift right (accumulator)
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BEQ $F8              ; F0 F8 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$E3             ; E0 E3 | Compare X register (immediate)
    CPX #$E7             ; E0 E7 | Compare X register (immediate)
    CPX #$E8             ; E0 E8 | Compare X register (immediate)
    ORA $02FF,X          ; 1D FF 02 | Logical OR with accumulator (absolute,X)
    SBC $3FFF,X          ; FD FF 3F | Subtract with carry (absolute,X)
    ORA $039D,X          ; 1D 9D 03 | Logical OR with accumulator (absolute,X)
    SBC $FF              ; E5 FF | Subtract with carry (zero page)
    SED                  ; F8 | Set decimal mode flag
    STZ $3DFF,X          ; 9E FF 3D | Store zero to absolute,X
    AND $6029,Y          ; 39 29 60 | Logical AND with accumulator (absolute,Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1C1
; Address: $E3EDB3
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1C1:
    DEC $FBF8            ; CE F8 FB | Decrement (absolute)
    INC $FF7E,X          ; FE 7E FF | Increment (absolute,X)
    STX $FD              ; 86 FD | Store X register to zero page
    INX                  ; E8 | Increment X register
    PEA #$E85F           ; F4 5F E8 | Push effective address to stack
    ROL $23DC,X          ; 3E DC 23 | Rotate left (absolute,X)
    CPY $FB              ; C4 FB | Compare Y register (zero page)
    CPX $86              ; E4 86 | Compare X register (zero page)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1C2
; Address: $E3EDD2
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1C2:
    INX                  ; E8 | Increment X register
    CLC                  ; 18 | Clear carry flag
    STA                  ; 9F 23 BD 3D | Store accumulator to absolute long,X
    AND $FCE4,X          ; 3D E4 FC | Logical AND with accumulator (absolute,X)
    PLX                  ; FA | Pull X register from stack
    DEY                  ; 88 | Decrement Y register
    ADC ($8E),Y          ; 71 8E | Add with carry ((zero page),Y)
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    BNE $2F              ; D0 2F | Branch if not equal
    BVS $8F              ; 70 8F | Branch if overflow set
    PLA                  ; 68 | Pull accumulator from stack
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    LDY $DCFC,X          ; BC FC DC | Load from absolute,X into Y register
    BVS $FC              ; 70 FC | Branch if overflow set
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1C3
; Address: $E3EE00
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1C3:
    JSR $00DF            ; 20 DF 00 | Jump to subroutine
    BPL $EF              ; 10 EF | Branch if positive
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    INC $BFF6,X          ; FE F6 BF | Increment (absolute,X)
    LDA                  ; BF FF FF 03 | Load from absolute long,X into accumulator
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    INC $807E,X          ; FE 7E 80 | Increment (absolute,X)
    LDA                  ; BF 0A F5 D9 | Load from absolute long,X into accumulator
    LDA #$EF             ; A9 EF | Load immediate value into accumulator
    PHX                  ; DA | Push X register to stack
    LSR $1FDD,X          ; 5E DD 1F | Logical shift right (absolute,X)
    STA                  ; 9F BF 3F FF | Store accumulator to absolute long,X
    STA $DDC7AF          ; 8F AF C7 DD | Store accumulator to absolute long address
    AND $BE37,Y          ; 39 37 BE | Logical AND with accumulator (absolute,Y)
    LDA $797F,Y          ; B9 7F 79 | Load from absolute,Y into accumulator
    LDY $FDE1,X          ; BC E1 FD | Load from absolute,X into Y register
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    SBC $A0F9,Y          ; F9 F9 A0 | Subtract with carry (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    LDA                  ; BF 5E FC EB | Load from absolute long,X into accumulator
    INC $7FCF,X          ; FE CF 7F | Increment (absolute,X)
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1C4
; Address: $E3EE80
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1C4:
    CPY #$C6             ; C0 C6 | Compare Y register (immediate)
    STA $139D,Y          ; 99 9D 13 | Store accumulator to absolute,Y
    CPX #$E0             ; E0 E0 | Game work RAM access
    SBC $EAFF,Y          ; F9 FF EA | Subtract with carry (absolute,Y)
    LDA                  ; BF 0F FB 09 | Load from absolute long,X into accumulator
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    ROR $3E7F,X          ; 7E 7F 3E | Rotate right (absolute,X)
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    SBC $FE8A,X          ; FD 8A FE | Subtract with carry (absolute,X)
    EOR $88FF,X          ; 5D FF 88 | Exclusive OR with accumulator (absolute,X)
    LDA                  ; BF D0 F9 37 | Load from absolute long,X into accumulator
    CPY $5F              ; C4 5F | Compare Y register (zero page)
    LDA $18              ; A5 18 | Load from zero page into accumulator
    CPY #$FD             ; C0 FD | Compare Y register (immediate)
    ASL $20DF,X          ; 1E DF 20 | Arithmetic shift left (absolute,X)
    LDX $97FF            ; AE FF 97 | Load from absolute address into X register
    CMP ($4F,X)          ; C1 4F | Compare accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    INC $E4C2,X          ; FE C2 E4 | Increment (absolute,X)
    CPY #$31             ; C0 31 | Compare Y register (immediate)
    INX                  ; E8 | Increment X register
    CLV                  ; B8 | Clear overflow flag
    BEQ $95              ; F0 95 | Branch if equal
    BMI $4D              ; 30 4D | Branch if negative
    INC $FE76,X          ; FE 76 FE | Increment (absolute,X)
    ROR $AFEF,X          ; 7E EF AF | Rotate right (absolute,X)
    SBC $FE65,X          ; FD 65 FE | Subtract with carry (absolute,X)
    LDA                  ; BF BC F7 D7 | Load from absolute long,X into accumulator
    INC $89EE            ; EE EE 89 | Increment (absolute)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    BVC $00              ; 50 00 | Branch if overflow clear
    TXS                  ; 9A | Transfer X register to stack pointer
    ORA $4300            ; 0D 00 43 | Logical OR with accumulator (absolute)
    PLP                  ; 28 | Pull processor status from stack
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1C5
; Address: $E3EF04
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1C5:
    JSR $F027            ; 20 27 F0 | Jump to subroutine
    STA $669DFF          ; 8F FF 9D 66 | Store accumulator to absolute long address
    ROR $F0              ; 66 F0 | Rotate right (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND $7000            ; 2D 00 70 | Logical AND with accumulator (absolute)
    STA $0300,Y          ; 99 00 03 | Store accumulator to absolute,Y
    CPX $FE01            ; EC 01 FE | Compare X register (absolute)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    BVS $8F              ; 70 8F | Branch if overflow set
    STA                  ; 9F E7 87 F9 | Store accumulator to absolute long,X
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    CPY $E6              ; C4 E6 | Compare Y register (zero page)
    INC $5E              ; E6 5E | Increment (zero page)
    LSR $30B0,X          ; 5E B0 30 | Logical shift right (absolute,X)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1C7
; Address: $E3EF45
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1C7:
    JSR $C0EE            ; 20 EE C0 | Jump to subroutine
    BVC $FF              ; 50 FF | Branch if overflow clear
    DEY                  ; 88 | Decrement Y register
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1C8
; Address: $E3EF54
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1C8:
    JSR $C03E            ; 20 3E C0 | Jump to subroutine
    BVC $5E              ; 50 5E | Branch if overflow clear
    DEY                  ; 88 | Decrement Y register
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    ASL $1EFF            ; 0E FF 1E | Arithmetic shift left (absolute)
    ORA ($BF,X)          ; 01 BF | Logical OR with accumulator ((zero page,X))
    AND ($0E),Y          ; 31 0E | Logical AND with accumulator ((zero page),Y)
    ROR $5E1E            ; 6E 1E 5E | Rotate right (absolute)
    ORA ($7D,X)          ; 01 7D | Logical OR with accumulator ((zero page,X))
    CMP ($3F,X)          ; C1 3F | Compare accumulator ((zero page,X))
    INC $FDEF,X          ; FE EF FD | Increment (absolute,X)
    INC $FD8E,X          ; FE 8E FD | Increment (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    BEQ $83              ; F0 83 | Branch if equal
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    INC $FFFF            ; EE FF FF | Increment (absolute)
    ASL $038F            ; 0E 8F 03 | Arithmetic shift left (absolute)
    RTI                  ; 40 | Return from interrupt
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    PLP                  ; 28 | Pull processor status from stack
    SBC $33CC,X          ; FD CC 33 | Subtract with carry (absolute,X)
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    ADC $5179,Y          ; 79 79 51 | Add with carry (absolute,Y)
    ADC ($10,X)          ; 61 10 | Add with carry ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    TSX                  ; BA | Transfer stack pointer to X register

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1C9
; Address: $E3EFB8
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1C9:
    JSR $F0EC            ; 20 EC F0 | Jump to subroutine
    BEQ $FB              ; F0 FB | Branch if equal
    PHB                  ; 8B | Push data bank register to stack
    PHB                  ; 8B | Push data bank register to stack
    CLC                  ; 18 | Clear carry flag
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    SBC $CCFD,X          ; FD FD CC | Subtract with carry (absolute,X)
    CPY $ECEC            ; CC EC EC | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1CA
; Address: $E3EFD6
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1CA:
    JSR $1420            ; 20 20 14 | Jump to subroutine
    BRA $80              ; 80 80 | Branch always
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    STX $86              ; 86 86 | Store X register to zero page
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ASL $3F1E,X          ; 1E 1E 3F | Arithmetic shift left (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    INC $FCFF,X          ; FE FF FC | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1CB
; Address: $E3EFF3
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1CB:
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    INC $FCFE,X          ; FE FE FC | Increment (absolute,X)
    SBC $DBFD,X          ; FD FD DB | Subtract with carry (absolute,X)
    LDA                  ; BF F8 01 67 | Load from absolute long,X into accumulator
    EOR ($DF,X)          ; 41 DF | Exclusive OR with accumulator ((zero page,X))
    LDA                  ; BF BF 0A B5 | Load from absolute long,X into accumulator
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    LDA $3BBE,X          ; BD BE 3B | Load from absolute,X into accumulator
    AND $3F37,X          ; 3D 37 3F | Logical AND with accumulator (absolute,X)
    STA                  ; 9F FF F1 FF | Store accumulator to absolute long,X
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    STX $847F            ; 8E 7F 84 | Store X register to absolute address
    CMP $7B              ; C5 7B | Compare accumulator (zero page)
    BRA $FF              ; 80 FF | Branch always
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    PEA #$FE80           ; F4 80 FE | Push effective address to stack
    LDY $7FBE,X          ; BC BE 7F | Load from absolute,X into Y register
    ORA ($C3,X)          ; 01 C3 | Logical OR with accumulator ((zero page,X))
    SBC $93EC,X          ; FD EC 93 | Subtract with carry (absolute,X)
    DEC                  ; 3A | Decrement accumulator
    SED                  ; F8 | Set decimal mode flag
    SBC $3A              ; E5 3A | Subtract with carry (zero page)
    BRA $FF              ; 80 FF | Branch always
    ORA $1F7F,X          ; 1D 7F 1F | Logical OR with accumulator (absolute,X)
    LDA                  ; BF FF FF FF | Load from absolute long,X into accumulator
    LDA $B6FF,X          ; BD FF B6 | Load from absolute,X into accumulator
    SBC $E686,Y          ; F9 86 E6 | Subtract with carry (absolute,Y)
    ORA $10FF,Y          ; 19 FF 10 | Logical OR with accumulator (absolute,Y)
    BVS $AF              ; 70 AF | Branch if overflow set
    PHP                  ; 08 | Push processor status to stack
    LDA ($4E),Y          ; B1 4E | Load from (zero page),Y into accumulator
    SBC $FFFF,X          ; FD FF FF | Subtract with carry (absolute,X)
    LDA $2DD7            ; AD D7 2D | Load from absolute address into accumulator
    PHB                  ; 8B | Push data bank register to stack
    LSR                  ; 4A | Logical shift right (accumulator)
    EOR $EFA3,X          ; 5D A3 EF | Exclusive OR with accumulator (absolute,X)
    CMP ($F8),Y          ; D1 F8 | Compare accumulator ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    TSX                  ; BA | Transfer stack pointer to X register
    BRA $FA              ; 80 FA | Branch always
    LDX #$B4             ; A2 B4 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1CC
; Address: $E3F0A8
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1CC:
    JSR $F028            ; 20 28 F0 | Jump to subroutine
    CLV                  ; B8 | Clear overflow flag
    SBC $87FF,X          ; FD FF 87 | Subtract with carry (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    STY $82              ; 84 82 | Store Y register to zero page
    ORA $C0              ; 05 C0 | Logical OR with accumulator (zero page)
    BRA $D7              ; 80 D7 | Branch always
    LDY #$0C             ; A0 0C | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1CD
; Address: $E3F0C0
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1CD:
    TAY                  ; A8 | Transfer accumulator to Y register
    TAX                  ; AA | Transfer accumulator to X register
    INC $F303            ; EE 03 F3 | Increment (absolute)
    BMI $00              ; 30 00 | Branch if negative
    SBC $F100            ; ED 00 F1 | Subtract with carry (absolute)
    SBC $0055,X          ; FD 55 00 | Subtract with carry (absolute,X)
    LDA $1100            ; AD 00 11 | Load from absolute address into accumulator
    ASL $0200            ; 0E 00 02 | Arithmetic shift left (absolute)
    REP #$CA             ; C2 CA | Reset processor status bits
    CPY #$44             ; C0 44 | Compare Y register (immediate)
    CPX #$27             ; E0 27 | Compare X register (immediate)
    CPX #$AB             ; E0 AB | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1CE
; Address: $E3F0ED
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1CE:
    STA                  ; 9F 00 FF 35 | Store accumulator to absolute long,X
    CLD                  ; D8 | Clear decimal mode flag
    BCC $00              ; 90 00 | Branch if carry clear
    ADC #$09             ; 69 09 | Add with carry (immediate)
    CMP #$1F             ; C9 1F | Compare accumulator (immediate)
    PLX                  ; FA | Pull X register from stack
    LDA                  ; BF 1F E7 6F | Load from absolute long,X into accumulator
    BCC $7F              ; 90 7F | Branch if carry clear
    BRA $3C              ; 80 3C | Branch always
    EOR #$49             ; 49 49 | Exclusive OR with accumulator (immediate)
    DEC                  ; 3A | Decrement accumulator
    DEC                  ; 3A | Decrement accumulator
    LDA                  ; BF BF E7 E7 | Load from absolute long,X into accumulator
    BCC $90              ; 90 90 | Branch if carry clear
    BRA $80              ; 80 80 | Branch always
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    STA $FF7AFF          ; 8F FF 7A FF | Store accumulator to absolute long address
    PHP                  ; 08 | Push processor status to stack
    ADC $FE06,X          ; 7D 06 FE | Add with carry (absolute,X)
    CLC                  ; 18 | Clear carry flag
    TYA                  ; 98 | Transfer Y register to accumulator
    STA $7A7A8F          ; 8F 8F 7A 7A | Store accumulator to absolute long address
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    SBC $F8FF,Y          ; F9 FF F8 | Subtract with carry (absolute,Y)
    SBC #$FF             ; E9 FF | Subtract with carry (immediate)
    DEX                  ; CA | Decrement X register
    INC $FF59,X          ; FE 59 FF | Increment (absolute,X)
    CLD                  ; D8 | Clear decimal mode flag
    STA                  ; 9F E0 FF 00 | Store accumulator to absolute long,X
    CMP #$CD             ; C9 CD | Compare accumulator (immediate)
    SED                  ; F8 | Set decimal mode flag
    INC $F9E9,X          ; FE E9 F9 | Increment (absolute,X)
    DEX                  ; CA | Decrement X register
    XBA                  ; EB | Exchange accumulator bytes
    EOR $D85E,Y          ; 59 5E D8 | Exclusive OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1CF
; Address: $E3F15B
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1CF:
    INC $9CE0,X          ; FE E0 9C | Increment (absolute,X)
    TYA                  ; 98 | Transfer Y register to accumulator
    PEA #$F9BB           ; F4 BB F9 | Push effective address to stack
    LDX $CBB4,Y          ; BE B4 CB | Load from absolute,Y into X register
    PHP                  ; 08 | Push processor status to stack
    BEQ $0F              ; F0 0F | Branch if equal
    CLC                  ; 18 | Clear carry flag
    INC                  ; 1A | Increment accumulator
    LDY $BFBF,X          ; BC BF BF | Load from absolute,X into Y register
    LDA                  ; BF FE FE 78 | Load from absolute long,X into accumulator
    ASL $0FCF            ; 0E CF 0F | Arithmetic shift left (absolute)
    AND $DF18            ; 2D 18 DF | Logical AND with accumulator (absolute)
    ASL $C0DF,X          ; 1E DF C0 | Arithmetic shift left (absolute,X)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1D0
; Address: $E3F185
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1D0:
    STA                  ; 9F 20 DF 00 | Store accumulator to absolute long,X
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 04 FF 01 | Load from absolute long,X into accumulator
    AND ($F1),Y          ; 31 F1 | Logical AND with accumulator ((zero page),Y)
    BCC $70              ; 90 70 | Branch if carry clear
    PHA                  ; 48 | Push accumulator to stack
    PLA                  ; 68 | Pull accumulator from stack
    ORA $45              ; 05 45 | Logical OR with accumulator (zero page)
    STX $86              ; 86 86 | Store X register to zero page
    STA $02028F          ; 8F 8F 02 02 | Store accumulator to absolute long address
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    BEQ $FF              ; F0 FF | Branch if equal
    STA $0F213D          ; 8F 3D 21 0F | Store accumulator to absolute long address
    DEC $FFF3            ; CE F3 FF | Decrement (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    LDA                  ; BF F6 7F D9 | Load from absolute long,X into accumulator
    STA $E3E38F          ; 8F 8F E3 E3 | Store accumulator to absolute long address
    PLX                  ; FA | Pull X register from stack
    BEQ $FF              ; F0 FF | Branch if equal
    BIT #$FF             ; 89 FF | Test bits in accumulator (immediate)
    ROL $FF              ; 26 FF | Rotate left (zero page)
    INC $7EF7,X          ; FE F7 7E | Increment (absolute,X)
    LDX $EFCB,Y          ; BE CB EF | Load from absolute,Y into X register
    LDA                  ; BF 60 7F DA | Load from absolute long,X into accumulator
    STA                  ; 9F FF 0E FF | Store accumulator to absolute long,X
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    ASL $5FFF            ; 0E FF 5F | Arithmetic shift left (absolute)
    LDA                  ; BF FF 7D FF | Load from absolute long,X into accumulator
    ADC $7AFF,X          ; 7D FF 7A | Add with carry (absolute,X)
    CMP $FDFD,X          ; DD FD FD | Compare accumulator (absolute,X)
    ADC $B15E,X          ; 7D 5E B1 | Add with carry (absolute,X)
    JMP ($78B3)          ; 6C B3 78 | Jump to address (absolute indirect)
    SBC $DFE2            ; ED E2 DF | Subtract with carry (absolute)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1D1
; Address: $E3F226
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1D1:
    SBC $FFFF,X          ; FD FF FF | Subtract with carry (absolute,X)
    LDA                  ; BF 4F B1 38 | Load from absolute long,X into accumulator
    CPX $FB              ; E4 FB | Compare X register (zero page)
    STA                  ; 9F FF 7F BE | Store accumulator to absolute long,X
    LDA                  ; BF FF FF FF | Load from absolute long,X into accumulator
    ADC #$93             ; 69 93 | Add with carry (immediate)
    SBC $BFBA,X          ; FD BA BF | Subtract with carry (absolute,X)
    LDA                  ; BF C5 FF F0 | Load from absolute long,X into accumulator
    PLX                  ; FA | Pull X register from stack
    AND $FE              ; 25 FE | Logical AND with accumulator (zero page)
    NOP                  ; EA | No operation
    XBA                  ; EB | Exchange accumulator bytes
    PEA #$E0F5           ; F4 F5 E0 | Game work RAM access
    INC $FE3C,X          ; FE 3C FE | Increment (absolute,X)
    ROR $FE8C,X          ; 7E 8C FE | Rotate right (absolute,X)
    INC $FCEE,X          ; FE EE FC | Increment (absolute,X)
    CPY $EC1F            ; CC 1F EC | Compare Y register (absolute)
    CLV                  ; B8 | Clear overflow flag
    INC $6D7F,X          ; FE 7F 6D | Increment (absolute,X)
    ADC $719F,Y          ; 79 9F 71 | Add with carry (absolute,Y)
    STA $08776E          ; 8F 6E 77 08 | Store accumulator to absolute long address
    DEY                  ; 88 | Decrement Y register
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY $00              ; C4 00 | Compare Y register (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1D2
; Address: $E3F29A
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1D2:
    BVS $00              ; 70 00 | Branch if overflow set
    DEY                  ; 88 | Decrement Y register
    BRA $00              ; 80 00 | Branch always
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    BPL $EF              ; 10 EF | Branch if positive
    ORA $1B1B            ; 0D 1B 1B | Logical OR with accumulator (absolute)
    ORA #$02             ; 09 02 | Logical OR with accumulator (immediate)
    CPX $FF              ; E4 FF | Compare X register (zero page)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    PHA                  ; 48 | Push accumulator to stack
    AND ($06),Y          ; 31 06 | Logical AND with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    ASL $7971,X          ; 1E 71 79 | Arithmetic shift left (absolute,X)
    PLX                  ; FA | Pull X register from stack
    BRA $FC              ; 80 FC | Branch always
    INC $F4FF,X          ; FE FF F4 | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BEQ $0F              ; F0 0F | Branch if equal
    STZ $EE61,X          ; 9E 61 EE | Store zero to absolute,X
    ORA ($D1),Y          ; 11 D1 | Logical OR with accumulator ((zero page),Y)
    ROL $1AE5            ; 2E E5 1A | Rotate left (absolute)
    EOR $C0A6,Y          ; 59 A6 C0 | Exclusive OR with accumulator (absolute,Y)
    ASL $180F            ; 0E 0F 18 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1D3
; Address: $E3F2F4
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1D3:
    RTI                  ; 40 | Return from interrupt
    ADC ($23,X)          ; 61 23 | Add with carry ((zero page,X))
    ROL $1E06            ; 2E 06 1E | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1D4
; Address: $E3F2FC
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1D4:
    JSR $E4A6            ; 20 A6 E4 | Jump to subroutine
    JMP $3B0CF3          ; 5C F3 0C 3B | Jump to address long
    CPY $1F              ; C4 1F | Compare Y register (zero page)
    SBC ($BF,X)          ; E1 BF | Subtract with carry ((zero page,X))
    INX                  ; E8 | Increment X register
    CPX $3813            ; EC 13 38 | Compare X register (absolute)
    PHP                  ; 08 | Push processor status to stack
    STY $C4              ; 84 C4 | Store Y register to zero page
    EOR ($E1,X)          ; 41 E1 | Exclusive OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    ASL $0E1F            ; 0E 1F 0E | Arithmetic shift left (absolute)
    ORA $1CF3            ; 0D F3 1C | Logical OR with accumulator (absolute)
    SBC $3122,X          ; FD 22 31 | Subtract with carry (absolute,X)
    INC $D6FF,X          ; FE FF D6 | Increment (absolute,X)
    INC $DF05,X          ; FE 05 DF | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1D5
; Address: $E3F32F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1D5:
    JSR $0F0F            ; 20 0F 0F | Jump to subroutine
    AND $31FF,X          ; 3D FF 31 | Logical AND with accumulator (absolute,X)
    INC $D682,X          ; FE 82 D6 | Increment (absolute,X)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1D6
; Address: $E3F33E
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1D6:
    JSR $FC20            ; 20 20 FC | Jump to subroutine
    CLV                  ; B8 | Clear overflow flag
    ROL $1CF1,X          ; 3E F1 1C | Rotate left (absolute,X)
    ROR $00FF            ; 6E FF 00 | Rotate right (absolute)
    AND $FFCE,Y          ; 39 CE FF | Logical AND with accumulator (absolute,Y)
    CLV                  ; B8 | Clear overflow flag
    SBC ($3E),Y          ; F1 3E | Subtract with carry ((zero page),Y)
    ROR $006F            ; 6E 6F 00 | Rotate right (absolute)
    DEC $0FCE            ; CE CE 0F | Decrement (absolute)
    ASL $FFFF,X          ; 1E FF FF | Arithmetic shift left (absolute,X)
    ADC $BFF9            ; 6D F9 BF | Add with carry (absolute)
    SBC $FFBF,Y          ; F9 BF FF | Subtract with carry (absolute,Y)
    INC $FF73,X          ; FE 73 FF | Increment (absolute,X)
    ROR                  ; 6A | Rotate right (accumulator)
    CLV                  ; B8 | Clear overflow flag
    LDA                  ; BF B0 BF 19 | Load from absolute long,X into accumulator
    AND ($3F),Y          ; 31 3F | Logical AND with accumulator ((zero page),Y)
    JMP $EF7F            ; 4C 7F EF | Jump to address
    STZ $AAFF,X          ; 9E FF AA | Store zero to absolute,X
    LSR $DAFF            ; 4E FF DA | Logical shift right (absolute)
    CMP $BBFF,Y          ; D9 FF BB | Compare accumulator (absolute,Y)
    CPY $FF              ; C4 FF | Compare Y register (zero page)
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    ADC ($FF,X)          ; 61 FF | Add with carry ((zero page,X))
    LDA                  ; BF FF FD FF | Load from absolute long,X into accumulator
    ORA $D7FF,Y          ; 19 FF D7 | Logical OR with accumulator (absolute,Y)
    PLY                  ; 7A | Pull Y register from stack
    DEX                  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1D7
; Address: $E3F3A6
; Size: 124 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1D7:
    LDY $FF5C,X          ; BC 5C FF | Load from absolute,X into Y register
    CMP #$B4             ; C9 B4 | Compare accumulator (immediate)
    STY $A5              ; 84 A5 | Store Y register to zero page
    LDA ($EE,X)          ; A1 EE | Load from (zero page,X) into accumulator
    INC $FFE6            ; EE E6 FF | Increment (absolute)
    ROL $3FFF            ; 2E FF 3F | Rotate left (absolute)
    LDA                  ; BF FF CF FF | Load from absolute long,X into accumulator
    LDA                  ; BF FF FF FF | Load from absolute long,X into accumulator
    LDA $2F0B4F          ; AF 4F 0B 2F | Load from absolute long address into accumulator
    CMP $05              ; C5 05 | Compare accumulator (zero page)
    INC $7B22            ; EE 22 7B | Increment (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    CMP $FFFF,X          ; DD FF FF | Compare accumulator (absolute,X)
    INC $3EFF,X          ; FE FF 3E | Increment (absolute,X)
    SBC $F9F9,Y          ; F9 F9 F9 | Subtract with carry (absolute,Y)
    SBC $D9D9,Y          ; F9 D9 D9 | Subtract with carry (absolute,Y)
    CMP $C7              ; C5 C7 | Compare accumulator (zero page)
    INC $DDEF,X          ; FE EF DD | Increment (absolute,X)
    INC $FF96            ; EE 96 FF | Increment (absolute)
    SBC $FD7E,X          ; FD 7E FD | Subtract with carry (absolute,X)
    LSR $FFFF,X          ; 5E FF FF | Logical shift right (absolute,X)
    STA                  ; 9F FF FF FF | Store accumulator to absolute long,X
    AND ($FF),Y          ; 31 FF | Logical AND with accumulator ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    JMP $03B3            ; 4C B3 03 | Jump to address
    SBC $FF01,X          ; FD 01 FF | Subtract with carry (absolute,X)
    AND $FCC7,Y          ; 39 C7 FC | Logical AND with accumulator (absolute,Y)
    PEA #$E7F7           ; F4 F7 E7 | Push effective address to stack
    SBC ($F7),Y          ; F1 F7 | Subtract with carry ((zero page),Y)
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    INC $FF              ; E6 FF | Increment (zero page)
    SEC                  ; 38 | Set carry flag
    ROR $F8DD,X          ; 7E DD F8 | Rotate right (absolute,X)
    BEQ $DF              ; F0 DF | Branch if equal
    BEQ $BF              ; F0 BF | Branch if equal
    CPX #$FE             ; E0 FE | Compare X register (immediate)
    ADC $F8FB,Y          ; 79 FB F8 | Add with carry (absolute,Y)
    BRA $F1              ; 80 F1 | Branch always
    BEQ $F1              ; F0 F1 | Branch if equal
    BVS $F0              ; 70 F0 | Branch if overflow set
    BCS $F8              ; B0 F8 | Branch if carry set
    BMI $F8              ; 30 F8 | Branch if negative
    BRA $F8              ; 80 F8 | Branch always
    BEQ $38              ; F0 38 | Branch if equal
    CPY #$0E             ; C0 0E | Compare Y register (immediate)
    BEQ $0E              ; F0 0E | Branch if equal
    BEQ $2F              ; F0 2F | Branch if equal
    BNE $1F              ; D0 1F | Branch if not equal
    CPX #$3F             ; E0 3F | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1D8
; Address: $E3F45D
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1D8:
    BMI $0F              ; 30 0F | Branch if negative
    PLP                  ; 28 | Pull processor status from stack
    LDA                  ; BF 18 B8 00 | Load from absolute long,X into accumulator
    SEC                  ; 38 | Set carry flag
    AND ($04),Y          ; 31 04 | Logical AND with accumulator ((zero page),Y)
    LDA $1E8F0C          ; AF 0C 8F 1E | Load from absolute long address into accumulator
    STA                  ; 9F 40 10 47 | Store accumulator to absolute long,X
    CLI                  ; 58 | Clear interrupt disable flag
    CLI                  ; 58 | Clear interrupt disable flag
    BVS $00              ; 70 00 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1D9
; Address: $E3F480
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1D9:
    INC $FF26,X          ; FE 26 FF | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    ROL $07FF,X          ; 3E FF 07 | Rotate left (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CPX $BCE3            ; EC E3 BC | Compare X register (absolute)
    BRA $DB              ; 80 DB | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    ASL $18FE            ; 0E FE 18 | Arithmetic shift left (absolute)
    BEQ $C1              ; F0 C1 | Branch if equal
    DEC $27F8,X          ; DE F8 27 | Decrement (absolute,X)
    JMP $F5CCD3          ; 5C D3 CC F5 | Jump to address long
    SBC #$D1             ; E9 D1 | Subtract with carry (immediate)
    STA ($FE,X)          ; 81 FE | Store accumulator to (zero page,X)
    BRA $F0              ; 80 F0 | Branch always
    INC $FF1C,X          ; FE 1C FF | Increment (absolute,X)
    SEC                  ; 38 | Set carry flag
    ROL $7FFF,X          ; 3E FF 7F | Rotate left (absolute,X)
    STX $79              ; 86 79 | Store X register to zero page
    STZ $FF61,X          ; 9E 61 FF | Store zero to absolute,X
    BIT #$76             ; 89 76 | Test bits in accumulator (immediate)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1DA
; Address: $E3F508
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1DA:
    JSR $7CC7            ; 20 C7 7C | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1DB
; Address: $E3F510
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1DB:
    BVS $79              ; 70 79 | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    ROR $76              ; 66 76 | Rotate right (zero page)
    STX $FF              ; 86 FF | Store X register to zero page
    CPX $DC23            ; EC 23 DC | Compare X register (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    BMI $03              ; 30 03 | Branch if negative
    BRA $7F              ; 80 7F | Branch always
    BRA $88              ; 80 88 | Branch always
    CPX $DC00            ; EC 00 DC | Compare X register (absolute)
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1DD
; Address: $E3F53D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1DD:
    BRA $80              ; 80 80 | Branch always
    BRA $FE              ; 80 FE | Branch always
    LDX #$FF             ; A2 FF | Load immediate value into X register
    LDA                  ; BF FF EF FF | Load from absolute long,X into accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1E0
; Address: $E3F563
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1E0:
    ROL $FD              ; 26 FD | Rotate left (zero page)
    CMP $DAFB,X          ; DD FB DA | Compare accumulator (absolute,X)
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    CPY $C9FF            ; CC FF C9 | Compare Y register (absolute)
    LDA                  ; BF FF FF FF | Load from absolute long,X into accumulator
    INC $CEFE,X          ; FE FE CE | Increment (absolute,X)
    INC $F9C9,X          ; FE C9 F9 | Increment (absolute,X)
    INC $9DF8,X          ; FE F8 9D | Increment (absolute,X)
    BCC $87              ; 90 87 | Branch if carry clear
    BRA $FC              ; 80 FC | Branch always
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    EOR $F7              ; 45 F7 | Exclusive OR with accumulator (zero page)
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    SED                  ; F8 | Set decimal mode flag
    LDA                  ; BF 65 7D 62 | Load from absolute long,X into accumulator
    NOP                  ; EA | No operation
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ADC $C1FF,Y          ; 79 FF C1 | Add with carry (absolute,Y)
    STA $037780          ; 8F 80 77 03 | Store accumulator to absolute long address
    BNE $F3              ; D0 F3 | Branch if not equal
    LDY #$C1             ; A0 C1 | Load immediate value into Y register
    ADC $C1FF,Y          ; 79 FF C1 | Add with carry (absolute,Y)
    BRA $FF              ; 80 FF | Branch always
    BEQ $FF              ; F0 FF | Branch if equal
    LDY #$BF             ; A0 BF | Load immediate value into Y register
    INC $FE8F,X          ; FE 8F FE | Increment (absolute,X)
    STA                  ; 9F 03 EF 03 | Store accumulator to absolute long,X
    STX $16FF            ; 8E FF 16 | Store X register to absolute address
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SBC $FF4F,X          ; FD 4F FF | Subtract with carry (absolute,X)
    STA $FFCFFF          ; 8F FF CF FF | Store accumulator to absolute long address
    DEC $0FFF            ; CE FF 0F | Decrement (absolute)
    INC $EC17,X          ; FE 17 EC | Increment (absolute,X)
    STX $8EF3            ; 8E F3 8E | Store X register to absolute address
    DEC $E5FF            ; CE FF E5 | Decrement (absolute)
    XBA                  ; EB | Exchange accumulator bytes
    SBC #$FB             ; E9 FB | Subtract with carry (immediate)
    SBC $F8F9,Y          ; F9 F9 F8 | Subtract with carry (absolute,Y)
    SBC $F9F8,Y          ; F9 F8 F9 | Subtract with carry (absolute,Y)
    BEQ $FF              ; F0 FF | Branch if equal
    CPX #$FF             ; E0 FF | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1E1
; Address: $E3F610
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1E1:
    CPX #$FC             ; E0 FC | Compare X register (immediate)
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    CPX $EE38            ; EC 38 EE | Compare X register (absolute)
    CLV                  ; B8 | Clear overflow flag
    ROL $1EDC,X          ; 3E DC 1E | Rotate left (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    BEQ $70              ; F0 70 | Branch if equal
    CPX #$80             ; E0 80 | Compare X register (immediate)
    INY                  ; C8 | Increment Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    BRA $8C              ; 80 8C | Branch always
    BRA $DC              ; 80 DC | Branch always
    CPY #$3E             ; C0 3E | Compare Y register (immediate)
    CPX #$1E             ; E0 1E | Compare X register (immediate)
    BEQ $FE              ; F0 FE | Branch if equal
    BEQ $D6              ; F0 D6 | Branch if equal
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ROL $7EBB,X          ; 3E BB 7E | Rotate left (absolute,X)
    EOR $7F7E,X          ; 5D 7E 7F | Exclusive OR with accumulator (absolute,X)
    ROL $1E37,X          ; 3E 37 1E | Rotate left (absolute,X)
    ASL $0FE7,X          ; 1E E7 0F | Arithmetic shift left (absolute,X)
    LDX #$00             ; A2 00 | Load immediate value into X register
    BRA $00              ; 80 00 | Branch always
    INY                  ; C8 | Increment Y register
    JMP $001800          ; 5C 00 18 00 | Jump to address long
    STY $00              ; 84 00 | Store Y register to zero page
    BEQ $00              ; F0 00 | Branch if equal
    AND $FF              ; 25 FF | Logical AND with accumulator (zero page)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    EOR $FF              ; 45 FF | Exclusive OR with accumulator (zero page)
    NOP                  ; EA | No operation
    STZ $FB              ; 64 FB | Store zero to zero page
    LDA                  ; BF BB E7 27 | Load from absolute long,X into accumulator
    SBC ($31),Y          ; F1 31 | Subtract with carry ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    ASL $80FF            ; 0E FF 80 | Arithmetic shift left (absolute)
    LDA ($9E,X)          ; A1 9E | Load from (zero page,X) into accumulator
    AND ($FF),Y          ; 31 FF | Logical AND with accumulator ((zero page),Y)
    STA                  ; 9F E4 E7 DF | Store accumulator to absolute long,X
    DEC $E6              ; C6 E6 | Decrement (zero page)
    INC $F8              ; E6 F8 | Increment (zero page)
    EOR $FFFF,Y          ; 59 FF FF | Exclusive OR with accumulator (absolute,Y)
    ASL $00FF            ; 0E FF 00 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1E2
; Address: $E3F6DA
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1E2:
    AND $19FF,Y          ; 39 FF 19 | Logical AND with accumulator (absolute,Y)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BRA $FF              ; 80 FF | Branch always
    INX                  ; E8 | Increment X register
    CPY $D621            ; CC 21 D6 | Compare Y register (absolute)
    CMP $67FF,Y          ; D9 FF 67 | Compare accumulator (absolute,Y)
    CPX #$F4             ; E0 F4 | Compare X register (immediate)
    BPL $F8              ; 10 F8 | Branch if positive
    SED                  ; F8 | Set decimal mode flag
    CPX #$71             ; E0 71 | Compare X register (immediate)
    STX $00FF            ; 8E FF 00 | Store X register to absolute address
    DEC $1031            ; CE 31 10 | Decrement (absolute)
    PLA                  ; 68 | Pull accumulator from stack
    CPY #$E0             ; C0 E0 | Game work RAM access
    STX $0000            ; 8E 00 00 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1E3
; Address: $E3F716
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1E3:
    JSR $7931            ; 20 31 79 | Jump to subroutine
    STA                  ; 9F 60 18 E7 | Store accumulator to absolute long,X
    BEQ $0F              ; F0 0F | Branch if equal
    CPY $100F            ; CC 0F 10 | Compare Y register (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1E4
; Address: $E3F736
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1E4:
    WDM #$E7             ; 42 E7 | Reserved instruction
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    CPY #$CC             ; C0 CC | Compare Y register (immediate)
    BEQ $F0              ; F0 F0 | Branch if equal
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    STA $609F70          ; 8F 70 9F 60 | Store accumulator to absolute long address
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1E6
; Address: $E3F75F
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1E6:
    CPY #$FC             ; C0 FC | Compare Y register (immediate)
    SBC #$16             ; E9 16 | Subtract with carry (immediate)
    BPL $07              ; 10 07 | Branch if positive
    SBC $7887,Y          ; F9 87 78 | Subtract with carry (absolute,Y)
    SEC                  ; 38 | Set carry flag
    BPL $71              ; 10 71 | Branch if positive
    SBC $7830,Y          ; F9 30 78 | Subtract with carry (absolute,Y)
    SEC                  ; 38 | Set carry flag
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BVS $F0              ; 70 F0 | Branch if overflow set
    BMI $BB              ; 30 BB | Branch if negative
    ROL $EF              ; 26 EF | Rotate left (zero page)
    PHP                  ; 08 | Push processor status to stack
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BVS $7F              ; 70 7F | Branch if overflow set
    AND ($3F),Y          ; 31 3F | Logical AND with accumulator ((zero page),Y)
    ROL $3E              ; 26 3E | Rotate left (zero page)
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1E8
; Address: $E3F7A8
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1E8:
    SED                  ; F8 | Set decimal mode flag
    DEY                  ; 88 | Decrement Y register
    ORA ($BE),Y          ; 11 BE | Logical OR with accumulator ((zero page),Y)
    LDX $62              ; A6 62 | Load from zero page into X register
    SBC $FFFF,X          ; FD FF FF | Subtract with carry (absolute,X)
    STA $FF0FFF          ; 8F FF 0F FF | Store accumulator to absolute long address
    ORA ($F3),Y          ; 11 F3 | Logical OR with accumulator ((zero page),Y)
    SBC $F9FD            ; ED FD F9 | Subtract with carry (absolute)
    SBC $C0C0,Y          ; F9 C0 C0 | Subtract with carry (absolute,Y)
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPX #$E0             ; E0 E0 | Game work RAM access
    BRA $80              ; 80 80 | Branch always
    INC                  ; 1A | Increment accumulator
    INC $FFFF            ; EE FF FF | Increment (absolute)
    SBC ($E0,X)          ; E1 E0 | Game work RAM access
    CPY #$C7             ; C0 C7 | Compare Y register (immediate)
    STA $9DFF,Y          ; 99 FF 9D | Store accumulator to absolute,Y
    STA $0F1F1C          ; 8F 1C 1F 0F | Store accumulator to absolute long address
    ROR $0E              ; 66 0E | Rotate right (zero page)
    AND $7027            ; 2D 27 70 | Logical AND with accumulator (absolute)
    CPX #$78             ; E0 78 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $F0              ; 80 F0 | Branch always
    BRA $E0              ; 80 E0 | Game work RAM access
    BRA $99              ; 80 99 | Branch always
    CLD                  ; D8 | Clear decimal mode flag
    BEQ $73              ; F0 73 | Branch if equal
    PEA #$C0FF           ; F4 FF C0 | Push effective address to stack
    REP #$C0             ; C2 C0 | Reset processor status bits
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    SBC #$08             ; E9 08 | Subtract with carry (immediate)
    DEY                  ; 88 | Decrement Y register
    STY $0030            ; 8C 30 00 | Store Y register to absolute address
    ORA $3D00            ; 0D 00 3D | Logical OR with accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    BMI $00              ; 30 00 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    BEQ $04              ; F0 04 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    SEI                  ; 78 | Set interrupt disable flag
    SBC $FD5D,X          ; FD 5D FD | Subtract with carry (absolute,X)
    LDA $6EFE            ; AD FE 6E | Load from absolute address into accumulator
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1E9
; Address: $E3F84C
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1E9:
    INX                  ; E8 | Increment X register
    TAY                  ; A8 | Transfer accumulator to Y register
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    PLX                  ; FA | Pull X register from stack
    LDA $DAA4,X          ; BD A4 DA | Load from absolute,X into accumulator
    REP #$40             ; C2 40 | Reset processor status bits
    RTI                  ; 40 | Return from interrupt
    BCS $B0              ; B0 B0 | Branch if carry set
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    WDM #$FF             ; 42 FF | Reserved instruction
    AND $FF              ; 25 FF | Logical AND with accumulator (zero page)
    LDA                  ; BF FF 4F FF | Load from absolute long,X into accumulator
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    PLA                  ; 68 | Pull accumulator from stack
    REP #$C0             ; C2 C0 | Reset processor status bits
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1EB
; Address: $E3F88A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1EB:
    ORA ($10),Y          ; 11 10 | Logical OR with accumulator ((zero page),Y)
    BRA $80              ; 80 80 | Branch always
    EOR ($41,X)          ; 41 41 | Exclusive OR with accumulator ((zero page,X))
    AND $9FFF,X          ; 3D FF 9F | Logical AND with accumulator (absolute,X)
    LDX $F4FF,Y          ; BE FF F4 | Load from absolute,Y into X register
    BVS $6F              ; 70 6F | Branch if overflow set

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1EC
; Address: $E3F8A4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1EC:
    JSR $041F            ; 20 1F 04 | Jump to subroutine
    EOR $40              ; 45 40 | Exclusive OR with accumulator (zero page)
    EOR ($10),Y          ; 51 10 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1ED
; Address: $E3F8AE
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1ED:
    JSR $0F00            ; 20 00 0F | Jump to subroutine
    STZ $FFFF            ; 9C FF FF | Store zero to absolute
    LDA                  ; BF FF FF FF | Load from absolute long,X into accumulator
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 82 0C 00 | Load from absolute long,X into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    DEC $2320,X          ; DE 20 23 | Decrement (absolute,X)
    CPY #$CF             ; C0 CF | Compare Y register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    ORA #$D9             ; 09 D9 | Logical OR with accumulator (immediate)
    ASL $FC              ; 06 FC | Arithmetic shift left (zero page)
    SBC $FFFF,X          ; FD FF FF | Subtract with carry (absolute,X)
    ROL $E141,X          ; 3E 41 E1 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1EE
; Address: $E3F903
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1EE:
    ASL $03FC,X          ; 1E FC 03 | Arithmetic shift left (absolute,X)
    LDA                  ; BF 40 4C B3 | Load from absolute long,X into accumulator
    BMI $CF              ; 30 CF | Branch if negative
    TYA                  ; 98 | Transfer Y register to accumulator
    BIT $80D3            ; 2C D3 80 | Test bits in accumulator (absolute)
    CMP ($F3,X)          ; C1 F3 | Compare accumulator ((zero page,X))
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    CPX #$BF             ; E0 BF | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    SBC $B002,X          ; FD 02 B0 | Subtract with carry (absolute,X)
    CPY #$08             ; C0 08 | Compare Y register (immediate)
    STY $40              ; 84 40 | Store Y register to zero page
    LDA                  ; BF C0 E0 80 | Load from absolute long,X into accumulator
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    STX $CF              ; 86 CF | Store X register to zero page
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    AND ($DE,X)          ; 21 DE | Logical AND with accumulator ((zero page,X))
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ASL $DECC            ; 0E CC DE | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    ASL $3F3F,X          ; 1E 3F 3F | Arithmetic shift left (absolute,X)
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    BRA $87              ; 80 87 | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    BRA $80              ; 80 80 | Branch always
    CPY #$F8             ; C0 F8 | Compare Y register (immediate)
    JMP ($1FFF)          ; 6C FF 1F | Jump to address (absolute indirect)
    ORA $3FFF,Y          ; 19 FF 3F | Logical OR with accumulator (absolute,Y)
    ORA $3F99,Y          ; 19 99 3F | Logical OR with accumulator (absolute,Y)
    PHA                  ; 48 | Push accumulator to stack
    ADC $F3D0,Y          ; 79 D0 F3 | Add with carry (absolute,Y)
    CMP ($D3),Y          ; D1 D3 | Compare accumulator ((zero page),Y)
    CMP ($C5,X)          ; C1 C5 | Compare accumulator ((zero page,X))
    CPY #$D9             ; C0 D9 | Compare Y register (immediate)
    CPY #$F3             ; C0 F3 | Compare Y register (immediate)
    BRA $46              ; 80 46 | Branch always
    DEY                  ; 88 | Decrement Y register
    ROL $C0C6            ; 2E C6 C0 | Rotate left (absolute)
    DEC $ECC0            ; CE C0 EC | Decrement (absolute)
    CPY #$FE             ; C0 FE | Compare Y register (immediate)
    CPY #$FE             ; C0 FE | Compare Y register (immediate)
    INY                  ; C8 | Increment Y register
    CPY $39C0            ; CC C0 39 | Compare Y register (absolute)
    ADC ($20),Y          ; 71 20 | Add with carry ((zero page),Y)
    BRA $B1              ; 80 B1 | Branch always

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1EF
; Address: $E3F9C2
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1EF:
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$E8             ; C0 E8 | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    STA                  ; 9F 00 12 00 | Store accumulator to absolute long,X
    EOR ($5E,X)          ; 41 5E | Exclusive OR with accumulator ((zero page,X))
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    BVS $58              ; 70 58 | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    PLA                  ; 68 | Pull accumulator from stack
    BRA $D8              ; 80 D8 | Branch always
    BCC $00              ; 90 00 | Branch if carry clear
    TAY                  ; A8 | Transfer accumulator to Y register
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BVS $00              ; 70 00 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BVC $50              ; 50 50 | Branch if overflow clear
    BCC $10              ; 90 10 | Branch if carry clear
    DEC $C2              ; C6 C2 | Decrement (zero page)
    WDM #$01             ; 42 01 | Reserved instruction
    ORA ($85,X)          ; 01 85 | Logical OR with accumulator ((zero page,X))
    BRA $3F              ; 80 3F | Branch always
    LDA $FF6FFF          ; AF FF 6F FF | Load from absolute long address into accumulator
    AND $B9FF,Y          ; 39 FF B9 | Logical AND with accumulator (absolute,Y)
    INC $7FFF,X          ; FE FF 7F | Increment (absolute,X)
    ASL $4E1E,X          ; 1E 1E 4E | Arithmetic shift left (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1F0
; Address: $E3FA46
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1F0:
    JSL $010822          ; 22 22 08 01 | Jump to subroutine long
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    BRA $E1              ; 80 E1 | Branch always
    LDA ($FF),Y          ; B1 FF | Load from (zero page),Y into accumulator
    SBC $DDFF,Y          ; F9 FF DD | Subtract with carry (absolute,Y)
    BPL $10              ; 10 10 | Branch if positive
    TXA                  ; 8A | Transfer X register to accumulator
    PHP                  ; 08 | Push processor status to stack
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    BCS $00              ; B0 00 | Branch if carry set
    EOR $7E80,X          ; 5D 80 7E | Exclusive OR with accumulator (absolute,X)
    BRA $F9              ; 80 F9 | Branch always
    CPY $50FF            ; CC FF 50 | Compare Y register (absolute)
    AND $BE00,Y          ; 39 00 BE | Logical AND with accumulator (absolute,Y)
    ORA ($EF,X)          ; 01 EF | Logical OR with accumulator ((zero page,X))
    ORA ($DF,X)          ; 01 DF | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1F1
; Address: $E3FA8B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1F1:
    BIT $F7              ; 24 F7 | Test bits in accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    EOR $2740            ; 4D 40 27 | Exclusive OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1F2
; Address: $E3FAA3
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1F2:
    JSR $30B7            ; 20 B7 30 | Jump to subroutine
    BRA $FD              ; 80 FD | Branch always
    PHP                  ; 08 | Push processor status to stack
    LDA                  ; BF FF DF FF | Load from absolute long,X into accumulator
    LSR $A321,X          ; 5E 21 A3 | Logical shift right (absolute,X)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BEQ $03              ; F0 03 | Branch if equal
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    SBC $FFFF            ; ED FF FF | Subtract with carry (absolute)
    CPX #$0B             ; E0 0B | Compare X register (immediate)
    PEA #$3BC4           ; F4 C4 3B | Push effective address to stack
    DEC                  ; 3A | Decrement accumulator
    CMP $9F              ; C5 9F | Compare accumulator (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1F3
; Address: $E3FAEA
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1F3:
    DEC $E631            ; CE 31 E6 | Decrement (absolute)
    ORA $EE11,Y          ; 19 11 EE | Logical OR with accumulator (absolute,Y)
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    BEQ $8F              ; F0 8F | Branch if equal
    BVS $E0              ; 70 E0 | Game work RAM access
    SBC $0006,Y          ; F9 06 00 | Subtract with carry (absolute,Y)
    CPX $03              ; E4 03 | Compare X register (zero page)
    CPX #$FA             ; E0 FA | Compare X register (immediate)
    BEQ $80              ; F0 80 | Branch if equal
    BEQ $F9              ; F0 F9 | Branch if equal
    STA $FF              ; 85 FF | Store accumulator to zero page
    CPX $9F              ; E4 9F | Compare X register (zero page)
    BEQ $80              ; F0 80 | Branch if equal
    CLI                  ; 58 | Clear interrupt disable flag
    BRA $9F              ; 80 9F | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1F4
; Address: $E3FB2B
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1F4:
    CPX #$38             ; E0 38 | Compare X register (immediate)
    CLC                  ; 18 | Clear carry flag
    CLI                  ; 58 | Clear interrupt disable flag
    BRA $C0              ; 80 C0 | Branch always
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$7E             ; E0 7E | Compare X register (immediate)
    SBC $9C02,X          ; FD 02 9C | Subtract with carry (absolute,X)
    ADC $837C,X          ; 7D 7C 83 | Add with carry (absolute,X)
    BIT #$76             ; 89 76 | Test bits in accumulator (immediate)
    SBC $FF06,Y          ; F9 06 FF | Subtract with carry (absolute,Y)
    EOR ($63,X)          ; 41 63 | Exclusive OR with accumulator ((zero page,X))
    ROR $3EFF,X          ; 7E FF 3E | Rotate right (absolute,X)
    ROR $0600,X          ; 7E 00 06 | Rotate right (absolute,X)
    CPY #$DF             ; C0 DF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1F6
; Address: $E3FB67
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1F6:
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BRA $C0              ; 80 C0 | Branch always
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $FC              ; F0 FC | Branch if equal
    BRA $C0              ; 80 C0 | Branch always
    PHP                  ; 08 | Push processor status to stack
    BPL $DE              ; 10 DE | Branch if positive
    CLI                  ; 58 | Clear interrupt disable flag
    STA                  ; 9F 80 BF C0 | Store accumulator to absolute long,X
    CPY #$67             ; C0 67 | Compare Y register (immediate)
    DEX                  ; CA | Decrement X register
    INC $F000,X          ; FE 00 F0 | Increment (absolute,X)
    ASL $C4E5            ; 0E E5 C4 | Arithmetic shift left (absolute)
    LDY #$80             ; A0 80 | Load immediate value into Y register
    CMP ($81,X)          ; C1 81 | Compare accumulator ((zero page,X))
    JMP $5E40            ; 4C 40 5E | Jump to address
    LSR $F5              ; 46 F5 | Logical shift right (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1F7
; Address: $E3FBA3
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1F7:
    JSR $F100            ; 20 00 F1 | Jump to subroutine
    BRA $BF              ; 80 BF | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    PLY                  ; 7A | Pull Y register from stack
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1F8
; Address: $E3FBB9
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1F8:
    PHP                  ; 08 | Push processor status to stack
    LDA ($01,X)          ; A1 01 | Load from (zero page,X) into accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    PHB                  ; 8B | Push data bank register to stack
    INC                  ; 1A | Increment accumulator
    AND #$3F             ; 29 3F | Logical AND with accumulator (immediate)
    ROR $FF              ; 66 FF | Rotate right (zero page)
    ASL $67              ; 06 67 | Arithmetic shift left (zero page)
    ORA #$3F             ; 09 3F | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDA $28E8,X          ; BD E8 28 | Load from absolute,X into accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1FA
; Address: $E3FBD4
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1FA:
    TYA                  ; 98 | Transfer Y register to accumulator
    SBC $3A38,Y          ; F9 38 3A | Subtract with carry (absolute,Y)
    AND $113E,Y          ; 39 3E 11 | Logical AND with accumulator (absolute,Y)
    DEC $C5              ; C6 C5 | Decrement (zero page)
    CMP $84              ; C5 84 | Compare accumulator (zero page)
    LDA                  ; BF FF 7F FF | Load from absolute long,X into accumulator
    ASL $C101,X          ; 1E 01 C1 | Arithmetic shift left (absolute,X)
    ROL $BC43,X          ; 3E 43 BC | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1FB
; Address: $E3FBF6
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1FB:
    INC $19              ; E6 19 | Increment (zero page)
    STA                  ; 9F 66 9F 62 | Store accumulator to absolute long,X
    PHB                  ; 8B | Push data bank register to stack
    CMP $0024            ; CD 24 00 | Compare accumulator (absolute)
    CPY #$97             ; C0 97 | Compare Y register (immediate)
    BRA $43              ; 80 43 | Branch always
    BPL $93              ; 10 93 | Branch if positive
    BPL $67              ; 10 67 | Branch if positive
    XBA                  ; EB | Exchange accumulator bytes
    SBC $7C00            ; ED 00 7C | Subtract with carry (absolute)
    ROR $FF00,X          ; 7E 00 FF | Rotate right (absolute,X)
    EOR $4E92,X          ; 5D 92 4E | Exclusive OR with accumulator (absolute,X)
    BIT #$FF             ; 89 FF | Test bits in accumulator (immediate)
    LDA                  ; BF 13 BE 09 | Load from absolute long,X into accumulator
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    BPL $EC              ; 10 EC | Branch if positive
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    SBC $F202            ; ED 02 F2 | Subtract with carry (absolute)
    ORA ($79,X)          ; 01 79 | Logical OR with accumulator ((zero page,X))
    BRA $7E              ; 80 7E | Branch always
    BRA $BF              ; 80 BF | Branch always
    RTI                  ; 40 | Return from interrupt
    CPX $CD              ; E4 CD | Compare X register (zero page)
    ROL $D9              ; 26 D9 | Rotate left (zero page)
    SBC $BF22,X          ; FD 22 BF | Subtract with carry (absolute,X)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1FC
; Address: $E3FC85
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1FC:
    JSR $38C7            ; 20 C7 38 | Jump to subroutine
    XBA                  ; EB | Exchange accumulator bytes
    SBC $1A              ; E5 1A | Subtract with carry (zero page)
    BCS $4F              ; B0 4F | Branch if carry set
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    LDA $CE42,X          ; BD 42 CE | Load from absolute,X into accumulator
    AND ($47),Y          ; 31 47 | Logical AND with accumulator ((zero page),Y)
    CLV                  ; B8 | Clear overflow flag
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF A8 57 04 | Load from absolute long,X into accumulator
    PEA #$FFFF           ; F4 FF FF | Push effective address to stack
    PHP                  ; 08 | Push processor status to stack
    SBC $7E81,X          ; FD 81 7E | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1FD
; Address: $E3FCC8
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1FD:
    JSR $00DF            ; 20 DF 00 | Jump to subroutine
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    LSR $C4B1            ; 4E B1 C4 | Logical shift right (absolute)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    AND ($B1,X)          ; 21 B1 | Logical AND with accumulator ((zero page,X))
    AND ($3B),Y          ; 31 3B | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1FE
; Address: $E3FD03
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1FE:
    SED                  ; F8 | Set decimal mode flag
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    CPY #$07             ; C0 07 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    INC $F0FF,X          ; FE FF F0 | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    CPY #$E0             ; C0 E0 | Game work RAM access
    BRA $C0              ; 80 C0 | Branch always
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SBC ($F3),Y          ; F1 F3 | Subtract with carry ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    CPX #$07             ; E0 07 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $F8              ; F0 F8 | Branch if equal
    BMI $CF              ; 30 CF | Branch if negative
    ASL $1FE1,X          ; 1E E1 1F | Arithmetic shift left (absolute,X)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    LSR $CF              ; 46 CF | Logical shift right (zero page)
    SBC ($E1,X)          ; E1 E1 | Subtract with carry ((zero page,X))
    CPY #$E0             ; C0 E0 | Game work RAM access
    AND $CFC0            ; 2D C0 CF | Logical AND with accumulator (absolute)
    DEC $FD1C,X          ; DE 1C FD | Decrement (absolute,X)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_1FF
; Address: $E3FD6B
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_1FF:
    JSR $00F9            ; 20 F9 00 | Jump to subroutine
    CPY #$DE             ; C0 DE | Compare Y register (immediate)
    AND $2320,X          ; 3D 20 23 | Logical AND with accumulator (absolute,X)
    AND ($CF),Y          ; 31 CF | Logical AND with accumulator ((zero page),Y)
    BPL $4D              ; 10 4D | Branch if positive
    ASL $61CD,X          ; 1E CD 61 | Arithmetic shift left (absolute,X)
    LSR $D7              ; 46 D7 | Logical shift right (zero page)
    BMI $1E              ; 30 1E | Branch if negative
    LDX $7F61,Y          ; BE 61 7F | Load from absolute,Y into X register
    LDA                  ; BF 46 FE C7 | Load from absolute long,X into accumulator
    STZ $FEFF,X          ; 9E FF FE | Store zero to absolute,X
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    ADC $1FF9,X          ; 7D F9 1F | Add with carry (absolute,X)
    ADC $FF1F,Y          ; 79 1F FF | Add with carry (absolute,Y)
    INC $FC73,X          ; FE 73 FC | Increment (absolute,X)
    INC $FC              ; E6 FC | Increment (zero page)
    PLY                  ; 7A | Pull Y register from stack
    CLC                  ; 18 | Clear carry flag
    BPL $9F              ; 10 9F | Branch if positive
    ORA $311F,Y          ; 19 1F 31 | Logical OR with accumulator (absolute,Y)
    JMP $EF7F            ; 4C 7F EF | Jump to address
    STZ $A2F7,X          ; 9E F7 A2 | Store zero to absolute,X
    SBC ($40),Y          ; F1 40 | Subtract with carry ((zero page),Y)
    LDA                  ; BF 9A F7 D5 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank46_DmaFunction_200
; Address: $E3FDD0
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_200:
    CPY $FF              ; C4 FF | Compare Y register (zero page)
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    ADC ($FF,X)          ; 61 FF | Add with carry ((zero page,X))
    LDA                  ; BF FF FD FF | Load from absolute long,X into accumulator
    LDA                  ; BF 02 CE 50 | Load from absolute long,X into accumulator
    PHX                  ; DA | Push X register to stack
    AND $D9              ; 25 D9 | Logical AND with accumulator (zero page)
    LDX $FF              ; A6 FF | Load from zero page into X register
    LDA                  ; BF FF FF FF | Load from absolute long,X into accumulator
    ORA $F1              ; 05 F1 | Logical OR with accumulator (zero page)
    SBC $DD00,Y          ; F9 00 DD | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_201
; Address: $E3FE07
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_201:
    JSR $106F            ; 20 6F 10 | Jump to subroutine
    STA $C672            ; 8D 72 C6 | Store accumulator to absolute address
    AND $BB44,Y          ; 39 44 BB | Logical AND with accumulator (absolute,Y)
    BRA $17              ; 80 17 | Branch always
    INX                  ; E8 | Increment X register
    JMP ($748B)          ; 6C 8B 74 | Jump to address (absolute indirect)
    LSR                  ; 4A | Logical shift right (accumulator)
    SEI                  ; 78 | Set interrupt disable flag
    CLV                  ; B8 | Clear overflow flag
    EOR $0EF1            ; 4D F1 0E | Exclusive OR with accumulator (absolute)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BRA $7F              ; 80 7F | Branch always
    BNE $2E              ; D0 2E | Branch if not equal
    EOR ($BC,X)          ; 41 BC | Exclusive OR with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    STZ $9A              ; 64 9A | Store zero to zero page

;------------------------------------------------------------------------------
; Bank46_DmaFunction_202
; Address: $E3FE60
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_202:
    JSR $10DF            ; 20 DF 10 | Jump to subroutine
    DEY                  ; 88 | Decrement Y register
    CLC                  ; 18 | Clear carry flag
    CPY $6433            ; CC 33 64 | Compare Y register (absolute)
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    INC $3FC0,X          ; FE C0 3F | Increment (absolute,X)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    STA                  ; 9F FF 37 FF | Store accumulator to absolute long,X
    SED                  ; F8 | Set decimal mode flag
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    SED                  ; F8 | Set decimal mode flag
    TYA                  ; 98 | Transfer Y register to accumulator
    BMI $C3              ; 30 C3 | Branch if negative
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    BRA $7F              ; 80 7F | Branch always
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 00 FF 80 | Load from absolute long,X into accumulator
    SBC ($F3,X)          ; E1 F3 | Subtract with carry ((zero page,X))
    CPX #$FF             ; E0 FF | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_203
; Address: $E3FEF2
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_203:
    INC $FF              ; E6 FF | Increment (zero page)
    SED                  ; F8 | Set decimal mode flag
    CPY #$E0             ; C0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    DEY                  ; 88 | Decrement Y register
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    AND $8F3F,X          ; 3D 3F 8F | Logical AND with accumulator (absolute,X)
    BVS $00              ; 70 00 | Branch if overflow set
    BEQ $30              ; F0 30 | Branch if equal
    BVS $FC              ; 70 FC | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    SBC $FF06,Y          ; F9 06 FF | Subtract with carry (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    BEQ $87              ; F0 87 | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    BVS $78              ; 70 78 | Branch if overflow set
    DEC $39              ; C6 39 | Decrement (zero page)
    CLC                  ; 18 | Clear carry flag
    CPX #$3E             ; E0 3E | Compare X register (immediate)
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    AND $0039,Y          ; 39 39 00 | Logical AND with accumulator (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    CPY #$E0             ; C0 E0 | Game work RAM access
    STA ($C1,X)          ; 81 C1 | Store accumulator to (zero page,X)
    INC $6CFF            ; EE FF 6C | Increment (absolute)
    TYA                  ; 98 | Transfer Y register to accumulator
    XBA                  ; EB | Exchange accumulator bytes
    PHX                  ; DA | Push X register to stack
    LDY $DCF4,X          ; BC F4 DC | Load from absolute,X into Y register
    CPY $7F4E            ; CC 4E 7F | Compare Y register (absolute)
    LDA                  ; BF FF FF FF | Load from absolute long,X into accumulator
    BEQ $FF              ; F0 FF | Branch if equal

;------------------------------------------------------------------------------
; Bank46_DmaFunction_204
; Address: $E3FFA2
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_204:
    JSR $003F            ; 20 3F 00 | Jump to subroutine
    CPX #$DF             ; E0 DF | Compare X register (immediate)
    BCS $CF              ; B0 CF | Branch if carry set
    TXS                  ; 9A | Transfer X register to stack pointer
    SBC $1F              ; E5 1F | Subtract with carry (zero page)
    CPX #$54             ; E0 54 | Compare X register (immediate)
    XBA                  ; EB | Exchange accumulator bytes
    BEQ $F3              ; F0 F3 | Branch if equal
    CPX #$EF             ; E0 EF | Compare X register (immediate)
    CPY #$DF             ; C0 DF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank46_DmaFunction_205
; Address: $E3FFB6
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_205:
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BCS $BF              ; B0 BF | Branch if carry set
    PHX                  ; DA | Push X register to stack
    LDA                  ; BF 48 07 64 | Load from absolute long,X into accumulator
    INC                  ; 1A | Increment accumulator
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    ADC $4C              ; 65 4C | Add with carry (zero page)
    BEQ $0E              ; F0 0E | Branch if equal

;------------------------------------------------------------------------------
; Bank46_DmaFunction_206
; Address: $E3FFE0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank46_DmaFunction_206:
    JSR $C0DF            ; 20 DF C0 | Jump to subroutine
    INX                  ; E8 | Increment X register
    JMP ($0093)          ; 6C 93 00 | Jump to address (absolute indirect)
    DEY                  ; 88 | Decrement Y register
    CLC                  ; 18 | Clear carry flag
    SBC $FFFF,Y          ; F9 FF FF | Subtract with carry (absolute,Y)
