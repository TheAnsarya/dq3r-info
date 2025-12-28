;==============================================================================
; Dragon Quest III - Bank $56
; Type: Dma
; Purpose: DMA operations and data transfer
; Address Range: $EB0000-$EB7FFF
; Instructions: 8292
; Bytes: 32769
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_56"

;------------------------------------------------------------------------------
; Bank56_DmaFunction_000
; Address: $EB8003
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_000:
    ASL $05FE            ; 0E FE 05 | Arithmetic shift left (absolute)
    ORA #$F4             ; 09 F4 | Logical OR with accumulator (immediate)
    SBC $1F              ; E5 1F | Subtract with carry (zero page)
    INC $5F              ; E6 5F | Increment (zero page)
    DEC $FF3F            ; CE 3F FF | Decrement (absolute)
    STA $689770          ; 8F 70 97 68 | Store accumulator to absolute long address
    STA                  ; 9F 60 9F E0 | Store accumulator to absolute long,X
    STA $F08FF0          ; 8F F0 8F F0 | Store accumulator to absolute long address
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    STA                  ; 9F FF 9F FF | Store accumulator to absolute long,X
    STA                  ; 9F FF DF FF | Store accumulator to absolute long,X
    STZ $D467,X          ; 9E 67 D4 | Store zero to absolute,X
    INC $1F              ; E6 1F | Increment (zero page)
    BNE $FF              ; D0 FF | Branch if not equal
    CPY #$C7             ; C0 C7 | Compare Y register (immediate)
    BEQ $C0              ; F0 C0 | Branch if equal
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    DEC $39              ; C6 39 | Decrement (zero page)
    BRA $7F              ; 80 7F | Branch always
    DEC $79              ; C6 79 | Decrement (zero page)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    INC $FFF3,X          ; FE F3 FF | Increment (absolute,X)
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    SBC $FC00,Y          ; F9 00 FC | Subtract with carry (absolute,Y)
    ADC $7986,Y          ; 79 86 79 | Add with carry (absolute,Y)
    STX $FF              ; 86 FF | Store X register to zero page
    SBC $FC06,Y          ; F9 06 FC | Subtract with carry (absolute,Y)
    LSR                  ; 4A | Logical shift right (accumulator)
    CMP $4D82            ; CD 82 4D | Compare accumulator (absolute)
    LSR $70B1            ; 4E B1 70 | Logical shift right (absolute)
    STA $81FF00          ; 8F 00 FF 81 | Store accumulator to absolute long address
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    SEC                  ; 38 | Set carry flag
    AND ($FE),Y          ; 31 FE | Logical AND with accumulator ((zero page),Y)
    AND ($FE),Y          ; 31 FE | Logical AND with accumulator ((zero page),Y)
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    STA $00FF70          ; 8F 70 FF 00 | Store accumulator to absolute long address
    CPY #$82             ; C0 82 | Compare Y register (immediate)
    AND ($86,X)          ; 21 86 | Logical AND with accumulator ((zero page,X))
    AND $DA              ; 25 DA | Logical AND with accumulator (zero page)
    ADC $21DE,X          ; 7D DE 21 | PPU graphics register access
    LDY $00FF,X          ; BC FF 00 | Load from absolute,X into Y register
    EOR $59FE,X          ; 5D FE 59 | Exclusive OR with accumulator (absolute,X)
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CPX $00FF            ; EC FF 00 | Compare X register (absolute)
    STA $EE13,X          ; 9D 13 EE | Store accumulator to absolute,X
    ADC ($8E),Y          ; 71 8E | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_001
; Address: $EB80E5
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_001:
    ADC ($3F),Y          ; 71 3F | Add with carry ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_002
; Address: $EB8100
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_002:
    STA                  ; 9F A2 DD E2 | Store accumulator to absolute long,X
    SBC $FD0E,X          ; FD 0E FD | Subtract with carry (absolute,X)
    ROR $FFFE,X          ; 7E FE FF | Rotate right (absolute,X)
    STA $FF1FFF          ; 8F FF 1F FF | Store accumulator to absolute long address
    LSR $1EE1,X          ; 5E E1 1E | Logical shift right (absolute,X)
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    SBC ($FE,X)          ; E1 FE | Subtract with carry ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    STA ($86,X)          ; 81 86 | Store accumulator to (zero page,X)
    LDX #$A7             ; A2 A7 | Load immediate value into X register
    AND $A3              ; 25 A3 | Logical AND with accumulator (zero page)
    CPX $FB              ; E4 FB | Compare X register (zero page)
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    PLY                  ; 7A | Pull Y register from stack
    SBC $FC5B,X          ; FD 5B FC | Subtract with carry (absolute,X)
    INX                  ; E8 | Increment X register
    INY                  ; C8 | Increment Y register
    PLP                  ; 28 | Pull processor status from stack
    INY                  ; C8 | Increment Y register
    ROL                  ; 2A | Rotate left (accumulator)
    CPY #$C9             ; C0 C9 | Compare Y register (immediate)
    ORA ($C8,X)          ; 01 C8 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    BIT #$C1             ; 89 C1 | Test bits in accumulator (immediate)
    STA $1BC5            ; 8D C5 1B | Store accumulator to absolute address
    ORA ($EF),Y          ; 11 EF | Logical OR with accumulator ((zero page),Y)
    CMP $CD32            ; CD 32 CD | Compare accumulator (absolute)
    CMP $0CF3            ; CD F3 0C | Compare accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    STA                  ; 9F 00 9F 60 | Store accumulator to absolute long,X
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_004
; Address: $EB816A
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_004:
    JSR $00BF            ; 20 BF 00 | Jump to subroutine
    STZ $9F01,X          ; 9E 01 9F | Store zero to absolute,X
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    INC $FDFC,X          ; FE FC FD | Increment (absolute,X)
    INC $DFFE,X          ; FE FE DF | Increment (absolute,X)
    BVS $1F              ; 70 1F | Branch if overflow set
    BEQ $9F              ; F0 9F | Branch if equal
    CLD                  ; D8 | Clear decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    STZ $3D6E            ; 9C 6E 3D | Store zero to absolute
    ADC $8FFE,Y          ; 79 FE 8F | Add with carry (absolute,Y)
    STA $078F8F          ; 8F 8F 8F 07 | Store accumulator to absolute long address
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPX $E900            ; EC 00 E9 | Compare X register (absolute)
    DEX                  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank56_DmaFunction_005
; Address: $EB81A5
; Size: 121 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_005:
    JSR $4682            ; 20 82 46 | Jump to subroutine
    STA $F7FF0E          ; 8F 0E FF F7 | Store accumulator to absolute long address
    TAY                  ; A8 | Transfer accumulator to Y register
    CPY $FF              ; C4 FF | Compare Y register (zero page)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$81             ; C0 81 | Compare Y register (immediate)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    STY $0B              ; 84 0B | Store Y register to zero page
    LDA                  ; BF E3 FC 1F | Load from absolute long,X into accumulator
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    STZ $FE73            ; 9C 73 FE | Store zero to absolute
    ROL $7BFF,X          ; 3E FF 7B | Rotate left (absolute,X)
    ROL $7FF9,X          ; 3E F9 7F | Rotate left (absolute,X)
    INC $C6FF,X          ; FE FF C6 | Increment (absolute,X)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$3E             ; C0 3E | Compare Y register (immediate)
    LDA                  ; BF 00 FF F8 | Load from absolute long,X into accumulator
    SBC ($1F,X)          ; E1 1F | Subtract with carry ((zero page,X))
    ORA $09F7,X          ; 1D F7 09 | Logical OR with accumulator (absolute,X)
    LDA                  ; BF 8F 7F 87 | Load from absolute long,X into accumulator
    LDA                  ; BF 43 BC 63 | Load from absolute long,X into accumulator
    STZ $7FFF            ; 9C FF 7F | Store zero to absolute
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $CF              ; F0 CF | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    INC $F0F0,X          ; FE F0 F0 | Increment (absolute,X)
    DEC $3F              ; C6 3F | Decrement (zero page)
    SEP #$1F             ; E2 1F | Set processor status bits
    SEP #$FF             ; E2 FF | Set processor status bits
    CPX $FF              ; E4 FF | Compare X register (zero page)
    INC $FF              ; E6 FF | Increment (zero page)
    PEA #$FFEF           ; F4 EF FF | Push effective address to stack
    CMP ($80,X)          ; C1 80 | Compare accumulator ((zero page,X))
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    ASL $3F00,X          ; 1E 00 3F | Arithmetic shift left (absolute,X)
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    LDA $3846,Y          ; B9 46 38 | Load from absolute,Y into accumulator
    SEC                  ; 38 | Set carry flag
    BRA $7F              ; 80 7F | Branch always
    ASL $3FE1,X          ; 1E E1 3F | Arithmetic shift left (absolute,X)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ASL $3F00            ; 0E 00 3F | Arithmetic shift left (absolute)
    LDA                  ; BF 40 FF 00 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank56_DmaFunction_006
; Address: $EB8296
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_006:
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    DEC $BF31            ; CE 31 BF | Decrement (absolute)
    RTI                  ; 40 | Return from interrupt
    BMI $CF              ; 30 CF | Branch if negative
    BMI $06              ; 30 06 | Branch if negative
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    CPY #$FB             ; C0 FB | Compare Y register (immediate)
    ASL $09F1            ; 0E F1 09 | Arithmetic shift left (absolute)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    STY $EEFF            ; 8C FF EE | Store Y register to absolute address
    SBC ($40),Y          ; F1 40 | Subtract with carry ((zero page),Y)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $F1              ; 10 F1 | Branch if positive
    ASL $FF00            ; 0E 00 FF | Arithmetic shift left (absolute)
    CPX #$7F             ; E0 7F | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_007
; Address: $EB82EC
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_007:
    JSR $301F            ; 20 1F 30 | Jump to subroutine
    ROL $00FF            ; 2E FF 00 | Rotate left (absolute)
    ASL $06FF            ; 0E FF 06 | Arithmetic shift left (absolute)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    SBC ($31),Y          ; F1 31 | Subtract with carry ((zero page),Y)
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPY #$E0             ; C0 E0 | Game work RAM access
    BCS $00              ; B0 00 | Branch if carry set
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $EF              ; 10 EF | Branch if positive
    BPL $BF              ; 10 BF | Branch if positive
    RTI                  ; 40 | Return from interrupt
    CMP $2C              ; C5 2C | Compare accumulator (zero page)
    SBC $0C              ; E5 0C | Subtract with carry (zero page)
    ORA $8BE7            ; 0D E7 8B | Logical OR with accumulator (absolute)
    ORA $F73F,X          ; 1D 3F F7 | Logical OR with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $FB              ; 10 FB | Branch if positive

;------------------------------------------------------------------------------
; Bank56_DmaFunction_009
; Address: $EB8368
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_009:
    JSR $63BF            ; 20 BF 63 | Jump to subroutine
    EOR ($DE,X)          ; 41 DE | Exclusive OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_00B
; Address: $EB8380
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_00B:
    ADC ($FF,X)          ; 61 FF | Add with carry ((zero page,X))
    STA                  ; 9F E0 FF 00 | Store accumulator to absolute long,X
    SBC $FA03,X          ; FD 03 FA | Subtract with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    INC $FCFF,X          ; FE FF FC | Increment (absolute,X)
    SBC $47FF,Y          ; F9 FF 47 | Subtract with carry (absolute,Y)
    SEI                  ; 78 | Set interrupt disable flag
    BRA $FF              ; 80 FF | Branch always
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    STZ $08              ; 64 08 | Store zero to zero page
    INC $FF0C,X          ; FE 0C FF | Increment (absolute,X)
    INC $FCFE,X          ; FE FE FC | Increment (absolute,X)
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    CPX #$F1             ; E0 F1 | Compare X register (immediate)
    BEQ $F0              ; F0 F0 | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    INC $FF3F,X          ; FE 3F FF | Increment (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    SEP #$7F             ; E2 7F | Set processor status bits
    INC $FF3F,X          ; FE 3F FF | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_00C
; Address: $EB83E8
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_00C:
    JSR $D0FF            ; 20 FF D0 | Jump to subroutine
    LDX $F840,Y          ; BE 40 F8 | Load from absolute,Y into X register
    BEQ $FF              ; F0 FF | Branch if equal
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $73              ; F0 73 | Branch if equal
    STA $BF8F73          ; 8F 73 8F BF | Store accumulator to absolute long address
    EOR ($BF,X)          ; 41 BF | Exclusive OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    LDY #$3F             ; A0 3F | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank56_DmaFunction_00D
; Address: $EB840D
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_00D:
    JSR $2E31            ; 20 31 2E | Jump to subroutine
    SBC $FCFC,X          ; FD FC FC | Subtract with carry (absolute,X)
    INC $DE3C,X          ; FE 3C DE | Increment (absolute,X)
    ROL $30DE,X          ; 3E DE 30 | Rotate left (absolute,X)
    INC $2427,X          ; FE 27 24 | Increment (absolute,X)
    JMP $FEC837          ; 5C 37 C8 FE | Jump to address long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    JMP $00C800          ; 5C 00 C8 00 | Jump to address long
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BEQ $EF              ; F0 EF | Branch if equal
    PEA #$F4CF           ; F4 CF F4 | Push effective address to stack
    BMI $CF              ; 30 CF | Branch if negative

;------------------------------------------------------------------------------
; Bank56_DmaFunction_00E
; Address: $EB8448
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_00E:
    BCS $4F              ; B0 4F | Branch if carry set
    BVS $8F              ; 70 8F | Branch if overflow set
    BEQ $0F              ; F0 0F | Branch if equal
    BVC $AF              ; 50 AF | Branch if overflow clear
    STA $0F0F0F          ; 8F 0F 0F 0F | Store accumulator to absolute long address
    LDA $00FF0F          ; AF 0F FF 00 | Load from absolute long address into accumulator
    BEQ $FF              ; F0 FF | Branch if equal
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    ADC ($8E),Y          ; 71 8E | Add with carry ((zero page),Y)
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    DEC $DC00            ; CE 00 DC | Decrement (absolute)
    INC $C700,X          ; FE 00 C7 | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    INC $DD11            ; EE 11 DD | Increment (absolute)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_00F
; Address: $EB84D3
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_00F:
    JSL $C701FE          ; 22 FE 01 C7 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    STX $DF03            ; 8E 03 DF | Store X register to absolute address
    SED                  ; F8 | Set decimal mode flag
    BPL $FF              ; 10 FF | Branch if positive
    DEY                  ; 88 | Decrement Y register
    LDA $20DF50          ; AF 50 DF 20 | Load from absolute long address into accumulator
    INC $FFE1,X          ; FE E1 FF | Increment (absolute,X)
    SBC $03FF,Y          ; F9 FF 03 | Subtract with carry (absolute,Y)
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    SBC ($0F,X)          ; E1 0F | Subtract with carry ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    BMI $E0              ; 30 E0 | Game work RAM access
    INY                  ; C8 | Increment Y register
    LDA #$56             ; A9 56 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank56_DmaFunction_010
; Address: $EB8537
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_010:
    JSR $10EF            ; 20 EF 10 | Jump to subroutine
    ORA $1C1B            ; 0D 1B 1C | Logical OR with accumulator (absolute)
    ADC $FB10            ; 6D 10 FB | Add with carry (absolute)
    LDY $F1EF,X          ; BC EF F1 | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank56_DmaFunction_011
; Address: $EB854C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_011:
    CPX $DB              ; E4 DB | Compare X register (zero page)
    PEA #$D30B           ; F4 0B D3 | Push effective address to stack
    BMI $75              ; 30 75 | Branch if negative
    STZ $10F3,X          ; 9E F3 10 | Store zero to absolute,X
    BPL $FF              ; 10 FF | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_015
; Address: $EB856C
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_015:
    ADC ($FE,X)          ; 61 FE | Add with carry ((zero page,X))
    AND ($BE,X)          ; 21 BE | Logical AND with accumulator ((zero page,X))
    BCS $4C              ; B0 4C | Branch if carry set
    ASL $4AF5            ; 0E F5 4A | Arithmetic shift left (absolute)
    SBC $7B4A,X          ; FD 4A 7B | Subtract with carry (absolute,X)
    CMP $FD32            ; CD 32 FD | Compare accumulator (absolute)
    CMP $FFCF,X          ; DD CF FF | Compare accumulator (absolute,X)
    PLX                  ; FA | Pull X register from stack
    CMP $FE87,X          ; DD 87 FE | Compare accumulator (absolute,X)
    INC $1D03,X          ; FE 03 1D | Increment (absolute,X)
    LDA $11DF,Y          ; B9 DF 11 | Load from absolute,Y into accumulator
    INC                  ; 1A | Increment accumulator
    PLP                  ; 28 | Pull processor status from stack
    STA $22EE,X          ; 9D EE 22 | Store accumulator to absolute,X
    SEP #$26             ; E2 26 | Set processor status bits
    INC $C6              ; E6 C6 | Increment (zero page)
    INC $23              ; E6 23 | Increment (zero page)
    CMP ($F1),Y          ; D1 F1 | Compare accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_016
; Address: $EB85BA
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_016:
    JSR $19F0            ; 20 F0 19 | Jump to subroutine
    SBC $FF1F,Y          ; F9 1F FF | Subtract with carry (absolute,Y)
    LDA                  ; BF FF AF DF | Load from absolute long,X into accumulator
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BVS $70              ; 70 70 | Branch if overflow set
    BRA $E0              ; 80 E0 | Game work RAM access
    RTI                  ; 40 | Return from interrupt
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPX #$10             ; E0 10 | Compare X register (immediate)
    BEQ $08              ; F0 08 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    STY $7D              ; 84 7D | Store Y register to zero page
    WDM #$3E             ; 42 3E | Reserved instruction
    AND $5F13            ; 2D 13 5F | Logical AND with accumulator (absolute)
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    CPX #$0F             ; E0 0F | Compare X register (immediate)
    BEQ $87              ; F0 87 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SBC ($7E,X)          ; E1 7E | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank56_DmaFunction_017
; Address: $EB8600
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_017:
    ORA ($2E),Y          ; 11 2E | Logical OR with accumulator ((zero page),Y)
    ORA ($2E),Y          ; 11 2E | Logical OR with accumulator ((zero page),Y)
    ORA $3E22,X          ; 1D 22 3E | Logical OR with accumulator (absolute,X)
    ROL $7EC7,X          ; 3E C7 7E | Rotate left (absolute,X)
    ROR $B2F7            ; 6E F7 B2 | Rotate right (absolute)
    DEC $DE30,X          ; DE 30 DE | Decrement (absolute,X)
    BMI $D6              ; 30 D6 | Branch if negative
    BMI $BF              ; 30 BF | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_018
; Address: $EB8618
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_018:
    LDA                  ; BF 60 7F C0 | Load from absolute long,X into accumulator
    BEQ $FF              ; F0 FF | Branch if equal
    JMP ($01FE)          ; 6C FE 01 | Jump to address (absolute indirect)
    JMP $DF00FF          ; 5C FF 00 DF | Jump to address long
    AND ($FF,X)          ; 21 FF | Logical AND with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BIT $6C              ; 24 6C | Test bits in accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    JMP $000000          ; 5C 00 00 00 | Jump to address long
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $7F              ; F0 7F | Branch if equal
    SBC ($FE),Y          ; F1 FE | Subtract with carry ((zero page),Y)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    LDA                  ; BF FF BF FF | Load from absolute long,X into accumulator
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    INC $FE80,X          ; FE 80 FE | Increment (absolute,X)
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    INC $07F8,X          ; FE F8 07 | Increment (absolute,X)
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    INC $333F            ; EE 3F 33 | Increment (absolute)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BEQ $3F              ; F0 3F | Branch if equal
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    BRA $7F              ; 80 7F | Branch always
    BRA $FF              ; 80 FF | Branch always
    ROL $C6E7,X          ; 3E E7 C6 | Rotate left (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BVS $FE              ; 70 FE | Branch if overflow set

;------------------------------------------------------------------------------
; Bank56_DmaFunction_019
; Address: $EB870B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_019:
    CPX #$7F             ; E0 7F | Compare X register (immediate)
    DEC $DEF1            ; CE F1 DE | Decrement (absolute)
    PLP                  ; 28 | Pull processor status from stack
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_01A
; Address: $EB8720
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_01A:
    JSR $41C0            ; 20 C0 41 | Jump to subroutine
    CPY #$C1             ; C0 C1 | Compare Y register (immediate)
    BRA $C1              ; 80 C1 | Branch always
    BRA $9F              ; 80 9F | Branch always
    SED                  ; F8 | Set decimal mode flag
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    CMP $F926,Y          ; D9 26 F9 | Compare accumulator (absolute,Y)
    ASL $E1              ; 06 E1 | Arithmetic shift left (zero page)
    ASL $609F,X          ; 1E 9F 60 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_01B
; Address: $EB873B
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_01B:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    PEA #$F40B           ; F4 0B F4 | Push effective address to stack
    PEA #$F4EB           ; F4 EB F4 | Push effective address to stack
    XBA                  ; EB | Exchange accumulator bytes
    PEA #$74EB           ; F4 EB 74 | Push effective address to stack
    XBA                  ; EB | Exchange accumulator bytes
    XBA                  ; EB | Exchange accumulator bytes
    XBA                  ; EB | Exchange accumulator bytes
    AND ($BE,X)          ; 21 BE | Logical AND with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_01C
; Address: $EB8765
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_01C:
    INC $FF60,X          ; FE 60 FF | Increment (absolute,X)
    ADC ($FE,X)          ; 61 FE | Add with carry ((zero page,X))
    ADC ($FE,X)          ; 61 FE | Add with carry ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_01D
; Address: $EB877D
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_01D:
    SBC $FEFF,X          ; FD FF FE | Subtract with carry (absolute,X)
    STY $D5F8            ; 8C F8 D5 | Store Y register to absolute address
    LSR $306F,X          ; 5E 6F 30 | Logical shift right (absolute,X)
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    EOR $03BE            ; 4D BE 03 | Exclusive OR with accumulator (absolute)
    TYA                  ; 98 | Transfer Y register to accumulator
    LDA                  ; BF F7 9F FF | Load from absolute long,X into accumulator
    STA                  ; 9F 31 FE C3 | Store accumulator to absolute long,X
    AND $C936,X          ; 3D 36 C9 | Logical AND with accumulator (absolute,X)
    DEC $1FE1,X          ; DE E1 1F | Decrement (absolute,X)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$1E             ; E0 1E | Compare X register (immediate)
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    INC $E5FF            ; EE FF E5 | Increment (absolute)
    BMI $8F              ; 30 8F | Branch if negative
    BEQ $17              ; F0 17 | Branch if equal
    INX                  ; E8 | Increment X register
    STY $9C              ; 84 9C | Store Y register to zero page
    BRA $18              ; 80 18 | Branch always
    SED                  ; F8 | Set decimal mode flag
    CLI                  ; 58 | Clear interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    CPX $EFF1            ; EC F1 EF | Compare X register (absolute)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_01E
; Address: $EB87E4
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_01E:
    INX                  ; E8 | Increment X register
    DEC $3921,X          ; DE 21 39 | Decrement (absolute,X)
    CPY #$E2             ; C0 E2 | Compare Y register (immediate)
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    STY $C37F            ; 8C 7F C3 | Store Y register to absolute address
    LDY $936C,X          ; BC 6C 93 | Load from absolute,X into Y register
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    BCS $BF              ; B0 BF | Branch if carry set
    CPY #$17             ; C0 17 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    BCS $5F              ; B0 5F | Branch if carry set
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    LDY #$EF             ; A0 EF | Load immediate value into Y register
    TAX                  ; AA | Transfer accumulator to X register
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    CMP #$36             ; C9 36 | Compare accumulator (immediate)
    XBA                  ; EB | Exchange accumulator bytes
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $0F              ; F0 0F | Branch if equal
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BMI $CF              ; 30 CF | Branch if negative

;------------------------------------------------------------------------------
; Bank56_DmaFunction_01F
; Address: $EB88AE
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_01F:
    JSR $FFDF            ; 20 DF FF | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CLD                  ; D8 | Clear decimal mode flag
    CPY $00FF            ; CC FF 00 | Compare Y register (absolute)
    BEQ $FF              ; F0 FF | Branch if equal
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    BIT $FFD3            ; 2C D3 FF | Test bits in accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF FF FF FF | Load from absolute long,X into accumulator
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    BRA $7F              ; 80 7F | Branch always
    BNE $FF              ; D0 FF | Branch if not equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_020
; Address: $EB892F
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_020:
    STA                  ; 9F FF FF FF | Store accumulator to absolute long,X
    XBA                  ; EB | Exchange accumulator bytes
    LDX $DCAB,Y          ; BE AB DC | Load from absolute,Y into X register
    STA                  ; 9F 9F 7C BF | Store accumulator to absolute long,X
    CPX #$9F             ; E0 9F | Compare X register (immediate)
    XBA                  ; EB | Exchange accumulator bytes

;------------------------------------------------------------------------------
; Bank56_DmaFunction_021
; Address: $EB8952
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_021:
    XBA                  ; EB | Exchange accumulator bytes
    CPX $FB              ; E4 FB | Compare X register (zero page)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    STY $20F3            ; 8C F3 20 | Store Y register to absolute address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_022
; Address: $EB896D
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_022:
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BRA $FF              ; 80 FF | Branch always
    CPX #$07             ; E0 07 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA $9E44            ; 0D 44 9E | Logical OR with accumulator (absolute)
    REP #$7F             ; C2 7F | Reset processor status bits
    SBC ($8E),Y          ; F1 8E | Subtract with carry ((zero page),Y)
    SBC $FDF2,X          ; FD F2 FD | Subtract with carry (absolute,X)
    SBC $F3FE,X          ; FD FE F3 | Subtract with carry (absolute,X)
    INC $DC87,X          ; FE 87 DC | Increment (absolute,X)
    STA                  ; 9F 0B FF 05 | Store accumulator to absolute long,X
    ADC $C087,Y          ; 79 87 C0 | Add with carry (absolute,Y)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ASL $87E2,X          ; 1E E2 87 | Arithmetic shift left (absolute,X)
    STX $868F            ; 8E 8F 86 | Store X register to absolute address
    STA $6ACEC5          ; 8F C5 CE 6A | Store accumulator to absolute long address
    SBC $BB              ; E5 BB | Subtract with carry (zero page)
    CLI                  ; 58 | Clear interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    AND $FD              ; 25 FD | Logical AND with accumulator (zero page)
    DEC $7F              ; C6 7F | Decrement (zero page)
    ORA $2BFE            ; 0D FE 2B | Logical OR with accumulator (absolute)
    BCS $B7              ; B0 B7 | Branch if carry set
    LSR $FFFF            ; 4E FF FF | Logical shift right (absolute)
    INC $FCFE,X          ; FE FE FC | Increment (absolute,X)
    INC                  ; 1A | Increment accumulator
    ASL $3F2D,X          ; 1E 2D 3F | Arithmetic shift left (absolute,X)
    LDY $BF              ; A4 BF | Load from zero page into Y register
    INC $7FB0,X          ; FE B0 7F | Increment (absolute,X)
    CMP $F2ED            ; CD ED F2 | Compare accumulator (absolute)
    LDA                  ; BF 78 47 E0 | Load from absolute long,X into accumulator
    CPX #$E1             ; E0 E1 | Compare X register (immediate)
    SBC ($71,X)          ; E1 71 | Subtract with carry ((zero page,X))
    SBC ($61),Y          ; F1 61 | Subtract with carry ((zero page),Y)
    SBC ($A3),Y          ; F1 A3 | Subtract with carry ((zero page),Y)
    CMP $C72E,X          ; DD 2E C7 | Compare accumulator (absolute,X)
    BPL $FF              ; 10 FF | Branch if positive
    BCC $FF              ; 90 FF | Branch if carry clear
    BCS $7F              ; B0 7F | Branch if carry set
    BCS $7F              ; B0 7F | Branch if carry set
    BEQ $BF              ; F0 BF | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_024
; Address: $EB8A32
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_024:
    CPX $FF              ; E4 FF | Compare X register (zero page)
    CPY $FF              ; C4 FF | Compare Y register (zero page)
    CPY $FF              ; C4 FF | Compare Y register (zero page)
    CPX #$9F             ; E0 9F | Compare X register (immediate)
    LDX #$DF             ; A2 DF | Load immediate value into X register
    LDX $7F5F,Y          ; BE 5F 7F | Load from absolute,Y into X register
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    ADC $F9FE,X          ; 7D FE F9 | Add with carry (absolute,X)
    INC $FEB9,X          ; FE B9 FE | Increment (absolute,X)
    LDA $B9FE,Y          ; B9 FE B9 | Load from absolute,Y into accumulator
    INC $FE99,X          ; FE 99 FE | Increment (absolute,X)
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $0F              ; F0 0F | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$38             ; C0 38 | Compare Y register (immediate)
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    AND ($FF),Y          ; 31 FF | Logical AND with accumulator ((zero page),Y)
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_025
; Address: $EB8A9C
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_025:
    STA $E09FF0          ; 8F F0 9F E0 | Game work RAM access
    AND ($FF),Y          ; 31 FF | Logical AND with accumulator ((zero page),Y)
    AND ($FF),Y          ; 31 FF | Logical AND with accumulator ((zero page),Y)
    AND $3FFF,Y          ; 39 FF 3F | Logical AND with accumulator (absolute,Y)
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    LDA                  ; BF FF BF FF | Load from absolute long,X into accumulator
    LDA                  ; BF FF FF 40 | Load from absolute long,X into accumulator
    SEI                  ; 78 | Set interrupt disable flag
    BRA $FF              ; 80 FF | Branch always
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CLV                  ; B8 | Clear overflow flag
    LDA                  ; BF FF FF 00 | Load from absolute long,X into accumulator
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PLX                  ; FA | Pull X register from stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC $05FF,X          ; FE FF 05 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_026
; Address: $EB8B35
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_026:
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SBC $FB04,X          ; FD 04 FB | Subtract with carry (absolute,X)
    SBC $B060,X          ; FD 60 B0 | Subtract with carry (absolute,X)
    BVS $9E              ; 70 9E | Branch if overflow set
    INC $6FFF,X          ; FE FF 6F | Increment (absolute,X)
    AND ($7F,X)          ; 21 7F | Logical AND with accumulator ((zero page,X))
    BRA $FF              ; 80 FF | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank56_DmaFunction_028
; Address: $EB8B5E
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_028:
    JSR $00DF            ; 20 DF 00 | Jump to subroutine
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    SBC $FD02,X          ; FD 02 FD | Subtract with carry (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ASL $79              ; 06 79 | Arithmetic shift left (zero page)
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    STA                  ; 9F FF 7F C3 | Store accumulator to absolute long,X
    BRA $3F              ; 80 3F | Branch always
    SED                  ; F8 | Set decimal mode flag
    BRA $C0              ; 80 C0 | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $43              ; F0 43 | Branch if equal
    LDY $7F80,X          ; BC 80 7F | Load from absolute,X into Y register
    CLC                  ; 18 | Clear carry flag
    BCS $FF              ; B0 FF | Branch if carry set
    CPY #$BD             ; C0 BD | Compare Y register (immediate)
    SBC $FEFF,X          ; FD FF FE | Subtract with carry (absolute,X)
    SBC $F23E,X          ; FD 3E F2 | Subtract with carry (absolute,X)
    ASL $F7FD            ; 0E FD F7 | Arithmetic shift left (absolute)
    BMI $CF              ; 30 CF | Branch if negative
    CMP $3A              ; C5 3A | Compare accumulator (zero page)
    BEQ $0F              ; F0 0F | Branch if equal
    ADC ($9F,X)          ; 61 9F | Add with carry ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ADC $FE9E,X          ; 7D 9E FE | Add with carry (absolute,X)
    ADC $F0FF,X          ; 7D FF F0 | Add with carry (absolute,X)
    BCC $5B              ; 90 5B | Branch if carry clear
    LDY $FE4D,X          ; BC 4D FE | Load from absolute,X into Y register
    ADC $FE              ; 65 FE | Add with carry (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_029
; Address: $EB8BD0
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_029:
    XBA                  ; EB | Exchange accumulator bytes
    PLB                  ; AB | Pull data bank register from stack
    LDX $83E9            ; AE E9 83 | Load from absolute address into X register
    CPX $11EC            ; EC EC 11 | Compare X register (absolute)
    JMP $037C            ; 4C 7C 03 | Jump to address
    STX $E6              ; 86 E6 | Store X register to zero page

;------------------------------------------------------------------------------
; Bank56_DmaFunction_02A
; Address: $EB8BEE
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_02A:
    STY $E4              ; 84 E4 | Store Y register to zero page
    STA $FDC377          ; 8F 77 C3 FD | Store accumulator to absolute long address
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BEQ $FF              ; F0 FF | Branch if equal
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    ASL $FD7F,X          ; 1E 7F FD | Arithmetic shift left (absolute,X)
    INC $FFDE,X          ; FE DE FF | Increment (absolute,X)
    ORA $FEDF            ; 0D DF FE | Logical OR with accumulator (absolute)
    SBC $0EF2,X          ; FD F2 0E | Subtract with carry (absolute,X)
    SBC ($35),Y          ; F1 35 | Subtract with carry ((zero page),Y)
    DEX                  ; CA | Decrement X register
    SBC #$C1             ; E9 C1 | Subtract with carry (immediate)
    INC $FFC0,X          ; FE C0 FF | Increment (absolute,X)
    LDX $7B              ; A6 7B | Load from zero page into X register
    STA $9E63,X          ; 9D 63 9E | Store accumulator to absolute,X
    CLI                  ; 58 | Clear interrupt disable flag
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    SBC $FEFD,X          ; FD FD FE | Subtract with carry (absolute,X)
    BMI $FF              ; 30 FF | Branch if negative
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    DEC                  ; 3A | Decrement accumulator
    SBC $7D92,X          ; FD 92 7D | Subtract with carry (absolute,X)
    CMP ($3F,X)          ; C1 3F | Compare accumulator ((zero page,X))
    SBC ($1F,X)          ; E1 1F | Subtract with carry ((zero page,X))
    SBC ($DF),Y          ; F1 DF | Subtract with carry ((zero page),Y)
    SBC ($E7),Y          ; F1 E7 | Subtract with carry ((zero page),Y)
    SBC $F9F7,Y          ; F9 F7 F9 | Subtract with carry (absolute,Y)
    AND $DE59,X          ; 3D 59 DE | Logical AND with accumulator (absolute,X)
    SBC $F9FE,Y          ; F9 FE F9 | Subtract with carry (absolute,Y)
    INC $FEF9,X          ; FE F9 FE | Increment (absolute,X)
    SBC $F97E,Y          ; F9 7E F9 | Subtract with carry (absolute,Y)
    ROR $DE3D,X          ; 7E 3D DE | Rotate right (absolute,X)
    INC $F70F            ; EE 0F F7 | Increment (absolute)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_02C
; Address: $EB8C66
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_02C:
    JSR $33FF            ; 20 FF 33 | Jump to subroutine
    ROL $3FFF,X          ; 3E FF 3F | Rotate left (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($C3,X)          ; 01 C3 | Logical OR with accumulator ((zero page,X))
    CPX #$01             ; E0 01 | Compare X register (immediate)
    STX $63              ; 86 63 | Store X register to zero page
    PHA                  ; 48 | Push accumulator to stack
    SBC $CC23,X          ; FD 23 CC | Subtract with carry (absolute,X)
    ORA ($78,X)          ; 01 78 | Logical OR with accumulator ((zero page,X))
    AND $FEF0,X          ; 3D F0 FE | Logical AND with accumulator (absolute,X)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$DF             ; C0 DF | Compare Y register (immediate)
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    CPX #$3F             ; E0 3F | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_02D
; Address: $EB8CAB
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_02D:
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BRA $C1              ; 80 C1 | Branch always
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    BPL $C0              ; 10 C0 | Branch if positive
    BPL $E0              ; 10 E0 | Game work RAM access
    BMI $E0              ; 30 E0 | Game work RAM access
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_032
; Address: $EB8CDC
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_032:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA $0F08            ; 0D 08 0F | Logical OR with accumulator (absolute)
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    ROL $3EA8,X          ; 3E A8 3E | Rotate left (absolute,X)
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    LDY #$F7             ; A0 F7 | Load immediate value into Y register
    LDY #$F8             ; A0 F8 | Load immediate value into Y register
    BCC $F0              ; 90 F0 | Branch if carry clear
    INY                  ; C8 | Increment Y register
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    PLA                  ; 68 | Pull accumulator from stack
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank56_DmaFunction_034
; Address: $EB8D52
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_034:
    JSR $10DF            ; 20 DF 10 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SBC $7FF8,X          ; FD F8 7F | Subtract with carry (absolute,X)
    LDA                  ; BF FF FF EF | Load from absolute long,X into accumulator
    BPL $F9              ; 10 F9 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 3F C0 5F | Load from absolute long,X into accumulator
    LDY #$47             ; A0 47 | Load immediate value into Y register
    CLV                  ; B8 | Clear overflow flag
    STA $7E8170          ; 8F 70 81 7E | Store accumulator to absolute long address
    SBC $F0F8,Y          ; F9 F8 F0 | Subtract with carry (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    ORA ($19),Y          ; 11 19 | Logical OR with accumulator ((zero page),Y)
    INC $74              ; E6 74 | Increment (zero page)
    SBC $FCF3,X          ; FD F3 FC | Subtract with carry (absolute,X)
    CMP ($FE),Y          ; D1 FE | Compare accumulator ((zero page),Y)
    LDA ($FE,X)          ; A1 FE | Load from (zero page,X) into accumulator

;------------------------------------------------------------------------------
; Bank56_DmaFunction_035
; Address: $EB8DCA
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_035:
    JSR $43FF            ; 20 FF 43 | Jump to subroutine
    STY $8CCC            ; 8C CC 8C | Store Y register to absolute address
    STY $0D0D            ; 8C 0D 0D | Store Y register to absolute address
    STA $BFB7,X          ; 9D B7 BF | Store accumulator to absolute,X
    LDA                  ; BF E2 FA E4 | Load from absolute long,X into accumulator
    SBC $FFFF,X          ; FD FF FF | Subtract with carry (absolute,X)
    DEC $DDDF,X          ; DE DF DD | Decrement (absolute,X)
    LDA $EEEF            ; AD EF EE | Load from absolute address into accumulator
    SEI                  ; 78 | Set interrupt disable flag
    PLY                  ; 7A | Pull Y register from stack
    BCC $FC              ; 90 FC | Branch if carry clear
    AND #$FC             ; 29 FC | Logical AND with accumulator (immediate)
    STX $F9              ; 86 F9 | Store X register to zero page
    STA $F6CFF6          ; 8F F6 CF F6 | Store accumulator to absolute long address
    INC $D9              ; E6 D9 | Increment (zero page)
    INX                  ; E8 | Increment X register
    BEQ $EF              ; F0 EF | Branch if equal
    BEQ $EB              ; F0 EB | Branch if equal
    CPX #$D2             ; E0 D2 | Compare X register (immediate)
    CMP $FF              ; C5 FF | Compare accumulator (zero page)
    LDA                  ; BF 22 BF 21 | Load from absolute long,X into accumulator
    AND $5D00,X          ; 3D 00 5D | Logical AND with accumulator (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    PLY                  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank56_DmaFunction_036
; Address: $EB8E33
; Size: 120 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_036:
    SBC $FD03,X          ; FD 03 FD | Subtract with carry (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    LDX #$00             ; A2 00 | Load immediate value into X register
    CMP $7CFE,Y          ; D9 FE 7C | Compare accumulator (absolute,Y)
    INC $7E71,X          ; FE 71 7E | Increment (absolute,X)
    SBC ($3F,X)          ; E1 3F | Subtract with carry ((zero page,X))
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPX #$DF             ; E0 DF | Compare X register (immediate)
    BEQ $CF              ; F0 CF | Branch if equal
    LDA $1FBF4F          ; AF 4F BF 1F | Load from absolute long address into accumulator
    LSR $5CBF,X          ; 5E BF 5C | Logical shift right (absolute,X)
    LDA                  ; BF 44 BF 44 | Load from absolute long,X into accumulator
    LDA                  ; BF 40 BF 40 | Load from absolute long,X into accumulator
    LDA                  ; BF FF 80 FF | Load from absolute long,X into accumulator
    BRA $FF              ; 80 FF | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$F1             ; C0 F1 | Compare Y register (immediate)
    ASL $0EF5            ; 0E F5 0E | Arithmetic shift left (absolute)
    ASL $0EF5            ; 0E F5 0E | Arithmetic shift left (absolute)
    TXA                  ; 8A | Transfer X register to accumulator
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    PLX                  ; FA | Pull X register from stack
    ROR $6E00            ; 6E 00 6E | Rotate right (absolute)
    DEC $EE00            ; CE 00 EE | Decrement (absolute)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    BRA $BF              ; 80 BF | Branch always
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 40 BF 40 | Load from absolute long,X into accumulator
    LDA                  ; BF 40 BF 40 | Load from absolute long,X into accumulator
    LDA                  ; BF 40 7F CC | Load from absolute long,X into accumulator
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ROR $00              ; 66 00 | Rotate right (zero page)
    ROR $00              ; 66 00 | Rotate right (zero page)
    LSR $6F00            ; 4E 00 6F | Logical shift right (absolute)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA $40              ; 05 40 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA $80FF00          ; 8F 00 FF 80 | Store accumulator to absolute long address
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank56_DmaFunction_037
; Address: $EB8EF0
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_037:
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    INX                  ; E8 | Increment X register
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF 00 A8 3A | Load from absolute long,X into accumulator
    TSX                  ; BA | Transfer stack pointer to X register
    TSX                  ; BA | Transfer stack pointer to X register
    CLV                  ; B8 | Clear overflow flag
    SEC                  ; 38 | Set carry flag
    CLV                  ; B8 | Clear overflow flag
    ORA $1FF9,X          ; 1D F9 1F | Logical OR with accumulator (absolute,X)
    SBC $F81F,Y          ; F9 1F F8 | Subtract with carry (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    CPX $FFFF            ; EC FF FF | Compare X register (absolute)
    LDX $3CF7            ; AE F7 3C | Load from absolute address into X register
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    CLD                  ; D8 | Clear decimal mode flag
    INC $BFFF,X          ; FE FF BF | Increment (absolute,X)
    INC $FFF7,X          ; FE F7 FF | Increment (absolute,X)
    SEP #$38             ; E2 38 | Set processor status bits
    SBC $0A              ; E5 0A | Subtract with carry (zero page)
    LDA $04              ; A5 04 | Load from zero page into accumulator
    CLC                  ; 18 | Clear carry flag
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SBC $0D0F,Y          ; F9 0F 0D | Subtract with carry (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    STA ($DF,X)          ; 81 DF | Store accumulator to (zero page,X)
    EOR ($E1,X)          ; 41 E1 | Exclusive OR with accumulator ((zero page,X))
    BRA $7F              ; 80 7F | Branch always
    SEP #$37             ; E2 37 | Set processor status bits
    SEC                  ; 38 | Set carry flag
    CLV                  ; B8 | Clear overflow flag
    DEC                  ; 3A | Decrement accumulator
    ORA $FF01,X          ; 1D 01 FF | Logical OR with accumulator (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF FF 3F FF | Load from absolute long,X into accumulator
    ROR $23F9            ; 6E F9 23 | Rotate right (absolute)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_038
; Address: $EB8FA8
; Size: 121 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_038:
    STA                  ; 9F E8 7F 88 | Store accumulator to absolute long,X
    BRA $F6              ; 80 F6 | Branch always
    CMP #$CE             ; C9 CE | Compare accumulator (immediate)
    SBC ($D6),Y          ; F1 D6 | Subtract with carry ((zero page),Y)
    PEA #$F1FF           ; F4 FF F1 | Push effective address to stack
    INC $FCFF,X          ; FE FF FC | Increment (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    BRA $FF              ; 80 FF | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    STA                  ; 9F FF 1E FF | Store accumulator to absolute long,X
    LSR $62FF,X          ; 5E FF 62 | Logical shift right (absolute,X)
    RTI                  ; 40 | Return from interrupt
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    ROR $FB81,X          ; 7E 81 FB | Rotate right (absolute,X)
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    PLP                  ; 28 | Pull processor status from stack
    SBC $EF2D,X          ; FD 2D EF | Subtract with carry (absolute,X)
    AND $25EF            ; 2D EF 25 | Logical AND with accumulator (absolute)
    DEC                  ; 3A | Decrement accumulator
    CMP $7FBD,X          ; DD BD 7F | Compare accumulator (absolute,X)
    CPX #$D2             ; E0 D2 | Compare X register (immediate)
    BEQ $D2              ; F0 D2 | Branch if equal
    BEQ $D0              ; F0 D0 | Branch if equal
    BEQ $D0              ; F0 D0 | Branch if equal
    CLD                  ; D8 | Clear decimal mode flag
    INX                  ; E8 | Increment X register
    PEA #$FFFF           ; F4 FF FF | Push effective address to stack
    ROL $7CFF,X          ; 3E FF 7C | Rotate left (absolute,X)
    INC $FFFE,X          ; FE FE FF | Increment (absolute,X)
    ORA $007E            ; 0D 7E 00 | Logical OR with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    STA $FFDFFF          ; 8F FF DF FF | Store accumulator to absolute long address
    LDA $BFEF,X          ; BD EF BF | Load from absolute,X into accumulator
    LDA                  ; BF E0 3F C0 | Load from absolute long,X into accumulator
    STA $F3B3FC          ; 8F FC B3 F3 | Store accumulator to absolute long address
    SBC $71FF,Y          ; F9 FF 71 | Subtract with carry (absolute,Y)
    SBC $7BA0,Y          ; F9 A0 7B | Subtract with carry (absolute,Y)
    ROL $F7              ; 26 F7 | Rotate left (zero page)
    LDA                  ; BF EE FE 90 | Load from absolute long,X into accumulator
    STA                  ; 9F FF FF F9 | Store accumulator to absolute long,X
    SBC $F6F0,Y          ; F9 F0 F6 | Subtract with carry (absolute,Y)
    CPX #$E4             ; E0 E4 | Compare X register (immediate)
    CPX #$E8             ; E0 E8 | Compare X register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $F1              ; F0 F1 | Branch if equal

;------------------------------------------------------------------------------
; Bank56_DmaFunction_039
; Address: $EB9081
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_039:
    PLX                  ; FA | Pull X register from stack
    INC $4CF5            ; EE F5 4C | Increment (absolute)
    BNE $FF              ; D0 FF | Branch if not equal
    SBC ($F9,X)          ; E1 F9 | Subtract with carry ((zero page,X))
    EOR $A1F7,Y          ; 59 F7 A1 | Exclusive OR with accumulator (absolute,Y)
    INC $FDF0,X          ; FE F0 FD | Increment (absolute,X)
    SBC ($7B),Y          ; F1 7B | Subtract with carry ((zero page),Y)
    XBA                  ; EB | Exchange accumulator bytes
    PLX                  ; FA | Pull X register from stack
    INX                  ; E8 | Increment X register
    SBC $33              ; E5 33 | Subtract with carry (zero page)
    DEC                  ; 3A | Decrement accumulator
    DEC                  ; 3A | Decrement accumulator
    LDX #$A2             ; A2 A2 | Load immediate value into X register
    BEQ $FF              ; F0 FF | Branch if equal
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    ASL $BE              ; 06 BE | Arithmetic shift left (zero page)
    DEC $7777            ; CE 77 77 | Decrement (absolute)
    EOR ($41,X)          ; 41 41 | Exclusive OR with accumulator ((zero page,X))
    ROL $7EFF,X          ; 3E FF 7E | Rotate left (absolute,X)
    ROR $2CEF            ; 6E EF 2C | Rotate right (absolute)
    CLC                  ; 18 | Clear carry flag
    SBC ($EB,X)          ; E1 EB | Subtract with carry ((zero page,X))
    TXA                  ; 8A | Transfer X register to accumulator
    STA                  ; 9F 99 B6 FF | Store accumulator to absolute long,X
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    LDA                  ; BF E0 FF 04 | Load from absolute long,X into accumulator
    ASL $86FB            ; 0E FB 86 | Arithmetic shift left (absolute)
    BRA $7F              ; 80 7F | Branch always
    BPL $FF              ; 10 FF | Branch if positive
    BPL $FF              ; 10 FF | Branch if positive
    BEQ $FF              ; F0 FF | Branch if equal
    CPX $FF              ; E4 FF | Compare X register (zero page)
    BEQ $F6              ; F0 F6 | Branch if equal
    XBA                  ; EB | Exchange accumulator bytes
    STA $F89D64          ; 8F 64 9D F8 | Store accumulator to absolute long address
    PEA #$F4F8           ; F4 F8 F4 | Push effective address to stack
    SBC $FFFA,X          ; FD FA FF | Subtract with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BEQ $FF              ; F0 FF | Branch if equal
    INC $FCF1,X          ; FE F1 FC | Increment (absolute,X)
    INY                  ; C8 | Increment Y register
    BPL $0F              ; 10 0F | Branch if positive
    ORA $E400            ; 0D 00 E4 | Logical OR with accumulator (absolute)
    BEQ $80              ; F0 80 | Branch if equal
    ADC $1F07            ; 6D 07 1F | Add with carry (absolute)
    PHP                  ; 08 | Push processor status to stack
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BRA $FF              ; 80 FF | Branch always
    CPX #$FF             ; E0 FF | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_03A
; Address: $EB9161
; Size: 119 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_03A:
    CPY $8C              ; C4 8C | Compare Y register (zero page)
    LDA $019E2E          ; AF 2E 9E 01 | Load from absolute long address into accumulator
    STA                  ; 9F 03 9F 38 | Store accumulator to absolute long,X
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    STA                  ; 9F FF 03 FF | Store accumulator to absolute long,X
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    DEC $FFC7            ; CE C7 FF | Decrement (absolute)
    ADC $9079,Y          ; 79 79 90 | Add with carry (absolute,Y)
    STA                  ; 9F C0 D1 00 | Store accumulator to absolute long,X
    LDY $F830            ; AC 30 F8 | Load from absolute address into Y register
    BEQ $FF              ; F0 FF | Branch if equal
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BRA $DE              ; 80 DE | Branch always
    CPX #$76             ; E0 76 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CMP $2D3E,X          ; DD 3E 2D | Compare accumulator (absolute,X)
    EOR $3F07,X          ; 5D 07 3F | Exclusive OR with accumulator (absolute,X)
    SBC #$FF             ; E9 FF | Subtract with carry (immediate)
    INC $F8FF,X          ; FE FF F8 | Increment (absolute,X)
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    SBC $FE7F,X          ; FD 7F FE | Subtract with carry (absolute,X)
    LDA                  ; BF 40 FE 01 | Load from absolute long,X into accumulator
    SBC $7B03,X          ; FD 03 7B | Subtract with carry (absolute,X)
    CMP $6F36,X          ; DD 36 6F | Compare accumulator (absolute,X)
    TYA                  ; 98 | Transfer Y register to accumulator
    EOR $FFDC            ; 4D DC FF | Exclusive OR with accumulator (absolute)
    EOR $5BFF,X          ; 5D FF 5B | Exclusive OR with accumulator (absolute,X)
    LDA                  ; BF FF FF FF | Load from absolute long,X into accumulator
    CPX $F81C            ; EC 1C F8 | Compare X register (absolute)
    SEC                  ; 38 | Set carry flag
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    ASL $00CE            ; 0E CE 00 | Arithmetic shift left (absolute)
    STY $008C            ; 8C 8C 00 | Store Y register to absolute address
    STA                  ; 9F BC 2E 31 | Store accumulator to absolute long,X
    SED                  ; F8 | Set decimal mode flag
    BPL $90              ; 10 90 | Branch if positive
    BRA $80              ; 80 80 | Branch always
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    TXS                  ; 9A | Transfer X register to stack pointer
    SEI                  ; 78 | Set interrupt disable flag
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    INC $F801,X          ; FE 01 F8 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_03B
; Address: $EB9329
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_03B:
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SBC $FFFF,X          ; FD FF FF | Subtract with carry (absolute,X)
    LSR $3A              ; 46 3A | Logical shift right (zero page)
    ORA $DB              ; 05 DB | Logical OR with accumulator (zero page)
    BIT $87              ; 24 87 | Test bits in accumulator (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    CPY #$5F             ; C0 5F | Compare Y register (immediate)
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    PHP                  ; 08 | Push processor status to stack
    SEI                  ; 78 | Set interrupt disable flag
    BNE $8F              ; D0 8F | Branch if not equal
    BVS $87              ; 70 87 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    RTI                  ; 40 | Return from interrupt
    CMP ($AF,X)          ; C1 AF | Compare accumulator ((zero page,X))
    BVC $83              ; 50 83 | Branch if overflow clear
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    ORA $9EA5,X          ; 1D A5 9E | Logical OR with accumulator (absolute,X)
    CMP $1B25,X          ; DD 25 1B | Compare accumulator (absolute,X)
    DEC $3CEF,X          ; DE EF 3C | Decrement (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    STZ $DDFE,X          ; 9E FE DD | Store zero to absolute,X
    SBC $F2F7,Y          ; F9 F7 F2 | Subtract with carry (absolute,Y)
    SBC $DBE4            ; ED E4 DB | Subtract with carry (absolute)
    INY                  ; C8 | Increment Y register
    ADC $FB              ; 65 FB | Add with carry (zero page)
    CMP $88F7,X          ; DD F7 88 | Compare accumulator (absolute,X)
    BCC $37              ; 90 37 | Branch if carry clear
    INX                  ; E8 | Increment X register
    LDA                  ; BF 40 FF 80 | Load from absolute long,X into accumulator
    INC $3FFF,X          ; FE FF 3F | Increment (absolute,X)
    EOR $8CBF,X          ; 5D BF 8C | Exclusive OR with accumulator (absolute,X)
    BCC $EF              ; 90 EF | Branch if carry clear
    RTI                  ; 40 | Return from interrupt
    LDY #$7F             ; A0 7F | Load immediate value into Y register
    SBC $F806,Y          ; F9 06 F8 | Subtract with carry (absolute,Y)
    SBC $FF02,X          ; FD 02 FF | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_03E
; Address: $EB941C
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_03E:
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BEQ $FF              ; F0 FF | Branch if equal
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SBC $FE06,Y          ; F9 06 FE | Subtract with carry (absolute,Y)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SBC $B207,Y          ; F9 07 B2 | Subtract with carry (absolute,Y)
    EOR $0CF3            ; 4D F3 0C | Exclusive OR with accumulator (absolute)
    SBC $FE06,Y          ; F9 06 FE | Subtract with carry (absolute,Y)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BRA $7A              ; 80 7A | Branch always
    CPX $BF13            ; EC 13 BF | Compare X register (absolute)
    RTI                  ; 40 | Return from interrupt
    BEQ $FF              ; F0 FF | Branch if equal
    BRA $FF              ; 80 FF | Branch always
    CMP $F227,Y          ; D9 27 F2 | Compare accumulator (absolute,Y)
    ORA $9669            ; 0D 69 96 | Logical OR with accumulator (absolute)
    INC $F701,X          ; FE 01 F7 | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    STA                  ; 9F FF 0F FF | Store accumulator to absolute long,X
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CPX $4F              ; E4 4F | Compare X register (zero page)
    BCS $96              ; B0 96 | Branch if carry set
    ADC #$7F             ; 69 7F | Add with carry (immediate)
    BRA $EF              ; 80 EF | Branch always
    BPL $7F              ; 10 7F | Branch if positive
    BRA $FF              ; 80 FF | Branch always
    SBC $F0FF,Y          ; F9 FF F0 | Subtract with carry (absolute,Y)
    BEQ $FF              ; F0 FF | Branch if equal
    BRA $FF              ; 80 FF | Branch always
    INC $5E01,X          ; FE 01 5E | Increment (absolute,X)
    SBC ($37,X)          ; E1 37 | Subtract with carry ((zero page,X))
    INY                  ; C8 | Increment Y register
    SBC $FF02,X          ; FD 02 FF | Subtract with carry (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    STA                  ; 9F E0 4D B2 | Store accumulator to absolute long,X
    BMI $9F              ; 30 9F | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_03F
; Address: $EB9529
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_03F:
    BRA $FF              ; 80 FF | Branch always
    SED                  ; F8 | Set decimal mode flag
    BEQ $FF              ; F0 FF | Branch if equal
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPX #$9F             ; E0 9F | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_040
; Address: $EB9545
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_040:
    BRA $FF              ; 80 FF | Branch always
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal

;------------------------------------------------------------------------------
; Bank56_DmaFunction_041
; Address: $EB9556
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_041:
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    SBC $FF02,X          ; FD 02 FF | Subtract with carry (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SBC $FB07,X          ; FD 07 FB | Subtract with carry (absolute,X)
    ASL $3CEF,X          ; 1E EF 3C | Arithmetic shift left (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    INC $FD02,X          ; FE 02 FD | Increment (absolute,X)
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    SBC $DB24            ; ED 24 DB | Subtract with carry (absolute)
    PHA                  ; 48 | Push accumulator to stack
    LDA                  ; BF F1 7F E2 | Load from absolute long,X into accumulator
    CPY $FF              ; C4 FF | Compare Y register (zero page)
    DEY                  ; 88 | Decrement Y register
    BPL $FF              ; 10 FF | Branch if positive

;------------------------------------------------------------------------------
; Bank56_DmaFunction_042
; Address: $EB958B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_042:
    JSR $40FF            ; 20 FF 40 | Jump to subroutine
    BRA $91              ; 80 91 | Branch always
    ROR $DD22            ; 6E 22 DD | Rotate right (absolute)
    EOR $BB              ; 45 BB | Exclusive OR with accumulator (zero page)
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank56_DmaFunction_044
; Address: $EB95A1
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_044:
    JSR $609F            ; 20 9F 60 | Jump to subroutine
    BVS $FF              ; 70 FF | Branch if overflow set
    BEQ $FF              ; F0 FF | Branch if equal
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_045
; Address: $EB95C1
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_045:
    BCC $60              ; 90 60 | Branch if carry clear
    BCC $60              ; 90 60 | Branch if carry clear
    BCC $60              ; 90 60 | Branch if carry clear
    BCC $60              ; 90 60 | Branch if carry clear
    BCC $60              ; 90 60 | Branch if carry clear
    BCC $60              ; 90 60 | Branch if carry clear
    BCC $60              ; 90 60 | Branch if carry clear
    BCC $00              ; 90 00 | Branch if carry clear
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $E2              ; F0 E2 | Branch if equal
    BEQ $C2              ; F0 C2 | Branch if equal
    BEQ $C2              ; F0 C2 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    BPL $F0              ; 10 F0 | Branch if positive
    BPL $F0              ; 10 F0 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank56_DmaFunction_046
; Address: $EB963A
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_046:
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    CPY $FF00            ; CC 00 FF | Compare Y register (absolute)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    INC $3F00,X          ; FE 00 3F | Increment (absolute,X)
    CLD                  ; D8 | Clear decimal mode flag
    CPY $FFFF            ; CC FF FF | Compare Y register (absolute)
    INC $3FFF,X          ; FE FF 3F | Increment (absolute,X)
    STX $F900            ; 8E 00 F9 | Store X register to absolute address
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    STX $F9FF            ; 8E FF F9 | Store X register to absolute address
    LDY $00              ; A4 00 | Load from zero page into Y register
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_047
; Address: $EB96A7
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_047:
    STA $C4FF00          ; 8F 00 FF C4 | Store accumulator to absolute long address
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $A7              ; F0 A7 | Branch if equal
    SEC                  ; 38 | Set carry flag
    STA $FFFFFF          ; 8F FF FF FF | Store accumulator to absolute long address
    SED                  ; F8 | Set decimal mode flag
    DEC $FC00            ; CE 00 FC | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_048
; Address: $EB96C8
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_048:
    JSR $1EDF            ; 20 DF 1E | Jump to subroutine
    ORA ($F3,X)          ; 01 F3 | Logical OR with accumulator ((zero page,X))
    CLV                  ; B8 | Clear overflow flag
    DEC $FCFF            ; CE FF FC | Decrement (absolute)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 00 7F 1F | Load from absolute long,X into accumulator
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CLC                  ; 18 | Clear carry flag
    LDA                  ; BF F8 00 FF | Load from absolute long,X into accumulator
    ORA ($F1,X)          ; 01 F1 | Logical OR with accumulator ((zero page,X))
    INC $3F01,X          ; FE 01 3F | Increment (absolute,X)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    SBC $E107,Y          ; F9 07 E1 | Subtract with carry (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    SBC $97FF,Y          ; F9 FF 97 | Subtract with carry (absolute,Y)
    BEQ $00              ; F0 00 | Branch if equal
    ASL $8F20,X          ; 1E 20 8F | Arithmetic shift left (absolute,X)
    RTI                  ; 40 | Return from interrupt
    CPY #$3B             ; C0 3B | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_049
; Address: $EB974B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_049:
    STA                  ; 9F 94 03 3F | Store accumulator to absolute long,X
    BEQ $3F              ; F0 3F | Branch if equal
    INC $FFCF,X          ; FE CF FF | Increment (absolute,X)
    ASL $FF01,X          ; 1E 01 FF | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_04A
; Address: $EB9767
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_04A:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    INX                  ; E8 | Increment X register
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    INX                  ; E8 | Increment X register
    STZ $7F60            ; 9C 60 7F | Store zero to absolute
    BRA $F1              ; 80 F1 | Branch always
    ASL $27C0            ; 0E C0 27 | Arithmetic shift left (absolute)
    BMI $30              ; 30 30 | Branch if negative
    CLV                  ; B8 | Clear overflow flag
    DEC $F4              ; C6 F4 | Decrement (zero page)
    CLC                  ; 18 | Clear carry flag
    BMI $FF              ; 30 FF | Branch if negative
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    LDA                  ; BF FF 03 00 | Load from absolute long,X into accumulator
    STA $0FF000          ; 8F 00 F0 0F | Store accumulator to absolute long address
    SBC $3F00,X          ; FD 00 3F | Subtract with carry (absolute,X)
    BRA $FF              ; 80 FF | Branch always
    STA $FFFFFF          ; 8F FF FF FF | Store accumulator to absolute long address
    SBC $3FFF,X          ; FD FF 3F | Subtract with carry (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $FF              ; 10 FF | Branch if positive
    BPL $FF              ; 10 FF | Branch if positive
    BPL $FF              ; 10 FF | Branch if positive
    BPL $FF              ; 10 FF | Branch if positive
    BMI $FF              ; 30 FF | Branch if negative
    BMI $E7              ; 30 E7 | Branch if negative
    BEQ $E7              ; F0 E7 | Branch if equal
    BEQ $E7              ; F0 E7 | Branch if equal
    BMI $E7              ; 30 E7 | Branch if negative
    BMI $E7              ; 30 E7 | Branch if negative
    BMI $E7              ; 30 E7 | Branch if negative
    BCC $E7              ; 90 E7 | Branch if carry clear
    BCS $00              ; B0 00 | Branch if carry set
    BMI $00              ; 30 00 | Branch if negative
    BMI $20              ; 30 20 | Branch if negative
    BMI $20              ; 30 20 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    BMI $20              ; 30 20 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    LDA ($00),Y          ; B1 00 | Load from (zero page),Y into accumulator
    LDA ($00),Y          ; B1 00 | Load from (zero page),Y into accumulator
    PHP                  ; 08 | Push processor status to stack
    BEQ $80              ; F0 80 | Branch if equal
    BEQ $C0              ; F0 C0 | Branch if equal
    SBC ($41),Y          ; F1 41 | Subtract with carry ((zero page),Y)
    SBC ($61),Y          ; F1 61 | Subtract with carry ((zero page),Y)
    SBC ($71),Y          ; F1 71 | Subtract with carry ((zero page),Y)
    SBC ($31,X)          ; E1 31 | Subtract with carry ((zero page,X))
    SBC ($31),Y          ; F1 31 | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_04B
; Address: $EB982E
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_04B:
    SBC ($01),Y          ; F1 01 | Subtract with carry ((zero page),Y)
    INC $FE0E,X          ; FE 0E FE | Increment (absolute,X)
    ASL $0EFE            ; 0E FE 0E | Arithmetic shift left (absolute)
    INC $FE0E,X          ; FE 0E FE | Increment (absolute,X)
    ASL $01FE            ; 0E FE 01 | Arithmetic shift left (absolute)
    TYA                  ; 98 | Transfer Y register to accumulator
    PHY                  ; 5A | Push Y register to stack
    CPX #$11             ; E0 11 | Compare X register (immediate)
    LDA $02              ; A5 02 | Load from zero page into accumulator
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    LDX $5EFF,Y          ; BE FF 5E | Load from absolute,Y into X register
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC $F901,X          ; FE 01 F9 | Increment (absolute,X)
    BVS $F7              ; 70 F7 | Branch if overflow set
    SBC $FFFF,X          ; FD FF FF | Subtract with carry (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC $F901,X          ; FE 01 F9 | Increment (absolute,X)
    STA $F7FFFE          ; 8F FE FF F7 | Store accumulator to absolute long address
    SBC $FFFF,X          ; FD FF FF | Subtract with carry (absolute,X)
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$E1             ; E0 E1 | Compare X register (immediate)
    ORA $E000            ; 0D 00 E0 | Game work RAM access
    BCC $F0              ; 90 F0 | Branch if carry clear
    BEQ $01              ; F0 01 | Branch if equal
    SBC $E0FF            ; ED FF E0 | Game work RAM access
    STA                  ; 9F FF FF FF | Store accumulator to absolute long,X
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $08              ; F0 08 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    INC $FF40,X          ; FE 40 FF | Increment (absolute,X)
    BRA $FF              ; 80 FF | Branch always
    BVS $7F              ; 70 7F | Branch if overflow set
    ASL $000F            ; 0E 0F 00 | Arithmetic shift left (absolute)
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF 80 FF F1 | Load from absolute long,X into accumulator
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    BRA $C7              ; 80 C7 | Branch always
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    PHY                  ; 5A | Push Y register to stack
    TXA                  ; 8A | Transfer X register to accumulator
    EOR $44              ; 45 44 | Exclusive OR with accumulator (zero page)
    EOR #$FF             ; 49 FF | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_04C
; Address: $EB98F7
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_04C:
    INC $FFDF,X          ; FE DF FF | Increment (absolute,X)
    ADC $7AFF,X          ; 7D FF 7A | Add with carry (absolute,X)
    INC $18E7,X          ; FE E7 18 | Increment (absolute,X)
    AND $1CF0,X          ; 3D F0 1C | Logical AND with accumulator (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_04D
; Address: $EB990C
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_04D:
    LDY $9FFF,X          ; BC FF 9F | Load from absolute,X into Y register
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    ORA $00E3            ; 0D E3 00 | Logical OR with accumulator (absolute)
    LDA                  ; BF 00 7F 00 | Load from absolute long,X into accumulator
    BEQ $FF              ; F0 FF | Branch if equal
    ORA $BAFF            ; 0D FF BA | Logical OR with accumulator (absolute)
    INC $FCB8,X          ; FE B8 FC | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    CLD                  ; D8 | Clear decimal mode flag
    STA                  ; 9F 60 0F 60 | Store accumulator to absolute long,X
    LDA $7771AE          ; AF AE 71 77 | Load from absolute long address into accumulator
    DEC                  ; 3A | Decrement accumulator
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    STA                  ; 9F FF 9F 6F | Store accumulator to absolute long,X
    EOR ($01),Y          ; 51 01 | Exclusive OR with accumulator ((zero page),Y)
    STX $C500            ; 8E 00 C5 | Store X register to absolute address
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA $FFF0            ; 0D F0 FF | Logical OR with accumulator (absolute)
    BEQ $FF              ; F0 FF | Branch if equal
    CPX $2FEC            ; EC EC 2F | Compare X register (absolute)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    SBC $FFFF,X          ; FD FF FF | Subtract with carry (absolute,X)
    STY $FF00            ; 8C 00 FF | Store Y register to absolute address
    CPX $EF1F            ; EC 1F EF | Compare X register (absolute)
    SEC                  ; 38 | Set carry flag
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    INY                  ; C8 | Increment Y register
    ASL $F8              ; 06 F8 | Arithmetic shift left (zero page)
    ASL $16              ; 06 16 | Arithmetic shift left (zero page)
    SBC #$00             ; E9 00 | Subtract with carry (immediate)
    SBC $F9CE,Y          ; F9 CE F9 | Subtract with carry (absolute,Y)
    INC $16FF,X          ; FE FF 16 | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    SBC $0700,Y          ; F9 00 07 | Subtract with carry (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    SBC $04FC,Y          ; F9 FC 04 | Subtract with carry (absolute,Y)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BRA $FC              ; 80 FC | Branch always
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank56_DmaFunction_04E
; Address: $EB99C4
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_04E:
    STA $868F02          ; 8F 02 8F 86 | Store accumulator to absolute long address
    STA $8C878E          ; 8F 8E 87 8C | Store accumulator to absolute long address
    STY $800F            ; 8C 0F 80 | Store Y register to absolute address
    BCS $FF              ; B0 FF | Branch if carry set
    BCS $FF              ; B0 FF | Branch if carry set
    BEQ $FF              ; F0 FF | Branch if equal
    BVS $7F              ; 70 7F | Branch if overflow set
    BVS $7F              ; 70 7F | Branch if overflow set
    BVS $7F              ; 70 7F | Branch if overflow set
    BEQ $7F              ; F0 7F | Branch if equal
    BEQ $7F              ; F0 7F | Branch if equal
    BMI $E7              ; 30 E7 | Branch if negative
    BMI $E3              ; 30 E3 | Branch if negative
    BVS $E3              ; 70 E3 | Branch if overflow set
    BVS $E3              ; 70 E3 | Branch if overflow set
    ADC ($E3),Y          ; 71 E3 | Add with carry ((zero page),Y)
    ADC ($E3),Y          ; 71 E3 | Add with carry ((zero page),Y)
    SBC ($E3),Y          ; F1 E3 | Subtract with carry ((zero page),Y)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    LDA ($00),Y          ; B1 00 | Load from (zero page),Y into accumulator
    LDA ($00),Y          ; B1 00 | Load from (zero page),Y into accumulator
    ORA ($D3,X)          ; 01 D3 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BIT $FF              ; 24 FF | Test bits in accumulator (zero page)
    BIT $FF              ; 24 FF | Test bits in accumulator (zero page)
    SBC ($01,X)          ; E1 01 | Subtract with carry ((zero page,X))
    INC $FC0C,X          ; FE 0C FC | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    BCC $D0              ; 90 D0 | Branch if carry clear
    TXA                  ; 8A | Transfer X register to accumulator
    NOP                  ; EA | No operation
    TXA                  ; 8A | Transfer X register to accumulator
    NOP                  ; EA | No operation
    DEC $E4EE            ; CE EE E4 | Decrement (absolute)
    SBC $95              ; E5 95 | Subtract with carry (zero page)
    JMP $7F5E7F          ; 5C 7F 5E 7F | Jump to address long
    ROR $6E3F            ; 6E 3F 6E | Rotate right (absolute)
    ROR $763F            ; 6E 3F 76 | Rotate right (absolute)
    PLA                  ; 68 | Pull accumulator from stack
    SEI                  ; 78 | Set interrupt disable flag
    RTI                  ; 40 | Return from interrupt
    ROL $3047,X          ; 3E 47 30 | Rotate left (absolute,X)
    JMP $066D0E          ; 5C 0E 6D 06 | Jump to address long
    ADC $02              ; 65 02 | Add with carry (zero page)
    AND ($6F,X)          ; 21 6F | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank56_DmaFunction_04F
; Address: $EB9A74
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_04F:
    ROR $77FF,X          ; 7E FF 77 | Rotate right (absolute,X)
    SBC $EA0C,X          ; FD 0C EA | Subtract with carry (absolute,X)
    CPX $D8              ; E4 D8 | Compare X register (zero page)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_050
; Address: $EB9A8C
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_050:
    JSL $06210C          ; 22 0C 21 06 | Jump to subroutine long
    SBC $FAFF,X          ; FD FF FA | Subtract with carry (absolute,X)
    ROL $27FF            ; 2E FF 27 | Rotate left (absolute)
    INX                  ; E8 | Increment X register
    SBC #$A5             ; E9 A5 | Subtract with carry (immediate)
    LDA $D2              ; A5 D2 | Load from zero page into accumulator
    SED                  ; F8 | Set decimal mode flag
    CPX $9670            ; EC 70 96 | Compare X register (absolute)
    PHP                  ; 08 | Push processor status to stack
    SBC #$FF             ; E9 FF | Subtract with carry (immediate)
    LDA $FF              ; A5 FF | Load from zero page into accumulator
    SED                  ; F8 | Set decimal mode flag
    STZ $97FF,X          ; 9E FF 97 | Store zero to absolute,X
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_051
; Address: $EB9AC5
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_051:
    ASL $E0              ; 06 E0 | Game work RAM access
    CPX #$A6             ; E0 A6 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$04             ; C0 04 | Compare Y register (immediate)
    ROL $06FF,X          ; 3E FF 06 | Rotate left (absolute,X)
    SEP #$FF             ; E2 FF | Set processor status bits
    INC $FF              ; E6 FF | Increment (zero page)
    CPY $FF              ; C4 FF | Compare Y register (zero page)
    EOR ($53,X)          ; 41 53 | Exclusive OR with accumulator ((zero page,X))
    EOR ($57),Y          ; 51 57 | Exclusive OR with accumulator ((zero page),Y)
    LDA $878FA7          ; AF A7 8F 87 | Load from absolute long address into accumulator
    DEC $72C7            ; CE C7 72 | Decrement (absolute)
    INC $FE72,X          ; FE 72 FE | Increment (absolute,X)
    CPX $FC              ; E4 FC | Compare X register (zero page)
    CPX $FC              ; E4 FC | Compare X register (zero page)
    INX                  ; E8 | Increment X register
    SED                  ; F8 | Set decimal mode flag
    INY                  ; C8 | Increment Y register
    SED                  ; F8 | Set decimal mode flag
    CMP #$F8             ; C9 F8 | Compare accumulator (immediate)
    STA                  ; 9F E2 BF E0 | Store accumulator to absolute long,X
    LDA $B9E2,X          ; BD E2 B9 | Load from absolute,X into accumulator
    DEC $7B              ; C6 7B | Decrement (zero page)
    DEC $7F              ; C6 7F | Decrement (zero page)
    DEC $7F              ; C6 7F | Decrement (zero page)
    STX $7F              ; 86 7F | Store X register to zero page
    SBC $FB07,Y          ; F9 07 FB | Subtract with carry (absolute,Y)
    ASL $FB              ; 06 FB | Arithmetic shift left (zero page)
    ASL $FB              ; 06 FB | Arithmetic shift left (zero page)
    ASL $FB              ; 06 FB | Arithmetic shift left (zero page)
    ASL $FB              ; 06 FB | Arithmetic shift left (zero page)
    ASL $E6              ; 06 E6 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_052
; Address: $EB9B32
; Size: 116 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_052:
    INC $04              ; E6 04 | Increment (zero page)
    ROR $04              ; 66 04 | Rotate right (zero page)
    ROR $04              ; 66 04 | Rotate right (zero page)
    ROL $04              ; 26 04 | Rotate left (zero page)
    ROR $04              ; 66 04 | Rotate right (zero page)
    INC $04              ; E6 04 | Increment (zero page)
    INC $04              ; E6 04 | Increment (zero page)
    INC $ECBF,X          ; FE BF EC | Increment (absolute,X)
    INY                  ; C8 | Increment Y register
    LDA                  ; BF EC FB 04 | Load from absolute long,X into accumulator
    PLB                  ; AB | Pull data bank register from stack
    INX                  ; E8 | Increment X register
    ORA ($41,X)          ; 01 41 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    ORA ($41,X)          ; 01 41 | Logical OR with accumulator ((zero page,X))
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ORA ($55,X)          ; 01 55 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($A9,X)          ; 01 A9 | Logical OR with accumulator ((zero page,X))
    ORA ($AF,X)          ; 01 AF | Logical OR with accumulator ((zero page,X))
    LDA $C6AFC7          ; AF C7 AF C6 | Load from absolute long address into accumulator
    LDA $C6AFC6          ; AF C6 AF C6 | Load from absolute long address into accumulator
    LDA $D6AFC6          ; AF C6 AF D6 | Load from absolute long address into accumulator
    LDA $1F48C6          ; AF C6 48 1F | Load from absolute long address into accumulator
    PHA                  ; 48 | Push accumulator to stack
    EOR #$1E             ; 49 1E | Exclusive OR with accumulator (immediate)
    EOR #$1E             ; 49 1E | Exclusive OR with accumulator (immediate)
    EOR #$1E             ; 49 1E | Exclusive OR with accumulator (immediate)
    ADC #$1E             ; 69 1E | Add with carry (immediate)
    ADC $491E,Y          ; 79 1E 49 | Add with carry (absolute,Y)
    ASL $FFFF,X          ; 1E FF FF | Arithmetic shift left (absolute,X)
    PHX                  ; DA | Push X register to stack
    NOP                  ; EA | No operation
    LDA                  ; BF 6B 00 FF | Load from absolute long,X into accumulator
    AND $C400            ; 2D 00 C4 | Logical AND with accumulator (absolute)
    EOR $FF00,X          ; 5D 00 FF | Exclusive OR with accumulator (absolute,X)
    SBC $FDFE,X          ; FD FE FD | Subtract with carry (absolute,X)
    LDA $7DEC,X          ; BD EC 7D | Load from absolute,X into accumulator
    CPY $ECDD            ; CC DD EC | Compare Y register (absolute)
    SBC $FD0C,X          ; FD 0C FD | Subtract with carry (absolute,X)
    LSR $FF03            ; 4E 03 FF | Logical shift right (absolute)
    SBC ($0F),Y          ; F1 0F | Subtract with carry ((zero page),Y)
    EOR ($0F),Y          ; 51 0F | Exclusive OR with accumulator ((zero page),Y)
    LDA ($0F),Y          ; B1 0F | Load from (zero page),Y into accumulator
    AND ($0F),Y          ; 31 0F | Logical AND with accumulator ((zero page),Y)
    SBC ($0F),Y          ; F1 0F | Subtract with carry ((zero page),Y)
    BRA $47              ; 80 47 | Branch always
    CPY #$07             ; C0 07 | Compare Y register (immediate)
    CMP ($07,X)          ; C1 07 | Compare accumulator ((zero page,X))
    CMP ($07,X)          ; C1 07 | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank56_DmaFunction_053
; Address: $EB9BC9
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_053:
    CMP ($07,X)          ; C1 07 | Compare accumulator ((zero page,X))
    CMP $27              ; C5 27 | Compare accumulator (zero page)
    SBC ($07,X)          ; E1 07 | Subtract with carry ((zero page,X))
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BCS $3F              ; B0 3F | Branch if carry set
    BEQ $3F              ; F0 3F | Branch if equal
    BEQ $3F              ; F0 3F | Branch if equal
    BEQ $3F              ; F0 3F | Branch if equal
    BEQ $3F              ; F0 3F | Branch if equal
    CLD                  ; D8 | Clear decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SBC ($E3),Y          ; F1 E3 | Subtract with carry ((zero page),Y)
    BEQ $69              ; F0 69 | Branch if equal
    BEQ $E9              ; F0 E9 | Branch if equal
    BEQ $F9              ; F0 F9 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SBC ($F8),Y          ; F1 F8 | Subtract with carry ((zero page),Y)
    ADC ($F8),Y          ; 71 F8 | Add with carry ((zero page),Y)
    LDA ($F8),Y          ; B1 F8 | Load from (zero page),Y into accumulator
    ORA ($C3,X)          ; 01 C3 | Logical OR with accumulator ((zero page,X))
    SBC ($80,X)          ; E1 80 | Subtract with carry ((zero page,X))
    SBC ($80,X)          ; E1 80 | Subtract with carry ((zero page,X))
    SBC ($80,X)          ; E1 80 | Subtract with carry ((zero page,X))
    SBC ($80,X)          ; E1 80 | Subtract with carry ((zero page,X))
    SBC ($80,X)          ; E1 80 | Subtract with carry ((zero page,X))
    SBC ($80,X)          ; E1 80 | Subtract with carry ((zero page,X))
    BIT $FF              ; 24 FF | Test bits in accumulator (zero page)
    STZ $BE1F,X          ; 9E 1F BE | Store zero to absolute,X
    BPL $F8              ; 10 F8 | Branch if positive
    BPL $F0              ; 10 F0 | Branch if positive
    BMI $F0              ; 30 F0 | Branch if negative

;------------------------------------------------------------------------------
; Bank56_DmaFunction_054
; Address: $EB9C36
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_054:
    JSR $20F0            ; 20 F0 20 | Jump to subroutine
    CPX #$41             ; E0 41 | Compare X register (immediate)
    CPX #$41             ; E0 41 | Compare X register (immediate)
    CPY #$41             ; C0 41 | Compare Y register (immediate)
    CPY #$E3             ; C0 E3 | Compare Y register (immediate)
    TXA                  ; 8A | Transfer X register to accumulator
    SBC ($0D),Y          ; F1 0D | Subtract with carry ((zero page),Y)
    SBC ($0D),Y          ; F1 0D | Subtract with carry ((zero page),Y)
    SBC ($1D),Y          ; F1 1D | Subtract with carry ((zero page),Y)
    SBC #$3D             ; E9 3D | Subtract with carry (immediate)
    SBC ($3D),Y          ; F1 3D | Subtract with carry ((zero page),Y)
    STA $3D0F,X          ; 9D 0F 3D | Store accumulator to absolute,X
    AND $750F,X          ; 3D 0F 75 | Logical AND with accumulator (absolute,X)
    ADC $0207,X          ; 7D 07 02 | Add with carry (absolute,X)
    AND ($04,X)          ; 21 04 | Logical AND with accumulator ((zero page,X))
    BMI $02              ; 30 02 | Branch if negative
    TAX                  ; AA | Transfer accumulator to X register
    BCC $A9              ; 90 A9 | Branch if carry clear
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank56_DmaFunction_055
; Address: $EB9C6F
; Size: 113 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_055:
    LDX $23              ; A6 23 | Load from zero page into X register
    TSX                  ; BA | Transfer stack pointer to X register
    LDA $BEFF,Y          ; B9 FF BE | Load from absolute,Y into accumulator
    BIT $07              ; 24 07 | Test bits in accumulator (zero page)
    PHX                  ; DA | Push X register to stack
    AND ($31),Y          ; 31 31 | Logical AND with accumulator ((zero page),Y)
    AND $88              ; 25 88 | Logical AND with accumulator (zero page)
    INC $0022            ; EE 22 00 | Increment (absolute)
    ASL $C0DE,X          ; 1E DE C0 | Arithmetic shift left (absolute,X)
    CPY #$27             ; C0 27 | Compare Y register (immediate)
    AND $ADFF,Y          ; 39 FF AD | Logical AND with accumulator (absolute,Y)
    INC $3FFF            ; EE FF 3F | Increment (absolute)
    DEC $C0FF,X          ; DE FF C0 | Decrement (absolute,X)
    BCC $01              ; 90 01 | Branch if carry clear
    LDA #$11             ; A9 11 | Load immediate value into accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA ($65,X)          ; 01 65 | Logical OR with accumulator ((zero page,X))
    TAY                  ; A8 | Transfer accumulator to Y register
    BRA $83              ; 80 83 | Branch always
    STA ($FF),Y          ; 91 FF | Store accumulator to (zero page),Y
    LDA $98FF,Y          ; B9 FF 98 | Load from absolute,Y into accumulator
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    SBC $FCFF            ; ED FF FC | Subtract with carry (absolute)
    RTI                  ; 40 | Return from interrupt
    STY $21              ; 84 21 | PPU graphics register access
    SBC $ADA1            ; ED A1 AD | Subtract with carry (absolute)
    EOR ($09,X)          ; 41 09 | Exclusive OR with accumulator ((zero page,X))
    EOR ($99,X)          ; 41 99 | Exclusive OR with accumulator ((zero page,X))
    STA ($99,X)          ; 81 99 | Store accumulator to (zero page,X)
    ORA #$91             ; 09 91 | Logical OR with accumulator (immediate)
    ORA $C461,Y          ; 19 61 C4 | Logical OR with accumulator (absolute,Y)
    SBC $EDFF            ; ED FF ED | Subtract with carry (absolute)
    EOR #$FF             ; 49 FF | Exclusive OR with accumulator (immediate)
    CMP $99FF,Y          ; D9 FF 99 | Compare accumulator (absolute,Y)
    STA $79FF,Y          ; 99 FF 79 | Store accumulator to absolute,Y
    LSR $5E57            ; 4E 57 5E | Logical shift right (absolute)
    DEC $9DCF,X          ; DE CF 9D | Decrement (absolute,X)
    LDA $9FAF9D          ; AF 9D AF 9F | Load from absolute long address into accumulator
    LDA                  ; BF DE 3B 5E | Load from absolute long,X into accumulator
    CMP $D1F8,Y          ; D9 F8 D1 | Compare accumulator (absolute,Y)
    BEQ $D1              ; F0 D1 | Branch if equal
    BEQ $B3              ; F0 B3 | Branch if equal
    BEQ $B3              ; F0 B3 | Branch if equal
    BEQ $F3              ; F0 F3 | Branch if equal
    BEQ $E3              ; F0 E3 | Branch if equal
    CPX #$66             ; E0 66 | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BRA $FF              ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank56_DmaFunction_056
; Address: $EB9D18
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_056:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    ASL $FB              ; 06 FB | Arithmetic shift left (zero page)
    ASL $FB              ; 06 FB | Arithmetic shift left (zero page)
    ASL $FB              ; 06 FB | Arithmetic shift left (zero page)
    ASL $FB              ; 06 FB | Arithmetic shift left (zero page)
    ASL $FB              ; 06 FB | Arithmetic shift left (zero page)
    ORA ($E6,X)          ; 01 E6 | Logical OR with accumulator ((zero page,X))
    ROR $04              ; 66 04 | Rotate right (zero page)
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank56_DmaFunction_057
; Address: $EB9D47
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_057:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    SBC $0101,Y          ; F9 01 01 | Subtract with carry (absolute,Y)
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    LDA $D6AFC6          ; AF C6 AF D6 | Load from absolute long address into accumulator
    LDA $C6AFD6          ; AF D6 AF C6 | Load from absolute long address into accumulator
    LDA $D6AFD6          ; AF D6 AF D6 | Load from absolute long address into accumulator
    LDA $D6AFD6          ; AF D6 AF D6 | Load from absolute long address into accumulator
    EOR #$1E             ; 49 1E | Exclusive OR with accumulator (immediate)
    EOR $591E,Y          ; 59 1E 59 | Exclusive OR with accumulator (absolute,Y)
    ASL $1E49,X          ; 1E 49 1E | Arithmetic shift left (absolute,X)
    EOR $591E,Y          ; 59 1E 59 | Exclusive OR with accumulator (absolute,Y)
    ASL $1E59,X          ; 1E 59 1E | Arithmetic shift left (absolute,X)
    EOR $FF1E,Y          ; 59 1E FF | Exclusive OR with accumulator (absolute,Y)
    ROR $00FF,X          ; 7E FF 00 | Rotate right (absolute,X)
    EOR $00FF,X          ; 5D FF 00 | Exclusive OR with accumulator (absolute,X)
    JMP ($00FF)          ; 6C FF 00 | Jump to address (absolute indirect)
    LDX $00              ; A6 00 | Load from zero page into X register
    SBC $FD0E,X          ; FD 0E FD | Subtract with carry (absolute,X)
    CPY $0EFD            ; CC FD 0E | Compare Y register (absolute)
    SBC $FD0E,X          ; FD 0E FD | Subtract with carry (absolute,X)
    ASL $4EFD            ; 0E FD 4E | Arithmetic shift left (absolute)
    SBC $FD0E,X          ; FD 0E FD | Subtract with carry (absolute,X)
    ASL $0FF3            ; 0E F3 0F | Arithmetic shift left (absolute)
    AND ($0F),Y          ; 31 0F | Logical AND with accumulator ((zero page),Y)
    CPY #$B3             ; C0 B3 | Compare Y register (immediate)
    BNE $A3              ; D0 A3 | Branch if not equal
    BNE $B3              ; D0 B3 | Branch if not equal
    CPY #$BB             ; C0 BB | Compare Y register (immediate)
    INY                  ; C8 | Increment Y register
    LDA ($C8),Y          ; B1 C8 | Load from (zero page),Y into accumulator
    CPY $CCB0            ; CC B0 CC | Compare Y register (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    PLA                  ; 68 | Pull accumulator from stack
    ROR $7A07,X          ; 7E 07 7A | Rotate right (absolute,X)
    ROR $C903,X          ; 7E 03 C9 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_058
; Address: $EB9DE1
; Size: 116 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_058:
    SEI                  ; 78 | Set interrupt disable flag
    CMP #$78             ; C9 78 | Compare accumulator (immediate)
    CPX #$38             ; E0 38 | Compare X register (immediate)
    CPX #$38             ; E0 38 | Compare X register (immediate)
    BEQ $18              ; F0 18 | Branch if equal
    BEQ $18              ; F0 18 | Branch if equal
    PEA #$F418           ; F4 18 F4 | Push effective address to stack
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    SBC ($C0,X)          ; E1 C0 | Subtract with carry ((zero page,X))
    SBC ($C0),Y          ; F1 C0 | Subtract with carry ((zero page),Y)
    SBC ($C0),Y          ; F1 C0 | Subtract with carry ((zero page),Y)
    BEQ $E0              ; F0 E0 | Game work RAM access
    LDA ($E0),Y          ; B1 E0 | Game work RAM access
    BCS $E0              ; B0 E0 | Game work RAM access
    BEQ $60              ; F0 60 | Branch if equal
    BEQ $70              ; F0 70 | Branch if equal
    ASL $0EFF            ; 0E FF 0E | Arithmetic shift left (absolute)
    ASL $0EFF            ; 0E FF 0E | Arithmetic shift left (absolute)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    AND $3D3E,X          ; 3D 3E 3D | Logical AND with accumulator (absolute,X)
    ROL $3E3F,X          ; 3E 3F 3E | Rotate left (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $43              ; F0 43 | Branch if equal
    CPY #$03             ; C0 03 | Compare Y register (immediate)
    CPY #$03             ; C0 03 | Compare Y register (immediate)
    CPY #$07             ; C0 07 | Compare Y register (immediate)
    BRA $07              ; 80 07 | Branch always
    BRA $0F              ; 80 0F | Branch always
    BRA $0F              ; 80 0F | Branch always
    BEQ $2E              ; F0 2E | Branch if equal
    BEQ $4E              ; F0 4E | Branch if equal
    BEQ $8E              ; F0 8E | Branch if equal
    INC $FA3C,X          ; FE 3C FA | Increment (absolute,X)
    JMP $3ECF            ; 4C CF 3E | Jump to address
    ROR $FE07,X          ; 7E 07 FE | Rotate right (absolute,X)
    INC $FA07,X          ; FE 07 FA | Increment (absolute,X)
    INC $FE03,X          ; FE 03 FE | Increment (absolute,X)
    CPY $980F            ; CC 0F 98 | Compare Y register (absolute)
    BRA $88              ; 80 88 | Branch always
    BIT #$96             ; 89 96 | Test bits in accumulator (immediate)
    STA $948991          ; 8F 91 89 94 | Store accumulator to absolute long address
    STA ($8F),Y          ; 91 8F | Store accumulator to (zero page),Y
    ADC $98              ; 65 98 | Add with carry (zero page)
    SBC $FF98,Y          ; F9 98 FF | Subtract with carry (absolute,Y)
    STA $9FFF,X          ; 9D FF 9F | Store accumulator to absolute,X
    STZ $9DFE,X          ; 9E FE 9D | Store zero to absolute,X
    STA                  ; 9F FF FD FF | Store accumulator to absolute long,X
    SBC $00FF,Y          ; F9 FF 00 | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_059
; Address: $EB9E83
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_059:
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    LDX $E07F,Y          ; BE 7F E0 | Game work RAM access
    SEC                  ; 38 | Set carry flag
    CPX #$E0             ; E0 E0 | Game work RAM access
    CMP ($C0,X)          ; C1 C0 | Compare accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    INC $07F8,X          ; FE F8 07 | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SBC $EAE5,X          ; FD E5 EA | Subtract with carry (absolute,X)
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    SBC $EFFF,X          ; FD FF EF | Subtract with carry (absolute,X)
    SEP #$8A             ; E2 8A | Set processor status bits
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    RTI                  ; 40 | Return from interrupt
    TSX                  ; BA | Transfer stack pointer to X register
    LSR $DC3F,X          ; 5E 3F DC | Logical shift right (absolute,X)
    LDY $B87F,X          ; BC 7F B8 | Load from absolute,X into Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    ASL $67CF,X          ; 1E CF 67 | Arithmetic shift left (absolute,X)
    CPX #$E6             ; E0 E6 | Compare X register (immediate)
    CPX #$E6             ; E0 E6 | Compare X register (immediate)
    CPX #$CC             ; E0 CC | Compare X register (immediate)
    CPY #$CC             ; C0 CC | Compare Y register (immediate)
    CPY #$FC             ; C0 FC | Compare Y register (immediate)
    BEQ $DC              ; F0 DC | Branch if equal
    CMP ($F0),Y          ; D1 F0 | Compare accumulator ((zero page),Y)
    BRA $FF              ; 80 FF | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    ASL $1BFF            ; 0E FF 1B | Arithmetic shift left (absolute)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    INX                  ; E8 | Increment X register
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    LDA                  ; BF 00 00 FF | Load from absolute long,X into accumulator
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    DEC $EF              ; C6 EF | Decrement (zero page)
    CMP #$1E             ; C9 1E | Compare accumulator (immediate)
    SBC $F91E,Y          ; F9 1E F9 | Subtract with carry (absolute,Y)
    ASL $1EF9,X          ; 1E F9 1E | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_05A
; Address: $EB9F78
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_05A:
    SBC $F91E,Y          ; F9 1E F9 | Subtract with carry (absolute,Y)
    ASL $1EF9,X          ; 1E F9 1E | Arithmetic shift left (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    CMP $FF6B,X          ; DD 6B FF | Compare accumulator (absolute,X)
    SBC $FF0B,X          ; FD 0B FF | Subtract with carry (absolute,X)
    SBC #$00             ; E9 00 | Subtract with carry (immediate)
    LDA $FDCE,X          ; BD CE FD | Load from absolute,X into accumulator
    ASL $0EFD            ; 0E FD 0E | Arithmetic shift left (absolute)
    SBC $FD0E,X          ; FD 0E FD | Subtract with carry (absolute,X)
    STX $6EDD            ; 8E DD 6E | Store X register to absolute address
    SBC $FD0E,X          ; FD 0E FD | Subtract with carry (absolute,X)
    INC $0F73,X          ; FE 73 0F | Increment (absolute,X)
    BCS $CC              ; B0 CC | Branch if carry set
    BCS $CC              ; B0 CC | Branch if carry set
    BCS $CC              ; B0 CC | Branch if carry set
    TSX                  ; BA | Transfer stack pointer to X register
    DEC $B8              ; C6 B8 | Decrement (zero page)
    DEC $B8              ; C6 B8 | Decrement (zero page)
    DEC $B9              ; C6 B9 | Decrement (zero page)
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    ROR $7C03,X          ; 7E 03 7C | Rotate right (absolute,X)
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    ROR $F000,X          ; 7E 00 F0 | Rotate right (absolute,X)
    BVS $0C              ; 70 0C | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    INC                  ; 1A | Increment accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CLD                  ; D8 | Clear decimal mode flag
    BVS $58              ; 70 58 | Branch if overflow set
    BVS $48              ; 70 48 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    BIT $18              ; 24 18 | Test bits in accumulator (zero page)
    BPL $1C              ; 10 1C | Branch if positive
    INC                  ; 1A | Increment accumulator
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    BRA $FF              ; 80 FF | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank56_DmaFunction_05B
; Address: $EBA023
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_05B:
    INX                  ; E8 | Increment X register
    CPX #$1C             ; E0 1C | Compare X register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$18             ; E0 18 | Compare X register (immediate)
    CPX $05              ; E4 05 | Compare X register (zero page)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SBC $FF              ; E5 FF | Subtract with carry (zero page)
    SEP #$E6             ; E2 E6 | Set processor status bits
    STA                  ; 9F 1D EE 08 | Store accumulator to absolute long,X
    BEQ $04              ; F0 04 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    CPY #$C4             ; C0 C4 | Compare Y register (immediate)
    INC $FF              ; E6 FF | Increment (zero page)
    SED                  ; F8 | Set decimal mode flag
    LDA                  ; BF FF FF FF | Load from absolute long,X into accumulator
    ROR $A57E,X          ; 7E 7E A5 | Rotate right (absolute,X)
    BMI $0F              ; 30 0F | Branch if negative
    RTI                  ; 40 | Return from interrupt
    AND ($1C,X)          ; 21 1C | Logical AND with accumulator ((zero page,X))
    SBC $7E00,X          ; FD 00 7E | Subtract with carry (absolute,X)
    AND $FDFF,X          ; 3D FF FD | Logical AND with accumulator (absolute,X)
    BNE $05              ; D0 05 | Branch if not equal
    CPY $F8D5            ; CC D5 F8 | Compare Y register (absolute)
    AND $47BF,Y          ; 39 BF 47 | Logical AND with accumulator (absolute,Y)
    SEC                  ; 38 | Set carry flag
    ROR $4F00,X          ; 7E 00 4F | Rotate right (absolute,X)
    BMI $70              ; 30 70 | Branch if negative
    CMP $F9FF,X          ; DD FF F9 | Compare accumulator (absolute,X)
    ROR $7FFF,X          ; 7E FF 7F | Rotate right (absolute,X)
    AND #$93             ; 29 93 | Logical AND with accumulator (immediate)
    ASL $F81C,X          ; 1E 1C F8 | Arithmetic shift left (absolute,X)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    ADC $DBFF,X          ; 7D FF DB | Add with carry (absolute,X)
    INC $F8FF,X          ; FE FF F8 | Increment (absolute,X)
    SBC ($7C,X)          ; E1 7C | Subtract with carry ((zero page,X))
    ADC $C3A5,X          ; 7D A5 C3 | Add with carry (absolute,X)
    AND ($1E,X)          ; 21 1E | Logical AND with accumulator ((zero page,X))
    ADC $FFFF,X          ; 7D FF FF | Add with carry (absolute,X)
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    CLV                  ; B8 | Clear overflow flag
    STY $03              ; 84 03 | Store Y register to zero page
    CPY #$03             ; C0 03 | Compare Y register (immediate)
    ORA ($E0),Y          ; 11 E0 | Game work RAM access
    INC $BF11            ; EE 11 BF | Increment (absolute)
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    STA                  ; 9F FF FF 08 | Store accumulator to absolute long,X
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank56_DmaFunction_05C
; Address: $EBA127
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_05C:
    STZ $FF00            ; 9C 00 FF | Store zero to absolute
    BEQ $0F              ; F0 0F | Branch if equal
    STZ $FFFF            ; 9C FF FF | Store zero to absolute
    AND $FF              ; 25 FF | Logical AND with accumulator (zero page)
    ASL $008E            ; 0E 8E 00 | Arithmetic shift left (absolute)
    AND ($04,X)          ; 21 04 | Logical AND with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    STX $21FF            ; 8E FF 21 | PPU graphics register access
    INY                  ; C8 | Increment Y register
    PHB                  ; 8B | Push data bank register to stack
    BNE $98              ; D0 98 | Branch if not equal
    ASL $78              ; 06 78 | Arithmetic shift left (zero page)
    ORA ($CE,X)          ; 01 CE | Logical OR with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    STA                  ; 9F 60 DF FF | Store accumulator to absolute long,X
    STA                  ; 9F FF 7F FE | Store accumulator to absolute long,X
    LDA                  ; BF FF FF FF | Load from absolute long,X into accumulator
    INC $E200,X          ; FE 00 E2 | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    INC $E303,X          ; FE 03 E3 | Increment (absolute,X)
    SBC $FEF6,Y          ; F9 F6 FE | Subtract with carry (absolute,Y)
    SBC $E003,Y          ; F9 03 E0 | Game work RAM access
    DEX                  ; CA | Decrement X register
    ASL $0C0E            ; 0E 0E 0C | Arithmetic shift left (absolute)
    SBC $DB1B,X          ; FD 1B DB | Subtract with carry (absolute,X)
    EOR ($5D,X)          ; 41 5D | Exclusive OR with accumulator ((zero page,X))
    STA ($B9,X)          ; 81 B9 | Store accumulator to (zero page,X)
    SBC $F4FB,X          ; FD FB F4 | Subtract with carry (absolute,X)
    ASL $FDF1            ; 0E F1 FD | Arithmetic shift left (absolute)
    BIT $5D              ; 24 5D | Test bits in accumulator (zero page)
    LDX #$B9             ; A2 B9 | Load immediate value into X register
    LSR $3F              ; 46 3F | Logical shift right (zero page)
    BMI $FF              ; 30 FF | Branch if negative
    BRA $FF              ; 80 FF | Branch always
    BPL $DF              ; 10 DF | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PLA                  ; 68 | Pull accumulator from stack
    BEQ $FB              ; F0 FB | Branch if equal
    JMP $AC06            ; 4C 06 AC | Jump to address
    ROL $B4              ; 26 B4 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_05D
; Address: $EBA1E5
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_05D:
    JSL $DC12BC          ; 22 BC 12 DC | Jump to subroutine long
    INC                  ; 1A | Increment accumulator
    ASL $0EE8,X          ; 1E E8 0E | Arithmetic shift left (absolute,X)
    SBC #$0E             ; E9 0E | Subtract with carry (immediate)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_05E
; Address: $EBA1F8
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_05E:
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    ASL $0606            ; 0E 06 06 | Arithmetic shift left (absolute)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    INX                  ; E8 | Increment X register
    CPX $FF              ; E4 FF | Compare X register (zero page)
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEP #$C7             ; E2 C7 | Set processor status bits
    SBC $FDCB,X          ; FD CB FD | Subtract with carry (absolute,X)
    AND $FFE3,X          ; 3D E3 FF | Logical AND with accumulator (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    ORA #$E2             ; 09 E2 | Logical OR with accumulator (immediate)
    CPY $06              ; C4 06 | Compare Y register (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDX #$84             ; A2 84 | Load immediate value into X register
    REP #$84             ; C2 84 | Reset processor status bits
    SEP #$04             ; E2 04 | Set processor status bits
    SED                  ; F8 | Set decimal mode flag
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BRA $7F              ; 80 7F | Branch always
    BIT #$76             ; 89 76 | Test bits in accumulator (immediate)
    SBC $F906,Y          ; F9 06 F9 | Subtract with carry (absolute,Y)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    ASL $0E07            ; 0E 07 0E | Arithmetic shift left (absolute)
    ASL $21              ; 06 21 | PPU graphics register access
    ASL $BF              ; 06 BF | Arithmetic shift left (zero page)
    LDA                  ; BF BF 3F 7F | Load from absolute long,X into accumulator
    BRA $BF              ; 80 BF | Branch always
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 40 9F 60 | Load from absolute long,X into accumulator
    BMI $4F              ; 30 4F | Branch if negative
    BCS $00              ; B0 00 | Branch if carry set
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    STA ($7F),Y          ; 91 7F | Store accumulator to (zero page),Y
    SBC $F97F,Y          ; F9 7F F9 | Subtract with carry (absolute,Y)
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_05F
; Address: $EBA2EF
; Size: 112 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_05F:
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CLV                  ; B8 | Clear overflow flag
    LDY $FFFF,X          ; BC FF FF | Load from absolute,X into Y register
    ROL $F7D0            ; 2E D0 F7 | Rotate left (absolute)
    PHP                  ; 08 | Push processor status to stack
    CLV                  ; B8 | Clear overflow flag
    LDA                  ; BF FF BF FF | Load from absolute long,X into accumulator
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    BNE $00              ; D0 00 | Branch if not equal
    BEQ $F8              ; F0 F8 | Branch if equal
    INC $0700,X          ; FE 00 07 | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    BNE $FF              ; D0 FF | Branch if not equal
    SED                  ; F8 | Set decimal mode flag
    INC $00F8,X          ; FE F8 00 | Increment (absolute,X)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    BEQ $0F              ; F0 0F | Branch if equal
    BCS $1B              ; B0 1B | Branch if carry set
    ROR $00FF,X          ; 7E FF 00 | Rotate right (absolute,X)
    TYA                  ; 98 | Transfer Y register to accumulator
    LDA                  ; BF FF FF FF | Load from absolute long,X into accumulator
    BEQ $70              ; F0 70 | Branch if equal
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$0F             ; C0 0F | Compare Y register (immediate)
    STY $B0AC            ; 8C AC B0 | Store Y register to absolute address
    INX                  ; E8 | Increment X register
    CPX $D918            ; EC 18 D9 | Compare X register (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $1B              ; F0 1B | Branch if equal
    BIT $2C              ; 24 2C | Test bits in accumulator (zero page)
    EOR $134C            ; 4D 4C 13 | Exclusive OR with accumulator (absolute)
    ORA $1326,Y          ; 19 26 13 | Logical OR with accumulator (absolute,Y)
    BIT $81              ; 24 81 | Test bits in accumulator (zero page)
    LDA ($02),Y          ; B1 02 | Load from (zero page),Y into accumulator
    DEC $9BEE            ; CE EE 9B | Decrement (absolute)
    PEA #$FE1E           ; F4 1E FE | Push effective address to stack
    ROL $E6              ; 26 E6 | Rotate left (zero page)
    LDA ($4E),Y          ; B1 4E | Load from (zero page),Y into accumulator
    CMP $11EE            ; CD EE 11 | Compare accumulator (absolute)
    STZ $3C              ; 64 3C | Store zero to zero page
    PEA #$FE0B           ; F4 0B FE | Push effective address to stack
    ORA ($E6,X)          ; 01 E6 | Logical OR with accumulator ((zero page,X))
    ORA $3C3F,Y          ; 19 3F 3C | Logical OR with accumulator (absolute,Y)
    JMP ($2F6F)          ; 6C 6F 2F | Jump to address (absolute indirect)
    ROL $BE23            ; 2E 23 BE | Rotate left (absolute)
    PLX                  ; FA | Pull X register from stack
    XBA                  ; EB | Exchange accumulator bytes

;------------------------------------------------------------------------------
; Bank56_DmaFunction_060
; Address: $EBA3D5
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_060:
    BEQ $C8              ; F0 C8 | Branch if equal
    BMI $6C              ; 30 6C | Branch if negative
    BCC $2E              ; 90 2E | Branch if carry clear
    BNE $A2              ; D0 A2 | Branch if not equal
    RTI                  ; 40 | Return from interrupt
    BEQ $00              ; F0 00 | Branch if equal
    PLX                  ; FA | Pull X register from stack
    SBC $F938,Y          ; F9 38 F9 | Subtract with carry (absolute,Y)
    CMP $FC              ; C5 FC | Compare accumulator (zero page)
    SEP #$3E             ; E2 3E | Set processor status bits
    SBC ($1F,X)          ; E1 1F | Subtract with carry ((zero page,X))
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    CPY #$07             ; C0 07 | Compare Y register (immediate)
    PLX                  ; FA | Pull X register from stack
    SBC $7E01,X          ; FD 01 7E | Subtract with carry (absolute,X)
    BPL $00              ; 10 00 | Branch if positive
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BMI $F0              ; 30 F0 | Branch if negative

;------------------------------------------------------------------------------
; Bank56_DmaFunction_061
; Address: $EBA40A
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_061:
    JSR $0A10            ; 20 10 0A | Jump to subroutine
    STA ($40,X)          ; 81 40 | Store accumulator to (zero page,X)
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    CPY $FF              ; C4 FF | Compare Y register (zero page)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$DF             ; E0 DF | Compare X register (immediate)
    CPX #$DF             ; E0 DF | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    CPX #$04             ; E0 04 | Compare X register (immediate)
    BNE $00              ; D0 00 | Branch if not equal
    LDY #$18             ; A0 18 | Load immediate value into Y register
    LDY #$1C             ; A0 1C | Load immediate value into Y register
    LDY #$1F             ; A0 1F | Load immediate value into Y register
    SBC $CA06,Y          ; F9 06 CA | Subtract with carry (absolute,Y)
    DEX                  ; CA | Decrement X register
    STX $79              ; 86 79 | Store X register to zero page
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    ORA ($02),Y          ; 11 02 | Logical OR with accumulator ((zero page),Y)
    BVC $03              ; 50 03 | Branch if overflow clear
    BVC $01              ; 50 01 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank56_DmaFunction_062
; Address: $EBA486
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_062:
    SEC                  ; 38 | Set carry flag
    EOR ($28,X)          ; 41 28 | Exclusive OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_063
; Address: $EBA48C
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_063:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PEA #$F00F           ; F4 0F F0 | Push effective address to stack
    SBC $FF47,X          ; FD 47 FF | Subtract with carry (absolute,X)
    CMP ($3F,X)          ; C1 3F | Compare accumulator ((zero page,X))
    CMP ($3F,X)          ; C1 3F | Compare accumulator ((zero page,X))
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    BVS $FF              ; 70 FF | Branch if overflow set
    STA ($FE),Y          ; 91 FE | Store accumulator to (zero page),Y
    LDA ($FF),Y          ; B1 FF | Load from (zero page),Y into accumulator
    INC $DEBB,X          ; FE BB DE | Increment (absolute,X)
    DEC $EEBB            ; CE BB EE | Decrement (absolute)
    LDA                  ; BF EE BF FC | Load from absolute long,X into accumulator
    SED                  ; F8 | Set decimal mode flag
    SBC $FD03,Y          ; F9 03 FD | Subtract with carry (absolute,Y)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SBC $FA03,X          ; FD 03 FA | Subtract with carry (absolute,X)
    INC $2300,X          ; FE 00 23 | Increment (absolute,X)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ROR $FE8D            ; 6E 8D FE | Rotate right (absolute)
    STA $63FF81          ; 8F 81 FF 63 | Store accumulator to absolute long address
    LDA #$1C             ; A9 1C | Load immediate value into accumulator
    ROR $0091            ; 6E 91 00 | Rotate right (absolute)
    ROR $00FF,X          ; 7E FF 00 | Rotate right (absolute,X)
    LDA $93FE,Y          ; B9 FE 93 | Load from absolute,Y into accumulator
    CMP ($BE,X)          ; C1 BE | Compare accumulator ((zero page,X))
    LDY #$DF             ; A0 DF | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_064
; Address: $EBA52C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_064:
    RTI                  ; 40 | Return from interrupt
    BRA $7F              ; 80 7F | Branch always
    BVS $80              ; 70 80 | Branch if overflow set
    CLV                  ; B8 | Clear overflow flag
    BCC $00              ; 90 00 | Branch if carry clear
    CPY #$40             ; C0 40 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_065
; Address: $EBA538
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_065:
    JSR $20E0            ; 20 E0 20 | Jump to subroutine
    BRA $C0              ; 80 C0 | Branch always
    BRA $00              ; 80 00 | Branch always
    BEQ $1F              ; F0 1F | Branch if equal
    BEQ $0F              ; F0 0F | Branch if equal
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank56_DmaFunction_066
; Address: $EBA546
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_066:
    SBC $FF06,Y          ; F9 06 FF | Subtract with carry (absolute,Y)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    INC $3F83,X          ; FE 83 3F | Increment (absolute,X)
    ROR $2C01            ; 6E 01 2C | Rotate right (absolute)
    BIT $A803            ; 2C 03 A8 | Test bits in accumulator (absolute)
    TAY                  ; A8 | Transfer accumulator to Y register
    CPY #$70             ; C0 70 | Compare Y register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    JMP $EC38            ; 4C 38 EC | Jump to address
    CPY $00              ; C4 00 | Compare Y register (zero page)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $1C              ; 80 1C | Branch always
    BRA $0F              ; 80 0F | Branch always

;------------------------------------------------------------------------------
; Bank56_DmaFunction_067
; Address: $EBA57E
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_067:
    JSR $FFFF            ; 20 FF FF | Jump to subroutine
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$BF             ; C0 BF | Compare Y register (immediate)
    INY                  ; C8 | Increment Y register
    LDA                  ; BF DA FF DA | Load from absolute long,X into accumulator
    SBC $FF6F,Y          ; F9 6F FF | Subtract with carry (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    INC $FEC1,X          ; FE C1 FE | Increment (absolute,X)
    SBC ($FE,X)          ; E1 FE | Subtract with carry ((zero page,X))
    SBC ($FE,X)          ; E1 FE | Subtract with carry ((zero page,X))
    SBC $7F              ; E5 7F | Subtract with carry (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPX #$30             ; E0 30 | Compare X register (immediate)
    BRA $7F              ; 80 7F | Branch always
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    CLD                  ; D8 | Clear decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $3F              ; F0 3F | Branch if equal
    CPY #$3D             ; C0 3D | Compare Y register (immediate)
    REP #$7B             ; C2 7B | Reset processor status bits
    STY $EF              ; 84 EF | Store Y register to zero page
    BPL $FF              ; 10 FF | Branch if positive
    ADC ($0F),Y          ; 71 0F | Add with carry ((zero page),Y)
    ADC ($0F),Y          ; 71 0F | Add with carry ((zero page),Y)
    ADC ($0F),Y          ; 71 0F | Add with carry ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    PLX                  ; FA | Pull X register from stack
    ORA $0DFF            ; 0D FF 0D | Logical OR with accumulator (absolute)
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_068
; Address: $EBA641
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_068:
    BRA $FF              ; 80 FF | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    PEA #$C1FF           ; F4 FF C1 | Push effective address to stack
    INX                  ; E8 | Increment X register
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    STA                  ; 9F 01 00 00 | Store accumulator to absolute long,X
    LDA                  ; BF 00 FF 00 | Load from absolute long,X into accumulator
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    AND $40              ; 25 40 | Logical AND with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $FF              ; 80 FF | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    TXA                  ; 8A | Transfer X register to accumulator
    INC $FD8B,X          ; FE 8B FD | Increment (absolute,X)
    LDA ($FE,X)          ; A1 FE | Load from (zero page,X) into accumulator
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    INX                  ; E8 | Increment X register
    PLX                  ; FA | Pull X register from stack
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ADC $BEFE,X          ; 7D FE BE | Add with carry (absolute,X)
    CMP ($F2,X)          ; C1 F2 | Compare accumulator ((zero page,X))
    ORA $177B            ; 0D 7B 17 | Logical OR with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    ORA ($F9,X)          ; 01 F9 | Logical OR with accumulator ((zero page,X))
    ASL $7B              ; 06 7B | Arithmetic shift left (zero page)
    STX $D3              ; 86 D3 | Store X register to zero page
    ROL $8B              ; 26 8B | Rotate left (zero page)
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    BRA $88              ; 80 88 | Branch always
    STY $8C88            ; 8C 88 8C | Store Y register to absolute address
    CPY #$2E             ; C0 2E | Compare Y register (immediate)
    CPX #$10             ; E0 10 | Compare X register (immediate)
    BEQ $E2              ; F0 E2 | Branch if equal
    STZ $C779,X          ; 9E 79 C7 | Store zero to absolute,X

;------------------------------------------------------------------------------
; Bank56_DmaFunction_069
; Address: $EBA70B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_069:
    LDA $A68F5E          ; AF 5E 8F A6 | Load from absolute long address into accumulator
    ROL $003F,X          ; 3E 3F 00 | Rotate left (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank56_DmaFunction_06A
; Address: $EBA71C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_06A:
    JSR $411F            ; 20 1F 41 | Jump to subroutine
    BRA $7F              ; 80 7F | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank56_DmaFunction_06B
; Address: $EBA724
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_06B:
    JSR $101F            ; 20 1F 10 | Jump to subroutine
    BPL $2F              ; 10 2F | Branch if positive
    BPL $CF              ; 10 CF | Branch if positive
    BPL $2F              ; 10 2F | Branch if positive
    BPL $EF              ; 10 EF | Branch if positive
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BNE $30              ; D0 30 | Branch if not equal
    BMI $C0              ; 30 C0 | Branch if negative
    BNE $30              ; D0 30 | Branch if not equal
    BPL $F0              ; 10 F0 | Branch if positive
    INC $FD87,X          ; FE 87 FD | Increment (absolute,X)
    DEC $FF              ; C6 FF | Decrement (zero page)
    CPY $C8FE            ; CC FE C8 | Compare Y register (absolute)
    CPY #$FD             ; C0 FD | Compare Y register (immediate)
    CMP ($D9,X)          ; C1 D9 | Compare accumulator ((zero page,X))
    CMP ($90,X)          ; C1 90 | Compare accumulator ((zero page,X))
    BNE $0F              ; D0 0F | Branch if not equal
    BNE $0F              ; D0 0F | Branch if not equal
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    STZ $3800            ; 9C 00 38 | Store zero to absolute
    PHP                  ; 08 | Push processor status to stack
    SEI                  ; 78 | Set interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    SEI                  ; 78 | Set interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    SBC ($30),Y          ; F1 30 | Subtract with carry ((zero page),Y)
    SBC ($70),Y          ; F1 70 | Subtract with carry ((zero page),Y)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    REP #$3D             ; C2 3D | Reset processor status bits
    SEC                  ; 38 | Set carry flag
    CLV                  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank56_DmaFunction_06C
; Address: $EBA796
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_06C:
    CLV                  ; B8 | Clear overflow flag
    LDA                  ; BF FF 00 FF | Load from absolute long,X into accumulator
    ADC $C442,X          ; 7D 42 C4 | Add with carry (absolute,X)
    LDA                  ; BF FF FF FF | Load from absolute long,X into accumulator
    DEC $FF              ; C6 FF | Decrement (zero page)
    INC $DE07,X          ; FE 07 DE | Increment (absolute,X)
    INC $F8FF,X          ; FE FF F8 | Increment (absolute,X)
    BEQ $FF              ; F0 FF | Branch if equal
    BRA $70              ; 80 70 | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    STZ $9463            ; 9C 63 94 | Store zero to absolute
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank56_DmaFunction_06D
; Address: $EBA84C
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_06D:
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    ORA $0DF2            ; 0D F2 0D | Logical OR with accumulator (absolute)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    INC $3103,X          ; FE 03 31 | Increment (absolute,X)
    CMP ($E0,X)          ; C1 E0 | Game work RAM access
    INY                  ; C8 | Increment Y register
    LSR $C4C4            ; 4E C4 C4 | Logical shift right (absolute)
    CPX #$E0             ; E0 E0 | Game work RAM access
    SBC $CFB2            ; ED B2 CF | Subtract with carry (absolute)
    BVS $3F              ; 70 3F | Branch if overflow set
    CPY $1E              ; C4 1E | Compare Y register (zero page)
    SBC $C0BF,Y          ; F9 BF C0 | Subtract with carry (absolute,Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_06E
; Address: $EBA8CD
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_06E:
    ADC $FFBC,Y          ; 79 BC FF | Add with carry (absolute,Y)
    ASL $F5              ; 06 F5 | Arithmetic shift left (zero page)
    SBC $01FA,Y          ; F9 FA 01 | Subtract with carry (absolute,Y)
    SBC $3C0A,X          ; FD 0A 3C | Subtract with carry (absolute,X)
    ORA $18EA,X          ; 1D EA 18 | Logical OR with accumulator (absolute,X)
    STA $F874,Y          ; 99 74 F8 | Store accumulator to absolute,Y
    BEQ $FC              ; F0 FC | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    SBC ($E0,X)          ; E1 E0 | Game work RAM access
    CPX #$98             ; E0 98 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    STA                  ; 9F 99 58 23 | Store accumulator to absolute long,X
    LDY #$C7             ; A0 C7 | Load immediate value into Y register
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_06F
; Address: $EBA910
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_06F:
    JSR $201F            ; 20 1F 20 | Jump to subroutine
    BPL $CF              ; 10 CF | Branch if positive
    LDY #$1F             ; A0 1F | Load immediate value into Y register
    LDA                  ; BF 00 A1 1E | Load from absolute long,X into accumulator
    BIT $6D92            ; 2C 92 6D | Test bits in accumulator (absolute)
    CMP $D100,Y          ; D9 00 D1 | Compare accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_070
; Address: $EBA944
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_070:
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    LDA ($00,X)          ; A1 00 | Load from (zero page,X) into accumulator
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    BRA $00              ; 80 00 | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    REP #$FF             ; C2 FF | Reset processor status bits
    INC $FF              ; E6 FF | Increment (zero page)
    STX $CEFF            ; 8E FF CE | Store X register to absolute address
    SBC ($40,X)          ; E1 40 | Subtract with carry ((zero page,X))
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    ASL $1EFF,X          ; 1E FF 1E | Arithmetic shift left (absolute,X)
    INC $FAD8,X          ; FE D8 FA | Increment (absolute,X)
    BPL $32              ; 10 32 | Branch if positive
    ROL                  ; 2A | Rotate left (accumulator)
    LDX $7502            ; AE 02 75 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank56_DmaFunction_071
; Address: $EBA98C
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_071:
    JSL $DF239D          ; 22 9D 23 DF | Jump to subroutine long
    INC $FAFF,X          ; FE FF FA | Increment (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    LDX $77FF            ; AE FF 77 | Load from absolute address into X register
    LDA                  ; BF FF FF FF | Load from absolute long,X into accumulator
    BIT #$02             ; 89 02 | Test bits in accumulator (immediate)
    LDA $02              ; A5 02 | Load from zero page into accumulator
    STA $2F83            ; 8D 83 2F | Store accumulator to absolute address
    STX $B92E            ; 8E 2E B9 | Store X register to absolute address
    AND $D0D0,Y          ; 39 D0 D0 | Logical AND with accumulator (absolute,Y)
    PHB                  ; 8B | Push data bank register to stack
    STA $FFAFFF          ; 8F FF AF FF | Store accumulator to absolute long address
    LDA $FFBFFF          ; AF FF BF FF | Load from absolute long address into accumulator
    LDA                  ; BF 7F F9 F9 | Load from absolute long,X into accumulator
    CPY $C4              ; C4 C4 | Compare Y register (zero page)
    CPX $DFE3            ; EC E3 DF | Compare X register (absolute)
    CPX #$DF             ; E0 DF | Compare X register (immediate)
    CPX #$DF             ; E0 DF | Compare X register (immediate)
    BPL $0F              ; 10 0F | Branch if positive
    ASL $BF7E,X          ; 1E 7E BF | Arithmetic shift left (absolute,X)
    LDA                  ; BF 00 F0 FF | Load from absolute long,X into accumulator
    INX                  ; E8 | Increment X register
    CPX $ECFF            ; EC FF EC | Compare X register (absolute)
    STA                  ; 9F 81 00 FF | Store accumulator to absolute long,X
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    BEQ $0C              ; F0 0C | Branch if equal
    ASL $00F1            ; 0E F1 00 | Arithmetic shift left (absolute)
    SBC $0F00,Y          ; F9 00 0F | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_072
; Address: $EBAA19
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_072:
    SED                  ; F8 | Set decimal mode flag
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    STA $F2317F          ; 8F 7F 31 F2 | Store accumulator to absolute long address
    BIT $303F            ; 2C 3F 30 | Test bits in accumulator (absolute)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BEQ $F0              ; F0 F0 | Branch if equal
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    INC $F8FF,X          ; FE FF F8 | Increment (absolute,X)
    INC $8702,X          ; FE 02 87 | Increment (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $0F              ; F0 0F | Branch if equal
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    AND ($3F),Y          ; 31 3F | Logical AND with accumulator ((zero page),Y)
    INC $FEB7,X          ; FE B7 FE | Increment (absolute,X)
    WDM #$FF             ; 42 FF | Reserved instruction
    STA $E3FF,Y          ; 99 FF E3 | Store accumulator to absolute,Y
    BCS $70              ; B0 70 | Branch if carry set
    BIT #$FF             ; 89 FF | Test bits in accumulator (immediate)
    STA                  ; 9F FF 83 FF | Store accumulator to absolute long,X
    ADC ($F1),Y          ; 71 F1 | Add with carry ((zero page),Y)
    STA $9F607F          ; 8F 7F 60 9F | Store accumulator to absolute long address
    CPY #$B8             ; C0 B8 | Compare Y register (immediate)
    BIT $FC              ; 24 FC | Test bits in accumulator (zero page)
    STA $FFFFFF          ; 8F FF FF FF | Store accumulator to absolute long address
    TYA                  ; 98 | Transfer Y register to accumulator
    STA                  ; 9F E0 FF 01 | Store accumulator to absolute long,X
    INC $01FD,X          ; FE FD 01 | Increment (absolute,X)
    CLC                  ; 18 | Clear carry flag
    INC $BFA3,X          ; FE A3 BF | Increment (absolute,X)
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    INC $E3FC,X          ; FE FC E3 | Increment (absolute,X)
    INC $FFE7,X          ; FE E7 FF | Increment (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank56_DmaFunction_073
; Address: $EBAAE4
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_073:
    ROR $398F            ; 6E 8F 39 | Rotate right (absolute)
    LSR $DB01            ; 4E 01 DB | Logical shift right (absolute)
    INC $D3FE,X          ; FE FE D3 | Increment (absolute,X)
    SEP #$EF             ; E2 EF | Set processor status bits
    LDY $FD00,X          ; BC 00 FD | Load from absolute,X into Y register
    BRA $80              ; 80 80 | Branch always
    SBC $4FF9,Y          ; F9 F9 4F | Subtract with carry (absolute,Y)
    DEC $FFCE            ; CE CE FF | Decrement (absolute)
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    INC $F101,X          ; FE 01 F1 | Increment (absolute,X)
    ASL $FF0F            ; 0E 0F FF | Arithmetic shift left (absolute)
    ROR $FF7E,X          ; 7E 7E FF | Rotate right (absolute,X)
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    BRA $FF              ; 80 FF | Branch always
    BRA $DF              ; 80 DF | Branch always
    CPX #$F7             ; E0 F7 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_074
; Address: $EBAB49
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_074:
    SED                  ; F8 | Set decimal mode flag
    SBC $1BFE,X          ; FD FE 1B | Subtract with carry (absolute,X)
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BEQ $FF              ; F0 FF | Branch if equal
    BRA $DF              ; 80 DF | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $FF              ; 80 FF | Branch always
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    LDY $F84C,X          ; BC 4C F8 | Load from absolute,X into Y register
    SEC                  ; 38 | Set carry flag
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    LDA                  ; BF FF BF FF | Load from absolute long,X into accumulator
    LDA                  ; BF FF 3F FF | Load from absolute long,X into accumulator
    DEC $00CE            ; CE CE 00 | Decrement (absolute)
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    STY $008C            ; 8C 8C 00 | Store Y register to absolute address
    SBC $F786,Y          ; F9 86 F7 | Subtract with carry (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CPX #$E0             ; E0 E0 | Game work RAM access
    INC $FFFE,X          ; FE FE FF | Increment (absolute,X)
    CLD                  ; D8 | Clear decimal mode flag
    ASL $7FF1            ; 0E F1 7F | Arithmetic shift left (absolute)
    BRA $3F              ; 80 3F | Branch always
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    CPX #$0E             ; E0 0E | Compare X register (immediate)
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($F7,X)          ; 01 F7 | Logical OR with accumulator ((zero page,X))
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    JMP $80CC            ; 4C CC 80 | Jump to address
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PHY                  ; 5A | Push Y register to stack
    PHY                  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank56_DmaFunction_075
; Address: $EBACC2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_075:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    EOR ($41,X)          ; 41 41 | Exclusive OR with accumulator ((zero page,X))
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    BCS $B0              ; B0 B0 | Branch if carry set

;------------------------------------------------------------------------------
; Bank56_DmaFunction_076
; Address: $EBAD21
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_076:
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $F9              ; F0 F9 | Branch if equal
    ASL $F8              ; 06 F8 | Arithmetic shift left (zero page)
    SBC $FF02,X          ; FD 02 FF | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_078
; Address: $EBAD77
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_078:
    JSR $E0FF            ; 20 FF E0 | Game work RAM access
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BEQ $FF              ; F0 FF | Branch if equal
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SBC $FE06,Y          ; F9 06 FE | Subtract with carry (absolute,Y)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SBC $B207,Y          ; F9 07 B2 | Subtract with carry (absolute,Y)
    EOR $0CF3            ; 4D F3 0C | Exclusive OR with accumulator (absolute)
    SBC $FE06,Y          ; F9 06 FE | Subtract with carry (absolute,Y)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BRA $7A              ; 80 7A | Branch always
    CPX $BF13            ; EC 13 BF | Compare X register (absolute)
    RTI                  ; 40 | Return from interrupt
    BEQ $FF              ; F0 FF | Branch if equal
    BRA $FF              ; 80 FF | Branch always
    CMP $F227,Y          ; D9 27 F2 | Compare accumulator (absolute,Y)
    ORA $9669            ; 0D 69 96 | Logical OR with accumulator (absolute)
    INC $F701,X          ; FE 01 F7 | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    STA                  ; 9F FF 0F FF | Store accumulator to absolute long,X
    ORA ($9B,X)          ; 01 9B | Logical OR with accumulator ((zero page,X))
    CPX $4F              ; E4 4F | Compare X register (zero page)
    BCS $96              ; B0 96 | Branch if carry set
    ADC #$7F             ; 69 7F | Add with carry (immediate)
    BRA $EF              ; 80 EF | Branch always
    BPL $7F              ; 10 7F | Branch if positive
    BRA $FF              ; 80 FF | Branch always
    SBC $F0FF,Y          ; F9 FF F0 | Subtract with carry (absolute,Y)
    BEQ $FF              ; F0 FF | Branch if equal
    BRA $FE              ; 80 FE | Branch always
    ORA ($5E,X)          ; 01 5E | Logical OR with accumulator ((zero page,X))
    SBC ($37,X)          ; E1 37 | Subtract with carry ((zero page,X))
    INY                  ; C8 | Increment Y register
    SBC $FF02,X          ; FD 02 FF | Subtract with carry (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    STA                  ; 9F E0 4D B2 | Store accumulator to absolute long,X
    BMI $9F              ; 30 9F | Branch if negative

;------------------------------------------------------------------------------
; Bank56_DmaFunction_07A
; Address: $EBAE89
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_07A:
    BRA $FF              ; 80 FF | Branch always
    SED                  ; F8 | Set decimal mode flag
    BEQ $FF              ; F0 FF | Branch if equal
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPX #$9F             ; E0 9F | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_07B
; Address: $EBAEA5
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_07B:
    BRA $FF              ; 80 FF | Branch always
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    SBC $FF02,X          ; FD 02 FF | Subtract with carry (absolute,X)
    STA                  ; 9F FF 03 FF | Store accumulator to absolute long,X
    STA                  ; 9F 60 1F E0 | Store accumulator to absolute long,X
    LDA                  ; BF 40 FF 00 | Load from absolute long,X into accumulator
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$EF             ; C0 EF | Compare Y register (immediate)
    BPL $FF              ; 10 FF | Branch if positive
    ORA ($CF,X)          ; 01 CF | Logical OR with accumulator ((zero page,X))
    LDA $0F0000          ; AF 00 00 0F | Load from absolute long address into accumulator
    BVS $00              ; 70 00 | Branch if overflow set
    BPL $00              ; 10 00 | Branch if positive
    BMI $07              ; 30 07 | Branch if negative
    SEI                  ; 78 | Set interrupt disable flag
    BVS $00              ; 70 00 | Branch if overflow set
    BPL $00              ; 10 00 | Branch if positive
    ORA $E3FF            ; 0D FF E3 | Logical OR with accumulator (absolute)
    CPX #$CC             ; E0 CC | Compare X register (immediate)
    PEA #$00F0           ; F4 F0 00 | Push effective address to stack
    BEQ $00              ; F0 00 | Branch if equal
    ASL $0900            ; 0E 00 09 | Arithmetic shift left (absolute)
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    STA                  ; 9F 1F 9F 37 | Store accumulator to absolute long,X
    STA                  ; 9F DF 2F AF | Store accumulator to absolute long,X
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_07D
; Address: $EBAF75
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_07D:
    PLA                  ; 68 | Pull accumulator from stack
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    STA $601F70          ; 8F 70 1F 60 | Store accumulator to absolute long address
    BVC $EC              ; 50 EC | Branch if overflow clear
    CPX $F7F7            ; EC F7 F7 | Compare X register (absolute)
    PLX                  ; FA | Pull X register from stack
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank56_DmaFunction_07E
; Address: $EBAF89
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_07E:
    SBC $D5D1,Y          ; F9 D1 D5 | Subtract with carry (absolute,Y)
    CMP ($C0),Y          ; D1 C0 | Compare accumulator ((zero page),Y)
    REP #$ED             ; C2 ED | Reset processor status bits
    PHP                  ; 08 | Push processor status to stack
    PLX                  ; FA | Pull X register from stack
    SED                  ; F8 | Set decimal mode flag
    ASL $D0              ; 06 D0 | Arithmetic shift left (zero page)
    ROL $2ED0            ; 2E D0 2E | Rotate left (absolute)
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    ADC $6A73            ; 6D 73 6A | Add with carry (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_07F
; Address: $EBAFA5
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_07F:
    ROL $1C3A,X          ; 3E 3A 1C | Rotate left (absolute,X)
    BPL $0E              ; 10 0E | Branch if positive
    ORA ($0D),Y          ; 11 0D | Logical OR with accumulator ((zero page),Y)
    BMI $0D              ; 30 0D | Branch if negative
    ORA $0122,X          ; 1D 22 01 | Logical OR with accumulator (absolute,X)
    ASL $0E00            ; 0E 00 0E | Arithmetic shift left (absolute)
    BMI $50              ; 30 50 | Branch if negative
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BNE $08              ; D0 08 | Branch if not equal
    BCS $88              ; B0 88 | Branch if carry set
    EOR ($04),Y          ; 51 04 | Exclusive OR with accumulator ((zero page),Y)
    AND ($B6,X)          ; 21 B6 | Logical AND with accumulator ((zero page,X))
    BEQ $88              ; F0 88 | Branch if equal

;------------------------------------------------------------------------------
; Bank56_DmaFunction_080
; Address: $EBAFD2
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_080:
    JSR $0500            ; 20 00 05 | Jump to subroutine
    WDM #$10             ; 42 10 | Reserved instruction
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    TAY                  ; A8 | Transfer accumulator to Y register
    PHA                  ; 48 | Push accumulator to stack
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_081
; Address: $EBAFE9
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_081:
    SEI                  ; 78 | Set interrupt disable flag
    SEC                  ; 38 | Set carry flag
    PHA                  ; 48 | Push accumulator to stack
    JMP $8080            ; 4C 80 80 | Jump to address
    PHP                  ; 08 | Push processor status to stack
    CLV                  ; B8 | Clear overflow flag
    SED                  ; F8 | Set decimal mode flag
    STY $78              ; 84 78 | Store Y register to zero page
    STY $48              ; 84 48 | Store Y register to zero page
    BRA $00              ; 80 00 | Branch always
    AND #$05             ; 29 05 | Logical AND with accumulator (immediate)
    AND ($10,X)          ; 21 10 | Logical AND with accumulator ((zero page,X))
    ASL $0F17,X          ; 1E 17 0F | Arithmetic shift left (absolute,X)
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    ORA $0601            ; 0D 01 06 | Logical OR with accumulator (absolute)
    ASL $10              ; 06 10 | Arithmetic shift left (zero page)
    BPL $0E              ; 10 0E | Branch if positive

;------------------------------------------------------------------------------
; Bank56_DmaFunction_082
; Address: $EBB01A
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_082:
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($30,X)          ; 01 30 | Logical OR with accumulator ((zero page,X))
    CPY #$F8             ; C0 F8 | Compare Y register (immediate)
    CLI                  ; 58 | Clear interrupt disable flag
    CPX #$BC             ; E0 BC | Compare X register (immediate)
    BVS $58              ; 70 58 | Branch if overflow set
    CPX #$30             ; E0 30 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BMI $00              ; 30 00 | Branch if negative
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $3A              ; 80 3A | Branch always
    ORA $0F42,X          ; 1D 42 0F | Logical OR with accumulator (absolute,X)
    ROR                  ; 6A | Rotate right (accumulator)
    SEC                  ; 38 | Set carry flag
    JMP $23B8            ; 4C B8 23 | Jump to address
    LSR $13A0            ; 4E A0 13 | Logical shift right (absolute)
    LDX $5F              ; A6 5F | Load from zero page into X register
    ORA $60              ; 05 60 | Logical OR with accumulator (zero page)
    CPY $70              ; C4 70 | Compare Y register (zero page)
    SED                  ; F8 | Set decimal mode flag
    BNE $4E              ; D0 4E | Branch if not equal
    JMP $181F13          ; 5C 13 1F 18 | Jump to address long
    JMP $F040B8          ; 5C B8 40 F0 | Jump to address long
    LSR                  ; 4A | Logical shift right (accumulator)
    BVC $1C              ; 50 1C | Branch if overflow clear
    DEC $1E38            ; CE 38 1E | Decrement (absolute)
    REP #$7D             ; C2 7D | Reset processor status bits
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CMP $53              ; C5 53 | Compare accumulator (zero page)
    CPX $0000            ; EC 00 00 | Compare X register (absolute)
    JMP $A400            ; 4C 00 A4 | Jump to address
    AND ($0E,X)          ; 21 0E | Logical AND with accumulator ((zero page,X))
    ASL $7F07,X          ; 1E 07 7F | Arithmetic shift left (absolute,X)
    SEP #$22             ; E2 22 | Set processor status bits
    PHA                  ; 48 | Push accumulator to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_083
; Address: $EBB085
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_083:
    PLA                  ; 68 | Pull accumulator from stack
    EOR $6D67,Y          ; 59 67 6D | Exclusive OR with accumulator (absolute,Y)
    AND $0C              ; 25 0C | Logical AND with accumulator (zero page)
    ASL $3F00,X          ; 1E 00 3F | Arithmetic shift left (absolute,X)
    BMI $EB              ; 30 EB | Branch if negative
    STZ $7F63            ; 9C 63 7F | Store zero to absolute
    CPX $D24C            ; EC 4C D2 | Compare X register (absolute)
    ROL $FCDC,X          ; 3E DC FC | Rotate left (absolute,X)
    LDY $FCDC            ; AC DC FC | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank56_DmaFunction_084
; Address: $EBB0AB
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_084:
    SEI                  ; 78 | Set interrupt disable flag
    TYA                  ; 98 | Transfer Y register to accumulator
    CPX #$00             ; E0 00 | Compare X register (immediate)
    AND $F2CE,X          ; 3D CE F2 | Logical AND with accumulator (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_085
; Address: $EBB0C6
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_085:
    INC $FDFE,X          ; FE FE FD | Increment (absolute,X)
    SBC $FBFF,X          ; FD FF FB | Subtract with carry (absolute,X)
    INC $FC01,X          ; FE 01 FC | Increment (absolute,X)
    SBC $FA01,X          ; FD 01 FA | Subtract with carry (absolute,X)
    ASL $F0              ; 06 F0 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CMP #$C0             ; C9 C0 | Compare accumulator (immediate)
    INC $F83E,X          ; FE 3E F8 | Increment (absolute,X)
    CLD                  ; D8 | Clear decimal mode flag
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    STA                  ; 9F 00 F8 07 | Store accumulator to absolute long,X
    DEC $36              ; C6 36 | Decrement (zero page)
    ROL $B8BF            ; 2E BF B8 | Rotate left (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_086
; Address: $EBB0FD
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_086:
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BRA $1F              ; 80 1F | Branch always
    CPY $797F            ; CC 7F 79 | Compare Y register (absolute)
    SBC $FC01,Y          ; F9 01 FC | Subtract with carry (absolute,Y)
    CPX #$F3             ; E0 F3 | Compare X register (immediate)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    STA                  ; 9F CF 4F E7 | Store accumulator to absolute long,X
    CPY #$9F             ; C0 9F | Compare Y register (immediate)
    CPX #$CF             ; E0 CF | Compare X register (immediate)
    BEQ $C7              ; F0 C7 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    ASL $0E0E            ; 0E 0E 0E | Arithmetic shift left (absolute)
    INC                  ; 1A | Increment accumulator
    ORA #$1C             ; 09 1C | Logical OR with accumulator (immediate)
    ORA $0BFC            ; 0D FC 0B | Logical OR with accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    SBC $F90F,X          ; FD 0F F9 | Subtract with carry (absolute,X)
    BIT #$BC             ; 89 BC | Test bits in accumulator (immediate)
    STZ $CC83            ; 9C 83 CC | Store zero to absolute
    CPX #$79             ; E0 79 | Compare X register (immediate)
    SBC #$4F             ; E9 4F | Subtract with carry (immediate)
    SBC $7F22,Y          ; F9 22 7F | Subtract with carry (absolute,Y)
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    BRA $7F              ; 80 7F | Branch always
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF A0 9F 99 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank56_DmaFunction_087
; Address: $EBB17E
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_087:
    CMP $0E5D,X          ; DD 5D 0E | Compare accumulator (absolute,X)
    BEQ $03              ; F0 03 | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    BEQ $27              ; F0 27 | Branch if equal
    DEC $7CDF,X          ; DE DF 7C | Decrement (absolute,X)
    AND ($FF),Y          ; 31 FF | Logical AND with accumulator ((zero page),Y)
    ADC $B359,Y          ; 79 59 B3 | Add with carry (absolute,Y)
    DEC $F0CE            ; CE CE F0 | Decrement (absolute)
    BCC $70              ; 90 70 | Branch if carry clear
    BMI $78              ; 30 78 | Branch if negative
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    INX                  ; E8 | Increment X register
    CLV                  ; B8 | Clear overflow flag
    INX                  ; E8 | Increment X register
    STY $EC3C            ; 8C 3C EC | Store Y register to absolute address
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BNE $5F              ; D0 5F | Branch if not equal
    BNE $5F              ; D0 5F | Branch if not equal
    BCC $9F              ; 90 9F | Branch if carry clear
    BNE $DF              ; D0 DF | Branch if not equal
    BEQ $FF              ; F0 FF | Branch if equal
    BNE $DF              ; D0 DF | Branch if not equal
    BNE $DF              ; D0 DF | Branch if not equal
    SBC $FF03,X          ; FD 03 FF | Subtract with carry (absolute,X)
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ORA $FD              ; 05 FD | Logical OR with accumulator (zero page)
    ORA $FD              ; 05 FD | Logical OR with accumulator (zero page)
    INC $FE02,X          ; FE 02 FE | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF FF F3 FC | Load from absolute long,X into accumulator
    INC $FB58,X          ; FE 58 FB | Increment (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank56_DmaFunction_088
; Address: $EBB1EA
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_088:
    SBC $FFAD,X          ; FD AD FF | Subtract with carry (absolute,X)
    DEC $F0FB,X          ; DE FB F0 | Decrement (absolute,X)
    LSR $6F4E            ; 4E 4E 6F | Logical shift right (absolute)
    JMP ($AEAF)          ; 6C AF AE | Jump to address (absolute indirect)
    STZ $5F9A,X          ; 9E 9A 5F | Store zero to absolute,X
    EOR $E6E6,X          ; 5D E6 E6 | Exclusive OR with accumulator (absolute,X)
    PEA #$FF09           ; F4 09 FF | Push effective address to stack
    SBC $F6FF,X          ; FD FF F6 | Subtract with carry (absolute,X)
    SBC #$EF             ; E9 EF | Subtract with carry (immediate)
    LSR $C1F3            ; 4E F3 C1 | Logical shift right (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SBC $BCE5            ; ED E5 BC | Subtract with carry (absolute)
    BIT $7F              ; 24 7F | Test bits in accumulator (zero page)
    LDX $CDAE,Y          ; BE AE CD | Load from absolute,Y into X register
    CMP $4340            ; CD 40 43 | Compare accumulator (absolute)
    JMP $FFBCFF          ; 5C FF BC FF | Jump to address long

;------------------------------------------------------------------------------
; Bank56_DmaFunction_089
; Address: $EBB225
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_089:
    LDY $FCFF,X          ; BC FF FC | Load from absolute,X into Y register
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $B0              ; F0 B0 | Branch if equal
    LDA                  ; BF E0 FF 60 | Load from absolute long,X into accumulator
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $FF              ; 80 FF | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank56_DmaFunction_08A
; Address: $EBB278
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_08A:
    JSR $103F            ; 20 3F 10 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    SBC $FF7F,X          ; FD 7F FF | Subtract with carry (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ASL $00FE            ; 0E FE 00 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_08B
; Address: $EBB2B0
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_08B:
    JSR $002F            ; 20 2F 00 | Jump to subroutine
    BEQ $0F              ; F0 0F | Branch if equal
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    INC $FC04,X          ; FE 04 FC | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    BPL $F0              ; 10 F0 | Branch if positive
    CPX #$48             ; E0 48 | Compare X register (immediate)
    SEP #$2F             ; E2 2F | Set processor status bits

;------------------------------------------------------------------------------
; Bank56_DmaFunction_08C
; Address: $EBB2E4
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_08C:
    JSR $508F            ; 20 8F 50 | Jump to subroutine
    STA $300E63          ; 8F 63 0E 30 | Store accumulator to absolute long address
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    CPX $86              ; E4 86 | Compare X register (zero page)
    SBC ($66),Y          ; F1 66 | Subtract with carry ((zero page),Y)
    LDA ($2E),Y          ; B1 2E | Load from (zero page),Y into accumulator
    SBC ($86),Y          ; F1 86 | Subtract with carry ((zero page),Y)
    BVS $0C              ; 70 0C | Branch if overflow set
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    CPY #$FF             ; C0 FF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_08D
; Address: $EBB315
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_08D:
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$FE             ; E0 FE | Compare X register (immediate)
    CPY #$1C             ; C0 1C | Compare Y register (immediate)
    PHA                  ; 48 | Push accumulator to stack
    SEP #$2F             ; E2 2F | Set processor status bits
    AND ($8F,X)          ; 21 8F | Logical AND with accumulator ((zero page,X))
    STX $0F62            ; 8E 62 0F | Store X register to absolute address
    BMI $08              ; 30 08 | Branch if negative
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    CPX $46              ; E4 46 | Compare X register (zero page)
    SBC ($46),Y          ; F1 46 | Subtract with carry ((zero page),Y)
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    SBC ($C6),Y          ; F1 C6 | Subtract with carry ((zero page),Y)
    BVS $0C              ; 70 0C | Branch if overflow set
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$FE             ; C0 FE | Compare Y register (immediate)
    CPY #$1C             ; C0 1C | Compare Y register (immediate)
    PHA                  ; 48 | Push accumulator to stack
    SBC ($2F,X)          ; E1 2F | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank56_DmaFunction_08E
; Address: $EBB364
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_08E:
    JSL $8F568F          ; 22 8F 56 8F | Jump to subroutine long
    ADC $0E              ; 65 0E | Add with carry (zero page)
    BMI $08              ; 30 08 | Branch if negative
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    CPX $06              ; E4 06 | Compare X register (zero page)
    SBC ($C6),Y          ; F1 C6 | Subtract with carry ((zero page),Y)
    LDA ($6E),Y          ; B1 6E | Load from (zero page),Y into accumulator
    LDA ($86),Y          ; B1 86 | Load from (zero page),Y into accumulator
    BVS $0C              ; 70 0C | Branch if overflow set
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPX #$FE             ; E0 FE | Compare X register (immediate)
    CPY #$1C             ; C0 1C | Compare Y register (immediate)
    LDX $51AF            ; AE AF 51 | Load from absolute address into X register
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    LDY $ED34,X          ; BC 34 ED | Load from absolute,X into Y register
    RTI                  ; 40 | Return from interrupt
    CPY $43              ; C4 43 | Compare Y register (zero page)
    BVC $00              ; 50 00 | Branch if overflow clear
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    LDA                  ; BF 00 FC 03 | Load from absolute long,X into accumulator
    LDX $51AF            ; AE AF 51 | Load from absolute address into X register
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    TSX                  ; BA | Transfer stack pointer to X register

;------------------------------------------------------------------------------
; Bank56_DmaFunction_08F
; Address: $EBB3CC
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_08F:
    SBC $C540            ; ED 40 C5 | Subtract with carry (absolute)
    BVC $00              ; 50 00 | Branch if overflow clear
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    LDA                  ; BF 00 FD 02 | Load from absolute long,X into accumulator
    LDX $51AF            ; AE AF 51 | Load from absolute address into X register
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    LDY $ED34,X          ; BC 34 ED | Load from absolute,X into Y register
    RTI                  ; 40 | Return from interrupt
    STX $03              ; 86 03 | Store X register to zero page
    BVC $00              ; 50 00 | Branch if overflow clear
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    LDA                  ; BF 00 FE 01 | Load from absolute long,X into accumulator
    LDX $51AF            ; AE AF 51 | Load from absolute address into X register
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    TSX                  ; BA | Transfer stack pointer to X register
    SBC $8740            ; ED 40 87 | Subtract with carry (absolute)
    BVC $00              ; 50 00 | Branch if overflow clear
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    LDA                  ; BF 00 FF 00 | Load from absolute long,X into accumulator
    CMP $1D36,Y          ; D9 36 1D | Compare accumulator (absolute,Y)
    ROR $8F              ; 66 8F | Rotate right (zero page)
    BCC $3F              ; 90 3F | Branch if carry clear
    RTI                  ; 40 | Return from interrupt
    DEC $F7A1,X          ; DE A1 F7 | Decrement (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    SBC $EE4B,X          ; FD 4B EE | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_091
; Address: $EBB437
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_091:
    JSR $A15E            ; 20 5E A1 | Jump to subroutine
    AND #$FD             ; 29 FD | Logical AND with accumulator (immediate)
    CMP #$36             ; C9 36 | Compare accumulator (immediate)
    INC                  ; 1A | Increment accumulator
    ADC $6E              ; 65 6E | Add with carry (zero page)
    STA                  ; 9F A0 7F 40 | Store accumulator to absolute long,X
    STA ($D1,X)          ; 81 D1 | Store accumulator to (zero page,X)
    PHP                  ; 08 | Push processor status to stack
    SBC $EF44,Y          ; F9 44 EF | Subtract with carry (absolute,Y)
    BMI $FA              ; 30 FA | Branch if negative
    ORA $EE              ; 05 EE | Logical OR with accumulator (zero page)
    ORA ($AF),Y          ; 11 AF | Logical OR with accumulator ((zero page),Y)
    BVC $56              ; 50 56 | Branch if overflow clear
    LDA #$D1             ; A9 D1 | Load immediate value into accumulator
    SBC $AF0F,Y          ; F9 0F AF | Subtract with carry (absolute,Y)
    CMP #$26             ; C9 26 | Compare accumulator (immediate)
    ORA $6762,X          ; 1D 62 67 | Logical OR with accumulator (absolute,X)
    STA $403FA0          ; 8F A0 3F 40 | Store accumulator to absolute long address
    STA ($F5,X)          ; 81 F5 | Store accumulator to (zero page,X)
    PHP                  ; 08 | Push processor status to stack
    SBC $EF42,Y          ; F9 42 EF | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_093
; Address: $EBB475
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_093:
    PHP                  ; 08 | Push processor status to stack
    BPL $7C              ; 10 7C | Branch if positive
    SBC $AF0F,Y          ; F9 0F AF | Subtract with carry (absolute,Y)
    JMP $7DFABD          ; 5C BD FA 7D | Jump to address long
    PHX                  ; DA | Push X register to stack
    SBC ($C6,X)          ; E1 C6 | Subtract with carry ((zero page,X))
    INC                  ; 1A | Increment accumulator
    INY                  ; C8 | Increment Y register
    LDY $300B            ; AC 0B 30 | Load from absolute address into Y register
    LDX #$83             ; A2 83 | Load immediate value into X register
    STA $FACD34          ; 8F 34 CD FA | Store accumulator to absolute long address
    BEQ $03              ; F0 03 | Branch if equal
    TSX                  ; BA | Transfer stack pointer to X register
    CMP $FE3B,X          ; DD 3B FE | Compare accumulator (absolute,X)
    PLY                  ; 7A | Pull Y register from stack
    CMP $C6E5,X          ; DD E5 C6 | Compare accumulator (absolute,X)
    LDA $48              ; A5 48 | Load from zero page into accumulator
    LDY $300B            ; AC 0B 30 | Load from absolute address into Y register
    BMI $C9              ; 30 C9 | Branch if negative
    LDA $F000FF          ; AF FF 00 F0 | Load from absolute long address into accumulator
    AND $BD5A,X          ; 3D 5A BD | Logical AND with accumulator (absolute,X)
    PLX                  ; FA | Pull X register from stack
    INC $E7D9,X          ; FE D9 E7 | Increment (absolute,X)
    CPY $02              ; C4 02 | Compare Y register (zero page)
    INC                  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank56_DmaFunction_094
; Address: $EBB4CA
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_094:
    JSL $AC5FCC          ; 22 CC 5F AC | Jump to subroutine long
    BMI $A7              ; 30 A7 | Branch if negative
    BPL $FD              ; 10 FD | Branch if positive
    AND $87              ; 25 87 | Logical AND with accumulator (zero page)
    PLX                  ; FA | Pull X register from stack
    BEQ $03              ; F0 03 | Branch if equal
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $100E            ; 0E 0E 10 | Arithmetic shift left (absolute)
    ASL $1A14,X          ; 1E 14 1A | Arithmetic shift left (absolute,X)
    ASL $420A            ; 0E 0A 42 | Hardware register operation
    LSR $C4              ; 46 C4 | Logical shift right (zero page)
    CPY $56              ; C4 56 | Compare Y register (zero page)
    TSX                  ; BA | Transfer stack pointer to X register
    ROR $0E0E,X          ; 7E 0E 0E | Rotate right (absolute,X)
    ASL $1E1E,X          ; 1E 1E 1E | Arithmetic shift left (absolute,X)
    ASL $0E0E,X          ; 1E 0E 0E | Arithmetic shift left (absolute,X)
    LSR $46              ; 46 46 | Logical shift right (zero page)
    CPY $C4              ; C4 C4 | Compare Y register (zero page)
    INC $00FE,X          ; FE FE 00 | Increment (absolute,X)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    AND $143D            ; 2D 3D 14 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_095
; Address: $EBB52A
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_095:
    LDA $BBB5            ; AD B5 BB | Load from absolute address into accumulator
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    AND $1C3D,X          ; 3D 3D 1C | Logical AND with accumulator (absolute,X)
    LDA $BFBD,X          ; BD BD BF | Load from absolute,X into accumulator
    LDA                  ; BF FF FF 00 | Load from absolute long,X into accumulator
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BIT $3C              ; 24 3C | Test bits in accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    LSR $46              ; 46 46 | Logical shift right (zero page)
    CPY $C4              ; C4 C4 | Compare Y register (zero page)
    RTI                  ; 40 | Return from interrupt
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPX #$60             ; E0 60 | Compare X register (immediate)
    CPX #$C5             ; E0 C5 | Compare X register (immediate)
    CMP $03              ; C5 03 | Compare accumulator (zero page)
    LSR $46              ; 46 46 | Logical shift right (zero page)
    CPY $C4              ; C4 C4 | Compare Y register (zero page)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CMP $C5              ; C5 C5 | Compare accumulator (zero page)
    BMI $30              ; 30 30 | Branch if negative
    PLA                  ; 68 | Pull accumulator from stack
    SEI                  ; 78 | Set interrupt disable flag
    JMP $4E766C          ; 5C 6C 76 4E | Jump to address long
    PLY                  ; 7A | Pull Y register from stack
    LSR $5F              ; 46 5F | Logical shift right (zero page)
    XBA                  ; EB | Exchange accumulator bytes
    BMI $30              ; 30 30 | Branch if negative
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    ROR $7E7E,X          ; 7E 7E 7E | Rotate right (absolute,X)
    ROR $7F7F,X          ; 7E 7F 7F | Rotate right (absolute,X)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    STY $008C            ; 8C 8C 00 | Store Y register to absolute address
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    STY $008C            ; 8C 8C 00 | Store Y register to absolute address
    AND ($05,X)          ; 21 05 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank56_DmaFunction_096
; Address: $EBB5E9
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_096:
    ADC $1F              ; 65 1F | Add with carry (zero page)
    ORA $67              ; 05 67 | Logical OR with accumulator (zero page)
    ORA $0065            ; 0D 65 00 | Logical OR with accumulator (absolute)
    ROL $7A01,X          ; 3E 01 7A | Rotate left (absolute,X)
    ORA $0B74            ; 0D 74 0B | Logical OR with accumulator (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    PLY                  ; 7A | Pull Y register from stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($46,X)          ; 01 46 | Logical OR with accumulator ((zero page,X))
    ADC $FE              ; 65 FE | Add with carry (zero page)
    CLD                  ; D8 | Clear decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    ASL $011F,X          ; 1E 1F 01 | Arithmetic shift left (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($47,X)          ; 01 47 | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF FF 6F A9 | Load from absolute long,X into accumulator
    TSX                  ; BA | Transfer stack pointer to X register
    ADC $CF92            ; 6D 92 CF | Add with carry (absolute)
    BMI $DF              ; 30 DF | Branch if negative

;------------------------------------------------------------------------------
; Bank56_DmaFunction_097
; Address: $EBB62B
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_097:
    JSR $807F            ; 20 7F 80 | Jump to subroutine
    LDX $1AF2            ; AE F2 1A | Load from absolute address into X register
    INC $32              ; E6 32 | Increment (zero page)
    DEC $C73D            ; CE 3D C7 | Decrement (absolute)
    EOR $09F6            ; 4D F6 09 | Exclusive OR with accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BRA $FE              ; 80 FE | Branch always
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    INC $FFFE,X          ; FE FE FF | Increment (absolute,X)
    BIT $3C              ; 24 3C | Test bits in accumulator (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register
    CLV                  ; B8 | Clear overflow flag
    BEQ $F0              ; F0 F0 | Branch if equal
    BNE $FF              ; D0 FF | Branch if not equal
    ORA $87F9,X          ; 1D F9 87 | Logical OR with accumulator (absolute,X)
    NOP                  ; EA | No operation
    ROL $FC3C,X          ; 3E 3C FC | Rotate left (absolute,X)
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $FE              ; F0 FE | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    INC $F9FF,X          ; FE FF F9 | Increment (absolute,X)
    INC $0000            ; EE 00 00 | Increment (absolute)
    AND ($17,X)          ; 21 17 | Logical AND with accumulator ((zero page,X))
    ORA $67              ; 05 67 | Logical OR with accumulator (zero page)
    ORA $0075,X          ; 1D 75 00 | Logical OR with accumulator (absolute,X)
    ROL $6801,X          ; 3E 01 68 | Rotate left (absolute,X)
    ORA $0B74            ; 0D 74 0B | Logical OR with accumulator (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    ROR                  ; 6A | Rotate right (accumulator)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_098
; Address: $EBB6A0
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_098:
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    LSR $47              ; 46 47 | Logical shift right (zero page)
    INC $E5              ; E6 E5 | Increment (zero page)
    LDX $FD              ; A6 FD | Load from zero page into X register
    CPX $F8CF            ; EC CF F8 | Compare X register (absolute)
    ROR $1F24,X          ; 7E 24 1F | Rotate right (absolute,X)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    STA $7BC7F7          ; 8F F7 C7 7B | Store accumulator to absolute long address
    JMP $5DA6FF          ; 5C FF A6 5D | Jump to address long
    SEP #$1D             ; E2 1D | Set processor status bits
    CMP $472E,Y          ; D9 2E 47 | Compare accumulator (absolute,Y)
    CLV                  ; B8 | Clear overflow flag
    SBC $EB12            ; ED 12 EB | Subtract with carry (absolute)
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    LDA ($DF,X)          ; A1 DF | Load from (zero page,X) into accumulator
    ADC #$97             ; 69 97 | Add with carry (immediate)
    NOP                  ; EA | No operation
    BEQ $0F              ; F0 0F | Branch if equal
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BRA $F2              ; 80 F2 | Branch always
    ORA $FFFF            ; 0D FF FF | Logical OR with accumulator (absolute)
    BPL $10              ; 10 10 | Branch if positive
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    ROR $BFE0,X          ; 7E E0 BF | Rotate right (absolute,X)
    ROR $FE1E            ; 6E 1E FE | Rotate right (absolute)
    LDY $00FC,X          ; BC FC 00 | Load from absolute,X into Y register
    BPL $10              ; 10 10 | Branch if positive
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    INC $FFFD            ; EE FD FF | Increment (absolute)
    INC $3613            ; EE 13 36 | Increment (absolute)
    ORA $0037,X          ; 1D 37 00 | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_099
; Address: $EBB729
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_099:
    JSR $2F01            ; 20 01 2F | Jump to subroutine
    AND $210E,Y          ; 39 0E 21 | PPU graphics register access
    AND #$0E             ; 29 0E | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_09A
; Address: $EBB734
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_09A:
    JSR $241F            ; 20 1F 24 | Jump to subroutine
    ROL $2F01,X          ; 3E 01 2F | Rotate left (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CMP $ECEB            ; CD EB EC | Compare accumulator (absolute)
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    SBC ($F1),Y          ; F1 F1 | Subtract with carry ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    CMP #$3A             ; C9 3A | Compare accumulator (immediate)
    SEC                  ; 38 | Set carry flag
    SBC ($BF),Y          ; F1 BF | Subtract with carry ((zero page),Y)
    STA                  ; 9F 7F FF FF | Store accumulator to absolute long,X
    AND $33DF            ; 2D DF 33 | Logical AND with accumulator (absolute)
    INC $EDD7,X          ; FE D7 ED | Increment (absolute,X)
    AND $F7D2            ; 2D D2 F7 | Logical AND with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank56_DmaFunction_09B
; Address: $EBB762
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_09B:
    LDA                  ; BF 40 BF 40 | Load from absolute long,X into accumulator
    CPY #$6F             ; C0 6F | Compare Y register (immediate)
    BCC $07              ; 90 07 | Branch if carry clear
    SEI                  ; 78 | Set interrupt disable flag
    STA $A2A2,X          ; 9D A2 A2 | Store accumulator to absolute,X
    PHX                  ; DA | Push X register to stack
    ROL $03              ; 26 03 | Rotate left (zero page)
    ORA $0037,Y          ; 19 37 00 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_09C
; Address: $EBB789
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_09C:
    JSR $2F01            ; 20 01 2F | Jump to subroutine
    AND $210E,Y          ; 39 0E 21 | PPU graphics register access
    AND $3D0E,Y          ; 39 0E 3D | Logical AND with accumulator (absolute,Y)
    ASL $1F20            ; 0E 20 1F | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_09D
; Address: $EBB796
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_09D:
    JSR $3F1F            ; 20 1F 3F | Jump to subroutine
    ROL $2F01,X          ; 3E 01 2F | Rotate left (absolute,X)
    SBC ($FE),Y          ; F1 FE | Subtract with carry ((zero page),Y)
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ORA ($C1,X)          ; 01 C1 | Logical OR with accumulator ((zero page,X))
    ROL                  ; 2A | Rotate left (accumulator)
    SEC                  ; 38 | Set carry flag
    SBC ($FE),Y          ; F1 FE | Subtract with carry ((zero page),Y)
    STA                  ; 9F 7F FF FF | Store accumulator to absolute long,X
    SBC $936C,X          ; FD 6C 93 | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_09E
; Address: $EBB7C1
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_09E:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    BRA $EF              ; 80 EF | Branch always
    BCC $BF              ; 90 BF | Branch if carry clear
    CPY #$3E             ; C0 3E | Compare Y register (immediate)
    EOR ($9C,X)          ; 41 9C | Exclusive OR with accumulator ((zero page,X))
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    INY                  ; C8 | Increment Y register
    ORA $193D,Y          ; 19 3D 19 | Logical OR with accumulator (absolute,Y)
    ROL $18              ; 26 18 | Rotate left (zero page)
    ROL $08              ; 26 08 | Rotate left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ROL                  ; 2A | Rotate left (accumulator)
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    DEC $6F81            ; CE 81 6F | Decrement (absolute)
    CPX $3313            ; EC 13 33 | Compare X register (absolute)
    CMP $FF00            ; CD 00 FF | Compare accumulator (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_09F
; Address: $EBB80D
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_09F:
    STA $1EBF40          ; 8F 40 BF 1E | Store accumulator to absolute long address
    AND ($FE),Y          ; 31 FE | Logical AND with accumulator ((zero page),Y)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    BPL $FF              ; 10 FF | Branch if positive
    AND ($4D),Y          ; 31 4D | Logical AND with accumulator ((zero page),Y)
    BRA $FF              ; 80 FF | Branch always
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0A0
; Address: $EBB82D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0A0:
    STY $09              ; 84 09 | Store Y register to zero page
    PEA #$DFAF           ; F4 AF DF | Push effective address to stack
    PLA                  ; 68 | Pull accumulator from stack
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0A1
; Address: $EBB83D
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0A1:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    ORA $1824,Y          ; 19 24 18 | Logical OR with accumulator (absolute,Y)
    ROL $08              ; 26 08 | Rotate left (zero page)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA ($3D,X)          ; 01 3D | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    SBC ($80),Y          ; F1 80 | Subtract with carry ((zero page),Y)
    LSR $6789,X          ; 5E 89 67 | Logical shift right (absolute,X)
    STZ $13              ; 64 13 | Store zero to zero page
    CMP $FF00            ; CD 00 FF | Compare accumulator (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0A2
; Address: $EBB86E
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0A2:
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 1E E3 DF | Load from absolute long,X into accumulator
    AND ($FE,X)          ; 21 FE | Logical AND with accumulator ((zero page,X))
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    CLC                  ; 18 | Clear carry flag
    PHY                  ; 5A | Push Y register to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BRA $FF              ; 80 FF | Branch always
    PHA                  ; 48 | Push accumulator to stack
    STY $09              ; 84 09 | Store Y register to zero page
    SBC $DFB7            ; ED B7 DF | Subtract with carry (absolute)
    PLA                  ; 68 | Pull accumulator from stack
    BMI $00              ; 30 00 | Branch if negative
    BMI $FF              ; 30 FF | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    STA $86              ; 85 86 | Store accumulator to zero page
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    BCS $B0              ; B0 B0 | Branch if carry set
    BVC $70              ; 50 70 | Branch if overflow clear
    PHA                  ; 48 | Push accumulator to stack
    SEI                  ; 78 | Set interrupt disable flag
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0A3
; Address: $EBB8E7
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0A3:
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    TSX                  ; BA | Transfer stack pointer to X register
    BCS $B0              ; B0 B0 | Branch if carry set
    BVS $70              ; 70 70 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    AND ($05,X)          ; 21 05 | Logical AND with accumulator ((zero page,X))
    ADC $1B              ; 65 1B | Add with carry (zero page)
    ORA $0065            ; 0D 65 00 | Logical OR with accumulator (absolute)
    ROL $7A01,X          ; 3E 01 7A | Rotate left (absolute,X)
    ORA $0F70            ; 0D 70 0F | Logical OR with accumulator (absolute)
    PLY                  ; 7A | Pull Y register from stack
    ORA $077A            ; 0D 7A 07 | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BRA $80              ; 80 80 | Branch always
    EOR $DF              ; 45 DF | Exclusive OR with accumulator (zero page)
    LDX $F80D            ; AE 0D F8 | Load from absolute address into X register
    ORA $2C7E,X          ; 1D 7E 2C | Logical OR with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BRA $80              ; 80 80 | Branch always
    STA                  ; 9F 6F 8F F7 | Store accumulator to absolute long,X
    TAX                  ; AA | Transfer accumulator to X register
    LDA $FC5B,X          ; BD 5B FC | Load from absolute,X into accumulator
    STA ($7E),Y          ; 91 7E | Store accumulator to (zero page),Y
    SBC $1A              ; E5 1A | Subtract with carry (zero page)
    BRA $5B              ; 80 5B | Branch always
    LDY $9F              ; A4 9F | Load from zero page into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0A4
; Address: $EBB96F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0A4:
    CPY #$BF             ; C0 BF | Compare Y register (immediate)
    LDA                  ; BF FF FF FF | Load from absolute long,X into accumulator
    SBC $FF              ; E5 FF | Subtract with carry (zero page)
    BCC $6F              ; 90 6F | Branch if carry clear

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0A5
; Address: $EBB986
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0A5:
    CMP ($2E),Y          ; D1 2E | Compare accumulator ((zero page),Y)
    EOR #$BC             ; 49 BC | Exclusive OR with accumulator (immediate)
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPX #$BF             ; E0 BF | Compare X register (immediate)
    LDA ($61,X)          ; A1 61 | Load from (zero page,X) into accumulator
    LSR $00BE,X          ; 5E BE 00 | Logical shift right (absolute,X)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPX #$E1             ; E0 E1 | Compare X register (immediate)
    SBC ($FE),Y          ; F1 FE | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0A6
; Address: $EBB9C9
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0A6:
    JSR $2F01            ; 20 01 2F | Jump to subroutine
    AND $311E,Y          ; 39 1E 31 | Logical AND with accumulator (absolute,Y)
    AND #$0E             ; 29 0E | Logical AND with accumulator (immediate)
    AND $200E,X          ; 3D 0E 20 | Logical AND with accumulator (absolute,X)
    ROL $19              ; 26 19 | Rotate left (zero page)
    ROL $2F01,X          ; 3E 01 2F | Rotate left (absolute,X)
    AND #$B6             ; 29 B6 | Logical AND with accumulator (immediate)
    SBC $06FE,X          ; FD FE 06 | Subtract with carry (absolute,X)
    BPL $F1              ; 10 F1 | Branch if positive
    SBC ($05),Y          ; F1 05 | Subtract with carry ((zero page),Y)
    CPY $3B              ; C4 3B | Compare Y register (zero page)
    AND $DFF1,Y          ; 39 F1 DF | Logical AND with accumulator (absolute,Y)
    AND $33DF            ; 2D DF 33 | Logical AND with accumulator (absolute)
    INC $EDD7,X          ; FE D7 ED | Increment (absolute,X)
    EOR $FFB3            ; 4D B3 FF | Exclusive OR with accumulator (absolute)
    LDY #$BF             ; A0 BF | Load immediate value into Y register
    CPY #$57             ; C0 57 | Compare Y register (immediate)
    PLA                  ; 68 | Pull accumulator from stack
    LDA $58C2,X          ; BD C2 58 | Load from absolute,X into accumulator
    ORA $1826,Y          ; 19 26 18 | Logical OR with accumulator (absolute,Y)
    ROL $08              ; 26 08 | Rotate left (zero page)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    PLP                  ; 28 | Pull processor status from stack
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    SBC ($80),Y          ; F1 80 | Subtract with carry ((zero page),Y)
    ROR $6F81,X          ; 7E 81 6F | Rotate right (absolute,X)
    CPY $3333            ; CC 33 33 | Compare Y register (absolute)
    CMP $FF00            ; CD 00 FF | Compare accumulator (absolute)
    BVC $8F              ; 50 8F | Branch if overflow clear
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 1E E3 FF | Load from absolute long,X into accumulator
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0A8
; Address: $EBBA63
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0A8:
    BMI $4D              ; 30 4D | Branch if negative
    BRA $FF              ; 80 FF | Branch always
    PHA                  ; 48 | Push accumulator to stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0A9
; Address: $EBBA6D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0A9:
    STY $09              ; 84 09 | Store Y register to zero page
    SBC $CFB6            ; ED B6 CF | Subtract with carry (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    BMI $00              ; 30 00 | Branch if negative
    BPL $FF              ; 10 FF | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0AC
; Address: $EBBA87
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0AC:
    JSR $1828            ; 20 28 18 | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    AND ($90,X)          ; 21 90 | Logical AND with accumulator ((zero page,X))
    BEQ $60              ; F0 60 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0AD
; Address: $EBBA94
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0AD:
    BPL $30              ; 10 30 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0AF
; Address: $EBBAA8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0AF:
    BRA $E0              ; 80 E0 | Game work RAM access
    CPY #$98             ; C0 98 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    ASL $09FE            ; 0E FE 09 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0B1
; Address: $EBBABE
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0B1:
    JSR $6000            ; 20 00 60 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0B3
; Address: $EBBAC7
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0B3:
    JSR $1120            ; 20 20 11 | Jump to subroutine
    AND $1F1F,Y          ; 39 1F 1F | Logical AND with accumulator (absolute,Y)
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0B6
; Address: $EBBAD4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0B6:
    BPL $30              ; 10 30 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0B9
; Address: $EBBAE6
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0B9:
    BIT $3C              ; 24 3C | Test bits in accumulator (zero page)
    REP #$FE             ; C2 FE | Reset processor status bits
    EOR ($FE,X)          ; 41 FE | Exclusive OR with accumulator ((zero page,X))
    EOR ($FE,X)          ; 41 FE | Exclusive OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    BPL $00              ; 10 00 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0BB
; Address: $EBBB06
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0BB:
    RTI                  ; 40 | Return from interrupt
    BMI $30              ; 30 30 | Branch if negative
    ASL $271E,X          ; 1E 1E 27 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0BC
; Address: $EBBB0D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0BC:
    JSR $201F            ; 20 1F 20 | Jump to subroutine
    BCC $F0              ; 90 F0 | Branch if carry clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0BE
; Address: $EBBB14
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0BE:
    BPL $30              ; 10 30 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0C1
; Address: $EBBB2A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0C1:
    JMP ($FEE2)          ; 6C E2 FE | Jump to address (absolute indirect)
    ORA ($FE),Y          ; 11 FE | Logical OR with accumulator ((zero page),Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0C2
; Address: $EBBB41
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0C2:
    JSR $413F            ; 20 3F 41 | Jump to subroutine
    AND ($17,X)          ; 21 17 | Logical AND with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0C5
; Address: $EBBB54
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0C5:
    BVC $40              ; 50 40 | Branch if overflow clear
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0C6
; Address: $EBBB58
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0C6:
    BVC $70              ; 50 70 | Branch if overflow clear
    BVC $70              ; 50 70 | Branch if overflow clear
    BVC $70              ; 50 70 | Branch if overflow clear
    BVC $70              ; 50 70 | Branch if overflow clear
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA #$FE             ; 09 FE | Logical OR with accumulator (immediate)
    SEP #$0C             ; E2 0C | Set processor status bits

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0CA
; Address: $EBBB8C
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0CA:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0CB
; Address: $EBBB95
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0CB:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BVC $70              ; 50 70 | Branch if overflow clear
    BVC $70              ; 50 70 | Branch if overflow clear
    BVC $70              ; 50 70 | Branch if overflow clear
    BVC $70              ; 50 70 | Branch if overflow clear
    INC $FC02,X          ; FE 02 FC | Increment (absolute,X)
    LSR $C4              ; 46 C4 | Logical shift right (zero page)
    LDX $C6C2,Y          ; BE C2 C6 | Load from absolute,Y into X register
    BPL $00              ; 10 00 | Branch if positive
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0CC
; Address: $EBBBC1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0CC:
    JSR $403F            ; 20 3F 40 | Jump to subroutine
    BMI $03              ; 30 03 | Branch if negative
    ROL $2100            ; 2E 00 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0CF
; Address: $EBBBD4
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0CF:
    EOR ($40,X)          ; 41 40 | Exclusive OR with accumulator ((zero page,X))
    BVC $70              ; 50 70 | Branch if overflow clear
    BVC $70              ; 50 70 | Branch if overflow clear
    BVC $70              ; 50 70 | Branch if overflow clear
    BVC $70              ; 50 70 | Branch if overflow clear
    BVC $70              ; 50 70 | Branch if overflow clear
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CPX $4412            ; EC 12 44 | Compare X register (absolute)
    DEX                  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0D1
; Address: $EBBBF8
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0D1:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    STY $218C            ; 8C 8C 21 | PPU graphics register access
    AND ($C2,X)          ; 21 C2 | Logical AND with accumulator ((zero page,X))
    REP #$11             ; C2 11 | Reset processor status bits
    BIT $342C            ; 2C 2C 34 | Test bits in accumulator (absolute)
    NOP                  ; EA | No operation
    ADC $73FF            ; 6D FF 73 | Add with carry (absolute)
    DEC $3DFF,X          ; DE FF 3D | Decrement (absolute,X)
    INX                  ; E8 | Increment X register
    EOR #$59             ; 49 59 | Exclusive OR with accumulator (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0D2
; Address: $EBBC25
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0D2:
    ADC ($0A,X)          ; 61 0A | Add with carry ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHA                  ; 48 | Push accumulator to stack
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0D4
; Address: $EBBC32
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0D4:
    LDX $FF              ; A6 FF | Load from zero page into X register
    STZ $F5FF,X          ; 9E FF F5 | Store zero to absolute,X
    ROL                  ; 2A | Rotate left (accumulator)
    SEI                  ; 78 | Set interrupt disable flag
    LDY $A4              ; A4 A4 | Load from zero page into Y register
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    INC $E6              ; E6 E6 | Increment (zero page)
    STA ($91),Y          ; 91 91 | Store accumulator to (zero page),Y
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0D5
; Address: $EBBC4D
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0D5:
    ADC ($0A,X)          ; 61 0A | Add with carry ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PLX                  ; FA | Pull X register from stack
    ORA $6EFF,Y          ; 19 FF 6E | Logical OR with accumulator (absolute,Y)
    STZ $F5FF,X          ; 9E FF F5 | Store zero to absolute,X
    STA ($99,X)          ; 81 99 | Store accumulator to (zero page,X)
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    RTI                  ; 40 | Return from interrupt
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    CMP $FDFF            ; CD FF FD | Compare accumulator (absolute)
    ROR $FF              ; 66 FF | Rotate right (zero page)
    PLB                  ; AB | Pull data bank register from stack
    LDA                  ; BF FF E5 FF | Load from absolute long,X into accumulator
    BRA $80              ; 80 80 | Branch always
    EOR $9259,Y          ; 59 59 92 | Exclusive OR with accumulator (absolute,Y)
    STZ $04              ; 64 04 | Store zero to zero page
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    LDX $FF              ; A6 FF | Load from zero page into X register
    ADC $9BFF            ; 6D FF 9B | Add with carry (absolute)
    CPY $B7FF            ; CC FF B7 | Compare Y register (absolute)
    TAX                  ; AA | Transfer accumulator to X register
    CPY $C4              ; C4 C4 | Compare Y register (zero page)
    BMI $30              ; 30 30 | Branch if negative
    LDY #$A8             ; A0 A8 | Load immediate value into Y register
    LSR $46              ; 46 46 | Logical shift right (zero page)
    BIT #$89             ; 89 89 | Test bits in accumulator (immediate)
    ROL $202E            ; 2E 2E 20 | Rotate left (absolute)
    LDY #$ED             ; A0 ED | Load immediate value into Y register
    LDA $76FF,Y          ; B9 FF 76 | Load from absolute,Y into accumulator
    CMP ($FF),Y          ; D1 FF | Compare accumulator ((zero page),Y)
    BVC $50              ; 50 50 | Branch if overflow clear
    INC $E6              ; E6 E6 | Increment (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0D6
; Address: $EBBCC6
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0D6:
    ORA ($21,X)          ; 01 21 | PPU graphics register access
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    AND ($31),Y          ; 31 31 | Logical AND with accumulator ((zero page),Y)
    STY $84              ; 84 84 | Store Y register to zero page
    LDA $FF19FF          ; AF FF 19 FF | Load from absolute long address into accumulator
    DEC $9DFF,X          ; DE FF 9D | Decrement (absolute,X)
    SBC $FF              ; E5 FF | Subtract with carry (zero page)
    DEC $7BFF            ; CE FF 7B | Decrement (absolute)
    ADC #$69             ; 69 69 | Add with carry (immediate)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0D7
; Address: $EBBCE8
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0D7:
    JSR $A624            ; 20 24 A6 | Jump to subroutine
    LDX $C9              ; A6 C9 | Load from zero page into X register
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    ORA $96FF            ; 0D FF 96 | Logical OR with accumulator (absolute)
    EOR $36FF,Y          ; 59 FF 36 | Exclusive OR with accumulator (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    EOR #$49             ; 49 49 | Exclusive OR with accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $B0              ; 80 B0 | Branch always
    ADC #$69             ; 69 69 | Add with carry (immediate)
    ROL $26              ; 26 26 | Rotate left (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0D8
; Address: $EBBD16
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0D8:
    LDA                  ; BF FF 4F FF | Load from absolute long,X into accumulator
    SED                  ; F8 | Set decimal mode flag
    CMP $00FF,Y          ; D9 FF 00 | Compare accumulator (absolute,Y)
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    BPL $B0              ; 10 B0 | Branch if positive
    BCS $06              ; B0 06 | Branch if carry set
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    PLX                  ; FA | Pull X register from stack
    SBC $22FF,Y          ; F9 FF 22 | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0D9
; Address: $EBBD41
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0D9:
    JSL $142A2A          ; 22 2A 2A 14 | Jump to subroutine long
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    EOR ($4D,X)          ; 41 4D | Exclusive OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    CMP $D5FF,X          ; DD FF D5 | Compare accumulator (absolute,X)
    XBA                  ; EB | Exchange accumulator bytes
    ROR $B2FF,X          ; 7E FF B2 | Rotate right (absolute,X)
    CMP $B5FF            ; CD FF B5 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0DA
; Address: $EBBD60
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0DA:
    AND $002D            ; 2D 2D 00 | Logical AND with accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    SEP #$E2             ; E2 E2 | Set processor status bits
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ORA $EAFF,X          ; 1D FF EA | Logical OR with accumulator (absolute,X)
    PLB                  ; AB | Pull data bank register from stack
    LDA                  ; BF FF E7 FF | Load from absolute long,X into accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    STY $418C            ; 8C 8C 41 | Store Y register to absolute address
    EOR ($81,X)          ; 41 81 | Exclusive OR with accumulator ((zero page,X))
    STA ($20,X)          ; 81 20 | Store accumulator to (zero page,X)
    BIT $CECE            ; 2C CE CE | Test bits in accumulator (absolute)
    CMP $73FF            ; CD FF 73 | Compare accumulator (absolute)
    LDX $7EFF,Y          ; BE FF 7E | Load from absolute,Y into X register
    AND ($FF),Y          ; 31 FF | Logical AND with accumulator ((zero page),Y)
    NOP                  ; EA | No operation
    BMI $36              ; 30 36 | Branch if negative
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0DB
; Address: $EBBDA8
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0DB:
    JSL $C5C522          ; 22 22 C5 C5 | Jump to subroutine long
    BMI $B0              ; 30 B0 | Branch if negative
    AND $C9FF            ; 2D FF C9 | Logical AND with accumulator (absolute)
    ROL $DDFF,X          ; 3E FF DD | Rotate left (absolute,X)
    DEC                  ; 3A | Decrement accumulator
    CPX $4FFF            ; EC FF 4F | Compare X register (absolute)
    NOP                  ; EA | No operation
    ADC $73FF            ; 6D FF 73 | Add with carry (absolute)
    DEC $3DFF,X          ; DE FF 3D | Decrement (absolute,X)
    SBC $FFE8,Y          ; F9 E8 FF | Subtract with carry (absolute,Y)
    BRA $FF              ; 80 FF | Branch always
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    XBA                  ; EB | Exchange accumulator bytes
    LDX $FE              ; A6 FE | Load from zero page into X register
    STZ $F5FF,X          ; 9E FF F5 | Store zero to absolute,X
    ROL                  ; 2A | Rotate left (accumulator)
    SEI                  ; 78 | Set interrupt disable flag
    BPL $FF              ; 10 FF | Branch if positive
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0DC
; Address: $EBBDFA
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0DC:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    PLX                  ; FA | Pull X register from stack
    ORA $6EFF,Y          ; 19 FF 6E | Logical OR with accumulator (absolute,Y)
    INC $FF9E,X          ; FE 9E FF | Increment (absolute,X)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CMP $FDFF            ; CD FF FD | Compare accumulator (absolute)
    ROR $FF              ; 66 FF | Rotate right (zero page)
    PLB                  ; AB | Pull data bank register from stack
    LDA                  ; BF BF FF E5 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0DD
; Address: $EBBE34
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0DD:
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    LDX $FF              ; A6 FF | Load from zero page into X register
    ADC $9B9F            ; 6D 9F 9B | Add with carry (absolute)
    CPY $B7FF            ; CC FF B7 | Compare Y register (absolute)
    INC $00AA,X          ; FE AA 00 | Increment (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0DE
; Address: $EBBE5E
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0DE:
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SBC $3BFF            ; ED FF 3B | Subtract with carry (absolute)
    LDA $76FF,Y          ; B9 FF 76 | Load from absolute,Y into accumulator
    CMP ($7F),Y          ; D1 7F | Compare accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    BRA $FF              ; 80 FF | Branch always
    LDA $FF19FF          ; AF FF 19 FF | Load from absolute long address into accumulator
    DEC $9DFF,X          ; DE FF 9D | Decrement (absolute,X)
    SBC $FF              ; E5 FF | Subtract with carry (zero page)
    DEC $7BFF            ; CE FF 7B | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0DF
; Address: $EBBE96
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0DF:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    ORA $96FF            ; 0D FF 96 | Logical OR with accumulator (absolute)
    EOR $36FF,Y          ; 59 FF 36 | Exclusive OR with accumulator (absolute,Y)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0E0
; Address: $EBBEC7
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0E0:
    LDA                  ; BF CF 4F FF | Load from absolute long,X into accumulator
    SED                  ; F8 | Set decimal mode flag
    CMP $FF00,Y          ; D9 00 FF | Compare accumulator (absolute,Y)
    BMI $FF              ; 30 FF | Branch if negative
    STA                  ; 9F 18 FF D7 | Store accumulator to absolute long,X
    PLX                  ; FA | Pull X register from stack
    SBC $FF00,Y          ; F9 00 FF | Subtract with carry (absolute,Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0E1
; Address: $EBBEFA
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0E1:
    BPL $FF              ; 10 FF | Branch if positive
    CMP $D5FF,X          ; DD FF D5 | Compare accumulator (absolute,X)
    XBA                  ; EB | Exchange accumulator bytes
    ROR $B2F3,X          ; 7E F3 B2 | Rotate right (absolute,X)
    CMP $B5FF            ; CD FF B5 | Compare accumulator (absolute)
    ORA $EAFF,X          ; 1D FF EA | Logical OR with accumulator (absolute,X)
    PLB                  ; AB | Pull data bank register from stack
    LDA                  ; BF BF FF E7 | Load from absolute long,X into accumulator
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    CMP $73FF            ; CD FF 73 | Compare accumulator (absolute)
    LDX $7EFF,Y          ; BE FF 7E | Load from absolute,Y into X register
    AND ($FF),Y          ; 31 FF | Logical AND with accumulator ((zero page),Y)
    NOP                  ; EA | No operation
    AND $C9F9            ; 2D F9 C9 | Logical AND with accumulator (absolute)
    ROL $DDFF,X          ; 3E FF DD | Rotate left (absolute,X)
    DEC                  ; 3A | Decrement accumulator
    CPX $4F7F            ; EC 7F 4F | Compare X register (absolute)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    BRA $FF              ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0E3
; Address: $EBBF8B
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0E3:
    JSL $F4E7F1          ; 22 F1 E7 F4 | Jump to subroutine long
    ROR                  ; 6A | Rotate right (accumulator)
    LDA $33FF            ; AD FF 33 | Load from absolute address into accumulator
    ASL $1DFF,X          ; 1E FF 1D | Arithmetic shift left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    CMP #$D9             ; C9 D9 | Compare accumulator (immediate)
    CPX #$A1             ; E0 A1 | Compare X register (immediate)
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    INY                  ; C8 | Increment Y register
    DEY                  ; 88 | Decrement Y register
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0E4
; Address: $EBBFB2
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0E4:
    ROL $FF              ; 26 FF | Rotate left (zero page)
    ASL $35FF,X          ; 1E FF 35 | Arithmetic shift left (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    LDY $24              ; A4 24 | Load from zero page into Y register
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    CMP $C5              ; C5 C5 | Compare accumulator (zero page)
    INC $06              ; E6 06 | Increment (zero page)
    SBC ($71),Y          ; F1 71 | Subtract with carry ((zero page),Y)
    BEQ $91              ; F0 91 | Branch if equal
    LDY $3AFF,X          ; BC FF 3A | Load from absolute,X into Y register
    ORA $0EFF,Y          ; 19 FF 0E | Logical OR with accumulator (absolute,Y)
    ASL $0DFF            ; 0E FF 0D | Arithmetic shift left (absolute)
    CMP ($59,X)          ; C1 59 | Compare accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register
    DEY                  ; 88 | Decrement Y register
    PEA #$E8B4           ; F4 B4 E8 | Push effective address to stack
    PLP                  ; 28 | Pull processor status from stack
    BCS $B0              ; B0 B0 | Branch if carry set
    PLX                  ; FA | Pull X register from stack
    NOP                  ; EA | No operation
    EOR $7DFF            ; 4D FF 7D | Exclusive OR with accumulator (absolute)
    ROL $FF              ; 26 FF | Rotate left (zero page)
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    BRA $00              ; 80 00 | Branch always
    CMP $D2D9,Y          ; D9 D9 D2 | Compare accumulator (absolute,Y)
    STY $A4              ; 84 A4 | Store Y register to zero page
    CPX $E4              ; E4 E4 | Compare X register (zero page)
    SED                  ; F8 | Set decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    PEA #$7FA5           ; F4 A5 7F | Push effective address to stack
    ROL $FF              ; 26 FF | Rotate left (zero page)
    AND $5BFF            ; 2D FF 5B | Logical AND with accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0E5
; Address: $EBC022
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0E5:
    CPY $44              ; C4 44 | Compare Y register (zero page)
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$68             ; E0 68 | Compare X register (immediate)
    INC $A6              ; E6 A6 | Increment (zero page)
    SBC #$69             ; E9 69 | Subtract with carry (immediate)
    INC $70DE,X          ; FE DE 70 | Increment (absolute,X)
    BVC $6D              ; 50 6D | Branch if overflow clear
    ORA $16FF,Y          ; 19 FF 16 | Logical OR with accumulator (absolute,Y)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    STA $D0D0FF          ; 8F FF D0 D0 | Store accumulator to absolute long address
    INC $66              ; E6 66 | Increment (zero page)
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    CMP ($E1,X)          ; C1 E1 | Compare accumulator ((zero page,X))
    SEP #$82             ; E2 82 | Set processor status bits
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    SBC ($C1),Y          ; F1 C1 | Subtract with carry ((zero page),Y)
    PEA #$2F74           ; F4 74 2F | Push effective address to stack
    ORA $37FF,Y          ; 19 FF 37 | Logical OR with accumulator (absolute,Y)
    ASL $1DFF,X          ; 1E FF 1D | Arithmetic shift left (absolute,X)
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    ASL $0BFF            ; 0E FF 0B | Arithmetic shift left (absolute)
    SBC #$E9             ; E9 E9 | Subtract with carry (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$C4             ; E0 C4 | Compare X register (immediate)
    INC $46              ; E6 46 | Increment (zero page)
    SBC #$29             ; E9 29 | Subtract with carry (immediate)
    PEA #$8DF4           ; F4 F4 8D | Push effective address to stack
    ORA $16FF,Y          ; 19 FF 16 | Logical OR with accumulator (absolute,Y)
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    CMP #$89             ; C9 89 | Compare accumulator (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$50             ; C0 50 | Compare Y register (immediate)
    SBC $F699,Y          ; F9 99 F6 | Subtract with carry (absolute,Y)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0E6
; Address: $EBC09A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0E6:
    CLC                  ; 18 | Clear carry flag
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    BRA $80              ; 80 80 | Branch always
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    DEX                  ; CA | Decrement X register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SBC $E5              ; E5 E5 | Subtract with carry (zero page)
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BEQ $40              ; F0 40 | Branch if equal

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0E7
; Address: $EBC0B2
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0E7:
    CLC                  ; 18 | Clear carry flag
    INC                  ; 1A | Increment accumulator
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    LDX #$A2             ; A2 A2 | Load immediate value into X register
    TAX                  ; AA | Transfer accumulator to X register
    TAX                  ; AA | Transfer accumulator to X register
    CMP ($41,X)          ; C1 41 | Compare accumulator ((zero page,X))
    SBC ($AD,X)          ; E1 AD | Subtract with carry ((zero page,X))
    CPX $F2EC            ; EC EC F2 | Compare X register (absolute)
    REP #$FA             ; C2 FA | Reset processor status bits
    TSX                  ; BA | Transfer stack pointer to X register
    EOR $55FF,X          ; 5D FF 55 | Exclusive OR with accumulator (absolute,X)
    ROL $12FF,X          ; 3E FF 12 | Rotate left (absolute,X)
    ORA $05FF            ; 0D FF 05 | Logical OR with accumulator (absolute)
    LDA $80AD            ; AD AD 80 | Load from absolute address into accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    SEP #$22             ; E2 22 | Set processor status bits
    PEA #$E3B4           ; F4 B4 E3 | Push effective address to stack
    BCS $B0              ; B0 B0 | Branch if carry set
    SED                  ; F8 | Set decimal mode flag
    INX                  ; E8 | Increment X register
    ORA $2AFF,X          ; 1D FF 2A | Logical OR with accumulator (absolute,X)
    TAY                  ; A8 | Transfer accumulator to Y register
    PLP                  ; 28 | Pull processor status from stack
    CPY $C14C            ; CC 4C C1 | Compare Y register (absolute)
    STA ($E1,X)          ; 81 E1 | Store accumulator to (zero page,X)
    ADC ($E0,X)          ; 61 E0 | Game work RAM access
    CPY $3EFE            ; CC FE 3E | Compare Y register (absolute)
    SBC $57              ; E5 57 | Subtract with carry (zero page)
    EOR $33FF            ; 4D FF 33 | Exclusive OR with accumulator (absolute)
    ROL $1EFF,X          ; 3E FF 1E | Rotate left (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BCS $B6              ; B0 B6 | Branch if carry set
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CMP ($01,X)          ; C1 01 | Compare accumulator ((zero page,X))
    SEP #$C2             ; E2 C2 | Set processor status bits
    SBC $25              ; E5 25 | Subtract with carry (zero page)
    BVS $40              ; 70 40 | Branch if overflow set
    AND $49FF            ; 2D FF 49 | Logical AND with accumulator (absolute)
    ROL $1DFF,X          ; 3E FF 1D | Rotate left (absolute,X)
    INC                  ; 1A | Increment accumulator
    STA $D8F8FF          ; 8F FF F8 D8 | Store accumulator to absolute long address
    ROR $FC7E,X          ; 7E 7E FC | Rotate right (absolute,X)
    LDY $57FF            ; AC FF 57 | Load from absolute address into Y register
    PLX                  ; FA | Pull X register from stack
    NOP                  ; EA | No operation
    INC $07FA,X          ; FE FA 07 | Increment (absolute,X)
    ORA $81FF            ; 0D FF 81 | Logical OR with accumulator (absolute)
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0E8
; Address: $EBC15E
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0E8:
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    BVC $F8              ; 50 F8 | Branch if overflow clear
    LDA ($FD),Y          ; B1 FD | Load from (zero page),Y into accumulator
    CMP $78FC            ; CD FC 78 | Compare accumulator (absolute)
    LDA                  ; BF 9C 14 FE | Load from absolute long,X into accumulator
    DEX                  ; CA | Decrement X register
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    SBC ($61,X)          ; E1 61 | Subtract with carry ((zero page,X))
    INC $FEEE,X          ; FE EE FE | Increment (absolute,X)
    INC $03A6,X          ; FE A6 03 | Increment (absolute,X)
    ASL $01FF,X          ; 1E FF 01 | Arithmetic shift left (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SBC $FCD9,Y          ; F9 D9 FC | Subtract with carry (absolute,Y)
    CPX $F8              ; E4 F8 | Compare X register (zero page)
    JMP $FD9BFF          ; 5C FF 9B FD | Jump to address long
    ROR $FE78,X          ; 7E 78 FE | Rotate right (absolute,X)
    LDX $FF06            ; AE 06 FF | Load from absolute address into X register
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    BCS $FB              ; B0 FB | Branch if carry set
    SED                  ; F8 | Set decimal mode flag
    BEQ $ED              ; F0 ED | Branch if equal
    SBC #$FE             ; E9 FE | Subtract with carry (immediate)
    STZ $6DFD,X          ; 9E FD 6D | Store zero to absolute,X
    INC $FE8A,X          ; FE 8A FE | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SBC $FAF9,Y          ; F9 F9 FA | Subtract with carry (absolute,Y)
    SBC $F8B1,Y          ; F9 B1 F8 | Subtract with carry (absolute,Y)
    PHX                  ; DA | Push X register to stack
    BMI $FE              ; 30 FE | Branch if negative
    CPX $547E            ; EC 7E 54 | Compare X register (absolute)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    INC $F86E,X          ; FE 6E F8 | Increment (absolute,X)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    SBC $FE99,X          ; FD 99 FE | Subtract with carry (absolute,X)
    JMP ($DEFE)          ; 6C FE DE | Jump to address (absolute indirect)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0E9
; Address: $EBC21C
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0E9:
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    PLX                  ; FA | Pull X register from stack
    BEQ $E0              ; F0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    INC $FCBA,X          ; FE BA FC | Increment (absolute,X)
    LDY $FE              ; A4 FE | Load from zero page into Y register
    SBC $05DD,X          ; FD DD 05 | Subtract with carry (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SBC $FC1F,Y          ; F9 1F FC | Subtract with carry (absolute,Y)
    CPX $ABFB            ; EC FB AB | Compare X register (absolute)
    JMP $FDF4F4          ; 5C F4 F4 FD | Jump to address long
    SBC ($FE),Y          ; F1 FE | Subtract with carry ((zero page),Y)
    STZ $FF07,X          ; 9E 07 FF | Store zero to absolute,X
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    CPX #$F9             ; E0 F9 | Compare X register (immediate)
    CMP ($FA),Y          ; D1 FA | Compare accumulator ((zero page),Y)
    ROR                  ; 6A | Rotate right (accumulator)
    INC $F1FE,X          ; FE FE F1 | Increment (absolute,X)
    SBC ($FC),Y          ; F1 FC | Subtract with carry ((zero page),Y)
    INC $FE68,X          ; FE 68 FE | Increment (absolute,X)
    TXS                  ; 9A | Transfer X register to stack pointer
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ASL $03FF            ; 0E FF 03 | Arithmetic shift left (absolute)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    JMP $E0E0            ; 4C E0 E0 | Game work RAM access
    SBC $FCBD,X          ; FD BD FC | Subtract with carry (absolute,X)
    INC $FFD6,X          ; FE D6 FF | Increment (absolute,X)
    INC $03E6,X          ; FE E6 03 | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    LDY $ACFC,X          ; BC FC AC | Load from absolute,X into Y register
    SED                  ; F8 | Set decimal mode flag
    BNE $FD              ; D0 FD | Branch if not equal
    ADC $4ECE,X          ; 7D CE 4E | Add with carry (absolute,X)
    CPY $B2FE            ; CC FE B2 | Compare Y register (absolute)
    INC $03AC,X          ; FE AC 03 | Increment (absolute,X)
    AND ($FF),Y          ; 31 FF | Logical AND with accumulator ((zero page),Y)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    TYA                  ; 98 | Transfer Y register to accumulator
    BCC $F8              ; 90 F8 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0EA
; Address: $EBC2C5
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0EA:
    SED                  ; F8 | Set decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    SBC $FE5D,X          ; FD 5D FE | Subtract with carry (absolute,X)
    INC $04F3,X          ; FE F3 04 | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SBC $FCED,X          ; FD ED FC | Subtract with carry (absolute,X)
    SBC $FEC9,Y          ; F9 C9 FE | Subtract with carry (absolute,Y)
    ROR $7DFD,X          ; 7E FD 7D | Rotate right (absolute,X)
    CPY $FEC8            ; CC C8 FE | Compare Y register (absolute)
    STY $57FF            ; 8C FF 57 | Store Y register to absolute address
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register
    STA $838F,X          ; 9D 8F 83 | Store accumulator to absolute,X
    ROL $FDFF,X          ; 3E FF FD | Rotate left (absolute,X)
    AND $7F28,Y          ; 39 28 7F | Logical AND with accumulator (absolute,Y)
    INX                  ; E8 | Increment X register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0EB
; Address: $EBC316
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0EB:
    BVS $FF              ; 70 FF | Branch if overflow set
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    DEC $FF              ; C6 FF | Decrement (zero page)
    BRA $FF              ; 80 FF | Branch always
    PEA #$E9E4           ; F4 E4 E9 | Push effective address to stack
    LDA #$F0             ; A9 F0 | Load immediate value into accumulator
    STA ($FA),Y          ; 91 FA | Store accumulator to (zero page),Y
    PLX                  ; FA | Pull X register from stack
    AND $D8              ; 25 D8 | Logical AND with accumulator (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator
    BEQ $D0              ; F0 D0 | Branch if equal
    ASL $05FF            ; 0E FF 05 | Arithmetic shift left (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    CPY $0A0F            ; CC 0F 0A | Compare Y register (absolute)
    SBC $AEBF,Y          ; F9 BF AE | Subtract with carry (absolute,Y)
    ROR $7F5E,X          ; 7E 5E 7F | Rotate right (absolute,X)
    CLI                  ; 58 | Clear interrupt disable flag
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BMI $FF              ; 30 FF | Branch if negative
    BEQ $FF              ; F0 FF | Branch if equal
    RTI                  ; 40 | Return from interrupt
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    BRA $FF              ; 80 FF | Branch always
    REP #$F2             ; C2 F2 | Reset processor status bits
    SBC ($69,X)          ; E1 69 | Subtract with carry ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    PEA #$F8A4           ; F4 A4 F8 | Push effective address to stack
    SEC                  ; 38 | Set carry flag
    BCS $B0              ; B0 B0 | Branch if carry set

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0EC
; Address: $EBC36E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0EC:
    PLX                  ; FA | Pull X register from stack
    NOP                  ; EA | No operation
    ORA $0DFF            ; 0D FF 0D | Logical OR with accumulator (absolute)
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    LSR $9D9F,X          ; 5E 9F 9D | Logical shift right (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0ED
; Address: $EBC38E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0ED:
    ROR $7C2A,X          ; 7E 2A 7C | Rotate right (absolute,X)
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0EE
; Address: $EBC396
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0EE:
    BCC $FF              ; 90 FF | Branch if carry clear
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BRA $FF              ; 80 FF | Branch always
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    SEP #$F4             ; E2 F4 | Set processor status bits
    BEQ $C0              ; F0 C0 | Branch if equal
    BEQ $58              ; F0 58 | Branch if equal
    SBC $FE79,Y          ; F9 79 FE | Subtract with carry (absolute,Y)
    DEC $5070,X          ; DE 70 50 | Decrement (absolute,X)
    ORA $0BFF            ; 0D FF 0B | Logical OR with accumulator (absolute)
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    STA $5353FF          ; 8F FF 53 53 | Store accumulator to absolute long address
    SBC ($0F,X)          ; E1 0F | Subtract with carry ((zero page,X))
    ROL $7D7F            ; 2E 7F 7D | Rotate left (absolute)
    AND $3F              ; 25 3F | Logical AND with accumulator (zero page)
    ASL $FBFF            ; 0E FF FB | Arithmetic shift left (absolute)
    LDY $18FF            ; AC FF 18 | Load from absolute address into Y register
    BEQ $FF              ; F0 FF | Branch if equal
    BNE $FF              ; D0 FF | Branch if not equal
    BRA $FF              ; 80 FF | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    SBC $F899,Y          ; F9 99 F8 | Subtract with carry (absolute,Y)
    INX                  ; E8 | Increment X register
    BEQ $30              ; F0 30 | Branch if equal
    BEQ $D4              ; F0 D4 | Branch if equal
    SBC $F439,Y          ; F9 39 F4 | Subtract with carry (absolute,Y)
    PEA #$FFCD           ; F4 CD FF | Push effective address to stack
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    LSR $4F              ; 46 4F | Logical shift right (zero page)
    STA $383FAF          ; 8F AF 3F 38 | Store accumulator to absolute long address
    EOR $FFE4,Y          ; 59 E4 FF | Exclusive OR with accumulator (absolute,Y)
    PLA                  ; 68 | Pull accumulator from stack
    BCS $FF              ; B0 FF | Branch if carry set
    BCS $FF              ; B0 FF | Branch if carry set
    BVC $FF              ; 50 FF | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0EF
; Address: $EBC41A
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0EF:
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    BEQ $F0              ; F0 F0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    PLX                  ; FA | Pull X register from stack
    DEC                  ; 3A | Decrement accumulator
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $40              ; F0 40 | Branch if equal
    PLA                  ; 68 | Pull accumulator from stack
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    AND ($2F,X)          ; 21 2F | Logical AND with accumulator ((zero page,X))
    AND $1B1F            ; 2D 1F 1B | Logical AND with accumulator (absolute)
    STA $52538E          ; 8F 8E 53 52 | Store accumulator to absolute long address
    ORA $357F            ; 0D 7F 35 | Logical OR with accumulator (absolute)
    BNE $FF              ; D0 FF | Branch if not equal
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BVS $FF              ; 70 FF | Branch if overflow set
    LDY $C0FF            ; AC FF C0 | Load from absolute address into Y register
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BRA $FF              ; 80 FF | Branch always
    SBC $E0DD,X          ; FD DD E0 | Game work RAM access
    INX                  ; E8 | Increment X register
    SBC $F4              ; E5 F4 | Subtract with carry (zero page)
    LDY $F3              ; A4 F3 | Load from zero page into Y register
    BCS $B0              ; B0 B0 | Branch if carry set
    SED                  ; F8 | Set decimal mode flag
    INX                  ; E8 | Increment X register
    ORA $0AFF            ; 0D FF 0A | Logical OR with accumulator (absolute)
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    STA $4E4F83          ; 8F 83 4F 4E | Store accumulator to absolute long address
    STA                  ; 9F 9E 33 13 | Store accumulator to absolute long,X
    SBC ($7F),Y          ; F1 7F | Subtract with carry ((zero page),Y)
    ROR                  ; 6A | Rotate right (accumulator)
    INY                  ; C8 | Increment Y register
    BVS $FF              ; 70 FF | Branch if overflow set
    BCS $FF              ; B0 FF | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0F1
; Address: $EBC4A1
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0F1:
    JSL $F0C6F0          ; 22 F0 C6 F0 | Jump to subroutine long
    BEQ $F1              ; F0 F1 | Branch if equal
    AND ($F2),Y          ; 31 F2 | Logical AND with accumulator ((zero page),Y)
    BVS $40              ; 70 40 | Branch if overflow set
    ORA $09FF            ; 0D FF 09 | Logical OR with accumulator (absolute)
    ASL $0DFF            ; 0E FF 0D | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0F2
; Address: $EBC4BA
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0F2:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $2B2BFF          ; 8F FF 2B 2B | Store accumulator to absolute long address
    STA $890F,X          ; 9D 0F 89 | Store accumulator to absolute,X
    LDA                  ; BF B4 3B 29 | Load from absolute long,X into accumulator
    DEC $7B7F,X          ; DE 7F 7B | Decrement (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0F3
; Address: $EBC4D4
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0F3:
    BVS $FF              ; 70 FF | Branch if overflow set
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    CPY $FF              ; C4 FF | Compare Y register (zero page)
    BRA $FF              ; 80 FF | Branch always
    SED                  ; F8 | Set decimal mode flag
    CLI                  ; 58 | Clear interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    LDA $C1F1,Y          ; B9 F1 C1 | Load from absolute,Y into accumulator
    PEA #$F374           ; F4 74 F3 | Push effective address to stack
    TYA                  ; 98 | Transfer Y register to accumulator
    CLC                  ; 18 | Clear carry flag
    PEA #$0CC4           ; F4 C4 0C | Push effective address to stack
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    ASL $0BFF            ; 0E FF 0B | Arithmetic shift left (absolute)
    ORA $353F,X          ; 1D 3F 35 | Logical OR with accumulator (absolute,X)
    BIT $3D3D            ; 2C 3D 3D | Test bits in accumulator (absolute)
    BCS $FF              ; B0 FF | Branch if carry set
    CLV                  ; B8 | Clear overflow flag
    PLA                  ; 68 | Pull accumulator from stack
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    REP #$FF             ; C2 FF | Reset processor status bits
    BRA $FF              ; 80 FF | Branch always
    CPX $3BF8            ; EC F8 3B | Compare X register (absolute)
    BEQ $50              ; F0 50 | Branch if equal
    SBC $7679,Y          ; F9 79 76 | Subtract with carry (absolute,Y)
    BEQ $A0              ; F0 A0 | Branch if equal
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    BIT #$FF             ; 89 FF | Test bits in accumulator (immediate)
    BIT $0F              ; 24 0F | Test bits in accumulator (zero page)
    INC                  ; 1A | Increment accumulator
    ADC $AEBF,X          ; 7D BF AE | Add with carry (absolute,X)
    ROR $B47A,X          ; 7E 7A B4 | Rotate right (absolute,X)
    CLD                  ; D8 | Clear decimal mode flag
    BEQ $FF              ; F0 FF | Branch if equal
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BRA $FF              ; 80 FF | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $FF              ; 80 FF | Branch always
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0F4
; Address: $EBC560
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0F4:
    SBC ($F1),Y          ; F1 F1 | Subtract with carry ((zero page),Y)
    PLX                  ; FA | Pull X register from stack
    ROR                  ; 6A | Rotate right (accumulator)
    SBC $F0B9,Y          ; F9 B9 F0 | Subtract with carry (absolute,Y)
    BEQ $D0              ; F0 D0 | Branch if equal
    SEP #$7A             ; E2 7A | Set processor status bits
    PHY                  ; 5A | Push Y register to stack
    ASL $05FF            ; 0E FF 05 | Arithmetic shift left (absolute)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    ORA $85FF            ; 0D FF 85 | Logical OR with accumulator (absolute)
    JMP $974C            ; 4C 4C 97 | Jump to address
    STA ($1F),Y          ; 91 1F | Store accumulator to (zero page),Y
    PHY                  ; 5A | Push Y register to stack
    LDA                  ; BF AC 7F 5F | Load from absolute long,X into accumulator
    PLA                  ; 68 | Pull accumulator from stack
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BEQ $FF              ; F0 FF | Branch if equal
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BRA $FF              ; 80 FF | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $FF              ; 80 FF | Branch always
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    BEQ $E0              ; F0 E0 | Game work RAM access
    BEQ $74              ; F0 74 | Branch if equal
    INC $A6              ; E6 A6 | Increment (zero page)
    SED                  ; F8 | Set decimal mode flag
    TAY                  ; A8 | Transfer accumulator to Y register
    SBC ($D1),Y          ; F1 D1 | Subtract with carry ((zero page),Y)
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA $07FF,Y          ; 19 FF 07 | Logical OR with accumulator (absolute,Y)
    ASL $03FF            ; 0E FF 03 | Arithmetic shift left (absolute)
    SBC ($E0,X)          ; E1 E0 | Game work RAM access
    JMP $37BFBF          ; 5C BF BF 37 | Jump to address long
    ASL $E0FF,X          ; 1E FF E0 | Game work RAM access
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    INY                  ; C8 | Increment Y register
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BRA $FF              ; 80 FF | Branch always
    SED                  ; F8 | Set decimal mode flag
    INX                  ; E8 | Increment X register
    SBC $F2D9,Y          ; F9 D9 F2 | Subtract with carry (absolute,Y)
    SEP #$E2             ; E2 E2 | Set processor status bits
    SBC ($FD),Y          ; F1 FD | Subtract with carry ((zero page),Y)
    BEQ $10              ; F0 10 | Branch if equal
    ROR $F4              ; 66 F4 | Rotate right (zero page)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0F5
; Address: $EBC5F4
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0F5:
    ORA $1DFF            ; 0D FF 1D | Logical OR with accumulator (absolute)
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    PHA                  ; 48 | Push accumulator to stack
    LDA $353FA7          ; AF A7 3F 35 | Load from absolute long address into accumulator
    SED                  ; F8 | Set decimal mode flag
    AND $7F3D,X          ; 3D 3D 7F | Logical AND with accumulator (absolute,X)
    PHA                  ; 48 | Push accumulator to stack
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BCS $FF              ; B0 FF | Branch if carry set
    BVC $FF              ; 50 FF | Branch if overflow clear
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    REP #$FF             ; C2 FF | Reset processor status bits
    BRA $FF              ; 80 FF | Branch always
    PEA #$F4B4           ; F4 B4 F4 | Push effective address to stack
    LDY $F8              ; A4 F8 | Load from zero page into Y register
    CLD                  ; D8 | Clear decimal mode flag
    SBC ($71),Y          ; F1 71 | Subtract with carry ((zero page),Y)
    REP #$42             ; C2 42 | Hardware register operation
    BEQ $C0              ; F0 C0 | Branch if equal
    LDY $A2F2,X          ; BC F2 A2 | Load from absolute,X into Y register
    ASL $3DFF            ; 0E FF 3D | Arithmetic shift left (absolute)
    ORA $4BFF            ; 0D FF 4B | Logical OR with accumulator (absolute)
    PHA                  ; 48 | Push accumulator to stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0F6
; Address: $EBC646
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0F6:
    STA $5B5F8C          ; 8F 8C 5F 5B | Store accumulator to absolute long address
    LDA                  ; BF 9C FF F7 | Load from absolute long,X into accumulator
    ROR $B472,X          ; 7E 72 B4 | Rotate right (absolute,X)
    BCC $FF              ; 90 FF | Branch if carry clear
    BEQ $FF              ; F0 FF | Branch if equal
    BVS $FF              ; 70 FF | Branch if overflow set
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    SBC $FC              ; E5 FC | Subtract with carry (zero page)
    LDY $C1F1,X          ; BC F1 C1 | Load from absolute,X into Y register
    SEP #$62             ; E2 62 | Set processor status bits
    SBC ($71),Y          ; F1 71 | Subtract with carry ((zero page),Y)
    CPY $C4              ; C4 C4 | Compare Y register (zero page)
    SED                  ; F8 | Set decimal mode flag
    CLI                  ; 58 | Clear interrupt disable flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $1DFF            ; 0E FF 1D | Arithmetic shift left (absolute)
    ASL $3BFF            ; 0E FF 3B | Arithmetic shift left (absolute)
    SBC $3F              ; E5 3F | Subtract with carry (zero page)
    LDA $6F7F,Y          ; B9 7F 6F | Load from absolute,Y into accumulator
    LDA $091BA4          ; AF A4 1B 09 | Load from absolute long address into accumulator
    INC $05              ; E6 05 | Increment (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0F7
; Address: $EBC696
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0F7:
    BRA $FF              ; 80 FF | Branch always
    BVC $FF              ; 50 FF | Branch if overflow clear
    CPX $FF              ; E4 FF | Compare X register (zero page)
    CLC                  ; 18 | Clear carry flag
    PLX                  ; FA | Pull X register from stack
    BIT $56FE            ; 2C FE 56 | Test bits in accumulator (absolute)
    SBC $FCCD,X          ; FD CD FC | Subtract with carry (absolute,X)
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    LDX $3F              ; A6 3F | Load from zero page into X register
    AND $252F            ; 2D 2F 25 | Logical AND with accumulator (absolute)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    EOR $0059,Y          ; 59 59 00 | Exclusive OR with accumulator (absolute,Y)
    BRA $FF              ; 80 FF | Branch always
    CLI                  ; 58 | Clear interrupt disable flag
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BNE $FF              ; D0 FF | Branch if not equal
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    PLX                  ; FA | Pull X register from stack
    LDX $FF              ; A6 FF | Load from zero page into X register
    PHX                  ; DA | Push X register to stack
    INC $FCE2,X          ; FE E2 FC | Increment (absolute,X)
    JMP $F99FFF          ; 5C FF 9F F9 | Jump to address long
    ADC ($66),Y          ; 71 66 | Add with carry ((zero page),Y)
    ROR $D0              ; 66 D0 | Rotate right (zero page)
    BNE $00              ; D0 00 | Branch if not equal
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    STA $2FFF,Y          ; 99 FF 2F | Store accumulator to absolute,Y
    JMP $2F333F          ; 5C 3F 33 2F | Jump to address long
    ROL                  ; 2A | Rotate left (accumulator)
    ADC $8E9F            ; 6D 9F 8E | Add with carry (absolute)
    BRA $FF              ; 80 FF | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BNE $FF              ; D0 FF | Branch if not equal
    BCC $FF              ; 90 FF | Branch if carry clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0F8
; Address: $EBC71C
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0F8:
    DEY                  ; 88 | Decrement Y register
    INC $64FE,X          ; FE FE 64 | Increment (absolute,X)
    SBC $F8B5,X          ; FD B5 F8 | Subtract with carry (absolute,X)
    PHX                  ; DA | Push X register to stack
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    ROL                  ; 2A | Rotate left (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    ORA $D5FF            ; 0D FF D5 | Logical OR with accumulator (absolute)
    BCS $FF              ; B0 FF | Branch if carry set

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0F9
; Address: $EBC743
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0F9:
    SBC #$3F             ; E9 3F | Subtract with carry (immediate)
    PLY                  ; 7A | Pull Y register from stack
    AND ($21,X)          ; 21 21 | PPU graphics register access
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BNE $FF              ; D0 FF | Branch if not equal
    BRA $FF              ; 80 FF | Branch always
    PLA                  ; 68 | Pull accumulator from stack
    DEC $FFFF,X          ; DE FF FF | Decrement (absolute,X)
    STA $ECFC,Y          ; 99 FC EC | Store accumulator to absolute,Y
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    INC $F8BE,X          ; FE BE F8 | Increment (absolute,X)
    LDY #$EC             ; A0 EC | Load immediate value into Y register
    JMP ($A1A1)          ; 6C A1 A1 | Jump to address (absolute indirect)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    LSR $FFFF,X          ; 5E FF FF | Logical shift right (absolute,X)
    SBC $3F98,Y          ; F9 98 3F | Subtract with carry (absolute,Y)
    JMP ($AFAF)          ; 6C AF AF | Jump to address (absolute indirect)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ADC ($61,X)          ; 61 61 | Add with carry ((zero page,X))
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BRA $FF              ; 80 FF | Branch always
    BVC $FF              ; 50 FF | Branch if overflow clear
    INX                  ; E8 | Increment X register
    BEQ $FF              ; F0 FF | Branch if equal
    STZ $FFFF,X          ; 9E FF FF | Store zero to absolute,X
    INC $FE6E,X          ; FE 6E FE | Increment (absolute,X)
    INC $F5F1,X          ; FE F1 F5 | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    CPX $E4              ; E4 E4 | Compare X register (zero page)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    LDA                  ; BF 97 2F 25 | Load from absolute long,X into accumulator
    CLD                  ; D8 | Clear decimal mode flag
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ORA $0019,Y          ; 19 19 00 | Logical OR with accumulator (absolute,Y)
    TYA                  ; 98 | Transfer Y register to accumulator
    BRA $FF              ; 80 FF | Branch always
    RTI                  ; 40 | Return from interrupt
    BNE $FF              ; D0 FF | Branch if not equal

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0FA
; Address: $EBC7DA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0FA:
    JSR $FAFF            ; 20 FF FA | Jump to subroutine
    INC $FF              ; E6 FF | Increment (zero page)
    INC $FCAA,X          ; FE AA FC | Increment (absolute,X)
    SBC $CA7D,X          ; FD 7D CA | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0FB
; Address: $EBC7E9
; Size: 116 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0FB:
    LSR                  ; 4A | Logical shift right (accumulator)
    SED                  ; F8 | Set decimal mode flag
    INY                  ; C8 | Increment Y register
    CPX $D2AC            ; EC AC D2 | Compare X register (absolute)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    AND $FFFF            ; 2D FF FF | Logical AND with accumulator (absolute)
    LDA                  ; BF BC 4F 4B | Load from absolute long,X into accumulator
    LDA                  ; BF BC CF CF | Load from absolute long,X into accumulator
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BCS $FF              ; B0 FF | Branch if carry set
    RTI                  ; 40 | Return from interrupt
    BMI $FF              ; 30 FF | Branch if negative
    NOP                  ; EA | No operation
    INC $FDB2,X          ; FE B2 FD | Increment (absolute,X)
    CMP $7EFE            ; CD FE 7E | Compare accumulator (absolute)
    SBC $CC79,Y          ; F9 79 CC | Subtract with carry (absolute,Y)
    CPY $93F3            ; CC F3 93 | Compare Y register (absolute)
    TAY                  ; A8 | Transfer accumulator to Y register
    PLP                  ; 28 | Pull processor status from stack
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    NOP                  ; EA | No operation
    SBC $737F            ; ED 7F 73 | Subtract with carry (absolute)
    DEC $3DFF,X          ; DE FF 3D | Decrement (absolute,X)
    INC $D3F9            ; EE F9 D3 | Increment (absolute)
    XBA                  ; EB | Exchange accumulator bytes
    STA                  ; 9F FE F5 FF | Store accumulator to absolute long,X
    ROL                  ; 2A | Rotate left (accumulator)
    SEI                  ; 78 | Set interrupt disable flag
    PLX                  ; FA | Pull X register from stack
    ORA $6EFF,Y          ; 19 FF 6E | Logical OR with accumulator (absolute,Y)
    STA                  ; 9F FE F5 FF | Store accumulator to absolute long,X
    CMP $FDFF            ; CD FF FD | Compare accumulator (absolute)
    ROR $B7E7,X          ; 7E E7 B7 | Rotate right (absolute,X)
    PLB                  ; AB | Pull data bank register from stack
    LDA                  ; BF E5 FF FF | Load from absolute long,X into accumulator
    LDX $FF              ; A6 FF | Load from zero page into X register
    ADC $FBFF            ; 6D FF FB | Add with carry (absolute)
    STA                  ; 9F FB FF CC | Store accumulator to absolute long,X
    PLB                  ; AB | Pull data bank register from stack
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    SBC $3BFF            ; ED FF 3B | Subtract with carry (absolute)
    LDA $76FF,Y          ; B9 FF 76 | Load from absolute,Y into accumulator
    CMP ($FF),Y          ; D1 FF | Compare accumulator ((zero page),Y)
    LDA $FF19FF          ; AF FF 19 FF | Load from absolute long address into accumulator
    INC $9DDF,X          ; FE DF 9D | Increment (absolute,X)
    SBC $FF              ; E5 FF | Subtract with carry (zero page)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0FC
; Address: $EBC90C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0FC:
    DEC $7BFF            ; CE FF 7B | Decrement (absolute)
    CMP $963F            ; CD 3F 96 | Compare accumulator (absolute)
    EOR $36FF,Y          ; 59 FF 36 | Exclusive OR with accumulator (absolute,Y)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0FD
; Address: $EBC946
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0FD:
    LDA                  ; BF FF 7F CF | Load from absolute long,X into accumulator
    SED                  ; F8 | Set decimal mode flag
    CMP $FFFF,Y          ; D9 FF FF | Compare accumulator (absolute,Y)
    SEI                  ; 78 | Set interrupt disable flag
    STA                  ; 9F D7 FF 35 | Store accumulator to absolute long,X
    PLX                  ; FA | Pull X register from stack
    SBC $FFFF,Y          ; F9 FF FF | Subtract with carry (absolute,Y)
    CMP $D5FF,X          ; DD FF D5 | Compare accumulator (absolute,X)
    XBA                  ; EB | Exchange accumulator bytes
    ROR $BEFF,X          ; 7E FF BE | Rotate right (absolute,X)
    CMP $B5FF            ; CD FF B5 | Compare accumulator (absolute)
    ORA $EAFF,X          ; 1D FF EA | Logical OR with accumulator (absolute,X)
    PLB                  ; AB | Pull data bank register from stack
    LDA                  ; BF E7 FF FF | Load from absolute long,X into accumulator
    CMP $73FF            ; CD FF 73 | Compare accumulator (absolute)
    LDX $7EFF,Y          ; BE FF 7E | Load from absolute,Y into X register
    AND ($FF),Y          ; 31 FF | Logical AND with accumulator ((zero page),Y)
    NOP                  ; EA | No operation
    AND $CFFF            ; 2D FF CF | Logical AND with accumulator (absolute)
    SBC $FFFF,Y          ; F9 FF FF | Subtract with carry (absolute,Y)
    ROL $DDFF,X          ; 3E FF DD | Rotate left (absolute,X)
    DEC                  ; 3A | Decrement accumulator
    CPX $CFFF            ; EC FF CF | Compare X register (absolute)
    NOP                  ; EA | No operation
    BRA $ED              ; 80 ED | Branch always
    DEC $3D00,X          ; DE 00 3D | Decrement (absolute,X)
    ASL $EE              ; 06 EE | Arithmetic shift left (zero page)
    XBA                  ; EB | Exchange accumulator bytes
    BPL $B6              ; 10 B6 | Branch if positive
    ORA ($9F,X)          ; 01 9F | Logical OR with accumulator ((zero page,X))
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0FE
; Address: $EBCA2A
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0FE:
    JSR $00B7            ; 20 B7 00 | Jump to subroutine
    SEI                  ; 78 | Set interrupt disable flag
    CPY #$FC             ; C0 FC | Compare Y register (immediate)
    PLX                  ; FA | Pull X register from stack
    ORA $6E00,Y          ; 19 00 6E | Logical OR with accumulator (absolute,Y)
    ORA ($9F,X)          ; 01 9F | Logical OR with accumulator ((zero page,X))
    CMP $FD00            ; CD 00 FD | Compare accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    ROR $B700,X          ; 7E 00 B7 | Rotate right (absolute,X)
    PLB                  ; AB | Pull data bank register from stack
    RTI                  ; 40 | Return from interrupt
    SBC $FF              ; E5 FF | Subtract with carry (zero page)
    LDX $00              ; A6 00 | Load from zero page into X register
    ADC $FB60            ; 6D 60 FB | Add with carry (absolute)
    CPY $B700            ; CC 00 B7 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_0FF
; Address: $EBCA8E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_0FF:
    ORA ($AB,X)          ; 01 AB | Logical OR with accumulator ((zero page,X))
    SBC $3B00            ; ED 00 3B | Subtract with carry (absolute)
    PHP                  ; 08 | Push processor status to stack
    LDA $7600,Y          ; B9 00 76 | Load from absolute,Y into accumulator
    CMP ($80),Y          ; D1 80 | Compare accumulator ((zero page),Y)
    LDA $001900          ; AF 00 19 00 | Load from absolute long address into accumulator

;------------------------------------------------------------------------------
; Bank56_DmaFunction_100
; Address: $EBCAC6
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_100:
    JSR $00FE            ; 20 FE 00 | Jump to subroutine
    STA $E500,X          ; 9D 00 E5 | Store accumulator to absolute,X
    DEC $7B00            ; CE 00 7B | Decrement (absolute)
    CPY #$CD             ; C0 CD | Compare Y register (immediate)
    EOR $3600,Y          ; 59 00 36 | Exclusive OR with accumulator (absolute,Y)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank56_DmaFunction_101
; Address: $EBCB07
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_101:
    LDA                  ; BF 30 7F 00 | Load from absolute long,X into accumulator
    SED                  ; F8 | Set decimal mode flag
    CMP $FFFF,Y          ; D9 FF FF | Compare accumulator (absolute,Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_102
; Address: $EBCB23
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_102:
    SEI                  ; 78 | Set interrupt disable flag
    PLX                  ; FA | Pull X register from stack
    BPL $FF              ; 10 FF | Branch if positive
    SBC $FFFF,Y          ; F9 FF FF | Subtract with carry (absolute,Y)
    CMP $D500,X          ; DD 00 D5 | Compare accumulator (absolute,X)
    XBA                  ; EB | Exchange accumulator bytes
    ROR $BE0C,X          ; 7E 0C BE | Rotate right (absolute,X)
    CMP $B500            ; CD 00 B5 | Compare accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    ORA $EA00,X          ; 1D 00 EA | Logical OR with accumulator (absolute,X)
    PLB                  ; AB | Pull data bank register from stack
    RTI                  ; 40 | Return from interrupt
    CMP $7300            ; CD 00 73 | Compare accumulator (absolute)
    LDX $7E00,Y          ; BE 00 7E | Load from absolute,Y into X register
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    NOP                  ; EA | No operation
    AND $CF06            ; 2D 06 CF | Logical AND with accumulator (absolute)
    ROL $DD00,X          ; 3E 00 DD | Rotate left (absolute,X)
    DEC                  ; 3A | Decrement accumulator
    CPX $CF80            ; EC 80 CF | Compare X register (absolute)
    STZ $6900            ; 9C 00 69 | Store zero to absolute
    STY $0000            ; 8C 00 00 | Store Y register to absolute address
    STA $6200,X          ; 9D 00 62 | Store accumulator to absolute,X
    SBC $4600,Y          ; F9 00 46 | Subtract with carry (absolute,Y)
    LSR $A100,X          ; 5E 00 A1 | Logical shift right (absolute,X)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_103
; Address: $EBCC44
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_103:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    PLA                  ; 68 | Pull accumulator from stack
    CPY $6D35            ; CC 35 6D | Compare Y register (absolute)
    STA                  ; 9F BE 06 65 | Store accumulator to absolute long,X
    STA                  ; 9F 00 06 00 | Store accumulator to absolute long,X
    LDA $E11D,Y          ; B9 1D E1 | Load from absolute,Y into accumulator
    SBC $73FB            ; ED FB 73 | Subtract with carry (absolute)
    ASL $008D,X          ; 1E 8D 00 | Arithmetic shift left (absolute,X)
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_104
; Address: $EBCCC0
; Size: 118 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_104:
    CPY $6D35            ; CC 35 6D | Compare Y register (absolute)
    STA                  ; 9F AF 06 1A | Store accumulator to absolute long,X
    STA                  ; 9F 00 06 00 | Store accumulator to absolute long,X
    LDA $E11D,Y          ; B9 1D E1 | Load from absolute,Y into accumulator
    SBC $73FB            ; ED FB 73 | Subtract with carry (absolute)
    ASL $004A,X          ; 1E 4A 00 | Arithmetic shift left (absolute,X)
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    CPY $6D35            ; CC 35 6D | Compare Y register (absolute)
    STA                  ; 9F 56 06 AD | Store accumulator to absolute long,X
    STA                  ; 9F 00 06 00 | Store accumulator to absolute long,X
    LDA $E11D,Y          ; B9 1D E1 | Load from absolute,Y into accumulator
    SBC $73FB            ; ED FB 73 | Subtract with carry (absolute)
    ASL $0033,X          ; 1E 33 00 | Arithmetic shift left (absolute,X)
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $0A              ; 05 0A | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $0B              ; 06 0B | Arithmetic shift left (zero page)
    ORA #$02             ; 09 02 | Logical OR with accumulator (immediate)
    ORA #$18             ; 09 18 | Logical OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA $0A              ; 05 0A | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $0B              ; 06 0B | Arithmetic shift left (zero page)
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    ORA #$08             ; 09 08 | Logical OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    ASL $13              ; 06 13 | Arithmetic shift left (zero page)
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    ORA #$18             ; 09 18 | Logical OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $9A71            ; 0E 71 9A | Arithmetic shift left (absolute)
    BIT $08              ; 24 08 | Test bits in accumulator (zero page)
    ROL $52              ; 26 52 | Rotate left (zero page)
    ASL $041F            ; 0E 1F 04 | Arithmetic shift left (absolute)
    AND $0C01            ; 2D 01 0C | Logical AND with accumulator (absolute)
    ROR $3E01,X          ; 7E 01 3E | Rotate right (absolute,X)
    ASL $1A71            ; 0E 71 1A | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_105
; Address: $EBCDC3
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_105:
    BIT $08              ; 24 08 | Test bits in accumulator (zero page)
    ROL $52              ; 26 52 | Rotate left (zero page)
    ASL $045F            ; 0E 5F 04 | Arithmetic shift left (absolute)
    AND $0C21            ; 2D 21 0C | Logical AND with accumulator (absolute)
    ROR $3E01,X          ; 7E 01 3E | Rotate right (absolute,X)
    STX $1A71            ; 8E 71 1A | Store X register to absolute address
    BIT $08              ; 24 08 | Test bits in accumulator (zero page)
    ROL $12              ; 26 12 | Rotate left (zero page)
    ASL $041F            ; 0E 1F 04 | Arithmetic shift left (absolute)
    AND $0C21            ; 2D 21 0C | Logical AND with accumulator (absolute)
    ROR $3E01,X          ; 7E 01 3E | Rotate right (absolute,X)
    BIT $1505            ; 2C 05 15 | Test bits in accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $25              ; 05 25 | Logical OR with accumulator (zero page)
    INC                  ; 1A | Increment accumulator
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    BIT $1505            ; 2C 05 15 | Test bits in accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC                  ; 1A | Increment accumulator
    ROL $02              ; 26 02 | Rotate left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $13              ; 05 13 | Logical OR with accumulator (zero page)
    ORA $11              ; 05 11 | Logical OR with accumulator (zero page)
    ORA #$03             ; 09 03 | Logical OR with accumulator (immediate)
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ORA $0201            ; 0D 01 02 | Logical OR with accumulator (absolute)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $0B              ; 05 0B | Logical OR with accumulator (zero page)
    ORA $11              ; 05 11 | Logical OR with accumulator (zero page)
    ORA #$03             ; 09 03 | Logical OR with accumulator (immediate)
    ORA #$03             ; 09 03 | Logical OR with accumulator (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $13              ; 05 13 | Logical OR with accumulator (zero page)
    ORA $09              ; 05 09 | Logical OR with accumulator (zero page)
    ORA #$03             ; 09 03 | Logical OR with accumulator (immediate)
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    CPY $AE              ; C4 AE | Compare Y register (zero page)
    LDY #$74             ; A0 74 | Load immediate value into Y register
    STX $F0              ; 86 F0 | Store X register to zero page
    BNE $EE              ; D0 EE | Branch if not equal
    PLP                  ; 28 | Pull processor status from stack
    STA $53F4,Y          ; 99 F4 53 | Store accumulator to absolute,Y

;------------------------------------------------------------------------------
; Bank56_DmaFunction_107
; Address: $EBCED2
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_107:
    JSR $10DC            ; 20 DC 10 | Jump to subroutine
    INC $FE00            ; EE 00 FE | Increment (absolute)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    BEQ $18              ; F0 18 | Branch if equal
    CPY $AE              ; C4 AE | Compare Y register (zero page)
    LDY #$74             ; A0 74 | Load immediate value into Y register
    BEQ $D0              ; F0 D0 | Branch if equal
    INC $F628            ; EE 28 F6 | Increment (absolute)
    STA $56F4,Y          ; 99 F4 56 | Store accumulator to absolute,Y
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank56_DmaFunction_108
; Address: $EBCEF2
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_108:
    JSR $10DC            ; 20 DC 10 | Jump to subroutine
    INC $FE00            ; EE 00 FE | Increment (absolute)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    BEQ $18              ; F0 18 | Branch if equal
    CPY $AC              ; C4 AC | Compare Y register (zero page)
    LDY #$74             ; A0 74 | Load immediate value into Y register
    STX $F0              ; 86 F0 | Store X register to zero page
    CMP ($EE),Y          ; D1 EE | Compare accumulator ((zero page),Y)
    AND #$F6             ; 29 F6 | Logical AND with accumulator (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    PEA #$F050           ; F4 50 F0 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank56_DmaFunction_109
; Address: $EBCF12
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_109:
    JSR $10DC            ; 20 DC 10 | Jump to subroutine
    INC $FE00            ; EE 00 FE | Increment (absolute)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    BEQ $00              ; F0 00 | Branch if equal
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    ORA $050B            ; 0D 0B 05 | Logical OR with accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    ORA $0D0B,X          ; 1D 0B 0D | Logical OR with accumulator (absolute,X)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    ORA $150B            ; 0D 0B 15 | Logical OR with accumulator (absolute)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    NOP                  ; EA | No operation
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_10A
; Address: $EBCF82
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_10A:
    INY                  ; C8 | Increment Y register
    RTI                  ; 40 | Return from interrupt
    BNE $40              ; D0 40 | Branch if not equal
    CPX #$40             ; E0 40 | Compare X register (immediate)
    LDY #$80             ; A0 80 | Load immediate value into Y register
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_10B
; Address: $EBCF93
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_10B:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPX $60              ; E4 60 | Compare X register (zero page)
    BNE $40              ; D0 40 | Branch if not equal
    CPX #$40             ; E0 40 | Compare X register (immediate)
    BNE $40              ; D0 40 | Branch if not equal
    LDY #$80             ; A0 80 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_10C
; Address: $EBCFB1
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_10C:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPX $60              ; E4 60 | Compare X register (zero page)
    BNE $40              ; D0 40 | Branch if not equal
    INX                  ; E8 | Increment X register
    RTI                  ; 40 | Return from interrupt
    CPX #$40             ; E0 40 | Compare X register (immediate)
    BRA $80              ; 80 80 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    LDX #$DE             ; A2 DE | Load immediate value into X register
    LDX $DA              ; A6 DA | Load from zero page into X register
    BIT $3818            ; 2C 18 38 | Test bits in accumulator (absolute)
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
    LDX #$DE             ; A2 DE | Load immediate value into X register
    LDX $DA              ; A6 DA | Load from zero page into X register
    ROL                  ; 2A | Rotate left (accumulator)
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    BNE $9C              ; D0 9C | Branch if not equal
    PLY                  ; 7A | Pull Y register from stack
    BCS $CC              ; B0 CC | Branch if carry set
    ROR $7E00,X          ; 7E 00 7E | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_10D
; Address: $EBD014
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_10D:
    BRA $7C              ; 80 7C | Branch always
    BRA $78              ; 80 78 | Branch always
    BRA $78              ; 80 78 | Branch always
    BPL $6C              ; 10 6C | Branch if positive
    DEY                  ; 88 | Decrement Y register
    ROL $C2FE,X          ; 3E FE C2 | Rotate left (absolute,X)
    CPY #$B0             ; C0 B0 | Compare Y register (immediate)
    BRA $2A              ; 80 2A | Branch always
    BRA $00              ; 80 00 | Branch always
    INC $C000,X          ; FE 00 C0 | Increment (absolute,X)
    BRA $00              ; 80 00 | Branch always
    XBA                  ; EB | Exchange accumulator bytes
    ADC #$01             ; 69 01 | Add with carry (immediate)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC $C0C4,X          ; FE C4 C0 | Increment (absolute,X)
    TXS                  ; 9A | Transfer X register to stack pointer
    BRA $50              ; 80 50 | Branch always
    INC $C000,X          ; FE 00 C0 | Increment (absolute,X)
    BRA $00              ; 80 00 | Branch always
    XBA                  ; EB | Exchange accumulator bytes
    ORA $8D01,Y          ; 19 01 8D | Logical OR with accumulator (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC $C0C2,X          ; FE C2 C0 | Increment (absolute,X)
    STA $6080            ; 8D 80 60 | Store accumulator to absolute address
    BRA $00              ; 80 00 | Branch always
    INC $C000,X          ; FE 00 C0 | Increment (absolute,X)
    BRA $00              ; 80 00 | Branch always
    XBA                  ; EB | Exchange accumulator bytes
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    STZ $9C              ; 64 9C | Store zero to zero page
    DEX                  ; CA | Decrement X register
    DEC $512C            ; CE 2C 51 | Decrement (absolute)
    INY                  ; C8 | Increment Y register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SBC $0C              ; E5 0C | Subtract with carry (zero page)
    CPX $9C              ; E4 9C | Compare X register (zero page)
    BRA $1C              ; 80 1C | Branch always
    PHP                  ; 08 | Push processor status to stack
    BRA $7F              ; 80 7F | Branch always
    INC $7C00,X          ; FE 00 7C | Increment (absolute,X)
    PHA                  ; 48 | Push accumulator to stack
    STZ $9C              ; 64 9C | Store zero to zero page
    DEX                  ; CA | Decrement X register
    DEC $512C            ; CE 2C 51 | Decrement (absolute)
    INY                  ; C8 | Increment Y register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SBC $0D              ; E5 0D | Subtract with carry (zero page)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_10E
; Address: $EBD10E
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_10E:
    CPX $9C              ; E4 9C | Compare X register (zero page)
    BRA $1C              ; 80 1C | Branch always
    PHP                  ; 08 | Push processor status to stack
    BRA $7F              ; 80 7F | Branch always
    INC $7C00,X          ; FE 00 7C | Increment (absolute,X)
    PHA                  ; 48 | Push accumulator to stack
    STZ $9C              ; 64 9C | Store zero to zero page
    DEX                  ; CA | Decrement X register
    DEC $512C            ; CE 2C 51 | Decrement (absolute)
    INY                  ; C8 | Increment Y register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SBC $0C              ; E5 0C | Subtract with carry (zero page)
    INC $9C              ; E6 9C | Increment (zero page)
    BRA $1C              ; 80 1C | Branch always
    PHP                  ; 08 | Push processor status to stack
    BRA $7F              ; 80 7F | Branch always
    INC $7C00,X          ; FE 00 7C | Increment (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    ROR $7A22,X          ; 7E 22 7A | Rotate right (absolute,X)
    SBC $7D33,Y          ; F9 33 7D | Subtract with carry (absolute,Y)
    LDX $5206,Y          ; BE 06 52 | Load from absolute,Y into X register
    BPL $48              ; 10 48 | Branch if positive
    STA ($58,X)          ; 81 58 | Store accumulator to (zero page,X)
    STY $59              ; 84 59 | Store Y register to zero page
    AND $3F80,X          ; 3D 80 3F | Logical AND with accumulator (absolute,X)
    STA                  ; 9F 00 06 00 | Store accumulator to absolute long,X
    BPL $77              ; 10 77 | Branch if positive
    ORA $ED              ; 05 ED | Logical OR with accumulator (zero page)
    PLX                  ; FA | Pull X register from stack
    SEP #$F5             ; E2 F5 | Set processor status bits
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    ASL $009A,X          ; 1E 9A 00 | Arithmetic shift left (absolute,X)
    DEY                  ; 88 | Decrement Y register
    ROL $10              ; 26 10 | Rotate left (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    ROR $7A22,X          ; 7E 22 7A | Rotate right (absolute,X)
    SBC $7D33,Y          ; F9 33 7D | Subtract with carry (absolute,Y)
    ASL $AC              ; 06 AC | Arithmetic shift left (zero page)
    BPL $48              ; 10 48 | Branch if positive
    STA ($58,X)          ; 81 58 | Store accumulator to (zero page,X)
    STY $59              ; 84 59 | Store Y register to zero page
    AND $3F80,X          ; 3D 80 3F | Logical AND with accumulator (absolute,X)
    STA                  ; 9F 00 06 00 | Store accumulator to absolute long,X
    BPL $77              ; 10 77 | Branch if positive
    ORA $ED              ; 05 ED | Logical OR with accumulator (zero page)
    PLX                  ; FA | Pull X register from stack
    SEP #$F5             ; E2 F5 | Set processor status bits
    LDA #$FF             ; A9 FF | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank56_DmaFunction_10F
; Address: $EBD1AD
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_10F:
    ASL $0064,X          ; 1E 64 00 | Arithmetic shift left (absolute,X)
    DEY                  ; 88 | Decrement Y register
    ROL $10              ; 26 10 | Rotate left (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    ROR $7A22,X          ; 7E 22 7A | Rotate right (absolute,X)
    SBC $7D33,Y          ; F9 33 7D | Subtract with carry (absolute,Y)
    ROL $D306            ; 2E 06 D3 | Rotate left (absolute)
    BPL $48              ; 10 48 | Branch if positive
    STA ($58,X)          ; 81 58 | Store accumulator to (zero page,X)
    STY $59              ; 84 59 | Store Y register to zero page
    AND $3F80,X          ; 3D 80 3F | Logical AND with accumulator (absolute,X)
    STA                  ; 9F 00 06 00 | Store accumulator to absolute long,X
    BPL $77              ; 10 77 | Branch if positive
    ORA $ED              ; 05 ED | Logical OR with accumulator (zero page)
    PLX                  ; FA | Pull X register from stack
    SEP #$F5             ; E2 F5 | Set processor status bits
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    ASL $001B,X          ; 1E 1B 00 | Arithmetic shift left (absolute,X)
    DEY                  ; 88 | Decrement Y register
    ROL $10              ; 26 10 | Rotate left (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    BIT $380E            ; 2C 0E 38 | Test bits in accumulator (absolute)
    EOR ($37,X)          ; 41 37 | Exclusive OR with accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register
    INC                  ; 1A | Increment accumulator
    ADC $05              ; 65 05 | Add with carry (zero page)
    INC $3C64,X          ; FE 64 3C | Increment (absolute,X)
    JMP $D6283C          ; 5C 3C 28 D6 | Jump to address long
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    BIT $380E            ; 2C 0E 38 | Test bits in accumulator (absolute)
    EOR ($37,X)          ; 41 37 | Exclusive OR with accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register
    INC                  ; 1A | Increment accumulator
    ADC $04              ; 65 04 | Add with carry (zero page)
    INC $3C64,X          ; FE 64 3C | Increment (absolute,X)
    LSR $283C,X          ; 5E 3C 28 | Logical shift right (absolute,X)
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    BIT $380E            ; 2C 0E 38 | Test bits in accumulator (absolute)
    EOR ($37,X)          ; 41 37 | Exclusive OR with accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register
    INC                  ; 1A | Increment accumulator
    ADC $04              ; 65 04 | Add with carry (zero page)
    INC $3C66,X          ; FE 66 3C | Increment (absolute,X)
    JMP $D6283C          ; 5C 3C 28 D6 | Jump to address long

;------------------------------------------------------------------------------
; Bank56_DmaFunction_110
; Address: $EBD25B
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_110:
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    CPX $10E1            ; EC E1 10 | Compare X register (absolute)
    BCC $01              ; 90 01 | Branch if carry clear
    LDY #$04             ; A0 04 | Load immediate value into Y register
    CPY #$38             ; C0 38 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($F0,X)          ; 01 F0 | Logical OR with accumulator ((zero page,X))
    BEQ $01              ; F0 01 | Branch if equal
    CPX #$04             ; E0 04 | Compare X register (immediate)
    CPY #$38             ; C0 38 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    INC                  ; 1A | Increment accumulator
    BRA $0D              ; 80 0D | Branch always

;------------------------------------------------------------------------------
; Bank56_DmaFunction_111
; Address: $EBD287
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_111:
    JSR $0003            ; 20 03 00 | Jump to subroutine
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    BPL $38              ; 10 38 | Branch if positive
    BRA $14              ; 80 14 | Branch always

;------------------------------------------------------------------------------
; Bank56_DmaFunction_113
; Address: $EBD297
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_113:
    JSR $0003            ; 20 03 00 | Jump to subroutine
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    BPL $EC              ; 10 EC | Branch if positive
    CPX #$10             ; E0 10 | Compare X register (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    BRA $40              ; 80 40 | Branch always
    BEQ $04              ; F0 04 | Branch if equal
    BEQ $03              ; F0 03 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    BRA $40              ; 80 40 | Branch always
    INC                  ; 1A | Increment accumulator
    ORA $0360            ; 0D 60 03 | Logical OR with accumulator (absolute)
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    CPY #$14             ; C0 14 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_114
; Address: $EBD2DA
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_114:
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    CPX $10E3            ; EC E3 10 | Compare X register (absolute)
    BCC $01              ; 90 01 | Branch if carry clear
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CPY #$08             ; C0 08 | Compare Y register (immediate)
    BRA $40              ; 80 40 | Branch always
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank56_DmaFunction_115
; Address: $EBD2F2
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_115:
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $01              ; F0 01 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$08             ; C0 08 | Compare Y register (immediate)
    BRA $40              ; 80 40 | Branch always
    PHA                  ; 48 | Push accumulator to stack
    INC                  ; 1A | Increment accumulator
    BRA $0D              ; 80 0D | Branch always
    BMI $01              ; 30 01 | Branch if negative
    INC                  ; 1A | Increment accumulator
    SEC                  ; 38 | Set carry flag
    BRA $0F              ; 80 0F | Branch always
    BMI $01              ; 30 01 | Branch if negative
    INC                  ; 1A | Increment accumulator
    BVC $F0              ; 50 F0 | Branch if overflow clear
    DEC $75F0,X          ; DE F0 75 | Decrement (absolute,X)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA #$50             ; 09 50 | Logical OR with accumulator (immediate)
    BEQ $DE              ; F0 DE | Branch if equal
    BEQ $F5              ; F0 F5 | Branch if equal
    ORA $0001,Y          ; 19 01 00 | Logical OR with accumulator (absolute,Y)
    ORA ($50,X)          ; 01 50 | Logical OR with accumulator ((zero page,X))
    BEQ $DE              ; F0 DE | Branch if equal
    BEQ $75              ; F0 75 | Branch if equal
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($D9,X)          ; 01 D9 | Logical OR with accumulator ((zero page,X))
    BEQ $90              ; F0 90 | Branch if equal
    INC $F8EE,X          ; FE EE F8 | Increment (absolute,X)
    INY                  ; C8 | Increment Y register
    STZ $0009            ; 9C 09 00 | Store zero to absolute
    ASL $1806,X          ; 1E 06 18 | Arithmetic shift left (absolute,X)
    BIT $EC04            ; 2C 04 EC | Test bits in accumulator (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    SBC ($E1,X)          ; E1 E1 | Subtract with carry ((zero page,X))
    CPX $7804            ; EC 04 78 | Compare X register (absolute)
    SBC ($01,X)          ; E1 01 | Subtract with carry ((zero page,X))
    CMP $F777,Y          ; D9 77 F7 | Compare accumulator (absolute,Y)
    SBC ($21),Y          ; F1 21 | PPU graphics register access
    SED                  ; F8 | Set decimal mode flag
    TYA                  ; 98 | Transfer Y register to accumulator
    CMP $FCA5,X          ; DD A5 FC | Compare accumulator (absolute,X)
    CPX $CBFB            ; EC FB CB | Compare X register (absolute)
    SED                  ; F8 | Set decimal mode flag
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank56_DmaFunction_116
; Address: $EBD3D8
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_116:
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    PLP                  ; 28 | Pull processor status from stack
    NOP                  ; EA | No operation
    PLX                  ; FA | Pull X register from stack
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    SEP #$E2             ; E2 E2 | Set processor status bits
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    BRA $80              ; 80 80 | Branch always
    NOP                  ; EA | No operation
    SEI                  ; 78 | Set interrupt disable flag
    SEP #$02             ; E2 02 | Set processor status bits
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    BRA $80              ; 80 80 | Branch always
    CMP $F777,Y          ; D9 77 F7 | Compare accumulator (absolute,Y)
    PEA #$F124           ; F4 24 F1 | Push effective address to stack
    STA ($DE),Y          ; 91 DE | Store accumulator to (zero page),Y
    LDX $F8              ; A6 F8 | Load from zero page into X register
    INX                  ; E8 | Increment X register
    INC $F8CE,X          ; FE CE F8 | Increment (absolute,X)
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    ASL $2806,X          ; 1E 06 28 | Arithmetic shift left (absolute,X)
    CPX $78FC            ; EC FC 78 | Compare X register (absolute)
    SED                  ; F8 | Set decimal mode flag
    CPX $E4              ; E4 E4 | Compare X register (zero page)
    CPX $7804            ; EC 04 78 | Compare X register (absolute)
    CPX $04              ; E4 04 | Compare X register (zero page)
    ORA $3A1D,X          ; 1D 1D 3A | Logical OR with accumulator (absolute,X)
    DEC                  ; 3A | Decrement accumulator
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    WDM #$42             ; 42 42 | Hardware register operation
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ADC $1D00,X          ; 7D 00 1D | Add with carry (absolute,X)
    ORA ($3A,X)          ; 01 3A | Logical OR with accumulator ((zero page,X))
    DEC                  ; 3A | Decrement accumulator
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    WDM #$42             ; 42 42 | Hardware register operation
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    STZ $659E,X          ; 9E 9E 65 | Store zero to absolute,X
    ADC $08              ; 65 08 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_117
; Address: $EBD467
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_117:
    PHP                  ; 08 | Push processor status to stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ADC $9E00,X          ; 7D 00 9E | Add with carry (absolute,X)
    ADC $65              ; 65 65 | Add with carry (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    EOR $395D,X          ; 5D 5D 39 | Exclusive OR with accumulator (absolute,X)
    AND $0606,Y          ; 39 06 06 | Logical AND with accumulator (absolute,Y)
    EOR ($41,X)          ; 41 41 | Exclusive OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ADC $5D00,X          ; 7D 00 5D | Add with carry (absolute,X)
    EOR ($39,X)          ; 41 39 | Exclusive OR with accumulator ((zero page,X))
    AND $0606,Y          ; 39 06 06 | Logical AND with accumulator (absolute,Y)
    EOR ($41,X)          ; 41 41 | Exclusive OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    BRA $7F              ; 80 7F | Branch always
    STZ $3D00            ; 9C 00 3D | Store zero to absolute
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    REP #$FF             ; C2 FF | Reset processor status bits
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    DEY                  ; 88 | Decrement Y register
    BRA $7F              ; 80 7F | Branch always
    DEC $00              ; C6 00 | Decrement (zero page)
    PEA #$1200           ; F4 00 12 | Push effective address to stack
    DEY                  ; 88 | Decrement Y register
    BRA $7F              ; 80 7F | Branch always
    JMP $0000            ; 4C 00 00 | Jump to address
    CLI                  ; 58 | Clear interrupt disable flag
    JMP $0000            ; 4C 00 00 | Jump to address
    LSR $00              ; 46 00 | Logical shift right (zero page)
    BVC $00              ; 50 00 | Branch if overflow clear
    STA ($00),Y          ; 91 00 | Store accumulator to (zero page),Y
    STX $00FF            ; 8E FF 00 | Store X register to absolute address
    STA ($00),Y          ; 91 00 | Store accumulator to (zero page),Y
    LDY #$00             ; A0 00 | Load immediate value into Y register
    INY                  ; C8 | Increment Y register
    ORA $00FF,X          ; 1D FF 00 | Logical OR with accumulator (absolute,X)
    INY                  ; C8 | Increment Y register
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    STZ $00              ; 64 00 | Store zero to zero page
    DEC                  ; 3A | Decrement accumulator
    STZ $00              ; 64 00 | Store zero to zero page
    BRA $83              ; 80 83 | Branch always

;------------------------------------------------------------------------------
; Bank56_DmaFunction_118
; Address: $EBD562
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_118:
    PHB                  ; 8B | Push data bank register to stack
    SBC ($61,X)          ; E1 61 | Subtract with carry ((zero page,X))
    STZ $E602,X          ; 9E 02 E6 | Store zero to absolute,X
    PLX                  ; FA | Pull X register from stack
    ADC ($04,X)          ; 61 04 | Add with carry ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    STZ $FD00,X          ; 9E 00 FD | Store zero to absolute,X
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    STZ $FF1C,X          ; 9E 1C FF | Store zero to absolute,X
    JMP ($DFEC)          ; 6C EC DF | Jump to address (absolute indirect)
    CPY $0032            ; CC 32 00 | Compare Y register (absolute)
    CPX $00              ; E4 00 | Compare X register (zero page)
    STX $10              ; 86 10 | Store X register to zero page
    BMI $CF              ; 30 CF | Branch if negative
    ADC $037F,Y          ; 79 7F 03 | Add with carry (absolute,Y)
    BVS $E3              ; 70 E3 | Branch if overflow set
    BRA $FD              ; 80 FD | Branch always
    STA $0320,Y          ; 99 20 03 | Store accumulator to absolute,Y
    RTI                  ; 40 | Return from interrupt
    STA $009C00          ; 8F 00 9C 00 | Store accumulator to absolute long address
    RTI                  ; 40 | Return from interrupt
    STZ $0F              ; 64 0F | Store zero to zero page
    DEY                  ; 88 | Decrement Y register
    BRA $7F              ; 80 7F | Branch always
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    ADC #$00             ; 69 00 | Add with carry (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank56_DmaFunction_119
; Address: $EBD5D8
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_119:
    JSR $0021            ; 20 21 00 | Jump to subroutine
    DEY                  ; 88 | Decrement Y register
    BRA $7F              ; 80 7F | Branch always
    BMI $00              ; 30 00 | Branch if negative
    DEY                  ; 88 | Decrement Y register
    BRA $7F              ; 80 7F | Branch always
    TXA                  ; 8A | Transfer X register to accumulator
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    DEX                  ; CA | Decrement X register
    RTI                  ; 40 | Return from interrupt
    PHY                  ; 5A | Push Y register to stack
    RTI                  ; 40 | Return from interrupt
    STA $9A              ; 85 9A | Store accumulator to zero page
    BVS $66              ; 70 66 | Branch if overflow set
    SBC $A3C6,Y          ; F9 C6 A3 | Subtract with carry (absolute,Y)
    STZ $DEE4            ; 9C E4 DE | Store zero to absolute
    RTI                  ; 40 | Return from interrupt
    LDY $7E80,X          ; BC 80 7E | Load from absolute,X into Y register
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 60 9E C0 | Load from absolute long,X into accumulator
    ROL $7C80,X          ; 3E 80 7C | Rotate left (absolute,X)
    CPY #$3E             ; C0 3E | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_11A
; Address: $EBD643
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_11A:
    RTI                  ; 40 | Return from interrupt
    STY $9A              ; 84 9A | Store Y register to zero page
    ADC ($66),Y          ; 71 66 | Add with carry ((zero page),Y)
    SBC $A2C6,Y          ; F9 C6 A2 | Subtract with carry (absolute,Y)
    STZ $DEE5            ; 9C E5 DE | Store zero to absolute
    RTI                  ; 40 | Return from interrupt
    LDY $7E80,X          ; BC 80 7E | Load from absolute,X into Y register
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 60 9E C0 | Load from absolute long,X into accumulator
    ROL $7C80,X          ; 3E 80 7C | Rotate left (absolute,X)
    CPY #$3E             ; C0 3E | Compare Y register (immediate)
    PHY                  ; 5A | Push Y register to stack
    RTI                  ; 40 | Return from interrupt
    STA $9A              ; 85 9A | Store accumulator to zero page
    BVS $66              ; 70 66 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    DEC $A3              ; C6 A3 | Decrement (zero page)
    STZ $DEE5            ; 9C E5 DE | Store zero to absolute
    RTI                  ; 40 | Return from interrupt
    LDY $7E80,X          ; BC 80 7E | Load from absolute,X into Y register
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 60 9E C0 | Load from absolute long,X into accumulator
    ROL $7C80,X          ; 3E 80 7C | Rotate left (absolute,X)
    CPY #$3E             ; C0 3E | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    TXS                  ; 9A | Transfer X register to stack pointer
    STY $A3              ; 84 A3 | Store Y register to zero page
    LDY $E6F5            ; AC F5 E6 | Load from absolute address into Y register
    LDX $8EA3,Y          ; BE A3 8E | Load from absolute,Y into X register
    AND ($0E),Y          ; 31 0E | Logical AND with accumulator ((zero page),Y)
    CPY #$3E             ; C0 3E | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDX $7C80,Y          ; BE 80 7C | Load from absolute,Y into X register
    LDY #$5C             ; A0 5C | Load immediate value into Y register
    CPX #$1E             ; E0 1E | Compare X register (immediate)
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    BRA $7F              ; 80 7F | Branch always
    INC $D2EE,X          ; FE EE D2 | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    STY $A3              ; 84 A3 | Store Y register to zero page
    LDY $E6F5            ; AC F5 E6 | Load from absolute address into Y register
    LDX $8EA3,Y          ; BE A3 8E | Load from absolute,Y into X register
    BMI $0E              ; 30 0E | Branch if negative
    CPY #$3E             ; C0 3E | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDX $7C80,Y          ; BE 80 7C | Load from absolute,Y into X register
    LDY #$5C             ; A0 5C | Load immediate value into Y register
    CPX #$1E             ; E0 1E | Compare X register (immediate)
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    BRA $7F              ; 80 7F | Branch always

;------------------------------------------------------------------------------
; Bank56_DmaFunction_11B
; Address: $EBD6BF
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_11B:
    INC $D2EE,X          ; FE EE D2 | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    STY $A3              ; 84 A3 | Store Y register to zero page
    LDY $E6F4            ; AC F4 E6 | Load from absolute address into Y register
    LDX $8EA3,Y          ; BE A3 8E | Load from absolute,Y into X register
    AND ($0E),Y          ; 31 0E | Logical AND with accumulator ((zero page),Y)
    CPY #$3E             ; C0 3E | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDX $7C80,Y          ; BE 80 7C | Load from absolute,Y into X register
    LDY #$5C             ; A0 5C | Load immediate value into Y register
    CPX #$1E             ; E0 1E | Compare X register (immediate)
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    BRA $7F              ; 80 7F | Branch always
    INC $6E00,X          ; FE 00 6E | Increment (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    STA ($BF),Y          ; 91 BF | Store accumulator to (zero page),Y
    CPY $00              ; C4 00 | Compare Y register (zero page)
    LDA $8200,Y          ; B9 00 82 | Load from absolute,Y into accumulator

;------------------------------------------------------------------------------
; Bank56_DmaFunction_11C
; Address: $EBD705
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_11C:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    STZ $EF              ; 64 EF | Store zero to zero page
    BPL $30              ; 10 30 | Branch if positive
    ADC $00              ; 65 00 | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA ($BF),Y          ; 91 BF | Store accumulator to (zero page),Y
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    SBC $A000,Y          ; F9 00 A0 | Subtract with carry (absolute,Y)
    LDA $00              ; A5 00 | Load from zero page into accumulator
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    LDY #$00             ; A0 00 | Load immediate value into Y register
    REP #$00             ; C2 00 | Reset processor status bits
    BNE $00              ; D0 00 | Branch if not equal
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    LDA ($00,X)          ; A1 00 | Load from (zero page,X) into accumulator
    INY                  ; C8 | Increment Y register
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    STA $0400,Y          ; 99 00 04 | Store accumulator to absolute,Y

;------------------------------------------------------------------------------
; Bank56_DmaFunction_11D
; Address: $EBD7A6
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_11D:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    STZ $00              ; 64 00 | Store zero to zero page
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank56_DmaFunction_11E
; Address: $EBD7E2
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_11E:
    CLC                  ; 18 | Clear carry flag
    BRA $00              ; 80 00 | Branch always
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    TSX                  ; BA | Transfer stack pointer to X register
    SEC                  ; 38 | Set carry flag
    CLV                  ; B8 | Clear overflow flag
    TXS                  ; 9A | Transfer X register to stack pointer
    BEQ $9A              ; F0 9A | Branch if equal
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    BRA $48              ; 80 48 | Branch always
    CLD                  ; D8 | Clear decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    ROL $BC78,X          ; 3E 78 BC | Rotate left (absolute,X)
    SEC                  ; 38 | Set carry flag
    BVC $B8              ; 50 B8 | Branch if overflow clear
    STZ $92F0            ; 9C F0 92 | Store zero to absolute
    CPX #$E8             ; E0 E8 | Compare X register (immediate)
    BRA $40              ; 80 40 | Branch always
    LDY #$00             ; A0 00 | Load immediate value into Y register
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank56_DmaFunction_11F
; Address: $EBD895
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_11F:
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    TSX                  ; BA | Transfer stack pointer to X register
    SEC                  ; 38 | Set carry flag
    CLV                  ; B8 | Clear overflow flag
    BEQ $98              ; F0 98 | Branch if equal
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    BRA $D0              ; 80 D0 | Branch always
    BRA $00              ; 80 00 | Branch always
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    BVC $00              ; 50 00 | Branch if overflow clear
    LDY #$40             ; A0 40 | Load immediate value into Y register
    BVS $00              ; 70 00 | Branch if overflow set
    DEX                  ; CA | Decrement X register
    BCS $34              ; B0 34 | Branch if carry set
    PHP                  ; 08 | Push processor status to stack
    STZ $58              ; 64 58 | Store zero to zero page
    ADC ($6C),Y          ; 71 6C | Add with carry ((zero page),Y)
    CPX $0000            ; EC 00 00 | Compare X register (absolute)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$80             ; E0 80 | Compare X register (immediate)
    BVS $00              ; 70 00 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt
    CLV                  ; B8 | Clear overflow flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_121
; Address: $EBD8E0
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_121:
    JSR $8800            ; 20 00 88 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BVS $00              ; 70 00 | Branch if overflow set
    INY                  ; C8 | Increment Y register
    BCS $32              ; B0 32 | Branch if carry set
    PHP                  ; 08 | Push processor status to stack
    ROR $58              ; 66 58 | Rotate right (zero page)
    JMP ($ECE4)          ; 6C E4 EC | Jump to address (absolute indirect)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$80             ; E0 80 | Compare X register (immediate)
    BVS $00              ; 70 00 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt
    CLV                  ; B8 | Clear overflow flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_122
; Address: $EBD8FD
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_122:
    STZ $1CE0            ; 9C E0 1C | Store zero to absolute
    RTI                  ; 40 | Return from interrupt
    LDY #$40             ; A0 40 | Load immediate value into Y register
    CPY $B0              ; C4 B0 | Compare Y register (zero page)
    BMI $08              ; 30 08 | Branch if negative
    STZ $58              ; 64 58 | Store zero to zero page
    JMP ($ECE6)          ; 6C E6 EC | Jump to address (absolute indirect)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$80             ; E0 80 | Compare X register (immediate)
    BVS $00              ; 70 00 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt
    CLV                  ; B8 | Clear overflow flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_123
; Address: $EBD91D
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_123:
    STZ $1CE0            ; 9C E0 1C | Store zero to absolute
    RTI                  ; 40 | Return from interrupt
    STY $9A              ; 84 9A | Store Y register to zero page
    ADC $E866,Y          ; 79 66 E8 | Add with carry (absolute,Y)
    INC $B4              ; E6 B4 | Increment (zero page)
    DEX                  ; CA | Decrement X register
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    LDY $7E80,X          ; BC 80 7E | Load from absolute,X into Y register
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 60 9E E0 | Load from absolute long,X into accumulator
    ASL $4FB0,X          ; 1E B0 4F | Arithmetic shift left (absolute,X)
    INY                  ; C8 | Increment Y register
    PHY                  ; 5A | Push Y register to stack
    RTI                  ; 40 | Return from interrupt
    STA $9A              ; 85 9A | Store accumulator to zero page
    ADC $E966,Y          ; 79 66 E9 | Add with carry (absolute,Y)
    INC $B4              ; E6 B4 | Increment (zero page)
    DEX                  ; CA | Decrement X register
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    LDY $7E80,X          ; BC 80 7E | Load from absolute,X into Y register
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 60 9E E0 | Load from absolute long,X into accumulator
    ASL $4FB0,X          ; 1E B0 4F | Arithmetic shift left (absolute,X)
    INY                  ; C8 | Increment Y register
    PHY                  ; 5A | Push Y register to stack
    RTI                  ; 40 | Return from interrupt
    STA $9A              ; 85 9A | Store accumulator to zero page
    SEI                  ; 78 | Set interrupt disable flag
    ROR $E9              ; 66 E9 | Rotate right (zero page)
    INC $B4              ; E6 B4 | Increment (zero page)
    DEX                  ; CA | Decrement X register
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    LDY $7E80,X          ; BC 80 7E | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank56_DmaFunction_124
; Address: $EBD976
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_124:
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 60 9E E0 | Load from absolute long,X into accumulator
    ASL $4FB0,X          ; 1E B0 4F | Arithmetic shift left (absolute,X)
    INY                  ; C8 | Increment Y register
    SBC #$D4             ; E9 D4 | Subtract with carry (immediate)
    RTI                  ; 40 | Return from interrupt
    STY $A2              ; 84 A2 | Store Y register to zero page
    LDY $E6F5            ; AC F5 E6 | Load from absolute address into Y register
    LDX $8EA3,Y          ; BE A3 8E | Load from absolute,Y into X register
    AND ($0E),Y          ; 31 0E | Logical AND with accumulator ((zero page),Y)
    CPY #$3C             ; C0 3C | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDY $7C80,X          ; BC 80 7C | Load from absolute,X into Y register
    LDY #$5C             ; A0 5C | Load immediate value into Y register
    CPX #$1E             ; E0 1E | Compare X register (immediate)
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    BRA $7F              ; 80 7F | Branch always
    INC $D4EA,X          ; FE EA D4 | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    TXS                  ; 9A | Transfer X register to stack pointer
    STY $A2              ; 84 A2 | Store Y register to zero page
    LDY $E6F4            ; AC F4 E6 | Load from absolute address into Y register
    LDX $8EA3,Y          ; BE A3 8E | Load from absolute,Y into X register
    BMI $0E              ; 30 0E | Branch if negative
    CPY #$3C             ; C0 3C | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDY $7C80,X          ; BC 80 7C | Load from absolute,X into Y register
    LDY #$5C             ; A0 5C | Load immediate value into Y register
    CPX #$1E             ; E0 1E | Compare X register (immediate)
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    BRA $7F              ; 80 7F | Branch always
    INC $D4E9,X          ; FE E9 D4 | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    TXS                  ; 9A | Transfer X register to stack pointer
    STY $A2              ; 84 A2 | Store Y register to zero page
    LDY $E6F5            ; AC F5 E6 | Load from absolute address into Y register
    LDX $8EA3,Y          ; BE A3 8E | Load from absolute,Y into X register
    AND ($0E),Y          ; 31 0E | Logical AND with accumulator ((zero page),Y)
    CPY #$3C             ; C0 3C | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDY $7C80,X          ; BC 80 7C | Load from absolute,X into Y register
    LDY #$5C             ; A0 5C | Load immediate value into Y register
    CPX #$1E             ; E0 1E | Compare X register (immediate)
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    BRA $7F              ; 80 7F | Branch always
    INC $D4E8,X          ; FE E8 D4 | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    TXS                  ; 9A | Transfer X register to stack pointer
    STY $A3              ; 84 A3 | Store Y register to zero page
    LDY $E6F4            ; AC F4 E6 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank56_DmaFunction_125
; Address: $EBD9EA
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_125:
    LDX $8EA3,Y          ; BE A3 8E | Load from absolute,Y into X register
    BMI $0E              ; 30 0E | Branch if negative
    CPY #$3C             ; C0 3C | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDY $7C80,X          ; BC 80 7C | Load from absolute,X into Y register
    LDY #$5C             ; A0 5C | Load immediate value into Y register
    CPX #$1E             ; E0 1E | Compare X register (immediate)
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    BRA $7F              ; 80 7F | Branch always
    INC $30B0,X          ; FE B0 30 | Increment (absolute,X)
    ROR $88              ; 66 88 | Rotate right (zero page)
    CLD                  ; D8 | Clear decimal mode flag
    SEC                  ; 38 | Set carry flag
    INC                  ; 1A | Increment accumulator
    SBC $F3DE,X          ; FD DE F3 | Subtract with carry (absolute,X)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BRA $30              ; 80 30 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $33              ; 80 33 | Branch always
    BNE $C0              ; D0 C0 | Branch if not equal
    RTI                  ; 40 | Return from interrupt
    STA $0666,Y          ; 99 66 06 | Store accumulator to absolute,Y
    CMP $220F,X          ; DD 0F 22 | Compare accumulator (absolute,X)
    ORA ($33,X)          ; 01 33 | Logical OR with accumulator ((zero page,X))
    CPY $3FC0            ; CC C0 3F | Compare Y register (absolute)
    ORA ($B0,X)          ; 01 B0 | Logical OR with accumulator ((zero page,X))
    BMI $66              ; 30 66 | Branch if negative
    DEY                  ; 88 | Decrement Y register
    CLD                  ; D8 | Clear decimal mode flag
    SEC                  ; 38 | Set carry flag
    INC                  ; 1A | Increment accumulator
    SBC $F3DE,X          ; FD DE F3 | Subtract with carry (absolute,X)
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BRA $30              ; 80 30 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $33              ; 80 33 | Branch always
    BNE $C0              ; D0 C0 | Branch if not equal
    RTI                  ; 40 | Return from interrupt
    STA $0666,Y          ; 99 66 06 | Store accumulator to absolute,Y
    LDA $D20F            ; AD 0F D2 | Load from absolute address into accumulator
    ORA ($33,X)          ; 01 33 | Logical OR with accumulator ((zero page,X))
    CPY $3FC0            ; CC C0 3F | Compare Y register (absolute)
    ORA ($B0,X)          ; 01 B0 | Logical OR with accumulator ((zero page,X))
    BMI $66              ; 30 66 | Branch if negative
    DEY                  ; 88 | Decrement Y register
    CLD                  ; D8 | Clear decimal mode flag
    SEC                  ; 38 | Set carry flag
    INC                  ; 1A | Increment accumulator
    SBC $F3DE,X          ; FD DE F3 | Subtract with carry (absolute,X)
    XBA                  ; EB | Exchange accumulator bytes

;------------------------------------------------------------------------------
; Bank56_DmaFunction_126
; Address: $EBDA8D
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_126:
    CPX #$41             ; E0 41 | Compare X register (immediate)
    BRA $30              ; 80 30 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $33              ; 80 33 | Branch always
    BNE $C0              ; D0 C0 | Branch if not equal
    RTI                  ; 40 | Return from interrupt
    STA $0666,Y          ; 99 66 06 | Store accumulator to absolute,Y
    ADC $180F            ; 6D 0F 18 | Add with carry (absolute)
    ORA ($33,X)          ; 01 33 | Logical OR with accumulator ((zero page,X))
    CPY $3FC0            ; CC C0 3F | Compare Y register (absolute)
    ORA ($D5,X)          ; 01 D5 | Logical OR with accumulator ((zero page,X))
    ORA ($21),Y          ; 11 21 | PPU graphics register access
    LSR $381E,X          ; 5E 1E 38 | Logical shift right (absolute,X)
    SEC                  ; 38 | Set carry flag
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    ASL $38E1,X          ; 1E E1 38 | Arithmetic shift left (absolute,X)
    PHB                  ; 8B | Push data bank register to stack
    INX                  ; E8 | Increment X register
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($21),Y          ; 11 21 | PPU graphics register access
    LSR $381E,X          ; 5E 1E 38 | Logical shift right (absolute,X)
    SEC                  ; 38 | Set carry flag
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    ASL $38E1,X          ; 1E E1 38 | Arithmetic shift left (absolute,X)
    PHB                  ; 8B | Push data bank register to stack
    INX                  ; E8 | Increment X register
    SBC $8600            ; ED 00 86 | Subtract with carry (absolute)
    AND $F339,Y          ; 39 39 F3 | Logical AND with accumulator (absolute,Y)
    ROR $FE7E,X          ; 7E 7E FE | Rotate right (absolute,X)
    INC $7D00,X          ; FE 00 7D | Increment (absolute,X)
    AND $F3C6,Y          ; 39 C6 F3 | Logical AND with accumulator (absolute,Y)
    SEI                  ; 78 | Set interrupt disable flag
    CPX #$7E             ; E0 7E | Compare X register (immediate)
    STA ($FE,X)          ; 81 FE | Store accumulator to (zero page,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BEQ $B4              ; F0 B4 | Branch if equal
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    BEQ $F6              ; F0 F6 | Branch if equal
    BEQ $02              ; F0 02 | Branch if equal
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank56_DmaFunction_128
; Address: $EBDB4B
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_128:
    JSL $747032          ; 22 32 70 74 | Jump to subroutine long
    EOR ($02),Y          ; 51 02 | Exclusive OR with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BVS $76              ; 70 76 | Branch if overflow set
    BVS $00              ; 70 00 | Branch if overflow set
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    EOR $46              ; 45 46 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_129
; Address: $EBDB6A
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_129:
    JSL $F0D263          ; 22 63 D2 F0 | Jump to subroutine long
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BEQ $F6              ; F0 F6 | Branch if equal
    BEQ $72              ; F0 72 | Branch if equal
    ADC ($4E),Y          ; 71 4E | Add with carry ((zero page),Y)
    INC $4B              ; E6 4B | Increment (zero page)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_12A
; Address: $EBDB88
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_12A:
    JSR $0D92            ; 20 92 0D | Jump to subroutine
    WDM #$15             ; 42 15 | Reserved instruction
    ASL $0B              ; 06 0B | Arithmetic shift left (zero page)
    BVS $5B              ; 70 5B | Branch if overflow set
    LDY $5700,X          ; BC 00 57 | Load from absolute,X into Y register
    SEC                  ; 38 | Set carry flag
    ORA $0600            ; 0D 00 06 | Logical OR with accumulator (absolute)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $060F            ; 0E 0F 06 | Arithmetic shift left (absolute)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    BVC $D0              ; 50 D0 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank56_DmaFunction_12B
; Address: $EBDBCA
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_12B:
    JSR $E8F0            ; 20 F0 E8 | Jump to subroutine
    CLV                  ; B8 | Clear overflow flag
    PHA                  ; 48 | Push accumulator to stack
    CLV                  ; B8 | Clear overflow flag
    BRA $80              ; 80 80 | Branch always
    BNE $D0              ; D0 D0 | Branch if not equal
    BEQ $F0              ; F0 F0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_12C
; Address: $EBDBEA
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_12C:
    ASL $0A0F            ; 0E 0F 0A | Arithmetic shift left (absolute)
    ORA $080A            ; 0D 0A 08 | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_12E
; Address: $EBDC06
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_12E:
    LDY #$E0             ; A0 E0 | Game work RAM access
    TAY                  ; A8 | Transfer accumulator to Y register
    INX                  ; E8 | Increment X register
    BCS $F0              ; B0 F0 | Branch if carry set
    BVC $B0              ; 50 B0 | Branch if overflow clear
    CLI                  ; 58 | Clear interrupt disable flag
    CLV                  ; B8 | Clear overflow flag
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_130
; Address: $EBDC16
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_130:
    CPX #$E0             ; E0 E0 | Game work RAM access
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ORA $090E            ; 0D 0E 09 | Logical OR with accumulator (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    BRA $80              ; 80 80 | Branch always
    BPL $D0              ; 10 D0 | Branch if positive
    LDY #$70             ; A0 70 | Load immediate value into Y register
    BRA $80              ; 80 80 | Branch always
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    BRA $80              ; 80 80 | Branch always
    BNE $D0              ; D0 D0 | Branch if not equal
    BEQ $F0              ; F0 F0 | Branch if equal
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $1C0B            ; 0D 0B 1C | Logical OR with accumulator (absolute)
    ORA $0C36,Y          ; 19 36 0C | Logical OR with accumulator (absolute,Y)
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    BPL $04              ; 10 04 | Branch if positive
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank56_DmaFunction_131
; Address: $EBDC6E
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_131:
    ORA $0A              ; 05 0A | Logical OR with accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    INX                  ; E8 | Increment X register
    CLC                  ; 18 | Clear carry flag
    BVC $B8              ; 50 B8 | Branch if overflow clear
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
    INX                  ; E8 | Increment X register
    CLC                  ; 18 | Clear carry flag
    BNE $38              ; D0 38 | Branch if not equal
    BCC $64              ; 90 64 | Branch if carry clear
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
    INC                  ; 1A | Increment accumulator
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    BPL $04              ; 10 04 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA $0A              ; 05 0A | Logical OR with accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    BVS $B0              ; 70 B0 | Branch if overflow set
    BNE $38              ; D0 38 | Branch if not equal
    BCC $64              ; 90 64 | Branch if carry clear
    PLA                  ; 68 | Pull accumulator from stack
    CLD                  ; D8 | Clear decimal mode flag
    CPY $30              ; C4 30 | Compare Y register (zero page)
    CPX #$18             ; E0 18 | Compare X register (immediate)
    BRA $70              ; 80 70 | Branch always
    BEQ $F0              ; F0 F0 | Branch if equal

;------------------------------------------------------------------------------
; Bank56_DmaFunction_132
; Address: $EBDCF2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_132:
    SED                  ; F8 | Set decimal mode flag
    BEQ $FC              ; F0 FC | Branch if equal
    CPX #$FC             ; E0 FC | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank56_DmaFunction_133
; Address: $EBDD02
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_133:
    JSL $646426          ; 22 26 64 64 | Jump to subroutine long
    AND ($21,X)          ; 21 21 | PPU graphics register access
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $040F            ; 0D 0F 04 | Logical OR with accumulator (absolute)
    ROL $26              ; 26 26 | Rotate left (zero page)
    STZ $64              ; 64 64 | Store zero to zero page
    AND ($21,X)          ; 21 21 | PPU graphics register access
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    STX $82              ; 86 82 | Store X register to zero page
    STX $84              ; 86 84 | Store X register to zero page
    STY $40              ; 84 40 | Store Y register to zero page
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    STX $86              ; 86 86 | Store X register to zero page
    STX $86              ; 86 86 | Store X register to zero page
    STY $84              ; 84 84 | Store Y register to zero page
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_136
; Address: $EBDD51
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_136:
    JSR $2020            ; 20 20 20 | Jump to subroutine
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    LDY #$E0             ; A0 E0 | Game work RAM access
    BVC $B0              ; 50 B0 | Branch if overflow clear
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $F0              ; F0 F0 | Branch if equal
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank56_DmaFunction_137
; Address: $EBDD8C
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_137:
    JSL $6D4E23          ; 22 23 4E 6D | Jump to subroutine long
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    LDY #$E0             ; A0 E0 | Game work RAM access
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    PEA #$F414           ; F4 14 F4 | Push effective address to stack
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank56_DmaFunction_138
; Address: $EBDDB8
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_138:
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    PEA #$F4F4           ; F4 F4 F4 | Push effective address to stack
    PEA #$0E0D           ; F4 0D 0E | Push effective address to stack
    SEI                  ; 78 | Set interrupt disable flag
    ORA $281A,X          ; 1D 1A 28 | Logical OR with accumulator (absolute,X)
    XBA                  ; EB | Exchange accumulator bytes
    ORA #$3F             ; 09 3F | Logical OR with accumulator (immediate)
    ASL $E464            ; 0E 64 E4 | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    CPX $1DF5            ; EC F5 1D | Compare X register (absolute)
    BNE $38              ; D0 38 | Branch if not equal
    PLB                  ; AB | Pull data bank register from stack
    ADC $6868,X          ; 7D 68 68 | Add with carry (absolute,X)
    RTI                  ; 40 | Return from interrupt
    BVS $14              ; 70 14 | Branch if overflow set
    CLC                  ; 18 | Clear carry flag
    CPX $E4              ; E4 E4 | Compare X register (zero page)
    CPX $FEEC            ; EC EC FE | Compare X register (absolute)
    CPX $C0FC            ; EC FC C0 | Compare X register (absolute)
    INC $F888,X          ; FE 88 F8 | Increment (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_139
; Address: $EBDE02
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_139:
    AND $3A              ; 25 3A | Logical AND with accumulator (zero page)
    BVS $13              ; 70 13 | Branch if overflow set
    AND ($F6,X)          ; 21 F6 | Logical AND with accumulator ((zero page,X))
    XBA                  ; EB | Exchange accumulator bytes
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    ORA #$3F             ; 09 3F | Logical OR with accumulator (immediate)
    ASL $9474            ; 0E 74 94 | Arithmetic shift left (absolute)
    PHA                  ; 48 | Push accumulator to stack
    LDY $5FA7,X          ; BC A7 5F | Load from absolute,X into Y register
    CPX $5B1C            ; EC 1C 5B | Compare X register (absolute)
    LDA $6868,X          ; BD 68 68 | Load from absolute,X into accumulator
    RTI                  ; 40 | Return from interrupt
    BVS $14              ; 70 14 | Branch if overflow set
    CLC                  ; 18 | Clear carry flag
    PEA #$FCF4           ; F4 F4 FC | Push effective address to stack
    INC $F4FF,X          ; FE FF F4 | Increment (absolute,X)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    INC $F888,X          ; FE 88 F8 | Increment (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_13B
; Address: $EBDE46
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_13B:
    ORA ($1E),Y          ; 11 1E | Logical OR with accumulator ((zero page),Y)
    SBC #$D9             ; E9 D9 | Subtract with carry (immediate)
    ORA #$3F             ; 09 3F | Logical OR with accumulator (immediate)
    ASL $7A8E            ; 0E 8E 7A | Arithmetic shift left (absolute)
    STZ $3FCB,X          ; 9E CB 3F | Store zero to absolute,X
    SBC $E8E8,X          ; FD E8 E8 | Subtract with carry (absolute,X)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank56_DmaFunction_13C
; Address: $EBDE6D
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_13C:
    BVS $14              ; 70 14 | Branch if overflow set
    CLC                  ; 18 | Clear carry flag
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    INC $FFFE,X          ; FE FE FF | Increment (absolute,X)
    CPX $E0FC            ; EC FC E0 | Game work RAM access
    INC $F888,X          ; FE 88 F8 | Increment (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_13D
; Address: $EBDE80
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_13D:
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    PHA                  ; 48 | Push accumulator to stack
    SEI                  ; 78 | Set interrupt disable flag
    CLI                  ; 58 | Clear interrupt disable flag
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank56_DmaFunction_13E
; Address: $EBDE88
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_13E:
    JSR $1930            ; 20 30 19 | Jump to subroutine
    ORA $0909,Y          ; 19 09 09 | Logical OR with accumulator (absolute,Y)
    LSR $1A4F            ; 4E 4F 1A | Logical shift right (absolute)
    INC                  ; 1A | Increment accumulator
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    BMI $30              ; 30 30 | Branch if negative
    ORA $0919,Y          ; 19 19 09 | Logical OR with accumulator (absolute,Y)
    ORA #$4F             ; 09 4F | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_148
; Address: $EBDECC
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_148:
    STA $1B8D            ; 8D 8D 1B | Store accumulator to absolute address
    ASL $2020,X          ; 1E 20 20 | Arithmetic shift left (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_14E
; Address: $EBDEE5
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_14E:
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $80              ; 06 80 | Arithmetic shift left (zero page)
    BRA $C4              ; 80 C4 | Branch always
    CPY $B1              ; C4 B1 | Compare Y register (zero page)
    SBC ($53),Y          ; F1 53 | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_14F
; Address: $EBDEF0
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_14F:
    JSR $0220            ; 20 20 02 | Jump to subroutine
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    BRA $80              ; 80 80 | Branch always
    CPY $C4              ; C4 C4 | Compare Y register (zero page)
    SBC ($F1),Y          ; F1 F1 | Subtract with carry ((zero page),Y)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $0000            ; 0D 00 00 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_150
; Address: $EBDF24
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_150:
    JSR $A060            ; 20 60 A0 | Jump to subroutine
    CPX #$40             ; E0 40 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_151
; Address: $EBDF2A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_151:
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    TAY                  ; A8 | Transfer accumulator to Y register
    CLV                  ; B8 | Clear overflow flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_155
; Address: $EBDF3A
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_155:
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    PHY                  ; 5A | Push Y register to stack
    AND $302F,Y          ; 39 2F 30 | Logical AND with accumulator (absolute,Y)
    SEC                  ; 38 | Set carry flag
    ADC ($3E),Y          ; 71 3E | Add with carry ((zero page),Y)
    LSR $2F17,X          ; 5E 17 2F | Logical shift right (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    BIT $07              ; 24 07 | Test bits in accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    JMP $C8BC            ; 4C BC C8 | Jump to address
    SEC                  ; 38 | Set carry flag
    STZ $3E7C            ; 9C 7C 3E | Store zero to absolute
    PLX                  ; FA | Pull X register from stack
    INX                  ; E8 | Increment X register
    PEA #$6C10           ; F4 10 6C | Push effective address to stack
    CPX #$F6             ; E0 F6 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PLX                  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank56_DmaFunction_156
; Address: $EBDF79
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_156:
    SED                  ; F8 | Set decimal mode flag
    CPX #$EC             ; E0 EC | Compare X register (immediate)
    BIT $273B            ; 2C 3B 27 | Test bits in accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    BMI $27              ; 30 27 | Branch if negative
    SEC                  ; 38 | Set carry flag
    PLY                  ; 7A | Pull Y register from stack
    AND $175D,X          ; 3D 5D 17 | Logical AND with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    BIT $07              ; 24 07 | Test bits in accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    INX                  ; E8 | Increment X register
    CLC                  ; 18 | Clear carry flag
    INX                  ; E8 | Increment X register
    CLC                  ; 18 | Clear carry flag
    CPY #$38             ; C0 38 | Compare Y register (immediate)
    LDX $7A7C,Y          ; BE 7C 7A | Load from absolute,Y into X register
    INX                  ; E8 | Increment X register
    PEA #$6C10           ; F4 10 6C | Push effective address to stack
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PLX                  ; FA | Pull X register from stack
    SED                  ; F8 | Set decimal mode flag
    CPX #$EC             ; E0 EC | Compare X register (immediate)
    ASL $1709            ; 0E 09 17 | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    BMI $2B              ; 30 2B | Branch if negative
    ADC $5D3E,Y          ; 79 3E 5D | Add with carry (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    BIT $07              ; 24 07 | Test bits in accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    CLI                  ; 58 | Clear interrupt disable flag
    INX                  ; E8 | Increment X register
    CLV                  ; B8 | Clear overflow flag
    PHA                  ; 48 | Push accumulator to stack
    CPY $B43C            ; CC 3C B4 | Compare Y register (absolute)
    JMP $BA3CDE          ; 5C DE 3C BA | Jump to address long
    INX                  ; E8 | Increment X register
    PEA #$6C10           ; F4 10 6C | Push effective address to stack
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PLX                  ; FA | Pull X register from stack
    SED                  ; F8 | Set decimal mode flag
    CPX #$EC             ; E0 EC | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_158
; Address: $EBE004
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_158:
    JSL $371423          ; 22 23 14 37 | Jump to subroutine long
    BEQ $B4              ; F0 B4 | Branch if equal
    CMP ($01),Y          ; D1 01 | Compare accumulator ((zero page),Y)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($23,X)          ; 01 23 | Logical OR with accumulator ((zero page,X))
    BEQ $F6              ; F0 F6 | Branch if equal
    BEQ $02              ; F0 02 | Branch if equal
    EOR ($41,X)          ; 41 41 | Exclusive OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank56_DmaFunction_159
; Address: $EBE02A
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_159:
    JSL $703223          ; 22 23 32 70 | Jump to subroutine long
    EOR ($02),Y          ; 51 02 | Exclusive OR with accumulator ((zero page),Y)
    EOR ($41,X)          ; 41 41 | Exclusive OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BVS $76              ; 70 76 | Branch if overflow set
    BVS $00              ; 70 00 | Branch if overflow set
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    EOR $46              ; 45 46 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_15A
; Address: $EBE04A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_15A:
    JSL $F0D263          ; 22 63 D2 F0 | Jump to subroutine long
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BEQ $F6              ; F0 F6 | Branch if equal
    BEQ $72              ; F0 72 | Branch if equal
    LSR                  ; 4A | Logical shift right (accumulator)
    CMP $9E              ; C5 9E | Compare accumulator (zero page)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_15B
; Address: $EBE068
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_15B:
    JSR $0DF3            ; 20 F3 0D | Jump to subroutine
    ORA $0702,X          ; 1D 02 07 | Logical OR with accumulator (absolute,X)
    BVS $76              ; 70 76 | Branch if overflow set
    ORA ($4E),Y          ; 11 4E | Logical OR with accumulator ((zero page),Y)
    PLP                  ; 28 | Pull processor status from stack
    ADC ($42,X)          ; 61 42 | Hardware register operation
    AND $0F10,X          ; 3D 10 0F | Logical AND with accumulator (absolute,X)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    CMP $9E              ; C5 9E | Compare accumulator (zero page)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_15C
; Address: $EBE088
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_15C:
    JSR $0DF3            ; 20 F3 0D | Jump to subroutine
    ORA $0702,X          ; 1D 02 07 | Logical OR with accumulator (absolute,X)
    BVS $76              ; 70 76 | Branch if overflow set
    ORA ($4E),Y          ; 11 4E | Logical OR with accumulator ((zero page),Y)
    PLP                  ; 28 | Pull processor status from stack
    ADC ($42,X)          ; 61 42 | Hardware register operation
    AND $0F10,X          ; 3D 10 0F | Logical AND with accumulator (absolute,X)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    BPL $18              ; 10 18 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank56_DmaFunction_15D
; Address: $EBE0BA
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_15D:
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BPL $10              ; 10 10 | Branch if positive
    BMI $30              ; 30 30 | Branch if negative
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BPL $10              ; 10 10 | Branch if positive
    BMI $30              ; 30 30 | Branch if negative
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BMI $30              ; 30 30 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_15F
; Address: $EBE106
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_15F:
    BPL $30              ; 10 30 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BMI $30              ; 30 30 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_161
; Address: $EBE116
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_161:
    BMI $30              ; 30 30 | Branch if negative
    BPL $10              ; 10 10 | Branch if positive
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank56_DmaFunction_163
; Address: $EBE13E
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_163:
    JSR $1020            ; 20 20 10 | Jump to subroutine
    BPL $00              ; 10 00 | Branch if positive
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BMI $30              ; 30 30 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BPL $10              ; 10 10 | Branch if positive
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_164
; Address: $EBE158
; Size: 120 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_164:
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BMI $30              ; 30 30 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC                  ; 1A | Increment accumulator
    AND $333E            ; 2D 3E 33 | Logical AND with accumulator (absolute)
    ROL $263B            ; 2E 3B 26 | Rotate left (absolute)
    CMP $0962,X          ; DD 62 09 | Compare accumulator (absolute,X)
    ORA #$03             ; 09 03 | Logical OR with accumulator (immediate)
    LDA                  ; BF 3F 84 8C | Load from absolute long,X into accumulator
    STX $EA9E            ; 8E 9E EA | Store X register to absolute address
    INC $FEB2,X          ; FE B2 FE | Increment (absolute,X)
    PEA #$24DE           ; F4 DE 24 | Push effective address to stack
    CMP $F924,X          ; DD 24 F9 | Compare accumulator (absolute,X)
    STY $9E8C            ; 8C 8C 9E | Store Y register to absolute address
    STZ $FEFE,X          ; 9E FE FE | Store zero to absolute,X
    INC $FCFE,X          ; FE FE FC | Increment (absolute,X)
    INC $FFFC,X          ; FE FC FF | Increment (absolute,X)
    ORA #$2F             ; 09 2F | Logical OR with accumulator (immediate)
    ROL                  ; 2A | Rotate left (accumulator)
    AND $3B34,X          ; 3D 34 3B | Logical AND with accumulator (absolute,X)
    ROL $9631,X          ; 3E 31 96 | Rotate left (absolute,X)
    AND $0303,Y          ; 39 03 03 | Logical AND with accumulator (absolute,Y)
    BPL $10              ; 10 10 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    STZ $949C            ; 9C 9C 94 | Store zero to absolute
    STZ $F47C            ; 9C 7C F4 | Store zero to absolute
    LDX $7C              ; A6 7C | Load from zero page into X register
    STA $56AB76          ; 8F 76 AB 56 | Store accumulator to absolute long address
    BPL $10              ; 10 10 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    STZ $9C9C            ; 9C 9C 9C | Store zero to absolute
    STZ $FCFC            ; 9C FC FC | Store zero to absolute
    INC $FDFC,X          ; FE FC FD | Increment (absolute,X)
    INC $2828,X          ; FE 28 28 | Increment (absolute,X)
    ASL $0B0A            ; 0E 0A 0B | Arithmetic shift left (absolute)
    ORA $0F01,X          ; 1D 01 0F | Logical OR with accumulator (absolute,X)
    BIT $AD33            ; 2C 33 AD | Test bits in accumulator (absolute)
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    ASL $1F0E            ; 0E 0E 1F | Arithmetic shift left (absolute)
    TAX                  ; AA | Transfer accumulator to X register
    LDX $F6DA            ; AE DA F6 | Load from absolute address into X register
    INC $5CEE,X          ; FE EE 5C | Increment (absolute,X)
    LDA $D62B56          ; AF 56 2B D6 | Load from absolute long address into accumulator

;------------------------------------------------------------------------------
; Bank56_DmaFunction_165
; Address: $EBE214
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_165:
    LDX $FEAE            ; AE AE FE | Load from absolute address into X register
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    INC $FFFC,X          ; FE FC FF | Increment (absolute,X)
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    DEX                  ; CA | Decrement X register
    LDA $38A730          ; AF 30 A7 38 | Load from absolute long address into accumulator
    ORA $4F28,Y          ; 19 28 4F | Logical OR with accumulator (absolute,Y)
    DEC                  ; 3A | Decrement accumulator
    SEC                  ; 38 | Set carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDA                  ; BF 3F FF 3F | Load from absolute long,X into accumulator
    ADC ($0F),Y          ; 71 0F | Add with carry ((zero page),Y)
    EOR $2722,X          ; 5D 22 27 | Exclusive OR with accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ASL $2CD5            ; 0E D5 2C | Arithmetic shift left (absolute)
    CMP $3C              ; C5 3C | Compare accumulator (zero page)
    REP #$38             ; C2 38 | Reset processor status bits
    DEC $E8              ; C6 E8 | Decrement (zero page)
    CPY #$D8             ; C0 D8 | Compare Y register (immediate)
    SBC $FFFC,X          ; FD FC FF | Subtract with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    INC $F8              ; E6 F8 | Increment (zero page)
    STX $3AF0            ; 8E F0 3A | Store X register to absolute address
    CPY $F4              ; C4 F4 | Compare Y register (zero page)
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    CPX #$E2             ; E0 E2 | Compare X register (immediate)
    ADC $30AF,X          ; 7D AF 30 | Add with carry (absolute,X)
    LDA $3A              ; A5 3A | Load from zero page into accumulator
    EOR ($0E,X)          ; 41 0E | Exclusive OR with accumulator ((zero page,X))
    AND #$4F             ; 29 4F | Logical AND with accumulator (immediate)
    DEC                  ; 3A | Decrement accumulator
    SEC                  ; 38 | Set carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDA                  ; BF 3F FF 3F | Load from absolute long,X into accumulator
    ADC ($0F),Y          ; 71 0F | Add with carry ((zero page),Y)
    EOR $2722,X          ; 5D 22 27 | Exclusive OR with accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    STX $4EB3            ; 8E B3 4E | Store X register to absolute address
    SBC $C214            ; ED 14 C2 | Subtract with carry (absolute)
    SEC                  ; 38 | Set carry flag
    DEC $E8              ; C6 E8 | Decrement (zero page)
    CPY #$D8             ; C0 D8 | Compare Y register (immediate)
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    INC $F8              ; E6 F8 | Increment (zero page)
    STX $3AF0            ; 8E F0 3A | Store X register to absolute address
    CPY $F4              ; C4 F4 | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_166
; Address: $EBE29D
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_166:
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    CPX #$BF             ; E0 BF | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_167
; Address: $EBE2A1
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_167:
    JSR $74EB            ; 20 EB 74 | Jump to subroutine
    LDX $5331            ; AE 31 53 | Load from absolute address into X register
    PLP                  ; 28 | Pull processor status from stack
    DEC                  ; 3A | Decrement accumulator
    SEC                  ; 38 | Set carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDA                  ; BF 3F DF 1F | Load from absolute long,X into accumulator
    ADC ($0F),Y          ; 71 0F | Add with carry ((zero page),Y)
    EOR $2722,X          ; 5D 22 27 | Exclusive OR with accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ADC $9C              ; 65 9C | Add with carry (zero page)
    SBC #$14             ; E9 14 | Subtract with carry (immediate)
    SBC $C21C            ; ED 1C C2 | Subtract with carry (absolute)
    SEC                  ; 38 | Set carry flag
    JMP $0CE846          ; 5C 46 E8 0C | Jump to address long
    CPY #$D8             ; C0 D8 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    INC $F8              ; E6 F8 | Increment (zero page)
    STX $BAF0            ; 8E F0 BA | Store X register to absolute address
    PEA #$3818           ; F4 18 38 | Push effective address to stack
    CPX #$56             ; E0 56 | Compare X register (immediate)
    ASL $1B              ; 06 1B | Arithmetic shift left (zero page)
    ROL $3B40            ; 2E 40 3B | Rotate left (absolute)
    RTI                  ; 40 | Return from interrupt
    ROL $5F40,X          ; 3E 40 5F | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_169
; Address: $EBE2FD
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_169:
    JSR $303F            ; 20 3F 30 | Jump to subroutine
    CPX #$E0             ; E0 E0 | Game work RAM access
    TXA                  ; 8A | Transfer X register to accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    STA $F200,X          ; 9D 00 F2 | Store accumulator to absolute,X
    BRA $BE              ; 80 BE | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BRA $FF              ; 80 FF | Branch always
    CPY #$FD             ; C0 FD | Compare Y register (immediate)
    CPY #$1E             ; C0 1E | Compare Y register (immediate)
    WDM #$0F             ; 42 0F | Reserved instruction
    LDA                  ; BF 04 4B 04 | Load from absolute long,X into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDA                  ; BF 02 FF 04 | Load from absolute long,X into accumulator
    ASL $00DE            ; 0E DE 00 | Arithmetic shift left (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    ASL $FE              ; 06 FE | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_16A
; Address: $EBE34C
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_16A:
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PLA                  ; 68 | Pull accumulator from stack
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    INC $FE02,X          ; FE 02 FE | Increment (absolute,X)
    INC $FC46,X          ; FE 46 FC | Increment (absolute,X)
    JMP ($0656)          ; 6C 56 06 | Jump to address (absolute indirect)
    ROL $3B40            ; 2E 40 3B | Rotate left (absolute)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BMI $4F              ; 30 4F | Branch if negative
    BPL $0E              ; 10 0E | Branch if positive
    ORA $0079,Y          ; 19 79 00 | Logical OR with accumulator (absolute,Y)
    BPL $7F              ; 10 7F | Branch if positive
    BMI $3F              ; 30 3F | Branch if negative
    SEC                  ; 38 | Set carry flag
    CPX #$E0             ; E0 E0 | Game work RAM access
    TXA                  ; 8A | Transfer X register to accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CMP $F280,X          ; DD 80 F2 | Compare accumulator (absolute,X)
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    BRA $FF              ; 80 FF | Branch always
    RTI                  ; 40 | Return from interrupt
    SBC $C700,X          ; FD 00 C7 | Subtract with carry (absolute,X)
    CPY #$1E             ; C0 1E | Compare Y register (immediate)
    WDM #$05             ; 42 05 | Reserved instruction
    ASL $BF              ; 06 BF | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_16C
; Address: $EBE3BF
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_16C:
    JSR $00DE            ; 20 DE 00 | Jump to subroutine
    ROL $7D00,X          ; 3E 00 7D | Rotate left (absolute,X)
    PLY                  ; 7A | Pull Y register from stack
    BIT $FA              ; 24 FA | Test bits in accumulator (zero page)
    BIT $F8              ; 24 F8 | Test bits in accumulator (zero page)
    BIT $68D0            ; 2C D0 68 | Test bits in accumulator (absolute)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    INC $FE20,X          ; FE 20 FE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_16D
; Address: $EBE3DB
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_16D:
    JSR $2AFE            ; 20 FE 2A | Jump to subroutine
    JMP ($0656)          ; 6C 56 06 | Jump to address (absolute indirect)
    ROL $3B40            ; 2E 40 3B | Rotate left (absolute)
    RTI                  ; 40 | Return from interrupt
    ROL $5F60,X          ; 3E 60 5F | Rotate left (absolute,X)
    BPL $5F              ; 10 5F | Branch if positive
    ASL $7905,X          ; 1E 05 79 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_16F
; Address: $EBE3FD
; Size: 112 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_16F:
    JSR $243F            ; 20 3F 24 | Jump to subroutine
    CPX #$E0             ; E0 E0 | Game work RAM access
    TXA                  ; 8A | Transfer X register to accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    STA $F200,X          ; 9D 00 F2 | Store accumulator to absolute,X
    INC $8000,X          ; FE 00 80 | Increment (absolute,X)
    BEQ $00              ; F0 00 | Branch if equal
    SBC $C700,X          ; FD 00 C7 | Subtract with carry (absolute,X)
    CPY #$1C             ; C0 1C | Compare Y register (immediate)
    EOR ($41,X)          ; 41 41 | Exclusive OR with accumulator ((zero page,X))
    LDA $5F08,Y          ; B9 08 5F | Load from absolute,Y into accumulator
    BPL $FF              ; 10 FF | Branch if positive
    LDA                  ; BF 01 FF 00 | Load from absolute long,X into accumulator
    PHP                  ; 08 | Push processor status to stack
    BPL $FF              ; 10 FF | Branch if positive
    DEC $3C00,X          ; DE 00 3C | Decrement (absolute,X)
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    SED                  ; F8 | Set decimal mode flag
    BIT $38D8            ; 2C D8 38 | Test bits in accumulator (absolute)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC $FE80,X          ; FE 80 FE | Increment (absolute,X)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC $FC2A,X          ; FE 2A FC | Increment (absolute,X)
    ORA $1D1E,Y          ; 19 1E 1D | Logical OR with accumulator (absolute,Y)
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    WDM #$FF             ; 42 FF | Reserved instruction
    ASL $E9              ; 06 E9 | Arithmetic shift left (zero page)
    STZ $D765            ; 9C 65 D7 | Store zero to absolute
    DEC                  ; 3A | Decrement accumulator
    AND $2301,X          ; 3D 01 23 | Logical AND with accumulator (absolute,X)
    ORA ($43,X)          ; 01 43 | Logical OR with accumulator ((zero page,X))
    WDM #$FF             ; 42 FF | Reserved instruction
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    STX $CFFF            ; 8E FF CF | Store X register to absolute address
    SBC $E7              ; E5 E7 | Subtract with carry (zero page)
    SBC $FB0E,Y          ; F9 0E FB | Subtract with carry (absolute,Y)
    STY $FD53            ; 8C 53 FD | Store Y register to absolute address
    LDA $B777            ; AD 77 B7 | Load from absolute address into accumulator
    DEY                  ; 88 | Decrement Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    BPL $18              ; 10 18 | Branch if positive
    ASL $8EFF            ; 0E FF 8E | Arithmetic shift left (absolute)
    SBC $E7FF,Y          ; F9 FF E7 | Subtract with carry (absolute,Y)
    LDA $BD              ; A5 BD | Load from zero page into accumulator

;------------------------------------------------------------------------------
; Bank56_DmaFunction_170
; Address: $EBE4BE
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_170:
    STZ $249C            ; 9C 9C 24 | Store zero to absolute
    PEA #$E0A0           ; F4 A0 E0 | Game work RAM access
    BCS $30              ; B0 30 | Branch if carry set
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BRA $00              ; 80 00 | Branch always
    PLX                  ; FA | Pull X register from stack
    ROR $FEDE            ; 6E DE FE | Rotate right (absolute)
    INY                  ; C8 | Increment Y register
    SED                  ; F8 | Set decimal mode flag
    CPX $FC              ; E4 FC | Compare X register (zero page)
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    RTI                  ; 40 | Return from interrupt
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ASL $0B09            ; 0E 09 0B | Arithmetic shift left (absolute)
    ROR $7F7F,X          ; 7E 7F 7F | Rotate right (absolute,X)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    DEY                  ; 88 | Decrement Y register
    INC $37D9            ; EE D9 37 | Increment (absolute)
    SBC ($76),Y          ; F1 76 | Subtract with carry ((zero page),Y)
    EOR ($63,X)          ; 41 63 | Exclusive OR with accumulator ((zero page,X))
    ORA ($43,X)          ; 01 43 | Logical OR with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    INY                  ; C8 | Increment Y register
    SBC $FF9F,Y          ; F9 9F FF | Subtract with carry (absolute,Y)
    SBC $E7              ; E5 E7 | Subtract with carry (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_171
; Address: $EBE522
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_171:
    LDA                  ; BF F1 5E BF | Load from absolute long,X into accumulator
    LDA                  ; BF E3 7B C8 | Load from absolute long,X into accumulator
    CLD                  ; D8 | Clear decimal mode flag
    BPL $18              ; 10 18 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_172
; Address: $EBE533
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_172:
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    SBC $E7FF,X          ; FD FF E7 | Subtract with carry (absolute,X)
    LDA $BD              ; A5 BD | Load from zero page into accumulator
    STZ $549C            ; 9C 9C 54 | Store zero to absolute
    PEA #$E0A0           ; F4 A0 E0 | Game work RAM access
    BEQ $70              ; F0 70 | Branch if equal
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BRA $00              ; 80 00 | Branch always
    PLX                  ; FA | Pull X register from stack
    ROR $FEFE,X          ; 7E FE FE | Rotate right (absolute,X)
    INY                  ; C8 | Increment Y register
    SED                  ; F8 | Set decimal mode flag
    CPX $FC              ; E4 FC | Compare X register (zero page)
    CLV                  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank56_DmaFunction_173
; Address: $EBE559
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_173:
    CLV                  ; B8 | Clear overflow flag
    RTI                  ; 40 | Return from interrupt
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ASL $130F,X          ; 1E 0F 13 | Arithmetic shift left (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ROR $7F7F            ; 6E 7F 7F | Rotate right (absolute)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    DEY                  ; 88 | Decrement Y register
    CMP $6FBD,X          ; DD BD 6F | Compare accumulator (absolute,X)
    ROR                  ; 6A | Rotate right (accumulator)
    EOR ($63,X)          ; 41 63 | Exclusive OR with accumulator ((zero page,X))
    ORA ($43,X)          ; 01 43 | Logical OR with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    SBC $FFDF,X          ; FD DF FF | Subtract with carry (absolute,X)
    SBC $E7              ; E5 E7 | Subtract with carry (zero page)
    INC $FD43,X          ; FE 43 FD | Increment (absolute,X)
    ADC $FDCA,X          ; 7D CA FD | Add with carry (absolute,X)
    DEY                  ; 88 | Decrement Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    BPL $18              ; 10 18 | Branch if positive
    WDM #$FF             ; 42 FF | Reserved instruction
    SBC $E7FF,X          ; FD FF E7 | Subtract with carry (absolute,X)
    LDA $BD              ; A5 BD | Load from zero page into accumulator
    STZ $449C            ; 9C 9C 44 | Store zero to absolute
    PEA #$F0B0           ; F4 B0 F0 | Push effective address to stack
    BCS $B0              ; B0 B0 | Branch if carry set
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BRA $00              ; 80 00 | Branch always
    PLX                  ; FA | Pull X register from stack
    ROR $FEFE            ; 6E FE FE | Rotate right (absolute)
    INY                  ; C8 | Increment Y register
    SED                  ; F8 | Set decimal mode flag
    CPX $FC              ; E4 FC | Compare X register (zero page)
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    RTI                  ; 40 | Return from interrupt
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ASL $3C33,X          ; 1E 33 3C | Arithmetic shift left (absolute,X)
    BIT $3F              ; 24 3F | Test bits in accumulator (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $0019,Y          ; 19 19 00 | Logical OR with accumulator (absolute,Y)
    ORA #$0A             ; 09 0A | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_174
; Address: $EBE609
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_174:
    INC                  ; 1A | Increment accumulator
    ORA $2016            ; 0D 16 20 | Logical OR with accumulator (absolute)
    ORA $0919,Y          ; 19 19 09 | Logical OR with accumulator (absolute,Y)
    ORA #$0F             ; 09 0F | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_175
; Address: $EBE620
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_175:
    JSR $0120            ; 20 20 01 | Jump to subroutine
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    ORA ($0B),Y          ; 11 0B | Logical OR with accumulator ((zero page),Y)
    INC                  ; 1A | Increment accumulator
    ROL $043B            ; 2E 3B 04 | Rotate left (absolute)
    SEC                  ; 38 | Set carry flag
    AND #$3E             ; 29 3E | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_176
; Address: $EBE630
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_176:
    JSR $0120            ; 20 20 01 | Jump to subroutine
    ORA ($11,X)          ; 01 11 | Logical OR with accumulator ((zero page,X))
    ORA ($1F),Y          ; 11 1F | Logical OR with accumulator ((zero page),Y)
    ROL $5F22,X          ; 3E 22 5F | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_178
; Address: $EBE647
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_178:
    JSR $211A            ; 20 1A 21 | PPU graphics register access
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    ROL $1E01,X          ; 3E 01 1E | Rotate left (absolute,X)
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA #$16             ; 09 16 | Logical OR with accumulator (immediate)
    ROL $5F22,X          ; 3E 22 5F | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_17A
; Address: $EBE667
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_17A:
    JSR $211A            ; 20 1A 21 | PPU graphics register access
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    ROL $1E01,X          ; 3E 01 1E | Rotate left (absolute,X)
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA #$16             ; 09 16 | Logical OR with accumulator (immediate)
    ROL $5F24,X          ; 3E 24 5F | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_17C
; Address: $EBE687
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_17C:
    JSR $211A            ; 20 1A 21 | PPU graphics register access
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    ROL $1E01,X          ; 3E 01 1E | Rotate left (absolute,X)
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA #$16             ; 09 16 | Logical OR with accumulator (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($19),Y          ; 11 19 | Logical OR with accumulator ((zero page),Y)
    ORA ($1D),Y          ; 11 1D | Logical OR with accumulator ((zero page),Y)
    ROL                  ; 2A | Rotate left (accumulator)
    AND #$37             ; 29 37 | Logical AND with accumulator (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $0C19,Y          ; 19 19 0C | Logical OR with accumulator (absolute,Y)
    ORA $3E1D,X          ; 1D 1D 3E | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_17D
; Address: $EBE6BD
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_17D:
    ROL $3F3F,X          ; 3E 3F 3F | Rotate left (absolute,X)
    CPX #$E0             ; E0 E0 | Game work RAM access
    BVC $B0              ; 50 B0 | Branch if overflow clear
    TAY                  ; A8 | Transfer accumulator to Y register
    CLD                  ; D8 | Clear decimal mode flag
    CLI                  ; 58 | Clear interrupt disable flag
    PLA                  ; 68 | Pull accumulator from stack
    TAY                  ; A8 | Transfer accumulator to Y register
    SED                  ; F8 | Set decimal mode flag
    CPX $BC              ; E4 BC | Compare X register (zero page)
    PLY                  ; 7A | Pull Y register from stack
    ADC $7B              ; 65 7B | Add with carry (zero page)
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $F0              ; F0 F0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ROR $7F7E,X          ; 7E 7E 7F | Rotate right (absolute,X)
    ASL $000E            ; 0E 0E 00 | Arithmetic shift left (absolute)
    EOR ($6F),Y          ; 51 6F | Exclusive OR with accumulator ((zero page),Y)
    ASL $000E            ; 0E 0E 00 | Arithmetic shift left (absolute)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_17E
; Address: $EBE702
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_17E:
    JSR $70E0            ; 20 E0 70 | Jump to subroutine
    BVS $00              ; 70 00 | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    CMP $7DBD,X          ; DD BD 7D | Compare accumulator (absolute,X)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    BVS $70              ; 70 70 | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    CMP $FDDD,X          ; DD DD FD | Compare accumulator (absolute,X)
    SBC $0000,X          ; FD 00 00 | Subtract with carry (absolute,X)
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    LSR $697F            ; 4E 7F 69 | Logical shift right (absolute)
    LSR $3619,X          ; 5E 19 36 | Logical shift right (absolute,X)
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank56_DmaFunction_17F
; Address: $EBE744
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_17F:
    JSR $3020            ; 20 20 30 | Jump to subroutine
    BMI $28              ; 30 28 | Branch if negative
    SEC                  ; 38 | Set carry flag
    LDA ($A9),Y          ; B1 A9 | Load from (zero page),Y into accumulator
    PEA #$44EC           ; F4 EC 44 | Push effective address to stack
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank56_DmaFunction_180
; Address: $EBE754
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_180:
    JSR $3020            ; 20 20 30 | Jump to subroutine
    BMI $38              ; 30 38 | Branch if negative
    SEC                  ; 38 | Set carry flag
    LDA $FCB9,Y          ; B9 B9 FC | Load from absolute,Y into accumulator
    ADC #$2F             ; 69 2F | Add with carry (immediate)
    BMI $1F              ; 30 1F | Branch if negative
    BMI $3D              ; 30 3D | Branch if negative
    ORA $08              ; 05 08 | Logical OR with accumulator (zero page)
    BPL $7F              ; 10 7F | Branch if positive

;------------------------------------------------------------------------------
; Bank56_DmaFunction_181
; Address: $EBE77A
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_181:
    JSR $183F            ; 20 3F 18 | Jump to subroutine
    CMP ($BF,X)          ; C1 BF | Compare accumulator ((zero page,X))
    STZ $FC14,X          ; 9E 14 FC | Store zero to absolute,X
    CLI                  ; 58 | Clear interrupt disable flag
    INX                  ; E8 | Increment X register
    LDY #$60             ; A0 60 | Load immediate value into Y register
    BPL $08              ; 10 08 | Branch if positive
    INC $FCFE,X          ; FE FE FC | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    INC $FEE2,X          ; FE E2 FE | Increment (absolute,X)
    CPX $FC              ; E4 FC | Compare X register (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank56_DmaFunction_183
; Address: $EBE7A5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_183:
    JSR $3A15            ; 20 15 3A | Jump to subroutine
    DEC                  ; 3A | Decrement accumulator
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $7F              ; 10 7F | Branch if positive

;------------------------------------------------------------------------------
; Bank56_DmaFunction_184
; Address: $EBE7BA
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_184:
    JSR $103F            ; 20 3F 10 | Jump to subroutine
    LDX $5E              ; A6 5E | Load from zero page into X register
    REP #$3E             ; C2 3E | Reset processor status bits
    JMP $9CBC            ; 4C BC 9C | Jump to address
    INY                  ; C8 | Increment Y register
    SED                  ; F8 | Set decimal mode flag
    BVC $B0              ; 50 B0 | Branch if overflow clear
    BPL $08              ; 10 08 | Branch if positive
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    INC $FCFC,X          ; FE FC FC | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    INC $FEE2,X          ; FE E2 FE | Increment (absolute,X)
    CPX $FC              ; E4 FC | Compare X register (zero page)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_185
; Address: $EBE7E3
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_185:
    JSR $302F            ; 20 2F 30 | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    AND #$3E             ; 29 3E | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_187
; Address: $EBE7FA
; Size: 116 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_187:
    JSR $183F            ; 20 3F 18 | Jump to subroutine
    ROR $7E82,X          ; 7E 82 7E | Rotate right (absolute,X)
    CPX $DC6C            ; EC 6C DC | Compare X register (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    INX                  ; E8 | Increment X register
    BPL $F0              ; 10 F0 | Branch if positive
    BPL $08              ; 10 08 | Branch if positive
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    INC $FCFC,X          ; FE FC FC | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    INC $FEE2,X          ; FE E2 FE | Increment (absolute,X)
    CPX $FC              ; E4 FC | Compare X register (zero page)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BVS $DF              ; 70 DF | Branch if overflow set
    INX                  ; E8 | Increment X register
    CLD                  ; D8 | Clear decimal mode flag
    DEC $BFBF            ; CE BF BF | Decrement (absolute)
    BVS $FF              ; 70 FF | Branch if overflow set
    BEQ $FF              ; F0 FF | Branch if equal
    DEC $FF7F            ; CE 7F FF | Decrement (absolute)
    CPY $28FF            ; CC FF 28 | Compare Y register (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    SED                  ; F8 | Set decimal mode flag
    AND $F3F7,X          ; 3D F7 F3 | Logical AND with accumulator (absolute,X)
    LDA $BFFF5F          ; AF 5F FF BF | Load from absolute long address into accumulator
    LDY $3CDF            ; AC DF 3C | Load from absolute address into Y register
    PEA #$0F7B           ; F4 7B 0F | Push effective address to stack
    ROL $DFF1,X          ; 3E F1 DF | Rotate left (absolute,X)
    CPY $FCFF            ; CC FF FC | Compare Y register (absolute)
    LDA                  ; BF F0 FF 0F | Load from absolute long,X into accumulator
    CMP $E73B,Y          ; D9 3B E7 | Compare accumulator (absolute,Y)
    LDX $FAD7            ; AE D7 FA | Load from absolute address into X register
    ADC $FFC2,X          ; 7D C2 FF | Add with carry (absolute,X)
    ORA $9CFF            ; 0D FF 9C | Logical OR with accumulator (absolute)
    DEC $BEFF            ; CE FF BE | Decrement (absolute)
    SBC $FBC6,X          ; FD C6 FB | Subtract with carry (absolute,X)
    AND $98DE            ; 2D DE 98 | Logical AND with accumulator (absolute)
    SBC $BE              ; E5 BE | Subtract with carry (zero page)
    BCC $EF              ; 90 EF | Branch if carry clear
    EOR $0EB2            ; 4D B2 0E | Exclusive OR with accumulator (absolute)
    SBC $7FB3,X          ; FD B3 7F | Subtract with carry (absolute,X)
    SBC $3BCF,X          ; FD CF 3B | Subtract with carry (absolute,X)
    INC $77FF            ; EE FF 77 | Increment (absolute)
    STY $CE7B            ; 8C 7B CE | Store Y register to absolute address
    AND $73BF,Y          ; 39 BF 73 | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_188
; Address: $EBE96C
; Size: 137 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_188:
    SBC $3BFF,X          ; FD FF 3B | Subtract with carry (absolute,X)
    SBC ($FE),Y          ; F1 FE | Subtract with carry ((zero page),Y)
    PHX                  ; DA | Push X register to stack
    CPY $7F77            ; CC 77 7F | Compare Y register (absolute)
    AND $FFF3,X          ; 3D F3 FF | Logical AND with accumulator (absolute,X)
    LDA $7F1FEC          ; AF EC 1F 7F | Load from absolute long address into accumulator
    EOR $3FFF,X          ; 5D FF 3F | Exclusive OR with accumulator (absolute,X)
    SBC $F0FF            ; ED FF F0 | Subtract with carry (absolute)
    CMP ($7F,X)          ; C1 7F | Compare accumulator ((zero page,X))
    PHB                  ; 8B | Push data bank register to stack
    STZ $BF65,X          ; 9E 65 BF | Store zero to absolute,X
    SBC $FD3B,X          ; FD 3B FD | Subtract with carry (absolute,X)
    SBC $F0FF,Y          ; F9 FF F0 | Subtract with carry (absolute,Y)
    CMP $FB              ; C5 FB | Compare accumulator (zero page)
    ROL $BFCD,X          ; 3E CD BF | Rotate left (absolute,X)
    ORA $3BFF            ; 0D FF 3B | Logical OR with accumulator (absolute)
    TSX                  ; BA | Transfer stack pointer to X register
    WDM #$FD             ; 42 FD | Reserved instruction
    PLB                  ; AB | Pull data bank register from stack
    STA $FCAFF4          ; 8F F4 AF FC | Store accumulator to absolute long address
    SBC #$CF             ; E9 CF | Subtract with carry (immediate)
    STA                  ; 9F 7E E2 FF | Store accumulator to absolute long,X
    CPX $FF              ; E4 FF | Compare X register (zero page)
    LDA                  ; BF FF FD CE | Load from absolute long,X into accumulator
    STZ $DA35            ; 9C 35 DA | Store zero to absolute
    CPY $BFFF            ; CC FF BF | Compare Y register (absolute)
    SBC $73CE,X          ; FD CE 73 | Subtract with carry (absolute,X)
    LDY $EA15,X          ; BC 15 EA | Load from absolute,X into Y register
    SBC $3FEF,Y          ; F9 EF 3F | Subtract with carry (absolute,Y)
    PHX                  ; DA | Push X register to stack
    ADC $B49E,Y          ; 79 9E B4 | Add with carry (absolute,Y)
    LDA                  ; BF 7B F7 FF | Load from absolute long,X into accumulator
    DEC $F7EF,X          ; DE EF F7 | Decrement (absolute,X)
    ADC $B09E,Y          ; 79 9E B0 | Add with carry (absolute,Y)
    SBC $FFFF,Y          ; F9 FF FF | Subtract with carry (absolute,Y)
    INC $FFFB            ; EE FB FF | Increment (absolute)
    JMP $2BDCE7          ; 5C E7 DC 2B | Jump to address long
    SBC ($4E),Y          ; F1 4E | Subtract with carry ((zero page),Y)
    AND $37FF,X          ; 3D FF 37 | Logical AND with accumulator (absolute,X)
    INC $FFFD            ; EE FD FF | Increment (absolute)
    STA $F0CF3C          ; 8F 3C CF F0 | Store accumulator to absolute long address
    ROR $3F9F            ; 6E 9F 3F | Rotate right (absolute)
    CPX $F13F            ; EC 3F F1 | Compare X register (absolute)
    SBC $F6CF,Y          ; F9 CF F6 | Subtract with carry (absolute,Y)
    LDA $9AEE,X          ; BD EE 9A | Load from absolute,X into accumulator
    SBC $F77B,X          ; FD 7B F7 | Subtract with carry (absolute,X)
    XBA                  ; EB | Exchange accumulator bytes
    SBC $3FD6            ; ED D6 3F | Subtract with carry (absolute)
    CPY $CA              ; C4 CA | Compare Y register (zero page)
    ORA $07F6,X          ; 1D F6 07 | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_189
; Address: $EBEB40
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_189:
    SBC $73FE,X          ; FD FE 73 | Subtract with carry (absolute,X)
    INC $FBC7,X          ; FE C7 FB | Increment (absolute,X)
    PEA #$47FF           ; F4 FF 47 | Push effective address to stack
    LSR $2CAF,X          ; 5E AF 2C | Logical shift right (absolute,X)
    INX                  ; E8 | Increment X register
    CMP $2DD2,X          ; DD D2 2D | Compare accumulator (absolute,X)
    PEA #$C38F           ; F4 8F C3 | Push effective address to stack
    INC $FE03,X          ; FE 03 FE | Increment (absolute,X)
    STX $3BF9            ; 8E F9 3B | Store X register to absolute address
    AND ($FF),Y          ; 31 FF | Logical AND with accumulator ((zero page),Y)
    XBA                  ; EB | Exchange accumulator bytes
    SBC $BFC3,X          ; FD C3 BF | Subtract with carry (absolute,X)
    ROL $3FDF            ; 2E DF 3F | Rotate left (absolute)
    PLX                  ; FA | Pull X register from stack
    LDY $EAD3            ; AC D3 EA | Load from absolute address into Y register
    STA $FFCFFF          ; 8F FF CF FF | Store accumulator to absolute long address
    WDM #$40             ; 42 40 | Reserved instruction
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    ROL $00              ; 26 00 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_18A
; Address: $EBEBD6
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_18A:
    JSR $407F            ; 20 7F 40 | Jump to subroutine
    EOR ($7F,X)          ; 41 7F | Exclusive OR with accumulator ((zero page,X))
    REP #$02             ; C2 02 | Reset processor status bits
    CPX $00              ; E4 00 | Compare X register (zero page)
    WDM #$00             ; 42 00 | Reserved instruction
    DEX                  ; CA | Decrement X register
    INC $FE0C,X          ; FE 0C FE | Increment (absolute,X)
    INC $FE80,X          ; FE 80 FE | Increment (absolute,X)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    WDM #$40             ; 42 40 | Reserved instruction
    ROL $0A00            ; 2E 00 0A | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_18B
; Address: $EBEC16
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_18B:
    JSR $407F            ; 20 7F 40 | Jump to subroutine
    SEP #$02             ; E2 02 | Set processor status bits
    DEX                  ; CA | Decrement X register
    PHP                  ; 08 | Push processor status to stack
    ROL $00              ; 26 00 | Rotate left (zero page)
    PLX                  ; FA | Pull X register from stack
    JMP $0000            ; 4C 00 00 | Jump to address
    INC $FE04,X          ; FE 04 FE | Increment (absolute,X)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC $FE30,X          ; FE 30 FE | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    BIT $3C00            ; 2C 00 3C | Test bits in accumulator (absolute)
    EOR $3A00,Y          ; 59 00 3A | Exclusive OR with accumulator (absolute,Y)
    PLP                  ; 28 | Pull processor status from stack
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank56_DmaFunction_18C
; Address: $EBEC65
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_18C:
    JSL $005202          ; 22 02 52 00 | Jump to subroutine long
    LDY $7400            ; AC 00 74 | Load from absolute address into Y register
    DEC $0000            ; CE 00 00 | Decrement (absolute)
    INC $FE04,X          ; FE 04 FE | Increment (absolute,X)
    INC $FE02,X          ; FE 02 FE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_18D
; Address: $EBEC7D
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_18D:
    INC $FE30,X          ; FE 30 FE | Increment (absolute,X)
    PLY                  ; 7A | Pull Y register from stack
    ROL $7000            ; 2E 00 70 | Rotate left (absolute)
    AND $5300            ; 2D 00 53 | Logical AND with accumulator (absolute)
    WDM #$00             ; 42 00 | Reserved instruction
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    ORA ($7F),Y          ; 11 7F | Logical OR with accumulator ((zero page),Y)
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    PLX                  ; FA | Pull X register from stack
    ASL $7600            ; 0E 00 76 | Arithmetic shift left (absolute)
    JMP $006600          ; 5C 00 66 00 | Jump to address long
    SEP #$00             ; E2 00 | Set processor status bits
    BNE $00              ; D0 00 | Branch if not equal
    LDY $00              ; A4 00 | Load from zero page into Y register
    INC $FEF0,X          ; FE F0 FE | Increment (absolute,X)
    DEY                  ; 88 | Decrement Y register
    INC $FE80,X          ; FE 80 FE | Increment (absolute,X)
    BRA $FE              ; 80 FE | Branch always
    INC $FE02,X          ; FE 02 FE | Increment (absolute,X)
    INC $4D00,X          ; FE 00 4D | Increment (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    ROL $00              ; 26 00 | Rotate left (zero page)
    AND $7200            ; 2D 00 72 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_18E
; Address: $EBECCF
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_18E:
    JSR $7F02            ; 20 02 7F | Jump to subroutine
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    EOR ($7F,X)          ; 41 7F | Exclusive OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    STZ $00              ; 64 00 | Store zero to zero page
    BVC $00              ; 50 00 | Branch if overflow clear
    CLD                  ; D8 | Clear decimal mode flag
    BVC $00              ; 50 00 | Branch if overflow clear
    INX                  ; E8 | Increment X register
    PHA                  ; 48 | Push accumulator to stack
    INC $FE82,X          ; FE 82 FE | Increment (absolute,X)
    INC $FE40,X          ; FE 40 FE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_18F
; Address: $EBECF8
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_18F:
    JSR $20FE            ; 20 FE 20 | Jump to subroutine
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC $5D00,X          ; FE 00 5D | Increment (absolute,X)
    ROL $0A00            ; 2E 00 0A | Rotate left (absolute)
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    ROL $3500            ; 2E 00 35 | Rotate left (absolute)
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    LDX #$00             ; A2 00 | Load immediate value into X register
    BVC $00              ; 50 00 | Branch if overflow clear
    TSX                  ; BA | Transfer stack pointer to X register

;------------------------------------------------------------------------------
; Bank56_DmaFunction_190
; Address: $EBED29
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_190:
    JMP $009A00          ; 5C 00 9A 00 | Jump to address long
    RTI                  ; 40 | Return from interrupt
    INC $FE80,X          ; FE 80 FE | Increment (absolute,X)
    BRA $FE              ; 80 FE | Branch always
    RTI                  ; 40 | Return from interrupt
    INC $FE20,X          ; FE 20 FE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_191
; Address: $EBED3A
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_191:
    JSR $00FE            ; 20 FE 00 | Jump to subroutine
    INC $FE02,X          ; FE 02 FE | Increment (absolute,X)
    CPX #$7F             ; E0 7F | Compare X register (immediate)
    ROL $FF              ; 26 FF | Rotate left (zero page)
    CMP $3D              ; C5 3D | Compare accumulator (zero page)
    STA $DD7D            ; 8D 7D DD | Store accumulator to absolute address
    AND $39DD,Y          ; 39 DD 39 | Logical AND with accumulator (absolute,Y)
    ASL $79              ; 06 79 | Arithmetic shift left (zero page)
    ORA $7BF6            ; 0D F6 7B | Logical OR with accumulator (absolute)
    STY $1D              ; 84 1D | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank56_DmaFunction_192
; Address: $EBED59
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_192:
    JSL $016B14          ; 22 14 6B 01 | Jump to subroutine long
    ROL $3708,X          ; 3E 08 37 | Rotate left (absolute,X)
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
    PHP                  ; 08 | Push processor status to stack
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    ASL $E3              ; 06 E3 | Arithmetic shift left (zero page)
    ASL $C3              ; 06 C3 | Arithmetic shift left (zero page)
    ASL $0E83            ; 0E 83 0E | Arithmetic shift left (absolute)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    CPX #$7F             ; E0 7F | Compare X register (immediate)
    ROL $BF              ; 26 BF | Rotate left (zero page)
    STA $5D              ; 85 5D | Store accumulator to zero page
    STA $ED7D,X          ; 9D 7D ED | Store accumulator to absolute,X
    AND $39DD,Y          ; 39 DD 39 | Logical AND with accumulator (absolute,Y)
    SEI                  ; 78 | Set interrupt disable flag
    EOR $3BB6            ; 4D B6 3B | Exclusive OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_193
; Address: $EBEDB7
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_193:
    CPY $1D              ; C4 1D | Compare Y register (zero page)
    AND $0006,Y          ; 39 06 00 | Logical AND with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    XBA                  ; EB | Exchange accumulator bytes
    PLA                  ; 68 | Pull accumulator from stack
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    BRA $E1              ; 80 E1 | Branch always
    BRA $E0              ; 80 E0 | Game work RAM access
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    DEY                  ; 88 | Decrement Y register
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    ASL $73              ; 06 73 | Arithmetic shift left (zero page)
    ASL $33              ; 06 33 | Arithmetic shift left (zero page)
    ASL $0E23            ; 0E 23 0E | Arithmetic shift left (absolute)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    CPX #$7F             ; E0 7F | Compare X register (immediate)
    ROL $BF              ; 26 BF | Rotate left (zero page)
    STA $5D              ; 85 5D | Store accumulator to zero page
    STA $DD7D            ; 8D 7D DD | Store accumulator to absolute address
    AND $39DD,Y          ; 39 DD 39 | Logical AND with accumulator (absolute,Y)
    AND $1A              ; 25 1A | Logical AND with accumulator (zero page)
    EOR $3BB6            ; 4D B6 3B | Exclusive OR with accumulator (absolute)
    CMP $1C              ; C5 1C | Compare accumulator (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank56_DmaFunction_194
; Address: $EBEE1C
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_194:
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PLA                  ; 68 | Pull accumulator from stack
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    PLX                  ; FA | Pull X register from stack
    DEY                  ; 88 | Decrement Y register
    BRA $E1              ; 80 E1 | Branch always
    BRA $E0              ; 80 E0 | Game work RAM access
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank56_DmaFunction_195
; Address: $EBEE34
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_195:
    DEY                  ; 88 | Decrement Y register
    BRA $7F              ; 80 7F | Branch always
    DEY                  ; 88 | Decrement Y register
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    ASL $A3              ; 06 A3 | Arithmetic shift left (zero page)
    ASL $33              ; 06 33 | Arithmetic shift left (zero page)
    ASL $0ED3            ; 0E D3 0E | Arithmetic shift left (absolute)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    AND $0107,X          ; 3D 07 01 | Logical AND with accumulator (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    SBC $799D,X          ; FD 9D 79 | Subtract with carry (absolute,X)
    STA $9C79,X          ; 9D 79 9C | Store accumulator to absolute,X
    CLI                  ; 58 | Clear interrupt disable flag
    STA $9F59,X          ; 9D 59 9F | Store accumulator to absolute,X
    CLI                  ; 58 | Clear interrupt disable flag
    STA                  ; 9F 51 9B 51 | Store accumulator to absolute long,X
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))
    ORA #$76             ; 09 76 | Logical OR with accumulator (immediate)
    BPL $6F              ; 10 6F | Branch if positive
    ORA $1866,Y          ; 19 66 18 | Logical OR with accumulator (absolute,Y)
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    ORA ($6E),Y          ; 11 6E | Logical OR with accumulator ((zero page),Y)
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    BRA $E0              ; 80 E0 | Game work RAM access
    DEY                  ; 88 | Decrement Y register
    PLA                  ; 68 | Pull accumulator from stack
    PHP                  ; 08 | Push processor status to stack
    PLA                  ; 68 | Pull accumulator from stack
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    DEY                  ; 88 | Decrement Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    BIT #$A8             ; 89 A8 | Test bits in accumulator (immediate)
    BIT #$A8             ; 89 A8 | Test bits in accumulator (immediate)
    BRA $7F              ; 80 7F | Branch always
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    EOR $7D0F            ; 4D 0F 7D | Exclusive OR with accumulator (absolute)
    INC $FC07,X          ; FE 07 FC | Increment (absolute,X)
    INC $FFFB,X          ; FE FB FF | Increment (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank56_DmaFunction_196
; Address: $EBEEB8
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_196:
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    STX $06F9            ; 8E F9 06 | Store X register to absolute address
    STA $9D79,X          ; 9D 79 9D | Store accumulator to absolute,X
    ADC $589C,Y          ; 79 9C 58 | Add with carry (absolute,Y)
    STA $9F59,X          ; 9D 59 9F | Store accumulator to absolute,X
    CLI                  ; 58 | Clear interrupt disable flag
    STA                  ; 9F 51 9B 51 | Store accumulator to absolute long,X
    EOR ($08,X)          ; 41 08 | Exclusive OR with accumulator ((zero page,X))
    ORA ($6E),Y          ; 11 6E | Logical OR with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    ORA $1866,Y          ; 19 66 18 | Logical OR with accumulator (absolute,Y)
    ORA ($6E),Y          ; 11 6E | Logical OR with accumulator ((zero page),Y)
    ORA ($6E),Y          ; 11 6E | Logical OR with accumulator ((zero page),Y)
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    BRA $E0              ; 80 E0 | Game work RAM access
    DEY                  ; 88 | Decrement Y register
    PLA                  ; 68 | Pull accumulator from stack
    PHP                  ; 08 | Push processor status to stack
    PLA                  ; 68 | Pull accumulator from stack
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    BIT #$80             ; 89 80 | Test bits in accumulator (immediate)
    LDA #$88             ; A9 88 | Load immediate value into accumulator
    BRA $7F              ; 80 7F | Branch always
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    BRA $7F              ; 80 7F | Branch always
    DEY                  ; 88 | Decrement Y register
    LDA                  ; BF 0F 7F 0F | Load from absolute long,X into accumulator
    INC $FF07,X          ; FE 07 FF | Increment (absolute,X)
    INC $FE0F,X          ; FE 0F FE | Increment (absolute,X)
    INC $0CFF,X          ; FE FF 0C | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    TXA                  ; 8A | Transfer X register to accumulator
    SBC $9D02,X          ; FD 02 9D | Subtract with carry (absolute,X)
    ADC $799D,Y          ; 79 9D 79 | Add with carry (absolute,Y)
    STZ $9D58            ; 9C 58 9D | Store zero to absolute
    EOR $589F,Y          ; 59 9F 58 | Exclusive OR with accumulator (absolute,Y)
    STA                  ; 9F 51 9B 51 | Store accumulator to absolute long,X
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ORA #$76             ; 09 76 | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    ORA $1866,Y          ; 19 66 18 | Logical OR with accumulator (absolute,Y)
    ORA ($6E),Y          ; 11 6E | Logical OR with accumulator ((zero page),Y)
    ORA ($6E),Y          ; 11 6E | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_197
; Address: $EBEF3E
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_197:
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    BRA $E0              ; 80 E0 | Game work RAM access
    DEY                  ; 88 | Decrement Y register
    PLA                  ; 68 | Pull accumulator from stack
    PHP                  ; 08 | Push processor status to stack
    PLA                  ; 68 | Pull accumulator from stack
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    BIT #$80             ; 89 80 | Test bits in accumulator (immediate)
    PLB                  ; AB | Pull data bank register from stack
    DEY                  ; 88 | Decrement Y register
    BRA $7F              ; 80 7F | Branch always
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    BRA $7F              ; 80 7F | Branch always
    DEY                  ; 88 | Decrement Y register
    SBC $FF0F            ; ED 0F FF | Subtract with carry (absolute)
    ROR $7E07,X          ; 7E 07 7E | Rotate right (absolute,X)
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    ORA $3CE2,X          ; 1D E2 3C | Logical OR with accumulator (absolute,X)
    SBC $FD02,X          ; FD 02 FD | Subtract with carry (absolute,X)
    PHB                  ; 8B | Push data bank register to stack
    ORA ($8F,X)          ; 01 8F | Logical OR with accumulator ((zero page,X))
    STA ($8F,X)          ; 81 8F | Store accumulator to (zero page,X)
    BRA $8F              ; 80 8F | Branch always
    STA                  ; 9F 08 9F 0B | Store accumulator to absolute long,X
    LDA                  ; BF 03 FF 01 | Load from absolute long,X into accumulator
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    BRA $7F              ; 80 7F | Branch always
    ADC $F708,X          ; 7D 08 F7 | Add with carry (absolute,X)
    PEA #$FC03           ; F4 03 FC | Push effective address to stack
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    INC $FAFF,X          ; FE FF FA | Increment (absolute,X)
    INC $F8FF,X          ; FE FF F8 | Increment (absolute,X)
    BEQ $FF              ; F0 FF | Branch if equal
    SBC $FD02,X          ; FD 02 FD | Subtract with carry (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    SBC #$16             ; E9 16 | Subtract with carry (immediate)
    SBC $C112            ; ED 12 C1 | Subtract with carry (absolute)
    ROL $38C7,X          ; 3E C7 38 | Rotate left (absolute,X)
    STA $018970          ; 8F 70 89 01 | Store accumulator to absolute long address
    STA $9F81            ; 8D 81 9F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank56_DmaFunction_198
; Address: $EBEFC5
; Size: 117 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_198:
    STA ($9F,X)          ; 81 9F | Store accumulator to (zero page,X)
    STX $BF              ; 86 BF | Store X register to zero page
    LDA                  ; BF 09 FF 01 | Load from absolute long,X into accumulator
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    INC $7E81,X          ; FE 81 7E | Increment (absolute,X)
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    STX $79              ; 86 79 | Store X register to zero page
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    SED                  ; F8 | Set decimal mode flag
    BEQ $FF              ; F0 FF | Branch if equal
    SBC $F106,Y          ; F9 06 F1 | Subtract with carry (absolute,Y)
    ASL $07F8            ; 0E F8 07 | Arithmetic shift left (absolute)
    CMP $9322,X          ; DD 22 93 | Compare accumulator (absolute,X)
    JMP ($7887)          ; 6C 87 78 | Jump to address (absolute indirect)
    STA $D91971          ; 8F 71 19 D9 | Store accumulator to absolute long address
    ORA $19D9,Y          ; 19 D9 19 | Logical OR with accumulator (absolute,Y)
    CMP ($19),Y          ; D1 19 | Compare accumulator ((zero page),Y)
    CMP $C119,Y          ; D9 19 C1 | Compare accumulator (absolute,Y)
    ORA #$C1             ; 09 C1 | Logical OR with accumulator (immediate)
    ORA $39C1,Y          ; 19 C1 39 | Logical OR with accumulator (absolute,Y)
    STA ($19,X)          ; 81 19 | Store accumulator to (zero page,X)
    INC $18              ; E6 18 | Increment (zero page)
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    ORA $01E6,Y          ; 19 E6 01 | Logical OR with accumulator (absolute,Y)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    PHB                  ; 8B | Push data bank register to stack
    ORA ($8F,X)          ; 01 8F | Logical OR with accumulator ((zero page,X))
    STA                  ; 9F 83 9F 81 | Store accumulator to absolute long,X
    LDA                  ; BF 08 FF 0D | Load from absolute long,X into accumulator
    LDA                  ; BF 07 FF 1D | Load from absolute long,X into accumulator
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    PHP                  ; 08 | Push processor status to stack
    ORA $07F2            ; 0D F2 07 | Logical OR with accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    ORA $FEE2,X          ; 1D E2 FE | Logical OR with accumulator (absolute,X)
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    SED                  ; F8 | Set decimal mode flag
    BEQ $FF              ; F0 FF | Branch if equal
    SBC $FC03,X          ; FD 03 FC | Subtract with carry (absolute,X)
    SBC $F906,Y          ; F9 06 F9 | Subtract with carry (absolute,Y)
    ASL $DD              ; 06 DD | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_19A
; Address: $EBF05D
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_19A:
    PLA                  ; 68 | Pull accumulator from stack
    STA $C03970          ; 8F 70 39 C0 | Store accumulator to absolute long address
    BRA $7F              ; 80 7F | Branch always
    LDA $B93F,Y          ; B9 3F B9 | Load from absolute,Y into accumulator
    AND $39C6,Y          ; 39 C6 39 | Logical AND with accumulator (absolute,Y)
    DEC $03              ; C6 03 | Decrement (zero page)
    SED                  ; F8 | Set decimal mode flag
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    ADC ($FF,X)          ; 61 FF | Add with carry ((zero page,X))
    BEQ $FF              ; F0 FF | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    INY                  ; C8 | Increment Y register
    BRA $FF              ; 80 FF | Branch always
    ADC ($9E,X)          ; 61 9E | Add with carry ((zero page,X))
    BNE $2F              ; D0 2F | Branch if not equal
    SED                  ; F8 | Set decimal mode flag
    INY                  ; C8 | Increment Y register
    BRA $7F              ; 80 7F | Branch always
    STZ $C03F            ; 9C 3F C0 | Store zero to absolute
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $7F              ; F0 7F | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    STA $10EF71          ; 8F 71 EF 10 | Store accumulator to absolute long address
    BCC $67              ; 90 67 | Branch if carry clear
    TYA                  ; 98 | Transfer Y register to accumulator
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    STA $F10F70          ; 8F 70 0F F1 | Store accumulator to absolute long address
    AND $3BC0,Y          ; 39 C0 3B | Logical AND with accumulator (absolute,Y)
    BCS $3F              ; B0 3F | Branch if carry set
    LDA $913F,Y          ; B9 3F 91 | Load from absolute,Y into accumulator
    BMI $CF              ; 30 CF | Branch if negative
    AND $11C6,Y          ; 39 C6 11 | Logical AND with accumulator (absolute,Y)
    INC $FC03            ; EE 03 FC | Increment (absolute)
    SED                  ; F8 | Set decimal mode flag
    ADC $40FF,Y          ; 79 FF 40 | Add with carry (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    INX                  ; E8 | Increment X register
    BCS $FF              ; B0 FF | Branch if carry set
    ADC $4086,Y          ; 79 86 40 | Add with carry (absolute,Y)
    LDA                  ; BF F8 07 E8 | Load from absolute long,X into accumulator
    BCS $4F              ; B0 4F | Branch if carry set
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    INC $F001,X          ; FE 01 F0 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_19B
; Address: $EBF102
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_19B:
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $7F              ; F0 7F | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    BMI $EF              ; 30 EF | Branch if negative
    BPL $6F              ; 10 6F | Branch if positive
    BCC $47              ; 90 47 | Branch if carry clear
    CLV                  ; B8 | Clear overflow flag
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    SBC ($0F),Y          ; F1 0F | Subtract with carry ((zero page),Y)
    BEQ $39              ; F0 39 | Branch if equal
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    STA ($3F),Y          ; 91 3F | Store accumulator to (zero page),Y
    BRA $3F              ; 80 3F | Branch always
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    SED                  ; F8 | Set decimal mode flag
    INX                  ; E8 | Increment X register
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    WDM #$FF             ; 42 FF | Reserved instruction
    STA                  ; 9F FF 8F FF | Store accumulator to absolute long,X
    CPX $E813            ; EC 13 E8 | Compare X register (absolute)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    WDM #$BD             ; 42 BD | Reserved instruction
    STA                  ; 9F 60 8F 70 | Store accumulator to absolute long,X
    INC $F001,X          ; FE 01 F0 | Increment (absolute,X)
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $7F              ; F0 7F | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    BMI $EF              ; 30 EF | Branch if negative
    BPL $4F              ; 10 4F | Branch if positive
    BCS $47              ; B0 47 | Branch if carry set
    CLV                  ; B8 | Clear overflow flag
    SEC                  ; 38 | Set carry flag
    SEI                  ; 78 | Set interrupt disable flag
    SBC ($0F),Y          ; F1 0F | Subtract with carry ((zero page),Y)
    SBC ($27),Y          ; F1 27 | Subtract with carry ((zero page),Y)
    ROL $1C03            ; 2E 03 1C | Rotate left (absolute)
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank56_DmaFunction_19C
; Address: $EBF193
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_19C:
    SBC $FC03,X          ; FD 03 FC | Subtract with carry (absolute,X)
    BEQ $04              ; F0 04 | Branch if equal
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    ORA $06F2            ; 0D F2 06 | Logical OR with accumulator (absolute)
    SBC $FFFF,Y          ; F9 FF FF | Subtract with carry (absolute,Y)
    INC $EE01,X          ; FE 01 EE | Increment (absolute,X)
    ORA ($7F),Y          ; 11 7F | Logical OR with accumulator ((zero page),Y)
    BRA $7C              ; 80 7C | Branch always
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $0F              ; F0 0F | Branch if equal
    BRA $7F              ; 80 7F | Branch always
    ASL $3E07,X          ; 1E 07 3E | Arithmetic shift left (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SBC $F906,X          ; FD 06 F9 | Subtract with carry (absolute,X)
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    ORA $1DF2            ; 0D F2 1D | Logical OR with accumulator (absolute)
    SEP #$0E             ; E2 0E | Set processor status bits
    SBC ($06),Y          ; F1 06 | Subtract with carry ((zero page),Y)
    SBC $FFFF,Y          ; F9 FF FF | Subtract with carry (absolute,Y)
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    BRA $7C              ; 80 7C | Branch always
    SED                  ; F8 | Set decimal mode flag
    BEQ $0F              ; F0 0F | Branch if equal
    BMI $CF              ; 30 CF | Branch if negative
    BRA $7F              ; 80 7F | Branch always
    ORA $0F              ; 05 0F | Logical OR with accumulator (zero page)
    ASL $3E07,X          ; 1E 07 3E | Arithmetic shift left (absolute,X)
    ROL $7F0F,X          ; 3E 0F 7F | Rotate left (absolute,X)
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    SBC $F807,X          ; FD 07 F8 | Subtract with carry (absolute,X)
    XBA                  ; EB | Exchange accumulator bytes
    ORA $2CF2            ; 0D F2 2C | Logical OR with accumulator (absolute)
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    INC $EE01,X          ; FE 01 EE | Increment (absolute,X)
    ORA ($7E),Y          ; 11 7E | Logical OR with accumulator ((zero page),Y)
    STA ($74,X)          ; 81 74 | Store accumulator to (zero page,X)
    PHB                  ; 8B | Push data bank register to stack
    BVS $8F              ; 70 8F | Branch if overflow set
    BEQ $0F              ; F0 0F | Branch if equal
    BCC $6F              ; 90 6F | Branch if carry clear

;------------------------------------------------------------------------------
; Bank56_DmaFunction_19D
; Address: $EBF23E
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_19D:
    JSR $0FDF            ; 20 DF 0F | Jump to subroutine
    SBC $FC03,X          ; FD 03 FC | Subtract with carry (absolute,X)
    SBC $F30C,X          ; FD 0C F3 | Subtract with carry (absolute,X)
    ASL $12E1,X          ; 1E E1 12 | Arithmetic shift left (absolute,X)
    SBC $1FE0            ; ED E0 1F | Subtract with carry (absolute)
    BRA $7F              ; 80 7F | Branch always
    STA $FFBFFF          ; 8F FF BF FF | Store accumulator to absolute long address
    SBC $F0FF,Y          ; F9 FF F0 | Subtract with carry (absolute,Y)
    BEQ $FF              ; F0 FF | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank56_DmaFunction_19E
; Address: $EBF270
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_19E:
    JSR $30DF            ; 20 DF 30 | Jump to subroutine
    BVS $8F              ; 70 8F | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 06 F9 0F | Load from absolute long,X into accumulator
    BEQ $0F              ; F0 0F | Branch if equal
    ADC $030F,Y          ; 79 0F 03 | Add with carry (absolute,Y)
    STA                  ; 9F 03 FF 03 | Store accumulator to absolute long,X
    SBC $FC03,X          ; FD 03 FC | Subtract with carry (absolute,X)
    SBC $A35C,X          ; FD 5C A3 | Subtract with carry (absolute,X)
    BIT $DB              ; 24 DB | Test bits in accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    PEA #$A00B           ; F4 0B A0 | Push effective address to stack
    STA $FF97FF          ; 8F FF 97 FF | Store accumulator to absolute long address
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    BEQ $FF              ; F0 FF | Branch if equal
    BNE $FF              ; D0 FF | Branch if not equal
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank56_DmaFunction_19F
; Address: $EBF2B2
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_19F:
    JSR $70DF            ; 20 DF 70 | Jump to subroutine
    STA $569768          ; 8F 68 97 56 | Store accumulator to absolute long address
    LDA #$0F             ; A9 0F | Load immediate value into accumulator
    BEQ $2F              ; F0 2F | Branch if equal
    SBC $030F,Y          ; F9 0F 03 | Subtract with carry (absolute,Y)
    LDA                  ; BF FF FF 02 | Load from absolute long,X into accumulator
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    INC                  ; 1A | Increment accumulator
    SBC $73              ; E5 73 | Subtract with carry (zero page)
    STY $9F60            ; 8C 60 9F | Store Y register to absolute address
    STX $79              ; 86 79 | Store X register to zero page
    SBC $FFFF,X          ; FD FF FF | Subtract with carry (absolute,X)
    STA $FFD7FF          ; 8F FF D7 FF | Store accumulator to absolute long address
    SBC #$FF             ; E9 FF | Subtract with carry (immediate)
    BEQ $FF              ; F0 FF | Branch if equal
    BVS $FF              ; 70 FF | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    BVS $8F              ; 70 8F | Branch if overflow set
    PLP                  ; 28 | Pull processor status from stack
    SBC #$0F             ; E9 0F | Subtract with carry (immediate)
    BEQ $8F              ; F0 8F | Branch if equal
    SBC $5F93,Y          ; F9 93 5F | Subtract with carry (absolute,Y)
    CPX #$7F             ; E0 7F | Compare X register (immediate)
    ROL $BF              ; 26 BF | Rotate left (zero page)
    LDA $7D              ; A5 7D | Load from zero page into accumulator
    STA $DD5D            ; 8D 5D DD | Store accumulator to absolute address
    AND $39DD,Y          ; 39 DD 39 | Logical AND with accumulator (absolute,Y)
    ASL $7F71            ; 0E 71 7F | Arithmetic shift left (absolute)
    EOR $1BB6            ; 4D B6 1B | Exclusive OR with accumulator (absolute)
    CPX $423D            ; EC 3D 42 | Hardware register operation
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank56_DmaFunction_1A1
; Address: $EBF320
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_1A1:
    PLP                  ; 28 | Pull processor status from stack
    PLA                  ; 68 | Pull accumulator from stack
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    PLX                  ; FA | Pull X register from stack
    DEY                  ; 88 | Decrement Y register
    BRA $E1              ; 80 E1 | Branch always
    DEY                  ; 88 | Decrement Y register
    INX                  ; E8 | Increment X register
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    INY                  ; C8 | Increment Y register
    DEY                  ; 88 | Decrement Y register
    BRA $7F              ; 80 7F | Branch always
    DEY                  ; 88 | Decrement Y register
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    DEY                  ; 88 | Decrement Y register
    ASL $63              ; 06 63 | Arithmetic shift left (zero page)
    ASL $F3              ; 06 F3 | Arithmetic shift left (zero page)
    ASL $0E73            ; 0E 73 0E | Arithmetic shift left (absolute)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    CPX #$7F             ; E0 7F | Compare X register (immediate)
    ROL $BF              ; 26 BF | Rotate left (zero page)
    LDA ($7D,X)          ; A1 7D | Load from (zero page,X) into accumulator
    STA $DD79            ; 8D 79 DD | Store accumulator to absolute address
    AND $39DD,Y          ; 39 DD 39 | Logical AND with accumulator (absolute,Y)
    ORA $7A              ; 05 7A | Logical OR with accumulator (zero page)
    EOR $3BB6            ; 4D B6 3B | Exclusive OR with accumulator (absolute)
    CPY $1C              ; C4 1C | Compare Y register (zero page)
    BPL $6F              ; 10 6F | Branch if positive
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    PLA                  ; 68 | Pull accumulator from stack
    PHA                  ; 48 | Push accumulator to stack
    TSX                  ; BA | Transfer stack pointer to X register
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    BRA $E1              ; 80 E1 | Branch always
    BRA $E0              ; 80 E0 | Game work RAM access
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    BRA $FF              ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank56_DmaFunction_1A2
; Address: $EBF396
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_1A2:
    BRA $7F              ; 80 7F | Branch always
    DEY                  ; 88 | Decrement Y register
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    ASL $E3              ; 06 E3 | Arithmetic shift left (zero page)
    ASL $63              ; 06 63 | Arithmetic shift left (zero page)
    ASL $0E43            ; 0E 43 0E | Arithmetic shift left (absolute)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    CPX #$7F             ; E0 7F | Compare X register (immediate)
    ROL $BF              ; 26 BF | Rotate left (zero page)
    STA $5D              ; 85 5D | Store accumulator to zero page
    CPY $DD5D            ; CC 5D DD | Compare Y register (absolute)
    AND $39DD,Y          ; 39 DD 39 | Logical AND with accumulator (absolute,Y)
    BIT $5B              ; 24 5B | Test bits in accumulator (zero page)
    EOR $3BB7            ; 4D B7 3B | Exclusive OR with accumulator (absolute)
    ORA $5562,X          ; 1D 62 55 | Logical OR with accumulator (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    SEI                  ; 78 | Set interrupt disable flag
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    BRA $E1              ; 80 E1 | Branch always
    BRA $E0              ; 80 E0 | Game work RAM access
    INY                  ; C8 | Increment Y register
    CLD                  ; D8 | Clear decimal mode flag
    DEY                  ; 88 | Decrement Y register
    BRA $7F              ; 80 7F | Branch always
    PHP                  ; 08 | Push processor status to stack
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    ASL $E3              ; 06 E3 | Arithmetic shift left (zero page)
    ASL $E3              ; 06 E3 | Arithmetic shift left (zero page)
    ASL $0E83            ; 0E 83 0E | Arithmetic shift left (absolute)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    CPX #$7F             ; E0 7F | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_1A3
; Address: $EBF426
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_1A3:
    ROL $BF              ; 26 BF | Rotate left (zero page)
    LDA $7D              ; A5 7D | Load from zero page into accumulator
    STA $DD5D            ; 8D 5D DD | Store accumulator to absolute address
    AND $39DD,Y          ; 39 DD 39 | Logical AND with accumulator (absolute,Y)
    ASL $79              ; 06 79 | Arithmetic shift left (zero page)
    EOR $1BB6            ; 4D B6 1B | Exclusive OR with accumulator (absolute)
    CPX $3D              ; E4 3D | Compare X register (zero page)
    WDM #$14             ; 42 14 | Reserved instruction
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank56_DmaFunction_1A4
; Address: $EBF43C
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_1A4:
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ASL $E3              ; 06 E3 | Arithmetic shift left (zero page)
    ASL $83              ; 06 83 | Arithmetic shift left (zero page)
    ASL $0EC3            ; 0E C3 0E | Arithmetic shift left (absolute)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ORA $0107            ; 0D 07 01 | Logical OR with accumulator (absolute)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    SBC $799D,X          ; FD 9D 79 | Subtract with carry (absolute,X)
    STA $9C79,X          ; 9D 79 9C | Store accumulator to absolute,X
    CLI                  ; 58 | Clear interrupt disable flag
    STA $9F59,X          ; 9D 59 9F | Store accumulator to absolute,X
    EOR $519F,Y          ; 59 9F 51 | Exclusive OR with accumulator (absolute,Y)
    EOR ($9B),Y          ; 51 9B | Exclusive OR with accumulator ((zero page),Y)
    EOR #$08             ; 49 08 | Exclusive OR with accumulator (immediate)
    ORA ($6E),Y          ; 11 6E | Logical OR with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    ORA $1966,Y          ; 19 66 19 | Logical OR with accumulator (absolute,Y)
    ROR $11              ; 66 11 | Rotate right (zero page)
    ROR $6E11            ; 6E 11 6E | Rotate right (absolute)
    ORA #$76             ; 09 76 | Logical OR with accumulator (immediate)
    BRA $E0              ; 80 E0 | Game work RAM access
    BRA $60              ; 80 60 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PLA                  ; 68 | Pull accumulator from stack
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    LDA $8FA0            ; AD A0 8F | Load from absolute address into accumulator
    DEY                  ; 88 | Decrement Y register
    BRA $7F              ; 80 7F | Branch always
    DEY                  ; 88 | Decrement Y register
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    DEY                  ; 88 | Decrement Y register
    ROR $7E07,X          ; 7E 07 7E | Rotate right (absolute,X)
    INC $FF0F,X          ; FE 0F FF | Increment (absolute,X)
    INC $0CFF,X          ; FE FF 0C | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_1A5
; Address: $EBF4B4
; Size: 110 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_1A5:
    PHP                  ; 08 | Push processor status to stack
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    CPY $F933            ; CC 33 F9 | Compare Y register (absolute)
    ASL $9D              ; 06 9D | Arithmetic shift left (zero page)
    ADC $799D,Y          ; 79 9D 79 | Add with carry (absolute,Y)
    STZ $9D58            ; 9C 58 9D | Store zero to absolute
    EOR $599F,Y          ; 59 9F 59 | Exclusive OR with accumulator (absolute,Y)
    STA                  ; 9F 51 9B 51 | Store accumulator to absolute long,X
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))
    ORA #$76             ; 09 76 | Logical OR with accumulator (immediate)
    BPL $6F              ; 10 6F | Branch if positive
    ORA $1866,Y          ; 19 66 18 | Logical OR with accumulator (absolute,Y)
    ORA ($6E),Y          ; 11 6E | Logical OR with accumulator ((zero page),Y)
    ORA ($6E),Y          ; 11 6E | Logical OR with accumulator ((zero page),Y)
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    BRA $E0              ; 80 E0 | Game work RAM access
    DEY                  ; 88 | Decrement Y register
    PLA                  ; 68 | Pull accumulator from stack
    ORA #$68             ; 09 68 | Logical OR with accumulator (immediate)
    ORA #$28             ; 09 28 | Logical OR with accumulator (immediate)
    BIT #$88             ; 89 88 | Test bits in accumulator (immediate)
    BIT #$80             ; 89 80 | Test bits in accumulator (immediate)
    PHB                  ; 8B | Push data bank register to stack
    DEY                  ; 88 | Decrement Y register
    BRA $7F              ; 80 7F | Branch always
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    BRA $7F              ; 80 7F | Branch always
    DEY                  ; 88 | Decrement Y register
    AND $BD0F            ; 2D 0F BD | Logical AND with accumulator (absolute)
    LDA                  ; BF 0F 7F 07 | Load from absolute long,X into accumulator
    INC $FE47,X          ; FE 47 FE | Increment (absolute,X)
    INC $FF3F,X          ; FE 3F FF | Increment (absolute,X)
    STA                  ; 9F 0A F5 0A | Store accumulator to absolute long,X
    PHP                  ; 08 | Push processor status to stack
    EOR $BA              ; 45 BA | Exclusive OR with accumulator (zero page)
    CMP $3D32            ; CD 32 3D | Compare accumulator (absolute)
    REP #$8C             ; C2 8C | Reset processor status bits
    STA $9D79,X          ; 9D 79 9D | Store accumulator to absolute,X
    ADC $589C,Y          ; 79 9C 58 | Add with carry (absolute,Y)
    STA $9F59,X          ; 9D 59 9F | Store accumulator to absolute,X
    CLI                  ; 58 | Clear interrupt disable flag
    STA                  ; 9F 51 9B 51 | Store accumulator to absolute long,X
    EOR ($08,X)          ; 41 08 | Exclusive OR with accumulator ((zero page,X))
    ORA ($6E),Y          ; 11 6E | Logical OR with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    ORA $1866,Y          ; 19 66 18 | Logical OR with accumulator (absolute,Y)
    BPL $6F              ; 10 6F | Branch if positive

;------------------------------------------------------------------------------
; Bank56_DmaFunction_1A6
; Address: $EBF53C
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_1A6:
    ORA ($6E),Y          ; 11 6E | Logical OR with accumulator ((zero page),Y)
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    INX                  ; E8 | Increment X register
    BRA $60              ; 80 60 | Branch always
    PLA                  ; 68 | Pull accumulator from stack
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    DEY                  ; 88 | Decrement Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    BIT #$80             ; 89 80 | Test bits in accumulator (immediate)
    BIT #$88             ; 89 88 | Test bits in accumulator (immediate)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_1A7
; Address: $EBF54F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_1A7:
    JSR $7788            ; 20 88 77 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    BRA $7F              ; 80 7F | Branch always
    DEY                  ; 88 | Decrement Y register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank56_DmaFunction_1A8
; Address: $EBF562
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_1A8:
    LDA $0FFF0F          ; AF 0F FF 0F | Load from absolute long address into accumulator
    INC $7F0F,X          ; FE 0F 7F | Increment (absolute,X)
    INC $FE1F,X          ; FE 1F FE | Increment (absolute,X)
    INC $0CDF,X          ; FE DF 0C | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA $10F2            ; 0D F2 10 | Logical OR with accumulator (absolute)
    XBA                  ; EB | Exchange accumulator bytes
    CMP $DD32            ; CD 32 DD | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_1A9
; Address: $EBF57F
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_1A9:
    JSL $9D799D          ; 22 9D 79 9D | Jump to subroutine long
    ADC $589C,Y          ; 79 9C 58 | Add with carry (absolute,Y)
    STA $9F59,X          ; 9D 59 9F | Store accumulator to absolute,X
    CLI                  ; 58 | Clear interrupt disable flag
    STA                  ; 9F 51 9B 51 | Store accumulator to absolute long,X
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ORA $1066,Y          ; 19 66 10 | Logical OR with accumulator (absolute,Y)
    ORA #$76             ; 09 76 | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    ORA ($6E),Y          ; 11 6E | Logical OR with accumulator ((zero page),Y)
    ORA ($6E),Y          ; 11 6E | Logical OR with accumulator ((zero page),Y)
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    BRA $E0              ; 80 E0 | Game work RAM access
    DEY                  ; 88 | Decrement Y register
    PLA                  ; 68 | Pull accumulator from stack
    PHP                  ; 08 | Push processor status to stack
    PLA                  ; 68 | Pull accumulator from stack
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    BIT #$A0             ; 89 A0 | Test bits in accumulator (immediate)
    BIT #$A8             ; 89 A8 | Test bits in accumulator (immediate)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_1AA
; Address: $EBF5AF
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_1AA:
    JSR $7F80            ; 20 80 7F | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    BRA $7F              ; 80 7F | Branch always
    DEY                  ; 88 | Decrement Y register
    EOR $9F0F            ; 4D 0F 9F | Exclusive OR with accumulator (absolute)
    INC $7E1F,X          ; FE 1F 7E | Increment (absolute,X)
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    NOP                  ; EA | No operation
    ORA $34F2            ; 0D F2 34 | Logical OR with accumulator (absolute)
    SBC $FD02,X          ; FD 02 FD | Subtract with carry (absolute,X)
    PHB                  ; 8B | Push data bank register to stack
    ORA ($8F,X)          ; 01 8F | Logical OR with accumulator ((zero page,X))
    STA ($8F,X)          ; 81 8F | Store accumulator to (zero page,X)
    STA ($AF,X)          ; 81 AF | Store accumulator to (zero page,X)
    BRA $BF              ; 80 BF | Branch always
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    INC $7E81,X          ; FE 81 7E | Increment (absolute,X)
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    BRA $7F              ; 80 7F | Branch always
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SBC $FE01,X          ; FD 01 FE | Subtract with carry (absolute,X)
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    INC $FAFF,X          ; FE FF FA | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BEQ $FF              ; F0 FF | Branch if equal
    SBC $FD02,X          ; FD 02 FD | Subtract with carry (absolute,X)
    BEQ $0F              ; F0 0F | Branch if equal
    SBC #$16             ; E9 16 | Subtract with carry (immediate)
    EOR $BA              ; 45 BA | Exclusive OR with accumulator (zero page)
    LDY $58A7,X          ; BC A7 58 | Load from absolute,X into Y register
    AND ($19),Y          ; 31 19 | Logical AND with accumulator ((zero page),Y)
    CMP $D919,Y          ; D9 19 D9 | Compare accumulator (absolute,Y)
    ORA $19D1,Y          ; 19 D1 19 | Logical OR with accumulator (absolute,Y)
    CMP $C119,Y          ; D9 19 C1 | Compare accumulator (absolute,Y)
    ORA $09C1,Y          ; 19 C1 09 | Logical OR with accumulator (absolute,Y)
    CMP ($19,X)          ; C1 19 | Compare accumulator ((zero page,X))
    CMP ($19),Y          ; D1 19 | Compare accumulator ((zero page),Y)
    INC $18              ; E6 18 | Increment (zero page)
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    ORA $01E6,Y          ; 19 E6 01 | Logical OR with accumulator (absolute,Y)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_1AB
; Address: $EBF642
; Size: 109 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_1AB:
    STA $9F81            ; 8D 81 9F | Store accumulator to absolute address
    STA ($9F,X)          ; 81 9F | Store accumulator to (zero page,X)
    BRA $BF              ; 80 BF | Branch always
    PHP                  ; 08 | Push processor status to stack
    LDA $1DFF01          ; AF 01 FF 1D | Load from absolute long address into accumulator
    AND $FF00,Y          ; 39 00 FF | Logical AND with accumulator (absolute,Y)
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    BRA $7F              ; 80 7F | Branch always
    PHP                  ; 08 | Push processor status to stack
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA $39E2,X          ; 1D E2 39 | Logical OR with accumulator (absolute,X)
    DEC $FE              ; C6 FE | Decrement (zero page)
    INC $FE7F,X          ; FE 7F FE | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    SED                  ; F8 | Set decimal mode flag
    BEQ $FF              ; F0 FF | Branch if equal
    SBC $7902,X          ; FD 02 79 | Subtract with carry (absolute,X)
    STX $79              ; 86 79 | Store X register to zero page
    STX $F0              ; 86 F0 | Store X register to zero page
    CMP $8332            ; CD 32 83 | Compare accumulator (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    LDA $D91950          ; AF 50 19 D9 | Load from absolute long address into accumulator
    ORA $19D9,Y          ; 19 D9 19 | Logical OR with accumulator (absolute,Y)
    CMP ($19),Y          ; D1 19 | Compare accumulator ((zero page),Y)
    CMP $D119,Y          ; D9 19 D1 | Compare accumulator (absolute,Y)
    ORA $19C1,Y          ; 19 C1 19 | Logical OR with accumulator (absolute,Y)
    CMP ($19,X)          ; C1 19 | Compare accumulator ((zero page,X))
    CMP #$09             ; C9 09 | Compare accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    ORA $11E6,Y          ; 19 E6 11 | Logical OR with accumulator (absolute,Y)
    INC $FF00            ; EE 00 FF | Increment (absolute)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    XBA                  ; EB | Exchange accumulator bytes
    ORA ($AD,X)          ; 01 AD | Logical OR with accumulator ((zero page,X))
    STA ($8F,X)          ; 81 8F | Store accumulator to (zero page,X)
    STA ($9F,X)          ; 81 9F | Store accumulator to (zero page,X)
    BRA $BF              ; 80 BF | Branch always
    CLC                  ; 18 | Clear carry flag
    LDA                  ; BF 11 BF 01 | Load from absolute long,X into accumulator
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    INC $7E81,X          ; FE 81 7E | Increment (absolute,X)
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    BRA $7F              ; 80 7F | Branch always
    CLC                  ; 18 | Clear carry flag
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_1AC
; Address: $EBF6C2
; Size: 114 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_1AC:
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    SED                  ; F8 | Set decimal mode flag
    BEQ $FF              ; F0 FF | Branch if equal
    SBC $F106,Y          ; F9 06 F1 | Subtract with carry (absolute,Y)
    ASL $07F8            ; 0E F8 07 | Arithmetic shift left (absolute)
    SBC $C312            ; ED 12 C3 | Subtract with carry (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    LDA $00B951          ; AF 51 B9 00 | Load from absolute long address into accumulator
    STA $8F81            ; 8D 81 8F | Store accumulator to absolute address
    STA ($9F,X)          ; 81 9F | Store accumulator to (zero page,X)
    DEY                  ; 88 | Decrement Y register
    LDA                  ; BF 18 BF 01 | Load from absolute long,X into accumulator
    STA                  ; 9F 01 FF 01 | Store accumulator to absolute long,X
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    DEY                  ; 88 | Decrement Y register
    CLC                  ; 18 | Clear carry flag
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    INC $FE7F,X          ; FE 7F FE | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    INC $F8FF,X          ; FE FF F8 | Increment (absolute,X)
    BEQ $FF              ; F0 FF | Branch if equal
    SBC $FC02,X          ; FD 02 FC | Subtract with carry (absolute,X)
    ADC $E986,Y          ; 79 86 E9 | Add with carry (absolute,Y)
    CMP $8122,X          ; DD 22 81 | Compare accumulator (absolute,X)
    SEC                  ; 38 | Set carry flag
    STA $D81970          ; 8F 70 19 D8 | Store accumulator to absolute long address
    BNE $1F              ; D0 1F | Branch if not equal
    BRA $1F              ; 80 1F | Branch always
    BRA $1F              ; 80 1F | Branch always
    CLC                  ; 18 | Clear carry flag
    BPL $EF              ; 10 EF | Branch if positive
    SBC $FC03,X          ; FD 03 FC | Subtract with carry (absolute,X)
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    ORA $1CFF,Y          ; 19 FF 1C | Logical OR with accumulator (absolute,Y)
    ROR $F8FF            ; 6E FF F8 | Rotate right (absolute)
    BVS $FF              ; 70 FF | Branch if overflow set
    ORA $1CE6,Y          ; 19 E6 1C | Logical OR with accumulator (absolute,Y)
    ROR $F891            ; 6E 91 F8 | Rotate right (absolute)
    BVS $8F              ; 70 8F | Branch if overflow set
    CLC                  ; 18 | Clear carry flag
    SBC #$FE             ; E9 FE | Subtract with carry (immediate)
    ORA ($F0,X)          ; 01 F0 | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF F0 FF F0 | Load from absolute long,X into accumulator
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank56_DmaFunction_1AD
; Address: $EBF76A
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_1AD:
    SED                  ; F8 | Set decimal mode flag
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    LDA $10EF50          ; AF 50 EF 10 | Load from absolute long address into accumulator
    BCC $67              ; 90 67 | Branch if carry clear
    TYA                  ; 98 | Transfer Y register to accumulator
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    LDA ($0F),Y          ; B1 0F | Load from (zero page),Y into accumulator
    SBC ($19),Y          ; F1 19 | Subtract with carry ((zero page),Y)
    BNE $1B              ; D0 1B | Branch if not equal
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    STA ($1F,X)          ; 81 1F | Store accumulator to (zero page,X)
    STA ($5F,X)          ; 81 5F | Store accumulator to (zero page,X)
    BPL $EF              ; 10 EF | Branch if positive
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    JMP $FF1BFF          ; 5C FF 1B FF | Jump to address long
    CMP $F0FF,Y          ; D9 FF F0 | Compare accumulator (absolute,Y)
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    JMP $E41BA3          ; 5C A3 1B E4 | Jump to address long
    CMP $F026,Y          ; D9 26 F0 | Compare accumulator (absolute,Y)
    DEY                  ; 88 | Decrement Y register
    SED                  ; F8 | Set decimal mode flag
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $7F              ; F0 7F | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    PLP                  ; 28 | Pull processor status from stack
    BPL $6F              ; 10 6F | Branch if positive
    BCC $67              ; 90 67 | Branch if carry clear
    TYA                  ; 98 | Transfer Y register to accumulator
    CLC                  ; 18 | Clear carry flag
    CLI                  ; 58 | Clear interrupt disable flag
    SBC ($0F),Y          ; F1 0F | Subtract with carry ((zero page),Y)
    SBC ($19),Y          ; F1 19 | Subtract with carry ((zero page),Y)
    CPY #$1B             ; C0 1B | Compare Y register (immediate)
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    STA ($3F,X)          ; 81 3F | Store accumulator to (zero page,X)
    STA ($3F,X)          ; 81 3F | Store accumulator to (zero page,X)
    ORA #$0F             ; 09 0F | Logical OR with accumulator (immediate)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    ORA $00FF,Y          ; 19 FF 00 | Logical OR with accumulator (absolute,Y)
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    CPX #$FF             ; E0 FF | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_1AE
; Address: $EBF80B
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_1AE:
    LDA                  ; BF FF 1F FF | Load from absolute long,X into accumulator
    ORA $00E6,Y          ; 19 E6 00 | Logical OR with accumulator (absolute,Y)
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    LDA                  ; BF 40 1F E0 | Load from absolute long,X into accumulator
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $7F              ; F0 7F | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    BMI $EF              ; 30 EF | Branch if negative
    BPL $4F              ; 10 4F | Branch if positive
    BCS $C7              ; B0 C7 | Branch if carry set
    SEC                  ; 38 | Set carry flag
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    LDA $F10F51          ; AF 51 0F F1 | Load from absolute long address into accumulator
    ORA $1BC0,Y          ; 19 C0 1B | Logical OR with accumulator (absolute,Y)
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    STA ($1F,X)          ; 81 1F | Store accumulator to (zero page,X)
    STA ($1F,X)          ; 81 1F | Store accumulator to (zero page,X)
    STA $851F            ; 8D 1F 85 | Store accumulator to absolute address
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA $C0FF,Y          ; 19 FF C0 | Logical OR with accumulator (absolute,Y)
    BEQ $FF              ; F0 FF | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    INX                  ; E8 | Increment X register
    ORA $C0E6,Y          ; 19 E6 C0 | Logical OR with accumulator (absolute,Y)
    BEQ $0F              ; F0 0F | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    BEQ $1F              ; F0 1F | Branch if equal
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $7F              ; F0 7F | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    LDA $30CF50          ; AF 50 CF 30 | Load from absolute long address into accumulator
    BCC $67              ; 90 67 | Branch if carry clear
    TYA                  ; 98 | Transfer Y register to accumulator
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank56_DmaFunction_1AF
; Address: $EBF89D
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_1AF:
    STA ($4F),Y          ; 91 4F | Store accumulator to (zero page),Y
    LDA ($4F),Y          ; B1 4F | Load from (zero page),Y into accumulator
    SED                  ; F8 | Set decimal mode flag
    SBC $F906,X          ; FD 06 F9 | Subtract with carry (absolute,X)
    INX                  ; E8 | Increment X register
    SBC #$1E             ; E9 1E | Subtract with carry (immediate)
    SBC ($0E,X)          ; E1 0E | Subtract with carry ((zero page,X))
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    BRA $6E              ; 80 6E | Branch always
    STA ($F8),Y          ; 91 F8 | Store accumulator to (zero page),Y
    BEQ $0F              ; F0 0F | Branch if equal
    TAY                  ; A8 | Transfer accumulator to Y register
    CMP $0F              ; C5 0F | Compare accumulator (zero page)
    ROL $3F17,X          ; 3E 17 3F | Rotate left (absolute,X)
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    ASL $15F1            ; 0E F1 15 | Arithmetic shift left (absolute)
    NOP                  ; EA | No operation
    INC                  ; 1A | Increment accumulator
    SBC $0F              ; E5 0F | Subtract with carry (zero page)
    BEQ $FF              ; F0 FF | Branch if equal
    ROR $7681,X          ; 7E 81 76 | Rotate right (absolute,X)
    BIT #$E0             ; 89 E0 | Game work RAM access
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_1B0
; Address: $EBF91B
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_1B0:
    STA                  ; 9F E0 1F 40 | Store accumulator to absolute long,X
    LDA                  ; BF 0F 87 0F | Load from absolute long,X into accumulator
    ROL $3F17,X          ; 3E 17 3F | Rotate left (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    ASL $15F1            ; 0E F1 15 | Arithmetic shift left (absolute)
    NOP                  ; EA | No operation
    AND $04D2            ; 2D D2 04 | Logical AND with accumulator (absolute)
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($74,X)          ; 01 74 | Logical OR with accumulator ((zero page,X))
    PHB                  ; 8B | Push data bank register to stack
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF E0 1F 90 | Load from absolute long,X into accumulator
    ASL $3C07,X          ; 1E 07 3C | Arithmetic shift left (absolute,X)
    SBC $F807,X          ; FD 07 F8 | Subtract with carry (absolute,X)
    INX                  ; E8 | Increment X register
    ORA $0DF2            ; 0D F2 0D | Logical OR with accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    SBC $FFFF,X          ; FD FF FF | Subtract with carry (absolute,X)
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($7C,X)          ; 01 7C | Logical OR with accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    BRA $7F              ; 80 7F | Branch always
    LDY #$5F             ; A0 5F | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank56_DmaFunction_1B1
; Address: $EBF99E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_1B1:
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 3F 1B FF | Load from absolute long,X into accumulator
    CLC                  ; 18 | Clear carry flag
    PHY                  ; 5A | Push Y register to stack
    LDA $7C              ; A5 7C | Load from zero page into accumulator
    ORA $1CE6,Y          ; 19 E6 1C | Logical OR with accumulator (absolute,Y)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank56_DmaFunction_1B2
; Address: $EBF9C4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_1B2:
    STA                  ; 9F FF 2F FF | Store accumulator to absolute long,X
    CMP $B0FF,Y          ; D9 FF B0 | Compare accumulator (absolute,Y)
    BEQ $FF              ; F0 FF | Branch if equal
    CLD                  ; D8 | Clear decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_1B3
; Address: $EBF9D5
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_1B3:
    STA                  ; 9F D0 2F 26 | Store accumulator to absolute long,X
    CMP $B04F,Y          ; D9 4F B0 | Compare accumulator (absolute,Y)
    CMP $1B3F,Y          ; D9 3F 1B | Compare accumulator (absolute,Y)
    STA                  ; 9F FF 1F FF | Store accumulator to absolute long,X
    INC                  ; 1A | Increment accumulator
    SBC $02              ; E5 02 | Subtract with carry (zero page)
    SBC $F50A,X          ; FD 0A F5 | Subtract with carry (absolute,X)
    ADC $E619            ; 6D 19 E6 | Add with carry (absolute)
    CLC                  ; 18 | Clear carry flag
    STY $7B              ; 84 7B | Store Y register to zero page
    STA $FF9FFF          ; 8F FF 9F FF | Store accumulator to absolute long address
    LDA $FFD9FF          ; AF FF D9 FF | Load from absolute long address into accumulator
    BEQ $FF              ; F0 FF | Branch if equal
    BVS $FF              ; 70 FF | Branch if overflow set
    CLD                  ; D8 | Clear decimal mode flag
    BVS $8F              ; 70 8F | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_1B4
; Address: $EBFA15
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_1B4:
    STA                  ; 9F 50 AF 26 | Store accumulator to absolute long,X
    CMP $F00F,Y          ; D9 0F F0 | Compare accumulator (absolute,Y)
    STA $59A773          ; 8F 73 A7 59 | Store accumulator to absolute long address
    LDA                  ; BF 03 FF 0F | Load from absolute long,X into accumulator
    SBC $FEFF,X          ; FD FF FE | Subtract with carry (absolute,X)
    SBC $FD02,X          ; FD 02 FD | Subtract with carry (absolute,X)
    BPL $EF              ; 10 EF | Branch if positive
    BPL $EF              ; 10 EF | Branch if positive
    CLC                  ; 18 | Clear carry flag
    INC $19              ; E6 19 | Increment (zero page)
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    STA                  ; 9F FF AF FF | Store accumulator to absolute long,X
    CMP $F0FF,Y          ; D9 FF F0 | Compare accumulator (absolute,Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_1B5
; Address: $EBFA4E
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_1B5:
    SED                  ; F8 | Set decimal mode flag
    BMI $CF              ; 30 CF | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_1B6
; Address: $EBFA55
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_1B6:
    STA                  ; 9F 50 AF 26 | Store accumulator to absolute long,X
    CMP $F00F,Y          ; D9 0F F0 | Compare accumulator (absolute,Y)
    STA                  ; 9F 63 07 F9 | Store accumulator to absolute long,X
    SBC $03FF,X          ; FD FF 03 | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_1B7
; Address: $EBFA75
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_1B7:
    SBC $F20D,X          ; FD 0D F2 | Subtract with carry (absolute,X)
    BPL $EF              ; 10 EF | Branch if positive
    BMI $CF              ; 30 CF | Branch if negative
    INY                  ; C8 | Increment Y register
    ADC $FFFF,X          ; 7D FF FF | Add with carry (absolute,X)
    STA                  ; 9F FF AF FF | Store accumulator to absolute long,X
    SBC $F0FF,Y          ; F9 FF F0 | Subtract with carry (absolute,Y)
    BEQ $FF              ; F0 FF | Branch if equal
    INX                  ; E8 | Increment X register
    BRA $7F              ; 80 7F | Branch always
    BMI $CF              ; 30 CF | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_1B8
; Address: $EBFA95
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_1B8:
    STA                  ; 9F 50 AF 86 | Store accumulator to absolute long,X
    ADC $F00F,Y          ; 79 0F F0 | Add with carry (absolute,Y)
    SBC #$29             ; E9 29 | Subtract with carry (immediate)
    LDX $FEE9,Y          ; BE E9 FE | Load from absolute,Y into X register
    AND #$FA             ; 29 FA | Logical AND with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    PHX                  ; DA | Push X register to stack
    CLD                  ; D8 | Clear decimal mode flag
    BIT #$7A             ; 89 7A | Test bits in accumulator (immediate)
    CMP #$3A             ; C9 3A | Compare accumulator (immediate)
    SEC                  ; 38 | Set carry flag
    DEC $90              ; C6 90 | Decrement (zero page)
    ROR $66D8            ; 6E D8 66 | Rotate right (absolute)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    INX                  ; E8 | Increment X register
    BEQ $6E              ; F0 6E | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    ASL $29              ; 06 29 | Arithmetic shift left (zero page)
    LDX $FEE9,Y          ; BE E9 FE | Load from absolute,Y into X register
    AND #$FA             ; 29 FA | Logical AND with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    CLI                  ; 58 | Clear interrupt disable flag
    TSX                  ; BA | Transfer stack pointer to X register
    CLD                  ; D8 | Clear decimal mode flag
    BIT #$7A             ; 89 7A | Test bits in accumulator (immediate)
    BIT #$7A             ; 89 7A | Test bits in accumulator (immediate)
    SEC                  ; 38 | Set carry flag
    BCC $6E              ; 90 6E | Branch if carry clear
    CLD                  ; D8 | Clear decimal mode flag
    ROL $E0              ; 26 E0 | Game work RAM access
    STA                  ; 9F F8 87 E8 | Store accumulator to absolute long,X
    BEQ $6E              ; F0 6E | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    ASL $29              ; 06 29 | Arithmetic shift left (zero page)
    LDX $FEE9,Y          ; BE E9 FE | Load from absolute,Y into X register
    AND #$FA             ; 29 FA | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_1B9
; Address: $EBFAE7
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_1B9:
    SBC ($48),Y          ; F1 48 | Subtract with carry ((zero page),Y)
    LDX #$D0             ; A2 D0 | Load immediate value into X register
    LDA #$5A             ; A9 5A | Load immediate value into accumulator
    BIT #$7A             ; 89 7A | Test bits in accumulator (immediate)
    SEC                  ; 38 | Set carry flag
    DEC $90              ; C6 90 | Decrement (zero page)
    ROR $66D8            ; 6E D8 66 | Rotate right (absolute)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$9F             ; E0 9F | Compare X register (immediate)
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    BEQ $0E              ; F0 0E | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    LSR $29              ; 46 29 | Logical shift right (zero page)
    LDX $FEE9,Y          ; BE E9 FE | Load from absolute,Y into X register
    AND #$FA             ; 29 FA | Logical AND with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    DEC $3FD8,X          ; DE D8 3F | Decrement (absolute,X)
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
    ASL $29              ; 06 29 | Arithmetic shift left (zero page)
    LDX $FAC9,Y          ; BE C9 FA | Load from absolute,Y into X register
    AND $1CFA            ; 2D FA 1C | Logical AND with accumulator (absolute)
    SBC ($58),Y          ; F1 58 | Subtract with carry ((zero page),Y)
    TSX                  ; BA | Transfer stack pointer to X register
    CLD                  ; D8 | Clear decimal mode flag
    ORA $CBEA,Y          ; 19 EA CB | Logical OR with accumulator (absolute,Y)
    DEC                  ; 3A | Decrement accumulator
    SEC                  ; 38 | Set carry flag
    DEC $B0              ; C6 B0 | Decrement (zero page)
    ROR $26D8            ; 6E D8 26 | Rotate right (absolute)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    INX                  ; E8 | Increment X register
    BEQ $EE              ; F0 EE | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    ASL $29              ; 06 29 | Arithmetic shift left (zero page)
    LDX $FEE9,Y          ; BE E9 FE | Load from absolute,Y into X register
    AND #$FA             ; 29 FA | Logical AND with accumulator (immediate)
    SBC ($78),Y          ; F1 78 | Subtract with carry ((zero page),Y)
    TXS                  ; 9A | Transfer X register to stack pointer
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank56_DmaFunction_1BA
; Address: $EBFB4C
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_1BA:
    BIT #$7A             ; 89 7A | Test bits in accumulator (immediate)
    CMP $383E            ; CD 3E 38 | Compare accumulator (absolute)
    DEC $90              ; C6 90 | Decrement (zero page)
    ROR $66D8            ; 6E D8 66 | Rotate right (absolute)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    INX                  ; E8 | Increment X register
    BEQ $6E              ; F0 6E | Branch if equal
    AND #$BE             ; 29 BE | Logical AND with accumulator (immediate)
    SBC #$FE             ; E9 FE | Subtract with carry (immediate)
    AND #$FA             ; 29 FA | Logical AND with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    CLV                  ; B8 | Clear overflow flag
    PHY                  ; 5A | Push Y register to stack
    CLD                  ; D8 | Clear decimal mode flag
    STA $C97E            ; 8D 7E C9 | Store accumulator to absolute address
    DEC                  ; 3A | Decrement accumulator
    SEC                  ; 38 | Set carry flag
    DEC $90              ; C6 90 | Decrement (zero page)
    ROR $26D8            ; 6E D8 26 | Rotate right (absolute)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    INX                  ; E8 | Increment X register
    PEA #$F86A           ; F4 6A F8 | Push effective address to stack
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    STA $E16F88          ; 8F 88 6F E1 | Store accumulator to absolute long address
    SBC ($17,X)          ; E1 17 | Subtract with carry ((zero page,X))
    SBC ($17,X)          ; E1 17 | Subtract with carry ((zero page,X))
    SBC ($17,X)          ; E1 17 | Subtract with carry ((zero page,X))
    SBC #$1F             ; E9 1F | Subtract with carry (immediate)
    SBC #$1F             ; E9 1F | Subtract with carry (immediate)
    INC $760F,X          ; FE 0F 76 | Increment (absolute,X)
    ASL $1B              ; 06 1B | Arithmetic shift left (zero page)
    ASL $1D              ; 06 1D | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BPL $DD              ; 10 DD | Branch if positive
    DEY                  ; 88 | Decrement Y register
    ADC $E408            ; 6D 08 E4 | Add with carry (absolute)
    ASL $E4              ; 06 E4 | Arithmetic shift left (zero page)
    STY $ED              ; 84 ED | Store Y register to zero page
    STA $EE              ; 85 EE | Store accumulator to zero page
    STA $EE              ; 85 EE | Store accumulator to zero page
    LDA ($E2,X)          ; A1 E2 | Load from (zero page,X) into accumulator
    CPX $EC12            ; EC 12 EC | Compare X register (absolute)
    CPX $9B              ; E4 9B | Compare X register (zero page)
    CPX $5B              ; E4 5B | Compare X register (zero page)
    STZ $9B              ; 64 9B | Store zero to zero page
    STZ $9A              ; 64 9A | Store zero to zero page
    STZ $9A              ; 64 9A | Store zero to zero page

;------------------------------------------------------------------------------
; Bank56_DmaFunction_1BB
; Address: $EBFBBE
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_1BB:
    CPY #$7E             ; C0 7E | Compare Y register (immediate)
    PHB                  ; 8B | Push data bank register to stack
    TXA                  ; 8A | Transfer X register to accumulator
    ADC $1FE9            ; 6D E9 1F | Add with carry (absolute)
    SBC ($17,X)          ; E1 17 | Subtract with carry ((zero page,X))
    SBC ($17,X)          ; E1 17 | Subtract with carry ((zero page,X))
    SBC ($17,X)          ; E1 17 | Subtract with carry ((zero page,X))
    SBC #$1F             ; E9 1F | Subtract with carry (immediate)
    SBC #$1F             ; E9 1F | Subtract with carry (immediate)
    ASL $0717            ; 0E 17 07 | Arithmetic shift left (absolute)
    INC                  ; 1A | Increment accumulator
    ASL $19              ; 06 19 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    BPL $0F              ; 10 0F | Branch if positive
    ORA $0CFC,Y          ; 19 FC 0C | Logical OR with accumulator (absolute,Y)
    SBC $A448            ; ED 48 A4 | Subtract with carry (absolute)
    ASL $E4              ; 06 E4 | Arithmetic shift left (zero page)
    STY $ED              ; 84 ED | Store Y register to zero page
    STA $EE              ; 85 EE | Store accumulator to zero page
    STA $EE              ; 85 EE | Store accumulator to zero page
    LDA ($E2,X)          ; A1 E2 | Load from (zero page,X) into accumulator
    CPX $ECD2            ; EC D2 EC | Compare X register (absolute)
    CPX $9B              ; E4 9B | Compare X register (zero page)
    CPX #$5F             ; E0 5F | Compare X register (immediate)
    STZ $DB              ; 64 DB | Store zero to zero page
    STZ $9A              ; 64 9A | Store zero to zero page
    STZ $9A              ; 64 9A | Store zero to zero page
    CPY #$3E             ; C0 3E | Compare Y register (immediate)
    BRA $67              ; 80 67 | Branch always
    SBC #$1F             ; E9 1F | Subtract with carry (immediate)
    SBC ($17,X)          ; E1 17 | Subtract with carry ((zero page,X))
    SBC ($17,X)          ; E1 17 | Subtract with carry ((zero page,X))
    SBC ($17,X)          ; E1 17 | Subtract with carry ((zero page,X))
    SBC #$1F             ; E9 1F | Subtract with carry (immediate)
    SBC #$1F             ; E9 1F | Subtract with carry (immediate)
    INC $7E07            ; EE 07 7E | Increment (absolute)
    ASL $0713            ; 0E 13 07 | Arithmetic shift left (absolute)
    INC                  ; 1A | Increment accumulator
    ASL $19              ; 06 19 | Arithmetic shift left (zero page)
    BPL $99              ; 10 99 | Branch if positive
    SBC $E40C            ; ED 0C E4 | Subtract with carry (absolute)
    ASL $F4              ; 06 F4 | Arithmetic shift left (zero page)
    STY $ED              ; 84 ED | Store Y register to zero page
    STA $EE              ; 85 EE | Store accumulator to zero page
    STA $EE              ; 85 EE | Store accumulator to zero page
    LDA ($E2,X)          ; A1 E2 | Load from (zero page,X) into accumulator
    CPX $E852            ; EC 52 E8 | Compare X register (absolute)
    CPX $DB              ; E4 DB | Compare X register (zero page)
    BEQ $4F              ; F0 4F | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_1BC
; Address: $EBFC39
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_1BC:
    STA                  ; 9F 64 DA 64 | Store accumulator to absolute long,X
    TXS                  ; 9A | Transfer X register to stack pointer
    CPY #$3E             ; C0 3E | Compare Y register (immediate)
    PHB                  ; 8B | Push data bank register to stack
    BRA $67              ; 80 67 | Branch always
    SBC ($17,X)          ; E1 17 | Subtract with carry ((zero page,X))
    SBC ($17,X)          ; E1 17 | Subtract with carry ((zero page,X))
    SBC ($17,X)          ; E1 17 | Subtract with carry ((zero page,X))
    SBC ($17,X)          ; E1 17 | Subtract with carry ((zero page,X))
    SBC #$1F             ; E9 1F | Subtract with carry (immediate)
    SBC #$1F             ; E9 1F | Subtract with carry (immediate)
    ROR $1D06,X          ; 7E 06 1D | Rotate right (absolute,X)
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BPL $0F              ; 10 0F | Branch if positive
    CMP $083C,X          ; DD 3C 08 | Compare accumulator (absolute,X)
    SBC $E40C            ; ED 0C E4 | Subtract with carry (absolute)
    ASL $E4              ; 06 E4 | Arithmetic shift left (zero page)
    STY $ED              ; 84 ED | Store Y register to zero page
    STA $EE              ; 85 EE | Store accumulator to zero page
    STA $EE              ; 85 EE | Store accumulator to zero page
    LDA ($E2,X)          ; A1 E2 | Load from (zero page,X) into accumulator
    CPX $EC12            ; EC 12 EC | Compare X register (absolute)
    CPX #$DF             ; E0 DF | Compare X register (immediate)
    CPX $5B              ; E4 5B | Compare X register (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_1BD
; Address: $EBFC79
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_1BD:
    STA                  ; 9F 64 9A 64 | Store accumulator to absolute long,X
    PHX                  ; DA | Push X register to stack
    CPY #$3E             ; C0 3E | Compare Y register (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $6B84            ; 8D 84 6B | Store accumulator to absolute address
    SBC ($17,X)          ; E1 17 | Subtract with carry ((zero page,X))
    SBC ($17,X)          ; E1 17 | Subtract with carry ((zero page,X))
    SBC ($17,X)          ; E1 17 | Subtract with carry ((zero page,X))
    SBC ($17,X)          ; E1 17 | Subtract with carry ((zero page,X))
    SBC #$1F             ; E9 1F | Subtract with carry (immediate)
    SBC #$1F             ; E9 1F | Subtract with carry (immediate)
    PEA #$720F           ; F4 0F 72 | Push effective address to stack
    ASL $1F              ; 06 1F | Arithmetic shift left (zero page)
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    BPL $DD              ; 10 DD | Branch if positive
    JMP $0CAD            ; 4C AD 0C | Jump to address
    CPX $06              ; E4 06 | Compare X register (zero page)
    CPX $84              ; E4 84 | Compare X register (zero page)
    SBC $EE85            ; ED 85 EE | Subtract with carry (absolute)
    STA $EE              ; 85 EE | Store accumulator to zero page
    LDA ($E2,X)          ; A1 E2 | Load from (zero page,X) into accumulator
    CPX $EC12            ; EC 12 EC | Compare X register (absolute)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_1BE
; Address: $EBFCB4
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_1BE:
    CPX #$9F             ; E0 9F | Compare X register (immediate)
    CPX #$5F             ; E0 5F | Compare X register (immediate)
    STZ $9B              ; 64 9B | Store zero to zero page
    STZ $9A              ; 64 9A | Store zero to zero page
    STZ $9A              ; 64 9A | Store zero to zero page
    CPY #$7E             ; C0 7E | Compare Y register (immediate)
    ORA #$8F             ; 09 8F | Logical OR with accumulator (immediate)
    BRA $67              ; 80 67 | Branch always
    SBC ($17,X)          ; E1 17 | Subtract with carry ((zero page,X))
    SBC ($17,X)          ; E1 17 | Subtract with carry ((zero page,X))
    SBC ($17,X)          ; E1 17 | Subtract with carry ((zero page,X))
    SBC #$1F             ; E9 1F | Subtract with carry (immediate)
    SBC ($17,X)          ; E1 17 | Subtract with carry ((zero page,X))
    SBC #$1F             ; E9 1F | Subtract with carry (immediate)
    ASL $07F7            ; 0E F7 07 | Arithmetic shift left (absolute)
    ROR $1F06,X          ; 7E 06 1F | Rotate right (absolute,X)
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    BPL $07              ; 10 07 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ORA $0CFC,X          ; 1D FC 0C | Logical OR with accumulator (absolute,X)
    SBC $A44C            ; ED 4C A4 | Subtract with carry (absolute)
    ASL $E4              ; 06 E4 | Arithmetic shift left (zero page)
    STY $ED              ; 84 ED | Store Y register to zero page
    STA $EE              ; 85 EE | Store accumulator to zero page
    STA $EE              ; 85 EE | Store accumulator to zero page
    LDA ($E2,X)          ; A1 E2 | Load from (zero page,X) into accumulator
    INX                  ; E8 | Increment X register
    CPX $E4D3            ; EC D3 E4 | Compare X register (absolute)
    CPX #$5F             ; E0 5F | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_1BF
; Address: $EBFCF9
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_1BF:
    STA                  ; 9F 64 DA 64 | Store accumulator to absolute long,X
    TXS                  ; 9A | Transfer X register to stack pointer
    CPY #$7E             ; C0 7E | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    STA $E16781          ; 8F 81 67 E1 | Store accumulator to absolute long address
    SBC ($17,X)          ; E1 17 | Subtract with carry ((zero page,X))
    SBC ($17,X)          ; E1 17 | Subtract with carry ((zero page,X))
    SBC ($17,X)          ; E1 17 | Subtract with carry ((zero page,X))
    SBC #$1F             ; E9 1F | Subtract with carry (immediate)
    SBC #$1F             ; E9 1F | Subtract with carry (immediate)
    ASL $7F              ; 06 7F | Arithmetic shift left (zero page)
    ASL $1B              ; 06 1B | Arithmetic shift left (zero page)
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    BPL $99              ; 10 99 | Branch if positive
    SBC $E40C            ; ED 0C E4 | Subtract with carry (absolute)
    ASL $E4              ; 06 E4 | Arithmetic shift left (zero page)
    STY $ED              ; 84 ED | Store Y register to zero page
    STA $EE              ; 85 EE | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank56_DmaFunction_1C0
; Address: $EBFD2C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_1C0:
    STA $EE              ; 85 EE | Store accumulator to zero page
    LDA ($E2,X)          ; A1 E2 | Load from (zero page,X) into accumulator
    CPX $E852            ; EC 52 E8 | Compare X register (absolute)
    CPX $DB              ; E4 DB | Compare X register (zero page)
    CPX $5B              ; E4 5B | Compare X register (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank56_DmaFunction_1C1
; Address: $EBFD39
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_1C1:
    STA                  ; 9F 64 DA 64 | Store accumulator to absolute long,X
    PHX                  ; DA | Push X register to stack
    CPY #$3E             ; C0 3E | Compare Y register (immediate)
    INC $FC11,X          ; FE 11 FC | Increment (absolute,X)
    SBC $F33F,Y          ; F9 3F F3 | Subtract with carry (absolute,Y)
    SBC $FFC1,X          ; FD C1 FF | Subtract with carry (absolute,X)
    INC $E01F            ; EE 1F E0 | Game work RAM access
    BIT $FF              ; 24 FF | Test bits in accumulator (zero page)
    SBC $FF0E,X          ; FD 0E FF | Subtract with carry (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA $3FFC,Y          ; 19 FC 3F | Logical OR with accumulator (absolute,Y)
    SBC $E33F,Y          ; F9 3F E3 | Subtract with carry (absolute,Y)
    SBC $F7C9,X          ; FD C9 F7 | Subtract with carry (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CPY #$F6             ; C0 F6 | Compare Y register (immediate)
    SBC $FF0E,X          ; FD 0E FF | Subtract with carry (absolute,X)
    INC $FC1D,X          ; FE 1D FC | Increment (absolute,X)
    SBC $E13F,Y          ; F9 3F E1 | Subtract with carry (absolute,Y)
    PHB                  ; 8B | Push data bank register to stack
    SEP #$3F             ; E2 3F | Set processor status bits
    CPY #$F6             ; C0 F6 | Compare Y register (immediate)
    ROL $FF              ; 26 FF | Rotate left (zero page)
    PHP                  ; 08 | Push processor status to stack
    SBC $FF06,X          ; FD 06 FF | Subtract with carry (absolute,X)
    INC $FC0D,X          ; FE 0D FC | Increment (absolute,X)
    AND $FFF1,X          ; 3D F1 FF | Logical AND with accumulator (absolute,X)
    CMP $FB              ; C5 FB | Compare accumulator (zero page)
    CPY #$F6             ; C0 F6 | Compare Y register (immediate)
    CMP #$EF             ; C9 EF | Compare accumulator (immediate)
    SBC $FF2A,X          ; FD 2A FF | Subtract with carry (absolute,X)
    INC $FC0D,X          ; FE 0D FC | Increment (absolute,X)
    SBC $E33F,Y          ; F9 3F E3 | Subtract with carry (absolute,Y)
    SBC $FFC1,X          ; FD C1 FF | Subtract with carry (absolute,X)
    SBC $F20F,X          ; FD 0F F2 | Subtract with carry (absolute,X)
    CPX #$F6             ; E0 F6 | Compare X register (immediate)
    BIT $FF              ; 24 FF | Test bits in accumulator (zero page)
    SBC $FF02,X          ; FD 02 FF | Subtract with carry (absolute,X)
    INC $FC0D,X          ; FE 0D FC | Increment (absolute,X)
    SBC $E13F,Y          ; F9 3F E1 | Subtract with carry (absolute,Y)
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    PHB                  ; 8B | Push data bank register to stack
    CPX #$F6             ; E0 F6 | Compare X register (immediate)
    ROL                  ; 2A | Rotate left (accumulator)
    SBC $FF06,X          ; FD 06 FF | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_1C2
; Address: $EBFE03
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_1C2:
    ASL $FE              ; 06 FE | Arithmetic shift left (zero page)
    ORA $1FFC            ; 0D FC 1F | Logical OR with accumulator (absolute)
    SBC $E53F,Y          ; F9 3F E5 | Subtract with carry (absolute,Y)
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    CPX #$F6             ; E0 F6 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_1C3
; Address: $EBFE1B
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_1C3:
    JSL $FD04FF          ; 22 FF 04 FD | Jump to subroutine long
    ASL $FEC2            ; 0E C2 FE | Arithmetic shift left (absolute)
    INC $F78B,X          ; FE 8B F7 | Increment (absolute,X)
    JMP $BF1D7A          ; 5C 7A 1D BF | Jump to address long
    AND $7DBB,X          ; 3D BB 7D | Logical AND with accumulator (absolute,X)
    INC $FE1D,X          ; FE 1D FE | Increment (absolute,X)
    ORA $14FF,X          ; 1D FF 14 | Logical OR with accumulator (absolute,X)
    LDA                  ; BF 40 7E 99 | Load from absolute long,X into accumulator
    SED                  ; F8 | Set decimal mode flag
    STZ $FEC2            ; 9C C2 FE | Store zero to absolute
    INC $FF83,X          ; FE 83 FF | Increment (absolute,X)
    PHB                  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank56_DmaFunction_1C4
; Address: $EBFE49
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_1C4:
    JSL $1DBA3C          ; 22 3C BA 1D | Jump to subroutine long
    ADC $FE7F,X          ; 7D 7F FE | Add with carry (absolute,X)
    ORA $1FFC            ; 0D FC 1F | Logical OR with accumulator (absolute)
    LDA                  ; BF 54 3E C1 | Load from absolute long,X into accumulator
    ASL $3FF9,X          ; 1E F9 3F | Arithmetic shift left (absolute,X)
    CLD                  ; D8 | Clear decimal mode flag
    LDY $FEC2,X          ; BC C2 FE | Load from absolute,X into Y register
    TXA                  ; 8A | Transfer X register to accumulator
    STA                  ; 9F F3 9F BB | Store accumulator to absolute long,X
    STA $1CBF,X          ; 9D BF 1C | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    TSX                  ; BA | Transfer stack pointer to X register
    EOR $FE7F,X          ; 5D 7F FE | Exclusive OR with accumulator (absolute,X)
    AND $15FE            ; 2D FE 15 | Logical AND with accumulator (absolute)
    BPL $BF              ; 10 BF | Branch if positive
    CLI                  ; 58 | Clear interrupt disable flag
    LDA                  ; BF 5C 3E C9 | Load from absolute long,X into accumulator
    ASL $7FF9,X          ; 1E F9 7F | Arithmetic shift left (absolute,X)
    STZ $F6CA            ; 9C CA F6 | Store zero to absolute
    INC $F78B,X          ; FE 8B F7 | Increment (absolute,X)
    STA                  ; 9F B3 1C 3A | Store accumulator to absolute long,X
    STA                  ; 9F BB 3D AB | Store accumulator to absolute long,X
    ADC $FE7F,X          ; 7D 7F FE | Add with carry (absolute,X)
    ORA $FE              ; 05 FE | Logical OR with accumulator (zero page)
    ORA $14FF,X          ; 1D FF 14 | Logical OR with accumulator (absolute,X)
    LDA                  ; BF 50 3E D9 | Load from absolute long,X into accumulator
    LDA                  ; BF 58 1F E8 | Load from absolute long,X into accumulator
    STZ $FBC7            ; 9C C7 FB | Store zero to absolute
    TXA                  ; 8A | Transfer X register to accumulator
    PHB                  ; 8B | Push data bank register to stack
    ORA $1D33,X          ; 1D 33 1D | Logical OR with accumulator (absolute,X)
    LDY $7CBA,X          ; BC BA 7C | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank56_DmaFunction_1C5
; Address: $EBFEAF
; Size: 127 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_1C5:
    ROR $09FE            ; 6E FE 09 | Rotate right (absolute)
    INC $FF15,X          ; FE 15 FF | Increment (absolute,X)
    BNE $3F              ; D0 3F | Branch if not equal
    CLD                  ; D8 | Clear decimal mode flag
    STZ $7E79,X          ; 9E 79 7E | Store zero to absolute,X
    STA $FEC2            ; 8D C2 FE | Store accumulator to absolute address
    TXA                  ; 8A | Transfer X register to accumulator
    STA $9FF3,X          ; 9D F3 9F | Store accumulator to absolute,X
    EOR $1D7F,X          ; 5D 7F 1D | Exclusive OR with accumulator (absolute,X)
    PLB                  ; AB | Pull data bank register from stack
    AND $BC3B,X          ; 3D 3B BC | Logical AND with accumulator (absolute,X)
    INC $0DFE,X          ; FE FE 0D | Increment (absolute,X)
    INC $FF15,X          ; FE 15 FF | Increment (absolute,X)
    BPL $FF              ; 10 FF | Branch if positive
    CLC                  ; 18 | Clear carry flag
    STZ $C83F            ; 9C 3F C8 | Store zero to absolute
    SED                  ; F8 | Set decimal mode flag
    LDX $CA5D,Y          ; BE 5D CA | Load from absolute,Y into X register
    INC $F78B,X          ; FE 8B F7 | Increment (absolute,X)
    EOR $1D7B,X          ; 5D 7B 1D | Exclusive OR with accumulator (absolute,X)
    LDA                  ; BF 3D AB 7D | Load from absolute long,X into accumulator
    INC $FE05,X          ; FE 05 FE | Increment (absolute,X)
    ORA $14FF,X          ; 1D FF 14 | Logical OR with accumulator (absolute,X)
    LDX $7F51,Y          ; BE 51 7F | Load from absolute,Y into X register
    TYA                  ; 98 | Transfer Y register to accumulator
    INX                  ; E8 | Increment X register
    STZ $C0C0            ; 9C C0 C0 | Store zero to absolute
    BRA $58              ; 80 58 | Branch always
    LDX $9FBF,Y          ; BE BF 9F | Load from absolute,Y into X register
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BRA $BF              ; 80 BF | Branch always
    JMP $3E3CF3          ; 5C F3 3C 3E | Jump to address long
    AND $427D,X          ; 3D 7D 42 | Hardware register operation
    ADC $5B03,X          ; 7D 03 5B | Add with carry (absolute,X)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $58              ; 80 58 | Branch always
    LDX $9DBF,Y          ; BE BF 9D | Load from absolute,Y into X register
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BRA $BF              ; 80 BF | Branch always
    JMP $3E3CF3          ; 5C F3 3C 3E | Jump to address long
    AND $427D,X          ; 3D 7D 42 | Hardware register operation
    ADC $5B02,X          ; 7D 02 5B | Add with carry (absolute,X)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $58              ; 80 58 | Branch always
    LDX $9DBF,Y          ; BE BF 9D | Load from absolute,Y into X register
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BRA $BF              ; 80 BF | Branch always
    JMP $3E3CF3          ; 5C F3 3C 3E | Jump to address long
    AND $427D,X          ; 3D 7D 42 | Hardware register operation
    ADC $5B03,X          ; 7D 03 5B | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_1C6
; Address: $EBFF60
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_1C6:
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $58              ; 80 58 | Branch always
    LDX $9DBF,Y          ; BE BF 9D | Load from absolute,Y into X register
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BRA $BF              ; 80 BF | Branch always
    JMP $3E3CF3          ; 5C F3 3C 3E | Jump to address long
    AND $427D,X          ; 3D 7D 42 | Hardware register operation
    ADC $5B03,X          ; 7D 03 5B | Add with carry (absolute,X)
    AND $C0              ; 25 C0 | Logical AND with accumulator (zero page)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CLI                  ; 58 | Clear interrupt disable flag
    LDX $9CBF,Y          ; BE BF 9C | Load from absolute,Y into X register
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BRA $BF              ; 80 BF | Branch always
    JMP $3E3CF3          ; 5C F3 3C 3E | Jump to address long
    AND $427D,X          ; 3D 7D 42 | Hardware register operation
    ADC $5B02,X          ; 7D 02 5B | Add with carry (absolute,X)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $58              ; 80 58 | Branch always
    LDX $9DBF,Y          ; BE BF 9D | Load from absolute,Y into X register
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BRA $BF              ; 80 BF | Branch always
    JMP $3E3CF3          ; 5C F3 3C 3E | Jump to address long
    AND $427D,X          ; 3D 7D 42 | Hardware register operation
    ADC $5B02,X          ; 7D 02 5B | Add with carry (absolute,X)
    AND $A3              ; 25 A3 | Logical AND with accumulator (zero page)
    DEC $6D              ; C6 6D | Decrement (zero page)
    LDY $4F              ; A4 4F | Load from zero page into Y register
    CPX $C913            ; EC 13 C9 | Compare X register (absolute)
    CMP $9317,Y          ; D9 17 93 | Compare accumulator (absolute,Y)
    ASL $1F47            ; 0E 47 1F | Arithmetic shift left (absolute)
    ASL $001F,X          ; 1E 1F 00 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank56_DmaFunction_1C7
; Address: $EBFFDB
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank56_DmaFunction_1C7:
    JSR $6A1D            ; 20 1D 6A | Jump to subroutine
    ASL $A379            ; 0E 79 A3 | Arithmetic shift left (absolute)
    DEC $6D              ; C6 6D | Decrement (zero page)
    LDY $4F              ; A4 4F | Load from zero page into Y register
    CMP #$07             ; C9 07 | Compare accumulator (immediate)
    CMP $B317,Y          ; D9 17 B3 | Compare accumulator (absolute,Y)
    ASL $1F47            ; 0E 47 1F | Arithmetic shift left (absolute)
    ASL $001F,X          ; 1E 1F 00 | Arithmetic shift left (absolute,X)
