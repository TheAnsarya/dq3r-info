;==============================================================================
; Dragon Quest III - Bank $3A
; Type: Graphics
; Purpose: Graphics processing and PPU management
; Address Range: $DD0000-$DD7FFF
; Instructions: 11682
; Bytes: 32769
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_3A"

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_001
; Address: $DD8002
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_001:
    JSR $300F            ; 20 0F 30 | Jump to subroutine
    SEI                  ; 78 | Set interrupt disable flag
    BRA $80              ; 80 80 | Branch always
    LSR                  ; 4A | Logical shift right (accumulator)
    STY $A6              ; 84 A6 | Store Y register to zero page
    CLI                  ; 58 | Clear interrupt disable flag
    BEQ $F7              ; F0 F7 | Branch if equal
    DEC $7EFF            ; CE FF 7E | Decrement (absolute)
    ADC ($64,X)          ; 61 64 | Add with carry ((zero page,X))
    ASL $0C              ; 06 0C | Arithmetic shift left (zero page)
    ASL $0E1B            ; 0E 1B 0E | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    ASL $0E11            ; 0E 11 0E | Arithmetic shift left (absolute)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    BPL $01              ; 10 01 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ADC $8C              ; 65 8C | Add with carry (zero page)
    LDY $18              ; A4 18 | Load from zero page into Y register
    LDX #$0A             ; A2 0A | Load immediate value into X register
    ORA #$F3             ; 09 F3 | Logical OR with accumulator (immediate)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    BRA $65              ; 80 65 | Branch always
    SEP #$D4             ; E2 D4 | Set processor status bits
    SED                  ; F8 | Set decimal mode flag
    LDA                  ; BF FA AF F9 | Read graphics status
    STZ $FEF9,X          ; 9E F9 FE | Store zero to absolute,X
    STA $0579            ; 8D 79 05 | Update graphics data
    SBC ($0C),Y          ; F1 0C | Subtract with carry ((zero page),Y)
    SEP #$1E             ; E2 1E | Set processor status bits
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    LDA ($19,X)          ; A1 19 | Read graphics status
    BMI $85              ; 30 85 | Branch if negative
    JMP $F981            ; 4C 81 F9 | Jump to address
    INC $F8F3,X          ; FE F3 F8 | Increment (absolute,X)
    ROR $FEB9,X          ; 7E B9 FE | Rotate right (absolute,X)
    SBC $FCCE,X          ; FD CE FC | Subtract with carry (absolute,X)
    BPL $61              ; 10 61 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_002
; Address: $DD8083
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_002:
    ASL $D1              ; 06 D1 | Arithmetic shift left (zero page)
    DEC $60              ; C6 60 | Decrement (zero page)
    BNE $60              ; D0 60 | Branch if not equal
    BCC $60              ; 90 60 | Branch if carry clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_003
; Address: $DD8093
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_003:
    DEC $88              ; C6 88 | Decrement (zero page)
    STX $10              ; 86 10 | Store X register to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_005
; Address: $DD80A2
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_005:
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    ORA $1D12,X          ; 1D 12 1D | Logical OR with accumulator (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $0D02,X          ; 1D 02 0D | Logical OR with accumulator (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $16              ; 05 16 | Logical OR with accumulator (zero page)
    ORA $0A02            ; 0D 02 0A | Logical OR with accumulator (absolute)
    ASL $0A              ; 06 0A | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $0262            ; 0E 62 02 | Arithmetic shift left (absolute)
    EOR ($A0,X)          ; 41 A0 | Exclusive OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    LDX $4B              ; A6 4B | Load from zero page into X register
    INC                  ; 1A | Increment accumulator
    ORA $1D2E            ; 0D 2E 1D | Logical OR with accumulator (absolute)
    ROL $721D            ; 2E 1D 72 | Rotate left (absolute)
    ADC $F35D            ; 6D 5D F3 | Add with carry (absolute)
    PEA #$687C           ; F4 7C 68 | Push effective address to stack
    SEI                  ; 78 | Set interrupt disable flag
    RTI                  ; 40 | Return from interrupt
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($39,X)          ; 01 39 | Logical OR with accumulator ((zero page,X))
    AND ($1C),Y          ; 31 1C | Logical AND with accumulator ((zero page),Y)
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BCS $80              ; B0 80 | Branch if carry set
    TYA                  ; 98 | Transfer Y register to accumulator
    CPY #$8C             ; C0 8C | Compare Y register (immediate)
    CPX #$82             ; E0 82 | Compare X register (immediate)
    LDY #$CA             ; A0 CA | Load immediate value into Y register
    STY $00              ; 84 00 | Store Y register to zero page
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$70             ; C0 70 | Compare Y register (immediate)
    BEQ $38              ; F0 38 | Branch if equal
    CLI                  ; 58 | Clear interrupt disable flag
    INC $F06C,X          ; FE 6C F0 | Increment (absolute,X)
    BIT $50EC            ; 2C EC 50 | Test bits in accumulator (absolute)
    BRA $80              ; 80 80 | Branch always
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    STY $B8              ; 84 B8 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_006
; Address: $DD8128
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_006:
    PHP                  ; 08 | Push processor status to stack
    BVS $10              ; 70 10 | Branch if overflow set
    BRA $A0              ; 80 A0 | Branch always
    RTI                  ; 40 | Return from interrupt
    BCS $60              ; B0 60 | Branch if carry set
    BEQ $7C              ; F0 7C | Branch if equal
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_007
; Address: $DD813B
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_007:
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    PLX                  ; FA | Pull X register from stack
    STY $64              ; 84 64 | Store Y register to zero page
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    CPY #$B0             ; C0 B0 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_008
; Address: $DD8153
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_008:
    LDY #$08             ; A0 08 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    BRA $20              ; 80 20 | Branch always
    LDY #$E0             ; A0 E0 | Game work RAM access
    BPL $10              ; 10 10 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($1E),Y          ; 11 1E | Logical OR with accumulator ((zero page),Y)
    ORA #$1F             ; 09 1F | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_009
; Address: $DD8188
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_009:
    ORA ($42),Y          ; 11 42 | Hardware register operation
    RTI                  ; 40 | Return from interrupt
    LDX #$49             ; A2 49 | Load immediate value into X register
    JMP ($F35F)          ; 6C 5F F3 | Jump to address (absolute indirect)
    INC $7CF6,X          ; FE F6 7C | Increment (absolute,X)
    JMP ($4378)          ; 6C 78 43 | Jump to address (absolute indirect)
    SEC                  ; 38 | Set carry flag
    BPL $1D              ; 10 1D | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    ORA #$07             ; 09 07 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_00A
; Address: $DD81B1
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_00A:
    AND $1018,Y          ; 39 18 10 | Logical AND with accumulator (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    BCS $A0              ; B0 A0 | Branch if carry set
    CLV                  ; B8 | Clear overflow flag
    LDY #$AC             ; A0 AC | Load immediate value into Y register
    LDY #$A2             ; A0 A2 | Load immediate value into Y register
    LDY #$AA             ; A0 AA | Load immediate value into Y register
    LDY $40              ; A4 40 | Load from zero page into Y register
    LDY #$40             ; A0 40 | Load immediate value into Y register
    LDY #$50             ; A0 50 | Load immediate value into Y register
    BCS $58              ; B0 58 | Branch if carry set
    LDY $BE58,X          ; BC 58 BE | Load from absolute,X into Y register
    JMP $4CB0            ; 4C B0 4C | Jump to address
    LDY $B250            ; AC 50 B2 | Load from absolute address into Y register
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    CPX $F8              ; E4 F8 | Compare X register (zero page)
    PHP                  ; 08 | Push processor status to stack
    BEQ $30              ; F0 30 | Branch if equal
    CPY #$A0             ; C0 A0 | Compare Y register (immediate)
    CPY #$50             ; C0 50 | Compare Y register (immediate)
    LDY #$B0             ; A0 B0 | Load immediate value into Y register
    JMP $804094          ; 5C 94 40 80 | Jump to address long
    RTI                  ; 40 | Return from interrupt
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_00B
; Address: $DD81FE
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_00B:
    JSR $1020            ; 20 20 10 | Jump to subroutine
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDY #$40             ; A0 40 | Load immediate value into Y register
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_00C
; Address: $DD8210
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_00C:
    JSR $C0C0            ; 20 C0 C0 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    LDY $A0              ; A4 A0 | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_00D
; Address: $DD8226
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_00D:
    TAY                  ; A8 | Transfer accumulator to Y register
    LDX #$B5             ; A2 B5 | Load immediate value into X register
    LDX #$A5             ; A2 A5 | Load immediate value into X register
    LDY #$B2             ; A0 B2 | Load immediate value into Y register
    LDA #$B0             ; A9 B0 | Read graphics status
    RTI                  ; 40 | Return from interrupt
    ORA ($A2,X)          ; 01 A2 | Logical OR with accumulator ((zero page,X))
    EOR ($A2,X)          ; 41 A2 | Exclusive OR with accumulator ((zero page,X))
    LDA                  ; BF 57 B6 5B | Read graphics status
    LDA $AE5E,Y          ; B9 5E AE | Read graphics status
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    TSX                  ; BA | Transfer stack pointer to X register
    LDA $A6A0            ; AD A0 A6 | Read graphics status
    CLV                  ; B8 | Clear overflow flag
    SBC $F916            ; ED 16 F9 | Subtract with carry (absolute)
    BVS $BE              ; 70 BE | Branch if overflow set
    TSX                  ; BA | Transfer stack pointer to X register
    BVC $B0              ; 50 B0 | Branch if overflow clear
    BVC $B8              ; 50 B8 | Branch if overflow clear
    EOR ($BC,X)          ; 41 BC | Exclusive OR with accumulator ((zero page,X))
    CLI                  ; 58 | Clear interrupt disable flag
    BEQ $40              ; F0 40 | Branch if equal
    BPL $E4              ; 10 E4 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ASL $97              ; 06 97 | Arithmetic shift left (zero page)
    BVS $17              ; 70 17 | Branch if overflow set
    STZ $13              ; 64 13 | Store zero to zero page
    STZ $21              ; 64 21 | PPU graphics register access
    ASL $0B              ; 06 0B | Arithmetic shift left (zero page)
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    INY                  ; C8 | Increment Y register
    DEY                  ; 88 | Decrement Y register
    ADC ($48,X)          ; 61 48 | Add with carry ((zero page,X))
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_00E
; Address: $DD8284
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_00E:
    JSR $9000            ; 20 00 90 | Jump to subroutine
    TAY                  ; A8 | Transfer accumulator to Y register
    BPL $AA              ; 10 AA | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BCC $08              ; 90 08 | Branch if carry clear
    RTI                  ; 40 | Return from interrupt
    CPY #$A3             ; C0 A3 | Compare Y register (immediate)
    BEQ $B3              ; F0 B3 | Branch if equal
    PLA                  ; 68 | Pull accumulator from stack
    STZ $7C98,X          ; 9E 98 7C | Store zero to absolute,X
    BVS $04              ; 70 04 | Branch if overflow set
    TAY                  ; A8 | Transfer accumulator to Y register
    CLV                  ; B8 | Clear overflow flag
    SBC ($19,X)          ; E1 19 | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_00F
; Address: $DD82A9
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_00F:
    CPY $E0              ; C4 E0 | Game work RAM access
    BVS $9C              ; 70 9C | Branch if overflow set
    SBC $7C06            ; ED 06 7C | Subtract with carry (absolute)
    JMP $0E0A08          ; 5C 08 0A 0E | Jump to address long
    AND $0E1F,X          ; 3D 1F 0E | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_010
; Address: $DD82BD
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_010:
    JSR $6010            ; 20 10 60 | Jump to subroutine
    SEP #$30             ; E2 30 | Set processor status bits
    CPX #$70             ; E0 70 | Compare X register (immediate)
    INY                  ; C8 | Increment Y register
    BVS $D8              ; 70 D8 | Branch if overflow set
    BVC $18              ; 50 18 | Branch if overflow clear
    BVS $88              ; 70 88 | Branch if overflow set
    BVS $C0              ; 70 C0 | Branch if overflow set
    PHP                  ; 08 | Push processor status to stack
    BRA $08              ; 80 08 | Branch always
    BRA $08              ; 80 08 | Branch always

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_011
; Address: $DD82D9
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_011:
    JSR $0080            ; 20 80 00 | Jump to subroutine
    BPL $10              ; 10 10 | Branch if positive
    BVC $60              ; 50 60 | Branch if overflow clear
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    LDY $A0              ; A4 A0 | Load from zero page into Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    LDX #$B5             ; A2 B5 | Load immediate value into X register
    LDX #$A5             ; A2 A5 | Load immediate value into X register
    LDY #$B2             ; A0 B2 | Load immediate value into Y register
    LDA #$B0             ; A9 B0 | Read graphics status
    RTI                  ; 40 | Return from interrupt
    LDY #$41             ; A0 41 | Load immediate value into Y register
    LDX #$41             ; A2 41 | Load immediate value into X register
    LDX #$47             ; A2 47 | Load immediate value into X register
    LDA                  ; BF 57 B6 5B | Read graphics status
    LDA $AE5E,Y          ; B9 5E AE | Read graphics status
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    TSX                  ; BA | Transfer stack pointer to X register
    LDA $A6A0            ; AD A0 A6 | Read graphics status
    SED                  ; F8 | Set decimal mode flag
    SBC $799E,X          ; FD 9E 79 | Subtract with carry (absolute,X)
    BVS $BE              ; 70 BE | Branch if overflow set
    TSX                  ; BA | Transfer stack pointer to X register
    BVC $B0              ; 50 B0 | Branch if overflow clear
    BVC $B8              ; 50 B8 | Branch if overflow clear
    EOR ($FC,X)          ; 41 FC | Exclusive OR with accumulator ((zero page,X))
    CLI                  ; 58 | Clear interrupt disable flag
    BPL $E0              ; 10 E0 | Game work RAM access
    PHP                  ; 08 | Push processor status to stack
    ASL $1F              ; 06 1F | Arithmetic shift left (zero page)
    PLA                  ; 68 | Pull accumulator from stack
    JMP ($0E27)          ; 6C 27 0E | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_012
; Address: $DD8327
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_012:
    ASL $0A1B            ; 0E 1B 0A | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    ASL $0E11            ; 0E 11 0E | Arithmetic shift left (absolute)
    ORA ($C0,X)          ; 01 C0 | Logical OR with accumulator ((zero page,X))
    ADC ($80,X)          ; 61 80 | Add with carry ((zero page,X))
    ADC ($50,X)          ; 61 50 | Add with carry ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_013
; Address: $DD8344
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_013:
    JSR $9000            ; 20 00 90 | Jump to subroutine
    TAY                  ; A8 | Transfer accumulator to Y register
    BPL $AA              ; 10 AA | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BCC $08              ; 90 08 | Branch if carry clear
    RTI                  ; 40 | Return from interrupt
    CPY #$A3             ; C0 A3 | Compare Y register (immediate)
    BEQ $B3              ; F0 B3 | Branch if equal
    PLA                  ; 68 | Pull accumulator from stack
    STZ $7C98,X          ; 9E 98 7C | Store zero to absolute,X
    BVS $04              ; 70 04 | Branch if overflow set
    TAY                  ; A8 | Transfer accumulator to Y register
    CLV                  ; B8 | Clear overflow flag
    SBC ($19,X)          ; E1 19 | Subtract with carry ((zero page,X))
    CPY $E0              ; C4 E0 | Game work RAM access
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_014
; Address: $DD836D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_014:
    STY $0CFA            ; 8C FA 0C | Store Y register to absolute address
    JMP $0E0A08          ; 5C 08 0A 0E | Jump to address long
    AND $0E1F,X          ; 3D 1F 0E | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_015
; Address: $DD837D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_015:
    JSR $6000            ; 20 00 60 | Jump to subroutine
    INC $0C              ; E6 0C | Increment (zero page)
    CPX $18              ; E4 18 | Compare X register (zero page)
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_016
; Address: $DD8385
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_016:
    JSR $6090            ; 20 90 60 | Jump to subroutine
    BNE $60              ; D0 60 | Branch if not equal
    BCC $60              ; 90 60 | Branch if carry clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_017
; Address: $DD8391
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_017:
    BPL $00              ; 10 00 | Branch if positive
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_019
; Address: $DD83A0
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_019:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    LDY #$AC             ; A0 AC | Load immediate value into Y register
    LDY #$B8             ; A0 B8 | Load immediate value into Y register
    BCS $A7              ; B0 A7 | Branch if carry set
    LDA ($A4,X)          ; A1 A4 | Read graphics status
    LDY #$40             ; A0 40 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_01A
; Address: $DD83B6
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_01A:
    LDA $5BBF5C          ; AF 5C BF 5B | Read graphics status
    LDA                  ; BF 57 AF 55 | Read graphics status
    LDA $B7A0A0          ; AF A0 A0 B7 | Read graphics status
    TAY                  ; A8 | Transfer accumulator to Y register
    LDY #$9D             ; A0 9D | Load immediate value into Y register
    CPX #$EE             ; E0 EE | Compare X register (immediate)
    CPY #$2C             ; C0 2C | Compare Y register (immediate)
    DEX                  ; CA | Decrement X register
    AND $AFD6,X          ; 3D D6 AF | Logical AND with accumulator (absolute,X)
    PLB                  ; AB | Pull data bank register from stack
    STA ($40,X)          ; 81 40 | Update graphics data
    BRA $42              ; 80 42 | Hardware register operation
    SBC ($40),Y          ; F1 40 | Subtract with carry ((zero page),Y)
    CPY #$11             ; C0 11 | Compare Y register (immediate)
    BRA $0F              ; 80 0F | Branch always
    BRA $0E              ; 80 0E | Branch always
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ORA $B000            ; 0D 00 B0 | Logical OR with accumulator (absolute)
    STX $40              ; 86 40 | Store X register to zero page
    STA $80              ; 85 80 | Update graphics data
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $90              ; 10 90 | Branch if positive
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_01B
; Address: $DD840F
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_01B:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    BRA $30              ; 80 30 | Branch always
    CPY #$B8             ; C0 B8 | Compare Y register (immediate)
    DEY                  ; 88 | Decrement Y register
    SEI                  ; 78 | Set interrupt disable flag
    BCC $F8              ; 90 F8 | Branch if carry clear
    BEQ $10              ; F0 10 | Branch if equal
    CPX #$28             ; E0 28 | Compare X register (immediate)
    BEQ $C0              ; F0 C0 | Branch if equal
    BPL $E0              ; 10 E0 | Game work RAM access
    BPL $10              ; 10 10 | Branch if positive
    BEQ $06              ; F0 06 | Branch if equal
    DEY                  ; 88 | Decrement Y register
    WDM #$45             ; 42 45 | Reserved instruction
    PLP                  ; 28 | Pull processor status from stack
    LDY $D225            ; AC 25 D2 | Load from absolute address into Y register
    CLD                  ; D8 | Clear decimal mode flag
    BEQ $F4              ; F0 F4 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    PEA #$CEF8           ; F4 F8 CE | Push effective address to stack
    PLX                  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_01C
; Address: $DD843A
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_01C:
    SBC $6F7F            ; ED 7F 6F | Subtract with carry (absolute)
    ROL $1E16,X          ; 3E 16 1E | Rotate left (absolute,X)
    JMP ($90C4)          ; 6C C4 90 | Jump to address (absolute indirect)
    PHA                  ; 48 | Push accumulator to stack
    BCS $30              ; B0 30 | Branch if carry set
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    BRA $40              ; 80 40 | Branch always
    BRA $0C              ; 80 0C | Branch always
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_01F
; Address: $DD845B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_01F:
    JSR $0040            ; 20 40 00 | Jump to subroutine
    BRA $80              ; 80 80 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_021
; Address: $DD8462
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_021:
    BVC $50              ; 50 50 | Branch if overflow clear
    BVC $5C              ; 50 5C | Branch if overflow clear
    RTI                  ; 40 | Return from interrupt
    PHA                  ; 48 | Push accumulator to stack
    RTI                  ; 40 | Return from interrupt
    EOR ($44),Y          ; 51 44 | Exclusive OR with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_022
; Address: $DD8473
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_022:
    JSR $2F53            ; 20 53 2F | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BVC $57              ; 50 57 | Branch if overflow clear
    CLI                  ; 58 | Clear interrupt disable flag
    BVS $7D              ; 70 7D | Branch if overflow set
    ROR $6010            ; 6E 10 60 | Rotate right (absolute)
    ROR                  ; 6A | Rotate right (accumulator)
    AND $4F46            ; 2D 46 4F | Logical AND with accumulator (absolute)
    EOR ($20,X)          ; 41 20 | Exclusive OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_023
; Address: $DD8497
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_023:
    JSL $8F6091          ; 22 91 60 8F | Jump to subroutine long
    STA ($00,X)          ; 81 00 | Update graphics data
    BVC $40              ; 50 40 | Branch if overflow clear
    ASL $0C41            ; 0E 41 0C | Arithmetic shift left (absolute)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_024
; Address: $DD84B0
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_024:
    JSR $4044            ; 20 44 40 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $90              ; 10 90 | Branch if positive
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_025
; Address: $DD84CF
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_025:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    BRA $30              ; 80 30 | Branch always
    CPY #$B8             ; C0 B8 | Compare Y register (immediate)
    DEY                  ; 88 | Decrement Y register
    SEI                  ; 78 | Set interrupt disable flag
    BCC $F8              ; 90 F8 | Branch if carry clear
    BEQ $10              ; F0 10 | Branch if equal
    CPX #$28             ; E0 28 | Compare X register (immediate)
    BEQ $C0              ; F0 C0 | Branch if equal
    BPL $E0              ; 10 E0 | Game work RAM access
    BPL $10              ; 10 10 | Branch if positive
    BEQ $06              ; F0 06 | Branch if equal
    DEY                  ; 88 | Decrement Y register
    WDM #$45             ; 42 45 | Reserved instruction
    PLP                  ; 28 | Pull processor status from stack
    LDY $D205            ; AC 05 D2 | Load from absolute address into Y register
    CLD                  ; D8 | Clear decimal mode flag
    BEQ $F4              ; F0 F4 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    PEA #$CEF8           ; F4 F8 CE | Push effective address to stack
    PLX                  ; FA | Pull X register from stack
    SBC $6F7F            ; ED 7F 6F | Subtract with carry (absolute)
    ROL $1E36,X          ; 3E 36 1E | Rotate left (absolute,X)
    WDM #$9C             ; 42 9C | Reserved instruction
    CPX $88              ; E4 88 | Compare X register (zero page)
    CLV                  ; B8 | Clear overflow flag
    RTI                  ; 40 | Return from interrupt
    BMI $E0              ; 30 E0 | Game work RAM access
    BPL $A0              ; 10 A0 | Branch if positive
    BRA $E0              ; 80 E0 | Game work RAM access
    BCC $E0              ; 90 E0 | Game work RAM access
    BVC $20              ; 50 20 | Branch if overflow clear
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    BPL $00              ; 10 00 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_026
; Address: $DD851F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_026:
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BPL $1F              ; 10 1F | Branch if positive
    PLA                  ; 68 | Pull accumulator from stack
    SEI                  ; 78 | Set interrupt disable flag
    BCS $6F              ; B0 6F | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_028
; Address: $DD852F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_028:
    BCS $08              ; B0 08 | Branch if carry set
    CLC                  ; 18 | Clear carry flag
    PLA                  ; 68 | Pull accumulator from stack
    CLI                  ; 58 | Clear interrupt disable flag
    BNE $6F              ; D0 6F | Branch if not equal
    BNE $B7              ; D0 B7 | Branch if not equal

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_029
; Address: $DD853F
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_029:
    PHA                  ; 48 | Push accumulator to stack
    LDY $AFB0            ; AC B0 AF | Load from absolute address into Y register
    CLV                  ; B8 | Clear overflow flag
    LDA $A5              ; A5 A5 | Read graphics status
    SBC ($A1,X)          ; E1 A1 | Subtract with carry ((zero page,X))
    STA ($21,X)          ; 81 21 | PPU graphics register access
    LDA $40AF40          ; AF 40 AF 40 | Read graphics status
    BVC $BF              ; 50 BF | Branch if overflow clear
    CLI                  ; 58 | Clear interrupt disable flag
    CPX $A58C            ; EC 8C A5 | Compare X register (absolute)
    LDY #$43             ; A0 43 | Load immediate value into Y register
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $0608            ; 0E 08 06 | Arithmetic shift left (absolute)
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    STA $A207,X          ; 9D 07 A2 | Update graphics data
    PHY                  ; 5A | Push Y register to stack
    EOR ($04),Y          ; 51 04 | Exclusive OR with accumulator ((zero page),Y)
    BPL $03              ; 10 03 | Branch if positive
    BPL $01              ; 10 01 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $F0              ; 10 F0 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    CPX $FC              ; E4 FC | Compare X register (zero page)
    PEA #$B81C           ; F4 1C B8 | Push effective address to stack
    JMP $24DC            ; 4C DC 24 | Jump to address
    JMP ($18E8)          ; 6C E8 18 | Jump to address (absolute indirect)
    BPL $E0              ; 10 E0 | Game work RAM access
    INY                  ; C8 | Increment Y register
    BMI $E4              ; 30 E4 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    PEA #$F408           ; F4 08 F4 | Push effective address to stack
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    INY                  ; C8 | Increment Y register
    BMI $08              ; 30 08 | Branch if negative
    BEQ $14              ; F0 14 | Branch if equal
    CPX $F4              ; E4 F4 | Compare X register (zero page)
    PEA #$B4B4           ; F4 B4 B4 | Push effective address to stack
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    ROR                  ; 6A | Rotate right (accumulator)
    JMP ($00F0)          ; 6C F0 00 | Jump to address (absolute indirect)
    BEQ $00              ; F0 00 | Branch if equal
    CPX $FC08            ; EC 08 FC | Compare X register (absolute)
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ROR $78F8,X          ; 7E F8 78 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_02A
; Address: $DD85BF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_02A:
    BEQ $B1              ; F0 B1 | Branch if equal
    LDX $00              ; A6 00 | Load from zero page into X register
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    LDY #$50             ; A0 50 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_02C
; Address: $DD85D0
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_02C:
    SED                  ; F8 | Set decimal mode flag
    CPX #$50             ; E0 50 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $30              ; 80 30 | Branch always
    BCC $40              ; 90 40 | Branch if carry clear
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    BPL $1F              ; 10 1F | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    BVS $AF              ; 70 AF | Branch if overflow set
    LDY #$6F             ; A0 6F | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_02D
; Address: $DD85EF
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_02D:
    BVC $08              ; 50 08 | Branch if overflow clear
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    LDA $D06F50          ; AF 50 6F D0 | Read graphics status
    INX                  ; E8 | Increment X register
    LDY $AFB0            ; AC B0 AF | Load from absolute address into Y register
    CLV                  ; B8 | Clear overflow flag
    LDA $A5              ; A5 A5 | Read graphics status
    LDA ($A1,X)          ; A1 A1 | Read graphics status
    SBC ($A1,X)          ; E1 A1 | Subtract with carry ((zero page,X))
    LDA $40AF40          ; AF 40 AF 40 | Read graphics status
    BVC $BF              ; 50 BF | Branch if overflow clear
    CLI                  ; 58 | Clear interrupt disable flag
    LDY $E55C            ; AC 5C E5 | Load from absolute address into Y register
    LDY #$A3             ; A0 A3 | Load immediate value into Y register
    LDY #$41             ; A0 41 | Load immediate value into Y register
    EOR $0A              ; 45 0A | Exclusive OR with accumulator (zero page)
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA $BA07            ; 0D 07 BA | Logical OR with accumulator (absolute)
    LDA ($4C,X)          ; A1 4C | Read graphics status
    EOR #$02             ; 49 02 | Exclusive OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $F0              ; 10 F0 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    CPX $FC              ; E4 FC | Compare X register (zero page)
    PEA #$B81C           ; F4 1C B8 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_02E
; Address: $DD8649
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_02E:
    JMP $24DC            ; 4C DC 24 | Jump to address
    JMP ($18E8)          ; 6C E8 18 | Jump to address (absolute indirect)
    BPL $E0              ; 10 E0 | Game work RAM access
    INY                  ; C8 | Increment Y register
    BMI $E4              ; 30 E4 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    PEA #$F408           ; F4 08 F4 | Push effective address to stack
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    INY                  ; C8 | Increment Y register
    BMI $08              ; 30 08 | Branch if negative
    BEQ $14              ; F0 14 | Branch if equal
    CPX $F4              ; E4 F4 | Compare X register (zero page)
    PEA #$B4B4           ; F4 B4 B4 | Push effective address to stack
    ROL $24              ; 26 24 | Rotate left (zero page)
    ROR $00F0            ; 6E F0 00 | Rotate right (absolute)
    BEQ $00              ; F0 00 | Branch if equal
    CPX $FC08            ; EC 08 FC | Compare X register (absolute)
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $B6              ; F0 B6 | Branch if equal
    BCS $A0              ; B0 A0 | Branch if carry set
    RTI                  ; 40 | Return from interrupt
    BCC $00              ; 90 00 | Branch if carry clear
    BMI $50              ; 30 50 | Branch if negative
    BVS $10              ; 70 10 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_02F
; Address: $DD868C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_02F:
    BCC $60              ; 90 60 | Branch if carry clear
    LDY #$40             ; A0 40 | Load immediate value into Y register
    SED                  ; F8 | Set decimal mode flag
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CLI                  ; 58 | Clear interrupt disable flag
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_030
; Address: $DD8695
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_030:
    JSR $C008            ; 20 08 C0 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    AND ($20),Y          ; 31 20 | Logical AND with accumulator ((zero page),Y)
    BMI $2F              ; 30 2F | Branch if negative
    SEC                  ; 38 | Set carry flag
    PLP                  ; 28 | Pull processor status from stack
    BPL $31              ; 10 31 | Branch if positive
    ASL $003F            ; 0E 3F 00 | Arithmetic shift left (absolute)
    ORA $2F03,X          ; 1D 03 2F | Logical OR with accumulator (absolute,X)
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_031
; Address: $DD86C8
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_031:
    JSL $696922          ; 22 22 69 69 | Jump to subroutine long
    STZ $65              ; 64 65 | Store zero to zero page
    STZ $22              ; 64 22 | Store zero to zero page
    ORA ($3F),Y          ; 11 3F | Logical OR with accumulator ((zero page),Y)
    ROL $3C77,X          ; 3E 77 3C | Rotate left (absolute,X)
    AND ($38),Y          ; 31 38 | Logical AND with accumulator ((zero page),Y)
    EOR #$06             ; 49 06 | Exclusive OR with accumulator (immediate)
    ROL                  ; 2A | Rotate left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    ASL $0505            ; 0E 05 05 | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BMI $30              ; 30 30 | Branch if negative
    BPL $11              ; 10 11 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    SEI                  ; 78 | Set interrupt disable flag
    STZ $B6E4            ; 9C E4 B6 | Store zero to absolute
    LSR $A5              ; 46 A5 | Logical shift right (zero page)
    EOR $06              ; 45 06 | Exclusive OR with accumulator (zero page)
    ASL $F6              ; 06 F6 | Arithmetic shift left (zero page)
    SBC $FD5D,X          ; FD 5D FD | Subtract with carry (absolute,X)
    RTI                  ; 40 | Return from interrupt
    SEC                  ; 38 | Set carry flag
    STZ $B660            ; 9C 60 B6 | Store zero to absolute
    PHA                  ; 48 | Push accumulator to stack
    LDA $5A              ; A5 5A | Read graphics status
    CMP $DD22,X          ; DD 22 DD | Compare accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_032
; Address: $DD871F
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_032:
    JSL $2DEDCD          ; 22 CD ED 2D | Jump to subroutine long
    EOR $D50D,X          ; 5D 0D D5 | Exclusive OR with accumulator (absolute,X)
    ORA $93B5            ; 0D B5 93 | Logical OR with accumulator (absolute)
    SBC ($91,X)          ; E1 91 | Subtract with carry ((zero page,X))
    STA $57EE            ; 8D EE 57 | Update graphics data
    STA ($DD),Y          ; 91 DD | Update graphics data
    STA $2582            ; 8D 82 25 | Update graphics data
    ORA $42              ; 05 42 | Hardware register operation
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    PLA                  ; 68 | Pull accumulator from stack
    BCC $00              ; 90 00 | Branch if carry clear
    CMP $1520,Y          ; D9 20 15 | Compare accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_033
; Address: $DD8742
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_033:
    JSL $A0A062          ; 22 62 A0 A0 | Jump to subroutine long
    BRA $80              ; 80 80 | Branch always
    BRA $60              ; 80 60 | Branch always
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    CPY #$D0             ; C0 D0 | Compare Y register (immediate)
    CPX #$F5             ; E0 F5 | Compare X register (immediate)
    BRA $20              ; 80 20 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_035
; Address: $DD875F
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_035:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CLC                  ; 18 | Clear carry flag
    AND ($20),Y          ; 31 20 | Logical AND with accumulator ((zero page),Y)
    BMI $2F              ; 30 2F | Branch if negative
    SEC                  ; 38 | Set carry flag
    PLP                  ; 28 | Pull processor status from stack
    BPL $31              ; 10 31 | Branch if positive
    ASL $003F            ; 0E 3F 00 | Arithmetic shift left (absolute)
    ORA $2F03,X          ; 1D 03 2F | Logical OR with accumulator (absolute,X)
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_036
; Address: $DD8788
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_036:
    JSL $696922          ; 22 22 69 69 | Jump to subroutine long
    STZ $65              ; 64 65 | Store zero to zero page
    STZ $24              ; 64 24 | Store zero to zero page
    ORA ($3F),Y          ; 11 3F | Logical OR with accumulator ((zero page),Y)
    ROL $3E77,X          ; 3E 77 3E | Rotate left (absolute,X)
    ROL $0849,X          ; 3E 49 08 | Rotate left (absolute,X)
    BIT $04              ; 24 04 | Test bits in accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ROL $1C3E,X          ; 3E 3E 1C | Rotate left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    SEI                  ; 78 | Set interrupt disable flag
    STZ $B4E4            ; 9C E4 B4 | Store zero to absolute
    LDY $44              ; A4 44 | Load from zero page into Y register
    ASL $F6              ; 06 F6 | Arithmetic shift left (zero page)
    ORA $F5              ; 05 F5 | Logical OR with accumulator (zero page)
    ORA $FD              ; 05 FD | Logical OR with accumulator (zero page)
    LSR $40FA,X          ; 5E FA 40 | Logical shift right (absolute,X)
    SEC                  ; 38 | Set carry flag
    STZ $B460            ; 9C 60 B4 | Store zero to absolute
    PHA                  ; 48 | Push accumulator to stack
    LDY $58              ; A4 58 | Load from zero page into Y register
    PHA                  ; 48 | Push accumulator to stack
    LSR                  ; 4A | Logical shift right (accumulator)
    CMP $DA22,X          ; DD 22 DA | Compare accumulator (absolute,X)
    BIT $CA              ; 24 CA | Test bits in accumulator (zero page)
    NOP                  ; EA | No operation
    ROL                  ; 2A | Rotate left (accumulator)
    PHY                  ; 5A | Push Y register to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TXS                  ; 9A | Transfer X register to stack pointer

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_038
; Address: $DD87EC
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_038:
    JSL $9C1AE8          ; 22 E8 1A 9C | Jump to subroutine long
    PHX                  ; DA | Push X register to stack
    TXA                  ; 8A | Transfer X register to accumulator
    STY $22              ; 84 22 | Store Y register to zero page
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ROR                  ; 6A | Rotate right (accumulator)
    BCC $04              ; 90 04 | Branch if carry clear
    BVC $20              ; 50 20 | Branch if overflow clear
    ROL $BAD2,X          ; 3E D2 BA | Rotate left (absolute,X)
    ROR                  ; 6A | Rotate right (accumulator)
    STZ $04              ; 64 04 | Store zero to zero page
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_039
; Address: $DD880D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_039:
    RTI                  ; 40 | Return from interrupt
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_03A
; Address: $DD8818
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_03A:
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $08              ; 80 08 | Branch always
    CLC                  ; 18 | Clear carry flag
    ROL $28              ; 26 28 | Rotate left (zero page)
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    ROL $19              ; 26 19 | Rotate left (zero page)
    ORA #$36             ; 09 36 | Logical OR with accumulator (immediate)
    ORA #$1B             ; 09 1B | Logical OR with accumulator (immediate)
    INC                  ; 1A | Increment accumulator
    ASL $180D            ; 0E 0D 18 | Arithmetic shift left (absolute)
    ORA $1E18,X          ; 1D 18 1E | Logical OR with accumulator (absolute,X)
    AND ($2D,X)          ; 21 2D | Logical AND with accumulator ((zero page,X))
    AND $060E,Y          ; 39 0E 06 | Logical AND with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    INC                  ; 1A | Increment accumulator
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    ORA #$3C             ; 09 3C | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    BIT $4A00            ; 2C 00 4A | Test bits in accumulator (absolute)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_03B
; Address: $DD8863
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_03B:
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_03C
; Address: $DD8867
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_03C:
    ASL $060A            ; 0E 0A 06 | Arithmetic shift left (absolute)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    BPL $01              ; 10 01 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $F0              ; 10 F0 | Branch if positive
    DEY                  ; 88 | Decrement Y register
    SEI                  ; 78 | Set interrupt disable flag
    ASL $0D36            ; 0E 36 0D | Arithmetic shift left (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $E0              ; 10 E0 | Game work RAM access
    INX                  ; E8 | Increment X register
    BPL $64              ; 10 64 | Branch if positive
    TYA                  ; 98 | Transfer Y register to accumulator
    ROL $6DD0            ; 2E D0 6D | Rotate left (absolute)
    ROR                  ; 6A | Rotate right (accumulator)
    PHX                  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_03D
; Address: $DD889F
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_03D:
    JSL $7DE5FD          ; 22 FD E5 7D | Jump to subroutine long
    ORA $0DAD            ; 0D AD 0D | Logical OR with accumulator (absolute)
    SBC $F535            ; ED 35 F5 | Subtract with carry (absolute)
    LDA ($19),Y          ; B1 19 | Read graphics status
    AND $F5D6,X          ; 3D D6 F5 | Logical AND with accumulator (absolute,X)
    SEP #$35             ; E2 35 | Set processor status bits
    EOR $1D1A,X          ; 5D 1A 1D | Exclusive OR with accumulator (absolute,X)
    INC                  ; 1A | Increment accumulator
    AND $491A,X          ; 3D 1A 49 | Logical AND with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    BMI $02              ; 30 02 | Branch if negative
    BVS $00              ; 70 00 | Branch if overflow set
    SBC ($05,X)          ; E1 05 | Subtract with carry ((zero page,X))
    CMP $02              ; C5 02 | Compare accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    BVS $10              ; 70 10 | Branch if overflow set
    BVS $10              ; 70 10 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_03E
; Address: $DD88CC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_03E:
    BCC $60              ; 90 60 | Branch if carry clear
    CPX #$40             ; E0 40 | Compare X register (immediate)
    SBC #$10             ; E9 10 | Subtract with carry (immediate)
    CMP $3A              ; C5 3A | Compare accumulator (zero page)
    TXA                  ; 8A | Transfer X register to accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_03F
; Address: $DD88D6
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_03F:
    PHP                  ; 08 | Push processor status to stack
    BRA $88              ; 80 88 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    ROL $28              ; 26 28 | Rotate left (zero page)
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_040
; Address: $DD88E9
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_040:
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    ROL $19              ; 26 19 | Rotate left (zero page)
    ORA #$36             ; 09 36 | Logical OR with accumulator (immediate)
    ORA #$1B             ; 09 1B | Logical OR with accumulator (immediate)
    INC                  ; 1A | Increment accumulator
    ASL $180D            ; 0E 0D 18 | Arithmetic shift left (absolute)
    ORA $1E18,X          ; 1D 18 1E | Logical OR with accumulator (absolute,X)
    AND ($2D,X)          ; 21 2D | Logical AND with accumulator ((zero page,X))
    BIT $B23B            ; 2C 3B B2 | Test bits in accumulator (absolute)
    ADC #$0E             ; 69 0E | Add with carry (immediate)
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    INC                  ; 1A | Increment accumulator
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    ORA #$3C             ; 09 3C | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    JMP $0A00            ; 4C 00 0A | Jump to address
    ROR $07              ; 66 07 | Rotate right (zero page)
    ORA #$02             ; 09 02 | Logical OR with accumulator (immediate)
    ASL $0E08            ; 0E 08 0E | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA ($06),Y          ; 11 06 | Logical OR with accumulator ((zero page),Y)
    BPL $01              ; 10 01 | Branch if positive
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $F0              ; 10 F0 | Branch if positive
    DEY                  ; 88 | Decrement Y register
    SEI                  ; 78 | Set interrupt disable flag
    ASL $0D76            ; 0E 76 0D | Arithmetic shift left (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    DEX                  ; CA | Decrement X register
    BPL $E0              ; 10 E0 | Game work RAM access
    INX                  ; E8 | Increment X register
    BPL $64              ; 10 64 | Branch if positive
    TYA                  ; 98 | Transfer Y register to accumulator
    BIT $6ED0            ; 2C D0 6E | Test bits in accumulator (absolute)
    BCC $6D              ; 90 6D | Branch if carry clear
    PHX                  ; DA | Push X register to stack
    SBC $7D              ; E5 7D | Subtract with carry (zero page)
    ORA $0DAD            ; 0D AD 0D | Logical OR with accumulator (absolute)
    SBC $F535            ; ED 35 F5 | Subtract with carry (absolute)
    SBC $DC31,Y          ; F9 31 DC | Subtract with carry (absolute,Y)
    SEP #$35             ; E2 35 | Set processor status bits
    EOR $1D1A,X          ; 5D 1A 1D | Exclusive OR with accumulator (absolute,X)
    INC                  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_041
; Address: $DD8978
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_041:
    AND $4D1A,X          ; 3D 1A 4D | Logical AND with accumulator (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BVS $02              ; 70 02 | Branch if overflow set
    ADC $D7E6            ; 6D E6 D7 | Add with carry (absolute)
    ORA ($85),Y          ; 11 85 | Logical OR with accumulator ((zero page),Y)
    ORA $12              ; 05 12 | Logical OR with accumulator (zero page)
    BVC $60              ; 50 60 | Branch if overflow clear
    BEQ $60              ; F0 60 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_042
; Address: $DD8990
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_042:
    BEQ $00              ; F0 00 | Branch if equal
    CMP ($20),Y          ; D1 20 | Compare accumulator ((zero page),Y)
    STA $0A72            ; 8D 72 0A | Update graphics data
    BRA $80              ; 80 80 | Branch always
    ASL $2739,X          ; 1E 39 27 | Arithmetic shift left (absolute,X)
    AND $2522            ; 2D 22 25 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_043
; Address: $DD89A8
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_043:
    JSL $2D252E          ; 22 2E 25 2D | Jump to subroutine long
    AND $3D              ; 25 3D | Logical AND with accumulator (zero page)
    AND $2D06,Y          ; 39 06 2D | Logical AND with accumulator (absolute,Y)
    AND $1A              ; 25 1A | Logical AND with accumulator (zero page)
    ROL $2D11            ; 2E 11 2D | Rotate left (absolute)
    AND $1B03,X          ; 3D 03 1B | Logical AND with accumulator (absolute,X)
    ORA $12              ; 05 12 | Logical OR with accumulator (zero page)
    INC                  ; 1A | Increment accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $060A            ; 0E 0A 06 | Arithmetic shift left (absolute)
    ORA $0C              ; 05 0C | Logical OR with accumulator (zero page)
    INC                  ; 1A | Increment accumulator
    ORA #$12             ; 09 12 | Logical OR with accumulator (immediate)
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    CPX #$18             ; E0 18 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    STY $4C84            ; 8C 84 4C | Store Y register to absolute address
    JMP $E89460          ; 5C 60 94 E8 | Jump to address long
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_044
; Address: $DD8A16
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_044:
    BEQ $08              ; F0 08 | Branch if equal
    STY $7C70            ; 8C 70 7C | Store Y register to absolute address
    BRA $78              ; 80 78 | Branch always
    BRA $F8              ; 80 F8 | Branch always
    CLV                  ; B8 | Clear overflow flag
    CPY #$F4             ; C0 F4 | Compare Y register (immediate)
    CPX $A4              ; E4 A4 | Compare X register (zero page)
    LDY $EC              ; A4 EC | Load from zero page into Y register
    CPX $C4C4            ; EC C4 C4 | Compare X register (absolute)
    LDX $26              ; A6 26 | Load from zero page into X register
    ROL $A4              ; 26 A4 | Rotate left (zero page)
    BEQ $00              ; F0 00 | Branch if equal
    CPX $FC08            ; EC 08 FC | Compare X register (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    DEC $6E7C,X          ; DE 7C 6E | Decrement (absolute,X)
    JMP ($123C)          ; 6C 3C 12 | Jump to address (absolute indirect)
    BCC $24              ; 90 24 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_045
; Address: $DD8A43
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_045:
    JSR $9018            ; 20 18 90 | Jump to subroutine
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    CPY #$FC             ; C0 FC | Compare Y register (immediate)
    SEC                  ; 38 | Set carry flag
    CLD                  ; D8 | Clear decimal mode flag
    BPL $60              ; 10 60 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    CPY #$02             ; C0 02 | Compare Y register (immediate)
    ASL $2739,X          ; 1E 39 27 | Arithmetic shift left (absolute,X)
    AND $2522            ; 2D 22 25 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_047
; Address: $DD8A6C
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_047:
    JSL $1E1A3E          ; 22 3E 1A 1E | Jump to subroutine long
    AND $2D06,Y          ; 39 06 2D | Logical AND with accumulator (absolute,Y)
    AND $1A              ; 25 1A | Logical AND with accumulator (zero page)
    AND $2D12            ; 2D 12 2D | Logical AND with accumulator (absolute)
    DEC                  ; 3A | Decrement accumulator
    ORA $1A              ; 05 1A | Logical OR with accumulator (zero page)
    ORA $13              ; 05 13 | Logical OR with accumulator (zero page)
    ORA ($0B),Y          ; 11 0B | Logical OR with accumulator ((zero page),Y)
    ORA ($0D),Y          ; 11 0D | Logical OR with accumulator ((zero page),Y)
    ORA #$07             ; 09 07 | Logical OR with accumulator (immediate)
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_048
; Address: $DD8A96
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_048:
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    ORA $2A              ; 05 2A | Logical OR with accumulator (zero page)
    ORA $162D,X          ; 1D 2D 16 | Logical OR with accumulator (absolute,X)
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    CPX #$18             ; E0 18 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    STY $4C84            ; 8C 84 4C | Store Y register to absolute address
    LDY $B4A0,X          ; BC A0 B4 | Load from absolute,X into Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $08              ; F0 08 | Branch if equal
    STY $7C70            ; 8C 70 7C | Store Y register to absolute address
    BRA $B8              ; 80 B8 | Branch always
    CPY #$B8             ; C0 B8 | Compare Y register (immediate)
    CPY #$F8             ; C0 F8 | Compare Y register (immediate)
    CPY #$74             ; C0 74 | Compare Y register (immediate)
    STZ $64              ; 64 64 | Store zero to zero page
    STZ $6C              ; 64 6C | Store zero to zero page
    JMP ($4444)          ; 6C 44 44 | Jump to address (absolute indirect)
    ROR $66              ; 66 66 | Rotate right (zero page)
    ROL $A4              ; 26 A4 | Rotate left (zero page)
    BEQ $80              ; F0 80 | Branch if equal
    JMP ($7C88)          ; 6C 88 7C | Jump to address (absolute indirect)
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    LSR $EEBC,X          ; 5E BC EE | Logical shift right (absolute,X)
    JMP ($721C)          ; 6C 1C 72 | Jump to address (absolute indirect)
    BCS $94              ; B0 94 | Branch if carry set
    BPL $48              ; 10 48 | Branch if positive
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    CPY #$70             ; C0 70 | Compare Y register (immediate)
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    CLC                  ; 18 | Clear carry flag
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_04A
; Address: $DD8B18
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_04A:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    PLY                  ; 7A | Pull Y register from stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    BPL $72              ; 10 72 | Branch if positive
    ORA $0A35            ; 0D 35 0A | Logical OR with accumulator (absolute)
    ORA $2402,X          ; 1D 02 24 | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_04B
; Address: $DD8B4D
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_04B:
    JSR $1B76            ; 20 76 1B | Jump to subroutine
    BVS $30              ; 70 30 | Branch if overflow set
    REP #$05             ; C2 05 | Reset processor status bits
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ASL $0A              ; 06 0A | Arithmetic shift left (zero page)
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ROL $0B00,X          ; 3E 00 0B | Rotate left (absolute,X)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $30              ; F0 30 | Branch if equal
    TYA                  ; 98 | Transfer Y register to accumulator
    SEI                  ; 78 | Set interrupt disable flag
    DEC $0030,X          ; DE 30 00 | Decrement (absolute,X)
    BRA $30              ; 80 30 | Branch always
    BRA $F8              ; 80 F8 | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$FE             ; E0 FE | Compare X register (immediate)
    PEA #$AE08           ; F4 08 AE | Push effective address to stack
    BVC $74              ; 50 74 | Branch if overflow clear
    DEY                  ; 88 | Decrement Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    BVC $24              ; 50 24 | Branch if overflow clear
    ROR $E0CC            ; 6E CC E0 | Game work RAM access
    ASL $FC0C            ; 0E 0C FC | Arithmetic shift left (absolute)
    SED                  ; F8 | Set decimal mode flag
    PEA #$FAF3           ; F4 F3 FA | Push effective address to stack
    BMI $00              ; 30 00 | Branch if negative
    BCS $D0              ; B0 D0 | Branch if carry set
    BMI $A0              ; 30 A0 | Branch if negative

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_04C
; Address: $DD8BC5
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_04C:
    BVS $40              ; 70 40 | Branch if overflow set
    CPX #$40             ; E0 40 | Compare X register (immediate)
    BEQ $10              ; F0 10 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_04D
; Address: $DD8BCC
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_04D:
    BCC $60              ; 90 60 | Branch if carry clear
    LDY #$00             ; A0 00 | Load immediate value into Y register
    PLA                  ; 68 | Pull accumulator from stack
    INX                  ; E8 | Increment X register
    INY                  ; C8 | Increment Y register
    DEY                  ; 88 | Decrement Y register
    BPL $88              ; 10 88 | Branch if positive
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    PLY                  ; 7A | Pull Y register from stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    BPL $32              ; 10 32 | Branch if positive
    ORA $0A35            ; 0D 35 0A | Logical OR with accumulator (absolute)
    ORA $0402,X          ; 1D 02 04 | Logical OR with accumulator (absolute,X)
    BVS $30              ; 70 30 | Branch if overflow set
    BIT $6A00            ; 2C 00 6A | Test bits in accumulator (absolute)
    ORA $04C3            ; 0D C3 04 | Logical OR with accumulator (absolute)
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $30              ; F0 30 | Branch if equal
    TYA                  ; 98 | Transfer Y register to accumulator
    SEI                  ; 78 | Set interrupt disable flag
    DEC $0030,X          ; DE 30 00 | Decrement (absolute,X)
    BRA $30              ; 80 30 | Branch always
    BRA $F8              ; 80 F8 | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$FE             ; E0 FE | Compare X register (immediate)
    PEA #$AC08           ; F4 08 AC | Push effective address to stack
    BVC $74              ; 50 74 | Branch if overflow clear
    DEY                  ; 88 | Decrement Y register
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_04E
; Address: $DD8C6B
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_04E:
    BVC $24              ; 50 24 | Branch if overflow clear
    ROR $E0C4            ; 6E C4 E0 | Game work RAM access
    ASL $FE0C            ; 0E 0C FE | Arithmetic shift left (absolute)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PEA #$F8F3           ; F4 F3 F8 | Push effective address to stack
    BMI $00              ; 30 00 | Branch if negative
    LDY #$D0             ; A0 D0 | Load immediate value into Y register
    BMI $B0              ; 30 B0 | Branch if negative
    BVS $A0              ; 70 A0 | Branch if overflow set
    BVS $28              ; 70 28 | Branch if overflow set
    BCS $78              ; B0 78 | Branch if carry set
    BMI $B0              ; 30 B0 | Branch if negative
    BRA $00              ; 80 00 | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    INX                  ; E8 | Increment X register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ASL $0F00            ; 0E 00 0F | Arithmetic shift left (absolute)
    ORA $190E            ; 0D 0E 19 | Logical OR with accumulator (absolute)
    ASL $0F1F,X          ; 1E 1F 0F | Arithmetic shift left (absolute,X)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $1A              ; 05 1A | Logical OR with accumulator (zero page)
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    ROL                  ; 2A | Rotate left (accumulator)
    ASL $0405,X          ; 1E 05 04 | Arithmetic shift left (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ORA $09              ; 05 09 | Logical OR with accumulator (zero page)
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$60             ; E0 60 | Compare X register (immediate)
    BNE $B0              ; D0 B0 | Branch if not equal
    CLI                  ; 58 | Clear interrupt disable flag
    BMI $FF              ; 30 FF | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_050
; Address: $DD8D17
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_050:
    BRA $F0              ; 80 F0 | Branch always
    BVS $80              ; 70 80 | Branch if overflow set
    CPX #$00             ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_052
; Address: $DD8D22
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_052:
    JSR $08D0            ; 20 D0 08 | Jump to subroutine
    BNE $08              ; D0 08 | Branch if not equal
    BCS $96              ; B0 96 | Branch if carry set
    CPX #$A4             ; E0 A4 | Compare X register (immediate)
    BRA $40              ; 80 40 | Branch always
    CPY $80              ; C4 80 | Compare Y register (zero page)
    CPX $0000            ; EC 00 00 | Compare X register (absolute)
    DEY                  ; 88 | Decrement Y register
    BRA $20              ; 80 20 | Branch always
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    CLV                  ; B8 | Clear overflow flag
    BNE $D8              ; D0 D8 | Branch if not equal
    BVS $E8              ; 70 E8 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_053
; Address: $DD8D45
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_053:
    JSR $C0C8            ; 20 C8 C0 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_054
; Address: $DD8D4A
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_054:
    JSR $9040            ; 20 40 90 | Jump to subroutine
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    PEA #$F400           ; F4 00 F4 | Push effective address to stack
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_055
; Address: $DD8D5D
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_055:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ASL $0F00            ; 0E 00 0F | Arithmetic shift left (absolute)
    ORA $190E            ; 0D 0E 19 | Logical OR with accumulator (absolute)
    ASL $0F1F,X          ; 1E 1F 0F | Arithmetic shift left (absolute,X)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $1A              ; 05 1A | Logical OR with accumulator (zero page)
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    ROL                  ; 2A | Rotate left (accumulator)
    ASL $0405,X          ; 1E 05 04 | Arithmetic shift left (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ASL $040B            ; 0E 0B 04 | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$60             ; E0 60 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_056
; Address: $DD8DC8
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_056:
    BNE $B0              ; D0 B0 | Branch if not equal
    CLI                  ; 58 | Clear interrupt disable flag
    BMI $FF              ; 30 FF | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_058
; Address: $DD8DD7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_058:
    BRA $F0              ; 80 F0 | Branch always
    BVS $80              ; 70 80 | Branch if overflow set
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_059
; Address: $DD8DE2
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_059:
    JSR $08D0            ; 20 D0 08 | Jump to subroutine
    BNE $08              ; D0 08 | Branch if not equal
    BCS $90              ; B0 90 | Branch if carry set
    CPX #$A6             ; E0 A6 | Compare X register (immediate)
    BRA $44              ; 80 44 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPX $00              ; E4 00 | Compare X register (zero page)
    DEY                  ; 88 | Decrement Y register
    BRA $20              ; 80 20 | Branch always
    LSR $00              ; 46 00 | Logical shift right (zero page)
    ASL $40              ; 06 40 | Arithmetic shift left (zero page)
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    BNE $FC              ; D0 FC | Branch if not equal
    CLD                  ; D8 | Clear decimal mode flag
    BVS $E8              ; 70 E8 | Branch if overflow set
    LDY #$68             ; A0 68 | Load immediate value into Y register
    LDY #$48             ; A0 48 | Load immediate value into Y register
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    CPY #$B0             ; C0 B0 | Compare Y register (immediate)
    PEA #$6400           ; F4 00 64 | Push effective address to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_05B
; Address: $DD8E1F
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_05B:
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $1A0C            ; 0E 0C 1A | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL $1E01            ; 0E 01 1E | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PLX                  ; FA | Pull X register from stack
    ORA $0570            ; 0D 70 05 | Logical OR with accumulator (absolute)
    BMI $06              ; 30 06 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $09              ; 05 09 | Logical OR with accumulator (zero page)
    ORA $0C0C,Y          ; 19 0C 0C | Logical OR with accumulator (absolute,Y)
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_05C
; Address: $DD8E53
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_05C:
    CLC                  ; 18 | Clear carry flag
    DEC                  ; 3A | Decrement accumulator
    BMI $18              ; 30 18 | Branch if negative
    ORA ($0C),Y          ; 11 0C | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    INC                  ; 1A | Increment accumulator
    ROL $00              ; 26 00 | Rotate left (zero page)
    ORA ($12),Y          ; 11 12 | Logical OR with accumulator ((zero page),Y)
    ASL $19              ; 06 19 | Arithmetic shift left (zero page)
    ASL $0A              ; 06 0A | Arithmetic shift left (zero page)
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    PLP                  ; 28 | Pull processor status from stack
    ORA $0700,Y          ; 19 00 07 | Logical OR with accumulator (absolute,Y)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $C0              ; F0 C0 | Branch if equal
    BCS $70              ; B0 70 | Branch if carry set
    CLD                  ; D8 | Clear decimal mode flag
    SEC                  ; 38 | Set carry flag
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    BRA $C0              ; 80 C0 | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BNE $50              ; D0 50 | Branch if not equal
    TAY                  ; A8 | Transfer accumulator to Y register
    ASL $0CA0            ; 0E A0 0C | Arithmetic shift left (absolute)
    CPX #$18             ; E0 18 | Compare X register (immediate)
    CPY #$5C             ; C0 5C | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_05D
; Address: $DD8EAB
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_05D:
    JSR $80D8            ; 20 D8 80 | Jump to subroutine
    CPY $14              ; C4 14 | Compare Y register (zero page)
    BEQ $F0              ; F0 F0 | Branch if equal
    SEC                  ; 38 | Set carry flag
    JMP $08180C          ; 5C 0C 18 08 | Jump to address long
    BMI $13              ; 30 13 | Branch if negative
    CPX #$23             ; E0 23 | Compare X register (immediate)
    STZ $00              ; 64 00 | Store zero to zero page
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_05E
; Address: $DD8EBF
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_05E:
    JSR $3080            ; 20 80 30 | Jump to subroutine
    BRA $40              ; 80 40 | Branch always
    LDY #$70             ; A0 70 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    CPX #$40             ; E0 40 | Compare X register (immediate)
    BEQ $10              ; F0 10 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_060
; Address: $DD8ECE
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_060:
    LDY #$00             ; A0 00 | Load immediate value into Y register
    JMP $F000            ; 4C 00 F0 | Jump to address
    INY                  ; C8 | Increment Y register
    DEY                  ; 88 | Decrement Y register
    BPL $88              ; 10 88 | Branch if positive
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $1A0C            ; 0E 0C 1A | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL $1E01            ; 0E 01 1E | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PLX                  ; FA | Pull X register from stack
    ORA $0570            ; 0D 70 05 | Logical OR with accumulator (absolute)
    BMI $06              ; 30 06 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    BPL $0C              ; 10 0C | Branch if positive
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    DEC                  ; 3A | Decrement accumulator
    BMI $18              ; 30 18 | Branch if negative
    ORA ($0C),Y          ; 11 0C | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    INC                  ; 1A | Increment accumulator
    ROL $0300            ; 2E 00 03 | Rotate left (absolute)
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    DEC                  ; 3A | Decrement accumulator
    SBC $07              ; E5 07 | Subtract with carry (zero page)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    BMI $08              ; 30 08 | Branch if negative
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $C0              ; F0 C0 | Branch if equal
    BCS $70              ; B0 70 | Branch if carry set
    CLD                  ; D8 | Clear decimal mode flag
    SEC                  ; 38 | Set carry flag
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    BRA $C0              ; 80 C0 | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BNE $50              ; D0 50 | Branch if not equal

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_061
; Address: $DD8F63
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_061:
    TAY                  ; A8 | Transfer accumulator to Y register
    ASL $0CA0            ; 0E A0 0C | Arithmetic shift left (absolute)
    CPX #$18             ; E0 18 | Compare X register (immediate)
    CPY #$58             ; C0 58 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_062
; Address: $DD8F6B
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_062:
    JSR $80F0            ; 20 F0 80 | Jump to subroutine
    DEY                  ; 88 | Decrement Y register
    PLP                  ; 28 | Pull processor status from stack
    BEQ $F0              ; F0 F0 | Branch if equal
    SEC                  ; 38 | Set carry flag
    JMP $08180C          ; 5C 0C 18 08 | Jump to address long
    BMI $16              ; 30 16 | Branch if negative
    CPX #$26             ; E0 26 | Compare X register (immediate)
    JMP $1400            ; 4C 00 14 | Jump to address
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_063
; Address: $DD8F82
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_063:
    BRA $00              ; 80 00 | Branch always
    BCC $70              ; 90 70 | Branch if carry clear
    BRA $70              ; 80 70 | Branch always
    CLC                  ; 18 | Clear carry flag
    BCS $78              ; B0 78 | Branch if carry set
    BMI $B0              ; 30 B0 | Branch if negative
    BRA $00              ; 80 00 | Branch always
    STZ $F000            ; 9C 00 F0 | Store zero to absolute
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $0B              ; 06 0B | Arithmetic shift left (zero page)
    ORA $0C1A            ; 0D 1A 0C | Logical OR with accumulator (absolute)
    ASL $7F              ; 06 7F | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ASL $0701            ; 0E 01 07 | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $0B              ; 10 0B | Branch if positive
    BMI $0D              ; 30 0D | Branch if negative
    ADC #$07             ; 69 07 | Add with carry (immediate)
    AND $01              ; 25 01 | Logical AND with accumulator (zero page)
    ORA ($37,X)          ; 01 37 | Logical OR with accumulator ((zero page,X))
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_064
; Address: $DD8FD7
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_064:
    WDM #$00             ; 42 00 | Reserved instruction
    JMP $4910            ; 4C 10 49 | Jump to address
    ORA $1B0B,X          ; 1D 0B 1B | Logical OR with accumulator (absolute,X)
    ASL $0417            ; 0E 17 04 | Arithmetic shift left (absolute)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BVS $00              ; 70 00 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_065
; Address: $DD9002
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_065:
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $C0              ; F0 C0 | Branch if equal
    BCS $70              ; B0 70 | Branch if carry set
    TYA                  ; 98 | Transfer Y register to accumulator
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $C0              ; 80 C0 | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    BVC $A0              ; 50 A0 | Branch if overflow clear
    CLI                  ; 58 | Clear interrupt disable flag
    LDY #$28             ; A0 28 | Load immediate value into Y register
    BNE $54              ; D0 54 | Branch if not equal
    PLP                  ; 28 | Pull processor status from stack
    SED                  ; F8 | Set decimal mode flag
    CPX #$40             ; E0 40 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BEQ $FC              ; F0 FC | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    LDY #$20             ; A0 20 | Load immediate value into Y register
    BRA $00              ; 80 00 | Branch always
    LDY #$60             ; A0 60 | Load immediate value into Y register
    BNE $30              ; D0 30 | Branch if not equal
    BMI $F0              ; 30 F0 | Branch if negative

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_066
; Address: $DD9046
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_066:
    JSR $00E0            ; 20 E0 00 | Jump to subroutine
    LDY #$90             ; A0 90 | Load immediate value into Y register
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $40              ; 10 40 | Branch if positive
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $0B              ; 06 0B | Arithmetic shift left (zero page)
    ORA $0C1A            ; 0D 1A 0C | Logical OR with accumulator (absolute)
    ASL $7F              ; 06 7F | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ASL $0701            ; 0E 01 07 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_067
; Address: $DD907E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_067:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $0B              ; 10 0B | Branch if positive
    BPL $0D              ; 10 0D | Branch if positive
    AND #$07             ; 29 07 | Logical AND with accumulator (immediate)
    ADC $01              ; 65 01 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_068
; Address: $DD908C
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_068:
    JSL $270103          ; 22 03 01 27 | Jump to subroutine long
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    EOR $0B10            ; 4D 10 0B | Exclusive OR with accumulator (absolute)
    ASL $0517            ; 0E 17 05 | Arithmetic shift left (absolute)
    ORA $12              ; 05 12 | Logical OR with accumulator (zero page)
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ORA $4900            ; 0D 00 49 | Logical OR with accumulator (absolute)
    ROL $00              ; 26 00 | Rotate left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BVS $00              ; 70 00 | Branch if overflow set
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $C0              ; F0 C0 | Branch if equal
    BCS $70              ; B0 70 | Branch if carry set
    TYA                  ; 98 | Transfer Y register to accumulator
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $C0              ; 80 C0 | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    BVC $A0              ; 50 A0 | Branch if overflow clear
    CLI                  ; 58 | Clear interrupt disable flag
    LDY #$28             ; A0 28 | Load immediate value into Y register
    BNE $54              ; D0 54 | Branch if not equal
    PLP                  ; 28 | Pull processor status from stack
    SED                  ; F8 | Set decimal mode flag
    CPX #$40             ; E0 40 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BEQ $FC              ; F0 FC | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    LDY #$20             ; A0 20 | Load immediate value into Y register
    BRA $00              ; 80 00 | Branch always
    LDY #$60             ; A0 60 | Load immediate value into Y register
    BNE $30              ; D0 30 | Branch if not equal

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_06A
; Address: $DD9106
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_06A:
    JSR $10E0            ; 20 E0 10 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BMI $A0              ; 30 A0 | Branch if negative

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_06B
; Address: $DD910C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_06B:
    JSR $8000            ; 20 00 80 | Jump to subroutine
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_06C
; Address: $DD9116
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_06C:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    ORA #$3C             ; 09 3C | Logical OR with accumulator (immediate)
    BPL $DF              ; 10 DF | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    STZ $1402,X          ; 9E 02 14 | Store zero to absolute,X
    ROL                  ; 2A | Rotate left (accumulator)
    WDM #$3C             ; 42 3C | Reserved instruction
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    ROR $CF68            ; 6E 68 CF | Rotate right (absolute)
    STA $5F0F02          ; 8F 02 0F 5F | Update graphics data
    BPL $27              ; 10 27 | Branch if positive
    BPL $17              ; 10 17 | Branch if positive
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $3F08            ; 0E 08 3F | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_06D
; Address: $DD9152
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_06D:
    JSR $0002            ; 20 02 00 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    BRA $2F              ; 80 2F | Branch always
    BCS $63              ; B0 63 | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_06E
; Address: $DD9168
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_06E:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CPX #$00             ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_06F
; Address: $DD9187
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_06F:
    JSR $10FF            ; 20 FF 10 | Jump to subroutine
    BPL $DB              ; 10 DB | Branch if positive
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_070
; Address: $DD9196
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_070:
    JSR $18E0            ; 20 E0 18 | Jump to subroutine
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    BEQ $80              ; F0 80 | Branch if equal
    BEQ $F9              ; F0 F9 | Branch if equal
    SBC $F400,Y          ; F9 00 F4 | Subtract with carry (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    CPX $08              ; E4 08 | Compare X register (zero page)
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_072
; Address: $DD91AD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_072:
    BVS $10              ; 70 10 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    CPX #$04             ; E0 04 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    BPL $00              ; 10 00 | Branch if positive
    BPL $80              ; 10 80 | Branch if positive

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_074
; Address: $DD91BD
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_074:
    JSR $2026            ; 20 26 20 | Jump to subroutine
    ASL $E0              ; 06 E0 | Game work RAM access
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $40              ; F0 40 | Branch if equal
    BEQ $10              ; F0 10 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_075
; Address: $DD91CC
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_075:
    BCC $60              ; 90 60 | Branch if carry clear
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BEQ $F0              ; F0 F0 | Branch if equal
    BVC $40              ; 50 40 | Branch if overflow clear
    SED                  ; F8 | Set decimal mode flag
    BEQ $C8              ; F0 C8 | Branch if equal
    CPY #$88             ; C0 88 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    ORA #$3C             ; 09 3C | Logical OR with accumulator (immediate)
    BPL $DF              ; 10 DF | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    STZ $1402,X          ; 9E 02 14 | Store zero to absolute,X
    ROL                  ; 2A | Rotate left (accumulator)
    WDM #$3C             ; 42 3C | Reserved instruction
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    ROR $CF68            ; 6E 68 CF | Rotate right (absolute)
    STA $9F0F02          ; 8F 02 0F 9F | Update graphics data
    STA                  ; 9F 00 2F 10 | Update graphics data
    BPL $17              ; 10 17 | Branch if positive
    ASL $1F08            ; 0E 08 1F | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_076
; Address: $DD9212
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_076:
    JSR $0002            ; 20 02 00 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    STZ $04              ; 64 04 | Store zero to zero page
    BEQ $6F              ; F0 6F | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_077
; Address: $DD922A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_077:
    PHP                  ; 08 | Push processor status to stack
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    ASL $05              ; 06 05 | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPX #$00             ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_078
; Address: $DD9247
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_078:
    JSR $10FF            ; 20 FF 10 | Jump to subroutine
    BPL $DB              ; 10 DB | Branch if positive
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_079
; Address: $DD9256
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_079:
    JSR $18E0            ; 20 E0 18 | Jump to subroutine
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    BEQ $80              ; F0 80 | Branch if equal
    BEQ $FA              ; F0 FA | Branch if equal
    PLX                  ; FA | Pull X register from stack
    PEA #$E408           ; F4 08 E4 | Push effective address to stack
    PHP                  ; 08 | Push processor status to stack
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_07A
; Address: $DD9269
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_07A:
    JSR $E040            ; 20 40 E0 | Game work RAM access
    BVS $10              ; 70 10 | Branch if overflow set
    CPX #$04             ; E0 04 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    BPL $00              ; 10 00 | Branch if positive
    BPL $80              ; 10 80 | Branch if positive
    BMI $20              ; 30 20 | Branch if negative
    LDY $2220            ; AC 20 22 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_07B
; Address: $DD927F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_07B:
    JSR $F401            ; 20 01 F4 | Jump to subroutine
    ORA $06C6            ; 0D C6 06 | Logical OR with accumulator (absolute)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$50             ; E0 50 | Compare X register (immediate)
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_07E
; Address: $DD9293
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_07E:
    RTI                  ; 40 | Return from interrupt
    BEQ $E0              ; F0 E0 | Game work RAM access
    BNE $C0              ; D0 C0 | Branch if not equal
    BRA $80              ; 80 80 | Branch always
    ASL $3F30,X          ; 1E 30 3F | Arithmetic shift left (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    AND $5F04,X          ; 3D 04 5F | Logical AND with accumulator (absolute,X)
    BPL $14              ; 10 14 | Branch if positive
    ROL                  ; 2A | Rotate left (accumulator)
    RTI                  ; 40 | Return from interrupt
    BMI $48              ; 30 48 | Branch if negative
    BIT $1F64            ; 2C 64 1F | Test bits in accumulator (absolute)
    BPL $45              ; 10 45 | Branch if positive
    BPL $40              ; 10 40 | Branch if positive
    ORA ($5F,X)          ; 01 5F | Logical OR with accumulator ((zero page,X))
    EOR $0E02,X          ; 5D 02 0E | Exclusive OR with accumulator (absolute,X)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BPL $04              ; 10 04 | Branch if positive
    ORA $030C            ; 0D 0C 03 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_07F
; Address: $DD92E8
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_07F:
    PHP                  ; 08 | Push processor status to stack
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BMI $B8              ; 30 B8 | Branch if negative
    LDY #$FC             ; A0 FC | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_080
; Address: $DD930D
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_080:
    JSR $A8FC            ; 20 FC A8 | Jump to subroutine
    BMI $B0              ; 30 B0 | Branch if negative
    LDY #$F0             ; A0 F0 | Load immediate value into Y register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    BCS $D0              ; B0 D0 | Branch if carry set
    PHP                  ; 08 | Push processor status to stack
    BNE $08              ; D0 08 | Branch if not equal
    BCS $10              ; B0 10 | Branch if carry set
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPX #$08             ; E0 08 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_081
; Address: $DD9334
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_081:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_083
; Address: $DD9340
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_083:
    JSL $D42AD4          ; 22 D4 2A D4 | Jump to subroutine long
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$80             ; E0 80 | Compare X register (immediate)
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    CPY #$B0             ; C0 B0 | Compare Y register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    BVS $F0              ; 70 F0 | Branch if overflow set
    BEQ $30              ; F0 30 | Branch if equal
    CPX #$E0             ; E0 E0 | Game work RAM access
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_085
; Address: $DD935A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_085:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    ASL $3F30,X          ; 1E 30 3F | Arithmetic shift left (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    AND $5F04,X          ; 3D 04 5F | Logical AND with accumulator (absolute,X)
    BPL $14              ; 10 14 | Branch if positive
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_086
; Address: $DD9374
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_086:
    RTI                  ; 40 | Return from interrupt
    BMI $48              ; 30 48 | Branch if negative
    BIT $1F64            ; 2C 64 1F | Test bits in accumulator (absolute)
    BPL $45              ; 10 45 | Branch if positive
    BPL $40              ; 10 40 | Branch if positive
    ORA ($9F,X)          ; 01 9F | Logical OR with accumulator ((zero page,X))
    STA $0E02,X          ; 9D 02 0E | Update graphics data
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ASL $0C04            ; 0E 04 0C | Arithmetic shift left (absolute)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BMI $B8              ; 30 B8 | Branch if negative
    LDY #$FC             ; A0 FC | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_087
; Address: $DD93CD
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_087:
    JSR $A8FC            ; 20 FC A8 | Jump to subroutine
    BMI $B0              ; 30 B0 | Branch if negative
    LDY #$F0             ; A0 F0 | Load immediate value into Y register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    BCS $D0              ; B0 D0 | Branch if carry set
    PHP                  ; 08 | Push processor status to stack
    BNE $08              ; D0 08 | Branch if not equal
    BCS $10              ; B0 10 | Branch if carry set
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_088
; Address: $DD93F4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_088:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    BMI $20              ; 30 20 | Branch if negative
    SEC                  ; 38 | Set carry flag
    BMI $50              ; 30 50 | Branch if negative

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_08A
; Address: $DD9404
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_08A:
    JSR $C0C0            ; 20 C0 C0 | Jump to subroutine
    BMI $D0              ; 30 D0 | Branch if negative
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    BRA $F0              ; 80 F0 | Branch always
    LDY #$60             ; A0 60 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_08B
; Address: $DD9410
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_08B:
    CLV                  ; B8 | Clear overflow flag
    BMI $10              ; 30 10 | Branch if negative
    BVC $10              ; 50 10 | Branch if overflow clear
    BMI $30              ; 30 30 | Branch if negative

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_08D
; Address: $DD941C
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_08D:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    SBC $DF41,X          ; FD 41 DF | Subtract with carry (absolute,X)
    ORA $9F              ; 05 9F | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $12              ; 06 12 | Arithmetic shift left (zero page)
    ADC ($CF,X)          ; 61 CF | Add with carry ((zero page,X))
    ORA ($83,X)          ; 01 83 | Logical OR with accumulator ((zero page,X))
    ORA ($5D,X)          ; 01 5D | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    DEC                  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_08E
; Address: $DD9446
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_08E:
    JSR $1815            ; 20 15 18 | Jump to subroutine
    ASL $070A            ; 0E 0A 07 | Arithmetic shift left (absolute)
    ASL $1B04            ; 0E 04 1B | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_08F
; Address: $DD9452
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_08F:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ROR $F60E            ; 6E 0E F6 | Rotate right (absolute)
    ADC #$60             ; 69 60 | Add with carry (immediate)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $130E,X          ; 1E 0E 13 | Arithmetic shift left (absolute,X)
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    BCC $7C              ; 90 7C | Branch if carry clear
    REP #$38             ; C2 38 | Reset processor status bits
    LDY #$7F             ; A0 7F | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_090
; Address: $DD948D
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_090:
    JSR $10FB            ; 20 FB 10 | Jump to subroutine
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    SEP #$44             ; E2 44 | Set processor status bits
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDA $A950,Y          ; B9 50 A9 | Read graphics status
    BVC $5C              ; 50 5C | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_091
; Address: $DD94A5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_091:
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    CLC                  ; 18 | Clear carry flag
    BEQ $50              ; F0 50 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_092
; Address: $DD94AE
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_092:
    JSR $00DC            ; 20 DC 00 | Jump to subroutine
    BVC $00              ; 50 00 | Branch if overflow clear
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_093
; Address: $DD94BB
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_093:
    JSR $20A4            ; 20 A4 20 | Jump to subroutine
    BVS $61              ; 70 61 | Branch if overflow set
    ORA $06C6            ; 0D C6 06 | Logical OR with accumulator (absolute)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$50             ; E0 50 | Compare X register (immediate)
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_096
; Address: $DD94D3
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_096:
    RTI                  ; 40 | Return from interrupt
    BVS $60              ; 70 60 | Branch if overflow set
    BNE $C0              ; D0 C0 | Branch if not equal
    BRA $80              ; 80 80 | Branch always
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    SBC $DF41,X          ; FD 41 DF | Subtract with carry (absolute,X)
    ORA $9F              ; 05 9F | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $12              ; 06 12 | Arithmetic shift left (zero page)
    ADC ($CF,X)          ; 61 CF | Add with carry ((zero page,X))
    ORA ($83,X)          ; 01 83 | Logical OR with accumulator ((zero page,X))
    ORA ($9D,X)          ; 01 9D | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    DEC                  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_097
; Address: $DD9506
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_097:
    JSR $1815            ; 20 15 18 | Jump to subroutine
    ASL $070A            ; 0E 0A 07 | Arithmetic shift left (absolute)
    ASL $3B04,X          ; 1E 04 3B | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_098
; Address: $DD9512
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_098:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($14,X)          ; 01 14 | Logical OR with accumulator ((zero page,X))
    AND $04              ; 25 04 | Logical AND with accumulator (zero page)
    LSR $860E            ; 4E 0E 86 | Logical shift right (absolute)
    AND #$B0             ; 29 B0 | Logical AND with accumulator (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_099
; Address: $DD9528
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_099:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ASL $0B06            ; 0E 06 0B | Arithmetic shift left (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_09A
; Address: $DD9544
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_09A:
    BCC $7C              ; 90 7C | Branch if carry clear
    REP #$38             ; C2 38 | Reset processor status bits
    LDY #$7F             ; A0 7F | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_09B
; Address: $DD954D
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_09B:
    JSR $10FB            ; 20 FB 10 | Jump to subroutine
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    SEP #$44             ; E2 44 | Set processor status bits
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    TSX                  ; BA | Transfer stack pointer to X register
    BVC $AA              ; 50 AA | Branch if overflow clear
    BVC $5C              ; 50 5C | Branch if overflow clear
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    CLC                  ; 18 | Clear carry flag
    BEQ $50              ; F0 50 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BVS $20              ; 70 20 | Branch if overflow set
    CLD                  ; D8 | Clear decimal mode flag
    BVC $00              ; 50 00 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_09D
; Address: $DD957D
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_09D:
    JSR $7076            ; 20 76 70 | Jump to subroutine
    ASL $E0              ; 06 E0 | Game work RAM access
    BEQ $10              ; F0 10 | Branch if equal
    BEQ $40              ; F0 40 | Branch if equal
    BEQ $10              ; F0 10 | Branch if equal
    RTI                  ; 40 | Return from interrupt
    BCC $60              ; 90 60 | Branch if carry clear
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BEQ $F0              ; F0 F0 | Branch if equal
    BVC $40              ; 50 40 | Branch if overflow clear
    SEI                  ; 78 | Set interrupt disable flag
    BVS $C8              ; 70 C8 | Branch if overflow set
    CPY #$88             ; C0 88 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_09E
; Address: $DD959B
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_09E:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    ORA $3F05,X          ; 1D 05 3F | Logical OR with accumulator (absolute,X)
    ORA $0F05            ; 0D 05 0F | Logical OR with accumulator (absolute)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $100B            ; 0D 0B 10 | Logical OR with accumulator (absolute)
    BPL $0D              ; 10 0D | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BPL $1F              ; 10 1F | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BIT $440C            ; 2C 0C 44 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_09F
; Address: $DD95E4
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_09F:
    JSR $0003            ; 20 03 00 | Jump to subroutine
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ORA $1E00            ; 0D 00 1E | Logical OR with accumulator (absolute)
    ASL $0F0F            ; 0E 0F 0F | Arithmetic shift left (absolute)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    PLP                  ; 28 | Pull processor status from stack
    BPL $7C              ; 10 7C | Branch if positive
    BRA $38              ; 80 38 | Branch always
    LDY $FA20            ; AC 20 FA | Load from absolute address into Y register
    CPY #$FC             ; C0 FC | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    INX                  ; E8 | Increment X register
    INY                  ; C8 | Increment Y register
    PEA #$A208           ; F4 08 A2 | Push effective address to stack
    PHP                  ; 08 | Push processor status to stack
    PLX                  ; FA | Pull X register from stack
    BRA $FA              ; 80 FA | Branch always
    RTI                  ; 40 | Return from interrupt
    TSX                  ; BA | Transfer stack pointer to X register
    RTI                  ; 40 | Return from interrupt
    BVS $80              ; 70 80 | Branch if overflow set
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $80              ; 80 80 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0A0
; Address: $DD963D
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0A0:
    RTI                  ; 40 | Return from interrupt
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0A1
; Address: $DD9641
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0A1:
    JSR $B068            ; 20 68 B0 | Jump to subroutine
    BMI $C0              ; 30 C0 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    LDY #$20             ; A0 20 | Load immediate value into Y register
    BRA $00              ; 80 00 | Branch always
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    LDY #$80             ; A0 80 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0A2
; Address: $DD9658
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0A2:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    BRA $40              ; 80 40 | Branch always
    ORA $3F05,X          ; 1D 05 3F | Logical OR with accumulator (absolute,X)
    ORA $0F05            ; 0D 05 0F | Logical OR with accumulator (absolute)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0A3
; Address: $DD9682
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0A3:
    ORA $100B            ; 0D 0B 10 | Logical OR with accumulator (absolute)
    BPL $0D              ; 10 0D | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ORA $080C,X          ; 1D 0C 08 | Logical OR with accumulator (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    BPL $7C              ; 10 7C | Branch if positive
    BRA $38              ; 80 38 | Branch always
    LDY $FA20            ; AC 20 FA | Load from absolute address into Y register
    CPY #$FC             ; C0 FC | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    INX                  ; E8 | Increment X register
    INY                  ; C8 | Increment Y register
    PEA #$A208           ; F4 08 A2 | Push effective address to stack
    PHP                  ; 08 | Push processor status to stack
    PLX                  ; FA | Pull X register from stack
    BRA $F9              ; 80 F9 | Branch always
    RTI                  ; 40 | Return from interrupt
    LDA $7040,Y          ; B9 40 70 | Read graphics status
    BRA $E0              ; 80 E0 | Game work RAM access
    BRA $80              ; 80 80 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0A5
; Address: $DD9700
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0A5:
    JSR $00E0            ; 20 E0 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    BRA $A0              ; 80 A0 | Branch always
    CPX #$60             ; E0 60 | Compare X register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $C0              ; 80 C0 | Branch always
    BPL $00              ; 10 00 | Branch if positive
    LDY #$00             ; A0 00 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0A6
; Address: $DD9715
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0A6:
    RTI                  ; 40 | Return from interrupt
    BVS $20              ; 70 20 | Branch if overflow set
    BMI $20              ; 30 20 | Branch if negative

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0A7
; Address: $DD9721
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0A7:
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    ORA $18              ; 05 18 | Logical OR with accumulator (zero page)
    ORA #$10             ; 09 10 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $16              ; 10 16 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ASL $0E              ; 06 0E | Arithmetic shift left (zero page)
    ORA $191F,X          ; 1D 1F 19 | Logical OR with accumulator (absolute,X)
    INC                  ; 1A | Increment accumulator
    ROL $3F17,X          ; 3E 17 3F | Rotate left (absolute,X)
    ORA #$12             ; 09 12 | Logical OR with accumulator (immediate)
    BPL $19              ; 10 19 | Branch if positive
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    EOR #$1D             ; 49 1D | Exclusive OR with accumulator (immediate)
    SEP #$6F             ; E2 6F | Set processor status bits
    ORA $3D0D,X          ; 1D 0D 3D | Logical OR with accumulator (absolute,X)
    ORA $052D            ; 0D 2D 05 | Logical OR with accumulator (absolute)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ROL $00              ; 26 00 | Rotate left (zero page)
    EOR #$0E             ; 49 0E | Exclusive OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $40              ; 80 40 | Branch always
    LDY #$60             ; A0 60 | Load immediate value into Y register
    BCC $A0              ; 90 A0 | Branch if carry clear
    CLC                  ; 18 | Clear carry flag
    BCC $08              ; 90 08 | Branch if carry clear
    BCC $48              ; 90 48 | Branch if carry clear
    DEY                  ; 88 | Decrement Y register
    RTI                  ; 40 | Return from interrupt
    PHA                  ; 48 | Push accumulator to stack
    BPL $60              ; 10 60 | Branch if positive
    BRA $F0              ; 80 F0 | Branch always
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BEQ $B8              ; F0 B8 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    TYA                  ; 98 | Transfer Y register to accumulator
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INX                  ; E8 | Increment X register
    CLD                  ; D8 | Clear decimal mode flag
    BCC $48              ; 90 48 | Branch if carry clear
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0A8
; Address: $DD97A4
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0A8:
    BEQ $00              ; F0 00 | Branch if equal
    CPY $28              ; C4 28 | Compare Y register (zero page)
    INY                  ; C8 | Increment Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    BCS $44              ; B0 44 | Branch if carry set
    SED                  ; F8 | Set decimal mode flag
    PHY                  ; 5A | Push Y register to stack
    CLD                  ; D8 | Clear decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    BCS $B8              ; B0 B8 | Branch if carry set
    BCS $70              ; B0 70 | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0AA
; Address: $DD97BC
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0AA:
    JSR $3000            ; 20 00 30 | Jump to subroutine
    LDX $D060            ; AE 60 D0 | Load from absolute address into X register
    DEC                  ; 3A | Decrement accumulator
    DEC                  ; 3A | Decrement accumulator
    CPX $6A              ; E4 6A | Compare X register (zero page)
    BNE $EA              ; D0 EA | Branch if not equal
    BEQ $EA              ; F0 EA | Branch if equal
    CPX $8A              ; E4 8A | Compare X register (zero page)
    BRA $04              ; 80 04 | Branch always
    PEA #$FA04           ; F4 04 FA | Push effective address to stack
    ASL $0EFE            ; 0E FE 0E | Arithmetic shift left (absolute)
    DEC $8A0E,X          ; DE 0E 8A | Decrement (absolute,X)
    ASL $6E8A            ; 0E 8A 6E | Arithmetic shift left (absolute)
    STX $040E            ; 8E 0E 04 | Store X register to absolute address
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    ORA $18              ; 05 18 | Logical OR with accumulator (zero page)
    ORA #$10             ; 09 10 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $16              ; 10 16 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ASL $0E              ; 06 0E | Arithmetic shift left (zero page)
    ORA $191F,X          ; 1D 1F 19 | Logical OR with accumulator (absolute,X)
    INC                  ; 1A | Increment accumulator
    ROL $3F17,X          ; 3E 17 3F | Rotate left (absolute,X)
    ORA #$12             ; 09 12 | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    ORA #$0D             ; 09 0D | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0AB
; Address: $DD980C
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0AB:
    JSL $3F5A1F          ; 22 1F 5A 3F | Jump to subroutine long
    ORA $3D0D,X          ; 1D 0D 3D | Logical OR with accumulator (absolute,X)
    ORA $062E            ; 0D 2E 06 | Logical OR with accumulator (absolute)
    ASL $0B              ; 06 0B | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0AC
; Address: $DD983C
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0AC:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $40              ; 80 40 | Branch always
    LDY #$60             ; A0 60 | Load immediate value into Y register
    BCC $A0              ; 90 A0 | Branch if carry clear
    CLC                  ; 18 | Clear carry flag
    BCC $08              ; 90 08 | Branch if carry clear
    BCC $48              ; 90 48 | Branch if carry clear
    DEY                  ; 88 | Decrement Y register
    RTI                  ; 40 | Return from interrupt
    PHA                  ; 48 | Push accumulator to stack
    BPL $60              ; 10 60 | Branch if positive
    BRA $F0              ; 80 F0 | Branch always
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BEQ $B8              ; F0 B8 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    TYA                  ; 98 | Transfer Y register to accumulator
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INX                  ; E8 | Increment X register
    CLD                  ; D8 | Clear decimal mode flag
    BCC $48              ; 90 48 | Branch if carry clear
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    CPX $08              ; E4 08 | Compare X register (zero page)
    STY $9E48            ; 8C 48 9E | Store Y register to absolute address
    EOR $FCFA            ; 4D FA FC | Exclusive OR with accumulator (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    BCS $B8              ; B0 B8 | Branch if carry set
    BCS $B0              ; B0 B0 | Branch if carry set
    LDY #$70             ; A0 70 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0AD
; Address: $DD987C
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0AD:
    JSR $3800            ; 20 00 38 | Jump to subroutine
    BCC $75              ; 90 75 | Branch if carry clear
    NOP                  ; EA | No operation
    ORA $3DCA,X          ; 1D CA 3D | Logical OR with accumulator (absolute,X)
    BEQ $75              ; F0 75 | Branch if equal
    CPY #$F5             ; C0 F5 | Compare Y register (immediate)
    ADC $10              ; 65 10 | Add with carry (zero page)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CMP $8D07            ; CD 07 8D | Compare accumulator (absolute)
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0AE
; Address: $DD98A3
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0AE:
    JSL $224F30          ; 22 30 4F 22 | Jump to subroutine long
    LSR $DC24,X          ; 5E 24 DC | Logical shift right (absolute,X)
    ROR $5C91            ; 6E 91 5C | Rotate right (absolute)
    LDX #$59             ; A2 59 | Load immediate value into X register
    LDY #$1C             ; A0 1C | Load immediate value into Y register
    ROL $793E,X          ; 3E 3E 79 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0AF
; Address: $DD98B6
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0AF:
    BVS $7F              ; 70 7F | Branch if overflow set
    BEQ $FF              ; F0 FF | Branch if equal
    INC $EDEB            ; EE EB ED | Increment (absolute)
    EOR ($A4),Y          ; 51 A4 | Exclusive OR with accumulator ((zero page),Y)
    PHY                  ; 5A | Push Y register to stack
    BRA $10              ; 80 10 | Branch always
    CMP $C508            ; CD 08 C5 | Compare accumulator (absolute)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    SBC $CAEF            ; ED EF CA | Subtract with carry (absolute)
    INC $C6CC            ; EE CC C6 | Increment (absolute)
    CPY $03              ; C4 03 | Compare Y register (zero page)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BMI $00              ; 30 00 | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    PLA                  ; 68 | Pull accumulator from stack
    BCC $24              ; 90 24 | Branch if carry clear
    TAY                  ; A8 | Transfer accumulator to Y register
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BVS $F0              ; 70 F0 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPX $B47C            ; EC 7C B4 | Compare X register (absolute)
    TXS                  ; 9A | Transfer X register to stack pointer
    DEC $784E,X          ; DE 4E 78 | Decrement (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    INC $EC10,X          ; FE 10 EC | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    CLC                  ; 18 | Clear carry flag
    BVS $20              ; 70 20 | Branch if overflow set
    LDY #$80             ; A0 80 | Load immediate value into Y register
    SED                  ; F8 | Set decimal mode flag
    LDX $A6              ; A6 A6 | Load from zero page into X register
    STY $84              ; 84 84 | Store Y register to zero page
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0B0
; Address: $DD9939
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0B0:
    JSR $0080            ; 20 80 00 | Jump to subroutine
    BVC $00              ; 50 00 | Branch if overflow clear
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    BMI $84              ; 30 84 | Branch if negative
    PLX                  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0B1
; Address: $DD9946
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0B1:
    CPY $4032            ; CC 32 40 | Compare Y register (absolute)
    STY $00              ; 84 00 | Store Y register to zero page
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BCS $60              ; B0 60 | Branch if carry set
    RTI                  ; 40 | Return from interrupt
    STZ $8E9E,X          ; 9E 9E 8E | Store zero to absolute,X
    INC $C4FE,X          ; FE FE C4 | Increment (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    BMI $10              ; 30 10 | Branch if negative
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0B2
; Address: $DD9963
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0B2:
    JSL $224F30          ; 22 30 4F 22 | Jump to subroutine long
    DEC $DC24,X          ; DE 24 DC | Decrement (absolute,X)
    ROR $5C91            ; 6E 91 5C | Rotate right (absolute)
    LDX #$59             ; A2 59 | Load immediate value into X register
    LDY #$1C             ; A0 1C | Load immediate value into Y register
    ROL $793E,X          ; 3E 3E 79 | Rotate left (absolute,X)
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    INC $EDEB            ; EE EB ED | Increment (absolute)
    AND ($44),Y          ; 31 44 | Logical AND with accumulator ((zero page),Y)
    DEC                  ; 3A | Decrement accumulator
    RTI                  ; 40 | Return from interrupt
    BPL $6D              ; 10 6D | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    AND $04              ; 25 04 | Logical AND with accumulator (zero page)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    AND ($67,X)          ; 21 67 | Logical AND with accumulator ((zero page,X))
    ADC $6A6F            ; 6D 6F 6A | Add with carry (absolute)
    ROR $366C            ; 6E 6C 36 | Rotate right (absolute)
    BIT $03              ; 24 03 | Test bits in accumulator (zero page)
    ASL $3E3C,X          ; 1E 3C 3E | Arithmetic shift left (absolute,X)
    ORA ($4B,X)          ; 01 4B | Logical OR with accumulator ((zero page,X))
    ORA ($56,X)          ; 01 56 | Logical OR with accumulator ((zero page,X))
    JMP $2110            ; 4C 10 21 | PPU graphics register access
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    PHA                  ; 48 | Push accumulator to stack
    EOR $7F71,Y          ; 59 71 7F | Exclusive OR with accumulator (absolute,Y)
    AND ($3F),Y          ; 31 3F | Logical AND with accumulator ((zero page),Y)
    ASL $011E,X          ; 1E 1E 01 | Arithmetic shift left (absolute,X)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BMI $00              ; 30 00 | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    PLA                  ; 68 | Pull accumulator from stack
    BCC $24              ; 90 24 | Branch if carry clear
    TAY                  ; A8 | Transfer accumulator to Y register
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BVS $F0              ; 70 F0 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0B3
; Address: $DD99D8
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0B3:
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPX $B47C            ; EC 7C B4 | Compare X register (absolute)
    TXS                  ; 9A | Transfer X register to stack pointer
    DEC $784E,X          ; DE 4E 78 | Decrement (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    INC $EC10,X          ; FE 10 EC | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    CLC                  ; 18 | Clear carry flag
    BVS $20              ; 70 20 | Branch if overflow set
    LDY #$80             ; A0 80 | Load immediate value into Y register
    BEQ $14              ; F0 14 | Branch if equal
    LDX $A6              ; A6 A6 | Load from zero page into X register
    STY $84              ; 84 84 | Store Y register to zero page
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0B4
; Address: $DD99F9
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0B4:
    JSR $0080            ; 20 80 00 | Jump to subroutine
    CLI                  ; 58 | Clear interrupt disable flag
    JMP $1E00            ; 4C 00 1E | Jump to address
    CPX $9C6E            ; EC 6E 9C | Compare X register (absolute)
    BNE $70              ; D0 70 | Branch if not equal
    BEQ $30              ; F0 30 | Branch if equal
    BEQ $30              ; F0 30 | Branch if equal
    CPX #$30             ; E0 30 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0B5
; Address: $DD9A0E
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0B5:
    CLD                  ; D8 | Clear decimal mode flag
    BVC $F8              ; 50 F8 | Branch if overflow clear
    BRA $F8              ; 80 F8 | Branch always
    BRA $F8              ; 80 F8 | Branch always
    BRA $30              ; 80 30 | Branch always
    BPL $00              ; 10 00 | Branch if positive
    BRA $00              ; 80 00 | Branch always
    BVS $03              ; 70 03 | Branch if overflow set
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    BPL $14              ; 10 14 | Branch if positive

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0B6
; Address: $DD9A2D
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0B6:
    JSR $2412            ; 20 12 24 | Jump to subroutine
    ASL $0E              ; 06 0E | Arithmetic shift left (zero page)
    ORA $1E              ; 05 1E | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND $1F04            ; 2D 04 1F | Logical AND with accumulator (absolute)
    ORA $1F22,X          ; 1D 22 1F | Logical OR with accumulator (absolute,X)
    BPL $06              ; 10 06 | Branch if positive
    JMP ($E33B)          ; 6C 3B E3 | Jump to address (absolute indirect)
    PEA #$3F1B           ; F4 1B 3F | Push effective address to stack
    AND $0819,Y          ; 39 19 08 | Logical AND with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0B7
; Address: $DD9A58
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0B7:
    PLP                  ; 28 | Pull processor status from stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($5E,X)          ; 01 5E | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    TAY                  ; A8 | Transfer accumulator to Y register
    EOR ($BC),Y          ; 51 BC | Exclusive OR with accumulator ((zero page),Y)
    EOR ($BE),Y          ; 51 BE | Exclusive OR with accumulator ((zero page),Y)
    LDX $AF03            ; AE 03 AF | Load from absolute address into X register
    PHA                  ; 48 | Push accumulator to stack
    LDX $09              ; A6 09 | Load from zero page into X register
    LSR $07              ; 46 07 | Logical shift right (zero page)
    LDA $E2FDE0          ; AF E0 FD E2 | Read graphics status
    CPX #$B3             ; E0 B3 | Compare X register (immediate)
    CPX #$B1             ; E0 B1 | Compare X register (immediate)
    CPX #$E1             ; E0 E1 | Compare X register (immediate)
    CPX #$40             ; E0 40 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPY #$40             ; C0 40 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0B8
; Address: $DD9A83
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0B8:
    JSR $8020            ; 20 20 80 | Jump to subroutine
    BRA $50              ; 80 50 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0B9
; Address: $DD9A89
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0B9:
    BCC $10              ; 90 10 | Branch if carry clear
    PHA                  ; 48 | Push accumulator to stack
    CPY #$2C             ; C0 2C | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDY $C0E0            ; AC E0 C0 | Load from absolute address into Y register
    BEQ $60              ; F0 60 | Branch if equal
    BVS $A0              ; 70 A0 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    BVC $F8              ; 50 F8 | Branch if overflow clear
    BEQ $58              ; F0 58 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPX $ECFC            ; EC FC EC | Compare X register (absolute)
    BCC $E4              ; 90 E4 | Branch if carry clear
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    JMP $44B8            ; 4C B8 44 | Jump to address
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    CPX #$30             ; E0 30 | Compare X register (immediate)
    BNE $C4              ; D0 C4 | Branch if not equal
    SED                  ; F8 | Set decimal mode flag
    DEC                  ; 3A | Decrement accumulator
    SEC                  ; 38 | Set carry flag
    BPL $10              ; 10 10 | Branch if positive
    BVC $10              ; 50 10 | Branch if overflow clear
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0BB
; Address: $DD9AC0
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0BB:
    PLX                  ; FA | Pull X register from stack
    BIT $E834            ; 2C 34 E8 | Test bits in accumulator (absolute)
    TYA                  ; 98 | Transfer Y register to accumulator
    BVS $60              ; 70 60 | Branch if overflow set
    CPX #$D0             ; E0 D0 | Compare X register (immediate)
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    BRA $80              ; 80 80 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BNE $00              ; D0 00 | Branch if not equal
    BRA $00              ; 80 00 | Branch always
    BRA $60              ; 80 60 | Branch always
    BRA $00              ; 80 00 | Branch always
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    BPL $14              ; 10 14 | Branch if positive

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0BC
; Address: $DD9AED
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0BC:
    JSR $2412            ; 20 12 24 | Jump to subroutine
    ASL $0E              ; 06 0E | Arithmetic shift left (zero page)
    ORA $1E              ; 05 1E | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND $1F04            ; 2D 04 1F | Logical AND with accumulator (absolute)
    ORA $1F22,X          ; 1D 22 1F | Logical OR with accumulator (absolute,X)
    BPL $06              ; 10 06 | Branch if positive
    JMP $3F3F3B          ; 5C 3B 3F 3F | Jump to address long
    AND $0819,Y          ; 39 19 08 | Logical AND with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ASL $3700            ; 0E 00 37 | Arithmetic shift left (absolute)
    LSR $5E29,X          ; 5E 29 5E | Logical shift right (absolute,X)
    ROL $57              ; 26 57 | Rotate left (zero page)
    EOR ($01),Y          ; 51 01 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0BD
; Address: $DD9B2F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0BD:
    JSR $2067            ; 20 67 20 | Jump to subroutine
    LSR $7F71,X          ; 5E 71 7F | Logical shift right (absolute,X)
    BVS $7B              ; 70 7B | Branch if overflow set
    BVS $51              ; 70 51 | Branch if overflow set
    BVS $51              ; 70 51 | Branch if overflow set
    ADC ($70),Y          ; 71 70 | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0BF
; Address: $DD9B43
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0BF:
    JSR $8020            ; 20 20 80 | Jump to subroutine
    BRA $50              ; 80 50 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0C1
; Address: $DD9B4B
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0C1:
    PHA                  ; 48 | Push accumulator to stack
    CPY #$2C             ; C0 2C | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDY $C0E0            ; AC E0 C0 | Load from absolute address into Y register
    BEQ $60              ; F0 60 | Branch if equal
    BVS $A0              ; 70 A0 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    BVC $F8              ; 50 F8 | Branch if overflow clear
    BEQ $58              ; F0 58 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPX $ECFC            ; EC FC EC | Compare X register (absolute)
    BCC $E4              ; 90 E4 | Branch if carry clear
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    JMP $44B8            ; 4C B8 44 | Jump to address
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    CPX #$32             ; E0 32 | Compare X register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    AND $74DA            ; 2D DA 74 | Logical AND with accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    BPL $10              ; 10 10 | Branch if positive
    BVC $10              ; 50 10 | Branch if overflow clear
    BPL $00              ; 10 00 | Branch if positive
    PLA                  ; 68 | Pull accumulator from stack
    BRA $78              ; 80 78 | Branch always
    BPL $88              ; 10 88 | Branch if positive
    SEI                  ; 78 | Set interrupt disable flag
    INY                  ; C8 | Increment Y register
    SEC                  ; 38 | Set carry flag
    BEQ $70              ; F0 70 | Branch if equal
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    BPL $60              ; 10 60 | Branch if positive
    BCC $60              ; 90 60 | Branch if carry clear
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INY                  ; C8 | Increment Y register
    DEY                  ; 88 | Decrement Y register
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0C2
; Address: $DD9BAB
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0C2:
    JSR $2409            ; 20 09 24 | Jump to subroutine
    JMP $0000            ; 4C 00 00 | Jump to address
    ASL $1F0F            ; 0E 0F 1F | Arithmetic shift left (absolute)
    ROL $3F2D,X          ; 3E 2D 3F | Rotate left (absolute,X)
    EOR $727B,Y          ; 59 7B 72 | Exclusive OR with accumulator (absolute,Y)
    BPL $7F              ; 10 7F | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0C3
; Address: $DD9BC8
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0C3:
    JSR $181B            ; 20 1B 18 | Jump to subroutine
    ASL $0504            ; 0E 04 05 | Arithmetic shift left (absolute)
    AND #$69             ; 29 69 | Logical AND with accumulator (immediate)
    ADC $65              ; 65 65 | Add with carry (zero page)
    AND ($21,X)          ; 21 21 | PPU graphics register access
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $1933,X          ; 1E 33 19 | Arithmetic shift left (absolute,X)
    ORA $3E56,Y          ; 19 56 3E | Logical OR with accumulator (absolute,Y)
    EOR #$16             ; 49 16 | Exclusive OR with accumulator (immediate)
    ORA ($1F),Y          ; 11 1F | Logical OR with accumulator ((zero page),Y)
    ORA $0206            ; 0D 06 02 | Logical OR with accumulator (absolute)
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0C4
; Address: $DD9BF1
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0C4:
    JSR $6250            ; 20 50 62 | Jump to subroutine
    BVC $60              ; 50 60 | Branch if overflow clear
    SEI                  ; 78 | Set interrupt disable flag
    BVS $3C              ; 70 3C | Branch if overflow set
    BMI $12              ; 30 12 | Branch if negative
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    BIT $3B              ; 24 3B | Test bits in accumulator (zero page)
    BIT #$3A             ; 89 3A | Test bits in accumulator (immediate)
    EOR $9A              ; 45 9A | Exclusive OR with accumulator (zero page)
    ORA $38              ; 05 38 | Logical OR with accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    STZ $0FFE,X          ; 9E FE 0F | Store zero to absolute,X
    STY $5C22            ; 8C 22 5C | Store Y register to absolute address
    PHP                  ; 08 | Push processor status to stack
    BPL $A4              ; 10 A4 | Branch if positive

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0C5
; Address: $DD9C28
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0C5:
    JSR $8040            ; 20 40 80 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$E6             ; C0 E6 | Compare Y register (immediate)
    JMP ($C024)          ; 6C 24 C0 | Jump to address (absolute indirect)
    RTI                  ; 40 | Return from interrupt
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    CPX #$60             ; E0 60 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0C6
; Address: $DD9C4F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0C6:
    BRA $40              ; 80 40 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0C8
; Address: $DD9C6B
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0C8:
    JSR $2409            ; 20 09 24 | Jump to subroutine
    JMP $0000            ; 4C 00 00 | Jump to address
    ASL $1F0F            ; 0E 0F 1F | Arithmetic shift left (absolute)
    ROL $3F2D,X          ; 3E 2D 3F | Rotate left (absolute,X)
    EOR $727B,Y          ; 59 7B 72 | Exclusive OR with accumulator (absolute,Y)
    BPL $7F              ; 10 7F | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0C9
; Address: $DD9C88
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0C9:
    JSR $181B            ; 20 1B 18 | Jump to subroutine
    ASL $0504            ; 0E 04 05 | Arithmetic shift left (absolute)
    ORA ($4F,X)          ; 01 4F | Logical OR with accumulator ((zero page,X))
    AND #$69             ; 29 69 | Logical AND with accumulator (immediate)
    ADC $65              ; 65 65 | Add with carry (zero page)
    AND ($21,X)          ; 21 21 | PPU graphics register access
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    RTI                  ; 40 | Return from interrupt
    SEI                  ; 78 | Set interrupt disable flag
    SEC                  ; 38 | Set carry flag
    DEC $4C3F            ; CE 3F 4C | Decrement (absolute)
    STA $0C7704          ; 8F 04 77 0C | Update graphics data
    ASL $1B              ; 06 1B | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    CPY #$FC             ; C0 FC | Compare Y register (immediate)
    BEQ $C8              ; F0 C8 | Branch if equal
    BEQ $78              ; F0 78 | Branch if equal
    BVS $01              ; 70 01 | Branch if overflow set
    ASL $3800            ; 0E 00 38 | Arithmetic shift left (absolute)
    SEC                  ; 38 | Set carry flag
    PLY                  ; 7A | Pull Y register from stack
    BIT $3B              ; 24 3B | Test bits in accumulator (zero page)
    BIT #$3A             ; 89 3A | Test bits in accumulator (immediate)
    EOR $9A              ; 45 9A | Exclusive OR with accumulator (zero page)
    ORA $38              ; 05 38 | Logical OR with accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    STZ $0EFE,X          ; 9E FE 0E | Store zero to absolute,X
    INC $FF0F,X          ; FE 0F FF | Increment (absolute,X)
    TXA                  ; 8A | Transfer X register to accumulator
    AND $5A              ; 25 5A | Logical AND with accumulator (zero page)
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    BPL $A3              ; 10 A3 | Branch if positive

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0CA
; Address: $DD9CE8
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0CA:
    JSR $8040            ; 20 40 80 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    CPY #$E7             ; C0 E7 | Compare Y register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0CB
; Address: $DD9CFE
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0CB:
    JSR $9000            ; 20 00 90 | Jump to subroutine
    CPY #$90             ; C0 90 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0CD
; Address: $DD9D08
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0CD:
    JSR $6080            ; 20 80 60 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BEQ $E0              ; F0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0CE
; Address: $DD9D11
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0CE:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0CF
; Address: $DD9D18
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0CF:
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ADC $79              ; 65 79 | Add with carry (zero page)
    ORA $0605,X          ; 1D 05 06 | Logical OR with accumulator (absolute,X)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA #$0F             ; 09 0F | Logical OR with accumulator (immediate)
    ADC $1F02,X          ; 7D 02 1F | Add with carry (absolute,X)
    CLC                  ; 18 | Clear carry flag
    BVC $2F              ; 50 2F | Branch if overflow clear
    ASL $1600            ; 0E 00 16 | Arithmetic shift left (absolute)
    BVC $39              ; 50 39 | Branch if overflow clear
    SEC                  ; 38 | Set carry flag
    JMP $482E            ; 4C 2E 48 | Jump to address
    PHP                  ; 08 | Push processor status to stack
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    AND #$16             ; 29 16 | Logical AND with accumulator (immediate)
    ASL $39              ; 06 39 | Arithmetic shift left (zero page)
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    WDM #$02             ; 42 02 | Reserved instruction
    CLC                  ; 18 | Clear carry flag
    STA $048E07          ; 8F 07 8E 04 | Update graphics data
    LSR $00              ; 46 00 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0D0
; Address: $DD9D6E
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0D0:
    JSR $0D00            ; 20 00 0D | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    JMP $A444            ; 4C 44 A4 | Jump to address
    STZ $B8D8            ; 9C D8 B8 | Store zero to absolute
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    LDY #$78             ; A0 78 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0D1
; Address: $DD9D8A
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0D1:
    BCC $FC              ; 90 FC | Branch if carry clear
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    LSR $4CFE            ; 4E FE 4C | Logical shift right (absolute)
    BMI $BC              ; 30 BC | Branch if negative
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    CPX $18              ; E4 18 | Compare X register (zero page)
    ROL $D8              ; 26 D8 | Rotate left (zero page)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    INC $F860,X          ; FE 60 F8 | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    TAX                  ; AA | Transfer accumulator to X register
    INC $EE86            ; EE 86 EE | Increment (absolute)
    DEC $F4              ; C6 F4 | Decrement (zero page)
    TSX                  ; BA | Transfer stack pointer to X register
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ASL $F8              ; 06 F8 | Arithmetic shift left (zero page)
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    PEA #$BA44           ; F4 44 BA | Push effective address to stack
    PLP                  ; 28 | Pull processor status from stack
    BNE $42              ; D0 42 | Hardware register operation
    STZ $DC              ; 64 DC | Store zero to zero page
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0D2
; Address: $DD9DC5
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0D2:
    JSR $70F8            ; 20 F8 70 | Jump to subroutine
    SEI                  ; 78 | Set interrupt disable flag
    BVS $70              ; 70 70 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0D3
; Address: $DD9DCC
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0D3:
    BEQ $60              ; F0 60 | Branch if equal
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BCC $68              ; 90 68 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0D4
; Address: $DD9DD2
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0D4:
    JSR $2010            ; 20 10 20 | Jump to subroutine
    BVS $70              ; 70 70 | Branch if overflow set
    BVS $F0              ; 70 F0 | Branch if overflow set
    BVS $E0              ; 70 E0 | Game work RAM access
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0D8
; Address: $DD9DE1
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0D8:
    JSL $1B3925          ; 22 25 39 1B | Jump to subroutine long
    ORA $0507,X          ; 1D 07 05 | Logical OR with accumulator (absolute,X)
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA #$0F             ; 09 0F | Logical OR with accumulator (immediate)
    AND $1F02,X          ; 3D 02 1F | Logical AND with accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag
    BVC $2F              ; 50 2F | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0D9
; Address: $DD9E07
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0D9:
    ASL $1600            ; 0E 00 16 | Arithmetic shift left (absolute)
    BVC $39              ; 50 39 | Branch if overflow clear
    SEC                  ; 38 | Set carry flag
    JMP $482E            ; 4C 2E 48 | Jump to address
    PHP                  ; 08 | Push processor status to stack
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    AND #$16             ; 29 16 | Logical AND with accumulator (immediate)
    ASL $39              ; 06 39 | Arithmetic shift left (zero page)
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    LSR                  ; 4A | Logical shift right (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    XBA                  ; EB | Exchange accumulator bytes
    STA                  ; 9F 04 9F 0E | Update graphics data
    STZ $4E0E,X          ; 9E 0E 4E | Store zero to absolute,X
    ASL $2F              ; 06 2F | Arithmetic shift left (zero page)
    ASL $05              ; 06 05 | Arithmetic shift left (zero page)
    ORA $1412            ; 0D 12 14 | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    ASL $0E0E            ; 0E 0E 0E | Arithmetic shift left (absolute)
    ASL $0607            ; 0E 07 06 | Arithmetic shift left (absolute)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR $A6              ; 46 A6 | Logical shift right (zero page)
    STZ $B8F8,X          ; 9E F8 B8 | Store zero to absolute,X
    LDY #$78             ; A0 78 | Load immediate value into Y register
    BCC $FC              ; 90 FC | Branch if carry clear
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    LSR $00FE            ; 4E FE 00 | Logical shift right (absolute)
    LSR $BE30            ; 4E 30 BE | Logical shift right (absolute)
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    CPX $18              ; E4 18 | Compare X register (zero page)
    ROL $D8              ; 26 D8 | Rotate left (zero page)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    INC $F860,X          ; FE 60 F8 | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    TAX                  ; AA | Transfer accumulator to X register
    INC $EE86            ; EE 86 EE | Increment (absolute)
    DEC $F4              ; C6 F4 | Decrement (zero page)
    TSX                  ; BA | Transfer stack pointer to X register
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ASL $F8              ; 06 F8 | Arithmetic shift left (zero page)
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    PEA #$BA44           ; F4 44 BA | Push effective address to stack
    PLP                  ; 28 | Pull processor status from stack
    BNE $42              ; D0 42 | Hardware register operation
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0DA
; Address: $DD9E82
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0DA:
    CPY $18              ; C4 18 | Compare Y register (zero page)
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt
    BEQ $E0              ; F0 E0 | Game work RAM access
    BVS $20              ; 70 20 | Branch if overflow set
    BEQ $00              ; F0 00 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0DD
; Address: $DD9E96
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0DD:
    CPX #$E0             ; E0 E0 | Game work RAM access
    LDY #$60             ; A0 60 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0DF
; Address: $DD9EA3
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0DF:
    JSR $3C22            ; 20 22 3C | Jump to subroutine
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    ASL $3E              ; 06 3E | Arithmetic shift left (zero page)
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    BPL $0F              ; 10 0F | Branch if positive
    ASL $0D0F            ; 0E 0F 0D | Arithmetic shift left (absolute)
    ORA ($13,X)          ; 01 13 | Logical OR with accumulator ((zero page,X))
    BPL $1D              ; 10 1D | Branch if positive
    ADC #$2D             ; 69 2D | Add with carry (immediate)
    ROR $36              ; 66 36 | Rotate right (zero page)
    DEY                  ; 88 | Decrement Y register
    ADC $0F10            ; 6D 10 0F | Add with carry (absolute)
    BIT $2213            ; 2C 13 22 | Test bits in accumulator (absolute)
    BIT $3609            ; 2C 09 36 | Test bits in accumulator (absolute)
    ORA #$36             ; 09 36 | Logical OR with accumulator (immediate)
    JMP ($7ABA)          ; 6C BA 7A | Jump to address (absolute indirect)
    EOR #$2A             ; 49 2A | Exclusive OR with accumulator (immediate)
    ORA $091B,Y          ; 19 1B 09 | Logical OR with accumulator (absolute,Y)
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ADC $2814,Y          ; 79 14 28 | Add with carry (absolute,Y)
    ORA $19              ; 05 19 | Logical OR with accumulator (zero page)
    ORA $0B              ; 05 0B | Logical OR with accumulator (zero page)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA ($28,X)          ; 01 28 | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    PLA                  ; 68 | Pull accumulator from stack
    CLI                  ; 58 | Clear interrupt disable flag
    BEQ $D0              ; F0 D0 | Branch if equal
    BRA $60              ; 80 60 | Branch always
    CLV                  ; B8 | Clear overflow flag
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0E0
; Address: $DD9F0A
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0E0:
    PLP                  ; 28 | Pull processor status from stack
    SED                  ; F8 | Set decimal mode flag
    BMI $F8              ; 30 F8 | Branch if negative
    BVS $F2              ; 70 F2 | Branch if overflow set
    PLP                  ; 28 | Pull processor status from stack
    BPL $78              ; 10 78 | Branch if positive
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    PEA #$8A08           ; F4 08 8A | Push effective address to stack
    ORA $DA              ; 05 DA | Logical OR with accumulator (zero page)
    CLD                  ; D8 | Clear decimal mode flag
    BEQ $0A              ; F0 0A | Branch if equal
    BNE $04              ; D0 04 | Branch if not equal
    BVS $90              ; 70 90 | Branch if overflow set
    BRA $E0              ; 80 E0 | Game work RAM access
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0E1
; Address: $DD9F2D
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0E1:
    RTI                  ; 40 | Return from interrupt
    BCC $60              ; 90 60 | Branch if carry clear
    ORA ($9E,X)          ; 01 9E | Logical OR with accumulator ((zero page,X))
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BIT $0C              ; 24 0C | Test bits in accumulator (zero page)
    BPL $00              ; 10 00 | Branch if positive
    BRA $00              ; 80 00 | Branch always
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0E2
; Address: $DD9F41
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0E2:
    JSR $D028            ; 20 28 D0 | Jump to subroutine
    BCS $40              ; B0 40 | Branch if carry set
    CPX $E600            ; EC 00 E6 | Compare X register (absolute)
    WDM #$00             ; 42 00 | Reserved instruction
    SEP #$40             ; E2 40 | Set processor status bits
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BCC $00              ; 90 00 | Branch if carry clear
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    BPL $12              ; 10 12 | Branch if positive
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ASL $1E              ; 06 1E | Arithmetic shift left (zero page)
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    BPL $0F              ; 10 0F | Branch if positive
    ASL $0D0F            ; 0E 0F 0D | Arithmetic shift left (absolute)
    ORA ($13,X)          ; 01 13 | Logical OR with accumulator ((zero page,X))
    BPL $1D              ; 10 1D | Branch if positive
    ADC #$2D             ; 69 2D | Add with carry (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0E3
; Address: $DD9F8A
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0E3:
    ROR $36              ; 66 36 | Rotate right (zero page)
    DEY                  ; 88 | Decrement Y register
    ADC $0F10            ; 6D 10 0F | Add with carry (absolute)
    BIT $2213            ; 2C 13 22 | Test bits in accumulator (absolute)
    BIT $3609            ; 2C 09 36 | Test bits in accumulator (absolute)
    ORA #$36             ; 09 36 | Logical OR with accumulator (immediate)
    JMP ($78BC)          ; 6C BC 78 | Jump to address (absolute indirect)
    EOR #$26             ; 49 26 | Exclusive OR with accumulator (immediate)
    ORA #$6B             ; 09 6B | Logical OR with accumulator (immediate)
    EOR $8401            ; 4D 01 84 | Exclusive OR with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $20              ; 10 20 | Branch if positive
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    BIT $E8              ; 24 E8 | Test bits in accumulator (zero page)
    CLI                  ; 58 | Clear interrupt disable flag
    BRA $60              ; 80 60 | Branch always
    CLV                  ; B8 | Clear overflow flag
    SED                  ; F8 | Set decimal mode flag
    PLP                  ; 28 | Pull processor status from stack
    SED                  ; F8 | Set decimal mode flag
    BMI $F8              ; 30 F8 | Branch if negative
    BVS $F2              ; 70 F2 | Branch if overflow set
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PEA #$8A08           ; F4 08 8A | Push effective address to stack
    ORA $DA              ; 05 DA | Logical OR with accumulator (zero page)
    CLD                  ; D8 | Clear decimal mode flag
    BEQ $0A              ; F0 0A | Branch if equal
    BNE $04              ; D0 04 | Branch if not equal
    BVS $90              ; 70 90 | Branch if overflow set
    BRA $E0              ; 80 E0 | Game work RAM access
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $60              ; 80 60 | Branch always
    ORA ($9E,X)          ; 01 9E | Logical OR with accumulator ((zero page,X))
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BIT $0C              ; 24 0C | Test bits in accumulator (zero page)
    BPL $00              ; 10 00 | Branch if positive
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CLC                  ; 18 | Clear carry flag
    DEY                  ; 88 | Decrement Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0E5
; Address: $DDA005
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0E5:
    JSR $00E0            ; 20 E0 00 | Jump to subroutine
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$80             ; E0 80 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0E6
; Address: $DDA00C
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0E6:
    CPX #$80             ; E0 80 | Compare X register (immediate)
    BCS $00              ; B0 00 | Branch if carry set
    BPL $00              ; 10 00 | Branch if positive
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    ADC $79              ; 65 79 | Add with carry (zero page)
    ORA $0605,X          ; 1D 05 06 | Logical OR with accumulator (absolute,X)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA #$0F             ; 09 0F | Logical OR with accumulator (immediate)
    ADC $1F02,X          ; 7D 02 1F | Add with carry (absolute,X)
    CLC                  ; 18 | Clear carry flag
    BVC $2F              ; 50 2F | Branch if overflow clear
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0E7
; Address: $DDA044
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0E7:
    ROL $0D01            ; 2E 01 0D | Rotate left (absolute)
    PHP                  ; 08 | Push processor status to stack
    CLI                  ; 58 | Clear interrupt disable flag
    AND ($0D,X)          ; 21 0D | Logical AND with accumulator ((zero page,X))
    WDM #$37             ; 42 37 | Reserved instruction
    PHA                  ; 48 | Push accumulator to stack
    BPL $00              ; 10 00 | Branch if positive
    BPL $0A              ; 10 0A | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    BPL $04              ; 10 04 | Branch if positive
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    LSR $01              ; 46 01 | Logical shift right (zero page)
    ORA $0112,Y          ; 19 12 01 | Logical OR with accumulator (absolute,Y)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    BMI $04              ; 30 04 | Branch if negative
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    JMP $A444            ; 4C 44 A4 | Jump to address
    STZ $B8D8            ; 9C D8 B8 | Store zero to absolute
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    LDY #$78             ; A0 78 | Load immediate value into Y register
    BCC $FC              ; 90 FC | Branch if carry clear
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    DEC $4CFE            ; CE FE 4C | Decrement (absolute)
    BMI $BC              ; 30 BC | Branch if negative
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    CPX $18              ; E4 18 | Compare X register (zero page)
    ROL $D8              ; 26 D8 | Rotate left (zero page)
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    INC $E870,X          ; FE 70 E8 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0E8
; Address: $DDA0A4
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0E8:
    SEI                  ; 78 | Set interrupt disable flag
    STY $0EAA            ; 8C AA 0E | Store Y register to absolute address
    DEC $2E              ; C6 2E | Decrement (zero page)
    TXS                  ; 9A | Transfer X register to stack pointer
    WDM #$E4             ; 42 E4 | Reserved instruction
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    ASL $68              ; 06 68 | Arithmetic shift left (zero page)
    ORA ($4E),Y          ; 11 4E | Logical OR with accumulator ((zero page),Y)
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    PLP                  ; 28 | Pull processor status from stack
    STZ $02              ; 64 02 | Store zero to zero page
    BPL $08              ; 10 08 | Branch if positive

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0E9
; Address: $DDA0C0
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0E9:
    JSL $80D6C4          ; 22 C4 D6 80 | Jump to subroutine long
    BCC $F9              ; 90 F9 | Branch if carry clear
    BMI $F9              ; 30 F9 | Branch if negative
    BMI $71              ; 30 71 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    LDY $1000            ; AC 00 10 | Load from absolute address into Y register
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    BPL $10              ; 10 10 | Branch if positive
    BMI $30              ; 30 30 | Branch if negative
    BMI $30              ; 30 30 | Branch if negative
    BVS $C0              ; 70 C0 | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0EA
; Address: $DDA0E1
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0EA:
    JSL $1B3925          ; 22 25 39 1B | Jump to subroutine long
    ORA $0507,X          ; 1D 07 05 | Logical OR with accumulator (absolute,X)
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA #$0F             ; 09 0F | Logical OR with accumulator (immediate)
    AND $1F02,X          ; 3D 02 1F | Logical AND with accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag
    BVC $2F              ; 50 2F | Branch if overflow clear
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0EB
; Address: $DDA104
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0EB:
    ROL $0D01            ; 2E 01 0D | Rotate left (absolute)
    PHP                  ; 08 | Push processor status to stack
    CLI                  ; 58 | Clear interrupt disable flag
    EOR ($2D,X)          ; 41 2D | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0EC
; Address: $DDA10E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0EC:
    JSL $364803          ; 22 03 48 36 | Jump to subroutine long
    BPL $00              ; 10 00 | Branch if positive
    BPL $0A              ; 10 0A | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BPL $04              ; 10 04 | Branch if positive
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0ED
; Address: $DDA11D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0ED:
    JSR $1408            ; 20 08 14 | Jump to subroutine
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    ORA #$1F             ; 09 1F | Logical OR with accumulator (immediate)
    ASL $0F02            ; 0E 02 0F | Arithmetic shift left (absolute)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0EE
; Address: $DDA130
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0EE:
    PHP                  ; 08 | Push processor status to stack
    BPL $54              ; 10 54 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $0203            ; 0E 03 02 | Arithmetic shift left (absolute)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR $A6              ; 46 A6 | Logical shift right (zero page)
    STZ $B8F8,X          ; 9E F8 B8 | Store zero to absolute,X
    LDY #$78             ; A0 78 | Load immediate value into Y register
    BCC $FC              ; 90 FC | Branch if carry clear
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    DEC $00FE            ; CE FE 00 | Decrement (absolute)
    LSR $BE30            ; 4E 30 BE | Logical shift right (absolute)
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    CPX $18              ; E4 18 | Compare X register (zero page)
    ROL $D8              ; 26 D8 | Rotate left (zero page)
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    INC $E870,X          ; FE 70 E8 | Increment (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    STY $0EAA            ; 8C AA 0E | Store Y register to absolute address
    DEC $2E              ; C6 2E | Decrement (zero page)
    TXS                  ; 9A | Transfer X register to stack pointer
    WDM #$EC             ; 42 EC | Reserved instruction
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    ASL $68              ; 06 68 | Arithmetic shift left (zero page)
    ORA ($4E),Y          ; 11 4E | Logical OR with accumulator ((zero page),Y)
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    PLP                  ; 28 | Pull processor status from stack
    STZ $02              ; 64 02 | Store zero to zero page
    BPL $00              ; 10 00 | Branch if positive
    BRA $C4              ; 80 C4 | Branch always
    TYA                  ; 98 | Transfer Y register to accumulator
    BRA $F3              ; 80 F3 | Branch always

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0EF
; Address: $DDA187
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0EF:
    JSR $20F1            ; 20 F1 20 | Jump to subroutine
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BPL $0C              ; 10 0C | Branch if positive

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0F2
; Address: $DDA1A3
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0F2:
    INC                  ; 1A | Increment accumulator
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA $141F,X          ; 1D 1F 14 | Logical OR with accumulator (absolute,X)
    ASL $144F            ; 0E 4F 14 | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    ASL $0F00,X          ; 1E 00 0F | Arithmetic shift left (absolute,X)
    BPL $51              ; 10 51 | Branch if positive

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0F3
; Address: $DDA1BB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0F3:
    ROL $3F40            ; 2E 40 3F | Rotate left (absolute)
    LDY #$5B             ; A0 5B | Load immediate value into Y register
    ROL $500F,X          ; 3E 0F 50 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0F4
; Address: $DDA1C7
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0F4:
    JSR $090E            ; 20 0E 09 | Jump to subroutine
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    BRA $79              ; 80 79 | Branch always
    BRA $78              ; 80 78 | Branch always
    BRA $70              ; 80 70 | Branch always
    BVC $24              ; 50 24 | Branch if overflow clear
    BMI $00              ; 30 00 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $1F02            ; 0D 02 1F | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0F5
; Address: $DDA1EA
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0F5:
    JSL $022700          ; 22 00 27 02 | Jump to subroutine long
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    BRA $C0              ; 80 C0 | Branch always
    BRA $E0              ; 80 E0 | Game work RAM access
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0F8
; Address: $DDA21C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0F8:
    BCC $60              ; 90 60 | Branch if carry clear
    PHP                  ; 08 | Push processor status to stack
    BEQ $70              ; F0 70 | Branch if equal
    BEQ $B0              ; F0 B0 | Branch if equal
    BMI $80              ; 30 80 | Branch if negative
    INY                  ; C8 | Increment Y register
    PHP                  ; 08 | Push processor status to stack
    CLV                  ; B8 | Clear overflow flag
    ROR $6C              ; 66 6C | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0F9
; Address: $DDA22C
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0F9:
    JSL $B6116C          ; 22 6C 11 B6 | Jump to subroutine long
    PHP                  ; 08 | Push processor status to stack
    BEQ $48              ; F0 48 | Branch if equal
    BMI $34              ; 30 34 | Branch if negative
    INY                  ; C8 | Increment Y register
    SEC                  ; 38 | Set carry flag
    PHA                  ; 48 | Push accumulator to stack
    BCC $6C              ; 90 6C | Branch if carry clear
    BCC $6C              ; 90 6C | Branch if carry clear
    PHA                  ; 48 | Push accumulator to stack
    EOR $925E,X          ; 5D 5E 92 | Exclusive OR with accumulator (absolute,X)
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0FA
; Address: $DDA246
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0FA:
    CLD                  ; D8 | Clear decimal mode flag
    BCC $F0              ; 90 F0 | Branch if carry clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0FB
; Address: $DDA24A
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0FB:
    BEQ $40              ; F0 40 | Branch if equal
    CPX #$40             ; E0 40 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0FC
; Address: $DDA250
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0FC:
    JSR $289E            ; 20 9E 28 | Jump to subroutine
    LDY #$98             ; A0 98 | Load immediate value into Y register
    LDY #$D0             ; A0 D0 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0FD
; Address: $DDA259
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0FD:
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BIT $1724            ; 2C 24 17 | Test bits in accumulator (absolute)
    INC                  ; 1A | Increment accumulator
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA $141F,X          ; 1D 1F 14 | Logical OR with accumulator (absolute,X)
    ASL $004F            ; 0E 4F 00 | Arithmetic shift left (absolute)
    BIT $1F10            ; 2C 10 1F | Test bits in accumulator (absolute)
    BPL $51              ; 10 51 | Branch if positive
    ROL $3F40            ; 2E 40 3F | Rotate left (absolute)
    LDY #$5B             ; A0 5B | Load immediate value into Y register
    ROL $500F,X          ; 3E 0F 50 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0FE
; Address: $DDA287
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0FE:
    JSR $090E            ; 20 0E 09 | Jump to subroutine
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    BRA $79              ; 80 79 | Branch always
    BRA $78              ; 80 78 | Branch always
    BRA $70              ; 80 70 | Branch always
    BVC $24              ; 50 24 | Branch if overflow clear
    BMI $00              ; 30 00 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ORA ($06),Y          ; 11 06 | Logical OR with accumulator ((zero page),Y)
    BIT $042B            ; 2C 2B 04 | Test bits in accumulator (absolute)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($0D,X)          ; 01 0D | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_0FF
; Address: $DDA2B0
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_0FF:
    JSR $0008            ; 20 08 00 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    SEC                  ; 38 | Set carry flag
    BMI $F0              ; 30 F0 | Branch if negative
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_100
; Address: $DDA2CB
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_100:
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $18              ; F0 18 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_101
; Address: $DDA2D2
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_101:
    SEI                  ; 78 | Set interrupt disable flag
    BRA $F0              ; 80 F0 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_103
; Address: $DDA2DC
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_103:
    BCC $60              ; 90 60 | Branch if carry clear
    PHP                  ; 08 | Push processor status to stack
    BEQ $70              ; F0 70 | Branch if equal
    BEQ $B0              ; F0 B0 | Branch if equal
    BMI $80              ; 30 80 | Branch if negative
    INY                  ; C8 | Increment Y register
    PHP                  ; 08 | Push processor status to stack
    CLV                  ; B8 | Clear overflow flag
    ROR $6C              ; 66 6C | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_104
; Address: $DDA2EC
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_104:
    JSL $B6116C          ; 22 6C 11 B6 | Jump to subroutine long
    PHP                  ; 08 | Push processor status to stack
    BEQ $48              ; F0 48 | Branch if equal
    BMI $34              ; 30 34 | Branch if negative
    INY                  ; C8 | Increment Y register
    SEC                  ; 38 | Set carry flag
    PHA                  ; 48 | Push accumulator to stack
    BCC $6C              ; 90 6C | Branch if carry clear
    BCC $6C              ; 90 6C | Branch if carry clear
    PHA                  ; 48 | Push accumulator to stack
    AND $921E,X          ; 3D 1E 92 | Logical AND with accumulator (absolute,X)
    STZ $DC              ; 64 DC | Store zero to zero page
    PLP                  ; 28 | Pull processor status from stack
    SED                  ; F8 | Set decimal mode flag
    BRA $DC              ; 80 DC | Branch always
    CPY #$B2             ; C0 B2 | Compare Y register (immediate)
    BRA $22              ; 80 22 | Branch always
    STA ($00,X)          ; 81 00 | Update graphics data
    DEC $0408,X          ; DE 08 04 | Decrement (absolute,X)
    DEY                  ; 88 | Decrement Y register
    BRA $C0              ; 80 C0 | Branch always
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPY #$A0             ; C0 A0 | Compare Y register (immediate)
    BRA $40              ; 80 40 | Branch always
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $0019,Y          ; 19 19 00 | Logical OR with accumulator (absolute,Y)
    ORA $260F,Y          ; 19 0F 26 | Logical OR with accumulator (absolute,Y)
    ROL $2F20,X          ; 3E 20 2F | Rotate left (absolute,X)
    AND #$29             ; 29 29 | Logical AND with accumulator (immediate)
    ASL $4E1E,X          ; 1E 1E 4E | Arithmetic shift left (absolute,X)
    ROL $3267            ; 2E 67 32 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_105
; Address: $DDA350
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_105:
    ROL $1F              ; 26 1F | Rotate left (zero page)
    BMI $1F              ; 30 1F | Branch if negative
    ASL $053F            ; 0E 3F 05 | Arithmetic shift left (absolute)
    ORA $0A              ; 05 0A | Logical OR with accumulator (zero page)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_107
; Address: $DDA384
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_107:
    BCC $90              ; 90 90 | Branch if carry clear
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_108
; Address: $DDA394
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_108:
    BEQ $60              ; F0 60 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $F8              ; F0 F8 | Branch if equal
    BEQ $E8              ; F0 E8 | Branch if equal
    BEQ $DC              ; F0 DC | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    JMP $7D65F8          ; 5C F8 65 7D | Jump to address long
    ROL $6B3C,X          ; 3E 3C 6B | Rotate left (absolute,X)
    ROR                  ; 6A | Rotate right (accumulator)
    CMP $CADC,X          ; DD DC CA | Compare accumulator (absolute,X)
    CPY $5A78            ; CC 78 5A | Compare Y register (absolute)
    ADC $F8              ; 65 F8 | Add with carry (zero page)
    SBC $FEFE,X          ; FD FE FE | Subtract with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    INC $FED6,X          ; FE D6 FE | Increment (absolute,X)
    TSX                  ; BA | Transfer stack pointer to X register
    SED                  ; F8 | Set decimal mode flag
    BCS $DD              ; B0 DD | Branch if carry set
    REP #$C0             ; C2 C0 | Reset processor status bits
    BMI $81              ; 30 81 | Branch if negative
    BVS $91              ; 70 91 | Branch if overflow set
    BVS $0B              ; 70 0B | Branch if overflow set
    BEQ $2A              ; F0 2A | Branch if equal
    BCS $7A              ; B0 7A | Branch if carry set
    BMI $B0              ; 30 B0 | Branch if negative
    BRA $00              ; 80 00 | Branch always
    SEC                  ; 38 | Set carry flag
    SBC $E9F7,Y          ; F9 F7 E9 | Subtract with carry (absolute,Y)
    REP #$82             ; C2 82 | Reset processor status bits
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_109
; Address: $DDA3E9
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_109:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $0019,Y          ; 19 19 00 | Logical OR with accumulator (absolute,Y)
    ORA $260F,Y          ; 19 0F 26 | Logical OR with accumulator (absolute,Y)
    ROL $2F20,X          ; 3E 20 2F | Rotate left (absolute,X)
    AND #$29             ; 29 29 | Logical AND with accumulator (immediate)
    ASL $0E1E,X          ; 1E 1E 0E | Arithmetic shift left (absolute,X)
    ASL $3247,X          ; 1E 47 32 | Arithmetic shift left (absolute,X)
    ROL $1F              ; 26 1F | Rotate left (zero page)
    BMI $1F              ; 30 1F | Branch if negative
    ASL $051F            ; 0E 1F 05 | Arithmetic shift left (absolute)
    ORA $0A              ; 05 0A | Logical OR with accumulator (zero page)
    BIT $21              ; 24 21 | PPU graphics register access
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA $0F05            ; 0D 05 0F | Logical OR with accumulator (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_10B
; Address: $DDA444
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_10B:
    BCC $90              ; 90 90 | Branch if carry clear
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_10C
; Address: $DDA454
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_10C:
    BEQ $60              ; F0 60 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $F8              ; F0 F8 | Branch if equal
    BEQ $E8              ; F0 E8 | Branch if equal
    BEQ $DC              ; F0 DC | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    JMP $7D65F8          ; 5C F8 65 7D | Jump to address long
    ROL $6B3C,X          ; 3E 3C 6B | Rotate left (absolute,X)
    ROR                  ; 6A | Rotate right (accumulator)
    CMP $CCDC,X          ; DD DC CC | Compare accumulator (absolute,X)
    DEC $5878            ; CE 78 58 | Decrement (absolute)
    ADC $F8              ; 65 F8 | Add with carry (zero page)
    SBC $FEFE,X          ; FD FE FE | Subtract with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    INC $FED6,X          ; FE D6 FE | Increment (absolute,X)
    TSX                  ; BA | Transfer stack pointer to X register
    CLD                  ; D8 | Clear decimal mode flag
    CMP ($30,X)          ; C1 30 | Compare accumulator ((zero page,X))
    STA ($60,X)          ; 81 60 | Update graphics data
    BVS $02              ; 70 02 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_10D
; Address: $DDA487
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_10D:
    BEQ $12              ; F0 12 | Branch if equal
    BEQ $10              ; F0 10 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_10E
; Address: $DDA48C
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_10E:
    BCC $60              ; 90 60 | Branch if carry clear
    LDY #$00             ; A0 00 | Load immediate value into Y register
    AND $F137,Y          ; 39 37 F1 | Logical AND with accumulator (absolute,Y)
    TXA                  ; 8A | Transfer X register to accumulator
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $02              ; 80 02 | Branch always
    RTI                  ; 40 | Return from interrupt
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ASL $1E0E            ; 0E 0E 1E | Arithmetic shift left (absolute)
    ASL $1414,X          ; 1E 14 14 | Arithmetic shift left (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    PLP                  ; 28 | Pull processor status from stack
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $1F              ; 05 1F | Logical OR with accumulator (zero page)
    ROL $601F,X          ; 3E 1F 60 | Rotate left (absolute,X)
    LDX #$3E             ; A2 3E | Load immediate value into X register
    CLI                  ; 58 | Clear interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    BVS $31              ; 70 31 | Branch if overflow set
    TAX                  ; AA | Transfer accumulator to X register
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_10F
; Address: $DDA4D2
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_10F:
    JSL $2F1F5F          ; 22 5F 1F 2F | Jump to subroutine long
    ROL $3E3E,X          ; 3E 3E 3E | Rotate left (absolute,X)
    ROR $5C3E            ; 6E 3E 5C | Rotate right (absolute)
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    PLP                  ; 28 | Pull processor status from stack
    ASL $1B              ; 06 1B | Arithmetic shift left (zero page)
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($10),Y          ; 11 10 | Logical OR with accumulator ((zero page),Y)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    BVC $50              ; 50 50 | Branch if overflow clear
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    RTI                  ; 40 | Return from interrupt
    PHA                  ; 48 | Push accumulator to stack
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    BNE $E0              ; D0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_110
; Address: $DDA519
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_110:
    BEQ $60              ; F0 60 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPX #$1C             ; E0 1C | Compare X register (immediate)
    CPX #$08             ; E0 08 | Compare X register (immediate)
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_111
; Address: $DDA522
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_111:
    JSR $0850            ; 20 50 08 | Jump to subroutine
    BNE $08              ; D0 08 | Branch if not equal
    BCS $10              ; B0 10 | Branch if carry set
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    BRA $20              ; 80 20 | Branch always
    PEA #$8850           ; F4 50 88 | Push effective address to stack
    CLI                  ; 58 | Clear interrupt disable flag
    BNE $88              ; D0 88 | Branch if not equal
    BRA $20              ; 80 20 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ASL $98              ; 06 98 | Arithmetic shift left (zero page)
    SED                  ; F8 | Set decimal mode flag
    BCC $40              ; 90 40 | Branch if carry clear
    BRA $82              ; 80 82 | Branch always
    LDY #$C6             ; A0 C6 | Load immediate value into Y register
    LDY #$44             ; A0 44 | Load immediate value into Y register
    CPY #$44             ; C0 44 | Compare Y register (immediate)
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    CPY #$B0             ; C0 B0 | Compare Y register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    INC $6E22            ; EE 22 6E | Increment (absolute)
    ROL $6E              ; 26 6E | Rotate left (zero page)
    BIT $04              ; 24 04 | Test bits in accumulator (zero page)
    BIT $04              ; 24 04 | Test bits in accumulator (zero page)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ASL $1E0E            ; 0E 0E 1E | Arithmetic shift left (absolute)
    ASL $1414,X          ; 1E 14 14 | Arithmetic shift left (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    PLP                  ; 28 | Pull processor status from stack
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $1F              ; 05 1F | Logical OR with accumulator (zero page)
    ROL $601F,X          ; 3E 1F 60 | Rotate left (absolute,X)
    LDX #$3E             ; A2 3E | Load immediate value into X register
    CLI                  ; 58 | Clear interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    BVS $31              ; 70 31 | Branch if overflow set
    TAX                  ; AA | Transfer accumulator to X register
    AND ($38),Y          ; 31 38 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_112
; Address: $DDA592
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_112:
    JSL $2F1F5F          ; 22 5F 1F 2F | Jump to subroutine long
    ROL $3E3E,X          ; 3E 3E 3E | Rotate left (absolute,X)
    ROR $5C3E            ; 6E 3E 5C | Rotate right (absolute)
    DEC                  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_113
; Address: $DDA59F
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_113:
    DEC                  ; 3A | Decrement accumulator
    ROL                  ; 2A | Rotate left (accumulator)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA $080D            ; 0D 0D 08 | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    BVC $50              ; 50 50 | Branch if overflow clear
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    RTI                  ; 40 | Return from interrupt
    PHA                  ; 48 | Push accumulator to stack
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    BNE $E0              ; D0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    BEQ $60              ; F0 60 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPX #$1C             ; E0 1C | Compare X register (immediate)
    CPX #$08             ; E0 08 | Compare X register (immediate)
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_114
; Address: $DDA5E2
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_114:
    JSR $0850            ; 20 50 08 | Jump to subroutine
    BNE $08              ; D0 08 | Branch if not equal
    BCS $10              ; B0 10 | Branch if carry set
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    BRA $20              ; 80 20 | Branch always
    SED                  ; F8 | Set decimal mode flag
    BVC $88              ; 50 88 | Branch if overflow clear
    CLI                  ; 58 | Clear interrupt disable flag
    BNE $88              ; D0 88 | Branch if not equal
    BRA $20              ; 80 20 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BCC $94              ; 90 94 | Branch if carry clear
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    BMI $C0              ; 30 C0 | Branch if negative
    LDY $40              ; A4 40 | Load from zero page into Y register
    LDY #$8C             ; A0 8C | Load immediate value into Y register
    BRA $88              ; 80 88 | Branch always
    BRA $48              ; 80 48 | Branch always
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    LDY $BC              ; A4 BC | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_115
; Address: $DDA616
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_115:
    BIT $485C            ; 2C 5C 48 | Test bits in accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ORA $3130,X          ; 1D 30 31 | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_116
; Address: $DDA62E
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_116:
    JSR $000E            ; 20 0E 00 | Jump to subroutine
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $19              ; 06 19 | Arithmetic shift left (zero page)
    ORA $3D0E,X          ; 1D 0E 3D | Logical OR with accumulator (absolute,X)
    ASL $1F10,X          ; 1E 10 1F | Arithmetic shift left (absolute,X)
    LDA ($99,X)          ; A1 99 | Read graphics status
    AND ($A8),Y          ; 31 A8 | Logical AND with accumulator ((zero page),Y)
    AND $1E58            ; 2D 58 1E | Logical AND with accumulator (absolute)
    BNE $53              ; D0 53 | Branch if not equal
    LDA ($29,X)          ; A1 29 | Read graphics status
    JMP $2419            ; 4C 19 24 | Jump to address
    AND ($85),Y          ; 31 85 | Logical AND with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    LDY $783A,X          ; BC 3A 78 | Load from absolute,X into Y register
    SEC                  ; 38 | Set carry flag
    AND ($5C),Y          ; 31 5C | Logical AND with accumulator ((zero page),Y)
    SEI                  ; 78 | Set interrupt disable flag
    BVC $24              ; 50 24 | Branch if overflow clear
    ASL $4D              ; 06 4D | Arithmetic shift left (zero page)
    WDM #$21             ; 42 21 | PPU graphics register access
    ROL $20              ; 26 20 | Rotate left (zero page)
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_117
; Address: $DDA684
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_117:
    JSR $D020            ; 20 20 D0 | Jump to subroutine
    BNE $30              ; D0 30 | Branch if not equal
    BMI $28              ; 30 28 | Branch if negative
    TAY                  ; A8 | Transfer accumulator to Y register
    CLC                  ; 18 | Clear carry flag
    TYA                  ; 98 | Transfer Y register to accumulator
    PHP                  ; 08 | Push processor status to stack
    BVS $00              ; 70 00 | Branch if overflow set
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_118
; Address: $DDA694
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_118:
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    BEQ $E0              ; F0 E0 | Game work RAM access
    BVS $E0              ; 70 E0 | Game work RAM access
    CLV                  ; B8 | Clear overflow flag
    BVS $B8              ; 70 B8 | Branch if overflow set
    BVS $00              ; 70 00 | Branch if overflow set
    BEQ $44              ; F0 44 | Branch if equal
    CLD                  ; D8 | Clear decimal mode flag
    JMP ($04AC)          ; 6C AC 04 | Jump to address (absolute indirect)
    LDY $14              ; A4 14 | Load from zero page into Y register
    PEA #$C80C           ; F4 0C C8 | Push effective address to stack
    LDX #$A4             ; A2 A4 | Load immediate value into X register
    STZ $0068            ; 9C 68 00 | Store zero to absolute
    RTI                  ; 40 | Return from interrupt
    SEI                  ; 78 | Set interrupt disable flag
    SEC                  ; 38 | Set carry flag
    JMP $081C18          ; 5C 18 1C 08 | Jump to address long
    SEC                  ; 38 | Set carry flag
    BVC $09              ; 50 09 | Branch if overflow clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_11A
; Address: $DDA6BE
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_11A:
    BEQ $67              ; F0 67 | Branch if equal
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))
    ORA ($E0,X)          ; 01 E0 | Game work RAM access
    BEQ $02              ; F0 02 | Branch if equal
    BEQ $12              ; F0 12 | Branch if equal
    BVS $10              ; 70 10 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_11B
; Address: $DDA6CC
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_11B:
    BCC $60              ; 90 60 | Branch if carry clear
    LDY #$00             ; A0 00 | Load immediate value into Y register
    SBC ($87),Y          ; F1 87 | Subtract with carry ((zero page),Y)
    CMP ($C7),Y          ; D1 C7 | Compare accumulator ((zero page),Y)
    TXA                  ; 8A | Transfer X register to accumulator
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $02              ; 80 02 | Branch always
    RTI                  ; 40 | Return from interrupt
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ORA $3130,X          ; 1D 30 31 | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_11C
; Address: $DDA6EE
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_11C:
    JSR $000E            ; 20 0E 00 | Jump to subroutine
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $19              ; 06 19 | Arithmetic shift left (zero page)
    ORA $3D0E,X          ; 1D 0E 3D | Logical OR with accumulator (absolute,X)
    ASL $1F10,X          ; 1E 10 1F | Arithmetic shift left (absolute,X)
    LDA ($99,X)          ; A1 99 | Read graphics status
    AND ($A8),Y          ; 31 A8 | Logical AND with accumulator ((zero page),Y)
    AND $1E58            ; 2D 58 1E | Logical AND with accumulator (absolute)
    BNE $53              ; D0 53 | Branch if not equal
    LDA ($39,X)          ; A1 39 | Read graphics status

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_11E
; Address: $DDA70F
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_11E:
    JSR $1F85            ; 20 85 1F | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    LDY $783A,X          ; BC 3A 78 | Load from absolute,X into Y register
    SEC                  ; 38 | Set carry flag
    AND ($5C),Y          ; 31 5C | Logical AND with accumulator ((zero page),Y)
    SEI                  ; 78 | Set interrupt disable flag
    ROL $40              ; 26 40 | Rotate left (zero page)
    ASL $0D              ; 06 0D | Arithmetic shift left (zero page)
    ASL $22              ; 06 22 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $0F00            ; 0E 00 0F | Arithmetic shift left (absolute)
    ORA #$0E             ; 09 0E | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    ASL $05              ; 06 05 | Arithmetic shift left (zero page)
    ORA $0A03            ; 0D 03 0A | Logical OR with accumulator (absolute)
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    BPL $01              ; 10 01 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_11F
; Address: $DDA744
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_11F:
    JSR $D020            ; 20 20 D0 | Jump to subroutine
    BNE $30              ; D0 30 | Branch if not equal
    BMI $28              ; 30 28 | Branch if negative
    TAY                  ; A8 | Transfer accumulator to Y register
    CLC                  ; 18 | Clear carry flag
    TYA                  ; 98 | Transfer Y register to accumulator
    PHP                  ; 08 | Push processor status to stack
    BVS $00              ; 70 00 | Branch if overflow set
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    BEQ $E0              ; F0 E0 | Game work RAM access
    BVS $E0              ; 70 E0 | Game work RAM access
    CLV                  ; B8 | Clear overflow flag
    BVS $B8              ; 70 B8 | Branch if overflow set
    BVS $00              ; 70 00 | Branch if overflow set
    BEQ $44              ; F0 44 | Branch if equal
    CLD                  ; D8 | Clear decimal mode flag
    JMP ($04AC)          ; 6C AC 04 | Jump to address (absolute indirect)
    LDY $14              ; A4 14 | Load from zero page into Y register
    PEA #$C808           ; F4 08 C8 | Push effective address to stack
    LDY $B0              ; A4 B0 | Load from zero page into Y register
    STY $62              ; 84 62 | Store Y register to zero page
    STY $7840            ; 8C 40 78 | Store Y register to absolute address
    SEC                  ; 38 | Set carry flag
    JMP $081C18          ; 5C 18 1C 08 | Jump to address long
    SEC                  ; 38 | Set carry flag
    BPL $48              ; 10 48 | Branch if positive
    BVS $69              ; 70 69 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_120
; Address: $DDA77E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_120:
    BEQ $E0              ; F0 E0 | Game work RAM access
    PHP                  ; 08 | Push processor status to stack
    BRA $21              ; 80 21 | PPU graphics register access
    CPX #$01             ; E0 01 | Compare X register (immediate)
    LDY #$13             ; A0 13 | Load immediate value into Y register
    CPX #$52             ; E0 52 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_123
; Address: $DDA790
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_123:
    CPX #$87             ; E0 87 | Compare X register (immediate)
    CMP ($C7),Y          ; D1 C7 | Compare accumulator ((zero page),Y)
    CMP ($87),Y          ; D1 87 | Compare accumulator ((zero page),Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_124
; Address: $DDA7AC
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_124:
    JSR $2038            ; 20 38 20 | Jump to subroutine
    ASL $1F              ; 06 1F | Arithmetic shift left (zero page)
    SEC                  ; 38 | Set carry flag
    BPL $14              ; 10 14 | Branch if positive
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $0B              ; 10 0B | Branch if positive
    BPL $0D              ; 10 0D | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    ORA $0E              ; 05 0E | Logical OR with accumulator (zero page)
    ORA #$10             ; 09 10 | Logical OR with accumulator (immediate)
    INC                  ; 1A | Increment accumulator
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    INC                  ; 1A | Increment accumulator
    ASL $0E0D,X          ; 1E 0D 0E | Arithmetic shift left (absolute,X)
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    BVS $70              ; 70 70 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    JMP $544C            ; 4C 4C 54 | Jump to address
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BEQ $A0              ; F0 A0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $E8              ; F0 E8 | Branch if equal
    BEQ $4C              ; F0 4C | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_125
; Address: $DDA820
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_125:
    ASL $E4              ; 06 E4 | Arithmetic shift left (zero page)
    EOR $7C              ; 45 7C | Exclusive OR with accumulator (zero page)
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    ASL $EA8C            ; 0E 8C EA | Arithmetic shift left (absolute)
    INX                  ; E8 | Increment X register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ROR $1C8C            ; 6E 8C 1C | Rotate right (absolute)
    SED                  ; F8 | Set decimal mode flag
    PLX                  ; FA | Pull X register from stack
    SED                  ; F8 | Set decimal mode flag
    PEA #$7C7C           ; F4 7C 7C | Push effective address to stack
    STZ $1CF6,X          ; 9E F6 1C | Store zero to absolute,X
    DEC                  ; 3A | Decrement accumulator
    PHA                  ; 48 | Push accumulator to stack
    BPL $40              ; 10 40 | Branch if positive
    BPL $C0              ; 10 C0 | Branch if positive
    BRA $20              ; 80 20 | Branch always
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_126
; Address: $DDA84C
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_126:
    JSR $6000            ; 20 00 60 | Jump to subroutine
    PLP                  ; 28 | Pull processor status from stack
    INY                  ; C8 | Increment Y register
    BVS $D0              ; 70 D0 | Branch if overflow set
    BVS $D0              ; 70 D0 | Branch if overflow set
    BEQ $C0              ; F0 C0 | Branch if equal
    BNE $80              ; D0 80 | Branch if not equal
    CPX #$80             ; E0 80 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_127
; Address: $DDA86C
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_127:
    JSR $2038            ; 20 38 20 | Jump to subroutine
    ASL $1F              ; 06 1F | Arithmetic shift left (zero page)
    SEC                  ; 38 | Set carry flag
    BPL $14              ; 10 14 | Branch if positive
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $0B              ; 10 0B | Branch if positive
    BPL $0D              ; 10 0D | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($1A),Y          ; 11 1A | Logical OR with accumulator ((zero page),Y)
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    ORA $3B09,Y          ; 19 09 3B | Logical OR with accumulator (absolute,Y)
    EOR #$22             ; 49 22 | Exclusive OR with accumulator (immediate)
    AND ($21,X)          ; 21 21 | PPU graphics register access
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_128
; Address: $DDA8AE
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_128:
    ORA $1B00            ; 0D 00 1B | Logical OR with accumulator (absolute)
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    BVS $70              ; 70 70 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    JMP $544C            ; 4C 4C 54 | Jump to address
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BEQ $A0              ; F0 A0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $E8              ; F0 E8 | Branch if equal
    BEQ $4C              ; F0 4C | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ASL $E4              ; 06 E4 | Arithmetic shift left (zero page)
    EOR $7C              ; 45 7C | Exclusive OR with accumulator (zero page)
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    ASL $EA8C            ; 0E 8C EA | Arithmetic shift left (absolute)
    INX                  ; E8 | Increment X register
    REP #$55             ; C2 55 | Reset processor status bits
    LDY $5E              ; A4 5E | Load from zero page into Y register
    LDY $F81C            ; AC 1C F8 | Load from absolute address into Y register
    PLX                  ; FA | Pull X register from stack
    SED                  ; F8 | Set decimal mode flag
    PEA #$7C7C           ; F4 7C 7C | Push effective address to stack
    INC $7E              ; E6 7E | Increment (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_129
; Address: $DDA908
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_129:
    JSR $3080            ; 20 80 30 | Jump to subroutine
    BRA $10              ; 80 10 | Branch always
    BNE $00              ; D0 00 | Branch if not equal
    DEY                  ; 88 | Decrement Y register
    BVS $98              ; 70 98 | Branch if overflow set
    BVS $98              ; 70 98 | Branch if overflow set
    BVS $B8              ; 70 B8 | Branch if overflow set
    BVS $70              ; 70 70 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_12B
; Address: $DDA91F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_12B:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $1717            ; 0E 17 17 | Arithmetic shift left (absolute)
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_12C
; Address: $DDA932
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_12C:
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    ORA $280C,Y          ; 19 0C 28 | Logical OR with accumulator (absolute,Y)
    BMI $01              ; 30 01 | Branch if negative

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_12D
; Address: $DDA93E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_12D:
    JSR $9107            ; 20 07 91 | Jump to subroutine
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ASL $3514,X          ; 1E 14 35 | Arithmetic shift left (absolute,X)
    JMP ($206D)          ; 6C 6D 20 | Jump to address (absolute indirect)
    ORA ($20),Y          ; 11 20 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_12E
; Address: $DDA954
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_12E:
    JSR $3401            ; 20 01 34 | Jump to subroutine
    AND ($12,X)          ; 21 12 | Logical AND with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    JMP ($2DA1)          ; 6C A1 2D | Jump to address (absolute indirect)
    LSR $331E,X          ; 5E 1E 33 | Logical shift right (absolute,X)
    ASL $1E27,X          ; 1E 27 1E | Arithmetic shift left (absolute,X)
    INC                  ; 1A | Increment accumulator
    ORA $0F1E            ; 0D 1E 0F | Logical OR with accumulator (absolute)
    AND ($01),Y          ; 31 01 | Logical AND with accumulator ((zero page),Y)
    ADC ($A1,X)          ; 61 A1 | Add with carry ((zero page,X))
    ASL $1200,X          ; 1E 00 12 | Arithmetic shift left (absolute,X)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL $1F00            ; 0E 00 1F | Arithmetic shift left (absolute)
    BPL $10              ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_12F
; Address: $DDA986
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_12F:
    JSR $3020            ; 20 20 30 | Jump to subroutine
    BVS $E8              ; 70 E8 | Branch if overflow set
    INX                  ; E8 | Increment X register
    BRA $F0              ; 80 F0 | Branch always
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    BPL $48              ; 10 48 | Branch if positive
    BMI $98              ; 30 98 | Branch if negative
    BMI $14              ; 30 14 | Branch if negative
    INX                  ; E8 | Increment X register
    BRA $04              ; 80 04 | Branch always
    CPX #$88             ; E0 88 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BRA $F8              ; 80 F8 | Branch always
    REP #$10             ; C2 10 | Reset processor status bits
    CMP ($C0,X)          ; C1 C0 | Compare accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    SEI                  ; 78 | Set interrupt disable flag
    RTI                  ; 40 | Return from interrupt
    DEY                  ; 88 | Decrement Y register
    BEQ $04              ; F0 04 | Branch if equal
    BRA $2C              ; 80 2C | Branch always
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_130
; Address: $DDA9B9
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_130:
    CPY #$84             ; C0 84 | Compare Y register (immediate)
    PHA                  ; 48 | Push accumulator to stack
    TXA                  ; 8A | Transfer X register to accumulator
    TXA                  ; 8A | Transfer X register to accumulator
    RTI                  ; 40 | Return from interrupt
    LDX $B6              ; A6 B6 | Load from zero page into X register
    LDA $62B8,Y          ; B9 B8 62 | Read graphics status
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    CLI                  ; 58 | Clear interrupt disable flag
    BCS $3C              ; B0 3C | Branch if carry set
    SEI                  ; 78 | Set interrupt disable flag
    JMP ($8028)          ; 6C 28 80 | Jump to address (absolute indirect)
    EOR #$A6             ; 49 A6 | Exclusive OR with accumulator (immediate)
    TSX                  ; BA | Transfer stack pointer to X register

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_131
; Address: $DDA9D5
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_131:
    JSR $3000            ; 20 00 30 | Jump to subroutine
    BPL $00              ; 10 00 | Branch if positive
    CLV                  ; B8 | Clear overflow flag
    BRA $38              ; 80 38 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $1717            ; 0E 17 17 | Arithmetic shift left (absolute)
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    ORA $280C,Y          ; 19 0C 28 | Logical OR with accumulator (absolute,Y)
    BMI $01              ; 30 01 | Branch if negative

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_132
; Address: $DDA9FE
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_132:
    JSR $1107            ; 20 07 11 | Jump to subroutine
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ASL $2E2E,X          ; 1E 2E 2E | Arithmetic shift left (absolute,X)
    ROL $1120            ; 2E 20 11 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_133
; Address: $DDAA12
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_133:
    JSR $200F            ; 20 0F 20 | Jump to subroutine
    ORA ($34,X)          ; 01 34 | Logical OR with accumulator ((zero page,X))
    AND ($12,X)          ; 21 12 | Logical AND with accumulator ((zero page,X))
    EOR ($2E),Y          ; 51 2E | Exclusive OR with accumulator ((zero page),Y)
    EOR ($02),Y          ; 51 02 | Exclusive OR with accumulator ((zero page),Y)
    ADC $6D              ; 65 6D | Add with carry (zero page)
    STA $461D,X          ; 9D 1D 46 | Update graphics data
    ORA $1D2E,X          ; 1D 2E 1D | Logical OR with accumulator (absolute,X)
    INC                  ; 1A | Increment accumulator
    ORA $1E3C            ; 0D 3C 1E | Logical OR with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC $22              ; 65 22 | Add with carry (zero page)
    EOR $0420,X          ; 5D 20 04 | Exclusive OR with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ORA $1C01,X          ; 1D 01 1C | Logical OR with accumulator (absolute,X)
    BPL $10              ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_135
; Address: $DDAA4B
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_135:
    INX                  ; E8 | Increment X register
    BRA $F0              ; 80 F0 | Branch always
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    BPL $48              ; 10 48 | Branch if positive
    BMI $98              ; 30 98 | Branch if negative
    BMI $14              ; 30 14 | Branch if negative
    INX                  ; E8 | Increment X register
    BRA $04              ; 80 04 | Branch always
    CPX #$89             ; E0 89 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BRA $F8              ; 80 F8 | Branch always
    BPL $C0              ; 10 C0 | Branch if positive
    CPY #$48             ; C0 48 | Compare Y register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    PLP                  ; 28 | Pull processor status from stack
    LDY $B636            ; AC 36 B6 | Load from absolute address into Y register
    DEY                  ; 88 | Decrement Y register
    BEQ $04              ; F0 04 | Branch if equal
    BRA $2C              ; 80 2C | Branch always
    SEC                  ; 38 | Set carry flag
    CPY #$84             ; C0 84 | Compare Y register (immediate)
    PHA                  ; 48 | Push accumulator to stack
    PLP                  ; 28 | Pull processor status from stack
    EOR #$36             ; 49 36 | Exclusive OR with accumulator (immediate)
    STA $B4              ; 85 B4 | Update graphics data
    PLY                  ; 7A | Pull Y register from stack
    SEI                  ; 78 | Set interrupt disable flag
    CPY $E478            ; CC 78 E4 | Compare Y register (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    CLI                  ; 58 | Clear interrupt disable flag
    BCS $78              ; B0 78 | Branch if carry set
    BEQ $CC              ; F0 CC | Branch if equal
    INY                  ; C8 | Increment Y register
    STY $4880            ; 8C 80 48 | Store Y register to absolute address
    STX $85              ; 86 85 | Store X register to zero page
    SEI                  ; 78 | Set interrupt disable flag
    PHA                  ; 48 | Push accumulator to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_136
; Address: $DDAA99
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_136:
    BPL $00              ; 10 00 | Branch if positive
    BVS $00              ; 70 00 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_137
; Address: $DDAABE
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_137:
    PHP                  ; 08 | Push processor status to stack
    ASL $0606            ; 0E 06 06 | Arithmetic shift left (absolute)
    AND ($04,X)          ; 21 04 | Logical AND with accumulator ((zero page,X))
    ROL $65              ; 26 65 | Rotate left (zero page)
    ADC $08              ; 65 08 | Add with carry (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_138
; Address: $DDAADB
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_138:
    ORA ($59,X)          ; 01 59 | Logical OR with accumulator ((zero page,X))
    TXS                  ; 9A | Transfer X register to stack pointer
    ADC $0C              ; 65 0C | Add with carry (zero page)
    ASL $EB47            ; 0E 47 EB | Arithmetic shift left (absolute)
    ROR $6329,X          ; 7E 29 63 | Rotate right (absolute,X)
    BMI $02              ; 30 02 | Branch if negative
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    BCS $08              ; B0 08 | Branch if carry set
    BCS $06              ; B0 06 | Branch if carry set
    BPL $66              ; 10 66 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    ORA $0100            ; 0D 00 01 | Logical OR with accumulator (absolute)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPX #$E0             ; E0 E0 | Game work RAM access
    CLV                  ; B8 | Clear overflow flag
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    BRA $20              ; 80 20 | Branch always
    CPY #$18             ; C0 18 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_139
; Address: $DDAB1B
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_139:
    JSR $B004            ; 20 04 B0 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    ORA ($F0,X)          ; 01 F0 | Logical OR with accumulator ((zero page,X))
    ORA #$88             ; 09 88 | Logical OR with accumulator (immediate)
    INC                  ; 1A | Increment accumulator
    SEI                  ; 78 | Set interrupt disable flag
    JMP ($9260)          ; 6C 60 92 | Jump to address (absolute indirect)
    STY $3C02            ; 8C 02 3C | Store Y register to absolute address
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SBC #$06             ; E9 06 | Subtract with carry (immediate)
    BVS $0E              ; 70 0E | Branch if overflow set
    STY $18              ; 84 18 | Store Y register to zero page
    BCC $60              ; 90 60 | Branch if carry clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_13B
; Address: $DDAB42
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_13B:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY $C4              ; C4 C4 | Compare Y register (zero page)
    RTI                  ; 40 | Return from interrupt
    CPY #$C6             ; C0 C6 | Compare Y register (immediate)
    CPY $26              ; C4 26 | Compare Y register (zero page)
    CPX $FC              ; E4 FC | Compare X register (zero page)
    SED                  ; F8 | Set decimal mode flag
    BVC $40              ; 50 40 | Branch if overflow clear
    LDX $7884,Y          ; BE 84 78 | Load from absolute,Y into X register
    ASL $FC              ; 06 FC | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_13C
; Address: $DDAB56
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_13C:
    JSL $DC245C          ; 22 5C 24 DC | Jump to subroutine long
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ASL $0606            ; 0E 06 06 | Arithmetic shift left (absolute)
    EOR ($04,X)          ; 41 04 | Exclusive OR with accumulator ((zero page,X))
    LSR $65              ; 46 65 | Logical shift right (zero page)
    ADC $08              ; 65 08 | Add with carry (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    CPY #$02             ; C0 02 | Compare Y register (immediate)
    LDY $01              ; A4 01 | Load from zero page into Y register
    LDA #$04             ; A9 04 | Read graphics status
    TXS                  ; 9A | Transfer X register to stack pointer
    ADC $09              ; 65 09 | Add with carry (zero page)
    AND $2E0E            ; 2D 0E 2E | Logical AND with accumulator (absolute)
    PLA                  ; 68 | Pull accumulator from stack
    PLY                  ; 7A | Pull Y register from stack
    AND ($07),Y          ; 31 07 | Logical AND with accumulator ((zero page),Y)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ORA #$51             ; 09 51 | Logical OR with accumulator (immediate)
    ASL $2810            ; 0E 10 28 | Arithmetic shift left (absolute)
    ROL                  ; 2A | Rotate left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPX #$E0             ; E0 E0 | Game work RAM access
    CLV                  ; B8 | Clear overflow flag
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_13D
; Address: $DDABCF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_13D:
    SED                  ; F8 | Set decimal mode flag
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    BRA $20              ; 80 20 | Branch always
    CPY #$18             ; C0 18 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_13E
; Address: $DDABDB
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_13E:
    JSR $B004            ; 20 04 B0 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    ORA ($F0,X)          ; 01 F0 | Logical OR with accumulator ((zero page,X))
    ORA #$88             ; 09 88 | Logical OR with accumulator (immediate)
    INC                  ; 1A | Increment accumulator
    SEI                  ; 78 | Set interrupt disable flag
    JMP ($9260)          ; 6C 60 92 | Jump to address (absolute indirect)
    STY $3C02            ; 8C 02 3C | Store Y register to absolute address
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SBC #$06             ; E9 06 | Subtract with carry (immediate)
    BVS $0E              ; 70 0E | Branch if overflow set
    STY $18              ; 84 18 | Store Y register to zero page
    BCC $60              ; 90 60 | Branch if carry clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_13F
; Address: $DDABFF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_13F:
    STZ $C42A,X          ; 9E 2A C4 | Store zero to absolute,X
    BVS $E0              ; 70 E0 | Game work RAM access
    BNE $40              ; D0 40 | Branch if not equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_140
; Address: $DDAC07
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_140:
    BRA $E6              ; 80 E6 | Branch always
    CPX $0C              ; E4 0C | Compare X register (zero page)
    PHP                  ; 08 | Push processor status to stack
    DEC $A0C0,X          ; DE C0 A0 | Decrement (absolute,X)
    BRA $00              ; 80 00 | Branch always
    ASL $6804,X          ; 1E 04 68 | Arithmetic shift left (absolute,X)
    JMP ($1C02)          ; 6C 02 1C | Jump to address (absolute indirect)
    INY                  ; C8 | Increment Y register
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_141
; Address: $DDAC1C
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_141:
    JSR $00C0            ; 20 C0 00 | Jump to subroutine
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $031F,Y          ; 19 1F 03 | Logical OR with accumulator (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    ORA $100C,Y          ; 19 0C 10 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_142
; Address: $DDAC3C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_142:
    JSR $2011            ; 20 11 20 | Jump to subroutine
    STA ($1F),Y          ; 91 1F | Update graphics data
    ROL                  ; 2A | Rotate left (accumulator)
    CPX #$0C             ; E0 0C | Compare X register (immediate)
    ADC $20              ; 65 20 | Add with carry (zero page)
    ORA ($02),Y          ; 11 02 | Logical OR with accumulator ((zero page),Y)
    ORA ($02),Y          ; 11 02 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_144
; Address: $DDAC5A
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_144:
    JSR $4A17            ; 20 17 4A | Jump to subroutine
    DEY                  ; 88 | Decrement Y register
    LSR $1C34            ; 4E 34 1C | Logical shift right (absolute)
    BMI $1C              ; 30 1C | Branch if negative
    BIT $181C            ; 2C 1C 18 | Test bits in accumulator (absolute)
    ASL $0F17            ; 0E 17 0F | Arithmetic shift left (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CPY #$17             ; C0 17 | Compare Y register (immediate)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    BPL $10              ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_145
; Address: $DDAC86
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_145:
    JSR $1020            ; 20 20 10 | Jump to subroutine
    BVC $E0              ; 50 E0 | Game work RAM access
    CPX #$98             ; E0 98 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CPY #$F8             ; C0 F8 | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    BPL $48              ; 10 48 | Branch if positive
    BMI $98              ; 30 98 | Branch if negative
    BMI $08              ; 30 08 | Branch if negative
    BNE $04              ; D0 04 | Branch if not equal
    DEY                  ; 88 | Decrement Y register
    CPY #$88             ; C0 88 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ASL $30              ; 06 30 | Arithmetic shift left (zero page)
    AND ($30),Y          ; 31 30 | Logical AND with accumulator ((zero page),Y)
    BEQ $38              ; F0 38 | Branch if equal
    BVS $D4              ; 70 D4 | Branch if overflow set
    JMP ($04AC)          ; 6C AC 04 | Jump to address (absolute indirect)
    DEY                  ; 88 | Decrement Y register
    RTI                  ; 40 | Return from interrupt
    DEY                  ; 88 | Decrement Y register
    RTI                  ; 40 | Return from interrupt
    BPL $88              ; 10 88 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    PLP                  ; 28 | Pull processor status from stack
    BEQ $04              ; F0 04 | Branch if equal
    BEQ $4A              ; F0 4A | Branch if equal
    BEQ $12              ; F0 12 | Branch if equal
    CPX $26A6            ; EC A6 26 | Compare X register (absolute)
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    BVS $7C              ; 70 7C | Branch if overflow set

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_146
; Address: $DDACCB
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_146:
    SEI                  ; 78 | Set interrupt disable flag
    BPL $80              ; 10 80 | Branch if positive
    AND ($EE),Y          ; 31 EE | Logical AND with accumulator ((zero page),Y)
    ORA ($F6,X)          ; 01 F6 | Logical OR with accumulator ((zero page,X))
    INX                  ; E8 | Increment X register
    SED                  ; F8 | Set decimal mode flag
    BCC $00              ; 90 00 | Branch if carry clear
    SED                  ; F8 | Set decimal mode flag
    BRA $38              ; 80 38 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $031F,Y          ; 19 1F 03 | Logical OR with accumulator (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    ORA $100C,Y          ; 19 0C 10 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_147
; Address: $DDACFC
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_147:
    JSR $2011            ; 20 11 20 | Jump to subroutine
    ORA ($1F),Y          ; 11 1F | Logical OR with accumulator ((zero page),Y)
    ROL                  ; 2A | Rotate left (accumulator)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_149
; Address: $DDAD10
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_149:
    JSR $0211            ; 20 11 02 | Jump to subroutine
    ORA ($02),Y          ; 11 02 | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    ORA ($02),Y          ; 11 02 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_14A
; Address: $DDAD1A
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_14A:
    JSR $520F            ; 20 0F 52 | Jump to subroutine
    PHA                  ; 48 | Push accumulator to stack
    ADC $64              ; 65 64 | Add with carry (zero page)
    CLI                  ; 58 | Clear interrupt disable flag
    PHA                  ; 48 | Push accumulator to stack
    BMI $18              ; 30 18 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    ASL $1E3E            ; 0E 3E 1E | Arithmetic shift left (absolute)
    ROL                  ; 2A | Rotate left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STY $8077            ; 8C 77 80 | Store Y register to absolute address
    RTI                  ; 40 | Return from interrupt
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA ($1C,X)          ; 01 1C | Logical OR with accumulator ((zero page,X))
    BPL $10              ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_14B
; Address: $DDAD46
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_14B:
    JSR $1020            ; 20 20 10 | Jump to subroutine
    BVC $E0              ; 50 E0 | Game work RAM access
    CPX #$98             ; E0 98 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CPY #$F8             ; C0 F8 | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_14C
; Address: $DDAD55
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_14C:
    BPL $48              ; 10 48 | Branch if positive
    BMI $98              ; 30 98 | Branch if negative
    BMI $08              ; 30 08 | Branch if negative
    BNE $04              ; D0 04 | Branch if not equal
    DEY                  ; 88 | Decrement Y register
    CPY #$89             ; C0 89 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    DEC $54F8            ; CE F8 54 | Decrement (absolute)
    SED                  ; F8 | Set decimal mode flag
    BMI $30              ; 30 30 | Branch if negative
    BMI $E8              ; 30 E8 | Branch if negative
    SEC                  ; 38 | Set carry flag
    JMP ($46CC)          ; 6C CC 46 | Jump to address (absolute indirect)
    LDX $04              ; A6 04 | Load from zero page into X register
    DEY                  ; 88 | Decrement Y register
    RTI                  ; 40 | Return from interrupt
    DEY                  ; 88 | Decrement Y register
    RTI                  ; 40 | Return from interrupt
    BPL $88              ; 10 88 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    PLP                  ; 28 | Pull processor status from stack
    BEQ $04              ; F0 04 | Branch if equal
    INX                  ; E8 | Increment X register
    CPX $CE11            ; EC 11 CE | Compare X register (absolute)
    PLX                  ; FA | Pull X register from stack
    BIT $0C38            ; 2C 38 0C | Test bits in accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    BVS $E8              ; 70 E8 | Branch if overflow set
    BEQ $FC              ; F0 FC | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BVC $41              ; 50 41 | Branch if overflow clear
    INX                  ; E8 | Increment X register
    INY                  ; C8 | Increment Y register
    BEQ $00              ; F0 00 | Branch if equal
    BCC $00              ; 90 00 | Branch if carry clear
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $101F,X          ; 1D 1F 10 | Logical OR with accumulator (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_14D
; Address: $DDADBC
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_14D:
    JSR $200D            ; 20 0D 20 | Jump to subroutine
    BPL $3C              ; 10 3C | Branch if positive
    BMI $3F              ; 30 3F | Branch if negative

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_14E
; Address: $DDADC4
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_14E:
    BMI $38              ; 30 38 | Branch if negative
    BRA $0F              ; 80 0F | Branch always
    BCC $11              ; 90 11 | Branch if carry clear
    CLI                  ; 58 | Clear interrupt disable flag
    ASL $0636,X          ; 1E 36 06 | Arithmetic shift left (absolute,X)
    EOR #$31             ; 49 31 | Exclusive OR with accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    BVC $20              ; 50 20 | Branch if overflow clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_14F
; Address: $DDADD6
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_14F:
    RTI                  ; 40 | Return from interrupt
    BMI $0E              ; 30 0E | Branch if negative
    BVS $21              ; 70 21 | PPU graphics register access
    CLC                  ; 18 | Clear carry flag
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    ASL $79              ; 06 79 | Arithmetic shift left (zero page)
    AND $02              ; 25 02 | Logical AND with accumulator (zero page)
    STZ $27              ; 64 27 | Store zero to zero page
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ADC $1E21,X          ; 7D 21 1E | Add with carry (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_150
; Address: $DDADF7
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_150:
    DEC                  ; 3A | Decrement accumulator
    BIT $3B              ; 24 3B | Test bits in accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $C0              ; 80 C0 | Branch always
    BRA $20              ; 80 20 | Branch always
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    BPL $E0              ; 10 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_151
; Address: $DDAE20
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_151:
    JSR $E0E0            ; 20 E0 E0 | Game work RAM access
    CPX #$30             ; E0 30 | Compare X register (immediate)
    CPX #$70             ; E0 70 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_153
; Address: $DDAE29
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_153:
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    STY $20              ; 84 20 | Store Y register to zero page
    STZ $A6              ; 64 A6 | Store zero to zero page
    LDX $10              ; A6 10 | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_155
; Address: $DDAE35
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_155:
    JSR $6080            ; 20 80 60 | Jump to subroutine
    ASL $40              ; 06 40 | Arithmetic shift left (zero page)
    ROL                  ; 2A | Rotate left (accumulator)
    BRA $9A              ; 80 9A | Branch always

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_157
; Address: $DDAE40
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_157:
    BMI $D2              ; 30 D2 | Branch if negative
    BVS $E2              ; 70 E2 | Branch if overflow set
    LSR $7E              ; 46 7E | Logical shift right (zero page)
    DEC $EC              ; C6 EC | Decrement (zero page)
    RTI                  ; 40 | Return from interrupt
    BVS $00              ; 70 00 | Branch if overflow set
    ORA $0D10            ; 0D 10 0D | Logical OR with accumulator (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_158
; Address: $DDAE54
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_158:
    PHP                  ; 08 | Push processor status to stack
    ROR $00              ; 66 00 | Rotate right (zero page)
    BPL $C4              ; 10 C4 | Branch if positive
    BCS $00              ; B0 00 | Branch if carry set
    BRA $00              ; 80 00 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $101F,X          ; 1D 1F 10 | Logical OR with accumulator (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_159
; Address: $DDAE7C
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_159:
    JSR $200D            ; 20 0D 20 | Jump to subroutine
    BPL $3C              ; 10 3C | Branch if positive
    BMI $3F              ; 30 3F | Branch if negative
    BMI $38              ; 30 38 | Branch if negative
    BRA $0F              ; 80 0F | Branch always
    BCC $11              ; 90 11 | Branch if carry clear
    CLI                  ; 58 | Clear interrupt disable flag
    ASL $0636,X          ; 1E 36 06 | Arithmetic shift left (absolute,X)
    EOR #$31             ; 49 31 | Exclusive OR with accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    BVC $20              ; 50 20 | Branch if overflow clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_15A
; Address: $DDAE96
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_15A:
    RTI                  ; 40 | Return from interrupt
    BMI $0E              ; 30 0E | Branch if negative
    BVS $21              ; 70 21 | PPU graphics register access
    CLC                  ; 18 | Clear carry flag
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    ASL $79              ; 06 79 | Arithmetic shift left (zero page)
    ASL $0B07            ; 0E 07 0B | Arithmetic shift left (absolute)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    BMI $10              ; 30 10 | Branch if negative
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_15B
; Address: $DDAEB2
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_15B:
    JSR $4016            ; 20 16 40 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_15C
; Address: $DDAEB8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_15C:
    JSR $133F            ; 20 3F 13 | Jump to subroutine
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_15D
; Address: $DDAED2
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_15D:
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $C0              ; 80 C0 | Branch always
    BRA $20              ; 80 20 | Branch always
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    BPL $E0              ; 10 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_15E
; Address: $DDAEE0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_15E:
    JSR $E0E0            ; 20 E0 E0 | Game work RAM access
    CPX #$30             ; E0 30 | Compare X register (immediate)
    CPX #$70             ; E0 70 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_163
; Address: $DDAEF5
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_163:
    JSR $6080            ; 20 80 60 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    AND $80              ; 25 80 | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_164
; Address: $DDAEFD
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_164:
    JSR $A659            ; 20 59 A6 | Jump to subroutine
    BCC $B4              ; 90 B4 | Branch if carry clear
    BVS $74              ; 70 74 | Branch if overflow set
    PEA #$D45E           ; F4 5E D4 | Push effective address to stack
    PHX                  ; DA | Push X register to stack
    CPX $E08C            ; EC 8C E0 | Game work RAM access
    BEQ $E0              ; F0 E0 | Game work RAM access
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_165
; Address: $DDAF0F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_165:
    RTI                  ; 40 | Return from interrupt
    LSR                  ; 4A | Logical shift right (accumulator)
    BCC $8A              ; 90 8A | Branch if carry clear
    BVS $08              ; 70 08 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_166
; Address: $DDAF16
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_166:
    JSR $0054            ; 20 54 00 | Jump to subroutine
    INY                  ; C8 | Increment Y register
    BPL $80              ; 10 80 | Branch if positive
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_167
; Address: $DDAF2A
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_167:
    JSR $2800            ; 20 00 28 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    BVC $10              ; 50 10 | Branch if overflow clear
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BPL $7F              ; 10 7F | Branch if positive
    STZ $24              ; 64 24 | Store zero to zero page
    BMI $10              ; 30 10 | Branch if negative
    INC                  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_168
; Address: $DDAF49
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_168:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BIT $3F              ; 24 3F | Test bits in accumulator (zero page)
    BPL $1F              ; 10 1F | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BCS $03              ; B0 03 | Branch if carry set
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BVC $64              ; 50 64 | Branch if overflow clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_169
; Address: $DDAF74
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_169:
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BMI $00              ; 30 00 | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    BEQ $34              ; F0 34 | Branch if equal

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_16A
; Address: $DDAF89
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_16A:
    JSR $1034            ; 20 34 10 | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $F0              ; F0 F0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_16B
; Address: $DDAF98
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_16B:
    JSR $10FC            ; 20 FC 10 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    INC $FE08,X          ; FE 08 FE | Increment (absolute,X)
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ASL $4408            ; 0E 08 44 | Arithmetic shift left (absolute)
    PHA                  ; 48 | Push accumulator to stack
    CLD                  ; D8 | Clear decimal mode flag
    BNE $68              ; D0 68 | Branch if not equal
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BVC $30              ; 50 30 | Branch if overflow clear
    CLD                  ; D8 | Clear decimal mode flag
    PEA #$F040           ; F4 40 F0 | Push effective address to stack
    CPY #$E0             ; C0 E0 | Game work RAM access
    BMI $00              ; 30 00 | Branch if negative
    DEY                  ; 88 | Decrement Y register
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ROL $E0              ; 26 E0 | Game work RAM access
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    CPY #$70             ; C0 70 | Compare Y register (immediate)
    BPL $60              ; 10 60 | Branch if positive
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_16C
; Address: $DDAFCE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_16C:
    LDY #$00             ; A0 00 | Load immediate value into Y register
    ROL $10              ; 26 10 | Rotate left (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_16D
; Address: $DDAFDF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_16D:
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_16E
; Address: $DDAFEA
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_16E:
    JSR $2800            ; 20 00 28 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    BVC $10              ; 50 10 | Branch if overflow clear
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BPL $7F              ; 10 7F | Branch if positive
    STZ $24              ; 64 24 | Store zero to zero page
    BMI $10              ; 30 10 | Branch if negative
    INC                  ; 1A | Increment accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BIT $3F              ; 24 3F | Test bits in accumulator (zero page)
    BPL $1F              ; 10 1F | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_16F
; Address: $DDB022
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_16F:
    STZ $07              ; 64 07 | Store zero to zero page
    ASL $0608            ; 0E 08 06 | Arithmetic shift left (absolute)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    STZ $08              ; 64 08 | Store zero to zero page
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BMI $00              ; 30 00 | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    BEQ $34              ; F0 34 | Branch if equal

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_170
; Address: $DDB049
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_170:
    JSR $1034            ; 20 34 10 | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $F0              ; F0 F0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_171
; Address: $DDB058
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_171:
    JSR $10FC            ; 20 FC 10 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    INC $FE08,X          ; FE 08 FE | Increment (absolute,X)
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ASL $4408            ; 0E 08 44 | Arithmetic shift left (absolute)
    PHA                  ; 48 | Push accumulator to stack
    CLD                  ; D8 | Clear decimal mode flag
    BNE $68              ; D0 68 | Branch if not equal
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    BVC $30              ; 50 30 | Branch if overflow clear
    PEA #$F040           ; F4 40 F0 | Push effective address to stack
    CPY #$E0             ; C0 E0 | Game work RAM access
    BPL $00              ; 10 00 | Branch if positive
    STY $0200            ; 8C 00 02 | Store Y register to absolute address
    ORA $E6C0            ; 0D C0 E6 | Logical OR with accumulator (absolute)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    BNE $60              ; D0 60 | Branch if not equal
    BEQ $00              ; F0 00 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_172
; Address: $DDB090
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_172:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ROL $20              ; 26 20 | Rotate left (zero page)
    ASL $10              ; 06 10 | Arithmetic shift left (zero page)
    BPL $00              ; 10 00 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_173
; Address: $DDB0A8
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_173:
    ROL $370A            ; 2E 0A 37 | Rotate left (absolute)
    EOR $520D            ; 4D 0D 52 | Exclusive OR with accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $127F            ; 0D 7F 12 | Logical OR with accumulator (absolute)
    EOR ($01,X)          ; 41 01 | Exclusive OR with accumulator ((zero page,X))
    ADC $25              ; 65 25 | Add with carry (zero page)
    ROR $282D            ; 6E 2D 28 | Rotate right (absolute)
    ORA $32              ; 05 32 | Logical OR with accumulator (zero page)
    ROL $3E24,X          ; 3E 24 3E | Rotate left (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    DEC                  ; 3A | Decrement accumulator
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BPL $00              ; 10 00 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    ORA ($3D,X)          ; 01 3D | Logical OR with accumulator ((zero page,X))
    ORA ($07),Y          ; 11 07 | Logical OR with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ASL $18              ; 06 18 | Arithmetic shift left (zero page)
    BPL $18              ; 10 18 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_174
; Address: $DDB106
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_174:
    BMI $20              ; 30 20 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    BPL $18              ; 10 18 | Branch if positive
    BPL $C4              ; 10 C4 | Branch if positive
    CPY #$EC             ; C0 EC | Compare Y register (immediate)
    INX                  ; E8 | Increment X register
    BRA $00              ; 80 00 | Branch always
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BEQ $10              ; F0 10 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BPL $F8              ; 10 F8 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    PLA                  ; 68 | Pull accumulator from stack
    BNE $24              ; D0 24 | Branch if not equal
    CPX #$64             ; E0 64 | Compare X register (immediate)
    LDY #$0C             ; A0 0C | Load immediate value into Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_175
; Address: $DDB12A
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_175:
    JSR $80C0            ; 20 C0 80 | Jump to subroutine
    BRA $60              ; 80 60 | Branch always
    BCC $10              ; 90 10 | Branch if carry clear
    CLC                  ; 18 | Clear carry flag
    BPL $08              ; 10 08 | Branch if positive
    CLI                  ; 58 | Clear interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    BVS $00              ; 70 00 | Branch if overflow set
    PHP                  ; 08 | Push processor status to stack
    CPX $FC50            ; EC 50 FC | Compare X register (absolute)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BRA $C0              ; 80 C0 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_176
; Address: $DDB150
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_176:
    RTI                  ; 40 | Return from interrupt
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ROL $370A            ; 2E 0A 37 | Rotate left (absolute)
    EOR $520D            ; 4D 0D 52 | Exclusive OR with accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $127F            ; 0D 7F 12 | Logical OR with accumulator (absolute)
    EOR ($01,X)          ; 41 01 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_177
; Address: $DDB182
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_177:
    ADC $25              ; 65 25 | Add with carry (zero page)
    ROR $282D            ; 6E 2D 28 | Rotate right (absolute)
    ORA $32              ; 05 32 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ROL $3E24,X          ; 3E 24 3E | Rotate left (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    DEC                  ; 3A | Decrement accumulator
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    ASL $0401            ; 0E 01 04 | Arithmetic shift left (absolute)
    ORA #$07             ; 09 07 | Logical OR with accumulator (immediate)
    ORA $0707            ; 0D 07 07 | Logical OR with accumulator (absolute)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    ORA ($14,X)          ; 01 14 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_178
; Address: $DDB1C6
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_178:
    BMI $20              ; 30 20 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    BPL $18              ; 10 18 | Branch if positive
    BPL $C4              ; 10 C4 | Branch if positive
    CPY #$EC             ; C0 EC | Compare Y register (immediate)
    INX                  ; E8 | Increment X register
    BRA $00              ; 80 00 | Branch always
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BEQ $10              ; F0 10 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BPL $F8              ; 10 F8 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    PLA                  ; 68 | Pull accumulator from stack
    BNE $24              ; D0 24 | Branch if not equal
    CPX #$64             ; E0 64 | Compare X register (immediate)
    LDY #$0C             ; A0 0C | Load immediate value into Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_179
; Address: $DDB1EA
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_179:
    JSR $80C0            ; 20 C0 80 | Jump to subroutine
    BRA $60              ; 80 60 | Branch always
    BRA $10              ; 80 10 | Branch always
    CLC                  ; 18 | Clear carry flag
    BPL $08              ; 10 08 | Branch if positive
    CLI                  ; 58 | Clear interrupt disable flag
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_17B
; Address: $DDB200
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_17B:
    BEQ $20              ; F0 20 | Branch if equal
    BVS $00              ; 70 00 | Branch if overflow set
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$80             ; E0 80 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_17C
; Address: $DDB210
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_17C:
    JSR $0060            ; 20 60 00 | Jump to subroutine
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BIT $2E04            ; 2C 04 2E | Test bits in accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $7D              ; 10 7D | Branch if positive
    ROR $27              ; 66 27 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_17D
; Address: $DDB246
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_17D:
    JSR $1C15            ; 20 15 1C | Jump to subroutine
    ASL $0312            ; 0E 12 03 | Arithmetic shift left (absolute)
    ORA $08              ; 05 08 | Logical OR with accumulator (zero page)
    ASL $2411            ; 0E 11 24 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_17E
; Address: $DDB252
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_17E:
    JSR $0838            ; 20 38 08 | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_17F
; Address: $DDB262
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_17F:
    STZ $07              ; 64 07 | Store zero to zero page
    ASL $0B09            ; 0E 09 0B | Arithmetic shift left (absolute)
    ASL $0208            ; 0E 08 02 | Arithmetic shift left (absolute)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ROR $08              ; 66 08 | Rotate right (zero page)
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_180
; Address: $DDB286
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_180:
    BPL $00              ; 10 00 | Branch if positive
    DEY                  ; 88 | Decrement Y register
    BRA $08              ; 80 08 | Branch always
    BPL $0C              ; 10 0C | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $80              ; F0 80 | Branch if equal
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_181
; Address: $DDB29B
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_181:
    SED                  ; F8 | Set decimal mode flag
    BPL $FC              ; 10 FC | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    CPY $6CC8            ; CC C8 6C | Compare Y register (absolute)
    INX                  ; E8 | Increment X register
    PLA                  ; 68 | Pull accumulator from stack
    LDY #$08             ; A0 08 | Load immediate value into Y register
    LDY #$30             ; A0 30 | Load immediate value into Y register
    CPX #$48             ; E0 48 | Compare X register (immediate)
    CPY #$A0             ; C0 A0 | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    BVS $8C              ; 70 8C | Branch if overflow set
    PHA                  ; 48 | Push accumulator to stack
    SEI                  ; 78 | Set interrupt disable flag
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_183
; Address: $DDB2BF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_183:
    JSR $02F7            ; 20 F7 02 | Jump to subroutine
    ORA $66C0            ; 0D C0 66 | Logical OR with accumulator (absolute)
    LDY #$C0             ; A0 C0 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_184
; Address: $DDB2C7
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_184:
    JSR $60D0            ; 20 D0 60 | Jump to subroutine
    BEQ $00              ; F0 00 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_185
; Address: $DDB2D0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_185:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ROR $20              ; 66 20 | Rotate right (zero page)
    ASL $10              ; 06 10 | Arithmetic shift left (zero page)
    BPL $00              ; 10 00 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_186
; Address: $DDB2E8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_186:
    BIT $2E04            ; 2C 04 2E | Test bits in accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $7D              ; 10 7D | Branch if positive
    ROR $27              ; 66 27 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_187
; Address: $DDB306
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_187:
    JSR $1C15            ; 20 15 1C | Jump to subroutine
    ASL $0312            ; 0E 12 03 | Arithmetic shift left (absolute)
    ORA $18              ; 05 18 | Logical OR with accumulator (zero page)
    ASL $2431            ; 0E 31 24 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_188
; Address: $DDB312
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_188:
    JSR $0838            ; 20 38 08 | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_189
; Address: $DDB31C
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_189:
    JSL $044000          ; 22 00 40 04 | Jump to subroutine long
    RTI                  ; 40 | Return from interrupt
    BCS $03              ; B0 03 | Branch if carry set
    ROR $05              ; 66 05 | Rotate right (zero page)
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BVC $66              ; 50 66 | Branch if overflow clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_18B
; Address: $DDB336
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_18B:
    PHP                  ; 08 | Push processor status to stack
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_18C
; Address: $DDB346
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_18C:
    BPL $00              ; 10 00 | Branch if positive
    DEY                  ; 88 | Decrement Y register
    BRA $08              ; 80 08 | Branch always
    BPL $0C              ; 10 0C | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $80              ; F0 80 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BPL $FC              ; 10 FC | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    CPY $6CC8            ; CC C8 6C | Compare Y register (absolute)
    INX                  ; E8 | Increment X register
    PLA                  ; 68 | Pull accumulator from stack
    LDY #$08             ; A0 08 | Load immediate value into Y register
    LDY #$30             ; A0 30 | Load immediate value into Y register
    CPX #$48             ; E0 48 | Compare X register (immediate)
    CPY #$A0             ; C0 A0 | Compare Y register (immediate)
    BPL $70              ; 10 70 | Branch if positive
    DEY                  ; 88 | Decrement Y register
    PHA                  ; 48 | Push accumulator to stack
    SEI                  ; 78 | Set interrupt disable flag
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_18D
; Address: $DDB374
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_18D:
    JSR $5030            ; 20 30 50 | Jump to subroutine
    BMI $00              ; 30 00 | Branch if negative
    PHA                  ; 48 | Push accumulator to stack
    ASL $20              ; 06 20 | Arithmetic shift left (zero page)
    ROL $E0              ; 26 E0 | Game work RAM access
    BVS $90              ; 70 90 | Branch if overflow set
    BNE $30              ; D0 30 | Branch if not equal
    CPY #$70             ; C0 70 | Compare Y register (immediate)
    BPL $40              ; 10 40 | Branch if positive
    BEQ $00              ; F0 00 | Branch if equal
    LDY #$00             ; A0 00 | Load immediate value into Y register
    ROR $10              ; 66 10 | Rotate right (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BRA $20              ; 80 20 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_18E
; Address: $DDB39F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_18E:
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $1A04            ; 0D 04 1A | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_18F
; Address: $DDB3AA
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_18F:
    ASL $340A,X          ; 1E 0A 34 | Arithmetic shift left (absolute,X)
    BPL $30              ; 10 30 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $3F              ; 10 3F | Branch if positive
    BPL $3F              ; 10 3F | Branch if positive
    ROL $320E            ; 2E 0E 32 | Rotate left (absolute)
    BPL $05              ; 10 05 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    ORA ($3B),Y          ; 11 3B | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    ORA $1118,Y          ; 19 18 11 | Logical OR with accumulator (absolute,Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $1000            ; 0E 00 10 | Arithmetic shift left (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $10              ; 10 10 | Branch if positive
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BPL $12              ; 10 12 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $C0              ; F0 C0 | Branch if equal
    CLC                  ; 18 | Clear carry flag
    BPL $6C              ; 10 6C | Branch if positive
    PLA                  ; 68 | Pull accumulator from stack
    BMI $96              ; 30 96 | Branch if negative
    WDM #$40             ; 42 40 | Reserved instruction
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BEQ $10              ; F0 10 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    PLA                  ; 68 | Pull accumulator from stack
    BMI $FC              ; 30 FC | Branch if negative
    INC $FE40,X          ; FE 40 FE | Increment (absolute,X)
    WDM #$40             ; 42 40 | Reserved instruction
    LDX $A4              ; A6 A4 | Load from zero page into X register
    LDY #$4C             ; A0 4C | Load immediate value into Y register
    INY                  ; C8 | Increment Y register
    SEC                  ; 38 | Set carry flag
    BMI $F0              ; 30 F0 | Branch if negative
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BEQ $40              ; F0 40 | Branch if equal
    LDY $FC              ; A4 FC | Load from zero page into Y register
    JMP $281840          ; 5C 40 18 28 | Jump to address long
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_190
; Address: $DDB43A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_190:
    BEQ $30              ; F0 30 | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    BRA $BC              ; 80 BC | Branch always
    PHA                  ; 48 | Push accumulator to stack
    SEC                  ; 38 | Set carry flag
    CPY #$E0             ; C0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_191
; Address: $DDB447
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_191:
    JSR $E088            ; 20 88 E0 | Game work RAM access
    CLC                  ; 18 | Clear carry flag
    BNE $90              ; D0 90 | Branch if not equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_192
; Address: $DDB451
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_192:
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_193
; Address: $DDB45A
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_193:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    LDY #$00             ; A0 00 | Load immediate value into Y register
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $1A04            ; 0D 04 1A | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    ASL $340A,X          ; 1E 0A 34 | Arithmetic shift left (absolute,X)
    BPL $30              ; 10 30 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $3F              ; 10 3F | Branch if positive
    BPL $3F              ; 10 3F | Branch if positive
    ROL $320E            ; 2E 0E 32 | Rotate left (absolute)
    BPL $05              ; 10 05 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA ($3B),Y          ; 11 3B | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    ORA $1118,Y          ; 19 18 11 | Logical OR with accumulator (absolute,Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $0300            ; 0E 00 03 | Arithmetic shift left (absolute)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $C0              ; F0 C0 | Branch if equal
    CLC                  ; 18 | Clear carry flag
    BPL $6C              ; 10 6C | Branch if positive

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_194
; Address: $DDB4C9
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_194:
    PLA                  ; 68 | Pull accumulator from stack
    BMI $96              ; 30 96 | Branch if negative
    WDM #$40             ; 42 40 | Reserved instruction
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BEQ $10              ; F0 10 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    PLA                  ; 68 | Pull accumulator from stack
    BMI $FC              ; 30 FC | Branch if negative
    INC $FE40,X          ; FE 40 FE | Increment (absolute,X)
    WDM #$40             ; 42 40 | Reserved instruction
    LDX $A4              ; A6 A4 | Load from zero page into X register
    LDY #$4C             ; A0 4C | Load immediate value into Y register
    INY                  ; C8 | Increment Y register
    SEC                  ; 38 | Set carry flag
    BMI $50              ; 30 50 | Branch if negative
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    LDY #$40             ; A0 40 | Load immediate value into Y register
    LDY $FC              ; A4 FC | Load from zero page into Y register
    JMP $281840          ; 5C 40 18 28 | Jump to address long
    CLC                  ; 18 | Clear carry flag
    BEQ $30              ; F0 30 | Branch if equal

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_195
; Address: $DDB4FC
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_195:
    JSR $5000            ; 20 00 50 | Jump to subroutine
    BPL $70              ; 10 70 | Branch if positive
    BRA $20              ; 80 20 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BNE $40              ; D0 40 | Branch if not equal
    BCC $E0              ; 90 E0 | Game work RAM access
    BCS $E0              ; B0 E0 | Game work RAM access
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_196
; Address: $DDB510
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_196:
    DEY                  ; 88 | Decrement Y register
    BVC $80              ; 50 80 | Branch if overflow clear
    BPL $80              ; 10 80 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $04              ; 80 04 | Branch always
    ORA $5F00,X          ; 1D 00 5F | Logical OR with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    AND ($7F,X)          ; 21 7F | Logical AND with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA $21              ; 05 21 | PPU graphics register access
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BPL $0A              ; 10 0A | Branch if positive
    CLC                  ; 18 | Clear carry flag
    CLI                  ; 58 | Clear interrupt disable flag
    STA                  ; 9F 6B 00 1E | Update graphics data

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_197
; Address: $DDB554
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_197:
    BPL $02              ; 10 02 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    BPL $6C              ; 10 6C | Branch if positive
    SEC                  ; 38 | Set carry flag
    CLD                  ; D8 | Clear decimal mode flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_198
; Address: $DDB560
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_198:
    STA $36CE65          ; 8F 65 CE 36 | Update graphics data
    LDX $26              ; A6 26 | Load from zero page into X register
    LDX $26              ; A6 26 | Load from zero page into X register
    SEC                  ; 38 | Set carry flag
    EOR $57              ; 45 57 | Exclusive OR with accumulator (zero page)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ROL $7F              ; 26 7F | Rotate left (zero page)
    ROL $7F              ; 26 7F | Rotate left (zero page)
    BVC $00              ; 50 00 | Branch if overflow clear
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    BRA $F8              ; 80 F8 | Branch always
    RTI                  ; 40 | Return from interrupt
    BCC $FC              ; 90 FC | Branch if carry clear
    DEY                  ; 88 | Decrement Y register
    BRA $C0              ; 80 C0 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_199
; Address: $DDB59B
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_199:
    BVC $90              ; 50 90 | Branch if overflow clear
    CLV                  ; B8 | Clear overflow flag
    DEY                  ; 88 | Decrement Y register
    CLD                  ; D8 | Clear decimal mode flag
    CPX $1818            ; EC 18 18 | Compare X register (absolute)
    BVS $F0              ; 70 F0 | Branch if overflow set
    BRA $E2              ; 80 E2 | Branch always
    PHP                  ; 08 | Push processor status to stack
    BVC $D6              ; 50 D6 | Branch if overflow clear
    INY                  ; C8 | Increment Y register
    CLC                  ; 18 | Clear carry flag
    SBC #$EA             ; E9 EA | Subtract with carry (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    BEQ $88              ; F0 88 | Branch if equal
    CPX #$1C             ; E0 1C | Compare X register (immediate)
    PHA                  ; 48 | Push accumulator to stack
    ASL $FFCB,X          ; 1E CB FF | Arithmetic shift left (absolute,X)
    NOP                  ; EA | No operation
    INC $88CB,X          ; FE CB 88 | Increment (absolute,X)
    WDM #$49             ; 42 49 | Reserved instruction
    PHA                  ; 48 | Push accumulator to stack
    AND #$28             ; 29 28 | Logical AND with accumulator (immediate)
    AND $24              ; 25 24 | Logical AND with accumulator (zero page)
    BIT $7800            ; 2C 00 78 | Test bits in accumulator (absolute)
    DEY                  ; 88 | Decrement Y register
    INC $FE42,X          ; FE 42 FE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_19A
; Address: $DDB5D4
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_19A:
    PHA                  ; 48 | Push accumulator to stack
    INC $FE28,X          ; FE 28 FE | Increment (absolute,X)
    BIT $FE              ; 24 FE | Test bits in accumulator (zero page)
    BPL $E0              ; 10 E0 | Game work RAM access
    PHP                  ; 08 | Push processor status to stack
    LSR $00              ; 46 00 | Logical shift right (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA $0E04,Y          ; 19 04 0E | Logical OR with accumulator (absolute,Y)
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BPL $4A              ; 10 4A | Branch if positive
    CLC                  ; 18 | Clear carry flag
    CLD                  ; D8 | Clear decimal mode flag
    ASL $0F00,X          ; 1E 00 0F | Arithmetic shift left (absolute,X)
    BPL $02              ; 10 02 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    BPL $2C              ; 10 2C | Branch if positive
    SEC                  ; 38 | Set carry flag
    CLD                  ; D8 | Clear decimal mode flag
    CMP $96              ; C5 96 | Compare accumulator (zero page)
    ROR $E6              ; 66 E6 | Rotate right (zero page)
    ASL $82              ; 06 82 | Arithmetic shift left (zero page)
    TXA                  ; 8A | Transfer X register to accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    NOP                  ; EA | No operation
    ASL $8500,X          ; 1E 00 85 | Arithmetic shift left (absolute,X)
    LDA $060F06          ; AF 06 0F 06 | Read graphics status
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BNE $00              ; D0 00 | Branch if not equal
    SED                  ; F8 | Set decimal mode flag
    BRA $F8              ; 80 F8 | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_19B
; Address: $DDB64D
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_19B:
    JSR $90FC            ; 20 FC 90 | Jump to subroutine
    BRA $C0              ; 80 C0 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BVC $20              ; 50 20 | Branch if overflow clear
    CLV                  ; B8 | Clear overflow flag
    BCC $D8              ; 90 D8 | Branch if carry clear
    CPX $1818            ; EC 18 18 | Compare X register (absolute)
    BVS $F0              ; 70 F0 | Branch if overflow set
    BRA $E4              ; 80 E4 | Branch always
    PHP                  ; 08 | Push processor status to stack
    CMP #$CA             ; C9 CA | Compare accumulator (immediate)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_19C
; Address: $DDB66D
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_19C:
    INC                  ; 1A | Increment accumulator
    SED                  ; F8 | Set decimal mode flag
    PHX                  ; DA | Push X register to stack
    CLD                  ; D8 | Clear decimal mode flag
    BEQ $88              ; F0 88 | Branch if equal
    CPX #$18             ; E0 18 | Compare X register (immediate)
    PHA                  ; 48 | Push accumulator to stack
    DEX                  ; CA | Decrement X register
    INC $FE1B,X          ; FE 1B FE | Increment (absolute,X)
    INC $AAEB,X          ; FE EB AA | Increment (absolute,X)
    ADC #$68             ; 69 68 | Add with carry (immediate)
    EOR $44              ; 45 44 | Exclusive OR with accumulator (zero page)
    AND $24              ; 25 24 | Logical AND with accumulator (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    INC $FE68,X          ; FE 68 FE | Increment (absolute,X)
    INC $FE24,X          ; FE 24 FE | Increment (absolute,X)
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    ORA #$3F             ; 09 3F | Logical OR with accumulator (immediate)
    ROL $0001,X          ; 3E 01 00 | Rotate left (absolute,X)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA #$19             ; 09 19 | Logical OR with accumulator (immediate)
    ORA $0704            ; 0D 04 07 | Logical OR with accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    ASL $020C            ; 0E 0C 02 | Arithmetic shift left (absolute)
    ASL $0601            ; 0E 01 06 | Arithmetic shift left (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $16              ; 05 16 | Logical OR with accumulator (zero page)
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    BPL $17              ; 10 17 | Branch if positive
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA $3918,X          ; 1D 18 39 | Logical OR with accumulator (absolute,X)
    AND $0B15,X          ; 3D 15 0B | Logical AND with accumulator (absolute,X)
    BIT $3033            ; 2C 33 30 | Test bits in accumulator (absolute)
    PLP                  ; 28 | Pull processor status from stack
    BMI $32              ; 30 32 | Branch if negative
    AND #$1B             ; 29 1B | Logical AND with accumulator (immediate)
    ORA $0701,X          ; 1D 01 07 | Logical OR with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    PLA                  ; 68 | Pull accumulator from stack
    BMI $70              ; 30 70 | Branch if negative
    AND $306A            ; 2D 6A 30 | Logical AND with accumulator (absolute)
    AND $0F7D,Y          ; 39 7D 0F | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_19E
; Address: $DDB6FD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_19E:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BVS $00              ; 70 00 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_19F
; Address: $DDB707
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_19F:
    JSR $90F8            ; 20 F8 90 | Jump to subroutine
    CPX #$80             ; E0 80 | Compare X register (immediate)
    STY $0454            ; 8C 54 04 | Store Y register to absolute address
    STZ $0000            ; 9C 00 00 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1A0
; Address: $DDB715
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1A0:
    JSR $3020            ; 20 20 30 | Jump to subroutine
    BCC $D0              ; 90 D0 | Branch if carry clear
    STY $F8              ; 84 F8 | Store Y register to zero page
    CPX #$1C             ; E0 1C | Compare X register (immediate)
    CPX #$A8             ; E0 A8 | Compare X register (immediate)
    CLV                  ; B8 | Clear overflow flag
    BCS $D0              ; B0 D0 | Branch if carry set
    PHP                  ; 08 | Push processor status to stack
    BNE $08              ; D0 08 | Branch if not equal
    BCS $10              ; B0 10 | Branch if carry set
    CPX #$40             ; E0 40 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDY #$80             ; A0 80 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1A3
; Address: $DDB73A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1A3:
    JSR $1080            ; 20 80 10 | Jump to subroutine
    LDY #$10             ; A0 10 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1A4
; Address: $DDB740
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1A4:
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    BCC $60              ; 90 60 | Branch if carry clear
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BMI $C0              ; 30 C0 | Branch if negative
    BVS $80              ; 70 80 | Branch if overflow set
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $C0              ; 80 C0 | Branch always
    BPL $60              ; 10 60 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1A5
; Address: $DDB755
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1A5:
    BMI $E0              ; 30 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ROR $00              ; 66 00 | Rotate right (zero page)
    STA                  ; 9F 03 7F 00 | Update graphics data
    PHP                  ; 08 | Push processor status to stack
    ROR $0015,X          ; 7E 15 00 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1A6
; Address: $DDB779
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1A6:
    ORA $0D08,Y          ; 19 08 0D | Logical OR with accumulator (absolute,Y)
    SEC                  ; 38 | Set carry flag
    ASL $020C            ; 0E 0C 02 | Arithmetic shift left (absolute)
    ASL $0601            ; 0E 01 06 | Arithmetic shift left (absolute)
    ORA $0302            ; 0D 02 03 | Logical OR with accumulator (absolute)
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL $1F              ; 06 1F | Arithmetic shift left (zero page)
    ASL $0E3E            ; 0E 3E 0E | Arithmetic shift left (absolute)
    ROL $140B,X          ; 3E 0B 14 | Rotate left (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND #$2C             ; 29 2C | Logical AND with accumulator (immediate)
    BMI $35              ; 30 35 | Branch if negative
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    ORA $0F              ; 05 0F | Logical OR with accumulator (zero page)
    PLP                  ; 28 | Pull processor status from stack
    PLA                  ; 68 | Pull accumulator from stack
    ADC ($38),Y          ; 71 38 | Add with carry ((zero page),Y)
    PLY                  ; 7A | Pull Y register from stack
    PHP                  ; 08 | Push processor status to stack
    ROR                  ; 6A | Rotate right (accumulator)
    ORA #$21             ; 09 21 | PPU graphics register access
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BVS $20              ; 70 20 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    BPL $F8              ; 10 F8 | Branch if positive
    BRA $E0              ; 80 E0 | Game work RAM access
    BRA $8C              ; 80 8C | Branch always
    STZ $0000            ; 9C 00 00 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1A7
; Address: $DDB7D4
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1A7:
    JSR $1020            ; 20 20 10 | Jump to subroutine
    BMI $80              ; 30 80 | Branch if negative
    BNE $84              ; D0 84 | Branch if not equal
    SED                  ; F8 | Set decimal mode flag
    CPX #$1C             ; E0 1C | Compare X register (immediate)
    CPX #$A8             ; E0 A8 | Compare X register (immediate)
    CLV                  ; B8 | Clear overflow flag
    BCS $D0              ; B0 D0 | Branch if carry set
    PHP                  ; 08 | Push processor status to stack
    BNE $08              ; D0 08 | Branch if not equal
    BCS $10              ; B0 10 | Branch if carry set
    CPX #$00             ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1A8
; Address: $DDB7EC
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1A8:
    JSR $2080            ; 20 80 20 | Jump to subroutine
    CPY #$48             ; C0 48 | Compare Y register (immediate)
    BCC $08              ; 90 08 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1AA
; Address: $DDB7FA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1AA:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BPL $C0              ; 10 C0 | Branch if positive
    BPL $C0              ; 10 C0 | Branch if positive
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1AB
; Address: $DDB801
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1AB:
    JSR $E090            ; 20 90 E0 | Game work RAM access
    RTI                  ; 40 | Return from interrupt
    BRA $B0              ; 80 B0 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    BCC $20              ; 90 20 | Branch if carry clear
    BCS $20              ; B0 20 | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1AC
; Address: $DDB810
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1AC:
    BPL $A0              ; 10 A0 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1AE
; Address: $DDB818
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1AE:
    BEQ $D0              ; F0 D0 | Branch if equal
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    ROL $3C02,X          ; 3E 02 3C | Rotate left (absolute,X)
    ORA #$30             ; 09 30 | Logical OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA #$1E             ; 09 1E | Logical OR with accumulator (immediate)
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ORA $0608            ; 0D 08 06 | Logical OR with accumulator (absolute)
    ORA ($37,X)          ; 01 37 | Logical OR with accumulator ((zero page,X))
    JMP $18250F          ; 5C 0F 25 18 | Jump to address long
    PLP                  ; 28 | Pull processor status from stack
    BPL $02              ; 10 02 | Branch if positive
    AND ($38),Y          ; 31 38 | Logical AND with accumulator ((zero page),Y)
    PHA                  ; 48 | Push accumulator to stack
    EOR #$B4             ; 49 B4 | Exclusive OR with accumulator (immediate)
    JMP $00B7            ; 4C B7 00 | Jump to address
    LDA                  ; BF B2 6F 9C | Read graphics status
    PHP                  ; 08 | Push processor status to stack
    LDX $09              ; A6 09 | Load from zero page into X register
    ROR $09              ; 66 09 | Rotate right (zero page)
    ORA ($04),Y          ; 11 04 | Logical OR with accumulator ((zero page),Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    CMP #$1F             ; C9 1F | Compare accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    STY $00              ; 84 00 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1B1
; Address: $DDB889
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1B1:
    JSR $207C            ; 20 7C 20 | Jump to subroutine
    ROL $0E84,X          ; 3E 84 0E | Rotate left (absolute,X)
    BEQ $00              ; F0 00 | Branch if equal
    BMI $20              ; 30 20 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1B2
; Address: $DDB89A
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1B2:
    JSR $84E0            ; 20 E0 84 | Jump to subroutine
    BRA $78              ; 80 78 | Branch always
    CLD                  ; D8 | Clear decimal mode flag
    PHA                  ; 48 | Push accumulator to stack
    TAY                  ; A8 | Transfer accumulator to Y register
    CLC                  ; 18 | Clear carry flag
    BCS $10              ; B0 10 | Branch if carry set
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BNE $48              ; D0 48 | Branch if not equal
    BMI $94              ; 30 94 | Branch if negative
    INX                  ; E8 | Increment X register
    SEC                  ; 38 | Set carry flag
    PEA #$1824           ; F4 24 18 | Push effective address to stack
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    STZ $2E3A            ; 9C 3A 2E | Store zero to absolute
    SBC $F506            ; ED 06 F5 | Subtract with carry (absolute)
    PHA                  ; 48 | Push accumulator to stack
    PEA #$E03A           ; F4 3A E0 | Game work RAM access
    STZ $12              ; 64 12 | Store zero to zero page
    REP #$34             ; C2 34 | Reset processor status bits
    CPY #$64             ; C0 64 | Compare Y register (immediate)
    BCC $48              ; 90 48 | Branch if carry clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1B4
; Address: $DDB8D3
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1B4:
    SBC ($18,X)          ; E1 18 | Subtract with carry ((zero page,X))
    STA ($F8),Y          ; 91 F8 | Update graphics data
    SBC ($F8),Y          ; F1 F8 | Subtract with carry ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    BCC $02              ; 90 02 | Branch if carry clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1B5
; Address: $DDB8E2
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1B5:
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    ORA #$30             ; 09 30 | Logical OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA #$1E             ; 09 1E | Logical OR with accumulator (immediate)
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ORA $0608            ; 0D 08 06 | Logical OR with accumulator (absolute)
    EOR ($0F),Y          ; 51 0F | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1B6
; Address: $DDB90E
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1B6:
    LDY $256F,X          ; BC 6F 25 | Load from absolute,X into Y register
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    BPL $02              ; 10 02 | Branch if positive
    BMI $01              ; 30 01 | Branch if negative
    PHA                  ; 48 | Push accumulator to stack
    BMI $49              ; 30 49 | Branch if negative
    LDA                  ; BF 00 0F 92 | Read graphics status
    LDY $9617            ; AC 17 96 | Load from absolute address into Y register
    PHP                  ; 08 | Push processor status to stack
    JMP $0C03            ; 4C 03 0C | Jump to address
    ROL $09              ; 26 09 | Rotate left (zero page)
    ASL $1D              ; 06 1D | Arithmetic shift left (zero page)
    ASL $0C              ; 06 0C | Arithmetic shift left (zero page)
    BPL $D7              ; 10 D7 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    CMP #$3F             ; C9 3F | Compare accumulator (immediate)
    ORA #$40             ; 09 40 | Logical OR with accumulator (immediate)
    ASL $10              ; 06 10 | Arithmetic shift left (zero page)
    BRA $FA              ; 80 FA | Branch always
    BPL $7E              ; 10 7E | Branch if positive

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1B7
; Address: $DDB94B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1B7:
    JSR $803C            ; 20 3C 80 | Jump to subroutine
    ASL $00F4            ; 0E F4 00 | Arithmetic shift left (absolute)
    BRA $88              ; 80 88 | Branch always
    BPL $30              ; 10 30 | Branch if positive

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1B8
; Address: $DDB95A
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1B8:
    JSR $80E0            ; 20 E0 80 | Jump to subroutine
    PLA                  ; 68 | Pull accumulator from stack
    STY $7C              ; 84 7C | Store Y register to zero page
    CLD                  ; D8 | Clear decimal mode flag
    PHA                  ; 48 | Push accumulator to stack
    TAY                  ; A8 | Transfer accumulator to Y register
    CLC                  ; 18 | Clear carry flag
    BCS $10              ; B0 10 | Branch if carry set
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BNE $48              ; D0 48 | Branch if not equal
    BMI $94              ; 30 94 | Branch if negative
    INX                  ; E8 | Increment X register
    BEQ $24              ; F0 24 | Branch if equal
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    STZ $2E3B            ; 9C 3B 2E | Store zero to absolute
    SBC $F506            ; ED 06 F5 | Subtract with carry (absolute)
    PHA                  ; 48 | Push accumulator to stack
    PEA #$E038           ; F4 38 E0 | Game work RAM access
    PLA                  ; 68 | Pull accumulator from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1BB
; Address: $DDB98B
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1BB:
    JSR $20F8            ; 20 F8 20 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    ASL $E1              ; 06 E1 | Arithmetic shift left (zero page)
    INC $F8F5,X          ; FE F5 F8 | Increment (absolute,X)
    SBC ($50),Y          ; F1 50 | Subtract with carry ((zero page),Y)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $1F00            ; 0E 00 1F | Arithmetic shift left (absolute)
    ORA #$07             ; 09 07 | Logical OR with accumulator (immediate)
    ORA ($31,X)          ; 01 31 | Logical OR with accumulator ((zero page,X))
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1BC
; Address: $DDB9AE
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1BC:
    JSR $0039            ; 20 39 00 | Jump to subroutine
    ORA #$0B             ; 09 0B | Logical OR with accumulator (immediate)
    AND ($1F,X)          ; 21 1F | Logical AND with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    ORA $0B0D,X          ; 1D 0D 0B | Logical OR with accumulator (absolute,X)
    BPL $0B              ; 10 0B | Branch if positive
    BPL $0D              ; 10 0D | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BPL $20              ; 10 20 | Branch if positive
    BPL $63              ; 10 63 | Branch if positive
    BVC $07              ; 50 07 | Branch if overflow clear
    ORA #$10             ; 09 10 | Logical OR with accumulator (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1BD
; Address: $DDB9DE
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1BD:
    PHP                  ; 08 | Push processor status to stack
    PLA                  ; 68 | Pull accumulator from stack
    RTI                  ; 40 | Return from interrupt
    ASL $0F01,X          ; 1E 01 0F | Arithmetic shift left (absolute,X)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    LDX #$00             ; A2 00 | Load immediate value into X register
    JMP ($FC00)          ; 6C 00 FC | Jump to address (absolute indirect)
    PLX                  ; FA | Pull X register from stack
    BRA $FC              ; 80 FC | Branch always
    BCC $FC              ; 90 FC | Branch if carry clear

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1C0
; Address: $DDBA1A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1C0:
    JSR $20B0            ; 20 B0 20 | Jump to subroutine
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $1C              ; F0 1C | Branch if equal
    INX                  ; E8 | Increment X register
    PLA                  ; 68 | Pull accumulator from stack
    BVS $30              ; 70 30 | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    BVS $80              ; 70 80 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1C1
; Address: $DDBA28
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1C1:
    RTI                  ; 40 | Return from interrupt
    BMI $C0              ; 30 C0 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    BEQ $24              ; F0 24 | Branch if equal
    CLD                  ; D8 | Clear decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    INX                  ; E8 | Increment X register
    BRA $30              ; 80 30 | Branch always
    BRA $20              ; 80 20 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1C2
; Address: $DDBA38
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1C2:
    BRA $30              ; 80 30 | Branch always
    BVS $F8              ; 70 F8 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    PHY                  ; 5A | Push Y register to stack
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1C3
; Address: $DDBA40
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1C3:
    JSR $92DE            ; 20 DE 92 | Jump to subroutine
    CPX $F00C            ; EC 0C F0 | Compare X register (absolute)
    BEQ $08              ; F0 08 | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    BEQ $98              ; F0 98 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1C4
; Address: $DDBA4C
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1C4:
    SED                  ; F8 | Set decimal mode flag
    BRA $C0              ; 80 C0 | Branch always
    CLD                  ; D8 | Clear decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    PLA                  ; 68 | Pull accumulator from stack
    INX                  ; E8 | Increment X register
    BEQ $F2              ; F0 F2 | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    ASL $FEF8            ; 0E F8 FE | Arithmetic shift left (absolute)
    BEQ $F6              ; F0 F6 | Branch if equal
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $1F04            ; 0E 04 1F | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($31,X)          ; 01 31 | Logical OR with accumulator ((zero page,X))
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1C5
; Address: $DDBA6E
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1C5:
    JSR $0039            ; 20 39 00 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    ORA ($0B,X)          ; 01 0B | Logical OR with accumulator ((zero page,X))
    AND ($1F,X)          ; 21 1F | Logical AND with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    ORA $0B0D,X          ; 1D 0D 0B | Logical OR with accumulator (absolute,X)
    BPL $0B              ; 10 0B | Branch if positive
    BPL $0D              ; 10 0D | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA #$10             ; 09 10 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1C6
; Address: $DDBAA0
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1C6:
    PLP                  ; 28 | Pull processor status from stack
    BMI $17              ; 30 17 | Branch if negative
    BPL $3C              ; 10 3C | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA ($04),Y          ; 11 04 | Logical OR with accumulator ((zero page),Y)
    ORA $0604            ; 0D 04 06 | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    BCC $00              ; 90 00 | Branch if carry clear
    ROR $00              ; 66 00 | Rotate right (zero page)
    SBC $FEC0,Y          ; F9 C0 FE | Subtract with carry (absolute,Y)
    BPL $F8              ; 10 F8 | Branch if positive

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1C8
; Address: $DDBAD5
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1C8:
    JSR $C0C0            ; 20 C0 C0 | Jump to subroutine
    TYA                  ; 98 | Transfer Y register to accumulator
    BPL $B0              ; 10 B0 | Branch if positive

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1C9
; Address: $DDBADC
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1C9:
    JSR $28E0            ; 20 E0 28 | Jump to subroutine
    INX                  ; E8 | Increment X register
    CPX #$68             ; E0 68 | Compare X register (immediate)
    BVS $30              ; 70 30 | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    SEI                  ; 78 | Set interrupt disable flag
    BRA $40              ; 80 40 | Branch always
    CLC                  ; 18 | Clear carry flag
    CPX #$24             ; E0 24 | Compare X register (immediate)
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1CA
; Address: $DDBAEE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1CA:
    JSR $00DE            ; 20 DE 00 | Jump to subroutine
    BEQ $80              ; F0 80 | Branch if equal
    BMI $80              ; 30 80 | Branch if negative

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1CB
; Address: $DDBAF5
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1CB:
    JSR $6000            ; 20 00 60 | Jump to subroutine
    BRA $38              ; 80 38 | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    PHX                  ; DA | Push X register to stack
    CLD                  ; D8 | Clear decimal mode flag
    CLI                  ; 58 | Clear interrupt disable flag
    CLD                  ; D8 | Clear decimal mode flag
    CPX $F08C            ; EC 8C F0 | Compare X register (absolute)
    BMI $C8              ; 30 C8 | Branch if negative
    BEQ $08              ; F0 08 | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    BEQ $E8              ; F0 E8 | Branch if equal
    BPL $28              ; 10 28 | Branch if positive
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    BVS $F2              ; 70 F2 | Branch if overflow set
    INY                  ; C8 | Increment Y register
    DEC $0E08            ; CE 08 0E | Decrement (absolute)
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1CC
; Address: $DDBB19
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1CC:
    INC $F6F0,X          ; FE F0 F6 | Increment (absolute,X)
    BCC $84              ; 90 84 | Branch if carry clear
    PHP                  ; 08 | Push processor status to stack
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA $0E04,Y          ; 19 04 0E | Logical OR with accumulator (absolute,Y)
    ORA ($37,X)          ; 01 37 | Logical OR with accumulator ((zero page,X))
    BVS $1E              ; 70 1E | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    LDA $50D720          ; AF 20 D7 50 | Read graphics status
    CLC                  ; 18 | Clear carry flag
    BIT $1F00            ; 2C 00 1F | Test bits in accumulator (absolute)
    BMI $62              ; 30 62 | Branch if negative
    CLI                  ; 58 | Clear interrupt disable flag
    BVS $07              ; 70 07 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    STA ($6E),Y          ; 91 6E | Update graphics data
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1CD
; Address: $DDBB63
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1CD:
    BPL $02              ; 10 02 | Branch if positive
    AND $3906,X          ; 3D 06 39 | Logical AND with accumulator (absolute,X)
    ASL $9871            ; 0E 71 98 | Arithmetic shift left (absolute)
    BIT $43              ; 24 43 | Test bits in accumulator (zero page)
    BPL $7F              ; 10 7F | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BRA $F8              ; 80 F8 | Branch always
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    PLP                  ; 28 | Pull processor status from stack
    CPX $18              ; E4 18 | Compare X register (zero page)
    BRA $C0              ; 80 C0 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $20              ; F0 20 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    ASL $FD70,X          ; 1E 70 FD | Arithmetic shift left (absolute,X)
    STY $FB              ; 84 FB | Store Y register to zero page
    INC                  ; 1A | Increment accumulator
    INC $E0              ; E6 E0 | Game work RAM access
    CLC                  ; 18 | Clear carry flag
    BMI $CC              ; 30 CC | Branch if negative
    SEP #$1C             ; E2 1C | Set processor status bits
    SED                  ; F8 | Set decimal mode flag
    BEQ $84              ; F0 84 | Branch if equal
    INC $1A              ; E6 1A | Increment (zero page)
    LSR $F8E0,X          ; 5E E0 F8 | Logical shift right (absolute,X)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1CE
; Address: $DDBBBA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1CE:
    ASL $EEF8,X          ; 1E F8 EE | Arithmetic shift left (absolute,X)
    CPX $DCDC            ; EC DC DC | Compare X register (absolute)
    LDX $48              ; A6 48 | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1CF
; Address: $DDBBC3
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1CF:
    JSR $9C60            ; 20 60 9C | Jump to subroutine
    BMI $CC              ; 30 CC | Branch if negative
    AND ($CE),Y          ; 31 CE | Logical AND with accumulator ((zero page),Y)
    ORA $8264,Y          ; 19 64 82 | Logical OR with accumulator (absolute,Y)
    BRA $DC              ; 80 DC | Branch always
    CPY $20E0            ; CC E0 20 | Compare Y register (absolute)
    INC $FEFC,X          ; FE FC FE | Increment (absolute,X)
    INC $7CFE,X          ; FE FE 7C | Increment (absolute,X)
    INC $7C00,X          ; FE 00 7C | Increment (absolute,X)
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    ORA ($67),Y          ; 11 67 | Logical OR with accumulator ((zero page),Y)
    ORA #$08             ; 09 08 | Logical OR with accumulator (immediate)
    ASL $2F04            ; 0E 04 2F | Arithmetic shift left (absolute)
    ORA ($17,X)          ; 01 17 | Logical OR with accumulator ((zero page,X))
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    BMI $1E              ; 30 1E | Branch if negative
    SEI                  ; 78 | Set interrupt disable flag
    LDA $50D720          ; AF 20 D7 50 | Read graphics status
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    BMI $62              ; 30 62 | Branch if negative
    CLI                  ; 58 | Clear interrupt disable flag
    BVS $07              ; 70 07 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    ADC $12              ; 65 12 | Add with carry (zero page)
    SEC                  ; 38 | Set carry flag
    ASL $39              ; 06 39 | Arithmetic shift left (zero page)
    STY $9873            ; 8C 73 98 | Store Y register to absolute address
    ROL $41              ; 26 41 | Rotate left (zero page)
    ROL $3B01,X          ; 3E 01 3B | Rotate left (absolute,X)
    ROL $007F,X          ; 3E 7F 00 | Rotate left (absolute,X)
    ROL $0001,X          ; 3E 01 00 | Rotate left (absolute,X)
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BRA $F8              ; 80 F8 | Branch always
    RTI                  ; 40 | Return from interrupt
    TYA                  ; 98 | Transfer Y register to accumulator
    CPX $98              ; E4 98 | Compare X register (zero page)
    BRA $80              ; 80 80 | Branch always
    CPX #$40             ; E0 40 | Compare X register (immediate)
    BVS $00              ; 70 00 | Branch if overflow set
    BVS $90              ; 70 90 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1D0
; Address: $DDBC5E
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1D0:
    BRA $F8              ; 80 F8 | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    ASL $FD70,X          ; 1E 70 FD | Arithmetic shift left (absolute,X)
    STY $FB              ; 84 FB | Store Y register to zero page
    INC                  ; 1A | Increment accumulator
    INC $E0              ; E6 E0 | Game work RAM access
    CLC                  ; 18 | Clear carry flag
    BIT $CBD2            ; 2C D2 CB | Test bits in accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    BEQ $84              ; F0 84 | Branch if equal
    INC $1A              ; E6 1A | Increment (zero page)
    LSR $F8E0,X          ; 5E E0 F8 | Logical shift right (absolute,X)
    ASL $F7F8,X          ; 1E F8 F7 | Arithmetic shift left (absolute,X)
    BIT #$76             ; 89 76 | Test bits in accumulator (immediate)
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    LDY $9C60,X          ; BC 60 9C | Load from absolute,X into Y register
    BVS $8E              ; 70 8E | Branch if overflow set
    ORA $C224,Y          ; 19 24 C2 | Logical OR with accumulator (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    INC $FEFC,X          ; FE FC FE | Increment (absolute,X)
    INC $FE3C,X          ; FE 3C FE | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    BRA $07              ; 80 07 | Branch always
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    ASL $0702            ; 0E 02 07 | Arithmetic shift left (absolute)
    SEC                  ; 38 | Set carry flag
    ORA $26              ; 05 26 | Logical OR with accumulator (zero page)
    ORA ($3B,X)          ; 01 3B | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ORA $0604,X          ; 1D 04 06 | Logical OR with accumulator (absolute,X)
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    ORA $0604,X          ; 1D 04 06 | Logical OR with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $0406,Y          ; 19 06 04 | Logical OR with accumulator (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    BPL $2E              ; 10 2E | Branch if positive
    CMP ($40,X)          ; C1 40 | Compare accumulator ((zero page,X))
    ROR $3701,X          ; 7E 01 37 | Rotate right (absolute,X)
    ROR $403F,X          ; 7E 3F 40 | Rotate right (absolute,X)
    ROR $0001,X          ; 7E 01 00 | Rotate right (absolute,X)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1D1
; Address: $DDBD07
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1D1:
    BCC $FC              ; 90 FC | Branch if carry clear
    INY                  ; C8 | Increment Y register
    CPY #$74             ; C0 74 | Compare Y register (immediate)
    ROL                  ; 2A | Rotate left (accumulator)
    INC $22              ; E6 22 | Increment (zero page)
    INC $0000            ; EE 00 00 | Increment (absolute)
    BCS $90              ; B0 90 | Branch if carry set
    CLD                  ; D8 | Clear decimal mode flag
    INY                  ; C8 | Increment Y register
    INX                  ; E8 | Increment X register
    WDM #$FC             ; 42 FC | Reserved instruction
    ASL $0EF0            ; 0E F0 0E | Arithmetic shift left (absolute)
    BEQ $B4              ; F0 B4 | Branch if equal
    RTI                  ; 40 | Return from interrupt
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    CLD                  ; D8 | Clear decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    BVS $B0              ; 70 B0 | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    BCS $E0              ; B0 E0 | Game work RAM access
    CLC                  ; 18 | Clear carry flag
    DEY                  ; 88 | Decrement Y register
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1D2
; Address: $DDBD37
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1D2:
    JSR $0080            ; 20 80 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    INY                  ; C8 | Increment Y register
    BEQ $3C              ; F0 3C | Branch if equal
    SEC                  ; 38 | Set carry flag
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$90             ; C0 90 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1D3
; Address: $DDBD46
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1D3:
    PLA                  ; 68 | Pull accumulator from stack
    BRA $0C              ; 80 0C | Branch always
    CPX #$1C             ; E0 1C | Compare X register (immediate)
    SEC                  ; 38 | Set carry flag
    RTI                  ; 40 | Return from interrupt
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1D4
; Address: $DDBD53
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1D4:
    JSR $0008            ; 20 08 00 | Jump to subroutine
    BRA $90              ; 80 90 | Branch always
    INX                  ; E8 | Increment X register
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    BMI $30              ; 30 30 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    BRA $07              ; 80 07 | Branch always
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1D5
; Address: $DDBD76
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1D5:
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $1E04            ; 0D 04 1E | Logical OR with accumulator (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    ORA $26              ; 05 26 | Logical OR with accumulator (zero page)
    ORA ($3B,X)          ; 01 3B | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ORA $0604,X          ; 1D 04 06 | Logical OR with accumulator (absolute,X)
    INC                  ; 1A | Increment accumulator
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    ORA $0604,X          ; 1D 04 06 | Logical OR with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA #$07             ; 09 07 | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    ASL $39              ; 06 39 | Arithmetic shift left (zero page)
    ASL $39              ; 06 39 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    ASL $38              ; 06 38 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BPL $FC              ; 10 FC | Branch if positive
    DEY                  ; 88 | Decrement Y register
    RTI                  ; 40 | Return from interrupt
    CPY #$74             ; C0 74 | Compare Y register (immediate)
    ROL                  ; 2A | Rotate left (accumulator)
    INC $22              ; E6 22 | Increment (zero page)
    INC $0000            ; EE 00 00 | Increment (absolute)
    BPL $B0              ; 10 B0 | Branch if positive
    DEY                  ; 88 | Decrement Y register
    CLD                  ; D8 | Clear decimal mode flag
    RTI                  ; 40 | Return from interrupt
    INX                  ; E8 | Increment X register
    WDM #$FC             ; 42 FC | Reserved instruction
    ASL $0EF0            ; 0E F0 0E | Arithmetic shift left (absolute)
    BEQ $B4              ; F0 B4 | Branch if equal
    RTI                  ; 40 | Return from interrupt
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    CLD                  ; D8 | Clear decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    BVS $B0              ; 70 B0 | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    BCS $A0              ; B0 A0 | Branch if carry set
    CLI                  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1D7
; Address: $DDBDF7
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1D7:
    JSR $0080            ; 20 80 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    INY                  ; C8 | Increment Y register
    BEQ $7C              ; F0 7C | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    LDY #$22             ; A0 22 | Load immediate value into Y register
    STY $22              ; 84 22 | Store Y register to zero page
    CPY $CC              ; C4 CC | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1D8
; Address: $DDBE07
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1D8:
    JSR $E00C            ; 20 0C E0 | Game work RAM access
    BRA $7C              ; 80 7C | Branch always
    DEY                  ; 88 | Decrement Y register
    BVC $38              ; 50 38 | Branch if overflow clear
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    BPL $20              ; 10 20 | Branch if positive
    BMI $E8              ; 30 E8 | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    TYA                  ; 98 | Transfer Y register to accumulator
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    BVC $20              ; 50 20 | Branch if overflow clear
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    AND $310C,Y          ; 39 0C 31 | Logical AND with accumulator (absolute,Y)
    BPL $00              ; 10 00 | Branch if positive
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    BIT $06              ; 24 06 | Test bits in accumulator (zero page)
    BVS $15              ; 70 15 | Branch if overflow set
    TSX                  ; BA | Transfer stack pointer to X register
    ORA $46D8            ; 0D D8 46 | Logical OR with accumulator (absolute)
    ROR $03              ; 66 03 | Rotate right (zero page)
    ASL $18              ; 06 18 | Arithmetic shift left (zero page)
    EOR $31CE            ; 4D CE 31 | Exclusive OR with accumulator (absolute)
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ADC ($08,X)          ; 61 08 | Add with carry ((zero page,X))
    BPL $7D              ; 10 7D | Branch if positive
    INC $776F            ; EE 6F 77 | Increment (absolute)
    STZ $38              ; 64 38 | Store zero to zero page
    AND $10              ; 25 10 | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1D9
; Address: $DDBE66
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1D9:
    ORA $0124,Y          ; 19 24 01 | Logical OR with accumulator (absolute,Y)
    STA ($38,X)          ; 81 38 | Update graphics data
    EOR ($0B,X)          ; 41 0B | Exclusive OR with accumulator ((zero page,X))
    ADC $27              ; 65 27 | Add with carry (zero page)
    SBC $397F,X          ; FD 7F 39 | Subtract with carry (absolute,X)
    ORA ($E0,X)          ; 01 E0 | Game work RAM access
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1DA
; Address: $DDBE89
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1DA:
    JSR $603C            ; 20 3C 60 | Jump to subroutine
    STZ $0E30,X          ; 9E 30 0E | Store zero to absolute,X
    TYA                  ; 98 | Transfer Y register to accumulator
    BCC $00              ; 90 00 | Branch if carry clear
    BMI $20              ; 30 20 | Branch if negative
    BEQ $20              ; F0 20 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BRA $7C              ; 80 7C | Branch always
    BRA $7C              ; 80 7C | Branch always
    LDY $E8              ; A4 E8 | Load from zero page into Y register
    ASL $5DA8            ; 0E A8 5D | Arithmetic shift left (absolute)
    BCS $1B              ; B0 1B | Branch if carry set
    SEP #$66             ; E2 66 | Set processor status bits
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    PHA                  ; 48 | Push accumulator to stack
    PLY                  ; 7A | Pull Y register from stack
    STY $00              ; 84 00 | Store Y register to zero page
    CLC                  ; 18 | Clear carry flag
    BVC $08              ; 50 08 | Branch if overflow clear
    ASL $10              ; 06 10 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    LDY $7638,X          ; BC 38 76 | Load from absolute,X into Y register
    PEA #$ECEC           ; F4 EC EC | Push effective address to stack
    CLC                  ; 18 | Clear carry flag
    JMP $C818            ; 4C 18 C8 | Jump to address
    BCS $0C              ; B0 0C | Branch if carry set
    STA ($3E,X)          ; 81 3E | Update graphics data
    CMP ($1C,X)          ; C1 1C | Compare accumulator ((zero page,X))
    SEP #$00             ; E2 00 | Set processor status bits
    BRA $CC              ; 80 CC | Branch always
    CPY $2080            ; CC 80 20 | Compare Y register (absolute)
    DEC $C4              ; C6 C4 | Decrement (zero page)
    STX $BECC            ; 8E CC BE | Store X register to absolute address
    INC $FEDC,X          ; FE DC FE | Increment (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1DB
; Address: $DDBEDE
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1DB:
    BRA $00              ; 80 00 | Branch always
    ORA ($1C,X)          ; 01 1C | Logical OR with accumulator ((zero page,X))
    AND $310C,Y          ; 39 0C 31 | Logical AND with accumulator (absolute,Y)
    BPL $00              ; 10 00 | Branch if positive
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1DC
; Address: $DDBF00
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1DC:
    BIT $06              ; 24 06 | Test bits in accumulator (zero page)
    BVS $15              ; 70 15 | Branch if overflow set
    TSX                  ; BA | Transfer stack pointer to X register
    ORA $46D8            ; 0D D8 46 | Logical OR with accumulator (absolute)
    ROR $03              ; 66 03 | Rotate right (zero page)
    ASL $18              ; 06 18 | Arithmetic shift left (zero page)
    AND $215E            ; 2D 5E 21 | PPU graphics register access
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ADC ($08,X)          ; 61 08 | Add with carry ((zero page,X))
    BPL $3D              ; 10 3D | Branch if positive
    ROR $372F            ; 6E 2F 37 | Rotate right (absolute)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ROL $300D            ; 2E 0D 30 | Rotate left (absolute)
    STA ($7C,X)          ; 81 7C | Update graphics data
    SEC                  ; 38 | Set carry flag
    ROL $3301,X          ; 3E 01 33 | Rotate left (absolute,X)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ADC ($33),Y          ; 71 33 | Add with carry ((zero page),Y)
    ADC $3B7F,X          ; 7D 7F 3B | Add with carry (absolute,X)
    ASL $3E              ; 06 3E | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BEQ $00              ; F0 00 | Branch if equal
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    BRA $FE              ; 80 FE | Branch always
    BPL $3E              ; 10 3E | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1DD
; Address: $DDBF4C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1DD:
    STZ $0E30            ; 9C 30 0E | Store zero to absolute
    TYA                  ; 98 | Transfer Y register to accumulator
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    BPL $F0              ; 10 F0 | Branch if positive

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1DE
; Address: $DDBF5A
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1DE:
    JSR $80F8            ; 20 F8 80 | Jump to subroutine
    SEI                  ; 78 | Set interrupt disable flag
    BRA $7C              ; 80 7C | Branch always
    LDX $E8              ; A6 E8 | Load from zero page into X register
    ASL $5DA8            ; 0E A8 5D | Arithmetic shift left (absolute)
    BCS $1B              ; B0 1B | Branch if carry set
    SEP #$66             ; E2 66 | Set processor status bits
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    JMP $73B2            ; 4C B2 73 | Jump to address
    STY $1800            ; 8C 00 18 | Store Y register to absolute address
    BVC $08              ; 50 08 | Branch if overflow clear
    ASL $10              ; 06 10 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1DF
; Address: $DDBF7A
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1DF:
    LDX $7738,Y          ; BE 38 77 | Load from absolute,Y into X register
    INC $D9EE            ; EE EE D9 | Increment (absolute)
    ROL $1C26            ; 2E 26 1C | Rotate left (absolute)
    LDY $08              ; A4 08 | Load from zero page into Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    BIT $80              ; 24 80 | Test bits in accumulator (zero page)
    ROL $1C81,X          ; 3E 81 1C | Rotate left (absolute,X)
    REP #$00             ; C2 00 | Reset processor status bits
    RTI                  ; 40 | Return from interrupt
    INC $E6              ; E6 E6 | Increment (zero page)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BNE $A6              ; D0 A6 | Branch if not equal
    CPX $BF              ; E4 BF | Compare X register (zero page)
    INC $FE9C,X          ; FE 9C FE | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    BRA $07              ; 80 07 | Branch always
    ORA #$3F             ; 09 3F | Logical OR with accumulator (immediate)
    ROL $6754            ; 2E 54 67 | Rotate left (absolute)
    ORA $1B09            ; 0D 09 1B | Logical OR with accumulator (absolute)
    WDM #$3F             ; 42 3F | Reserved instruction
    BVS $0F              ; 70 0F | Branch if overflow set
    BVS $0F              ; 70 0F | Branch if overflow set
    AND $022D            ; 2D 2D 02 | Logical AND with accumulator (absolute)
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1E0
; Address: $DDBFC6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1E0:
    JSR $101B            ; 20 1B 10 | Jump to subroutine
    ASL $000D            ; 0E 0D 00 | Arithmetic shift left (absolute)
    ORA $1807            ; 0D 07 18 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1E1
; Address: $DDBFD0
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1E1:
    JSL $002911          ; 22 11 29 00 | Jump to subroutine long
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ROL $0103,X          ; 3E 03 01 | Rotate left (absolute,X)
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    ORA ($30,X)          ; 01 30 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    ORA $1819,Y          ; 19 19 18 | Logical OR with accumulator (absolute,Y)
    BPL $00              ; 10 00 | Branch if positive
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ORA ($E0,X)          ; 01 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INC $FC20,X          ; FE 20 FC | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    INC $3E40,X          ; FE 40 3E | Increment (absolute,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    LDY #$20             ; A0 20 | Load immediate value into Y register
    BVS $40              ; 70 40 | Branch if overflow set
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1E2
; Address: $DDC01F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1E2:
    CPX #$1C             ; E0 1C | Compare X register (immediate)
    BEQ $D8              ; F0 D8 | Branch if equal
    LDY #$64             ; A0 64 | Load immediate value into Y register
    BRA $DC              ; 80 DC | Branch always
    CLC                  ; 18 | Clear carry flag
    CLV                  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1E3
; Address: $DDC029
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1E3:
    JSR $0060            ; 20 60 00 | Jump to subroutine
    BEQ $00              ; F0 00 | Branch if equal
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1E5
; Address: $DDC033
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1E5:
    JSR $5800            ; 20 00 58 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    CLV                  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1E6
; Address: $DDC038
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1E6:
    JSR $1060            ; 20 60 10 | Jump to subroutine
    BRA $58              ; 80 58 | Branch always
    BVC $EC              ; 50 EC | Branch if overflow clear
    INX                  ; E8 | Increment X register
    TYA                  ; 98 | Transfer Y register to accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1E7
; Address: $DDC042
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1E7:
    JSR $E0C0            ; 20 C0 E0 | Game work RAM access
    CLC                  ; 18 | Clear carry flag
    BMI $CC              ; 30 CC | Branch if negative
    BPL $EC              ; 10 EC | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ROR $EC80,X          ; 7E 80 EC | Rotate right (absolute,X)
    INX                  ; E8 | Increment X register
    CLD                  ; D8 | Clear decimal mode flag
    CPY #$3C             ; C0 3C | Compare Y register (immediate)
    SEC                  ; 38 | Set carry flag
    INC $FEFC,X          ; FE FC FE | Increment (absolute,X)
    ROR $02FC,X          ; 7E FC 02 | Rotate right (absolute,X)
    ROR $0080,X          ; 7E 80 00 | Rotate right (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ORA ($3F),Y          ; 11 3F | Logical OR with accumulator ((zero page),Y)
    ROL $6754            ; 2E 54 67 | Rotate left (absolute)
    PHP                  ; 08 | Push processor status to stack
    ORA $1B11            ; 0D 11 1B | Logical OR with accumulator (absolute)
    WDM #$3F             ; 42 3F | Reserved instruction
    BVS $0F              ; 70 0F | Branch if overflow set
    BVS $0F              ; 70 0F | Branch if overflow set
    AND $022D            ; 2D 2D 02 | Logical AND with accumulator (absolute)
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1E8
; Address: $DDC086
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1E8:
    JSR $101B            ; 20 1B 10 | Jump to subroutine
    ASL $000D            ; 0E 0D 00 | Arithmetic shift left (absolute)
    ORA $1A05            ; 0D 05 1A | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1E9
; Address: $DDC090
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1E9:
    JSL $002911          ; 22 11 29 00 | Jump to subroutine long
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ROL $3B1E,X          ; 3E 1E 3B | Rotate left (absolute,X)
    ORA $44              ; 05 44 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1EA
; Address: $DDC0A3
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1EA:
    AND ($44,X)          ; 21 44 | Logical AND with accumulator ((zero page,X))
    BMI $07              ; 30 07 | Branch if negative
    SEC                  ; 38 | Set carry flag
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    ORA ($0A),Y          ; 11 0A | Logical OR with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    BPL $08              ; 10 08 | Branch if positive
    ORA $101F,Y          ; 19 1F 10 | Logical OR with accumulator (absolute,Y)
    ORA ($0A),Y          ; 11 0A | Logical OR with accumulator ((zero page),Y)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BRA $FE              ; 80 FE | Branch always
    INC $FC20,X          ; FE 20 FC | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    ROL $00C0,X          ; 3E C0 00 | Rotate left (absolute,X)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BCS $20              ; B0 20 | Branch if carry set
    SEI                  ; 78 | Set interrupt disable flag
    RTI                  ; 40 | Return from interrupt
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BNE $1E              ; D0 1E | Branch if not equal
    BEQ $DC              ; F0 DC | Branch if equal
    LDY #$64             ; A0 64 | Load immediate value into Y register
    BRA $DC              ; 80 DC | Branch always
    CLC                  ; 18 | Clear carry flag
    CLV                  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1EB
; Address: $DDC0E9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1EB:
    JSR $0060            ; 20 60 00 | Jump to subroutine
    BEQ $00              ; F0 00 | Branch if equal
    CLI                  ; 58 | Clear interrupt disable flag
    LDY #$00             ; A0 00 | Load immediate value into Y register
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1EC
; Address: $DDC0F3
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1EC:
    JSR $5800            ; 20 00 58 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    CLV                  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1ED
; Address: $DDC0F8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1ED:
    JSR $1060            ; 20 60 10 | Jump to subroutine
    BRA $58              ; 80 58 | Branch always
    BVC $EC              ; 50 EC | Branch if overflow clear
    INX                  ; E8 | Increment X register
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1EE
; Address: $DDC101
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1EE:
    JSR $E090            ; 20 90 E0 | Game work RAM access
    CPX #$18             ; E0 18 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1EF
; Address: $DDC107
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1EF:
    STZ $9C60            ; 9C 60 9C | Store zero to absolute
    BPL $EC              ; 10 EC | Branch if positive
    CPX $68E8            ; EC E8 68 | Compare X register (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1F1
; Address: $DDC11A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1F1:
    INC $00FC,X          ; FE FC 00 | Increment (absolute,X)
    CLI                  ; 58 | Clear interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    LDY $A50C            ; AC 0C A5 | Load from absolute address into Y register
    ORA $E7              ; 05 E7 | Logical OR with accumulator (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1F2
; Address: $DDC12A
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1F2:
    SED                  ; F8 | Set decimal mode flag
    BMI $FF              ; 30 FF | Branch if negative
    ADC $0018            ; 6D 18 00 | Add with carry (absolute)
    RTI                  ; 40 | Return from interrupt
    WDM #$47             ; 42 47 | Reserved instruction
    EOR ($6F,X)          ; 41 6F | Exclusive OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    ADC $FF7C            ; 6D 7C FF | Add with carry (absolute)
    PLB                  ; AB | Pull data bank register from stack
    LDA #$FF             ; A9 FF | Read graphics status
    ORA #$BE             ; 09 BE | Logical OR with accumulator (immediate)
    INC                  ; 1A | Increment accumulator
    INC $FCD2,X          ; FE D2 FC | Increment (absolute,X)
    BCC $2F              ; 90 2F | Branch if carry clear
    ROR $3E2B,X          ; 7E 2B 3E | Rotate right (absolute,X)
    PLB                  ; AB | Pull data bank register from stack
    ROL $3EA9,X          ; 3E A9 3E | Rotate left (absolute,X)
    ORA #$3E             ; 09 3E | Logical OR with accumulator (immediate)
    EOR $1DD3,X          ; 5D D3 1D | Exclusive OR with accumulator (absolute,X)
    SBC $FBA1,X          ; FD A1 FB | Subtract with carry (absolute,X)
    ASL $A1              ; 06 A1 | Arithmetic shift left (zero page)
    ORA ($9B,X)          ; 01 9B | Logical OR with accumulator ((zero page,X))
    BPL $6C              ; 10 6C | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    BPL $BA              ; 10 BA | Branch if positive
    SEC                  ; 38 | Set carry flag
    LSR $7474,X          ; 5E 74 74 | Logical shift right (absolute,X)
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    BCS $E5              ; B0 E5 | Branch if carry set
    CPX #$D7             ; E0 D7 | Compare X register (immediate)
    ASL $9F              ; 06 9F | Arithmetic shift left (zero page)
    STY $DAFF            ; 8C FF DA | Store Y register to absolute address
    CLC                  ; 18 | Clear carry flag
    BEQ $42              ; F0 42 | Hardware register operation
    CPX #$82             ; E0 82 | Compare X register (immediate)
    SEP #$F6             ; E2 F6 | Set processor status bits
    CPX $DA6E            ; EC 6E DA | Compare X register (absolute)
    ASL $B6FF,X          ; 1E FF B6 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1F3
; Address: $DDC1A3
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1F3:
    PEA #$D4FE           ; F4 FE D4 | Push effective address to stack
    INC $FFD4,X          ; FE D4 FF | Increment (absolute,X)
    STA ($7D),Y          ; 91 7D | Update graphics data
    CLI                  ; 58 | Clear interrupt disable flag
    LSR                  ; 4A | Logical shift right (accumulator)
    ROL $7EF4,X          ; 3E F4 7E | Rotate left (absolute,X)
    STA ($7C),Y          ; 91 7C | Update graphics data
    PHX                  ; DA | Push X register to stack
    TSX                  ; BA | Transfer stack pointer to X register
    DEX                  ; CA | Decrement X register
    CLV                  ; B8 | Clear overflow flag
    LDA $FE88,X          ; BD 88 FE | Read graphics status
    CPY $FE              ; C4 FE | Compare Y register (zero page)
    CPX #$1E             ; E0 1E | Compare X register (immediate)
    BPL $DC              ; 10 DC | Branch if positive
    BVC $54              ; 50 54 | Branch if overflow clear
    BPL $BA              ; 10 BA | Branch if positive
    SEC                  ; 38 | Set carry flag
    DEX                  ; CA | Decrement X register
    PHX                  ; DA | Push X register to stack
    CPY $DC              ; C4 DC | Compare Y register (zero page)
    CPX #$EC             ; E0 EC | Compare X register (immediate)
    BEQ $F4              ; F0 F4 | Branch if equal
    BVS $30              ; 70 30 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    CLI                  ; 58 | Clear interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    LDA $A70D            ; AD 0D A7 | Read graphics status
    XBA                  ; EB | Exchange accumulator bytes
    BEQ $60              ; F0 60 | Branch if equal
    SBC $FF31,Y          ; F9 31 FF | Subtract with carry (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    WDM #$07             ; 42 07 | Reserved instruction
    EOR ($4F,X)          ; 41 4F | Exclusive OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    ADC $2FFF            ; 6D FF 2F | Add with carry (absolute)
    LDA #$FF             ; A9 FF | Read graphics status
    BIT #$BE             ; 89 BE | Test bits in accumulator (immediate)
    INC                  ; 1A | Increment accumulator
    INC $6D52,X          ; FE 52 6D | Increment (absolute,X)
    ROR $3E2B,X          ; 7E 2B 3E | Rotate right (absolute,X)
    ROL $3EA9,X          ; 3E A9 3E | Rotate left (absolute,X)
    BIT #$3E             ; 89 3E | Test bits in accumulator (immediate)
    EOR $1D53,X          ; 5D 53 1D | Exclusive OR with accumulator (absolute,X)
    LDA $7F11,X          ; BD 11 7F | Read graphics status
    SEI                  ; 78 | Set interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1F4
; Address: $DDC22A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1F4:
    ROL                  ; 2A | Rotate left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    EOR $001C,X          ; 5D 1C 00 | Exclusive OR with accumulator (absolute,X)
    ASL $1C0C            ; 0E 0C 1C | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1F5
; Address: $DDC23D
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1F5:
    JSL $1A0000          ; 22 00 00 1A | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    BMI $A5              ; 30 A5 | Branch if negative
    LDY #$E7             ; A0 E7 | Load immediate value into Y register
    SEP #$DF             ; E2 DF | Set processor status bits
    PHX                  ; DA | Push X register to stack
    CLC                  ; 18 | Clear carry flag
    BMI $02              ; 30 02 | Branch if negative
    CPX #$42             ; E0 42 | Hardware register operation
    SEP #$82             ; E2 82 | Set processor status bits
    INC $EC              ; E6 EC | Increment (zero page)
    INC $1EDA            ; EE DA 1E | Increment (absolute)
    ROL $F4FF,X          ; 3E FF F4 | Rotate left (absolute,X)
    INC $FFD4,X          ; FE D4 FF | Increment (absolute,X)
    BCC $7D              ; 90 7D | Branch if carry clear
    CLI                  ; 58 | Clear interrupt disable flag
    ORA #$F4             ; 09 F4 | Logical OR with accumulator (immediate)
    ROR $7CD4,X          ; 7E D4 7C | Rotate right (absolute,X)
    BCC $7C              ; 90 7C | Branch if carry clear
    PHX                  ; DA | Push X register to stack
    TSX                  ; BA | Transfer stack pointer to X register
    CLV                  ; B8 | Clear overflow flag
    CMP #$D8             ; C9 D8 | Compare accumulator (immediate)
    LDA                  ; BF 85 DF C0 | Read graphics status
    ROR $8560            ; 6E 60 85 | Rotate right (absolute)
    BRA $D9              ; 80 D9 | Branch always
    PHP                  ; 08 | Push processor status to stack
    ROL                  ; 2A | Rotate left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    EOR $C51C,X          ; 5D 1C C5 | Exclusive OR with accumulator (absolute,X)
    CPX #$EC             ; E0 EC | Compare X register (immediate)
    BEQ $F4              ; F0 F4 | Branch if equal
    PLX                  ; FA | Pull X register from stack
    PLY                  ; 7A | Pull Y register from stack
    ROL $1C2E            ; 2E 2E 1C | Rotate left (absolute)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1F6
; Address: $DDC29F
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1F6:
    JSL $0A0004          ; 22 04 00 0A | Jump to subroutine long
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    ASL $3F0C,X          ; 1E 0C 3F | Arithmetic shift left (absolute,X)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ASL $1E12,X          ; 1E 12 1E | Arithmetic shift left (absolute,X)
    ROL $2D7F,X          ; 3E 7F 2D | Rotate left (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    AND #$7F             ; 29 7F | Logical AND with accumulator (immediate)
    AND #$7F             ; 29 7F | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1F7
; Address: $DDC2CD
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1F7:
    PLP                  ; 28 | Pull processor status from stack
    AND $2D              ; 25 2D | Logical AND with accumulator (zero page)
    ROL                  ; 2A | Rotate left (accumulator)
    ROL $3E2A,X          ; 3E 2A 3E | Rotate left (absolute,X)
    AND #$3D             ; 29 3D | Logical AND with accumulator (immediate)
    AND #$3D             ; 29 3D | Logical AND with accumulator (immediate)
    PLP                  ; 28 | Pull processor status from stack
    AND $3D              ; 25 3D | Logical AND with accumulator (zero page)
    ORA ($3E),Y          ; 11 3E | Logical OR with accumulator ((zero page),Y)
    BPL $1E              ; 10 1E | Branch if positive
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    ORA $1100            ; 0D 00 11 | Logical OR with accumulator (absolute)
    ORA $1D11,X          ; 1D 11 1D | Logical OR with accumulator (absolute,X)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1F8
; Address: $DDC304
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1F8:
    JSR $5820            ; 20 20 58 | Jump to subroutine
    CLI                  ; 58 | Clear interrupt disable flag
    STZ $44              ; 64 44 | Store zero to zero page
    PLX                  ; FA | Pull X register from stack
    CLD                  ; D8 | Clear decimal mode flag
    SBC $EDEC,X          ; FD EC ED | Subtract with carry (absolute,X)
    CPX #$00             ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1FA
; Address: $DDC317
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1FA:
    JSR $185C            ; 20 5C 18 | Jump to subroutine
    JMP $66EEEE          ; 5C EE EE 66 | Jump to address long
    LDX $94B8            ; AE B8 94 | Load from absolute address into X register
    STZ $081A            ; 9C 1A 08 | Store zero to absolute
    DEX                  ; CA | Decrement X register
    STY $64              ; 84 64 | Store Y register to zero page
    RTI                  ; 40 | Return from interrupt
    CPX #$BE             ; E0 BE | Compare X register (immediate)
    LDY $7AFF,X          ; BC FF 7A | Load from absolute,X into Y register
    CPX #$58             ; E0 58 | Compare X register (immediate)
    PEA #$FC68           ; F4 68 FC | Push effective address to stack
    PEA #$3CBC           ; F4 BC 3C | Push effective address to stack
    CLD                  ; D8 | Clear decimal mode flag
    TYA                  ; 98 | Transfer Y register to accumulator
    CPX #$80             ; E0 80 | Compare X register (immediate)
    PEA #$6A7A           ; F4 7A 6A | Push effective address to stack
    CMP $07C0            ; CD C0 07 | Compare accumulator (absolute)
    ROL $20              ; 26 20 | Rotate left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1FB
; Address: $DDC34A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1FB:
    INC $9580,X          ; FE 80 95 | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    TXA                  ; 8A | Transfer X register to accumulator
    BEQ $F2              ; F0 F2 | Branch if equal
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1FC
; Address: $DDC355
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1FC:
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPX #$E0             ; E0 E0 | Game work RAM access
    BRA $80              ; 80 80 | Branch always
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BRA $08              ; 80 08 | Branch always
    ORA ($14,X)          ; 01 14 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ROL $7F1C,X          ; 3E 1C 7F | Rotate left (absolute,X)
    ROL $FF              ; 26 FF | Rotate left (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1FD
; Address: $DDC372
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1FD:
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ROL $3E              ; 26 3E | Rotate left (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1FE
; Address: $DDC38E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1FE:
    INC $5B4A,X          ; FE 4A 5B | Increment (absolute,X)
    ROR $7E54,X          ; 7E 54 7E | Rotate right (absolute,X)
    ADC $7D55,X          ; 7D 55 7D | Add with carry (absolute,X)
    AND ($7D,X)          ; 21 7D | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_1FF
; Address: $DDC3A3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_1FF:
    JSR $163E            ; 20 3E 16 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    AND ($39,X)          ; 21 39 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_200
; Address: $DDC3B2
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_200:
    JSL $11173A          ; 22 3A 17 11 | Jump to subroutine long
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPX #$E0             ; E0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_201
; Address: $DDC3C2
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_201:
    JSR $5820            ; 20 20 58 | Jump to subroutine
    CLI                  ; 58 | Clear interrupt disable flag
    STZ $44              ; 64 44 | Store zero to zero page
    PLX                  ; FA | Pull X register from stack
    CLD                  ; D8 | Clear decimal mode flag
    SBC $6DEC,X          ; FD EC 6D | Subtract with carry (absolute,X)
    LDX $E038            ; AE 38 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_203
; Address: $DDC3D5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_203:
    JSR $185C            ; 20 5C 18 | Jump to subroutine
    JMP $E6EEEE          ; 5C EE EE E6 | Jump to address long
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_204
; Address: $DDC3DF
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_204:
    CLI                  ; 58 | Clear interrupt disable flag
    STZ $889A            ; 9C 9A 88 | Store zero to absolute
    LSR                  ; 4A | Logical shift right (accumulator)
    LDY $80              ; A4 80 | Load from zero page into Y register
    TXS                  ; 9A | Transfer X register to stack pointer
    BRA $FD              ; 80 FD | Branch always
    BEQ $F4              ; F0 F4 | Branch if equal
    PLA                  ; 68 | Pull accumulator from stack
    LDY $B8BC,X          ; BC BC B8 | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_205
; Address: $DDC3F7
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_205:
    CLV                  ; B8 | Clear overflow flag
    CLD                  ; D8 | Clear decimal mode flag
    CLI                  ; 58 | Clear interrupt disable flag
    STZ $64              ; 64 64 | Store zero to zero page
    TXA                  ; 8A | Transfer X register to accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    NOP                  ; EA | No operation
    DEC $3408,X          ; DE 08 34 | Decrement (absolute,X)
    BIT $8C20            ; 2C 20 8C | Test bits in accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    BMI $18              ; 30 18 | Branch if negative
    BPL $A8              ; 10 A8 | Branch if positive
    NOP                  ; EA | No operation
    TAX                  ; AA | Transfer accumulator to X register
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    CPY #$C8             ; C0 C8 | Compare Y register (immediate)
    BEQ $F0              ; F0 F0 | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $E0              ; F0 E0 | Game work RAM access
    BVC $58              ; 50 58 | Branch if overflow clear
    CLC                  ; 18 | Clear carry flag
    LDY $A50C            ; AC 0C A5 | Load from absolute address into Y register
    ORA $E6              ; 05 E6 | Logical OR with accumulator (zero page)
    LSR $FD              ; 46 FD | Logical shift right (zero page)
    ADC #$F5             ; 69 F5 | Add with carry (immediate)
    AND ($FB,X)          ; 21 FB | Logical AND with accumulator ((zero page,X))
    AND $0EFB,X          ; 3D FB 0E | Logical AND with accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    WDM #$47             ; 42 47 | Reserved instruction
    EOR ($6B,X)          ; 41 6B | Exclusive OR with accumulator ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_206
; Address: $DDC43C
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_206:
    AND $0875,Y          ; 39 75 08 | Logical AND with accumulator (absolute,Y)
    ROR $ED              ; 66 ED | Rotate right (zero page)
    NOP                  ; EA | No operation
    PHX                  ; DA | Push X register to stack
    CMP ($BD),Y          ; D1 BD | Compare accumulator ((zero page),Y)
    TYA                  ; 98 | Transfer Y register to accumulator
    LDY $AF18,X          ; BC 18 AF | Load from absolute,X into Y register
    INC $FCEE,X          ; FE EE FC | Increment (absolute,X)
    JMP $2FEF5C          ; 5C 5C EF 2F | Jump to address long
    SBC #$41             ; E9 41 | Subtract with carry (immediate)
    ROR $26              ; 66 26 | Rotate right (zero page)
    SBC ($61,X)          ; E1 61 | Subtract with carry ((zero page,X))
    BMI $6C              ; 30 6C | Branch if negative
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_207
; Address: $DDC46E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_207:
    TAX                  ; AA | Transfer accumulator to X register
    ROR $7474,X          ; 7E 74 74 | Rotate right (absolute,X)
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    BCS $65              ; B0 65 | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_208
; Address: $DDC48A
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_208:
    LDA $BCDF86          ; AF 86 DF BC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    BEQ $42              ; F0 42 | Hardware register operation
    CPX #$82             ; E0 82 | Compare X register (immediate)
    REP #$D6             ; C2 D6 | Reset processor status bits
    STZ $14AE            ; 9C AE 14 | Store zero to absolute
    ROR $BF              ; 66 BF | Rotate right (zero page)
    INX                  ; E8 | Increment X register
    STX $BB              ; 86 BB | Store X register to zero page
    DEC                  ; 3A | Decrement accumulator
    ADC $3B74,X          ; 7D 74 3B | Add with carry (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LSR $EC              ; 46 EC | Logical shift right (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    INC $D7EC            ; EE EC D7 | Increment (absolute)
    PHX                  ; DA | Push X register to stack
    DEC                  ; 3A | Decrement accumulator
    DEC                  ; 3A | Decrement accumulator
    INC $BDEC            ; EE EC BD | Increment (absolute)
    INC $FAC4            ; EE C4 FA | Increment (absolute)
    CPX #$1C             ; E0 1C | Compare X register (immediate)
    CLC                  ; 18 | Clear carry flag
    CLD                  ; D8 | Clear decimal mode flag
    BVC $44              ; 50 44 | Branch if overflow clear
    TAX                  ; AA | Transfer accumulator to X register
    CPY $D4              ; C4 D4 | Compare Y register (zero page)
    CPX #$E4             ; E0 E4 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BVS $30              ; 70 30 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    CLI                  ; 58 | Clear interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    LDA $A60D            ; AD 0D A6 | Read graphics status
    ASL $ED              ; 06 ED | Arithmetic shift left (zero page)
    EOR #$F5             ; 49 F5 | Exclusive OR with accumulator (immediate)
    ADC ($FB,X)          ; 61 FB | Add with carry ((zero page,X))
    AND $2EFB,X          ; 3D FB 2E | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_209
; Address: $DDC4F2
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_209:
    CLC                  ; 18 | Clear carry flag
    WDM #$07             ; 42 07 | Reserved instruction
    EOR ($4B,X)          ; 41 4B | Exclusive OR with accumulator ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_20B
; Address: $DDC4FC
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_20B:
    AND $2875,Y          ; 39 75 28 | Logical AND with accumulator (absolute,Y)
    ROR $FD              ; 66 FD | Rotate right (zero page)
    NOP                  ; EA | No operation

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_20C
; Address: $DDC503
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_20C:
    JSL $DD61EA          ; 22 EA 61 DD | Jump to subroutine long
    INY                  ; C8 | Increment Y register
    CLD                  ; D8 | Clear decimal mode flag
    JMP $DC2EBE          ; 5C BE 2E DC | Jump to address long
    XBA                  ; EB | Exchange accumulator bytes
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_20D
; Address: $DDC51A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_20D:
    JMP $6F6F5C          ; 5C 5C 6F 6F | Jump to address long
    LDA $7729,X          ; BD 29 77 | Read graphics status
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_210
; Address: $DDC538
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_210:
    ASL $1C0C            ; 0E 0C 1C | Arithmetic shift left (absolute)
    ROL                  ; 2A | Rotate left (accumulator)
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    BMI $A5              ; 30 A5 | Branch if negative
    LDY #$67             ; A0 67 | Load immediate value into Y register
    LDA                  ; BF 96 AF 84 | Read graphics status
    LDY $70DF,X          ; BC DF 70 | Load from absolute,X into Y register
    CLC                  ; 18 | Clear carry flag
    BMI $02              ; 30 02 | Branch if negative
    CPX #$42             ; E0 42 | Hardware register operation
    SEP #$82             ; E2 82 | Set processor status bits
    DEC $D4              ; C6 D4 | Decrement (zero page)
    STZ $10AE            ; 9C AE 10 | Store zero to absolute
    ROR $B7              ; 66 B7 | Rotate right (zero page)
    CPX $57              ; E4 57 | Compare X register (zero page)
    LSR $5B              ; 46 5B | Logical shift right (zero page)
    PHB                  ; 8B | Push data bank register to stack
    LDA $3D19,X          ; BD 19 3D | Read graphics status
    CLC                  ; 18 | Clear carry flag
    BMI $7F              ; 30 7F | Branch if negative
    ROL                  ; 2A | Rotate left (accumulator)
    LDY $EE4A            ; AC 4A EE | Load from absolute address into Y register
    LDY $EEEF            ; AC EF EE | Load from absolute address into Y register
    PHX                  ; DA | Push X register to stack
    PHX                  ; DA | Push X register to stack
    PHX                  ; DA | Push X register to stack
    DEC                  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_211
; Address: $DDC57B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_211:
    DEC                  ; 3A | Decrement accumulator
    PEA #$EAEA           ; F4 EA EA | Push effective address to stack
    CMP $66D0,X          ; DD D0 66 | Compare accumulator (absolute,X)
    STZ $87              ; 64 87 | Store zero to zero page
    STX $DD              ; 86 DD | Store X register to zero page

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_212
; Address: $DDC58C
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_212:
    JSL $005500          ; 22 00 55 00 | Jump to subroutine long
    SEP #$EA             ; E2 EA | Set processor status bits
    BEQ $E2              ; F0 E2 | Branch if equal
    INC $2E7E,X          ; FE 7E 2E | Increment (absolute,X)
    ROL $181C            ; 2E 1C 18 | Rotate left (absolute)
    ROL                  ; 2A | Rotate left (accumulator)
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    ROL $22              ; 26 22 | Rotate left (zero page)
    LDA                  ; BF 37 B7 2E | Read graphics status
    ASL $3A04,X          ; 1E 04 3A | Arithmetic shift left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    DEC                  ; 3A | Decrement accumulator
    ROR $6A              ; 66 6A | Rotate right (zero page)
    ORA $3929,X          ; 1D 29 39 | Logical OR with accumulator (absolute,X)
    CLI                  ; 58 | Clear interrupt disable flag
    BPL $53              ; 10 53 | Branch if positive
    AND ($26,X)          ; 21 26 | Logical AND with accumulator ((zero page,X))
    ADC $FF3D,X          ; 7D 3D FF | Add with carry (absolute,X)
    LSR $1A07,X          ; 5E 07 1A | Logical shift right (absolute,X)
    AND $1B3C,X          ; 3D 3C 1B | Logical AND with accumulator (absolute,X)
    ORA $0107,Y          ; 19 07 01 | Logical OR with accumulator (absolute,Y)
    LSR $EF56,X          ; 5E 56 EF | Logical shift right (absolute,X)
    EOR ($B3,X)          ; 41 B3 | Exclusive OR with accumulator ((zero page,X))
    CPX #$00             ; E0 00 | Compare X register (immediate)
    STZ $04              ; 64 04 | Store zero to zero page
    ROL $7F06,X          ; 3E 06 7F | Rotate left (absolute,X)
    ORA ($A9,X)          ; 01 A9 | Logical OR with accumulator ((zero page,X))
    EOR ($51,X)          ; 41 51 | Exclusive OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BVC $00              ; 50 00 | Branch if overflow clear
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    BVC $00              ; 50 00 | Branch if overflow clear
    BNE $80              ; D0 80 | Branch if not equal
    SEI                  ; 78 | Set interrupt disable flag
    BMI $78              ; 30 78 | Branch if negative
    BMI $FC              ; 30 FC | Branch if negative
    CLD                  ; D8 | Clear decimal mode flag
    PHA                  ; 48 | Push accumulator to stack
    INC $006C,X          ; FE 6C 00 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_213
; Address: $DDC613
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_213:
    JSR $2080            ; 20 80 20 | Jump to subroutine
    BMI $30              ; 30 30 | Branch if negative
    BMI $30              ; 30 30 | Branch if negative
    CLD                  ; D8 | Clear decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_214
; Address: $DDC61C
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_214:
    PHA                  ; 48 | Push accumulator to stack
    SEI                  ; 78 | Set interrupt disable flag
    JMP ($FE7C)          ; 6C 7C FE | Jump to address (absolute indirect)
    INC $FED4,X          ; FE D4 FE | Increment (absolute,X)
    INC $FE54,X          ; FE 54 FE | Increment (absolute,X)
    INC $FE94,X          ; FE 94 FE | Increment (absolute,X)
    INC $B4A4,X          ; FE A4 B4 | Increment (absolute,X)
    LDY $BC94,X          ; BC 94 BC | Load from absolute,X into Y register
    LDY $BC              ; A4 BC | Load from zero page into Y register
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    SEI                  ; 78 | Set interrupt disable flag
    BVC $F0              ; 50 F0 | Branch if overflow clear
    BMI $00              ; 30 00 | Branch if negative
    DEY                  ; 88 | Decrement Y register
    BRA $18              ; 80 18 | Branch always
    BPL $B0              ; 10 B0 | Branch if positive
    DEY                  ; 88 | Decrement Y register
    CLV                  ; B8 | Clear overflow flag
    DEY                  ; 88 | Decrement Y register
    CLV                  ; B8 | Clear overflow flag
    BNE $90              ; D0 90 | Branch if not equal
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $E0              ; F0 E0 | Game work RAM access
    RTI                  ; 40 | Return from interrupt
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    ROL $22              ; 26 22 | Rotate left (zero page)
    LDA                  ; BF 37 B6 2E | Read graphics status
    ASL $3A04,X          ; 1E 04 3A | Arithmetic shift left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    DEC                  ; 3A | Decrement accumulator
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_215
; Address: $DDC67E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_215:
    ASL $1A              ; 06 1A | Arithmetic shift left (zero page)
    AND #$39             ; 29 39 | Logical AND with accumulator (immediate)
    EOR $5211,Y          ; 59 11 52 | Exclusive OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_216
; Address: $DDC685
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_216:
    JSR $0022            ; 20 22 00 | Jump to subroutine
    AND $01              ; 25 01 | Logical AND with accumulator (zero page)
    EOR $AF00,Y          ; 59 00 AF | Exclusive OR with accumulator (absolute,Y)
    ORA ($BF,X)          ; 01 BF | Logical OR with accumulator ((zero page,X))
    ROL $3D3D            ; 2E 3D 3D | Rotate left (absolute)
    ORA $1B1D,X          ; 1D 1D 1B | Logical OR with accumulator (absolute,X)
    INC                  ; 1A | Increment accumulator
    ROL $26              ; 26 26 | Rotate left (zero page)
    EOR ($50),Y          ; 51 50 | Exclusive OR with accumulator ((zero page),Y)
    BPL $2C              ; 10 2C | Branch if positive
    AND ($10),Y          ; 31 10 | Logical AND with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_217
; Address: $DDC6B2
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_217:
    BPL $14              ; 10 14 | Branch if positive
    ASL $0F1E,X          ; 1E 1E 0F | Arithmetic shift left (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $00              ; 10 00 | Branch if positive
    TAY                  ; A8 | Transfer accumulator to Y register
    BRA $28              ; 80 28 | Branch always
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    INC $FEAC,X          ; FE AC FE | Increment (absolute,X)
    STZ $FF              ; 64 FF | Store zero to zero page
    BRA $10              ; 80 10 | Branch always
    BPL $18              ; 10 18 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    LDY $643C            ; AC 3C 64 | Load from absolute address into Y register
    INC $DAFF,X          ; FE FF DA | Increment (absolute,X)
    ROR                  ; 6A | Rotate right (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    TAX                  ; AA | Transfer accumulator to X register
    DEX                  ; CA | Decrement X register
    PHX                  ; DA | Push X register to stack
    INC $FE6A,X          ; FE 6A FE | Increment (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    ROR $7E2A,X          ; 7E 2A 7E | Rotate right (absolute,X)
    TAX                  ; AA | Transfer accumulator to X register
    LDX $BEAA,Y          ; BE AA BE | Load from absolute,Y into X register
    DEX                  ; CA | Decrement X register
    DEC $DED2,X          ; DE D2 DE | Decrement (absolute,X)
    INC $BE84,X          ; FE 84 BE | Increment (absolute,X)
    PLA                  ; 68 | Pull accumulator from stack
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_218
; Address: $DDC707
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_218:
    JSR $0080            ; 20 80 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    STY $9C              ; 84 9C | Store Y register to zero page
    JMP $2088E8          ; 5C E8 88 20 | Jump to address long
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    ASL $2600,X          ; 1E 00 26 | Arithmetic shift left (absolute,X)
    AND ($7F,X)          ; 21 7F | Logical AND with accumulator ((zero page,X))
    ORA ($16,X)          ; 01 16 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_219
; Address: $DDC74C
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_219:
    CLC                  ; 18 | Clear carry flag
    PHA                  ; 48 | Push accumulator to stack
    AND ($39,X)          ; 21 39 | Logical AND with accumulator ((zero page,X))
    BPL $08              ; 10 08 | Branch if positive
    AND $2414            ; 2D 14 24 | Logical AND with accumulator (absolute)
    ORA $32              ; 05 32 | Logical OR with accumulator (zero page)
    BCC $6E              ; 90 6E | Branch if carry clear
    STA $526D,Y          ; 99 6D 52 | Update graphics data
    ROL                  ; 2A | Rotate left (accumulator)
    BIT $5811            ; 2C 11 58 | Test bits in accumulator (absolute)
    ADC $78              ; 65 78 | Add with carry (zero page)
    AND $1F1F,Y          ; 39 1F 1F | Logical AND with accumulator (absolute,Y)
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ADC ($0D,X)          ; 61 0D | Add with carry ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $7D02,X          ; 1D 02 7D | Logical OR with accumulator (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_21A
; Address: $DDC784
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_21A:
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BPL $FE              ; 10 FE | Branch if positive
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_21B
; Address: $DDC795
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_21B:
    JSR $1000            ; 20 00 10 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    BPL $38              ; 10 38 | Branch if positive
    SEI                  ; 78 | Set interrupt disable flag
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BCS $F0              ; B0 F0 | Branch if carry set
    PHA                  ; 48 | Push accumulator to stack
    CLI                  ; 58 | Clear interrupt disable flag
    ASL $3C              ; 06 3C | Arithmetic shift left (zero page)
    LDY $0400,X          ; BC 00 04 | Load from absolute,X into Y register
    DEY                  ; 88 | Decrement Y register
    RTI                  ; 40 | Return from interrupt
    BRA $18              ; 80 18 | Branch always
    PLP                  ; 28 | Pull processor status from stack
    BMI $CC              ; 30 CC | Branch if negative
    BCS $4C              ; B0 4C | Branch if carry set
    ORA #$76             ; 09 76 | Logical OR with accumulator (immediate)
    TSX                  ; BA | Transfer stack pointer to X register
    LSR $5C              ; 46 5C | Logical shift right (zero page)
    STY $A61A            ; 8C 1A A6 | Store Y register to absolute address
    CPX $587C            ; EC 7C 58 | Compare X register (absolute)
    CLC                  ; 18 | Clear carry flag
    LDY #$70             ; A0 70 | Load immediate value into Y register
    BRA $B8              ; 80 B8 | Branch always
    BNE $5C              ; D0 5C | Branch if not equal
    CPX #$BC             ; E0 BC | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_21C
; Address: $DDC7D8
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_21C:
    LDX $FC40,Y          ; BE 40 FC | Load from absolute,Y into X register
    TYA                  ; 98 | Transfer Y register to accumulator
    CPX #$7F             ; E0 7F | Compare X register (immediate)
    AND ($7F,X)          ; 21 7F | Logical AND with accumulator ((zero page,X))
    ORA ($16,X)          ; 01 16 | Logical OR with accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack
    PHA                  ; 48 | Push accumulator to stack
    AND ($39,X)          ; 21 39 | Logical AND with accumulator ((zero page,X))
    BPL $08              ; 10 08 | Branch if positive
    AND $0414            ; 2D 14 04 | Logical AND with accumulator (absolute)
    ORA $32              ; 05 32 | Logical OR with accumulator (zero page)
    BCC $6E              ; 90 6E | Branch if carry clear
    LDA #$5D             ; A9 5D | Read graphics status
    WDM #$3A             ; 42 3A | Reserved instruction
    BIT $5831            ; 2C 31 58 | Test bits in accumulator (absolute)
    ADC $68              ; 65 68 | Add with carry (zero page)
    DEC                  ; 3A | Decrement accumulator
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    ASL $1D01            ; 0E 01 1D | Arithmetic shift left (absolute)
    DEC                  ; 3A | Decrement accumulator
    AND $7D02,X          ; 3D 02 7D | Logical AND with accumulator (absolute,X)
    ORA $0000,X          ; 1D 00 00 | Logical OR with accumulator (absolute,X)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BCS $F0              ; B0 F0 | Branch if carry set
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    LDY $0400,X          ; BC 00 04 | Load from absolute,X into Y register
    DEY                  ; 88 | Decrement Y register
    RTI                  ; 40 | Return from interrupt
    BRA $18              ; 80 18 | Branch always
    PLP                  ; 28 | Pull processor status from stack
    INY                  ; C8 | Increment Y register
    BCS $4C              ; B0 4C | Branch if carry set
    ORA #$76             ; 09 76 | Logical OR with accumulator (immediate)
    STA $4AB6,Y          ; 99 B6 4A | Update graphics data
    DEY                  ; 88 | Decrement Y register
    INC                  ; 1A | Increment accumulator
    LDX $1E              ; A6 1E | Load from zero page into X register
    CPX $1C              ; E4 1C | Compare X register (zero page)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BRA $70              ; 80 70 | Branch always
    STX $B0              ; 86 B0 | Store X register to zero page
    BNE $50              ; D0 50 | Branch if not equal
    CPX #$B8             ; E0 B8 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_21D
; Address: $DDC858
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_21D:
    LDX $FC40,Y          ; BE 40 FC | Load from absolute,Y into X register
    SED                  ; F8 | Set decimal mode flag
    BRA $00              ; 80 00 | Branch always
    ORA $1F00            ; 0D 00 1F | Logical OR with accumulator (absolute)
    BPL $7F              ; 10 7F | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BPL $10              ; 10 10 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ROL $1F00,X          ; 3E 00 1F | Rotate left (absolute,X)
    ROL $3F01,X          ; 3E 01 3F | Rotate left (absolute,X)
    BPL $1B              ; 10 1B | Branch if positive
    BIT $3000            ; 2C 00 30 | Test bits in accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    BPL $19              ; 10 19 | Branch if positive
    BPL $11              ; 10 11 | Branch if positive
    BIT $0A              ; 24 0A | Test bits in accumulator (zero page)
    BIT $4C12            ; 2C 12 4C | Test bits in accumulator (absolute)
    JMP $1A2223          ; 5C 23 22 1A | Jump to address long
    ASL $1201,X          ; 1E 01 12 | Arithmetic shift left (absolute,X)
    AND $500F,X          ; 3D 0F 50 | Logical AND with accumulator (absolute,X)
    ASL $3F41,X          ; 1E 41 3F | Arithmetic shift left (absolute,X)
    ORA $0000,X          ; 1D 00 00 | Logical OR with accumulator (absolute,X)
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_220
; Address: $DDC8D7
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_220:
    JSR $7020            ; 20 20 70 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    STY $3C70            ; 8C 70 3C | Store Y register to absolute address
    BNE $68              ; D0 68 | Branch if not equal
    BNE $08              ; D0 08 | Branch if not equal
    BEQ $90              ; F0 90 | Branch if equal
    CPX #$B8             ; E0 B8 | Compare X register (immediate)
    BRA $18              ; 80 18 | Branch always
    RTI                  ; 40 | Return from interrupt
    STY $0080            ; 8C 80 00 | Store Y register to absolute address
    BRA $40              ; 80 40 | Branch always
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BCS $5C              ; B0 5C | Branch if carry set
    BCC $3C              ; 90 3C | Branch if carry clear
    BNE $BC              ; D0 BC | Branch if not equal
    CLI                  ; 58 | Clear interrupt disable flag
    INY                  ; C8 | Increment Y register
    DEY                  ; 88 | Decrement Y register
    STY $F804            ; 8C 04 F8 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_221
; Address: $DDC90E
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_221:
    SEI                  ; 78 | Set interrupt disable flag
    BRA $10              ; 80 10 | Branch always
    BCS $10              ; B0 10 | Branch if carry set
    CLC                  ; 18 | Clear carry flag
    BPL $88              ; 10 88 | Branch if positive
    BCS $7C              ; B0 7C | Branch if carry set
    SED                  ; F8 | Set decimal mode flag
    STY $F870            ; 8C 70 F8 | Store Y register to absolute address
    BRA $7F              ; 80 7F | Branch always
    ROL $3F01,X          ; 3E 01 3F | Rotate left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    BIT $3000            ; 2C 00 30 | Test bits in accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BPL $06              ; 10 06 | Branch if positive
    ORA $2A16,Y          ; 19 16 2A | Logical OR with accumulator (absolute,Y)
    BIT $4C12            ; 2C 12 4C | Test bits in accumulator (absolute)
    JMP $0E3023          ; 5C 23 30 0E | Jump to address long
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    ASL $10              ; 06 10 | Arithmetic shift left (zero page)
    BMI $00              ; 30 00 | Branch if negative
    EOR ($1A),Y          ; 51 1A | Exclusive OR with accumulator ((zero page),Y)
    EOR ($3F,X)          ; 41 3F | Exclusive OR with accumulator ((zero page,X))
    ORA ($8C,X)          ; 01 8C | Logical OR with accumulator ((zero page,X))
    BVS $3C              ; 70 3C | Branch if overflow set
    BNE $68              ; D0 68 | Branch if not equal
    BNE $08              ; D0 08 | Branch if not equal
    BEQ $90              ; F0 90 | Branch if equal
    CPX #$B8             ; E0 B8 | Compare X register (immediate)
    BRA $18              ; 80 18 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    BRA $70              ; 80 70 | Branch always
    BCC $3C              ; 90 3C | Branch if carry clear
    BCS $7C              ; B0 7C | Branch if carry set
    SEI                  ; 78 | Set interrupt disable flag
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    STY $B884            ; 8C 84 B8 | Store Y register to absolute address
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_222
; Address: $DDC98F
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_222:
    JSR $7090            ; 20 90 70 | Jump to subroutine
    BCS $60              ; B0 60 | Branch if carry set
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $88              ; F0 88 | Branch if equal
    BEQ $7C              ; F0 7C | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    STY $7870            ; 8C 70 78 | Store Y register to absolute address
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_223
; Address: $DDC9A9
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_223:
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    ASL $2C00,X          ; 1E 00 2C | Arithmetic shift left (absolute,X)
    ORA $0718            ; 0D 18 07 | Logical OR with accumulator (absolute)
    ASL $3B62,X          ; 1E 62 3B | Arithmetic shift left (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_224
; Address: $DDC9D0
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_224:
    JSR $1030            ; 20 30 10 | Jump to subroutine
    BPL $00              ; 10 00 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    AND $0A14            ; 2D 14 0A | Logical AND with accumulator (absolute)
    BCC $6C              ; 90 6C | Branch if carry clear
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $243363          ; 5C 63 33 24 | Jump to address long
    JMP ($3A30)          ; 6C 30 3A | Jump to address (absolute indirect)
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    ORA $0000,X          ; 1D 00 00 | Logical OR with accumulator (absolute,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BPL $FC              ; 10 FC | Branch if positive
    BPL $FE              ; 10 FE | Branch if positive

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_225
; Address: $DDCA0D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_225:
    JSR $807E            ; 20 7E 80 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BMI $10              ; 30 10 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    BPL $38              ; 10 38 | Branch if positive

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_226
; Address: $DDCA1C
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_226:
    JSR $0078            ; 20 78 00 | Jump to subroutine
    BIT $3E              ; 24 3E | Test bits in accumulator (zero page)
    CPY #$DE             ; C0 DE | Compare Y register (immediate)
    LDY #$6C             ; A0 6C | Load immediate value into Y register
    BCS $1C              ; B0 1C | Branch if carry set
    CPX #$30             ; E0 30 | Compare X register (immediate)
    CPX #$68             ; E0 68 | Compare X register (immediate)
    PHA                  ; 48 | Push accumulator to stack
    SEC                  ; 38 | Set carry flag
    INY                  ; C8 | Increment Y register
    STY $0C00            ; 8C 00 0C | Store Y register to absolute address
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    BRA $0C              ; 80 0C | Branch always
    SBC #$16             ; E9 16 | Subtract with carry (immediate)
    SBC $EA16,Y          ; F9 16 EA | Subtract with carry (absolute,Y)
    BRA $64              ; 80 64 | Branch always
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_227
; Address: $DDCA48
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_227:
    REP #$CE             ; C2 CE | Reset processor status bits
    ASL $1C              ; 06 1C | Arithmetic shift left (zero page)
    STZ $F878            ; 9C 78 F8 | Store zero to absolute
    BRA $10              ; 80 10 | Branch always
    ASL $10              ; 06 10 | Arithmetic shift left (zero page)
    BPL $80              ; 10 80 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    BCS $CE              ; B0 CE | Branch if carry set
    BEQ $1C              ; F0 1C | Branch if equal
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    BRA $7C              ; 80 7C | Branch always
    ORA $0718            ; 0D 18 07 | Logical OR with accumulator (absolute)
    WDM #$3B             ; 42 3B | Reserved instruction

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_228
; Address: $DDCA70
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_228:
    JSR $1030            ; 20 30 10 | Jump to subroutine
    BPL $00              ; 10 00 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    AND $2A14            ; 2D 14 2A | Logical AND with accumulator (absolute)
    BCC $6C              ; 90 6C | Branch if carry clear
    TYA                  ; 98 | Transfer Y register to accumulator
    JMP ($0353)          ; 6C 53 03 | Jump to address (absolute indirect)
    BIT $14              ; 24 14 | Test bits in accumulator (zero page)
    PLA                  ; 68 | Pull accumulator from stack
    BMI $39              ; 30 39 | Branch if negative
    ASL $011F,X          ; 1E 1F 01 | Arithmetic shift left (absolute,X)
    SEC                  ; 38 | Set carry flag
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    CPY #$DE             ; C0 DE | Compare Y register (immediate)
    LDY #$6C             ; A0 6C | Load immediate value into Y register
    BCS $1C              ; B0 1C | Branch if carry set
    CPX #$30             ; E0 30 | Compare X register (immediate)
    CPX #$78             ; E0 78 | Compare X register (immediate)
    PHA                  ; 48 | Push accumulator to stack
    CPY $8C72            ; CC 72 8C | Compare Y register (absolute)
    PLP                  ; 28 | Pull processor status from stack
    STY $08              ; 84 08 | Store Y register to zero page
    RTI                  ; 40 | Return from interrupt
    STY $0C80            ; 8C 80 0C | Store Y register to absolute address
    SBC #$16             ; E9 16 | Subtract with carry (immediate)
    INC                  ; 1A | Increment accumulator
    SEP #$8C             ; E2 8C | Set processor status bits
    JMP ($9A24)          ; 6C 24 9A | Jump to address (absolute indirect)
    STX $36              ; 86 36 | Store X register to zero page
    JMP $201858          ; 5C 58 18 20 | Jump to address long
    BPL $00              ; 10 00 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    BPL $8C              ; 10 8C | Branch if positive
    BCC $2C              ; 90 2C | Branch if carry clear
    BCS $9E              ; B0 9E | Branch if carry set
    CPX #$3C             ; E0 3C | Compare X register (immediate)
    CPY #$B8             ; C0 B8 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_229
; Address: $DDCADF
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_229:
    CPX #$31             ; E0 31 | Compare X register (immediate)
    ASL $0B3C            ; 0E 3C 0B | Arithmetic shift left (absolute)
    BPL $0F              ; 10 0F | Branch if positive
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    BPL $09              ; 10 09 | Branch if positive
    ASL $0C11,X          ; 1E 11 0C | Arithmetic shift left (absolute,X)
    ORA $1B12,X          ; 1D 12 1B | Logical OR with accumulator (absolute,X)
    ORA ($3E),Y          ; 11 3E | Logical OR with accumulator ((zero page),Y)
    ROL $3120,X          ; 3E 20 31 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_22A
; Address: $DDCB0C
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_22A:
    JSR $1E1F            ; 20 1F 1E | Jump to subroutine
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    ORA ($05),Y          ; 11 05 | Logical OR with accumulator ((zero page),Y)
    ROL $311F,X          ; 3E 1F 31 | Rotate left (absolute,X)
    ASL $001F            ; 0E 1F 00 | Arithmetic shift left (absolute)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    INC $7C00,X          ; FE 00 7C | Increment (absolute,X)
    BRA $FC              ; 80 FC | Branch always
    SED                  ; F8 | Set decimal mode flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BNE $D0              ; D0 D0 | Branch if not equal
    PHP                  ; 08 | Push processor status to stack
    CLD                  ; D8 | Clear decimal mode flag
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BMI $C0              ; 30 C0 | Branch if negative
    SEC                  ; 38 | Set carry flag
    CPY #$31             ; C0 31 | Compare Y register (immediate)
    ASL $0B3C            ; 0E 3C 0B | Arithmetic shift left (absolute)
    BPL $0F              ; 10 0F | Branch if positive
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_22B
; Address: $DDCB5E
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_22B:
    JSR $5F08            ; 20 08 5F | Jump to subroutine
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    ROL $1518,X          ; 3E 18 15 | Rotate left (absolute,X)
    ORA ($3E),Y          ; 11 3E | Logical OR with accumulator ((zero page),Y)
    ROL $3120,X          ; 3E 20 31 | Rotate left (absolute,X)
    AND ($1D,X)          ; 21 1D | Logical AND with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    ORA #$11             ; 09 11 | Logical OR with accumulator (immediate)
    ROL $311F,X          ; 3E 1F 31 | Rotate left (absolute,X)
    ASL $001E            ; 0E 1E 00 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_22C
; Address: $DDCB80
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_22C:
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    BRA $FC              ; 80 FC | Branch always
    SED                  ; F8 | Set decimal mode flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    PLP                  ; 28 | Pull processor status from stack
    INX                  ; E8 | Increment X register
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    SEC                  ; 38 | Set carry flag
    CPY #$18             ; C0 18 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_22D
; Address: $DDCBBE
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_22D:
    JSR $131F            ; 20 1F 13 | Jump to subroutine
    BPL $1B              ; 10 1B | Branch if positive
    ORA $2F0F,Y          ; 19 0F 2F | Logical OR with accumulator (absolute,Y)
    BPL $03              ; 10 03 | Branch if positive
    ROL                  ; 2A | Rotate left (accumulator)
    ASL $1F20            ; 0E 20 1F | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_22E
; Address: $DDCBD2
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_22E:
    JSR $201F            ; 20 1F 20 | Jump to subroutine
    BPL $0F              ; 10 0F | Branch if positive
    DEC                  ; 3A | Decrement accumulator
    BVS $34              ; 70 34 | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    BIT $5F              ; 24 5F | Test bits in accumulator (zero page)
    BMI $3F              ; 30 3F | Branch if negative
    ASL $1F              ; 06 1F | Arithmetic shift left (zero page)
    BPL $12              ; 10 12 | Branch if positive
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_22F
; Address: $DDCC0C
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_22F:
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    PLA                  ; 68 | Pull accumulator from stack
    SEI                  ; 78 | Set interrupt disable flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_230
; Address: $DDCC1A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_230:
    BCC $60              ; 90 60 | Branch if carry clear
    PHP                  ; 08 | Push processor status to stack
    BEQ $84              ; F0 84 | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    INY                  ; C8 | Increment Y register
    CLD                  ; D8 | Clear decimal mode flag
    TYA                  ; 98 | Transfer Y register to accumulator
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_231
; Address: $DDCC25
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_231:
    BEQ $F4              ; F0 F4 | Branch if equal
    BEQ $F4              ; F0 F4 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    INX                  ; E8 | Increment X register
    BEQ $05              ; F0 05 | Branch if equal
    DEC $55              ; C6 55 | Decrement (zero page)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $06              ; F0 06 | Branch if equal
    INX                  ; E8 | Increment X register
    PEA #$0E5C           ; F4 5C 0E | Push effective address to stack
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_232
; Address: $DDCC43
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_232:
    JSR $18E8            ; 20 E8 18 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    PLA                  ; 68 | Pull accumulator from stack
    TYA                  ; 98 | Transfer Y register to accumulator
    PLA                  ; 68 | Pull accumulator from stack
    INX                  ; E8 | Increment X register
    BPL $18              ; 10 18 | Branch if positive
    BEQ $F0              ; F0 F0 | Branch if equal
    RTI                  ; 40 | Return from interrupt
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_233
; Address: $DDCC52
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_233:
    JSR $F8D8            ; 20 D8 F8 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    RTI                  ; 40 | Return from interrupt
    CPX #$13             ; E0 13 | Compare X register (immediate)
    BPL $1B              ; 10 1B | Branch if positive
    ORA $2F0F,Y          ; 19 0F 2F | Logical OR with accumulator (absolute,Y)
    LDY #$63             ; A0 63 | Load immediate value into Y register
    TAX                  ; AA | Transfer accumulator to X register
    ROR $1F20            ; 6E 20 1F | Rotate right (absolute)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_235
; Address: $DDCC7C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_235:
    BIT $2F30            ; 2C 30 2F | Test bits in accumulator (absolute)
    DEC                  ; 3A | Decrement accumulator
    INY                  ; C8 | Increment Y register
    CLD                  ; D8 | Clear decimal mode flag
    TYA                  ; 98 | Transfer Y register to accumulator
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $F4              ; F0 F4 | Branch if equal
    BEQ $F4              ; F0 F4 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_236
; Address: $DDCC8B
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_236:
    BEQ $08              ; F0 08 | Branch if equal
    CPY #$54             ; C0 54 | Compare Y register (immediate)
    BVS $04              ; 70 04 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$30             ; E0 30 | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    BEQ $5C              ; F0 5C | Branch if equal
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    BPL $0F              ; 10 0F | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ORA $3F1F,X          ; 1D 1F 3F | Logical OR with accumulator (absolute,X)
    AND $1D1D,X          ; 3D 1D 1D | Logical AND with accumulator (absolute,X)
    ASL $0507            ; 0E 07 05 | Arithmetic shift left (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_237
; Address: $DDCCD2
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_237:
    JSR $001F            ; 20 1F 00 | Jump to subroutine
    ASL $0C00,X          ; 1E 00 0C | Arithmetic shift left (absolute,X)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ORA $0407,Y          ; 19 07 04 | Logical OR with accumulator (absolute,Y)
    BPL $19              ; 10 19 | Branch if positive
    ASL $1F              ; 06 1F | Arithmetic shift left (zero page)
    ASL $0107,X          ; 1E 07 01 | Arithmetic shift left (absolute,X)
    BIT $07              ; 24 07 | Test bits in accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    BVS $F0              ; 70 F0 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BVS $00              ; 70 00 | Branch if overflow set
    DEY                  ; 88 | Decrement Y register
    BVS $04              ; 70 04 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt
    CPX $ECC4            ; EC C4 EC | Compare X register (absolute)
    STY $2CAC            ; 8C AC 2C | Store Y register to absolute address
    CLI                  ; 58 | Clear interrupt disable flag
    PLP                  ; 28 | Pull processor status from stack
    BEQ $08              ; F0 08 | Branch if equal
    BCS $10              ; B0 10 | Branch if carry set
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPY $8C52            ; CC 52 8C | Compare Y register (absolute)
    BRA $08              ; 80 08 | Branch always

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_239
; Address: $DDCD3B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_239:
    RTI                  ; 40 | Return from interrupt
    BEQ $00              ; F0 00 | Branch if equal
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BPL $90              ; 10 90 | Branch if positive
    BPL $A0              ; 10 A0 | Branch if positive

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_23A
; Address: $DDCD4B
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_23A:
    JSR $20F0            ; 20 F0 20 | Jump to subroutine
    CLD                  ; D8 | Clear decimal mode flag
    BPL $A8              ; 10 A8 | Branch if positive
    BNE $30              ; D0 30 | Branch if not equal
    CPY #$E0             ; C0 E0 | Game work RAM access
    BPL $F0              ; 10 F0 | Branch if positive
    BCC $60              ; 90 60 | Branch if carry clear
    LDY #$40             ; A0 40 | Load immediate value into Y register
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BPL $70              ; 10 70 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ORA $3F1F,X          ; 1D 1F 3F | Logical OR with accumulator (absolute,X)
    AND $1D1D,X          ; 3D 1D 1D | Logical AND with accumulator (absolute,X)
    ASL $0507            ; 0E 07 05 | Arithmetic shift left (absolute)
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_23B
; Address: $DDCD70
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_23B:
    JSR $201F            ; 20 1F 20 | Jump to subroutine
    ASL $0C00,X          ; 1E 00 0C | Arithmetic shift left (absolute,X)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    INC                  ; 1A | Increment accumulator
    ORA $080F,Y          ; 19 0F 08 | Logical OR with accumulator (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    ORA $0001            ; 0D 01 00 | Logical OR with accumulator (absolute)
    ASL $0C16            ; 0E 16 0C | Arithmetic shift left (absolute)
    INC                  ; 1A | Increment accumulator
    ASL $0F00            ; 0E 00 0F | Arithmetic shift left (absolute)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    CPX $ECC4            ; EC C4 EC | Compare X register (absolute)
    STY $2CAC            ; 8C AC 2C | Store Y register to absolute address
    CLI                  ; 58 | Clear interrupt disable flag
    PLP                  ; 28 | Pull processor status from stack
    BEQ $08              ; F0 08 | Branch if equal
    BCS $10              ; B0 10 | Branch if carry set
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPY $8C52            ; CC 52 8C | Compare Y register (absolute)
    BRA $08              ; 80 08 | Branch always

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_23E
; Address: $DDCDC0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_23E:
    JSR $1020            ; 20 20 10 | Jump to subroutine
    BMI $00              ; 30 00 | Branch if negative
    BMI $70              ; 30 70 | Branch if negative
    BCC $D0              ; 90 D0 | Branch if carry clear
    BPL $38              ; 10 38 | Branch if positive

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_240
; Address: $DDCDD0
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_240:
    JSR $B0C0            ; 20 C0 B0 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_242
; Address: $DDCDDA
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_242:
    JSR $C0C0            ; 20 C0 C0 | Jump to subroutine
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA ($17,X)          ; 01 17 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    BPL $0F              ; 10 0F | Branch if positive

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_243
; Address: $DDCDFE
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_243:
    JSR $111F            ; 20 1F 11 | Jump to subroutine
    ORA $1D3D,Y          ; 19 3D 1D | Logical OR with accumulator (absolute,Y)
    INC                  ; 1A | Increment accumulator
    DEC                  ; 3A | Decrement accumulator
    CLC                  ; 18 | Clear carry flag
    ASL $0318            ; 0E 18 03 | Arithmetic shift left (absolute)
    ROL                  ; 2A | Rotate left (accumulator)
    ASL $1D22            ; 0E 22 1D | Arithmetic shift left (absolute)
    ORA $1801,X          ; 1D 01 18 | Logical OR with accumulator (absolute,X)
    BPL $02              ; 10 02 | Branch if positive
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    BPL $0F              ; 10 0F | Branch if positive
    DEC                  ; 3A | Decrement accumulator
    BVS $34              ; 70 34 | Branch if overflow set
    PHA                  ; 48 | Push accumulator to stack
    EOR #$26             ; 49 26 | Exclusive OR with accumulator (immediate)
    ORA $1212,Y          ; 19 12 12 | Logical OR with accumulator (absolute,Y)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BPL $0F              ; 10 0F | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPY #$E0             ; C0 E0 | Game work RAM access
    DEY                  ; 88 | Decrement Y register
    INY                  ; C8 | Increment Y register
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BPL $E0              ; 10 E0 | Game work RAM access
    PHP                  ; 08 | Push processor status to stack
    BEQ $04              ; F0 04 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_244
; Address: $DDCE62
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_244:
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    TAY                  ; A8 | Transfer accumulator to Y register
    PHA                  ; 48 | Push accumulator to stack
    BEQ $1C              ; F0 1C | Branch if equal
    BEQ $16              ; F0 16 | Branch if equal
    CPY $59              ; C4 59 | Compare Y register (zero page)
    ROR $F804,X          ; 7E 04 F8 | Rotate right (absolute,X)
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_245
; Address: $DDCE74
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_245:
    JSR $0098            ; 20 98 00 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_246
; Address: $DDCE7C
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_246:
    JSR $F80A            ; 20 0A F8 | Jump to subroutine
    CLI                  ; 58 | Clear interrupt disable flag
    ORA $1636,X          ; 1D 36 16 | Logical OR with accumulator (absolute,X)
    BEQ $C8              ; F0 C8 | Branch if equal
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    TYA                  ; 98 | Transfer Y register to accumulator
    PHP                  ; 08 | Push processor status to stack
    TAY                  ; A8 | Transfer accumulator to Y register
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BEQ $B0              ; F0 B0 | Branch if equal
    BRA $30              ; 80 30 | Branch always
    CPY #$D0             ; C0 D0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_247
; Address: $DDCE93
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_247:
    JSR $00F8            ; 20 F8 00 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    TYA                  ; 98 | Transfer Y register to accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_248
; Address: $DDCE9A
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_248:
    CLV                  ; B8 | Clear overflow flag
    RTI                  ; 40 | Return from interrupt
    BEQ $00              ; F0 00 | Branch if equal
    BRA $E0              ; 80 E0 | Game work RAM access
    ORA ($19),Y          ; 11 19 | Logical OR with accumulator ((zero page),Y)
    AND $3C1D,X          ; 3D 1D 3C | Logical AND with accumulator (absolute,X)
    INC                  ; 1A | Increment accumulator
    DEC                  ; 3A | Decrement accumulator
    SEC                  ; 38 | Set carry flag
    ASL $2368            ; 0E 68 23 | Arithmetic shift left (absolute)
    TXS                  ; 9A | Transfer X register to stack pointer
    ROR $1D22,X          ; 7E 22 1D | Rotate right (absolute,X)
    ORA $1801,X          ; 1D 01 18 | Logical OR with accumulator (absolute,X)
    BPL $02              ; 10 02 | Branch if positive
    AND ($04),Y          ; 31 04 | Logical AND with accumulator ((zero page),Y)
    BVC $1F              ; 50 1F | Branch if overflow clear
    INC                  ; 1A | Increment accumulator
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_249
; Address: $DDCEC1
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_249:
    TYA                  ; 98 | Transfer Y register to accumulator
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    TAY                  ; A8 | Transfer accumulator to Y register
    PHA                  ; 48 | Push accumulator to stack
    BEQ $18              ; F0 18 | Branch if equal
    BEQ $18              ; F0 18 | Branch if equal
    CPY #$54             ; C0 54 | Compare Y register (immediate)
    BVS $04              ; 70 04 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_24A
; Address: $DDCED4
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_24A:
    JSR $0098            ; 20 98 00 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_24B
; Address: $DDCEDC
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_24B:
    JSR $F008            ; 20 08 F0 | Jump to subroutine
    JMP $000000          ; 5C 00 00 00 | Jump to address long
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    BPL $00              ; 10 00 | Branch if positive
    ORA ($08),Y          ; 11 08 | Logical OR with accumulator ((zero page),Y)
    ORA ($1B,X)          ; 01 1B | Logical OR with accumulator ((zero page,X))
    BMI $19              ; 30 19 | Branch if negative
    SEC                  ; 38 | Set carry flag
    XBA                  ; EB | Exchange accumulator bytes
    RTI                  ; 40 | Return from interrupt
    ORA $20              ; 05 20 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_24C
; Address: $DDCF12
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_24C:
    JSR $0004            ; 20 04 00 | Jump to subroutine
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BVS $00              ; 70 00 | Branch if overflow set
    ASL $1004,X          ; 1E 04 10 | Arithmetic shift left (absolute,X)
    PHA                  ; 48 | Push accumulator to stack
    BVC $27              ; 50 27 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_24D
; Address: $DDCF26
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_24D:
    JSR $240F            ; 20 0F 24 | Jump to subroutine
    BPL $04              ; 10 04 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BVC $C0              ; 50 C0 | Branch if overflow clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_24E
; Address: $DDCF58
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_24E:
    RTI                  ; 40 | Return from interrupt
    BCS $00              ; B0 00 | Branch if carry set
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_250
; Address: $DDCF61
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_250:
    PLA                  ; 68 | Pull accumulator from stack
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    BIT $DCF8            ; 2C F8 DC | Test bits in accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_251
; Address: $DDCF69
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_251:
    SED                  ; F8 | Set decimal mode flag
    SBC $D7F6            ; ED F6 D7 | Subtract with carry (absolute)
    SEP #$12             ; E2 12 | Set processor status bits
    BCS $84              ; B0 84 | Branch if carry set
    BPL $04              ; 10 04 | Branch if positive
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_252
; Address: $DDCF81
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_252:
    JSR $F812            ; 20 12 F8 | Jump to subroutine
    ORA #$E6             ; 09 E6 | Logical OR with accumulator (immediate)
    ASL $F0              ; 06 F0 | Arithmetic shift left (zero page)
    BEQ $68              ; F0 68 | Branch if equal
    CPX #$70             ; E0 70 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    BIT $F8              ; 24 F8 | Test bits in accumulator (zero page)
    BEQ $F4              ; F0 F4 | Branch if equal
    BEQ $E0              ; F0 E0 | Game work RAM access
    CLD                  ; D8 | Clear decimal mode flag
    BEQ $38              ; F0 38 | Branch if equal
    BEQ $90              ; F0 90 | Branch if equal
    CPX #$80             ; E0 80 | Compare X register (immediate)
    ORA ($1B,X)          ; 01 1B | Logical OR with accumulator ((zero page,X))
    BMI $19              ; 30 19 | Branch if negative
    SEC                  ; 38 | Set carry flag
    XBA                  ; EB | Exchange accumulator bytes
    PHA                  ; 48 | Push accumulator to stack
    ORA $0820            ; 0D 20 08 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_253
; Address: $DDCFB2
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_253:
    JSR $0004            ; 20 04 00 | Jump to subroutine
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BVS $00              ; 70 00 | Branch if overflow set
    ASL $600C,X          ; 1E 0C 60 | Arithmetic shift left (absolute,X)
    PLA                  ; 68 | Pull accumulator from stack
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    BIT $DCF8            ; 2C F8 DC | Test bits in accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SBC $D7F6            ; ED F6 D7 | Subtract with carry (absolute)
    SEP #$02             ; E2 02 | Set processor status bits
    LDY #$84             ; A0 84 | Load immediate value into Y register
    BPL $04              ; 10 04 | Branch if positive
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_254
; Address: $DDCFDF
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_254:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    BPL $04              ; 10 04 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    BIT $E8              ; 24 E8 | Test bits in accumulator (zero page)
    AND $062E            ; 2D 2E 06 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_255
; Address: $DDD010
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_255:
    JSR $2003            ; 20 03 20 | Jump to subroutine
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BMI $00              ; 30 00 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    INX                  ; E8 | Increment X register
    STX $B4              ; 86 B4 | Store X register to zero page
    LSR $74              ; 46 74 | Logical shift right (zero page)
    CLD                  ; D8 | Clear decimal mode flag
    PLP                  ; 28 | Pull processor status from stack
    BNE $08              ; D0 08 | Branch if not equal
    BCS $10              ; B0 10 | Branch if carry set
    CPX #$04             ; E0 04 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_257
; Address: $DDD078
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_257:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BPL $50              ; 10 50 | Branch if positive
    PLA                  ; 68 | Pull accumulator from stack
    INX                  ; E8 | Increment X register
    PHP                  ; 08 | Push processor status to stack
    CPY #$28             ; C0 28 | Compare Y register (immediate)
    BEQ $D0              ; F0 D0 | Branch if equal
    CPX #$98             ; E0 98 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_258
; Address: $DDD090
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_258:
    BEQ $40              ; F0 40 | Branch if equal
    CLD                  ; D8 | Clear decimal mode flag
    BVS $70              ; 70 70 | Branch if overflow set
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPX #$D0             ; E0 D0 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BVS $00              ; 70 00 | Branch if overflow set
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ASL $0407            ; 0E 07 04 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_259
; Address: $DDD0B0
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_259:
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ASL $0C07            ; 0E 07 0C | Arithmetic shift left (absolute)
    ORA $0E              ; 05 0E | Logical OR with accumulator (zero page)
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    INY                  ; C8 | Increment Y register
    BEQ $70              ; F0 70 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$40             ; E0 40 | Compare X register (immediate)
    BCC $A0              ; 90 A0 | Branch if carry clear
    BMI $00              ; 30 00 | Branch if negative
    BMI $80              ; 30 80 | Branch if negative
    BPL $20              ; 10 20 | Branch if positive
    BMI $F0              ; 30 F0 | Branch if negative
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ASL $0B0E            ; 0E 0E 0B | Arithmetic shift left (absolute)
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    ORA $1100            ; 0D 00 11 | Logical OR with accumulator (absolute)
    BPL $00              ; 10 00 | Branch if positive
    INC                  ; 1A | Increment accumulator
    ORA $1B2A,X          ; 1D 2A 1B | Logical OR with accumulator (absolute,X)
    BPL $25              ; 10 25 | Branch if positive
    ADC $46E8            ; 6D E8 46 | Add with carry (absolute)
    JMP $200B            ; 4C 0B 20 | Jump to address

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_25A
; Address: $DDD112
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_25A:
    JSL $000400          ; 22 00 04 00 | Jump to subroutine long
    PHP                  ; 08 | Push processor status to stack
    PLY                  ; 7A | Pull Y register from stack
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $1C18            ; 0E 18 1C | Arithmetic shift left (absolute)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_25B
; Address: $DDD126
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_25B:
    JSR $101F            ; 20 1F 10 | Jump to subroutine
    ASL $0716            ; 0E 16 07 | Arithmetic shift left (absolute)
    ASL $0100            ; 0E 00 01 | Arithmetic shift left (absolute)
    AND $5C1C            ; 2D 1C 5C | Logical AND with accumulator (absolute)
    ASL $0B07            ; 0E 07 0B | Arithmetic shift left (absolute)
    ORA #$07             ; 09 07 | Logical OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BMI $F0              ; 30 F0 | Branch if negative
    BCC $B0              ; 90 B0 | Branch if carry clear
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BMI $00              ; 30 00 | Branch if negative
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_25C
; Address: $DDD15E
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_25C:
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    INY                  ; C8 | Increment Y register
    SED                  ; F8 | Set decimal mode flag
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    JMP $E82CD8          ; 5C D8 2C E8 | Jump to address long
    PHP                  ; 08 | Push processor status to stack
    LDY $4D              ; A4 4D | Load from zero page into Y register
    SEP #$22             ; E2 22 | Set processor status bits
    CPY #$04             ; C0 04 | Compare Y register (immediate)
    CPY $00              ; C4 00 | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_25D
; Address: $DDD174
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_25D:
    JSR $1000            ; 20 00 10 | Jump to subroutine
    LSR $0000,X          ; 5E 00 00 | Logical shift right (absolute,X)
    CLC                  ; 18 | Clear carry flag
    PHA                  ; 48 | Push accumulator to stack
    PLA                  ; 68 | Pull accumulator from stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STZ $04              ; 64 04 | Store zero to zero page
    BEQ $28              ; F0 28 | Branch if equal
    BVS $08              ; 70 08 | Branch if overflow set
    CPX #$50             ; E0 50 | Compare X register (immediate)
    CPY #$A0             ; C0 A0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDY $3038            ; AC 38 30 | Load from absolute address into Y register
    SED                  ; F8 | Set decimal mode flag
    BVS $E0              ; 70 E0 | Game work RAM access
    CLD                  ; D8 | Clear decimal mode flag
    BEQ $10              ; F0 10 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    INC                  ; 1A | Increment accumulator
    ORA $1B2A,X          ; 1D 2A 1B | Logical OR with accumulator (absolute,X)
    BPL $25              ; 10 25 | Branch if positive
    ADC $46E8            ; 6D E8 46 | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_25E
; Address: $DDD1B0
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_25E:
    JSR $2204            ; 20 04 22 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    PLY                  ; 7A | Pull Y register from stack
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register
    SED                  ; F8 | Set decimal mode flag
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    JMP $E82CD8          ; 5C D8 2C E8 | Jump to address long
    PHP                  ; 08 | Push processor status to stack
    LDY $4D              ; A4 4D | Load from zero page into Y register
    SEP #$32             ; E2 32 | Set processor status bits
    BNE $04              ; D0 04 | Branch if not equal
    CPY $00              ; C4 00 | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_25F
; Address: $DDD1D4
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_25F:
    JSR $1000            ; 20 00 10 | Jump to subroutine
    LSR $0000,X          ; 5E 00 00 | Logical shift right (absolute,X)
    CLC                  ; 18 | Clear carry flag
    BPL $00              ; 10 00 | Branch if positive
    INC                  ; 1A | Increment accumulator
    EOR #$0F             ; 49 0F | Exclusive OR with accumulator (immediate)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    BMI $00              ; 30 00 | Branch if negative
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    BPL $20              ; 10 20 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND $7EDE,Y          ; 39 DE 7E | Logical AND with accumulator (absolute,Y)
    STA                  ; 9F 3F EF 5F | Update graphics data
    BPL $74              ; 10 74 | Branch if positive
    SEC                  ; 38 | Set carry flag
    AND ($3E,X)          ; 21 3E | Logical AND with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_260
; Address: $DDD21E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_260:
    BPL $1F              ; 10 1F | Branch if positive
    LSR $1F              ; 46 1F | Logical shift right (zero page)
    RTI                  ; 40 | Return from interrupt
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_261
; Address: $DDD226
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_261:
    JSR $201F            ; 20 1F 20 | Jump to subroutine
    AND ($11),Y          ; 31 11 | Logical AND with accumulator ((zero page),Y)
    ORA $090F,Y          ; 19 0F 09 | Logical OR with accumulator (absolute,Y)
    ORA $39              ; 05 39 | Logical OR with accumulator (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($1F),Y          ; 11 1F | Logical OR with accumulator ((zero page),Y)
    LDY #$20             ; A0 20 | Load immediate value into Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    BPL $14              ; 10 14 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    BIT $6238            ; 2C 38 62 | Test bits in accumulator (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_264
; Address: $DDD258
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_264:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    STZ $F400            ; 9C 00 F4 | Store zero to absolute
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    WDM #$9C             ; 42 9C | Reserved instruction
    SBC $FA              ; E5 FA | Subtract with carry (zero page)
    PEA #$F000           ; F4 00 F0 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_265
; Address: $DDD274
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_265:
    BEQ $00              ; F0 00 | Branch if equal
    INY                  ; C8 | Increment Y register
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    SEI                  ; 78 | Set interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    BEQ $18              ; F0 18 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    EOR #$F6             ; 49 F6 | Exclusive OR with accumulator (immediate)
    ASL $00E8            ; 0E E8 00 | Arithmetic shift left (absolute)
    SED                  ; F8 | Set decimal mode flag
    STY $00              ; 84 00 | Store Y register to zero page
    INX                  ; E8 | Increment X register
    BCS $70              ; B0 70 | Branch if carry set
    BRA $80              ; 80 80 | Branch always
    BCS $F0              ; B0 F0 | Branch if carry set
    INX                  ; E8 | Increment X register
    SED                  ; F8 | Set decimal mode flag
    ASL $F8FC,X          ; 1E FC F8 | Arithmetic shift left (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BRA $B0              ; 80 B0 | Branch always
    BRA $80              ; 80 80 | Branch always
    BVS $17              ; 70 17 | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_266
; Address: $DDD2A6
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_266:
    JSR $211F            ; 20 1F 21 | PPU graphics register access
    ORA $010E            ; 0D 0E 01 | Logical OR with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $170F            ; 0D 0F 17 | Logical OR with accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    ORA ($0D,X)          ; 01 0D | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    CPX $02              ; E4 02 | Compare X register (zero page)
    SED                  ; F8 | Set decimal mode flag
    STY $9888            ; 8C 88 98 | Store Y register to absolute address
    BEQ $90              ; F0 90 | Branch if equal
    LDY #$9C             ; A0 9C | Load immediate value into Y register
    SED                  ; F8 | Set decimal mode flag
    CPX $FC              ; E4 FC | Compare X register (zero page)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    DEY                  ; 88 | Decrement Y register
    SED                  ; F8 | Set decimal mode flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    INC                  ; 1A | Increment accumulator
    PHP                  ; 08 | Push processor status to stack
    AND $400D            ; 2D 0D 40 | Logical AND with accumulator (absolute)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_267
; Address: $DDD2F2
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_267:
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    EOR $01              ; 45 01 | Exclusive OR with accumulator (zero page)
    ORA $28              ; 05 28 | Logical OR with accumulator (zero page)
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    ASL $1001            ; 0E 01 10 | Arithmetic shift left (absolute)
    ORA $0A14            ; 0D 14 0A | Logical OR with accumulator (absolute)
    DEC                  ; 3A | Decrement accumulator
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA $0809            ; 0D 09 08 | Logical OR with accumulator (absolute)
    BPL $10              ; 10 10 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    ROL $03              ; 26 03 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_268
; Address: $DDD324
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_268:
    JSL $3E411D          ; 22 1D 41 3E | Jump to subroutine long
    BMI $00              ; 30 00 | Branch if negative
    ASL $0F1D,X          ; 1E 1D 0F | Arithmetic shift left (absolute,X)
    ORA ($10),Y          ; 11 10 | Logical OR with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    ROL $073E,X          ; 3E 3E 07 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_269
; Address: $DDD344
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_269:
    JSR $4020            ; 20 20 40 | Jump to subroutine
    BVC $94              ; 50 94 | Branch if overflow clear
    BEQ $CC              ; F0 CC | Branch if equal
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_26A
; Address: $DDD34D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_26A:
    JSR $A0E2            ; 20 E2 A0 | Jump to subroutine
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BNE $00              ; D0 00 | Branch if not equal
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_26B
; Address: $DDD357
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_26B:
    JSR $0008            ; 20 08 00 | Jump to subroutine
    BMI $00              ; 30 00 | Branch if negative
    STZ $1C00            ; 9C 00 1C | Store zero to absolute
    BVS $24              ; 70 24 | Branch if overflow set
    BEQ $28              ; F0 28 | Branch if equal
    BNE $08              ; D0 08 | Branch if not equal
    BVS $10              ; 70 10 | Branch if overflow set
    CPX #$20             ; E0 20 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_26C
; Address: $DDD36C
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_26C:
    JSR $30C0            ; 20 C0 30 | Jump to subroutine
    CPX #$0C             ; E0 0C | Compare X register (immediate)
    PLP                  ; 28 | Pull processor status from stack
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BCC $40              ; 90 40 | Branch if carry clear
    BVC $20              ; 50 20 | Branch if overflow clear
    BVC $A0              ; 50 A0 | Branch if overflow clear
    TYA                  ; 98 | Transfer Y register to accumulator
    RTI                  ; 40 | Return from interrupt
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_26D
; Address: $DDD389
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_26D:
    JSR $80D0            ; 20 D0 80 | Jump to subroutine
    BVC $20              ; 50 20 | Branch if overflow clear
    CLV                  ; B8 | Clear overflow flag
    BPL $40              ; 10 40 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_271
; Address: $DDD39D
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_271:
    JSR $1000            ; 20 00 10 | Jump to subroutine
    EOR $01              ; 45 01 | Exclusive OR with accumulator (zero page)
    ORA $28              ; 05 28 | Logical OR with accumulator (zero page)
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    ASL $1001            ; 0E 01 10 | Arithmetic shift left (absolute)
    ORA #$0A             ; 09 0A | Logical OR with accumulator (immediate)
    ASL $32              ; 06 32 | Arithmetic shift left (zero page)
    ORA $003A            ; 0D 3A 00 | Logical OR with accumulator (absolute)
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA #$11             ; 09 11 | Logical OR with accumulator (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA #$19             ; 09 19 | Logical OR with accumulator (immediate)
    AND #$16             ; 29 16 | Logical AND with accumulator (immediate)
    LSR $19              ; 46 19 | Logical shift right (zero page)
    AND ($11),Y          ; 31 11 | Logical AND with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    ORA $0501            ; 0D 01 05 | Logical OR with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $10              ; 10 10 | Branch if positive
    AND $1119,Y          ; 39 19 11 | Logical AND with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    ORA ($D2,X)          ; 01 D2 | Logical OR with accumulator ((zero page,X))
    BVS $24              ; 70 24 | Branch if overflow set
    BEQ $28              ; F0 28 | Branch if equal
    BNE $08              ; D0 08 | Branch if not equal
    BVS $10              ; 70 10 | Branch if overflow set
    CPX #$20             ; E0 20 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_272
; Address: $DDD3EC
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_272:
    JSR $30C0            ; 20 C0 30 | Jump to subroutine
    CPX #$0C             ; E0 0C | Compare X register (immediate)
    PLP                  ; 28 | Pull processor status from stack
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BCC $80              ; 90 80 | Branch if carry clear
    INY                  ; C8 | Increment Y register
    CPY #$14             ; C0 14 | Compare Y register (immediate)
    INY                  ; C8 | Increment Y register
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    CPX #$18             ; E0 18 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_273
; Address: $DDD407
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_273:
    CPY #$D0             ; C0 D0 | Compare Y register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    BVC $C0              ; 50 C0 | Branch if overflow clear
    BCS $E0              ; B0 E0 | Game work RAM access
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    BEQ $C0              ; F0 C0 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $3108,Y          ; 19 08 31 | Logical OR with accumulator (absolute,Y)
    ORA $0C2C,Y          ; 19 2C 0C | Logical OR with accumulator (absolute,Y)
    ORA ($47,X)          ; 01 47 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $0600            ; 0E 00 06 | Arithmetic shift left (absolute)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    SEC                  ; 38 | Set carry flag
    EOR $3A0E,X          ; 5D 0E 3A | Exclusive OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_274
; Address: $DDD444
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_274:
    JSL $0E1815          ; 22 15 18 0E | Jump to subroutine long
    BMI $0B              ; 30 0B | Branch if negative
    LSR                  ; 4A | Logical shift right (accumulator)
    ROL $7FA9,X          ; 3E A9 7F | Rotate left (absolute,X)
    BCC $4D              ; 90 4D | Branch if carry clear

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_275
; Address: $DDD450
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_275:
    JSR $0200            ; 20 00 02 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ROL $C80C            ; 2E 0C C8 | Rotate left (absolute)
    PHA                  ; 48 | Push accumulator to stack
    BVS $0D              ; 70 0D | Branch if overflow set
    AND ($10),Y          ; 31 10 | Logical AND with accumulator ((zero page),Y)
    ORA $010E            ; 0D 0E 01 | Logical OR with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ASL $0C              ; 06 0C | Arithmetic shift left (zero page)
    BPL $1F              ; 10 1F | Branch if positive
    ORA $0101            ; 0D 01 01 | Logical OR with accumulator (absolute)
    BRA $00              ; 80 00 | Branch always
    CLC                  ; 18 | Clear carry flag
    BMI $94              ; 30 94 | Branch if negative
    BNE $E4              ; D0 E4 | Branch if not equal
    CPX #$82             ; E0 82 | Compare X register (immediate)
    REP #$80             ; C2 80 | Reset processor status bits
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BVS $00              ; 70 00 | Branch if overflow set
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_276
; Address: $DDD499
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_276:
    JSR $0018            ; 20 18 00 | Jump to subroutine
    ROR                  ; 6A | Rotate right (accumulator)
    CPX #$5C             ; E0 5C | Compare X register (immediate)
    INX                  ; E8 | Increment X register
    TAY                  ; A8 | Transfer accumulator to Y register
    CLC                  ; 18 | Clear carry flag
    BEQ $00              ; F0 00 | Branch if equal
    LSR                  ; 4A | Logical shift right (accumulator)
    ROR $F892,X          ; 7E 92 F8 | Rotate right (absolute,X)
    TSX                  ; BA | Transfer stack pointer to X register
    RTI                  ; 40 | Return from interrupt
    BPL $00              ; 10 00 | Branch if positive
    ROL $B51C,X          ; 3E 1C B5 | Rotate left (absolute,X)
    AND $6838            ; 2D 38 68 | Logical AND with accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    AND $BA              ; 25 BA | Logical AND with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    JMP ($9C02)          ; 6C 02 9C | Jump to address (absolute indirect)
    SED                  ; F8 | Set decimal mode flag
    STY $9888            ; 8C 88 98 | Store Y register to absolute address
    BEQ $90              ; F0 90 | Branch if equal
    LDY #$58             ; A0 58 | Load immediate value into Y register
    SEC                  ; 38 | Set carry flag
    CPX $1C7C            ; EC 7C 1C | Compare X register (absolute)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    DEY                  ; 88 | Decrement Y register
    SED                  ; F8 | Set decimal mode flag
    CPX #$5D             ; E0 5D | Compare X register (immediate)
    ASL $173A            ; 0E 3A 17 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_277
; Address: $DDD4E4
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_277:
    JSL $0E1815          ; 22 15 18 0E | Jump to subroutine long
    ROR $1F09,X          ; 7E 09 1F | Rotate right (absolute,X)
    TAY                  ; A8 | Transfer accumulator to Y register
    EOR $0020,X          ; 5D 20 00 | Exclusive OR with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_278
; Address: $DDD4F6
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_278:
    JSR $7C01            ; 20 01 7C | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    LDA $F43C            ; AD 3C F4 | Read graphics status
    ROR                  ; 6A | Rotate right (accumulator)
    CPX #$5C             ; E0 5C | Compare X register (immediate)
    INX                  ; E8 | Increment X register
    TAY                  ; A8 | Transfer accumulator to Y register
    CLC                  ; 18 | Clear carry flag
    BEQ $04              ; F0 04 | Branch if equal
    BNE $52              ; D0 52 | Branch if not equal
    INC $B209,X          ; FE 09 B2 | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    BPL $00              ; 10 00 | Branch if positive
    SEC                  ; 38 | Set carry flag
    BPL $A8              ; 10 A8 | Branch if positive

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_279
; Address: $DDD51B
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_279:
    SEC                  ; 38 | Set carry flag
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    BMI $00              ; 30 00 | Branch if negative
    ORA $100C            ; 0D 0C 10 | Logical OR with accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    ORA $1200            ; 0D 00 12 | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_27A
; Address: $DDD540
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_27A:
    ORA $0C1F,Y          ; 19 1F 0C | Logical OR with accumulator (absolute,Y)
    ASL $0A4A            ; 0E 4A 0A | Arithmetic shift left (absolute)
    CLI                  ; 58 | Clear interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    BPL $33              ; 10 33 | Branch if positive
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_27B
; Address: $DDD552
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_27B:
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    AND $0E00            ; 2D 00 0E | Logical AND with accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    PHA                  ; 48 | Push accumulator to stack
    JMP $5C33            ; 4C 33 5C | Jump to address
    AND $5B06,Y          ; 39 06 5B | Logical AND with accumulator (absolute,Y)
    STZ $53              ; 64 53 | Store zero to zero page
    ADC $2E37            ; 6D 37 2E | Add with carry (absolute)
    ASL $0301            ; 0E 01 03 | Arithmetic shift left (absolute)
    ORA ($2E,X)          ; 01 2E | Logical OR with accumulator ((zero page,X))
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_27C
; Address: $DDD584
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_27C:
    JSR $9020            ; 20 20 90 | Jump to subroutine
    BPL $88              ; 10 88 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    PHA                  ; 48 | Push accumulator to stack
    SEI                  ; 78 | Set interrupt disable flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BNE $00              ; D0 00 | Branch if not equal
    PLA                  ; 68 | Pull accumulator from stack
    STZ $00              ; 64 00 | Store zero to zero page
    CPX $00              ; E4 00 | Compare X register (zero page)
    DEC $00              ; C6 00 | Decrement (zero page)
    STX $00              ; 86 00 | Store X register to zero page
    BEQ $12              ; F0 12 | Branch if equal
    BVC $52              ; 50 52 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_27D
; Address: $DDD5A5
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_27D:
    BVC $DA              ; 50 DA | Branch if overflow clear
    CLI                  ; 58 | Clear interrupt disable flag
    STY $CC08            ; 8C 08 CC | Store Y register to absolute address
    PHA                  ; 48 | Push accumulator to stack
    BIT $1A40            ; 2C 40 1A | Test bits in accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    LDY $AC00            ; AC 00 AC | Load from absolute address into Y register
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    BVS $00              ; 70 00 | Branch if overflow set
    BVS $00              ; 70 00 | Branch if overflow set
    BVC $84              ; 50 84 | Branch if overflow clear
    SED                  ; F8 | Set decimal mode flag
    ASL $FE09            ; 0E 09 FE | Arithmetic shift left (absolute)
    AND $DA              ; 25 DA | Logical AND with accumulator (zero page)
    CPY $EE12            ; CC 12 EE | Compare Y register (absolute)
    TXA                  ; 8A | Transfer X register to accumulator
    CPY $18C8            ; CC C8 18 | Compare Y register (absolute)
    CPX #$D8             ; E0 D8 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_27E
; Address: $DDD5D1
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_27E:
    JSR $C038            ; 20 38 C0 | Jump to subroutine
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    CPX #$28             ; E0 28 | Compare X register (immediate)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_27F
; Address: $DDD5DE
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_27F:
    JSR $19E0            ; 20 E0 19 | Jump to subroutine
    ASL $0A4A            ; 0E 4A 0A | Arithmetic shift left (absolute)
    CLI                  ; 58 | Clear interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    BPL $33              ; 10 33 | Branch if positive
    CLI                  ; 58 | Clear interrupt disable flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_280
; Address: $DDD5F2
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_280:
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    AND $0E00            ; 2D 00 0E | Logical AND with accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND ($1F,X)          ; 21 1F | Logical AND with accumulator ((zero page,X))
    BVS $B2              ; 70 B2 | Branch if overflow set
    BEQ $12              ; F0 12 | Branch if equal
    BVC $52              ; 50 52 | Branch if overflow clear
    BVC $DA              ; 50 DA | Branch if overflow clear
    CLI                  ; 58 | Clear interrupt disable flag
    STY $CC08            ; 8C 08 CC | Store Y register to absolute address
    PHA                  ; 48 | Push accumulator to stack
    BIT $1C40            ; 2C 40 1C | Test bits in accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    LDY $AC00            ; AC 00 AC | Load from absolute address into Y register
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    BVS $00              ; 70 00 | Branch if overflow set
    BVS $00              ; 70 00 | Branch if overflow set
    BVC $80              ; 50 80 | Branch if overflow clear
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    BPL $08              ; 10 08 | Branch if positive

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_281
; Address: $DDD629
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_281:
    CLC                  ; 18 | Clear carry flag
    ROL $1F1F,X          ; 3E 1F 1F | Rotate left (absolute,X)
    AND $2700            ; 2D 00 27 | Logical AND with accumulator (absolute)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_282
; Address: $DDD640
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_282:
    AND ($20,X)          ; 21 20 | Logical AND with accumulator ((zero page,X))
    ADC ($20,X)          ; 61 20 | Add with carry ((zero page,X))
    ASL $21              ; 06 21 | PPU graphics register access
    ORA $0E01,Y          ; 19 01 0E | Logical OR with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    LSR $1E00,X          ; 5E 00 1E | Logical shift right (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA $2A16,Y          ; 19 16 2A | Logical OR with accumulator (absolute,Y)
    ROL $4E31            ; 2E 31 4E | Rotate left (absolute)
    ADC ($DC),Y          ; 71 DC | Add with carry ((zero page),Y)
    PHX                  ; DA | Push X register to stack
    ROR $7E              ; 66 7E | Rotate right (zero page)
    ORA ($1C,X)          ; 01 1C | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    BMI $01              ; 30 01 | Branch if negative
    ROR $0103,X          ; 7E 03 01 | Rotate right (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_283
; Address: $DDD686
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_283:
    JSR $5020            ; 20 20 50 | Jump to subroutine
    BVS $80              ; 70 80 | Branch if overflow set
    CPY #$20             ; C0 20 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_284
; Address: $DDD68D
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_284:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BNE $00              ; D0 00 | Branch if not equal
    DEY                  ; 88 | Decrement Y register
    BVS $A4              ; 70 A4 | Branch if overflow set
    BNE $28              ; D0 28 | Branch if not equal
    BEQ $08              ; F0 08 | Branch if equal
    BCS $90              ; B0 90 | Branch if carry set
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    CPY #$90             ; C0 90 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_285
; Address: $DDD6AD
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_285:
    JSR $1088            ; 20 88 10 | Jump to subroutine
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_286
; Address: $DDD6B4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_286:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    CLD                  ; D8 | Clear decimal mode flag
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_287
; Address: $DDD6BD
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_287:
    RTI                  ; 40 | Return from interrupt
    BPL $60              ; 10 60 | Branch if positive
    BEQ $14              ; F0 14 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    BEQ $08              ; F0 08 | Branch if equal
    CLD                  ; D8 | Clear decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    STZ $1898            ; 9C 98 18 | Store zero to absolute
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    BNE $20              ; D0 20 | Branch if not equal
    BMI $C0              ; 30 C0 | Branch if negative
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_288
; Address: $DDD6D7
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_288:
    JSR $7088            ; 20 88 70 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    CLI                  ; 58 | Clear interrupt disable flag
    SEC                  ; 38 | Set carry flag
    LDY #$E0             ; A0 E0 | Game work RAM access
    PHP                  ; 08 | Push processor status to stack
    ORA $3629,X          ; 1D 29 36 | Logical OR with accumulator (absolute,X)
    BIT $5833            ; 2C 33 58 | Test bits in accumulator (absolute)
    BEQ $CC              ; F0 CC | Branch if equal
    PHX                  ; DA | Push X register to stack
    ROR                  ; 6A | Rotate right (accumulator)
    SEI                  ; 78 | Set interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    ASL $3F              ; 06 3F | Arithmetic shift left (zero page)
    ADC $060C,Y          ; 79 0C 06 | Add with carry (absolute,Y)
    BCC $F0              ; 90 F0 | Branch if carry clear
    BVC $B0              ; 50 B0 | Branch if overflow clear
    BVS $B0              ; 70 B0 | Branch if overflow set
    DEY                  ; 88 | Decrement Y register
    CLI                  ; 58 | Clear interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    TYA                  ; 98 | Transfer Y register to accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    SEI                  ; 78 | Set interrupt disable flag
    BVS $70              ; 70 70 | Branch if overflow set
    BRA $F0              ; 80 F0 | Branch always
    BRA $10              ; 80 10 | Branch always

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_28A
; Address: $DDD717
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_28A:
    JSR $6098            ; 20 98 60 | Jump to subroutine
    TAY                  ; A8 | Transfer accumulator to Y register
    BEQ $70              ; F0 70 | Branch if equal
    BEQ $80              ; F0 80 | Branch if equal

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_28B
; Address: $DDD71F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_28B:
    BRA $00              ; 80 00 | Branch always
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    ORA #$08             ; 09 08 | Logical OR with accumulator (immediate)
    BPL $18              ; 10 18 | Branch if positive
    INC                  ; 1A | Increment accumulator
    ORA $0000            ; 0D 00 00 | Logical OR with accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_28D
; Address: $DDD741
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_28D:
    AND ($66,X)          ; 21 66 | Logical AND with accumulator ((zero page,X))
    AND $32              ; 25 32 | Logical AND with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ASL $0C              ; 06 0C | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $0C28            ; 0E 28 0C | Arithmetic shift left (absolute)
    PHY                  ; 5A | Push Y register to stack
    ORA $001E,X          ; 1D 1E 00 | Logical OR with accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_28E
; Address: $DDD756
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_28E:
    JSR $3401            ; 20 01 34 | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BMI $91              ; 30 91 | Branch if negative
    ROR $5BA4,X          ; 7E A4 5B | Rotate right (absolute,X)
    JMP ($4932)          ; 6C 32 49 | Jump to address (absolute indirect)
    EOR ($6D),Y          ; 51 6D | Exclusive OR with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    SEC                  ; 38 | Set carry flag
    AND ($13),Y          ; 31 13 | Logical AND with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    ROL $7D01,X          ; 3E 01 7D | Rotate left (absolute,X)
    ADC $3B03,X          ; 7D 03 3B | Add with carry (absolute,X)
    CLC                  ; 18 | Clear carry flag
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BMI $30              ; 30 30 | Branch if negative
    DEY                  ; 88 | Decrement Y register
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    CLI                  ; 58 | Clear interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    STZ $64              ; 64 64 | Store zero to zero page
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BMI $00              ; 30 00 | Branch if negative
    INY                  ; C8 | Increment Y register
    STZ $00              ; 64 00 | Store zero to zero page
    CPY $00              ; C4 00 | Compare Y register (zero page)
    STY $00              ; 84 00 | Store Y register to zero page
    TXS                  ; 9A | Transfer X register to stack pointer
    STY $AC64            ; 8C 64 AC | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_28F
; Address: $DDD7A4
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_28F:
    RTI                  ; 40 | Return from interrupt
    INX                  ; E8 | Increment X register
    CLC                  ; 18 | Clear carry flag
    INX                  ; E8 | Increment X register
    CPX #$54             ; E0 54 | Compare X register (immediate)
    BVS $14              ; 70 14 | Branch if overflow set
    BMI $4C              ; 30 4C | Branch if negative
    TAY                  ; A8 | Transfer accumulator to Y register
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BIT $F800            ; 2C 00 F8 | Test bits in accumulator (absolute)
    BVC $38              ; 50 38 | Branch if overflow clear
    BNE $E8              ; D0 E8 | Branch if not equal
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_291
; Address: $DDD7C8
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_291:
    INC                  ; 1A | Increment accumulator
    ROR $8A              ; 66 8A | Rotate right (zero page)
    JMP ($7074)          ; 6C 74 70 | Jump to address (absolute indirect)
    BRA $C0              ; 80 C0 | Branch always
    BIT $C020            ; 2C 20 C0 | Test bits in accumulator (absolute)
    BVS $80              ; 70 80 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    BRA $7E              ; 80 7E | Branch always
    BRA $BE              ; 80 BE | Branch always
    CPY #$F4             ; C0 F4 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_293
; Address: $DDD7E1
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_293:
    AND ($66,X)          ; 21 66 | Logical AND with accumulator ((zero page,X))
    AND $32              ; 25 32 | Logical AND with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ASL $0C              ; 06 0C | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $0C08            ; 0E 08 0C | Arithmetic shift left (absolute)
    ASL $1800,X          ; 1E 00 18 | Arithmetic shift left (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_294
; Address: $DDD7F6
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_294:
    JSR $3401            ; 20 01 34 | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLC                  ; 18 | Clear carry flag
    STY $AC64            ; 8C 64 AC | Store Y register to absolute address
    RTI                  ; 40 | Return from interrupt
    INX                  ; E8 | Increment X register
    CLC                  ; 18 | Clear carry flag
    INX                  ; E8 | Increment X register
    CPX #$54             ; E0 54 | Compare X register (immediate)
    BVS $14              ; 70 14 | Branch if overflow set
    BMI $5A              ; 30 5A | Branch if negative
    CLV                  ; B8 | Clear overflow flag
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_295
; Address: $DDD818
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_295:
    BIT $F800            ; 2C 00 F8 | Test bits in accumulator (absolute)
    BVC $38              ; 50 38 | Branch if overflow clear
    BNE $F8              ; D0 F8 | Branch if not equal
    AND ($12,X)          ; 21 12 | Logical AND with accumulator ((zero page,X))
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    ASL $1D              ; 06 1D | Arithmetic shift left (zero page)
    ASL $1F3E            ; 0E 3E 1F | Arithmetic shift left (absolute)
    ADC ($2F,X)          ; 61 2F | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_297
; Address: $DDD848
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_297:
    JSR $601B            ; 20 1B 60 | Jump to subroutine
    BNE $2B              ; D0 2B | Branch if not equal
    BNE $2F              ; D0 2F | Branch if not equal
    JMP ($7031)          ; 6C 31 70 | Jump to address (absolute indirect)
    AND $1E3C,X          ; 3D 3C 1E | Logical AND with accumulator (absolute,X)
    ADC $793F,X          ; 7D 3F 79 | Add with carry (absolute,X)
    AND $3F3B,X          ; 3D 3B 3F | Logical AND with accumulator (absolute,X)
    AND $458A            ; 2D 8A 45 | Logical AND with accumulator (absolute)
    ADC ($22,X)          ; 61 22 | Add with carry ((zero page,X))
    BIT $7F2D            ; 2C 2D 7F | Test bits in accumulator (absolute)
    CLI                  ; 58 | Clear interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    ASL $7F              ; 06 7F | Arithmetic shift left (zero page)
    ORA $3F7F,X          ; 1D 7F 3F | Logical OR with accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BVS $80              ; 70 80 | Branch if overflow set
    PHA                  ; 48 | Push accumulator to stack
    BMI $80              ; 30 80 | Branch if negative
    PHA                  ; 48 | Push accumulator to stack
    DEY                  ; 88 | Decrement Y register
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BEQ $60              ; F0 60 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $7C              ; F0 7C | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPY $84F8            ; CC F8 84 | Compare Y register (absolute)
    BEQ $40              ; F0 40 | Branch if equal
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    PHA                  ; 48 | Push accumulator to stack
    BRA $BC              ; 80 BC | Branch always
    PHP                  ; 08 | Push processor status to stack
    BCS $0E              ; B0 0E | Branch if carry set
    BCC $07              ; 90 07 | Branch if carry clear
    TAY                  ; A8 | Transfer accumulator to Y register
    CPX $34              ; E4 34 | Compare X register (zero page)
    PHP                  ; 08 | Push processor status to stack
    CLV                  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_298
; Address: $DDD8B4
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_298:
    ROL $BE7C,X          ; 3E 7C BE | Rotate left (absolute,X)
    LDX $BCFC,Y          ; BE FC BC | Load from absolute,Y into X register
    LDX $F6EE,Y          ; BE EE F6 | Load from absolute,Y into X register
    INC $37              ; E6 37 | Increment (zero page)
    CPY #$31             ; C0 31 | Compare Y register (immediate)
    CPY $844A            ; CC 4A 84 | Compare Y register (absolute)
    INC $74FC,X          ; FE FC 74 | Increment (absolute,X)
    BVS $08              ; 70 08 | Branch if overflow set
    BCS $80              ; B0 80 | Branch if carry set
    SEP #$EA             ; E2 EA | Set processor status bits
    SEP #$E0             ; E2 E0 | Game work RAM access
    BEQ $D0              ; F0 D0 | Branch if equal
    PLX                  ; FA | Pull X register from stack
    TYA                  ; 98 | Transfer Y register to accumulator
    CPX $F870            ; EC 70 F8 | Compare X register (absolute)
    BRA $70              ; 80 70 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $02              ; 80 02 | Branch always

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_299
; Address: $DDD8E1
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_299:
    JSL $013202          ; 22 02 32 01 | Jump to subroutine long
    ORA $2D10,X          ; 1D 10 2D | Logical OR with accumulator (absolute,X)
    BMI $0D              ; 30 0D | Branch if negative
    BVS $09              ; 70 09 | Branch if overflow set
    CPX #$15             ; E0 15 | Compare X register (immediate)
    BNE $27              ; D0 27 | Branch if not equal
    JMP ($7031)          ; 6C 31 70 | Jump to address (absolute indirect)
    AND $1E3C,X          ; 3D 3C 1E | Logical AND with accumulator (absolute,X)
    ADC $7D3F,X          ; 7D 3F 7D | Add with carry (absolute,X)
    AND $7D3B,X          ; 3D 3B 7D | Logical AND with accumulator (absolute,X)
    RTI                  ; 40 | Return from interrupt
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    PHA                  ; 48 | Push accumulator to stack
    BRA $BC              ; 80 BC | Branch always
    LDY $D804,X          ; BC 04 D8 | Load from absolute,X into Y register
    ASL $D8              ; 06 D8 | Arithmetic shift left (zero page)
    PEA #$0834           ; F4 34 08 | Push effective address to stack
    CLV                  ; B8 | Clear overflow flag
    ROL $BE7C,X          ; 3E 7C BE | Rotate left (absolute,X)
    STZ $DCBC,X          ; 9E BC DC | Store zero to absolute,X
    DEC $FEFE,X          ; DE FE FE | Decrement (absolute,X)
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA #$12             ; 09 12 | Logical OR with accumulator (immediate)
    ROL $39              ; 26 39 | Rotate left (zero page)
    ASL $7F97,X          ; 1E 97 7F | Arithmetic shift left (absolute,X)
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND #$14             ; 29 14 | Logical AND with accumulator (immediate)
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_29A
; Address: $DDD94C
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_29A:
    JMP $8822            ; 4C 22 88 | Jump to address
    STA                  ; 9F 5F BE 7C | Update graphics data
    LDX $BF7C,Y          ; BE 7C BF | Load from absolute,Y into X register
    ROR $2F3E            ; 6E 3E 2F | Rotate right (absolute)
    BCC $4C              ; 90 4C | Branch if carry clear
    EOR $2647,X          ; 5D 47 26 | Exclusive OR with accumulator (absolute,X)
    AND $482D            ; 2D 2D 48 | Logical AND with accumulator (absolute)
    PHA                  ; 48 | Push accumulator to stack
    TXS                  ; 9A | Transfer X register to stack pointer
    TXS                  ; 9A | Transfer X register to stack pointer
    CPY #$02             ; C0 02 | Compare Y register (immediate)
    ASL $7C              ; 06 7C | Arithmetic shift left (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    JMP $3F2A3E          ; 5C 3E 2A 3F | Jump to address long
    PLX                  ; FA | Pull X register from stack
    ADC $7805,X          ; 7D 05 78 | Add with carry (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPX #$28             ; E0 28 | Compare X register (immediate)
    CPY #$98             ; C0 98 | Compare Y register (immediate)
    PLP                  ; 28 | Pull processor status from stack
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BEQ $E0              ; F0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    BEQ $EC              ; F0 EC | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    STZ $FEF8            ; 9C F8 FE | Store zero to absolute
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    PEA #$DCA0           ; F4 A0 DC | Push effective address to stack
    PLP                  ; 28 | Pull processor status from stack
    PEA #$B008           ; F4 08 B0 | Push effective address to stack
    BPL $E0              ; 10 E0 | Game work RAM access
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_29B
; Address: $DDD9AD
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_29B:
    RTI                  ; 40 | Return from interrupt
    BVS $70              ; 70 70 | Branch if overflow set
    DEC $9EDC,X          ; DE DC 9E | Decrement (absolute,X)
    STZ $0C0E            ; 9C 0E 0C | Store zero to absolute
    BIT $04              ; 24 04 | Test bits in accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BEQ $E0              ; F0 E0 | Game work RAM access
    BPL $10              ; 10 10 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    BRA $60              ; 80 60 | Branch always
    LDY #$D0             ; A0 D0 | Load immediate value into Y register
    BVC $F0              ; 50 F0 | Branch if overflow clear
    BEQ $78              ; F0 78 | Branch if equal
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_29C
; Address: $DDD9CC
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_29C:
    PHP                  ; 08 | Push processor status to stack
    BCS $80              ; B0 80 | Branch if carry set
    BVS $E0              ; 70 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_29D
; Address: $DDD9D3
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_29D:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    BVS $60              ; 70 60 | Branch if overflow set
    BEQ $E0              ; F0 E0 | Game work RAM access
    PLA                  ; 68 | Pull accumulator from stack
    BEQ $80              ; F0 80 | Branch if equal
    BVS $40              ; 70 40 | Branch if overflow set
    BRA $00              ; 80 00 | Branch always
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND #$14             ; 29 14 | Logical AND with accumulator (immediate)
    LDA #$08             ; A9 08 | Read graphics status
    ROL $58              ; 26 58 | Rotate left (zero page)
    ASL $94              ; 06 94 | Arithmetic shift left (zero page)
    JMP $1F5F            ; 4C 5F 1F | Jump to address
    STA                  ; 9F 5F BE 7C | Update graphics data
    ROL $7F7C,X          ; 3E 7C 7F | Rotate left (absolute,X)
    LDX $1F3E            ; AE 3E 1F | Load from absolute address into X register
    TYA                  ; 98 | Transfer Y register to accumulator
    PHA                  ; 48 | Push accumulator to stack
    BIT #$66             ; 89 66 | Test bits in accumulator (immediate)
    AND $27              ; 25 27 | Logical AND with accumulator (zero page)
    ROR $EE6E            ; 6E 6E EE | Rotate right (absolute)
    INC $00E0            ; EE E0 00 | Increment (absolute)
    ADC $7801,X          ; 7D 01 78 | Add with carry (absolute,X)
    BVS $60              ; 70 60 | Branch if overflow set
    AND ($31),Y          ; 31 31 | Logical AND with accumulator ((zero page),Y)
    INC $0177,X          ; FE 77 01 | Increment (absolute,X)
    ROR $0102,X          ; 7E 02 01 | Rotate right (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    PEA #$DCA0           ; F4 A0 DC | Push effective address to stack
    PLP                  ; 28 | Pull processor status from stack
    PEA #$B008           ; F4 08 B0 | Push effective address to stack
    BPL $E0              ; 10 E0 | Game work RAM access
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_29E
; Address: $DDDA2D
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_29E:
    RTI                  ; 40 | Return from interrupt
    BVS $70              ; 70 70 | Branch if overflow set
    DEC $9EDC,X          ; DE DC 9E | Decrement (absolute,X)
    STZ $0C0E            ; 9C 0E 0C | Store zero to absolute
    BIT $04              ; 24 04 | Test bits in accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    BCC $00              ; 90 00 | Branch if carry clear
    SEI                  ; 78 | Set interrupt disable flag
    CPX #$90             ; E0 90 | Compare X register (immediate)
    BCC $14              ; 90 14 | Branch if carry clear
    INY                  ; C8 | Increment Y register
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_29F
; Address: $DDDA45
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_29F:
    CPX #$50             ; E0 50 | Compare X register (immediate)
    BVC $38              ; 50 38 | Branch if overflow clear
    SEC                  ; 38 | Set carry flag
    CLI                  ; 58 | Clear interrupt disable flag
    CLI                  ; 58 | Clear interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    BMI $A0              ; 30 A0 | Branch if negative
    PEA #$00E8           ; F4 E8 00 | Push effective address to stack
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    BEQ $58              ; F0 58 | Branch if equal
    BCS $A0              ; B0 A0 | Branch if carry set
    BPL $00              ; 10 00 | Branch if positive
    CPX #$00             ; E0 00 | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    ASL $1F              ; 06 1F | Arithmetic shift left (zero page)
    ASL $1F2F            ; 0E 2F 1F | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $1F22,X          ; 1D 22 1F | Logical OR with accumulator (absolute,X)
    RTI                  ; 40 | Return from interrupt
    STZ $1B              ; 64 1B | Store zero to zero page
    DEC $26              ; C6 26 | Decrement (zero page)
    LDA ($61,X)          ; A1 61 | Read graphics status
    ADC $303D,X          ; 7D 3D 30 | Add with carry (absolute,X)
    BPL $12              ; 10 12 | Branch if positive
    BPL $38              ; 10 38 | Branch if positive
    AND ($38),Y          ; 31 38 | Logical AND with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    ADC $7C              ; 65 7C | Add with carry (zero page)
    ADC $7F              ; 65 7F | Add with carry (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator
    SEI                  ; 78 | Set interrupt disable flag
    STZ $26              ; 64 26 | Store zero to zero page
    CLI                  ; 58 | Clear interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    AND ($03,X)          ; 21 03 | Logical AND with accumulator ((zero page,X))
    ASL $1E              ; 06 1E | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BPL $E0              ; 10 E0 | Game work RAM access
    CLC                  ; 18 | Clear carry flag
    CPX #$28             ; E0 28 | Compare X register (immediate)
    CPY #$70             ; C0 70 | Compare Y register (immediate)
    DEY                  ; 88 | Decrement Y register
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2A0
; Address: $DDDAD6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2A0:
    BEQ $60              ; F0 60 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $FC              ; F0 FC | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPX $FCF8            ; EC F8 FC | Compare X register (absolute)
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2A1
; Address: $DDDAE0
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2A1:
    JSR $00D8            ; 20 D8 00 | Jump to subroutine
    BVC $BC              ; 50 BC | Branch if overflow clear
    SED                  ; F8 | Set decimal mode flag
    ASL $26E0            ; 0E E0 26 | Arithmetic shift left (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    JMP ($8681)          ; 6C 81 86 | Jump to address (absolute indirect)
    SEI                  ; 78 | Set interrupt disable flag
    ROL $0E3C,X          ; 3E 3C 0E | Rotate left (absolute,X)
    LSR $1C0C            ; 4E 0C 1C | Logical shift right (absolute)
    LDX $A63E            ; AE 3E A6 | Load from absolute address into X register
    INC $0601,X          ; FE 01 06 | Increment (absolute,X)
    ORA ($2C,X)          ; 01 2C | Logical OR with accumulator ((zero page,X))
    ROL                  ; 2A | Rotate left (accumulator)
    STZ $E6              ; 64 E6 | Store zero to zero page
    CPX #$F6             ; E0 F6 | Compare X register (immediate)
    PEA #$F0F4           ; F4 F4 F0 | Push effective address to stack
    PHA                  ; 48 | Push accumulator to stack
    RTI                  ; 40 | Return from interrupt
    BEQ $80              ; F0 80 | Branch if equal
    ROR $FE              ; 66 FE | Rotate right (zero page)
    CPX #$30             ; E0 30 | Compare X register (immediate)
    BNE $F8              ; D0 F8 | Branch if not equal
    TYA                  ; 98 | Transfer Y register to accumulator
    CPX $F8F0            ; EC F0 F8 | Compare X register (absolute)
    CPY #$70             ; C0 70 | Compare Y register (immediate)
    BRA $18              ; 80 18 | Branch always
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $1F22,X          ; 1D 22 1F | Logical OR with accumulator (absolute,X)
    RTI                  ; 40 | Return from interrupt
    STZ $1B              ; 64 1B | Store zero to zero page
    INC $16              ; E6 16 | Increment (zero page)
    CMP ($21,X)          ; C1 21 | PPU graphics register access
    ADC $303D,X          ; 7D 3D 30 | Add with carry (absolute,X)
    BPL $12              ; 10 12 | Branch if positive
    BPL $38              ; 10 38 | Branch if positive
    AND ($38),Y          ; 31 38 | Logical AND with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    ADC $7F              ; 65 7F | Add with carry (zero page)
    BRA $60              ; 80 60 | Branch always
    RTI                  ; 40 | Return from interrupt
    BVC $22              ; 50 22 | Branch if overflow clear
    ORA ($66,X)          ; 01 66 | Logical OR with accumulator ((zero page,X))
    ASL $0100            ; 0E 00 01 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2A3
; Address: $DDDB64
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2A3:
    BVC $BC              ; 50 BC | Branch if overflow clear
    SED                  ; F8 | Set decimal mode flag
    ASL $26E0            ; 0E E0 26 | Arithmetic shift left (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    STZ $85              ; 64 85 | Store zero to zero page
    STX $7C              ; 86 7C | Store X register to zero page
    SEI                  ; 78 | Set interrupt disable flag
    ROL $0E3C,X          ; 3E 3C 0E | Rotate left (absolute,X)
    LSR $1C0C            ; 4E 0C 1C | Logical shift right (absolute)
    LDX $3E              ; A6 3E | Load from zero page into X register
    LDX $FE              ; A6 FE | Load from zero page into X register
    ORA $491E,Y          ; 19 1E 49 | Logical OR with accumulator (absolute,Y)
    ROR                  ; 6A | Rotate right (accumulator)
    PEA #$3EF4           ; F4 F4 3E | Push effective address to stack
    ROL $181A,X          ; 3E 1A 18 | Rotate left (absolute,X)
    STY $C0              ; 84 C0 | Store Y register to zero page
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2A4
; Address: $DDDB90
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2A4:
    SEI                  ; 78 | Set interrupt disable flag
    INX                  ; E8 | Increment X register
    BEQ $3C              ; F0 3C | Branch if equal
    INY                  ; C8 | Increment Y register
    INX                  ; E8 | Increment X register
    ROL $D8F4,X          ; 3E F4 D8 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2A5
; Address: $DDDB9C
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2A5:
    JSR $0018            ; 20 18 00 | Jump to subroutine
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CLC                  ; 18 | Clear carry flag
    LSR $4700,X          ; 5E 00 47 | Logical shift right (absolute,X)
    ADC $0000            ; 6D 00 00 | Add with carry (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLC                  ; 18 | Clear carry flag
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    DEC                  ; 3A | Decrement accumulator
    BPL $3F              ; 10 3F | Branch if positive
    LSR $DA08,X          ; 5E 08 DA | Logical shift right (absolute,X)
    EOR ($BF),Y          ; 51 BF | Exclusive OR with accumulator ((zero page),Y)
    BMI $BF              ; 30 BF | Branch if negative
    LSR $07              ; 46 07 | Logical shift right (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2A6
; Address: $DDDBD5
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2A6:
    JSR $6001            ; 20 01 60 | Jump to subroutine
    BEQ $10              ; F0 10 | Branch if equal
    DEC $8F02,X          ; DE 02 8F | Decrement (absolute,X)
    ASL $1F              ; 06 1F | Arithmetic shift left (zero page)
    ASL $047F            ; 0E 7F 04 | Arithmetic shift left (absolute)
    RTI                  ; 40 | Return from interrupt
    ROR $5A01,X          ; 7E 01 5A | Rotate right (absolute,X)
    AND ($24,X)          ; 21 24 | Logical AND with accumulator ((zero page,X))
    ASL $041F            ; 0E 1F 04 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2A7
; Address: $DDDBF4
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2A7:
    RTI                  ; 40 | Return from interrupt
    ASL $0073            ; 0E 73 00 | Arithmetic shift left (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2A8
; Address: $DDDC04
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2A8:
    TYA                  ; 98 | Transfer Y register to accumulator
    STY $D400            ; 8C 00 D4 | Store Y register to absolute address
    ROL $00              ; 26 00 | Rotate left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2A9
; Address: $DDDC16
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2A9:
    BVS $00              ; 70 00 | Branch if overflow set
    PLP                  ; 28 | Pull processor status from stack
    STY $D800            ; 8C 00 D8 | Store Y register to absolute address
    PHP                  ; 08 | Push processor status to stack
    CPY $9C00            ; CC 00 9C | Compare Y register (absolute)
    PHP                  ; 08 | Push processor status to stack
    ROR $5B14,X          ; 7E 14 5B | Rotate right (absolute,X)
    TXA                  ; 8A | Transfer X register to accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SBC $FD44,Y          ; F9 44 FD | Subtract with carry (absolute,Y)
    ROR $30              ; 66 30 | Rotate right (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2AA
; Address: $DDDC36
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2AA:
    STY $06              ; 84 06 | Store Y register to zero page
    ROL                  ; 2A | Rotate left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2AB
; Address: $DDDC3F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2AB:
    BEQ $FF              ; F0 FF | Branch if equal
    INC $FE20,X          ; FE 20 FE | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    CPY $76              ; C4 76 | Compare Y register (zero page)
    STY $50AC            ; 8C AC 50 | Store Y register to absolute address
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2AC
; Address: $DDDC51
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2AC:
    BEQ $20              ; F0 20 | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    BVS $CC              ; 70 CC | Branch if overflow set
    BVS $70              ; 70 70 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    DEC                  ; 3A | Decrement accumulator
    BPL $3F              ; 10 3F | Branch if positive
    ROR $DA28,X          ; 7E 28 DA | Rotate right (absolute,X)
    EOR ($DF),Y          ; 51 DF | Exclusive OR with accumulator ((zero page),Y)
    BVC $9F              ; 50 9F | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2AE
; Address: $DDDC75
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2AE:
    JSR $6021            ; 20 21 60 | Jump to subroutine
    BEQ $50              ; F0 50 | Branch if equal
    INC $CF02,X          ; FE 02 CF | Increment (absolute,X)
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    LSR $7F              ; 46 7F | Logical shift right (zero page)
    RTI                  ; 40 | Return from interrupt
    ROR $3531            ; 6E 31 35 | Rotate right (absolute)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2AF
; Address: $DDDC8B
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2AF:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    ASL $0033            ; 0E 33 00 | Arithmetic shift left (absolute)
    ASL $000E            ; 0E 0E 00 | Arithmetic shift left (absolute)
    CPY $9C00            ; CC 00 9C | Compare Y register (absolute)
    PHP                  ; 08 | Push processor status to stack
    PLY                  ; 7A | Pull Y register from stack
    BPL $5B              ; 10 5B | Branch if positive
    TXA                  ; 8A | Transfer X register to accumulator
    SBC $FD0C,X          ; FD 0C FD | Subtract with carry (absolute,X)
    LSR $FF              ; 46 FF | Logical shift right (zero page)
    BMI $00              ; 30 00 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2B0
; Address: $DDDCB6
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2B0:
    BRA $06              ; 80 06 | Branch always
    ROL                  ; 2A | Rotate left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    SBC ($60),Y          ; F1 60 | Subtract with carry ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    INC $FE70,X          ; FE 70 FE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2B1
; Address: $DDDCC3
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2B1:
    JSR $82FE            ; 20 FE 82 | Jump to subroutine
    INC $7EC2,X          ; FE C2 7E | Increment (absolute,X)
    BRA $5A              ; 80 5A | Branch always
    STY $24              ; 84 24 | Store Y register to zero page
    INY                  ; C8 | Increment Y register
    SED                  ; F8 | Set decimal mode flag
    BVS $F8              ; 70 F8 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2B3
; Address: $DDDCDB
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2B3:
    JSR $F8E8            ; 20 E8 F8 | Jump to subroutine
    ORA $1200            ; 0D 00 12 | Logical OR with accumulator (absolute)
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    ADC $0001,X          ; 7D 01 00 | Add with carry (absolute,X)
    ORA $1B00            ; 0D 00 1B | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    AND $0200            ; 2D 00 02 | Logical AND with accumulator (absolute)
    PLA                  ; 68 | Pull accumulator from stack
    ORA ($2C,X)          ; 01 2C | Logical OR with accumulator ((zero page,X))
    BMI $02              ; 30 02 | Branch if negative
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))
    BMI $00              ; 30 00 | Branch if negative
    AND $7108,Y          ; 39 08 71 | Logical AND with accumulator (absolute,Y)
    BPL $00              ; 10 00 | Branch if positive
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    AND ($75,X)          ; 21 75 | Logical AND with accumulator ((zero page,X))
    ASL $0679            ; 0E 79 06 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2B4
; Address: $DDDD25
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2B4:
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    AND ($1E),Y          ; 31 1E | Logical AND with accumulator ((zero page),Y)
    ASL $0001            ; 0E 01 00 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2B5
; Address: $DDDD31
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2B5:
    JSR $3000            ; 20 00 30 | Jump to subroutine
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BEQ $00              ; F0 00 | Branch if equal
    TYA                  ; 98 | Transfer Y register to accumulator
    LDY $00              ; A4 00 | Load from zero page into Y register
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2B6
; Address: $DDDD4B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2B6:
    JSR $F092            ; 20 92 F0 | Jump to subroutine
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2B7
; Address: $DDDD56
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2B7:
    CLI                  ; 58 | Clear interrupt disable flag
    TAY                  ; A8 | Transfer accumulator to Y register
    PHP                  ; 08 | Push processor status to stack
    BPL $2C              ; 10 2C | Branch if positive
    BCC $20              ; 90 20 | Branch if carry clear
    BNE $08              ; D0 08 | Branch if not equal
    BEQ $08              ; F0 08 | Branch if equal
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    LDY #$F0             ; A0 F0 | Load immediate value into Y register
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    BMI $00              ; 30 00 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BEQ $02              ; F0 02 | Branch if equal
    BEQ $E4              ; F0 E4 | Branch if equal
    CPY #$F4             ; C0 F4 | Compare Y register (immediate)
    CPY #$E0             ; C0 E0 | Game work RAM access
    PHP                  ; 08 | Push processor status to stack
    INX                  ; E8 | Increment X register
    BPL $D0              ; 10 D0 | Branch if positive

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2B8
; Address: $DDDD89
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2B8:
    JSR $60B0            ; 20 B0 60 | Jump to subroutine
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPY #$F8             ; C0 F8 | Compare Y register (immediate)
    CPY #$F8             ; C0 F8 | Compare Y register (immediate)
    DEY                  ; 88 | Decrement Y register
    BVS $00              ; 70 00 | Branch if overflow set
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $68              ; 80 68 | Branch always
    ORA ($2C,X)          ; 01 2C | Logical OR with accumulator ((zero page,X))
    BMI $02              ; 30 02 | Branch if negative
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2B9
; Address: $DDDDAA
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2B9:
    BMI $00              ; 30 00 | Branch if negative
    SEC                  ; 38 | Set carry flag
    AND $1603,X          ; 3D 03 16 | Logical AND with accumulator (absolute,X)
    BPL $00              ; 10 00 | Branch if positive
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    ROR $7F0D,X          ; 7E 0D 7F | Rotate right (absolute,X)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2BA
; Address: $DDDDC7
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2BA:
    JSR $61DE            ; 20 DE 61 | Jump to subroutine
    SBC $7F73            ; ED 73 7F | Subtract with carry (absolute)
    ASL $1026,X          ; 1E 26 10 | Arithmetic shift left (absolute,X)
    ROL $0F08,X          ; 3E 08 0F | Rotate left (absolute,X)
    BMI $00              ; 30 00 | Branch if negative
    ASL $1000,X          ; 1E 00 10 | Arithmetic shift left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    BIT $2090            ; 2C 90 20 | Test bits in accumulator (absolute)
    BNE $08              ; D0 08 | Branch if not equal
    BEQ $08              ; F0 08 | Branch if equal
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    LDY #$F0             ; A0 F0 | Load immediate value into Y register
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    BMI $00              ; 30 00 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $30              ; 80 30 | Branch always
    BPL $34              ; 10 34 | Branch if positive
    CPY #$F4             ; C0 F4 | Compare Y register (immediate)
    BEQ $08              ; F0 08 | Branch if equal
    INX                  ; E8 | Increment X register
    BPL $D4              ; 10 D4 | Branch if positive
    INX                  ; E8 | Increment X register
    STY $7478            ; 8C 78 74 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2BB
; Address: $DDDE0D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2BB:
    JSR $1060            ; 20 60 10 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    INY                  ; C8 | Increment Y register
    BMI $00              ; 30 00 | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2BC
; Address: $DDDE1C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2BC:
    JSR $1008            ; 20 08 10 | Jump to subroutine
    BPL $00              ; 10 00 | Branch if positive
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA $3100,Y          ; 19 00 31 | Logical OR with accumulator (absolute,Y)
    ROL                  ; 2A | Rotate left (accumulator)
    EOR $6401            ; 4D 01 64 | Exclusive OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2BD
; Address: $DDDE2E
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2BD:
    PLA                  ; 68 | Pull accumulator from stack
    ORA $0000            ; 0D 00 00 | Logical OR with accumulator (absolute)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $1500            ; 0E 00 15 | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    BPL $02              ; 10 02 | Branch if positive
    DEC                  ; 3A | Decrement accumulator
    ORA #$32             ; 09 32 | Logical OR with accumulator (immediate)
    ORA $0F30,X          ; 1D 30 0F | Logical OR with accumulator (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    ROL                  ; 2A | Rotate left (accumulator)
    CMP $9E51,Y          ; D9 51 9E | Compare accumulator (absolute,Y)
    BPL $9F              ; 10 9F | Branch if positive
    AND $BE              ; 25 BE | Logical AND with accumulator (zero page)
    JMP ($0004)          ; 6C 04 00 | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2BE
; Address: $DDDE55
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2BE:
    JSR $6421            ; 20 21 64 | Jump to subroutine
    BEQ $11              ; F0 11 | Branch if equal
    ORA $CF              ; 05 CF | Logical OR with accumulator (zero page)
    DEC $4E50            ; CE 50 4E | Decrement (absolute)
    LSR $6E21,X          ; 5E 21 6E | Logical shift right (absolute,X)
    AND ($35),Y          ; 31 35 | Logical AND with accumulator ((zero page),Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BMI $01              ; 30 01 | Branch if negative
    ASL $000E            ; 0E 0E 00 | Arithmetic shift left (absolute)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CLC                  ; 18 | Clear carry flag
    LDY $6400            ; AC 00 64 | Load from absolute address into Y register
    TXS                  ; 9A | Transfer X register to stack pointer
    BRA $22              ; 80 22 | Branch always
    CPX #$16             ; E0 16 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BVC $00              ; 50 00 | Branch if overflow clear
    TYA                  ; 98 | Transfer Y register to accumulator
    STZ $00              ; 64 00 | Store zero to zero page
    PHP                  ; 08 | Push processor status to stack
    JMP $B84C90          ; 5C 90 4C B8 | Jump to address long
    BEQ $1A              ; F0 1A | Branch if equal
    BVS $99              ; 70 99 | Branch if overflow set
    DEY                  ; 88 | Decrement Y register
    ADC $FD0C,X          ; 7D 0C FD | Add with carry (absolute,X)
    LDX $7F              ; A6 7F | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2BF
; Address: $DDDEB0
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2BF:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BRA $06              ; 80 06 | Branch always
    PLA                  ; 68 | Pull accumulator from stack
    DEY                  ; 88 | Decrement Y register
    LDY #$F1             ; A0 F1 | Load immediate value into Y register
    BMI $F8              ; 30 F8 | Branch if negative
    ADC $7E12,X          ; 7D 12 7E | Add with carry (absolute,X)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2C0
; Address: $DDDEC4
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2C0:
    ROL $7E22,X          ; 3E 22 7E | Rotate left (absolute,X)
    ROR $5A80            ; 6E 80 5A | Rotate right (absolute)
    STY $24              ; 84 24 | Store Y register to zero page
    INY                  ; C8 | Increment Y register
    SED                  ; F8 | Set decimal mode flag
    BPL $F8              ; 10 F8 | Branch if positive
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2C2
; Address: $DDDEDB
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2C2:
    JSR $F8E8            ; 20 E8 F8 | Jump to subroutine
    DEC                  ; 3A | Decrement accumulator
    ORA #$32             ; 09 32 | Logical OR with accumulator (immediate)
    ORA $0F30,X          ; 1D 30 0F | Logical OR with accumulator (absolute,X)
    CLI                  ; 58 | Clear interrupt disable flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $BE11,Y          ; 99 11 BE | Update graphics data
    BMI $BF              ; 30 BF | Branch if negative
    ADC $FE              ; 65 FE | Add with carry (zero page)
    JMP $0004            ; 4C 04 00 | Jump to address

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2C3
; Address: $DDDEF5
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2C3:
    JSR $6401            ; 20 01 64 | Jump to subroutine
    BEQ $11              ; F0 11 | Branch if equal
    ORA $8F              ; 05 8F | Logical OR with accumulator (zero page)
    JMP $B84C90          ; 5C 90 4C B8 | Jump to address long
    BEQ $1E              ; F0 1E | Branch if equal
    TXA                  ; 8A | Transfer X register to accumulator
    ADC $F908,Y          ; 79 08 F9 | Add with carry (absolute,Y)
    LDY $7D              ; A4 7D | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2C4
; Address: $DDDF10
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2C4:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    STY $06              ; 84 06 | Store Y register to zero page
    ROR                  ; 6A | Rotate right (accumulator)
    DEY                  ; 88 | Decrement Y register
    LDY #$F3             ; A0 F3 | Load immediate value into Y register
    BMI $F0              ; 30 F0 | Branch if negative
    ORA $09              ; 05 09 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $6B              ; 10 6B | Branch if positive
    SEC                  ; 38 | Set carry flag
    STZ $3C              ; 64 3C | Store zero to zero page
    BPL $02              ; 10 02 | Branch if positive
    AND ($01,X)          ; 21 01 | Logical AND with accumulator ((zero page,X))
    BMI $10              ; 30 10 | Branch if negative
    BPL $08              ; 10 08 | Branch if positive
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    ASL $0F00,X          ; 1E 00 0F | Arithmetic shift left (absolute,X)
    STA                  ; 9F 3F 1F 0F | Update graphics data
    AND ($31),Y          ; 31 31 | Logical AND with accumulator ((zero page),Y)
    BVC $68              ; 50 68 | Branch if overflow clear
    BVS $4D              ; 70 4D | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    ROL $1801,X          ; 3E 01 18 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2C5
; Address: $DDDF75
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2C5:
    ASL $0778            ; 0E 78 07 | Arithmetic shift left (absolute)
    ADC $3B02,X          ; 7D 02 3B | Add with carry (absolute,X)
    BRA $80              ; 80 80 | Branch always
    BNE $C0              ; D0 C0 | Branch if not equal
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2C6
; Address: $DDDF8A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2C6:
    JSL $00C200          ; 22 00 C2 00 | Jump to subroutine long
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2C7
; Address: $DDDF94
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2C7:
    PLP                  ; 28 | Pull processor status from stack
    CPX $EC00            ; EC 00 EC | Compare X register (absolute)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $FC              ; 10 FC | Branch if positive
    CPX $3E3E            ; EC 3E 3E | Compare X register (absolute)
    DEC $28DE,X          ; DE DE 28 | Decrement (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    JMP $FE00            ; 4C 00 FE | Jump to address
    INY                  ; C8 | Increment Y register
    INC $F9FC,X          ; FE FC F9 | Increment (absolute,X)
    INC $E6E3,X          ; FE E3 E6 | Increment (absolute,X)
    STA $C686            ; 8D 86 C6 | Update graphics data
    INY                  ; C8 | Increment Y register
    ASL $BC02,X          ; 1E 02 BC | Arithmetic shift left (absolute,X)
    ASL $B8              ; 06 B8 | Arithmetic shift left (zero page)
    LDY #$78             ; A0 78 | Load immediate value into Y register
    BRA $F8              ; 80 F8 | Branch always
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $E8              ; F0 E8 | Branch if equal
    BVS $1E              ; 70 1E | Branch if overflow set
    CPX #$BC             ; E0 BC | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDY $B840,X          ; BC 40 B8 | Load from absolute,X into Y register
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    AND ($01,X)          ; 21 01 | Logical AND with accumulator ((zero page,X))
    BMI $10              ; 30 10 | Branch if negative
    BPL $08              ; 10 08 | Branch if positive
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    ASL $0F00,X          ; 1E 00 0F | Arithmetic shift left (absolute,X)
    STA                  ; 9F 7F 06 00 | Update graphics data
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $FC              ; 10 FC | Branch if positive
    CPX $3E3E            ; EC 3E 3E | Compare X register (absolute)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2C8
; Address: $DDE00C
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2C8:
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    AND $F82E            ; 2D 2E F8 | Logical AND with accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    JMP $FE00            ; 4C 00 FE | Jump to address
    CPY $FCF9            ; CC F9 FC | Compare Y register (absolute)
    SED                  ; F8 | Set decimal mode flag
    BEQ $F6              ; F0 F6 | Branch if equal
    PEA #$8C8C           ; F4 8C 8C | Push effective address to stack
    CPY $CC              ; C4 CC | Compare Y register (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $1EB0            ; 0E B0 1E | Arithmetic shift left (absolute)
    CPY #$7C             ; C0 7C | Compare Y register (immediate)
    BRA $18              ; 80 18 | Branch always
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    BEQ $FC              ; F0 FC | Branch if equal
    BEQ $EC              ; F0 EC | Branch if equal
    BVS $1E              ; 70 1E | Branch if overflow set
    CPX #$BC             ; E0 BC | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2C9
; Address: $DDE03B
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2C9:
    JSR $00F8            ; 20 F8 00 | Jump to subroutine
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BPL $30              ; 10 30 | Branch if positive
    EOR #$41             ; 49 41 | Exclusive OR with accumulator (immediate)
    LDY $480C            ; AC 0C 48 | Load from absolute address into Y register
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    BMI $00              ; 30 00 | Branch if negative
    INX                  ; E8 | Increment X register
    CLD                  ; D8 | Clear decimal mode flag
    RTI                  ; 40 | Return from interrupt
    ADC ($01,X)          ; 61 01 | Add with carry ((zero page,X))
    BMI $05              ; 30 05 | Branch if negative
    DEC                  ; 3A | Decrement accumulator
    ORA $0A01,X          ; 1D 01 0A | Logical OR with accumulator (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $12              ; 10 12 | Branch if positive
    ASL $0A00,X          ; 1E 00 0A | Arithmetic shift left (absolute,X)
    ASL $0C19            ; 0E 19 0C | Arithmetic shift left (absolute)
    BPL $16              ; 10 16 | Branch if positive
    BIT $23              ; 24 23 | Test bits in accumulator (zero page)
    JMP $A85840          ; 5C 40 58 A8 | Jump to address long
    CLI                  ; 58 | Clear interrupt disable flag
    ROL $4C              ; 26 4C | Rotate left (zero page)
    BMI $0F              ; 30 0F | Branch if negative
    CLC                  ; 18 | Clear carry flag
    ORA #$28             ; 09 28 | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2CA
; Address: $DDE094
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2CA:
    JMP $275A20          ; 5C 20 5A 27 | Jump to address long
    STA $3E43,X          ; 9D 43 3E | Update graphics data
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2CB
; Address: $DDE0AB
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2CB:
    JSR $303C            ; 20 3C 30 | Jump to subroutine
    JMP $000070          ; 5C 70 00 00 | Jump to address long
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BVS $00              ; 70 00 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    INY                  ; C8 | Increment Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    DEY                  ; 88 | Decrement Y register
    BEQ $20              ; F0 20 | Branch if equal
    BEQ $38              ; F0 38 | Branch if equal
    BNE $08              ; D0 08 | Branch if not equal
    BVS $10              ; 70 10 | Branch if overflow set
    CPX #$20             ; E0 20 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2CC
; Address: $DDE0CE
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2CC:
    PLA                  ; 68 | Pull accumulator from stack
    SEI                  ; 78 | Set interrupt disable flag
    PLP                  ; 28 | Pull processor status from stack
    BRA $00              ; 80 00 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BCC $80              ; 90 80 | Branch if carry clear
    INX                  ; E8 | Increment X register
    CPX #$B8             ; E0 B8 | Compare X register (immediate)
    BMI $90              ; 30 90 | Branch if negative
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BMI $08              ; 30 08 | Branch if negative
    BEQ $00              ; F0 00 | Branch if equal
    BVS $70              ; 70 70 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2CE
; Address: $DDE0F4
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2CE:
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $08              ; F0 08 | Branch if equal
    BEQ $0C              ; F0 0C | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $F8              ; F0 F8 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    RTI                  ; 40 | Return from interrupt
    ADC ($01,X)          ; 61 01 | Add with carry ((zero page,X))
    BMI $05              ; 30 05 | Branch if negative
    DEC                  ; 3A | Decrement accumulator
    ORA $0A01,X          ; 1D 01 0A | Logical OR with accumulator (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2CF
; Address: $DDE10E
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2CF:
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    ASL $0A00,X          ; 1E 00 0A | Arithmetic shift left (absolute,X)
    ORA ($06),Y          ; 11 06 | Logical OR with accumulator ((zero page),Y)
    ASL $110E            ; 0E 0E 11 | Arithmetic shift left (absolute)
    ORA #$12             ; 09 12 | Logical OR with accumulator (immediate)
    JMP ($5860)          ; 6C 60 58 | Jump to address (absolute indirect)
    LDY $4E83,X          ; BC 83 4E | Load from absolute,X into Y register
    AND ($3C),Y          ; 31 3C | Logical AND with accumulator ((zero page),Y)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA ($61,X)          ; 01 61 | Logical OR with accumulator ((zero page,X))
    LSR $9F21,X          ; 5E 21 9F | Logical shift right (absolute,X)
    RTI                  ; 40 | Return from interrupt
    DEY                  ; 88 | Decrement Y register
    BEQ $20              ; F0 20 | Branch if equal
    BEQ $38              ; F0 38 | Branch if equal
    BNE $08              ; D0 08 | Branch if not equal
    BVS $10              ; 70 10 | Branch if overflow set
    CPX #$20             ; E0 20 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2D0
; Address: $DDE14E
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2D0:
    INX                  ; E8 | Increment X register
    SED                  ; F8 | Set decimal mode flag
    PLP                  ; 28 | Pull processor status from stack
    BRA $00              ; 80 00 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BCC $80              ; 90 80 | Branch if carry clear
    INX                  ; E8 | Increment X register
    CPX #$E8             ; E0 E8 | Compare X register (immediate)
    CPX #$90             ; E0 90 | Compare X register (immediate)
    BRA $78              ; 80 78 | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BRA $38              ; 80 38 | Branch always
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    BEQ $E0              ; F0 E0 | Game work RAM access
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2D1
; Address: $DDE174
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2D1:
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $08              ; F0 08 | Branch if equal
    BEQ $84              ; F0 84 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BRA $78              ; 80 78 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    ASL $1C58,X          ; 1E 58 1C | Arithmetic shift left (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2D2
; Address: $DDE1A1
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2D2:
    ASL $2A              ; 06 2A | Arithmetic shift left (zero page)
    ORA $0E10,X          ; 1D 10 0E | Logical OR with accumulator (absolute,X)
    WDM #$63             ; 42 63 | Reserved instruction
    STA $386D            ; 8D 6D 38 | Update graphics data
    ORA ($12,X)          ; 01 12 | Logical OR with accumulator ((zero page,X))
    ORA ($30,X)          ; 01 30 | Logical OR with accumulator ((zero page,X))
    ADC $9C38,X          ; 7D 38 9C | Add with carry (absolute,X)
    ASL $9A0E,X          ; 1E 0E 9A | Arithmetic shift left (absolute,X)
    PHY                  ; 5A | Push Y register to stack
    EOR $2119,Y          ; 59 19 21 | PPU graphics register access
    AND ($40,X)          ; 21 40 | Logical AND with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2D3
; Address: $DDE1C8
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2D3:
    RTI                  ; 40 | Return from interrupt
    BMI $60              ; 30 60 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    ASL $1F              ; 06 1F | Arithmetic shift left (zero page)
    ASL $2B              ; 06 2B | Arithmetic shift left (zero page)
    PLA                  ; 68 | Pull accumulator from stack
    AND $1E07,Y          ; 39 07 1E | Logical AND with accumulator (absolute,Y)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    BPL $1C              ; 10 1C | Branch if positive
    CLC                  ; 18 | Clear carry flag
    BCS $52              ; B0 52 | Branch if carry set
    CPY #$2A             ; C0 2A | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2D4
; Address: $DDE1F2
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2D4:
    JSR $6000            ; 20 00 60 | Jump to subroutine
    INX                  ; E8 | Increment X register
    CPX #$00             ; E0 00 | Compare X register (immediate)
    JMP $2C00            ; 4C 00 2C | Jump to address
    ROL $54E0            ; 2E E0 54 | Rotate left (absolute)
    BEQ $4C              ; F0 4C | Branch if equal
    CLV                  ; B8 | Clear overflow flag
    PHP                  ; 08 | Push processor status to stack
    BEQ $3C              ; F0 3C | Branch if equal
    CPX $6E6E            ; EC 6E 6E | Compare X register (absolute)
    WDM #$C2             ; 42 C2 | Reserved instruction
    LDY #$A6             ; A0 A6 | Load immediate value into Y register
    BPL $00              ; 10 00 | Branch if positive
    PHA                  ; 48 | Push accumulator to stack
    LDX $3A1C,Y          ; BE 1C 3A | Load from absolute,Y into X register
    ADC ($78),Y          ; 71 78 | Add with carry ((zero page),Y)
    LSR $82              ; 46 82 | Logical shift right (zero page)
    STY $92              ; 84 92 | Store Y register to zero page
    STY $020E            ; 8C 0E 02 | Store Y register to absolute address
    BMI $70              ; 30 70 | Branch if negative
    BRA $D9              ; 80 D9 | Branch always
    BEQ $F0              ; F0 F0 | Branch if equal

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2D5
; Address: $DDE233
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2D5:
    PLA                  ; 68 | Pull accumulator from stack
    CPY #$E0             ; C0 E0 | Game work RAM access
    BEQ $34              ; F0 34 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPY $30F0            ; CC F0 30 | Compare Y register (absolute)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    ASL $2A              ; 06 2A | Arithmetic shift left (zero page)
    ORA $0E10,X          ; 1D 10 0E | Logical OR with accumulator (absolute,X)
    WDM #$43             ; 42 43 | Reserved instruction
    ORA $65              ; 05 65 | Logical OR with accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    ORA ($12,X)          ; 01 12 | Logical OR with accumulator ((zero page,X))
    ORA ($30,X)          ; 01 30 | Logical OR with accumulator ((zero page,X))
    ADC $5C38,X          ; 7D 38 5C | Add with carry (absolute,X)
    STX $221E            ; 8E 1E 22 | Store X register to absolute address
    ORA ($21,X)          ; 01 21 | PPU graphics register access
    EOR #$31             ; 49 31 | Exclusive OR with accumulator (immediate)
    BVS $40              ; 70 40 | Branch if overflow set
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2D6
; Address: $DDE269
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2D6:
    JSR $3040            ; 20 40 30 | Jump to subroutine
    BMI $0C              ; 30 0C | Branch if negative
    ASL $9B01            ; 0E 01 9B | Arithmetic shift left (absolute)
    RTI                  ; 40 | Return from interrupt
    BIT $331F            ; 2C 1F 33 | Test bits in accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ROL $54E0            ; 2E E0 54 | Rotate left (absolute)
    BEQ $4C              ; F0 4C | Branch if equal
    CLV                  ; B8 | Clear overflow flag
    PHP                  ; 08 | Push processor status to stack
    BEQ $3C              ; F0 3C | Branch if equal
    CPX $6E6E            ; EC 6E 6E | Compare X register (absolute)
    WDM #$C6             ; 42 C6 | Reserved instruction
    LDA ($B6),Y          ; B1 B6 | Read graphics status
    BPL $00              ; 10 00 | Branch if positive
    PHA                  ; 48 | Push accumulator to stack
    LDX $391C,Y          ; BE 1C 39 | Load from absolute,Y into X register
    BMI $78              ; 30 78 | Branch if negative
    BVS $00              ; 70 00 | Branch if overflow set
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $0F              ; 10 0F | Branch if positive
    SEC                  ; 38 | Set carry flag
    LDA $D3DE            ; AD DE D3 | Read graphics status
    LDY $ABD4            ; AC D4 AB | Load from absolute address into Y register
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2D7
; Address: $DDE2D4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2D7:
    JSR $0407            ; 20 07 04 | Jump to subroutine
    STA                  ; 9F 74 5E 33 | Update graphics data
    EOR $7B              ; 45 7B | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2D8
; Address: $DDE2E8
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2D8:
    EOR $6B33            ; 4D 33 6B | Exclusive OR with accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    AND $4405,X          ; 3D 05 44 | Logical AND with accumulator (absolute,X)
    SEC                  ; 38 | Set carry flag
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    BEQ $08              ; F0 08 | Branch if equal
    BEQ $EC              ; F0 EC | Branch if equal
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    PHX                  ; DA | Push X register to stack
    AND $DA35,X          ; 3D 35 DA | Logical AND with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BEQ $D6              ; F0 D6 | Branch if equal
    SEC                  ; 38 | Set carry flag
    SBC $F800,X          ; FD 00 F8 | Subtract with carry (absolute,X)
    CMP ($A5,X)          ; C1 A5 | Compare accumulator ((zero page,X))
    CPY $35              ; C4 35 | Compare Y register (zero page)
    CPX $B0              ; E4 B0 | Compare X register (zero page)
    PEA #$F85A           ; F4 5A F8 | Push effective address to stack
    BMI $00              ; 30 00 | Branch if negative
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    BPL $0F              ; 10 0F | Branch if positive
    SEC                  ; 38 | Set carry flag
    STA $ABEE,X          ; 9D EE AB | Update graphics data
    STY $107B            ; 8C 7B 10 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2DA
; Address: $DDE361
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2DA:
    CLC                  ; 18 | Clear carry flag
    ROL $6523,X          ; 3E 23 65 | Rotate left (absolute,X)
    EOR $5C73            ; 4D 73 5C | Exclusive OR with accumulator (absolute)
    ADC $6A3F            ; 6D 3F 6A | Add with carry (absolute)
    BEQ $08              ; F0 08 | Branch if equal
    BEQ $EC              ; F0 EC | Branch if equal
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    PHX                  ; DA | Push X register to stack
    CMP #$3F             ; C9 3F | Compare accumulator (immediate)
    CMP $0008,X          ; DD 08 00 | Compare accumulator (absolute,X)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BEQ $D6              ; F0 D6 | Branch if equal
    SEC                  ; 38 | Set carry flag
    SBC $F500,X          ; FD 00 F5 | Subtract with carry (absolute,X)
    DEC                  ; 3A | Decrement accumulator
    DEC $27              ; C6 27 | Decrement (zero page)
    SBC ($A5),Y          ; F1 A5 | Subtract with carry ((zero page),Y)
    CPY $D5              ; C4 D5 | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2DB
; Address: $DDE3AB
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2DB:
    CPX $F0              ; E4 F0 | Compare X register (zero page)
    CLV                  ; B8 | Clear overflow flag
    LDY #$38             ; A0 38 | Load immediate value into Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SBC $FB00,Y          ; F9 00 FB | Subtract with carry (absolute,Y)
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    INC                  ; 1A | Increment accumulator
    LDY $E0              ; A4 E0 | Game work RAM access
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    ORA $0B12            ; 0D 12 0B | Logical OR with accumulator (absolute)
    ORA ($76),Y          ; 11 76 | Logical OR with accumulator ((zero page),Y)
    ROR $E0              ; 66 E0 | Game work RAM access
    DEC $10D8,X          ; DE D8 10 | Decrement (absolute,X)
    ADC #$10             ; 69 10 | Add with carry (immediate)
    STA $78              ; 85 78 | Update graphics data
    CMP $F960,Y          ; D9 60 F9 | Compare accumulator (absolute,Y)
    NOP                  ; EA | No operation
    LDA $A6CE,Y          ; B9 CE A6 | Read graphics status
    CLI                  ; 58 | Clear interrupt disable flag
    PHA                  ; 48 | Push accumulator to stack
    BCS $CA              ; B0 CA | Branch if carry set
    TXS                  ; 9A | Transfer X register to stack pointer
    SEP #$BA             ; E2 BA | Set processor status bits
    PHY                  ; 5A | Push Y register to stack
    ROR $F802,X          ; 7E 02 F8 | Rotate right (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    ADC $3500,Y          ; 79 00 35 | Add with carry (absolute,Y)
    CMP $FD00            ; CD 00 FD | Compare accumulator (absolute)
    ADC $0200,X          ; 7D 00 02 | Add with carry (absolute,X)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $70              ; F0 70 | Branch if equal
    BEQ $C8              ; F0 C8 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    INY                  ; C8 | Increment Y register
    DEY                  ; 88 | Decrement Y register
    SED                  ; F8 | Set decimal mode flag
    STY $44F8            ; 8C F8 44 | Store Y register to absolute address
    CPY #$9C             ; C0 9C | Compare Y register (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    LDY $80              ; A4 80 | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2DE
; Address: $DDE45C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2DE:
    LDY #$58             ; A0 58 | Load immediate value into Y register
    BNE $88              ; D0 88 | Branch if not equal
    PHA                  ; 48 | Push accumulator to stack
    INY                  ; C8 | Increment Y register
    SEI                  ; 78 | Set interrupt disable flag
    CLV                  ; B8 | Clear overflow flag
    BEQ $90              ; F0 90 | Branch if equal
    TAY                  ; A8 | Transfer accumulator to Y register
    CLD                  ; D8 | Clear decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2DF
; Address: $DDE46E
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2DF:
    BVS $00              ; 70 00 | Branch if overflow set
    BEQ $B4              ; F0 B4 | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    INY                  ; C8 | Increment Y register
    BMI $F8              ; 30 F8 | Branch if negative
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BVS $00              ; 70 00 | Branch if overflow set
    BRA $00              ; 80 00 | Branch always
    ORA $0B12            ; 0D 12 0B | Logical OR with accumulator (absolute)
    BPL $71              ; 10 71 | Branch if positive
    ADC ($EC),Y          ; 71 EC | Add with carry ((zero page),Y)
    LDY $FAE7            ; AC E7 FA | Load from absolute address into Y register
    BPL $00              ; 10 00 | Branch if positive
    ORA $7200,X          ; 1D 00 72 | Logical OR with accumulator (absolute,X)
    LDA $FE72            ; AD 72 FE | Read graphics status
    RTI                  ; 40 | Return from interrupt
    PHX                  ; DA | Push X register to stack
    INC $92              ; E6 92 | Increment (zero page)
    EOR ($3E,X)          ; 41 3E | Exclusive OR with accumulator ((zero page,X))
    PLY                  ; 7A | Pull Y register from stack
    CPY $98F2            ; CC F2 98 | Compare Y register (absolute)
    INC $70BE            ; EE BE 70 | Increment (absolute)
    ADC $FE08,Y          ; 79 08 FE | Add with carry (absolute,Y)
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    ROL $4700,X          ; 3E 00 47 | Rotate left (absolute,X)
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    ASL $C800            ; 0E 00 C8 | Arithmetic shift left (absolute)
    DEY                  ; 88 | Decrement Y register
    SED                  ; F8 | Set decimal mode flag
    STY $04F8            ; 8C F8 04 | Store Y register to absolute address
    RTI                  ; 40 | Return from interrupt
    STZ $0498            ; 9C 98 04 | Store zero to absolute
    BRA $A4              ; 80 A4 | Branch always

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2E1
; Address: $DDE4D4
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2E1:
    BPL $00              ; 10 00 | Branch if positive
    BRA $3C              ; 80 3C | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2E2
; Address: $DDE4DB
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2E2:
    JSR $1860            ; 20 60 18 | Jump to subroutine
    BVC $08              ; 50 08 | Branch if overflow clear
    STY $74              ; 84 74 | Store Y register to zero page
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    CLV                  ; B8 | Clear overflow flag
    BPL $B0              ; 10 B0 | Branch if positive
    TAY                  ; A8 | Transfer accumulator to Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    CLV                  ; B8 | Clear overflow flag
    BCC $F0              ; 90 F0 | Branch if carry clear
    BMI $34              ; 30 34 | Branch if negative
    SEC                  ; 38 | Set carry flag
    PHA                  ; 48 | Push accumulator to stack
    BMI $78              ; 30 78 | Branch if negative
    BVS $00              ; 70 00 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    BVS $00              ; 70 00 | Branch if overflow set
    ORA #$12             ; 09 12 | Logical OR with accumulator (immediate)
    ORA ($32,X)          ; 01 32 | Logical OR with accumulator ((zero page,X))
    TYA                  ; 98 | Transfer Y register to accumulator
    DEY                  ; 88 | Decrement Y register
    ADC ($61),Y          ; 71 61 | Add with carry ((zero page),Y)
    BCC $A0              ; 90 A0 | Branch if carry clear
    NOP                  ; EA | No operation
    BRA $10              ; 80 10 | Branch always
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    CPX #$07             ; E0 07 | Compare X register (immediate)
    CPY $0B              ; C4 0B | Compare Y register (zero page)
    ORA ($9F,X)          ; 01 9F | Logical OR with accumulator ((zero page,X))
    BIT $6A9B            ; 2C 9B 6A | Test bits in accumulator (absolute)
    CPX $8C              ; E4 8C | Compare X register (zero page)
    STA $278CA3          ; 8F A3 8C 27 | Update graphics data
    LDA $2B2E2D          ; AF 2D 2E 2B | Read graphics status
    LSR $0A              ; 46 0A | Logical shift right (zero page)
    STZ $DF03            ; 9C 03 DF | Store zero to absolute

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2E3
; Address: $DDE53E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2E3:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BCC $48              ; 90 48 | Branch if carry clear
    BRA $4E              ; 80 4E | Branch always
    PLX                  ; FA | Pull X register from stack
    LDA $1FFB            ; AD FB 1F | Read graphics status
    ORA ($8B),Y          ; 11 8B | Logical OR with accumulator ((zero page),Y)
    STA $0D              ; 85 0D | Update graphics data

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2E4
; Address: $DDE54D
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2E4:
    ASL $56              ; 06 56 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2E5
; Address: $DDE553
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2E5:
    BMI $42              ; 30 42 | Hardware register operation
    CPX #$47             ; E0 47 | Compare X register (immediate)
    BMI $26              ; 30 26 | Branch if negative
    BNE $28              ; D0 28 | Branch if not equal
    BRA $F4              ; 80 F4 | Branch always
    LSR $362A,X          ; 5E 2A 36 | Logical shift right (absolute,X)
    INC $DA              ; E6 DA | Increment (zero page)
    INY                  ; C8 | Increment Y register
    CPX $1CF6            ; EC F6 1C | Compare X register (absolute)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2E6
; Address: $DDE56F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2E6:
    JSR $603C            ; 20 3C 60 | Jump to subroutine
    LSR $3EE0,X          ; 5E E0 3E | Logical shift right (absolute,X)
    CPY #$FE             ; C0 FE | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2E7
; Address: $DDE57E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2E7:
    JSR $00E0            ; 20 E0 00 | Jump to subroutine
    ORA #$12             ; 09 12 | Logical OR with accumulator (immediate)
    ORA ($32,X)          ; 01 32 | Logical OR with accumulator ((zero page,X))
    STA                  ; 9F 78 68 91 | Update graphics data
    LDA ($F0,X)          ; A1 F0 | Read graphics status
    BRA $8A              ; 80 8A | Branch always

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2E8
; Address: $DDE58F
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2E8:
    JSR $0610            ; 20 10 06 | Jump to subroutine
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $07              ; 80 07 | Branch always
    REP #$0C             ; C2 0C | Reset processor status bits
    STY $0B              ; 84 0B | Store Y register to zero page
    EOR ($9F,X)          ; 41 9F | Exclusive OR with accumulator ((zero page,X))
    JMP ($8AEB)          ; 6C EB 8A | Jump to address (absolute indirect)
    STY $AC              ; 84 AC | Store Y register to zero page
    LDA $2B23            ; AD 23 2B | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ASL $9A              ; 06 9A | Arithmetic shift left (zero page)
    SEC                  ; 38 | Set carry flag
    BCC $48              ; 90 48 | Branch if carry clear
    BRA $4C              ; 80 4C | Branch always
    SED                  ; F8 | Set decimal mode flag
    LDX $19FA            ; AE FA 19 | Load from absolute address into X register
    STA $050B81          ; 8F 81 0B 05 | Update graphics data
    ASL $6008            ; 0E 08 60 | Arithmetic shift left (absolute)
    BMI $40              ; 30 40 | Branch if negative
    CPX #$47             ; E0 47 | Compare X register (immediate)
    BMI $27              ; 30 27 | Branch if negative
    BNE $2E              ; D0 2E | Branch if not equal
    BRA $F6              ; 80 F6 | Branch always
    SEC                  ; 38 | Set carry flag
    JMP $F2362A          ; 5C 2A 36 F2 | Jump to address long
    DEC $EC32            ; CE 32 EC | Decrement (absolute)
    INC $76B4,X          ; FE B4 76 | Increment (absolute,X)
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2EA
; Address: $DDE5F2
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2EA:
    JMP $C03EE0          ; 5C E0 3E C0 | Jump to address long
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    ORA ($2E),Y          ; 11 2E | Logical OR with accumulator ((zero page),Y)
    AND ($1F),Y          ; 31 1F | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2EC
; Address: $DDE60C
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2EC:
    JSR $4540            ; 20 40 45 | Jump to subroutine
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    CPY #$3C             ; C0 3C | Compare Y register (immediate)
    ASL $85              ; 06 85 | Arithmetic shift left (zero page)
    INC                  ; 1A | Increment accumulator
    PLB                  ; AB | Pull data bank register from stack
    ORA ($BE),Y          ; 11 BE | Logical OR with accumulator ((zero page),Y)
    LDA $524D            ; AD 4D 52 | Read graphics status
    ASL $0F5D,X          ; 1E 5D 0F | Arithmetic shift left (absolute,X)
    EOR #$55             ; 49 55 | Exclusive OR with accumulator (immediate)
    LSR $0E              ; 46 0E | Logical shift right (zero page)
    ORA $B31E            ; 0D 1E B3 | Logical OR with accumulator (absolute)
    LDA                  ; BF 00 AF 00 | Read graphics status
    LDA                  ; BF 00 AE 00 | Read graphics status
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BEQ $00              ; F0 00 | Branch if equal
    BCS $48              ; B0 48 | Branch if carry set
    BNE $68              ; D0 68 | Branch if not equal
    BNE $48              ; D0 48 | Branch if not equal
    DEY                  ; 88 | Decrement Y register
    ROL $A736,X          ; 3E 36 A7 | Rotate left (absolute,X)
    LDA ($5B,X)          ; A1 5B | Read graphics status
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2ED
; Address: $DDE654
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2ED:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    LDA ($DE,X)          ; A1 DE | Read graphics status
    STX $9F              ; 86 9F | Store X register to zero page
    AND $65F3            ; 2D F3 65 | Logical AND with accumulator (absolute)
    TSX                  ; BA | Transfer stack pointer to X register
    STY $D32D            ; 8C 2D D3 | Store Y register to absolute address
    AND $DDE7,Y          ; 39 E7 DD | Logical AND with accumulator (absolute,Y)
    DEC                  ; 3A | Decrement accumulator
    ROR $FF40,X          ; 7E 40 FF | Rotate right (absolute,X)
    INC $EC00,X          ; FE 00 EC | Increment (absolute,X)
    ROL $4000,X          ; 3E 00 40 | Rotate left (absolute,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    PLP                  ; 28 | Pull processor status from stack
    ORA ($2E),Y          ; 11 2E | Logical OR with accumulator ((zero page),Y)
    AND ($1F),Y          ; 31 1F | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2EF
; Address: $DDE68C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2EF:
    JSR $2500            ; 20 00 25 | Jump to subroutine
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    ASL $45              ; 06 45 | Arithmetic shift left (zero page)
    INC                  ; 1A | Increment accumulator
    ORA ($5E),Y          ; 11 5E | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2F0
; Address: $DDE6A1
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2F0:
    JSL $322D6D          ; 22 6D 2D 32 | Jump to subroutine long
    ASL $0A3D,X          ; 1E 3D 0A | Arithmetic shift left (absolute,X)
    AND $3936            ; 2D 36 39 | Logical AND with accumulator (absolute)
    AND $0F2B,X          ; 3D 2B 0F | Logical AND with accumulator (absolute,X)
    ORA $531E            ; 0D 1E 53 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2F1
; Address: $DDE6BE
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2F1:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BEQ $00              ; F0 00 | Branch if equal
    BCS $48              ; B0 48 | Branch if carry set
    BNE $68              ; D0 68 | Branch if not equal
    BNE $48              ; D0 48 | Branch if not equal
    DEY                  ; 88 | Decrement Y register
    ROL $26              ; 26 26 | Rotate left (zero page)
    LDA ($57),Y          ; B1 57 | Read graphics status
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2F2
; Address: $DDE6D4
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2F2:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    INC $38              ; E6 38 | Increment (zero page)
    LDA ($CE),Y          ; B1 CE | Read graphics status
    STA $FA25F3          ; 8F F3 25 FA | Update graphics data
    STA ($6E),Y          ; 91 6E | Update graphics data
    DEC $B330            ; CE 30 B3 | Decrement (absolute)
    STA $FDF7,Y          ; 99 F7 FD | Update graphics data
    STX $109E            ; 8E 9E 10 | Store X register to absolute address
    INC $EE00,X          ; FE 00 EE | Increment (absolute,X)
    BEQ $00              ; F0 00 | Branch if equal
    STX $1000            ; 8E 00 10 | Store X register to absolute address
    BVS $00              ; 70 00 | Branch if overflow set
    AND $3719,Y          ; 39 19 37 | Logical AND with accumulator (absolute,Y)
    ORA $163F,Y          ; 19 3F 16 | Logical OR with accumulator (absolute,Y)
    BIT $67              ; 24 67 | Test bits in accumulator (zero page)
    ROL $7B              ; 26 7B | Rotate left (zero page)
    ROR $3D0D,X          ; 7E 0D 3D | Rotate right (absolute,X)
    ASL $0502,X          ; 1E 02 05 | Arithmetic shift left (absolute,X)
    BIT $3F              ; 24 3F | Test bits in accumulator (zero page)
    ROL $3F              ; 26 3F | Rotate left (zero page)
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2F3
; Address: $DDE741
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2F3:
    JSL $6F40B7          ; 22 B7 40 6F | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    BIT $5818            ; 2C 18 58 | Test bits in accumulator (absolute)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2F4
; Address: $DDE750
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2F4:
    PLY                  ; 7A | Pull Y register from stack
    PHA                  ; 48 | Push accumulator to stack
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ROL $1C00,X          ; 3E 00 1C | Rotate left (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    BEQ $40              ; F0 40 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2F5
; Address: $DDE76D
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2F5:
    BVC $FC              ; 50 FC | Branch if overflow clear
    BMI $00              ; 30 00 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BEQ $60              ; F0 60 | Branch if equal
    BEQ $50              ; F0 50 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BMI $F8              ; 30 F8 | Branch if negative
    INC $CE28            ; EE 28 CE | Increment (absolute)
    PHA                  ; 48 | Push accumulator to stack
    INC $FEF8,X          ; FE F8 FE | Increment (absolute,X)
    CLV                  ; B8 | Clear overflow flag
    ROR $FC90,X          ; 7E 90 FC | Rotate right (absolute,X)
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    STY $E0              ; 84 E0 | Game work RAM access
    LDX #$28             ; A2 28 | Load immediate value into X register
    PHA                  ; 48 | Push accumulator to stack
    SED                  ; F8 | Set decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    BPL $FC              ; 10 FC | Branch if positive
    SED                  ; F8 | Set decimal mode flag
    STX $B4              ; 86 B4 | Store X register to zero page
    STA                  ; 9F 82 C1 80 | Update graphics data
    CMP #$80             ; C9 80 | Compare accumulator (immediate)
    DEC $04              ; C6 04 | Decrement (zero page)
    STX $1A04            ; 8E 04 1A | Store X register to absolute address
    DEX                  ; CA | Decrement X register
    LDX $B680,Y          ; BE 80 B6 | Load from absolute,Y into X register
    BRA $38              ; 80 38 | Branch always
    BRA $70              ; 80 70 | Branch always
    BRA $E0              ; 80 E0 | Game work RAM access
    BMI $00              ; 30 00 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$87             ; E0 87 | Compare X register (immediate)
    WDM #$37             ; 42 37 | Reserved instruction
    STA ($9F,X)          ; 81 9F | Update graphics data
    AND ($5B),Y          ; 31 5B | Logical AND with accumulator ((zero page),Y)
    BMI $70              ; 30 70 | Branch if negative
    PLY                  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2F6
; Address: $DDE7D2
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2F6:
    CMP #$83             ; C9 83 | Compare accumulator (immediate)
    EOR ($03,X)          ; 41 03 | Exclusive OR with accumulator ((zero page,X))
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    BPL $03              ; 10 03 | Branch if positive
    INC $CE28            ; EE 28 CE | Increment (absolute)
    PHA                  ; 48 | Push accumulator to stack
    INC $FEF8,X          ; FE F8 FE | Increment (absolute,X)
    CLV                  ; B8 | Clear overflow flag
    ROR $FC90,X          ; 7E 90 FC | Rotate right (absolute,X)
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    BRA $E0              ; 80 E0 | Game work RAM access
    LDY $28              ; A4 28 | Load from zero page into Y register
    PHA                  ; 48 | Push accumulator to stack
    SED                  ; F8 | Set decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    BPL $FC              ; 10 FC | Branch if positive
    SED                  ; F8 | Set decimal mode flag
    STY $B0              ; 84 B0 | Store Y register to zero page
    STZ $C184,X          ; 9E 84 C1 | Store zero to absolute,X
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    STX $04              ; 86 04 | Store X register to zero page
    TXA                  ; 8A | Transfer X register to accumulator
    INC                  ; 1A | Increment accumulator
    LDX $8400            ; AE 00 84 | Load from absolute address into X register
    SED                  ; F8 | Set decimal mode flag
    LDX $3682,Y          ; BE 82 36 | Load from absolute,Y into X register
    BRA $78              ; 80 78 | Branch always
    BVS $00              ; 70 00 | Branch if overflow set
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BVC $00              ; 50 00 | Branch if overflow clear
    SEI                  ; 78 | Set interrupt disable flag
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ORA $0005,X          ; 1D 05 00 | Logical OR with accumulator (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $0F              ; 05 0F | Logical OR with accumulator (zero page)
    ORA $3F05,X          ; 1D 05 3F | Logical OR with accumulator (absolute,X)
    ORA $093F            ; 0D 3F 09 | Logical OR with accumulator (absolute)
    AND $1F02,X          ; 3D 02 1F | Logical AND with accumulator (absolute,X)
    ORA #$FD             ; 09 FD | Logical OR with accumulator (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2F7
; Address: $DDE850
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2F7:
    ORA $0F              ; 05 0F | Logical OR with accumulator (zero page)
    ORA $091F            ; 0D 1F 09 | Logical OR with accumulator (absolute)
    ORA $1D00,X          ; 1D 00 1D | Logical OR with accumulator (absolute,X)
    ROL $7162,X          ; 3E 62 71 | Rotate left (absolute,X)
    SEP #$0A             ; E2 0A | Set processor status bits
    CPX #$11             ; E0 11 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2F8
; Address: $DDE86E
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2F8:
    INC $1F02,X          ; FE 02 1F | Increment (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    EOR ($3F),Y          ; 51 3F | Exclusive OR with accumulator ((zero page),Y)
    BMI $00              ; 30 00 | Branch if negative
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CPY #$3C             ; C0 3C | Compare Y register (immediate)
    BMI $7C              ; 30 7C | Branch if negative
    BVS $00              ; 70 00 | Branch if overflow set
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BMI $FC              ; 30 FC | Branch if negative
    BVS $FC              ; 70 FC | Branch if overflow set
    INC $F6E8,X          ; FE E8 F6 | Increment (absolute,X)
    CPY $9CFE            ; CC FE 9C | Compare Y register (absolute)
    REP #$74             ; C2 74 | Reset processor status bits
    CLV                  ; B8 | Clear overflow flag
    PEA #$FC52           ; F4 52 FC | Push effective address to stack
    ASL $54FC            ; 0E FC 54 | Arithmetic shift left (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    CPX #$F6             ; E0 F6 | Compare X register (immediate)
    CPY #$F2             ; C0 F2 | Compare Y register (immediate)
    BRA $E2              ; 80 E2 | Branch always
    PHP                  ; 08 | Push processor status to stack
    BRA $02              ; 80 02 | Branch always
    BRA $00              ; 80 00 | Branch always
    SEC                  ; 38 | Set carry flag
    CLI                  ; 58 | Clear interrupt disable flag
    BMI $48              ; 30 48 | Branch if negative
    BCS $70              ; B0 70 | Branch if carry set

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2FA
; Address: $DDE8CD
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2FA:
    JSR $80F8            ; 20 F8 80 | Jump to subroutine
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    STY $0800            ; 8C 00 08 | Store Y register to absolute address
    BRA $80              ; 80 80 | Branch always
    INC                  ; 1A | Increment accumulator
    CPY #$02             ; C0 02 | Compare Y register (immediate)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ORA ($0D,X)          ; 01 0D | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    ASL $3F5A,X          ; 1E 5A 3F | Arithmetic shift left (absolute,X)
    ROL $5E00,X          ; 3E 00 5E | Rotate left (absolute,X)
    JMP ($3000)          ; 6C 00 30 | Jump to address (absolute indirect)
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2FB
; Address: $DDE8FF
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2FB:
    ORA ($78,X)          ; 01 78 | Logical OR with accumulator ((zero page,X))
    INX                  ; E8 | Increment X register
    BMI $78              ; 30 78 | Branch if negative
    BNE $28              ; D0 28 | Branch if not equal
    CPY #$E0             ; C0 E0 | Game work RAM access
    BRA $C0              ; 80 C0 | Branch always
    CPX #$80             ; E0 80 | Compare X register (immediate)
    CLV                  ; B8 | Clear overflow flag
    LDY #$84             ; A0 84 | Load immediate value into Y register
    BPL $30              ; 10 30 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BMI $00              ; 30 00 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    LDY #$E0             ; A0 E0 | Game work RAM access
    ASL $0939            ; 0E 39 09 | Arithmetic shift left (absolute)
    ASL $091F            ; 0E 1F 09 | Arithmetic shift left (absolute)
    BIT $2B6E            ; 2C 6E 2B | Test bits in accumulator (absolute)
    ADC $7837,X          ; 7D 37 78 | Add with carry (absolute,X)
    ROR $380D,X          ; 7E 0D 38 | Rotate right (absolute,X)
    BIT $283F            ; 2C 3F 28 | Test bits in accumulator (absolute)
    BMI $38              ; 30 38 | Branch if negative
    SEC                  ; 38 | Set carry flag
    BMI $00              ; 30 00 | Branch if negative
    BPL $60              ; 10 60 | Branch if positive

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2FC
; Address: $DDE95D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2FC:
    JSR $1080            ; 20 80 10 | Jump to subroutine
    ROR                  ; 6A | Rotate right (accumulator)
    STA ($69),Y          ; 91 69 | Update graphics data
    BVS $26              ; 70 26 | Branch if overflow set
    CLI                  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2FD
; Address: $DDE969
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2FD:
    JSR $2054            ; 20 54 20 | Jump to subroutine
    EOR ($20,X)          ; 41 20 | Exclusive OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    ASL $0100,X          ; 1E 00 01 | Arithmetic shift left (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $C0              ; F0 C0 | Branch if equal
    CLV                  ; B8 | Clear overflow flag
    LDY #$DC             ; A0 DC | Load immediate value into Y register
    BVC $FC              ; 50 FC | Branch if overflow clear
    SEI                  ; 78 | Set interrupt disable flag
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BEQ $A0              ; F0 A0 | Branch if equal
    BEQ $50              ; F0 50 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2FE
; Address: $DDE9A0
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2FE:
    INC $7E98,X          ; FE 98 7E | Increment (absolute,X)
    INY                  ; C8 | Increment Y register
    LDX $1EE8,Y          ; BE E8 1E | Load from absolute,Y into X register
    LDY #$7E             ; A0 7E | Load immediate value into Y register
    BCS $1C              ; B0 1C | Branch if carry set
    BEQ $48              ; F0 48 | Branch if equal
    BEQ $38              ; F0 38 | Branch if equal
    INX                  ; E8 | Increment X register
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    CMP #$5C             ; C9 5C | Compare accumulator (immediate)
    STA $92              ; 85 92 | Update graphics data
    ASL $60              ; 06 60 | Arithmetic shift left (zero page)
    CPY #$0A             ; C0 0A | Compare Y register (immediate)
    WDM #$00             ; 42 00 | Reserved instruction
    RTI                  ; 40 | Return from interrupt
    ROL $1C              ; 26 1C | Rotate left (zero page)
    ROR                  ; 6A | Rotate right (accumulator)
    TYA                  ; 98 | Transfer Y register to accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_2FF
; Address: $DDE9D6
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_2FF:
    SEC                  ; 38 | Set carry flag
    CPY #$F4             ; C0 F4 | Compare Y register (immediate)
    LDY $0800,X          ; BC 00 08 | Load from absolute,X into Y register
    CPX #$6F             ; E0 6F | Compare X register (immediate)
    BIT $2B6E            ; 2C 6E 2B | Test bits in accumulator (absolute)
    ADC $7837,X          ; 7D 37 78 | Add with carry (absolute,X)
    ROR $380D,X          ; 7E 0D 38 | Rotate right (absolute,X)
    BIT $283F            ; 2C 3F 28 | Test bits in accumulator (absolute)
    BMI $38              ; 30 38 | Branch if negative
    SEC                  ; 38 | Set carry flag
    BMI $00              ; 30 00 | Branch if negative
    BPL $60              ; 10 60 | Branch if positive

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_300
; Address: $DDE9FD
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_300:
    JSR $50E0            ; 20 E0 50 | Jump to subroutine
    INC                  ; 1A | Increment accumulator
    CMP ($69),Y          ; D1 69 | Compare accumulator ((zero page),Y)
    BCC $66              ; 90 66 | Branch if carry clear
    PLY                  ; 7A | Pull Y register from stack
    BVS $20              ; 70 20 | Branch if overflow set
    ADC ($20),Y          ; 71 20 | Add with carry ((zero page),Y)
    STY $18              ; 84 18 | Store Y register to zero page
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    ASL $3800            ; 0E 00 38 | Arithmetic shift left (absolute)
    INC $7E98,X          ; FE 98 7E | Increment (absolute,X)
    INY                  ; C8 | Increment Y register
    LDX $1EE8,Y          ; BE E8 1E | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_301
; Address: $DDEA27
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_301:
    LDY #$7E             ; A0 7E | Load immediate value into Y register
    BCS $1C              ; B0 1C | Branch if carry set
    BEQ $48              ; F0 48 | Branch if equal
    BEQ $38              ; F0 38 | Branch if equal
    CPX $7C18            ; EC 18 7C | Compare X register (absolute)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CMP #$5A             ; C9 5A | Compare accumulator (immediate)
    STA $90              ; 85 90 | Update graphics data
    ASL $60              ; 06 60 | Arithmetic shift left (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    CPY #$12             ; C0 12 | Compare Y register (immediate)
    STY $F800            ; 8C 00 F8 | Store Y register to absolute address
    BRA $26              ; 80 26 | Branch always
    INC                  ; 1A | Increment accumulator
    ROR                  ; 6A | Rotate right (accumulator)
    BPL $98              ; 10 98 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_302
; Address: $DDEA57
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_302:
    CPY #$EC             ; C0 EC | Compare Y register (immediate)
    BVS $00              ; 70 00 | Branch if overflow set
    BRA $80              ; 80 80 | Branch always
    ASL $5800,X          ; 1E 00 58 | Arithmetic shift left (absolute,X)
    JMP ($6990)          ; 6C 90 69 | Jump to address (absolute indirect)
    BVS $26              ; 70 26 | Branch if overflow set
    CLI                  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_303
; Address: $DDEA69
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_303:
    JSR $2050            ; 20 50 20 | Jump to subroutine
    EOR ($20,X)          ; 41 20 | Exclusive OR with accumulator ((zero page,X))
    ORA ($61,X)          ; 01 61 | Logical OR with accumulator ((zero page,X))
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    BIT #$06             ; 89 06 | Test bits in accumulator (immediate)
    ASL $0100,X          ; 1E 00 01 | Arithmetic shift left (absolute,X)
    ORA ($C7,X)          ; 01 C7 | Logical OR with accumulator ((zero page,X))
    BNE $47              ; D0 47 | Branch if not equal
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_304
; Address: $DDEA84
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_304:
    JSL $042A00          ; 22 00 2A 04 | Jump to subroutine long
    INC                  ; 1A | Increment accumulator
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    DEX                  ; CA | Decrement X register
    BNE $00              ; D0 00 | Branch if not equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt
    CPX #$1E             ; E0 1E | Compare X register (immediate)
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_305
; Address: $DDEAA3
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_305:
    BIT $2950            ; 2C 50 29 | Test bits in accumulator (absolute)
    BMI $06              ; 30 06 | Branch if negative
    SEC                  ; 38 | Set carry flag
    BPL $30              ; 10 30 | Branch if positive
    BPL $27              ; 10 27 | Branch if positive
    ORA ($1D,X)          ; 01 1D | Logical OR with accumulator ((zero page,X))
    ORA $21              ; 05 21 | PPU graphics register access
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    EOR #$06             ; 49 06 | Exclusive OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    CLD                  ; D8 | Clear decimal mode flag
    CPY #$22             ; C0 22 | Compare Y register (immediate)
    ROL                  ; 2A | Rotate left (accumulator)
    INC                  ; 1A | Increment accumulator
    REP #$00             ; C2 00 | Reset processor status bits
    INC $7800,X          ; FE 00 78 | Increment (absolute,X)
    PHX                  ; DA | Push X register to stack
    CPY #$D8             ; C0 D8 | Compare Y register (immediate)
    BNE $00              ; D0 00 | Branch if not equal
    CPX $00              ; E4 00 | Compare X register (zero page)
    SED                  ; F8 | Set decimal mode flag
    BRA $00              ; 80 00 | Branch always
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL $2E              ; 06 2E | Arithmetic shift left (zero page)
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_306
; Address: $DDEAED
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_306:
    JSR $1120            ; 20 20 11 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($2C,X)          ; 01 2C | Logical OR with accumulator ((zero page,X))
    BIT $1B              ; 24 1B | Test bits in accumulator (zero page)
    EOR ($2E),Y          ; 51 2E | Exclusive OR with accumulator ((zero page),Y)
    ASL $0431            ; 0E 31 04 | Arithmetic shift left (absolute)
    BMI $1F              ; 30 1F | Branch if negative
    BMI $20              ; 30 20 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CLI                  ; 58 | Clear interrupt disable flag
    STA                  ; 9F 6B 00 1F | Update graphics data
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CLD                  ; D8 | Clear decimal mode flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_307
; Address: $DDEB21
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_307:
    SED                  ; F8 | Set decimal mode flag
    TAX                  ; AA | Transfer accumulator to X register
    CPX $CA              ; E4 CA | Compare X register (zero page)
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    BPL $F6              ; 10 F6 | Branch if positive

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_308
; Address: $DDEB2A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_308:
    INY                  ; C8 | Increment Y register
    CLC                  ; 18 | Clear carry flag
    SBC #$EA             ; E9 EA | Subtract with carry (immediate)
    SED                  ; F8 | Set decimal mode flag
    BPL $E0              ; 10 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_309
; Address: $DDEB34
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_309:
    JSR $1E10            ; 20 10 1E | Jump to subroutine
    PLX                  ; FA | Pull X register from stack
    INC $FFCB,X          ; FE CB FF | Increment (absolute,X)
    NOP                  ; EA | No operation
    INC $1F30,X          ; FE 30 1F | Increment (absolute,X)
    BMI $20              ; 30 20 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    PHA                  ; 48 | Push accumulator to stack
    CLC                  ; 18 | Clear carry flag
    CLD                  ; D8 | Clear decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CLD                  ; D8 | Clear decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    TAX                  ; AA | Transfer accumulator to X register
    CPX $CA              ; E4 CA | Compare X register (zero page)
    CLC                  ; 18 | Clear carry flag
    PEA #$CAC9           ; F4 C9 CA | Push effective address to stack
    CLC                  ; 18 | Clear carry flag
    INC                  ; 1A | Increment accumulator
    SED                  ; F8 | Set decimal mode flag
    PHX                  ; DA | Push X register to stack
    SED                  ; F8 | Set decimal mode flag
    BPL $E0              ; 10 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_30A
; Address: $DDEB74
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_30A:
    JSR $1810            ; 20 10 18 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    PEA #$CAFC           ; F4 FC CA | Push effective address to stack
    INC $FE1B,X          ; FE 1B FE | Increment (absolute,X)
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($2F,X)          ; 01 2F | Logical OR with accumulator ((zero page,X))
    ROR $791F,X          ; 7E 1F 79 | Rotate right (absolute,X)
    PLY                  ; 7A | Pull Y register from stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($64,X)          ; 01 64 | Logical OR with accumulator ((zero page,X))
    CLI                  ; 58 | Clear interrupt disable flag
    RTI                  ; 40 | Return from interrupt
    BRA $7E              ; 80 7E | Branch always
    BRA $78              ; 80 78 | Branch always
    BIT $36              ; 24 36 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_30B
; Address: $DDEBA2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_30B:
    JSL $133007          ; 22 07 30 13 | Jump to subroutine long
    BPL $01              ; 10 01 | Branch if positive
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA $112E            ; 0D 2E 11 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_30C
; Address: $DDEBAE
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_30C:
    ASL $38              ; 06 38 | Arithmetic shift left (zero page)
    BPL $18              ; 10 18 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $1E              ; 06 1E | Arithmetic shift left (zero page)
    AND $7938,X          ; 3D 38 79 | Logical AND with accumulator (absolute,X)
    ADC $1B25,X          ; 7D 25 1B | Add with carry (absolute,X)
    JMP $586063          ; 5C 63 60 58 | Jump to address long
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_30D
; Address: $DDEBC8
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_30D:
    ROR                  ; 6A | Rotate right (accumulator)
    EOR ($33),Y          ; 51 33 | Exclusive OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    AND $0701,X          ; 3D 01 07 | Logical AND with accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag
    CLD                  ; D8 | Clear decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_30E
; Address: $DDEBD3
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_30E:
    CPX #$5D             ; E0 5D | Compare X register (immediate)
    PHX                  ; DA | Push X register to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_30F
; Address: $DDEBD7
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_30F:
    CPX $71              ; E4 71 | Compare X register (zero page)
    RTI                  ; 40 | Return from interrupt
    CPY $F8C8            ; CC C8 F8 | Compare Y register (absolute)
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    BIT $9828            ; 2C 28 98 | Test bits in accumulator (absolute)
    BCC $08              ; 90 08 | Branch if carry clear
    PHP                  ; 08 | Push processor status to stack
    JMP ($249C)          ; 6C 9C 24 | Jump to address (absolute indirect)
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    BNE $08              ; D0 08 | Branch if not equal
    BNE $18              ; D0 18 | Branch if not equal
    CLD                  ; D8 | Clear decimal mode flag
    BIT $C4A0            ; 2C A0 C4 | Test bits in accumulator (absolute)
    PLA                  ; 68 | Pull accumulator from stack
    BRA $90              ; 80 90 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_311
; Address: $DDEC15
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_311:
    JSR $5800            ; 20 00 58 | Jump to subroutine
    SEI                  ; 78 | Set interrupt disable flag
    CLV                  ; B8 | Clear overflow flag
    BCS $00              ; B0 00 | Branch if carry set
    BVS $80              ; 70 80 | Branch if overflow set
    BVS $88              ; 70 88 | Branch if overflow set
    BVS $E0              ; 70 E0 | Game work RAM access
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_312
; Address: $DDEC27
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_312:
    CPX #$78             ; E0 78 | Compare X register (immediate)
    BRA $F0              ; 80 F0 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_313
; Address: $DDEC2D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_313:
    BRA $E0              ; 80 E0 | Game work RAM access
    PHA                  ; 48 | Push accumulator to stack
    BVS $00              ; 70 00 | Branch if overflow set
    BVS $00              ; 70 00 | Branch if overflow set
    CLC                  ; 18 | Clear carry flag
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$E0             ; E0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_314
; Address: $DDEC42
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_314:
    JSL $133007          ; 22 07 30 13 | Jump to subroutine long
    BPL $01              ; 10 01 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $18              ; 10 18 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $3F0E,X          ; 1E 0E 3F | Arithmetic shift left (absolute,X)
    ASL $1E7E,X          ; 1E 7E 1E | Arithmetic shift left (absolute,X)
    ROR $2C13,X          ; 7E 13 2C | Rotate right (absolute,X)
    AND $516E            ; 2D 6E 51 | Logical AND with accumulator (absolute)
    JMP $586560          ; 5C 60 65 58 | Jump to address long
    AND $2A10            ; 2D 10 2A | Logical AND with accumulator (absolute)
    ORA $001F            ; 0D 1F 00 | Logical OR with accumulator (absolute)
    ROL $2CEE            ; 2E EE 2C | Rotate left (absolute)
    CPX $D050            ; EC 50 D0 | Compare X register (absolute)
    SBC ($78,X)          ; E1 78 | Subtract with carry ((zero page,X))
    PLX                  ; FA | Pull X register from stack
    CLC                  ; 18 | Clear carry flag
    PHX                  ; DA | Push X register to stack
    ORA ($41),Y          ; 11 41 | Logical OR with accumulator ((zero page),Y)
    PLA                  ; 68 | Pull accumulator from stack
    BNE $08              ; D0 08 | Branch if not equal
    BNE $18              ; D0 18 | Branch if not equal
    CLD                  ; D8 | Clear decimal mode flag
    BIT $C4A0            ; 2C A0 C4 | Test bits in accumulator (absolute)
    BRA $C4              ; 80 C4 | Branch always
    PLP                  ; 28 | Pull processor status from stack
    BRA $30              ; 80 30 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_316
; Address: $DDEC95
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_316:
    JSR $5800            ; 20 00 58 | Jump to subroutine
    SEI                  ; 78 | Set interrupt disable flag
    SEC                  ; 38 | Set carry flag
    BNE $00              ; D0 00 | Branch if not equal
    BNE $40              ; D0 40 | Branch if not equal
    BMI $88              ; 30 88 | Branch if negative
    BEQ $60              ; F0 60 | Branch if equal

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_318
; Address: $DDECA8
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_318:
    CPX #$08             ; E0 08 | Compare X register (immediate)
    DEY                  ; 88 | Decrement Y register
    BPL $58              ; 10 58 | Branch if positive
    BPL $70              ; 10 70 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BCS $40              ; B0 40 | Branch if carry set
    BVS $00              ; 70 00 | Branch if overflow set
    CLC                  ; 18 | Clear carry flag
    BVS $70              ; 70 70 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    INX                  ; E8 | Increment X register
    BEQ $90              ; F0 90 | Branch if equal
    LDY #$00             ; A0 00 | Load immediate value into Y register
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $3010,X          ; 1E 10 30 | Arithmetic shift left (absolute,X)
    AND #$09             ; 29 09 | Logical AND with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($2D,X)          ; 01 2D | Logical OR with accumulator ((zero page,X))
    STZ $1B              ; 64 1B | Store zero to zero page
    EOR ($3E,X)          ; 41 3E | Exclusive OR with accumulator ((zero page,X))
    JMP $0033            ; 4C 33 00 | Jump to address
    BIT $1600            ; 2C 00 16 | Test bits in accumulator (absolute)
    ROL $0D              ; 26 0D | Rotate left (zero page)
    RTI                  ; 40 | Return from interrupt
    AND $3D50            ; 2D 50 3D | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_319
; Address: $DDECE6
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_319:
    JSL $14040B          ; 22 0B 04 14 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    EOR ($0E),Y          ; 51 0E | Exclusive OR with accumulator ((zero page),Y)
    BPL $00              ; 10 00 | Branch if positive
    BPL $04              ; 10 04 | Branch if positive
    SEC                  ; 38 | Set carry flag
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    LDA $BF0C,X          ; BD 0C BF | Read graphics status
    LDY $926F,X          ; BC 6F 92 | Load from absolute,X into Y register
    LDY $9607,X          ; BC 07 96 | Load from absolute,X into Y register
    PLP                  ; 28 | Pull processor status from stack
    ROR $1101            ; 6E 01 11 | Rotate right (absolute)
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    SBC $CF1F,Y          ; F9 1F CF | Subtract with carry (absolute,Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    DEY                  ; 88 | Decrement Y register
    STZ $B0              ; 64 B0 | Store zero to zero page
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDY $D044,X          ; BC 44 D0 | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_31B
; Address: $DDED2A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_31B:
    JSL $36481C          ; 22 1C 48 36 | Jump to subroutine long
    STA $7A              ; 85 7A | Update graphics data
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_31C
; Address: $DDED37
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_31C:
    JSL $1FCD1E          ; 22 1E CD 1F | Jump to subroutine long
    DEC $B617,X          ; DE 17 B6 | Decrement (absolute,X)
    DEC                  ; 3A | Decrement accumulator
    PLX                  ; FA | Pull X register from stack
    SED                  ; F8 | Set decimal mode flag
    LSR $F8              ; 46 F8 | Logical shift right (zero page)
    SEC                  ; 38 | Set carry flag
    SEP #$68             ; E2 68 | Set processor status bits
    BMI $C8              ; 30 C8 | Branch if negative
    BRA $58              ; 80 58 | Branch always
    BVS $B8              ; 70 B8 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_31D
; Address: $DDED50
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_31D:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    SBC $E104,Y          ; F9 04 E1 | Subtract with carry (absolute,Y)
    STA $FBFC,Y          ; 99 FC FB | Update graphics data
    SED                  ; F8 | Set decimal mode flag
    BRA $02              ; 80 02 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_31E
; Address: $DDED60
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_31E:
    ROL $0D              ; 26 0D | Rotate left (zero page)
    RTI                  ; 40 | Return from interrupt
    AND $3D50            ; 2D 50 3D | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_31F
; Address: $DDED66
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_31F:
    JSL $14040B          ; 22 0B 04 14 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    LDA ($6E),Y          ; B1 6E | Read graphics status
    BPL $00              ; 10 00 | Branch if positive
    BPL $04              ; 10 04 | Branch if positive
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    LDA $0F0C,X          ; BD 0C 0F | Read graphics status
    STZ $A26F            ; 9C 6F A2 | Store zero to absolute
    STZ $5607            ; 9C 07 56 | Store zero to absolute
    PHP                  ; 08 | Push processor status to stack
    ROL $1A01            ; 2E 01 1A | Rotate left (absolute)
    ASL $061D            ; 0E 1D 06 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_320
; Address: $DDED94
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_320:
    JSR $38C7            ; 20 C7 38 | Jump to subroutine
    CMP $DF3F,Y          ; D9 3F DF | Compare accumulator (absolute,Y)
    ORA ($40,X)          ; 01 40 | Logical OR with accumulator ((zero page,X))
    ASL $64              ; 06 64 | Arithmetic shift left (zero page)
    BCS $02              ; B0 02 | Branch if carry set
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_322
; Address: $DDEDA8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_322:
    JSR $2428            ; 20 28 24 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    LSR                  ; 4A | Logical shift right (accumulator)
    STX $78              ; 86 78 | Store X register to zero page
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_323
; Address: $DDEDB7
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_323:
    JSR $CA1C            ; 20 1C CA | Jump to subroutine
    ASL $17DD,X          ; 1E DD 17 | Arithmetic shift left (absolute,X)
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    EOR $F8              ; 45 F8 | Exclusive OR with accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    CPX $68              ; E4 68 | Compare X register (zero page)
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_324
; Address: $DDEDCB
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_324:
    JSR $10F8            ; 20 F8 10 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PLX                  ; FA | Pull X register from stack
    DEC                  ; 3A | Decrement accumulator
    SED                  ; F8 | Set decimal mode flag
    ASL $E5              ; 06 E5 | Arithmetic shift left (zero page)
    ASL $F89D,X          ; 1E 9D F8 | Arithmetic shift left (absolute,X)
    SBC ($50),Y          ; F1 50 | Subtract with carry ((zero page),Y)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    BPL $0B              ; 10 0B | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ORA $23              ; 05 23 | Logical OR with accumulator (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_325
; Address: $DDEDF4
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_325:
    JSR $0004            ; 20 04 00 | Jump to subroutine
    INC                  ; 1A | Increment accumulator
    ASL $DC01,X          ; 1E 01 DC | Arithmetic shift left (absolute,X)
    BNE $6F              ; D0 6F | Branch if not equal
    BRA $6F              ; 80 6F | Branch always
    SEC                  ; 38 | Set carry flag
    ASL $0F01,X          ; 1E 01 0F | Arithmetic shift left (absolute,X)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    BPL $0F              ; 10 0F | Branch if positive
    BPL $28              ; 10 28 | Branch if positive
    JMP ($44E8)          ; 6C E8 44 | Jump to address (absolute indirect)
    CPX #$0C             ; E0 0C | Compare X register (immediate)
    INY                  ; C8 | Increment Y register
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_327
; Address: $DDEE2B
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_327:
    CPX #$24             ; E0 24 | Compare X register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    BVC $20              ; 50 20 | Branch if overflow clear
    CPX #$78             ; E0 78 | Compare X register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    DEC $DC1C,X          ; DE 1C DC | Decrement (absolute,X)
    BPL $EF              ; 10 EF | Branch if positive
    CMP #$F6             ; C9 F6 | Compare accumulator (immediate)
    ASL $F8              ; 06 F8 | Arithmetic shift left (zero page)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPY $BC30            ; CC 30 BC | Compare Y register (absolute)
    BRA $E0              ; 80 E0 | Game work RAM access
    CPX $34EC            ; EC EC 34 | Compare X register (absolute)
    PEA #$F9F8           ; F4 F8 F9 | Push effective address to stack
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt
    BPL $0B              ; 10 0B | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ORA $23              ; 05 23 | Logical OR with accumulator (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_328
; Address: $DDEE74
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_328:
    JSR $0004            ; 20 04 00 | Jump to subroutine
    INC                  ; 1A | Increment accumulator
    ASL $1C01,X          ; 1E 01 1C | Arithmetic shift left (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_32A
; Address: $DDEE85
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_32A:
    JSR $0738            ; 20 38 07 | Jump to subroutine
    BPL $21              ; 10 21 | PPU graphics register access
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $0300            ; 0E 00 03 | Arithmetic shift left (absolute)
    BPL $0F              ; 10 0F | Branch if positive
    BPL $08              ; 10 08 | Branch if positive
    ORA #$04             ; 09 04 | Logical OR with accumulator (immediate)
    JMP ($44E8)          ; 6C E8 44 | Jump to address (absolute indirect)
    CPX #$0C             ; E0 0C | Compare X register (immediate)
    INY                  ; C8 | Increment Y register
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_32D
; Address: $DDEEB1
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_32D:
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    BVC $20              ; 50 20 | Branch if overflow clear
    CPX #$7C             ; E0 7C | Compare X register (immediate)
    INC $DCDC,X          ; FE DC DC | Increment (absolute,X)
    ORA $C6E6,Y          ; 19 E6 C6 | Logical OR with accumulator (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    CPX $F8              ; E4 F8 | Compare X register (zero page)
    SED                  ; F8 | Set decimal mode flag
    PEA #$5408           ; F4 08 54 | Push effective address to stack
    BCS $F8              ; B0 F8 | Branch if carry set
    CPX $E4              ; E4 E4 | Compare X register (zero page)
    SEC                  ; 38 | Set carry flag
    SBC $E7E4,Y          ; F9 E4 E7 | Subtract with carry (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    DEY                  ; 88 | Decrement Y register
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $0D              ; 10 0D | Branch if positive
    BIT $2810            ; 2C 10 28 | Test bits in accumulator (absolute)
    BVC $08              ; 50 08 | Branch if overflow clear
    EOR #$05             ; 49 05 | Exclusive OR with accumulator (immediate)
    ORA ($30,X)          ; 01 30 | Logical OR with accumulator ((zero page,X))
    ORA $20              ; 05 20 | Logical OR with accumulator (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_330
; Address: $DDEF03
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_330:
    BPL $BC              ; 10 BC | Branch if positive
    BIT $DE              ; 24 DE | Test bits in accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    BIT $0008            ; 2C 08 00 | Test bits in accumulator (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_331
; Address: $DDEF16
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_331:
    CLI                  ; 58 | Clear interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_332
; Address: $DDEF21
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_332:
    BRA $50              ; 80 50 | Branch always
    LDY #$08             ; A0 08 | Load immediate value into Y register
    BEQ $F0              ; F0 F0 | Branch if equal
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BCC $96              ; 90 96 | Branch if carry clear
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $0C              ; 80 0C | Branch always

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_333
; Address: $DDEF33
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_333:
    LDY #$04             ; A0 04 | Load immediate value into Y register
    BEQ $06              ; F0 06 | Branch if equal
    SEC                  ; 38 | Set carry flag
    REP #$08             ; C2 08 | Reset processor status bits
    RTI                  ; 40 | Return from interrupt
    TAY                  ; A8 | Transfer accumulator to Y register
    BCS $08              ; B0 08 | Branch if carry set
    CPX #$EC             ; E0 EC | Compare X register (immediate)
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    AND $7B24,X          ; 3D 24 7B | Logical AND with accumulator (absolute,X)
    PHX                  ; DA | Push X register to stack
    INC $E0              ; E6 E0 | Game work RAM access
    CLC                  ; 18 | Clear carry flag
    BMI $CC              ; 30 CC | Branch if negative
    SEP #$1C             ; E2 1C | Set processor status bits
    BPL $00              ; 10 00 | Branch if positive
    BEQ $00              ; F0 00 | Branch if equal
    CPY $06              ; C4 06 | Compare Y register (zero page)
    INC                  ; 1A | Increment accumulator
    ASL $F8E0,X          ; 1E E0 F8 | Arithmetic shift left (absolute,X)
    ASL $EEF8,X          ; 1E F8 EE | Arithmetic shift left (absolute,X)
    CPX $DCDC            ; EC DC DC | Compare X register (absolute)
    ORA ($2B,X)          ; 01 2B | Logical OR with accumulator ((zero page,X))
    ASL $2A              ; 06 2A | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_334
; Address: $DDEF6E
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_334:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ORA $0800            ; 0D 00 08 | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    BPL $06              ; 10 06 | Branch if positive
    ORA ($04),Y          ; 11 04 | Logical OR with accumulator ((zero page),Y)
    ORA $2502,X          ; 1D 02 25 | Logical OR with accumulator (absolute,X)
    ORA $041D,Y          ; 19 1D 04 | Logical OR with accumulator (absolute,Y)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA $0000            ; 0D 00 00 | Logical OR with accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    BVC $00              ; 50 00 | Branch if overflow clear
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    EOR ($C0,X)          ; 41 C0 | Exclusive OR with accumulator ((zero page,X))
    STA ($00,X)          ; 81 00 | Update graphics data
    ORA #$08             ; 09 08 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    BEQ $04              ; F0 04 | Branch if equal
    BRA $2C              ; 80 2C | Branch always
    JMP ($FC00)          ; 6C 00 FC | Jump to address (absolute indirect)
    ROL $7EC0,X          ; 3E C0 7E | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_335
; Address: $DDEFBE
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_335:
    PEA #$0600           ; F4 00 06 | Push effective address to stack
    PLA                  ; 68 | Pull accumulator from stack
    SED                  ; F8 | Set decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    DEY                  ; 88 | Decrement Y register
    BEQ $B0              ; F0 B0 | Branch if equal
    RTI                  ; 40 | Return from interrupt
    BCS $E0              ; B0 E0 | Game work RAM access
    CLC                  ; 18 | Clear carry flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    INY                  ; C8 | Increment Y register
    BEQ $3C              ; F0 3C | Branch if equal
    SEC                  ; 38 | Set carry flag
    ORA $2502,X          ; 1D 02 25 | Logical OR with accumulator (absolute,X)
    ORA $041D,Y          ; 19 1D 04 | Logical OR with accumulator (absolute,Y)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    INC                  ; 1A | Increment accumulator
    ORA $0D              ; 05 0D | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $1C              ; 06 1C | Arithmetic shift left (zero page)
    PLA                  ; 68 | Pull accumulator from stack
    SED                  ; F8 | Set decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    DEY                  ; 88 | Decrement Y register
    BEQ $B0              ; F0 B0 | Branch if equal
    RTI                  ; 40 | Return from interrupt
    BCS $A0              ; B0 A0 | Branch if carry set
    CLI                  ; 58 | Clear interrupt disable flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    INY                  ; C8 | Increment Y register
    BEQ $7C              ; F0 7C | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $0D              ; 10 0D | Branch if positive
    SEC                  ; 38 | Set carry flag
    BPL $51              ; 10 51 | Branch if positive

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_336
; Address: $DDF02D
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_336:
    ORA ($40,X)          ; 01 40 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    ORA ($30,X)          ; 01 30 | Logical OR with accumulator ((zero page,X))
    ORA $60              ; 05 60 | Logical OR with accumulator (zero page)
    BPL $2E              ; 10 2E | Branch if positive
    ROL $3000,X          ; 3E 00 30 | Rotate left (absolute,X)
    ROR                  ; 6A | Rotate right (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    CLD                  ; D8 | Clear decimal mode flag
    LSR $0364            ; 4E 64 03 | Logical shift right (absolute)
    ORA $18              ; 05 18 | Logical OR with accumulator (zero page)
    EOR $31CE            ; 4D CE 31 | Exclusive OR with accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ADC ($08,X)          ; 61 08 | Add with carry ((zero page,X))
    BPL $7E              ; 10 7E | Branch if positive
    INC $776F            ; EE 6F 77 | Increment (absolute)
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_337
; Address: $DDF064
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_337:
    BVC $A0              ; 50 A0 | Branch if overflow clear
    PHP                  ; 08 | Push processor status to stack
    BEQ $30              ; F0 30 | Branch if equal
    SEC                  ; 38 | Set carry flag
    ASL $8A08,X          ; 1E 08 8A | Arithmetic shift left (absolute,X)
    BRA $06              ; 80 06 | Branch always
    BRA $60              ; 80 60 | Branch always
    BRA $0C              ; 80 0C | Branch always
    LDY #$06             ; A0 06 | Load immediate value into Y register
    BEQ $C6              ; F0 C6 | Branch if equal
    SEC                  ; 38 | Set carry flag
    CPX #$08             ; E0 08 | Compare X register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    CPY #$56             ; C0 56 | Compare Y register (immediate)
    TAY                  ; A8 | Transfer accumulator to Y register
    SED                  ; F8 | Set decimal mode flag
    ROL $C0              ; 26 C0 | Rotate left (zero page)
    LDY #$18             ; A0 18 | Load immediate value into Y register
    PHA                  ; 48 | Push accumulator to stack
    PLY                  ; 7A | Pull Y register from stack
    STY $30              ; 84 30 | Store Y register to zero page
    RTI                  ; 40 | Return from interrupt
    ASL $10              ; 06 10 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    PEA #$ECEC           ; F4 EC EC | Push effective address to stack
    BMI $03              ; 30 03 | Branch if negative
    ROR                  ; 6A | Rotate right (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_338
; Address: $DDF0A7
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_338:
    LSR $0364            ; 4E 64 03 | Logical shift right (absolute)
    ORA $18              ; 05 18 | Logical OR with accumulator (zero page)
    AND $215E            ; 2D 5E 21 | PPU graphics register access
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ADC ($08,X)          ; 61 08 | Add with carry ((zero page,X))
    BPL $3E              ; 10 3E | Branch if positive
    ROR $372F            ; 6E 2F 37 | Rotate right (absolute)
    CPY #$56             ; C0 56 | Compare Y register (immediate)
    TAY                  ; A8 | Transfer accumulator to Y register
    SED                  ; F8 | Set decimal mode flag
    ROL $C0              ; 26 C0 | Rotate left (zero page)
    LDY #$18             ; A0 18 | Load immediate value into Y register
    JMP $73B2            ; 4C B2 73 | Jump to address
    STY $0030            ; 8C 30 00 | Store Y register to absolute address
    RTI                  ; 40 | Return from interrupt
    ASL $10              ; 06 10 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ROR $7738,X          ; 7E 38 77 | Rotate right (absolute,X)
    INC $00EE            ; EE EE 00 | Increment (absolute)
    AND ($3B,X)          ; 21 3B | Logical AND with accumulator ((zero page,X))
    BIT $1B              ; 24 1B | Test bits in accumulator (zero page)
    EOR #$36             ; 49 36 | Exclusive OR with accumulator (immediate)
    BMI $0F              ; 30 0F | Branch if negative
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ASL $030F            ; 0E 0F 03 | Arithmetic shift left (absolute)
    RTI                  ; 40 | Return from interrupt
    BVC $1D              ; 50 1D | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_339
; Address: $DDF110
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_339:
    JSR $001F            ; 20 1F 00 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $0B              ; 10 0B | Branch if positive

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_33A
; Address: $DDF120
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_33A:
    JSR $3006            ; 20 06 30 | Jump to subroutine
    PLP                  ; 28 | Pull processor status from stack
    LSR                  ; 4A | Logical shift right (accumulator)
    EOR ($7F),Y          ; 51 7F | Exclusive OR with accumulator ((zero page),Y)
    LDA ($7F),Y          ; B1 7F | Read graphics status
    LDY #$7F             ; A0 7F | Load immediate value into Y register
    ROL $013F,X          ; 3E 3F 01 | Rotate left (absolute,X)
    ASL $2701,X          ; 1E 01 27 | Arithmetic shift left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    STZ $1B              ; 64 1B | Store zero to zero page
    ROR $4E11            ; 6E 11 4E | Rotate right (absolute)
    AND ($1C),Y          ; 31 1C | Logical AND with accumulator ((zero page),Y)
    ROL $0101,X          ; 3E 01 01 | Rotate left (absolute,X)
    CPY #$D0             ; C0 D0 | Compare Y register (immediate)
    BNE $D8              ; D0 D8 | Branch if not equal
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_33B
; Address: $DDF147
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_33B:
    JMP ($7060)          ; 6C 60 70 | Jump to address (absolute indirect)
    CPX $FC              ; E4 FC | Compare X register (zero page)
    CPY $EC              ; C4 EC | Compare Y register (zero page)
    STY $DC              ; 84 DC | Store Y register to zero page
    CLD                  ; D8 | Clear decimal mode flag
    BIT $D8              ; 24 D8 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_33C
; Address: $DDF154
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_33C:
    JSL $6C92DC          ; 22 DC 92 6C | Jump to subroutine long
    STY $0270            ; 8C 70 02 | Store Y register to absolute address
    TYA                  ; 98 | Transfer Y register to accumulator
    SED                  ; F8 | Set decimal mode flag
    PEA #$ECF8           ; F4 F8 EC | Push effective address to stack
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$70             ; E0 70 | Compare X register (immediate)
    BEQ $C0              ; F0 C0 | Branch if equal
    BEQ $02              ; F0 02 | Branch if equal
    BEQ $1A              ; F0 1A | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $10              ; F0 10 | Branch if equal
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPY #$38             ; C0 38 | Compare Y register (immediate)
    PEA #$D008           ; F4 08 D0 | Push effective address to stack
    BIT $CE38            ; 2C 38 CE | Test bits in accumulator (absolute)
    STZ $0A              ; 64 0A | Store zero to zero page
    PLY                  ; 7A | Pull Y register from stack
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    EOR $FE              ; 45 FE | Exclusive OR with accumulator (zero page)
    SEP #$3C             ; E2 3C | Set processor status bits
    BRA $E0              ; 80 E0 | Game work RAM access
    BPL $22              ; 10 22 | Branch if positive
    CLD                  ; D8 | Clear decimal mode flag
    DEY                  ; 88 | Decrement Y register
    STY $C638            ; 8C 38 C6 | Store Y register to absolute address
    CPX #$13             ; E0 13 | Compare X register (immediate)
    ASL $030F            ; 0E 0F 03 | Arithmetic shift left (absolute)
    RTI                  ; 40 | Return from interrupt
    CLI                  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_33D
; Address: $DDF1B0
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_33D:
    JSR $001F            ; 20 1F 00 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $0B              ; 10 0B | Branch if positive
    TYA                  ; 98 | Transfer Y register to accumulator
    SED                  ; F8 | Set decimal mode flag
    PEA #$ECF8           ; F4 F8 EC | Push effective address to stack
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$70             ; E0 70 | Compare X register (immediate)
    BEQ $C0              ; F0 C0 | Branch if equal

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_33E
; Address: $DDF1CB
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_33E:
    BEQ $02              ; F0 02 | Branch if equal
    BEQ $0A              ; F0 0A | Branch if equal
    CLV                  ; B8 | Clear overflow flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $10              ; F0 10 | Branch if equal
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPY #$38             ; C0 38 | Compare Y register (immediate)
    PEA #$D008           ; F4 08 D0 | Push effective address to stack
    BIT $CC38            ; 2C 38 CC | Test bits in accumulator (absolute)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ASL $17              ; 06 17 | Arithmetic shift left (zero page)
    ORA $130F            ; 0D 0F 13 | Logical OR with accumulator (absolute)
    BPL $1A              ; 10 1A | Branch if positive
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ASL $0D00            ; 0E 00 0D | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_340
; Address: $DDF1FC
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_340:
    JSR $001F            ; 20 1F 00 | Jump to subroutine
    ROL $1D1D,X          ; 3E 1D 1D | Rotate left (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $0D0B,Y          ; 19 0B 0D | Logical OR with accumulator (absolute,Y)
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    ORA $0800,X          ; 1D 00 08 | Logical OR with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    ASL $1F0A            ; 0E 0A 1F | Arithmetic shift left (absolute)
    ORA ($21),Y          ; 11 21 | PPU graphics register access
    ROL $3F22,X          ; 3E 22 3F | Rotate left (absolute,X)
    RTI                  ; 40 | Return from interrupt
    CMP ($7F,X)          ; C1 7F | Compare accumulator ((zero page,X))
    ROR $0A00,X          ; 7E 00 0A | Rotate right (absolute,X)
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND $1B12            ; 2D 12 1B | Logical AND with accumulator (absolute)
    BIT $32              ; 24 32 | Test bits in accumulator (zero page)
    ORA $7F00            ; 0D 00 7F | Logical OR with accumulator (absolute)
    CPY #$E0             ; C0 E0 | Game work RAM access
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_341
; Address: $DDF245
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_341:
    SEI                  ; 78 | Set interrupt disable flag
    BVS $74              ; 70 74 | Branch if overflow set
    BEQ $F4              ; F0 F4 | Branch if equal
    ROL $EE              ; 26 EE | Rotate left (zero page)
    ROL $6E7E,X          ; 3E 7E 6E | Rotate left (absolute,X)
    INC $00E0,X          ; FE E0 00 | Increment (absolute,X)
    CLC                  ; 18 | Clear carry flag
    CPX #$84             ; E0 84 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_342
; Address: $DDF255
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_342:
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($EE,X)          ; 01 EE | Logical OR with accumulator ((zero page,X))
    ORA ($C6,X)          ; 01 C6 | Logical OR with accumulator ((zero page,X))
    CPX $FC              ; E4 FC | Compare X register (zero page)
    BNE $E8              ; D0 E8 | Branch if not equal
    SED                  ; F8 | Set decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    DEY                  ; 88 | Decrement Y register
    BEQ $10              ; F0 10 | Branch if equal
    BNE $30              ; D0 30 | Branch if not equal
    PLA                  ; 68 | Pull accumulator from stack
    CLC                  ; 18 | Clear carry flag
    CPY $04              ; C4 04 | Compare Y register (zero page)
    BRA $10              ; 80 10 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BVC $00              ; 50 00 | Branch if overflow clear
    SEC                  ; 38 | Set carry flag
    BRA $78              ; 80 78 | Branch always
    PHA                  ; 48 | Push accumulator to stack
    BCC $E0              ; 90 E0 | Game work RAM access
    TAY                  ; A8 | Transfer accumulator to Y register
    CLI                  ; 58 | Clear interrupt disable flag
    PHA                  ; 48 | Push accumulator to stack
    BCS $04              ; B0 04 | Branch if carry set
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPY $7830            ; CC 30 78 | Compare Y register (absolute)
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    BPL $A0              ; 10 A0 | Branch if positive
    BPL $A8              ; 10 A8 | Branch if positive
    CLI                  ; 58 | Clear interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    BMI $30              ; 30 30 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    CPY #$3E             ; C0 3E | Compare Y register (immediate)
    ORA $0A1D,X          ; 1D 1D 0A | Logical OR with accumulator (absolute,X)
    ORA $0D0B,Y          ; 19 0B 0D | Logical OR with accumulator (absolute,Y)
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ORA $0808            ; 0D 08 08 | Logical OR with accumulator (absolute)
    ORA $0800,X          ; 1D 00 08 | Logical OR with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_345
; Address: $DDF2D2
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_345:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    AND $2912            ; 2D 12 29 | Logical AND with accumulator (absolute)
    CPX $FC              ; E4 FC | Compare X register (zero page)
    BNE $E8              ; D0 E8 | Branch if not equal
    SED                  ; F8 | Set decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    DEY                  ; 88 | Decrement Y register
    BEQ $10              ; F0 10 | Branch if equal
    BVC $B0              ; 50 B0 | Branch if overflow clear
    TAY                  ; A8 | Transfer accumulator to Y register
    CLI                  ; 58 | Clear interrupt disable flag
    CPY $04              ; C4 04 | Compare Y register (zero page)
    BRA $10              ; 80 10 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BNE $00              ; D0 00 | Branch if not equal
    SEI                  ; 78 | Set interrupt disable flag
    TAY                  ; A8 | Transfer accumulator to Y register
    BIT $C8              ; 24 C8 | Test bits in accumulator (zero page)
    JMP $88B0            ; 4C B0 88 | Jump to address
    BVS $04              ; 70 04 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    BIT $F8              ; 24 F8 | Test bits in accumulator (zero page)
    PEA #$9888           ; F4 88 98 | Push effective address to stack
    BPL $38              ; 10 38 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_346
; Address: $DDF314
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_346:
    JSR $6010            ; 20 10 60 | Jump to subroutine
    BPL $48              ; 10 48 | Branch if positive
    CLV                  ; B8 | Clear overflow flag
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    BPL $F0              ; 10 F0 | Branch if positive
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    ORA #$21             ; 09 21 | PPU graphics register access
    INC                  ; 1A | Increment accumulator
    ORA ($25,X)          ; 01 25 | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    PHA                  ; 48 | Push accumulator to stack
    BMI $0F              ; 30 0F | Branch if negative
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ROL $3C40,X          ; 3E 40 3C | Rotate left (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_347
; Address: $DDF343
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_347:
    ORA $1F2A,X          ; 1D 2A 1F | Logical OR with accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag
    ASL $0B0C            ; 0E 0C 0B | Arithmetic shift left (absolute)
    ORA $0C              ; 05 0C | Logical OR with accumulator (zero page)
    WDM #$0F             ; 42 0F | Reserved instruction
    LSR $2019,X          ; 5E 19 20 | Logical shift right (absolute,X)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))
    ROL                  ; 2A | Rotate left (accumulator)
    BPL $0C              ; 10 0C | Branch if positive
    BMI $1F              ; 30 1F | Branch if negative
    BVS $37              ; 70 37 | Branch if overflow set
    AND $374B            ; 2D 4B 37 | Logical AND with accumulator (absolute)
    BVC $6F              ; 50 6F | Branch if overflow clear
    LDY #$DF             ; A0 DF | Load immediate value into Y register
    BRA $FF              ; 80 FF | Branch always
    BCS $7F              ; B0 7F | Branch if carry set
    EOR $D503            ; 4D 03 D5 | Exclusive OR with accumulator (absolute)
    SBC $0913            ; ED 13 09 | Subtract with carry (absolute)
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    BVC $50              ; 50 50 | Branch if overflow clear
    CLI                  ; 58 | Clear interrupt disable flag
    INX                  ; E8 | Increment X register
    CPX $F090            ; EC 90 F0 | Compare X register (absolute)
    CPY $CC              ; C4 CC | Compare Y register (zero page)
    JMP ($58FC)          ; 6C FC 58 | Jump to address (absolute indirect)
    BRA $A4              ; 80 A4 | Branch always
    CLI                  ; 58 | Clear interrupt disable flag
    LDX #$5C             ; A2 5C | Load immediate value into X register
    CPX $F00C            ; EC 0C F0 | Compare X register (absolute)
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    BEQ $30              ; F0 30 | Branch if equal
    BNE $A0              ; D0 A0 | Branch if not equal
    BMI $42              ; 30 42 | Hardware register operation
    BEQ $7A              ; F0 7A | Branch if equal
    TYA                  ; 98 | Transfer Y register to accumulator
    CLC                  ; 18 | Clear carry flag
    BPL $40              ; 10 40 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    BMI $0C              ; 30 0C | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    PEA #$CC90           ; F4 90 CC | Push effective address to stack
    CLV                  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_348
; Address: $DDF3C4
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_348:
    ROL                  ; 2A | Rotate left (accumulator)
    INC                  ; 1A | Increment accumulator
    INC $7E89            ; EE 89 7E | Increment (absolute)
    STA $7E              ; 85 7E | Update graphics data
    REP #$3C             ; C2 3C | Reset processor status bits
    BRA $C0              ; 80 C0 | Branch always
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    STX $C0              ; 86 C0 | Store X register to zero page
    LDX $C8              ; A6 C8 | Load from zero page into X register
    CPY $E6D8            ; CC D8 E6 | Compare Y register (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_349
; Address: $DDF3DE
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_349:
    BRA $80              ; 80 80 | Branch always
    ROL                  ; 2A | Rotate left (accumulator)
    ORA $1F2A,X          ; 1D 2A 1F | Logical OR with accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag
    ASL $0B0C            ; 0E 0C 0B | Arithmetic shift left (absolute)
    ORA $0C              ; 05 0C | Logical OR with accumulator (zero page)
    WDM #$0F             ; 42 0F | Reserved instruction
    LSR $2019,X          ; 5E 19 20 | Logical shift right (absolute,X)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))
    ROL                  ; 2A | Rotate left (accumulator)
    BPL $0C              ; 10 0C | Branch if positive
    BMI $1F              ; 30 1F | Branch if negative
    BMI $38              ; 30 38 | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    BEQ $30              ; F0 30 | Branch if equal
    BNE $A0              ; D0 A0 | Branch if not equal
    BMI $42              ; 30 42 | Hardware register operation
    BEQ $7A              ; F0 7A | Branch if equal
    TYA                  ; 98 | Transfer Y register to accumulator
    CLC                  ; 18 | Clear carry flag
    BPL $40              ; 10 40 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    BMI $0C              ; 30 0C | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $1F              ; 05 1F | Logical OR with accumulator (zero page)
    ORA $1602            ; 0D 02 16 | Logical OR with accumulator (absolute)
    ORA #$28             ; 09 28 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_34A
; Address: $DDF43A
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_34A:
    JSR $401F            ; 20 1F 40 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_34B
; Address: $DDF441
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_34B:
    SEC                  ; 38 | Set carry flag
    BVS $3E              ; 70 3E | Branch if overflow set
    STY $C55F            ; 8C 5F C5 | Store Y register to absolute address
    TYA                  ; 98 | Transfer Y register to accumulator
    TXA                  ; 8A | Transfer X register to accumulator
    BVS $36              ; 70 36 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_34C
; Address: $DDF454
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_34C:
    JSR $205F            ; 20 5F 20 | Jump to subroutine
    STZ $1B              ; 64 1B | Store zero to zero page
    BIT $5B              ; 24 5B | Test bits in accumulator (zero page)
    BIT $5B              ; 24 5B | Test bits in accumulator (zero page)
    ORA #$36             ; 09 36 | Logical OR with accumulator (immediate)
    ROL $06              ; 26 06 | Rotate left (zero page)
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    TYA                  ; 98 | Transfer Y register to accumulator
    CLC                  ; 18 | Clear carry flag
    CPY $44              ; C4 44 | Compare Y register (zero page)
    ORA #$36             ; 09 36 | Logical OR with accumulator (immediate)
    ORA $0E06,Y          ; 19 06 0E | Logical OR with accumulator (absolute,Y)
    ADC $FF18,Y          ; 79 18 FF | Add with carry (absolute,Y)
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $C0              ; F0 C0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    LDY #$F8             ; A0 F8 | Load immediate value into Y register
    BRA $EC              ; 80 EC | Branch always
    CPY $0000            ; CC 00 00 | Compare Y register (absolute)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BCS $40              ; B0 40 | Branch if carry set
    PLA                  ; 68 | Pull accumulator from stack
    BCC $14              ; 90 14 | Branch if carry clear
    INX                  ; E8 | Increment X register
    SED                  ; F8 | Set decimal mode flag
    ASL $FC              ; 06 FC | Arithmetic shift left (zero page)
    ASL $B13C            ; 0E 3C B1 | Arithmetic shift left (absolute)
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    ROR                  ; 6A | Rotate right (accumulator)
    ADC #$6C             ; 69 6C | Add with carry (immediate)
    AND ($74,X)          ; 21 74 | Logical AND with accumulator ((zero page,X))
    PHX                  ; DA | Push X register to stack
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    ROR                  ; 6A | Rotate right (accumulator)
    JMP ($748A)          ; 6C 8A 74 | Jump to address (absolute indirect)
    BIT $DA              ; 24 DA | Test bits in accumulator (zero page)
    CMP $46DA,Y          ; D9 DA 46 | Compare accumulator (absolute,Y)
    CPY #$16             ; C0 16 | Compare Y register (immediate)
    BPL $1B              ; 10 1B | Branch if positive
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_34D
; Address: $DDF4C8
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_34D:
    EOR #$48             ; 49 48 | Exclusive OR with accumulator (immediate)
    STZ $B4              ; 64 B4 | Store zero to zero page
    BMI $F8              ; 30 F8 | Branch if negative
    BRA $24              ; 80 24 | Branch always
    PHX                  ; DA | Push X register to stack
    SEC                  ; 38 | Set carry flag
    CPY #$D0             ; C0 D0 | Compare Y register (immediate)
    DEC                  ; 3A | Decrement accumulator
    CLC                  ; 18 | Clear carry flag
    PHA                  ; 48 | Push accumulator to stack
    STZ $FD              ; 64 FD | Store zero to zero page
    BMI $78              ; 30 78 | Branch if negative
    BRA $80              ; 80 80 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_34E
; Address: $DDF4E1
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_34E:
    SEC                  ; 38 | Set carry flag
    BVS $3E              ; 70 3E | Branch if overflow set
    STA $C95F            ; 8D 5F C9 | Update graphics data
    BNE $56              ; D0 56 | Branch if not equal
    STY $2E              ; 84 2E | Store Y register to zero page
    BNE $5B              ; D0 5B | Branch if not equal

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_34F
; Address: $DDF4F4
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_34F:
    JSR $205F            ; 20 5F 20 | Jump to subroutine
    AND #$56             ; 29 56 | Logical AND with accumulator (immediate)
    EOR #$36             ; 49 36 | Exclusive OR with accumulator (immediate)
    EOR ($2E),Y          ; 51 2E | Exclusive OR with accumulator ((zero page),Y)
    BIT $5B              ; 24 5B | Test bits in accumulator (zero page)
    ASL $FC              ; 06 FC | Arithmetic shift left (zero page)
    ASL $313C            ; 0E 3C 31 | Arithmetic shift left (absolute)
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    ORA $51D8,Y          ; 19 D8 51 | Logical OR with accumulator (absolute,Y)
    PHX                  ; DA | Push X register to stack
    PHX                  ; DA | Push X register to stack
    ASL $006C            ; 0E 6C 00 | Arithmetic shift left (absolute)
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    ROL $D8              ; 26 D8 | Rotate left (zero page)
    BIT $DA              ; 24 DA | Test bits in accumulator (zero page)
    BIT $DA              ; 24 DA | Test bits in accumulator (zero page)
    BCC $6C              ; 90 6C | Branch if carry clear
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $0F00            ; 0D 00 0F | Logical OR with accumulator (absolute)
    ORA ($23,X)          ; 01 23 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_350
; Address: $DDF52E
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_350:
    JSL $00003F          ; 22 3F 00 00 | Jump to subroutine long
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $1201            ; 0E 01 12 | Arithmetic shift left (absolute)
    ORA $1F20            ; 0D 20 1F | Logical OR with accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    EOR ($3E,X)          ; 41 3E | Exclusive OR with accumulator ((zero page,X))
    EOR ($3E,X)          ; 41 3E | Exclusive OR with accumulator ((zero page,X))
    JMP $187A48          ; 5C 48 7A 18 | Jump to address long

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_351
; Address: $DDF546
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_351:
    JSR $6029            ; 20 29 60 | Jump to subroutine
    ROR                  ; 6A | Rotate right (accumulator)
    DEY                  ; 88 | Decrement Y register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_352
; Address: $DDF54C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_352:
    DEY                  ; 88 | Decrement Y register
    PHY                  ; 5A | Push Y register to stack
    CPY #$54             ; C0 54 | Compare Y register (immediate)
    JMP $C47A85          ; 5C 85 7A C4 | Jump to address long
    AND #$95             ; 29 95 | Logical AND with accumulator (immediate)
    ROR                  ; 6A | Rotate right (accumulator)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_353
; Address: $DDF55C
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_353:
    AND $5A              ; 25 5A | Logical AND with accumulator (zero page)
    ROL                  ; 2A | Rotate left (accumulator)
    BNE $54              ; D0 54 | Branch if not equal
    EOR ($10),Y          ; 51 10 | Exclusive OR with accumulator ((zero page),Y)
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    DEY                  ; 88 | Decrement Y register
    PHB                  ; 8B | Push data bank register to stack
    CMP $7F5A,Y          ; D9 5A 7F | Compare accumulator (absolute,Y)
    ORA ($2A,X)          ; 01 2A | Logical OR with accumulator ((zero page,X))
    ROL $1710            ; 2E 10 17 | Rotate left (absolute)
    AND $3D07            ; 2D 07 3D | Logical AND with accumulator (absolute)
    ADC $FB8F,X          ; 7D 8F FB | Add with carry (absolute,X)
    LSR $017A,X          ; 5E 7A 01 | Logical shift right (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    CLV                  ; B8 | Clear overflow flag
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    STY $CC              ; 84 CC | Store Y register to zero page
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SEC                  ; 38 | Set carry flag
    CPY #$58             ; C0 58 | Compare Y register (immediate)
    LDY #$FC             ; A0 FC | Load immediate value into Y register
    CPY $38              ; C4 38 | Compare Y register (zero page)
    STY $78              ; 84 78 | Store Y register to zero page
    STY $BCFC            ; 8C FC BC | Store Y register to absolute address
    BVC $68              ; 50 68 | Branch if overflow clear
    SEI                  ; 78 | Set interrupt disable flag
    STY $D8              ; 84 D8 | Store Y register to zero page
    PHA                  ; 48 | Push accumulator to stack
    BVS $10              ; 70 10 | Branch if overflow set
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    STY $40              ; 84 40 | Store Y register to zero page
    BCC $00              ; 90 00 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_354
; Address: $DDF5B9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_354:
    JSR $0080            ; 20 80 00 | Jump to subroutine
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $10              ; F0 10 | Branch if equal

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_355
; Address: $DDF5C1
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_355:
    JSR $C824            ; 20 24 C8 | Jump to subroutine
    LDY $48              ; A4 48 | Load from zero page into Y register
    INX                  ; E8 | Increment X register
    BPL $F0              ; 10 F0 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    CPY #$7C             ; C0 7C | Compare Y register (immediate)
    CPY #$38             ; C0 38 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_356
; Address: $DDF5CF
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_356:
    JSR $B078            ; 20 78 B0 | Jump to subroutine
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BCS $B0              ; B0 B0 | Branch if carry set
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_358
; Address: $DDF5E6
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_358:
    JSR $6029            ; 20 29 60 | Jump to subroutine
    ROR                  ; 6A | Rotate right (accumulator)
    DEY                  ; 88 | Decrement Y register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_359
; Address: $DDF5EC
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_359:
    DEY                  ; 88 | Decrement Y register
    EOR $5AC0,Y          ; 59 C0 5A | Exclusive OR with accumulator (absolute,Y)
    JMP $C47A85          ; 5C 85 7A C4 | Jump to address long
    AND #$95             ; 29 95 | Logical AND with accumulator (immediate)
    ROR                  ; 6A | Rotate right (accumulator)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_35A
; Address: $DDF5FC
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_35A:
    ROL $59              ; 26 59 | Rotate left (zero page)
    AND $5A              ; 25 5A | Logical AND with accumulator (zero page)
    CLD                  ; D8 | Clear decimal mode flag
    PHY                  ; 5A | Push Y register to stack
    ORA $0C              ; 05 0C | Logical OR with accumulator (zero page)
    ORA $0A09            ; 0D 09 0A | Logical OR with accumulator (absolute)
    BPL $13              ; 10 13 | Branch if positive
    DEC $43              ; C6 43 | Decrement (zero page)
    AND $5A              ; 25 5A | Logical AND with accumulator (zero page)
    AND $3D0F            ; 2D 0F 3D | Logical AND with accumulator (absolute)
    PHA                  ; 48 | Push accumulator to stack
    BVS $04              ; 70 04 | Branch if overflow set
    STY $BCFC            ; 8C FC BC | Store Y register to absolute address
    BVC $68              ; 50 68 | Branch if overflow clear
    SEI                  ; 78 | Set interrupt disable flag
    STY $D8              ; 84 D8 | Store Y register to zero page
    PHA                  ; 48 | Push accumulator to stack
    BVS $10              ; 70 10 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_35B
; Address: $DDF62D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_35B:
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    STY $40              ; 84 40 | Store Y register to zero page
    BCC $00              ; 90 00 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_35C
; Address: $DDF639
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_35C:
    JSR $0080            ; 20 80 00 | Jump to subroutine
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    SEC                  ; 38 | Set carry flag
    BNE $10              ; D0 10 | Branch if not equal
    BPL $60              ; 10 60 | Branch if positive
    BNE $20              ; D0 20 | Branch if not equal
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPX #$18             ; E0 18 | Compare X register (immediate)
    BVS $88              ; 70 88 | Branch if overflow set
    CLV                  ; B8 | Clear overflow flag
    RTI                  ; 40 | Return from interrupt
    BEQ $80              ; F0 80 | Branch if equal
    SEC                  ; 38 | Set carry flag
    BNE $80              ; D0 80 | Branch if not equal
    BRA $80              ; 80 80 | Branch always
    CLD                  ; D8 | Clear decimal mode flag
    BNE $FC              ; D0 FC | Branch if not equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BVS $70              ; 70 70 | Branch if overflow set
    BRA $80              ; 80 80 | Branch always
    ORA $1502            ; 0D 02 15 | Logical OR with accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $2C              ; 10 2C | Branch if positive
    CLI                  ; 58 | Clear interrupt disable flag
    BVS $0F              ; 70 0F | Branch if overflow set
    EOR ($2F,X)          ; 41 2F | Exclusive OR with accumulator ((zero page,X))
    DEX                  ; CA | Decrement X register
    DEY                  ; 88 | Decrement Y register
    STY $5B              ; 84 5B | Store Y register to zero page
    REP #$4A             ; C2 4A | Reset processor status bits
    WDM #$31             ; 42 31 | Reserved instruction
    BPL $2F              ; 10 2F | Branch if positive
    BPL $2E              ; 10 2E | Branch if positive
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_35E
; Address: $DDF69A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_35E:
    JSR $3558            ; 20 58 35 | Jump to subroutine
    PHA                  ; 48 | Push accumulator to stack
    ASL $4532            ; 0E 32 45 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_35F
; Address: $DDF6A1
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_35F:
    JSR $0423            ; 20 23 04 | Jump to subroutine
    ORA $0A              ; 05 0A | Logical OR with accumulator (zero page)
    PLP                  ; 28 | Pull processor status from stack
    ROL $33              ; 26 33 | Rotate left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND #$11             ; 29 11 | Logical AND with accumulator (immediate)
    ORA #$19             ; 09 19 | Logical OR with accumulator (immediate)
    AND ($1B),Y          ; 31 1B | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_360
; Address: $DDF6B8
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_360:
    STA                  ; 9F 6F BF 6E | Update graphics data
    LSR $041A,X          ; 5E 1A 04 | Logical shift right (absolute,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPY #$D8             ; C0 D8 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_361
; Address: $DDF6CD
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_361:
    CPX $F830            ; EC 30 F8 | Compare X register (absolute)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BCS $40              ; B0 40 | Branch if carry set
    TAY                  ; A8 | Transfer accumulator to Y register
    BVC $F4              ; 50 F4 | Branch if overflow clear
    PHP                  ; 08 | Push processor status to stack
    INY                  ; C8 | Increment Y register
    INC                  ; 1A | Increment accumulator
    CPX $0E              ; E4 0E | Compare X register (zero page)
    BEQ $F2              ; F0 F2 | Branch if equal
    PEA #$F476           ; F4 76 F4 | Push effective address to stack
    ADC #$AA             ; 69 AA | Add with carry (immediate)
    PLX                  ; FA | Pull X register from stack
    ROR                  ; 6A | Rotate right (accumulator)
    AND ($CC,X)          ; 21 CC | Logical AND with accumulator ((zero page,X))
    ADC ($54,X)          ; 61 54 | Add with carry ((zero page,X))
    EOR ($AA,X)          ; 41 AA | Exclusive OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PEA #$7408           ; F4 08 74 | Push effective address to stack
    ROL                  ; 2A | Rotate left (accumulator)
    INC                  ; 1A | Increment accumulator
    TXA                  ; 8A | Transfer X register to accumulator
    TSX                  ; BA | Transfer stack pointer to X register
    JMP ($C97A)          ; 6C 7A C9 | Jump to address (absolute indirect)
    ASL $8A              ; 06 8A | Arithmetic shift left (zero page)
    STZ $94              ; 64 94 | Store zero to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_362
; Address: $DDF706
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_362:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY $24              ; C4 24 | Compare Y register (zero page)
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    PLA                  ; 68 | Pull accumulator from stack
    BPL $F0              ; 10 F0 | Branch if positive
    BRA $A0              ; 80 A0 | Branch always
    PHP                  ; 08 | Push processor status to stack
    BCS $8C              ; B0 8C | Branch if carry set
    INC $F4FB            ; EE FB F4 | Increment (absolute)
    PEA #$8070           ; F4 70 80 | Push effective address to stack
    BRA $41              ; 80 41 | Branch always
    DEX                  ; CA | Decrement X register
    INY                  ; C8 | Increment Y register
    STY $33              ; 84 33 | Store Y register to zero page
    STX $2A              ; 86 2A | Store X register to zero page
    BPL $2F              ; 10 2F | Branch if positive

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_364
; Address: $DDF736
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_364:
    JSL $512058          ; 22 58 20 51 | Jump to subroutine long
    PHA                  ; 48 | Push accumulator to stack
    BMI $5D              ; 30 5D | Branch if negative
    BIT $5E36            ; 2C 36 5E | Test bits in accumulator (absolute)
    PEA #$F476           ; F4 76 F4 | Push effective address to stack
    ADC #$AA             ; 69 AA | Add with carry (immediate)
    PLX                  ; FA | Pull X register from stack
    ORA ($68),Y          ; 11 68 | Logical OR with accumulator ((zero page),Y)
    AND ($DA,X)          ; 21 DA | Logical AND with accumulator ((zero page,X))
    WDM #$8C             ; 42 8C | Reserved instruction
    PHP                  ; 08 | Push processor status to stack
    PEA #$7408           ; F4 08 74 | Push effective address to stack
    ROL                  ; 2A | Rotate left (accumulator)
    INC                  ; 1A | Increment accumulator
    ASL $88              ; 06 88 | Arithmetic shift left (zero page)
    INC                  ; 1A | Increment accumulator
    LDY $7012            ; AC 12 70 | Load from absolute address into Y register
    JMP $0000            ; 4C 00 00 | Jump to address

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_365
; Address: $DDF764
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_365:
    JSR $5300            ; 20 00 53 | Jump to subroutine
    STZ $26              ; 64 26 | Store zero to zero page
    PLA                  ; 68 | Pull accumulator from stack
    BIT $0744            ; 2C 44 07 | Test bits in accumulator (absolute)
    ASL $1F00            ; 0E 00 1F | Arithmetic shift left (absolute)
    BIT $1800            ; 2C 00 18 | Test bits in accumulator (absolute)
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    BVS $20              ; 70 20 | Branch if overflow set
    DEC                  ; 3A | Decrement accumulator
    RTI                  ; 40 | Return from interrupt
    LDY $9360,X          ; BC 60 93 | Load from absolute,X into Y register
    BNE $2F              ; D0 2F | Branch if not equal

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_366
; Address: $DDF795
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_366:
    JSR $7380            ; 20 80 73 | Jump to subroutine
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_367
; Address: $DDF7A1
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_367:
    ORA $7C00,Y          ; 19 00 7C | Logical OR with accumulator (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    ROR $3F38,X          ; 7E 38 3F | Rotate right (absolute,X)
    ASL $0019,X          ; 1E 19 00 | Arithmetic shift left (absolute,X)
    ORA $7CFF,Y          ; 19 FF 7C | Logical OR with accumulator (absolute,Y)
    LDA                  ; BF 7E 47 3F | Read graphics status
    SEC                  ; 38 | Set carry flag
    ASL $0600,X          ; 1E 00 06 | Arithmetic shift left (absolute,X)
    BPL $CA              ; 10 CA | Branch if positive
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_36A
; Address: $DDF7D0
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_36A:
    JSR $7000            ; 20 00 70 | Jump to subroutine
    INX                  ; E8 | Increment X register
    BRA $0C              ; 80 0C | Branch always
    BMI $00              ; 30 00 | Branch if negative
    BPL $02              ; 10 02 | Branch if positive
    ASL $5C              ; 06 5C | Arithmetic shift left (zero page)
    INC $FD32            ; EE 32 FD | Increment (absolute)
    AND ($05),Y          ; 31 05 | Logical AND with accumulator ((zero page),Y)
    LSR                  ; 4A | Logical shift right (accumulator)
    INX                  ; E8 | Increment X register
    BEQ $06              ; F0 06 | Branch if equal
    DEC $FF07            ; CE 07 FF | Decrement (absolute)
    PLX                  ; FA | Pull X register from stack
    LSR                  ; 4A | Logical shift right (accumulator)
    INC $3E02            ; EE 02 3E | Increment (absolute)
    ASL $70FE,X          ; 1E FE 70 | Arithmetic shift left (absolute,X)
    INX                  ; E8 | Increment X register
    PHX                  ; DA | Push X register to stack
    INC $BE              ; E6 BE | Increment (zero page)
    BMI $78              ; 30 78 | Branch if negative
    INC $FDEE,X          ; FE EE FD | Increment (absolute,X)
    ROL $FEE1,X          ; 3E E1 FE | Rotate left (absolute,X)
    STZ $7EE0,X          ; 9E E0 7E | Store zero to absolute,X
    BRA $FC              ; 80 FC | Branch always
    PHA                  ; 48 | Push accumulator to stack
    BMI $00              ; 30 00 | Branch if negative
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    ORA #$4C             ; 09 4C | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_36B
; Address: $DDF82C
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_36B:
    JSR $2100            ; 20 00 21 | PPU graphics register access
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $1E00            ; 0D 00 1E | Logical OR with accumulator (absolute)
    INC                  ; 1A | Increment accumulator
    ROL                  ; 2A | Rotate left (accumulator)
    INC $45              ; E6 45 | Increment (zero page)
    ASL $275A,X          ; 1E 5A 27 | Arithmetic shift left (absolute,X)
    JMP $023D20          ; 5C 20 3D 02 | Jump to address long
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    ASL $3F3C,X          ; 1E 3C 3F | Arithmetic shift left (absolute,X)
    LSR $181E,X          ; 5E 1E 18 | Logical shift right (absolute,X)
    ROL $4C              ; 26 4C | Rotate left (zero page)
    REP #$7E             ; C2 7E | Reset processor status bits
    AND $277B,Y          ; 39 7B 27 | Logical AND with accumulator (absolute,Y)
    ASL $0416,X          ; 1E 16 04 | Arithmetic shift left (absolute,X)
    JMP ($B02D)          ; 6C 2D B0 | Jump to address (absolute indirect)
    BVS $3C              ; 70 3C | Branch if overflow set
    AND $017E,Y          ; 39 7E 01 | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_36C
; Address: $DDF879
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_36C:
    SEC                  ; 38 | Set carry flag
    ASL $0800,X          ; 1E 00 08 | Arithmetic shift left (absolute,X)
    BRA $80              ; 80 80 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_36D
; Address: $DDF887
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_36D:
    CPX #$10             ; E0 10 | Compare X register (immediate)
    BEQ $08              ; F0 08 | Branch if equal
    CLD                  ; D8 | Clear decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SEI                  ; 78 | Set interrupt disable flag
    TYA                  ; 98 | Transfer Y register to accumulator
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BVS $00              ; 70 00 | Branch if overflow set
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_36F
; Address: $DDF8A0
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_36F:
    JSR $24D8            ; 20 D8 24 | Jump to subroutine
    BEQ $24              ; F0 24 | Branch if equal
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    BVS $88              ; 70 88 | Branch if overflow set
    BEQ $E0              ; F0 E0 | Game work RAM access
    CPX #$00             ; E0 00 | Compare X register (immediate)
    PLP                  ; 28 | Pull processor status from stack
    BNE $00              ; D0 00 | Branch if not equal
    BRA $00              ; 80 00 | Branch always
    BVS $00              ; 70 00 | Branch if overflow set
    PHP                  ; 08 | Push processor status to stack
    CPX #$04             ; E0 04 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPX $7C              ; E4 7C | Compare X register (zero page)
    CPY $7C              ; C4 7C | Compare Y register (zero page)
    PEA #$080C           ; F4 0C 08 | Push effective address to stack
    SED                  ; F8 | Set decimal mode flag
    STX $FEFC            ; 8E FC FE | Store X register to absolute address
    SEI                  ; 78 | Set interrupt disable flag
    CLD                  ; D8 | Clear decimal mode flag
    BPL $7C              ; 10 7C | Branch if positive
    PEA #$0808           ; F4 08 08 | Push effective address to stack
    BEQ $F8              ; F0 F8 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BVS $08              ; 70 08 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_370
; Address: $DDF8DE
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_370:
    JSR $2A10            ; 20 10 2A | Jump to subroutine
    DEC $65              ; C6 65 | Decrement (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PLY                  ; 7A | Pull Y register from stack
    CPY $4900            ; CC 00 49 | Compare Y register (absolute)
    ROL $10              ; 26 10 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_371
; Address: $DDF8F2
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_371:
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    STZ $7C              ; 64 7C | Store zero to zero page
    DEC                  ; 3A | Decrement accumulator
    PHA                  ; 48 | Push accumulator to stack
    ASL $16              ; 06 16 | Arithmetic shift left (zero page)
    PHA                  ; 48 | Push accumulator to stack
    BEQ $49              ; F0 49 | Branch if equal
    CMP ($7F,X)          ; C1 7F | Compare accumulator ((zero page,X))
    BIT $0700            ; 2C 00 07 | Test bits in accumulator (absolute)
    EOR #$3E             ; 49 3E | Exclusive OR with accumulator (immediate)
    ORA $233E,X          ; 1D 3E 23 | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_372
; Address: $DDF920
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_372:
    JSR $24D8            ; 20 D8 24 | Jump to subroutine
    BEQ $24              ; F0 24 | Branch if equal
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    BVS $88              ; 70 88 | Branch if overflow set
    BEQ $E0              ; F0 E0 | Game work RAM access
    CPX $02              ; E4 02 | Compare X register (zero page)
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    PLP                  ; 28 | Pull processor status from stack
    BNE $00              ; D0 00 | Branch if not equal
    BRA $00              ; 80 00 | Branch always
    BVS $00              ; 70 00 | Branch if overflow set
    CPX #$06             ; E0 06 | Compare X register (immediate)
    SBC $E404,Y          ; F9 04 E4 | Subtract with carry (absolute,Y)
    ROR $7CC4,X          ; 7E C4 7C | Rotate right (absolute,X)
    PEA #$080C           ; F4 0C 08 | Push effective address to stack
    TYA                  ; 98 | Transfer Y register to accumulator
    BEQ $38              ; F0 38 | Branch if equal
    BEQ $50              ; F0 50 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_373
; Address: $DDF94E
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_373:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ADC $7E00,X          ; 7D 00 7E | Add with carry (absolute,X)
    PEA #$0808           ; F4 08 08 | Push effective address to stack
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BRA $60              ; 80 60 | Branch always
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    PLA                  ; 68 | Pull accumulator from stack
    AND $0F48            ; 2D 48 0F | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_374
; Address: $DDF96E
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_374:
    JSR $0409            ; 20 09 04 | Jump to subroutine
    ASL $1700            ; 0E 00 17 | Arithmetic shift left (absolute)
    BIT $0800            ; 2C 00 08 | Test bits in accumulator (absolute)
    BPL $02              ; 10 02 | Branch if positive
    BMI $00              ; 30 00 | Branch if negative
    DEC                  ; 3A | Decrement accumulator
    ORA $0F02,X          ; 1D 02 0F | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_375
; Address: $DDF985
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_375:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SEC                  ; 38 | Set carry flag
    SEI                  ; 78 | Set interrupt disable flag
    LDX $A350,Y          ; BE 50 A3 | Load from absolute,Y into X register
    DEX                  ; CA | Decrement X register
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    STY $70              ; 84 70 | Store Y register to zero page
    SEI                  ; 78 | Set interrupt disable flag
    CPX #$FE             ; E0 FE | Compare X register (immediate)
    CPX $47E3            ; EC E3 47 | Compare X register (absolute)
    JMP $3237            ; 4C 37 32 | Jump to address
    JMP $3B7C            ; 4C 7C 3B | Jump to address
    ASL $0019,X          ; 1E 19 00 | Arithmetic shift left (absolute,X)
    JMP $73BC            ; 4C BC 73 | Jump to address
    BMI $3F              ; 30 3F | Branch if negative
    ASL $0600,X          ; 1E 00 06 | Arithmetic shift left (absolute,X)
    BPL $DA              ; 10 DA | Branch if positive
    CLD                  ; D8 | Clear decimal mode flag
    ROL                  ; 2A | Rotate left (accumulator)
    INX                  ; E8 | Increment X register
    BEQ $12              ; F0 12 | Branch if equal
    BEQ $04              ; F0 04 | Branch if equal
    BCC $20              ; 90 20 | Branch if carry clear
    BVS $00              ; 70 00 | Branch if overflow set
    INX                  ; E8 | Increment X register
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    PLA                  ; 68 | Pull accumulator from stack
    JMP $F042B8          ; 5C B8 42 F0 | Jump to address long
    DEC $1D32            ; CE 32 1D | Decrement (absolute)
    CPY $72              ; C4 72 | Compare Y register (zero page)
    ORA $C8              ; 05 C8 | Logical OR with accumulator (zero page)
    ADC $FA              ; 65 FA | Add with carry (zero page)
    JMP $A000            ; 4C 00 A0 | Jump to address
    ASL $23              ; 06 23 | Arithmetic shift left (zero page)
    ASL $1FC7            ; 0E C7 1F | Arithmetic shift left (absolute)
    DEC                  ; 3A | Decrement accumulator
    INY                  ; C8 | Increment Y register
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    PHA                  ; 48 | Push accumulator to stack
    DEC $1606            ; CE 06 16 | Decrement (absolute)
    BNE $E8              ; D0 E8 | Branch if not equal
    TXS                  ; 9A | Transfer X register to stack pointer
    INC $B6              ; E6 B6 | Increment (zero page)
    LDY $30              ; A4 30 | Load from zero page into Y register
    SEI                  ; 78 | Set interrupt disable flag
    ROL $C639            ; 2E 39 C6 | Rotate left (absolute)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    PHA                  ; 48 | Push accumulator to stack
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_376
; Address: $DDFA27
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_376:
    BMI $07              ; 30 07 | Branch if negative
    SEC                  ; 38 | Set carry flag
    AND ($3E,X)          ; 21 3E | Logical AND with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_377
; Address: $DDFA37
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_377:
    JSR $201F            ; 20 1F 20 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    ROL $3E11,X          ; 3E 11 3E | Rotate left (absolute,X)
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    JMP ($C3B0)          ; 6C B0 C3 | Jump to address (absolute indirect)
    INX                  ; E8 | Increment X register
    PLP                  ; 28 | Pull processor status from stack
    LDA $BF67,Y          ; B9 67 BF | Read graphics status
    PHA                  ; 48 | Push accumulator to stack
    SBC #$9F             ; E9 9F | Subtract with carry (immediate)
    SBC $7907,Y          ; F9 07 79 | Subtract with carry (absolute,Y)
    ORA ($37,X)          ; 01 37 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    LDA                  ; BF 00 6F 00 | Read graphics status
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BNE $D0              ; D0 D0 | Branch if not equal
    BNE $30              ; D0 30 | Branch if not equal
    BEQ $0C              ; F0 0C | Branch if equal
    CPX #$1C             ; E0 1C | Compare X register (immediate)
    STY $7C              ; 84 7C | Store Y register to zero page
    CPY $3C              ; C4 3C | Compare Y register (zero page)
    CPX #$D0             ; E0 D0 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_378
; Address: $DDFA93
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_378:
    JSR $00F8            ; 20 F8 00 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPX $18              ; E4 18 | Compare X register (zero page)
    CPX #$FC             ; E0 FC | Compare X register (immediate)
    JMP $08B8            ; 4C B8 08 | Jump to address
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$18             ; E0 18 | Compare X register (immediate)
    BPL $20              ; 10 20 | Branch if positive
    INX                  ; E8 | Increment X register
    ORA $9BC3            ; 0D C3 9B | Logical OR with accumulator (absolute)
    SBC $F8              ; E5 F8 | Subtract with carry (zero page)
    PEA #$FC00           ; F4 00 FC | Push effective address to stack
    CPX $00              ; E4 00 | Compare X register (zero page)
    INX                  ; E8 | Increment X register
    DEC $FF30            ; CE 30 FF | Decrement (absolute)
    SBC $19E7            ; ED E7 19 | Subtract with carry (absolute)
    STA $2EF2            ; 8D F2 2E | Update graphics data
    BEQ $27              ; F0 27 | Branch if equal

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_379
; Address: $DDFAC9
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_379:
    SBC $9D73,Y          ; F9 73 9D | Subtract with carry (absolute,Y)
    LDA $1E6E,Y          ; B9 6E 1E | Read graphics status
    BPL $EF              ; 10 EF | Branch if positive
    PLX                  ; FA | Pull X register from stack
    STA                  ; 9F 00 0E 00 | Update graphics data
    BPL $F0              ; 10 F0 | Branch if positive
    ROL $1E11,X          ; 3E 11 1E | Rotate left (absolute,X)
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    JMP ($C3B0)          ; 6C B0 C3 | Jump to address (absolute indirect)
    CLD                  ; D8 | Clear decimal mode flag
    PLA                  ; 68 | Pull accumulator from stack
    JMP $0CB8            ; 4C B8 0C | Jump to address
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$18             ; E0 18 | Compare X register (immediate)
    BPL $20              ; 10 20 | Branch if positive
    INX                  ; E8 | Increment X register
    ORA $97C3            ; 0D C3 97 | Logical OR with accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    CPX $00              ; E4 00 | Compare X register (zero page)
    INX                  ; E8 | Increment X register
    DEC $FF30            ; CE 30 FF | Decrement (absolute)
    BMI $2C              ; 30 2C | Branch if negative
    BMI $2F              ; 30 2F | Branch if negative
    ROL $2A21,X          ; 3E 21 2A | Rotate left (absolute,X)
    BPL $30              ; 10 30 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BPL $0F              ; 10 0F | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BPL $1E              ; 10 1E | Branch if positive
    ASL $1C00            ; 0E 00 1C | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    ROL $1F01,X          ; 3E 01 1F | Rotate left (absolute,X)
    AND $2E33            ; 2D 33 2E | Logical AND with accumulator (absolute)
    AND ($26),Y          ; 31 26 | Logical AND with accumulator ((zero page),Y)
    AND $6C53,Y          ; 39 53 6C | Logical AND with accumulator (absolute,Y)
    LSR $9C31            ; 4E 31 9C | Logical shift right (absolute)
    EOR #$7C             ; 49 7C | Exclusive OR with accumulator (immediate)
    ROR $3100            ; 6E 00 31 | Rotate right (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    CLV                  ; B8 | Clear overflow flag
    DEY                  ; 88 | Decrement Y register
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_37A
; Address: $DDFB85
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_37A:
    CLC                  ; 18 | Clear carry flag
    PHA                  ; 48 | Push accumulator to stack
    SEC                  ; 38 | Set carry flag
    BVS $08              ; 70 08 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    SEI                  ; 78 | Set interrupt disable flag
    SEC                  ; 38 | Set carry flag
    CLV                  ; B8 | Clear overflow flag
    BVS $B8              ; 70 B8 | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    CLV                  ; B8 | Clear overflow flag
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    INY                  ; C8 | Increment Y register
    PHP                  ; 08 | Push processor status to stack
    INY                  ; C8 | Increment Y register
    BMI $70              ; 30 70 | Branch if negative
    PLP                  ; 28 | Pull processor status from stack
    BNE $08              ; D0 08 | Branch if not equal
    BVS $10              ; 70 10 | Branch if overflow set
    CPX #$40             ; E0 40 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_37C
; Address: $DDFBAF
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_37C:
    JSR $7088            ; 20 88 70 | Jump to subroutine
    TAY                  ; A8 | Transfer accumulator to Y register
    BRA $00              ; 80 00 | Branch always
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BPL $E0              ; 10 E0 | Game work RAM access
    BNE $20              ; D0 20 | Branch if not equal
    BRA $A0              ; 80 A0 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$70             ; C0 70 | Compare Y register (immediate)
    BMI $E0              ; 30 E0 | Game work RAM access
    BVS $20              ; 70 20 | Branch if overflow set
    BEQ $60              ; F0 60 | Branch if equal
    BCS $68              ; B0 68 | Branch if carry set
    SEI                  ; 78 | Set interrupt disable flag
    BRA $D0              ; 80 D0 | Branch always

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_37D
; Address: $DDFBD1
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_37D:
    JSR $3048            ; 20 48 30 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    BCS $48              ; B0 48 | Branch if carry set
    BMI $C8              ; 30 C8 | Branch if negative
    BMI $88              ; 30 88 | Branch if negative
    BMI $84              ; 30 84 | Branch if negative
    SEI                  ; 78 | Set interrupt disable flag
    BRA $80              ; 80 80 | Branch always
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_37E
; Address: $DDFBE2
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_37E:
    CLC                  ; 18 | Clear carry flag
    BPL $0F              ; 10 0F | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $1C00            ; 0E 00 1C | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    ROL $1F01,X          ; 3E 01 1F | Rotate left (absolute,X)
    AND $6F53,X          ; 3D 53 6F | Logical AND with accumulator (absolute,X)
    ADC #$6F             ; 69 6F | Add with carry (immediate)
    JMP $81609F          ; 5C 9F 60 81 | Jump to address long
    ROR $017F,X          ; 7E 7F 01 | Rotate right (absolute,X)
    ADC ($04,X)          ; 61 04 | Add with carry ((zero page,X))
    EOR $6300,X          ; 5D 00 63 | Exclusive OR with accumulator (absolute,X)
    ROR $0100,X          ; 7E 00 01 | Rotate right (absolute,X)
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register
    BMI $70              ; 30 70 | Branch if negative
    PLP                  ; 28 | Pull processor status from stack
    BNE $08              ; D0 08 | Branch if not equal
    BVS $10              ; 70 10 | Branch if overflow set
    CPX #$40             ; E0 40 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    PLP                  ; 28 | Pull processor status from stack
    INX                  ; E8 | Increment X register
    BIT $7088            ; 2C 88 70 | Test bits in accumulator (absolute)
    TAY                  ; A8 | Transfer accumulator to Y register
    BRA $00              ; 80 00 | Branch always
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CLC                  ; 18 | Clear carry flag
    CPX #$DC             ; E0 DC | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_37F
; Address: $DDFC3F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_37F:
    JSR $248C            ; 20 8C 24 | Jump to subroutine
    STY $08              ; 84 08 | Store Y register to zero page
    BVS $A4              ; 70 A4 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_380
; Address: $DDFC48
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_380:
    JSR $60F0            ; 20 F0 60 | Jump to subroutine
    BCS $90              ; B0 90 | Branch if carry set
    CLI                  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_381
; Address: $DDFC4F
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_381:
    JSR $20D4            ; 20 D4 20 | Jump to subroutine
    BVC $20              ; 50 20 | Branch if overflow clear
    INY                  ; C8 | Increment Y register
    BMI $CC              ; 30 CC | Branch if negative
    BMI $C8              ; 30 C8 | Branch if negative
    BMI $88              ; 30 88 | Branch if negative
    BMI $24              ; 30 24 | Branch if negative
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_382
; Address: $DDFC5E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_382:
    JSR $00E0            ; 20 E0 00 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    ORA ($34),Y          ; 11 34 | Logical OR with accumulator ((zero page),Y)
    BPL $36              ; 10 36 | Branch if positive

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_383
; Address: $DDFC6A
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_383:
    JSR $2237            ; 20 37 22 | Jump to subroutine
    ORA #$26             ; 09 26 | Logical OR with accumulator (immediate)
    ORA $2F10,Y          ; 19 10 2F | Logical OR with accumulator (absolute,Y)
    ORA #$36             ; 09 36 | Logical OR with accumulator (immediate)
    ORA #$12             ; 09 12 | Logical OR with accumulator (immediate)
    ORA $0430            ; 0D 30 04 | Logical OR with accumulator (absolute)
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    ORA $0E18,X          ; 1D 18 0E | Logical OR with accumulator (absolute,X)
    LSR $6E              ; 46 6E | Logical shift right (zero page)
    INX                  ; E8 | Increment X register
    PEA #$0708           ; F4 08 07 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_384
; Address: $DDFC94
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_384:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    ORA ($2C,X)          ; 01 2C | Logical OR with accumulator ((zero page,X))
    BPL $71              ; 10 71 | Branch if positive
    TXS                  ; 9A | Transfer X register to stack pointer
    PLA                  ; 68 | Pull accumulator from stack
    PLX                  ; FA | Pull X register from stack
    TXS                  ; 9A | Transfer X register to stack pointer
    PLY                  ; 7A | Pull Y register from stack
    CPX $7F1E            ; EC 1E 7F | Compare X register (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($9C,X)          ; 01 9C | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ADC ($0E),Y          ; 71 0E | Add with carry ((zero page),Y)
    BNE $10              ; D0 10 | Branch if not equal
    INX                  ; E8 | Increment X register
    DEY                  ; 88 | Decrement Y register
    STY $68EC            ; 8C EC 68 | Store Y register to absolute address
    CPX $ECA4            ; EC A4 EC | Compare X register (absolute)
    CPX $EC              ; E4 EC | Compare X register (zero page)
    CPY $00D8            ; CC D8 00 | Compare Y register (absolute)
    CPX #$D0             ; E0 D0 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_385
; Address: $DDFCD3
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_385:
    JSR $9068            ; 20 68 90 | Jump to subroutine
    STZ $98              ; 64 98 | Store zero to zero page
    PHP                  ; 08 | Push processor status to stack
    PEA #$906C           ; F4 6C 90 | Push effective address to stack
    JMP ($4890)          ; 6C 90 48 | Jump to address (absolute indirect)
    BCS $0C              ; B0 0C | Branch if carry set

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_386
; Address: $DDFCE1
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_386:
    JSR $F058            ; 20 58 F0 | Jump to subroutine
    CLI                  ; 58 | Clear interrupt disable flag
    CLV                  ; B8 | Clear overflow flag
    CLC                  ; 18 | Clear carry flag
    BEQ $00              ; F0 00 | Branch if equal
    INY                  ; C8 | Increment Y register
    EOR $1DC3            ; 4D C3 1D | Exclusive OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_387
; Address: $DDFCEF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_387:
    JSL $40E010          ; 22 10 E0 40 | Jump to subroutine long
    PHP                  ; 08 | Push processor status to stack
    STA $C03F30          ; 8F 30 3F C0 | Update graphics data
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_388
; Address: $DDFD01
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_388:
    DEX                  ; CA | Decrement X register
    ORA $F74D,X          ; 1D 4D F7 | Logical OR with accumulator (absolute,X)
    LSR $67F2            ; 4E F2 67 | Logical shift right (absolute)
    SBC $9D13,Y          ; F9 13 9D | Subtract with carry (absolute,Y)
    AND $6A              ; 25 6A | Logical AND with accumulator (zero page)
    STZ $2890,X          ; 9E 90 28 | Store zero to absolute,X
    CPY #$5D             ; C0 5D | Compare Y register (immediate)
    BRA $3F              ; 80 3F | Branch always
    CPY #$3E             ; C0 3E | Compare Y register (immediate)
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    CPX #$6F             ; E0 6F | Compare X register (immediate)
    BCC $9E              ; 90 9E | Branch if carry clear
    BCC $F0              ; 90 F0 | Branch if carry clear
    BMI $04              ; 30 04 | Branch if negative
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    ORA $0E18,X          ; 1D 18 0E | Logical OR with accumulator (absolute,X)
    DEC $EE              ; C6 EE | Decrement (zero page)
    CLV                  ; B8 | Clear overflow flag
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_389
; Address: $DDFD34
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_389:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    ORA ($6C,X)          ; 01 6C | Logical OR with accumulator ((zero page,X))
    BPL $F1              ; 10 F1 | Branch if positive

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_38A
; Address: $DDFD41
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_38A:
    JSR $F058            ; 20 58 F0 | Jump to subroutine
    CLI                  ; 58 | Clear interrupt disable flag
    CLV                  ; B8 | Clear overflow flag
    CLC                  ; 18 | Clear carry flag
    BEQ $00              ; F0 00 | Branch if equal
    INY                  ; C8 | Increment Y register
    EOR $17C3            ; 4D C3 17 | Exclusive OR with accumulator (absolute)
    BPL $E0              ; 10 E0 | Game work RAM access
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    STX $3F30            ; 8E 30 3F | Store X register to absolute address
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    AND $480C            ; 2D 0C 48 | Logical AND with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    ROL $450E            ; 2E 0E 45 | Rotate left (absolute)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    INC                  ; 1A | Increment accumulator
    ORA $1200            ; 0D 00 12 | Logical OR with accumulator (absolute)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    DEC                  ; 3A | Decrement accumulator
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    ORA $3500,Y          ; 19 00 35 | Logical OR with accumulator (absolute,Y)
    ADC #$21             ; 69 21 | PPU graphics register access
    BVS $30              ; 70 30 | Branch if overflow set
    ASL $0600            ; 0E 00 06 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_38B
; Address: $DDFD97
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_38B:
    CLC                  ; 18 | Clear carry flag
    AND ($3F,X)          ; 21 3F | Logical AND with accumulator ((zero page,X))
    BMI $3F              ; 30 3F | Branch if negative
    ROL $06              ; 26 06 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_38C
; Address: $DDFDA2
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_38C:
    JSR $4400            ; 20 00 44 | Jump to subroutine
    JMP $5C0C            ; 4C 0C 5C | Jump to address
    ROL $1F1E,X          ; 3E 1E 1F | Rotate left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ORA #$04             ; 09 04 | Logical OR with accumulator (immediate)
    ASL $0717            ; 0E 17 07 | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    ASL $081F,X          ; 1E 1F 08 | Arithmetic shift left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    CLI                  ; 58 | Clear interrupt disable flag
    LDY $00              ; A4 00 | Load from zero page into Y register
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_38D
; Address: $DDFDC7
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_38D:
    JSR $1094            ; 20 94 10 | Jump to subroutine
    TXS                  ; 9A | Transfer X register to stack pointer
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_38F
; Address: $DDFDD2
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_38F:
    JSR $5800            ; 20 00 58 | Jump to subroutine
    BNE $00              ; D0 00 | Branch if not equal
    PLA                  ; 68 | Pull accumulator from stack
    STZ $00              ; 64 00 | Store zero to zero page
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $09              ; 80 09 | Branch always
    ASL $1D              ; 06 1D | Arithmetic shift left (zero page)
    ASL $AD              ; 06 AD | Arithmetic shift left (zero page)
    CMP $04              ; C5 04 | Compare accumulator (zero page)
    STX $0888            ; 8E 88 08 | Store X register to absolute address
    RTI                  ; 40 | Return from interrupt
    PLA                  ; 68 | Pull accumulator from stack
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    JMP $041E            ; 4C 1E 04 | Jump to address
    ROL $F080,X          ; 3E 80 F0 | Rotate left (absolute,X)
    BEQ $40              ; F0 40 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt
    WDM #$40             ; 42 40 | Reserved instruction
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    LSR $EC4C            ; 4E 4C EC | Logical shift right (absolute)
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_392
; Address: $DDFE12
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_392:
    CPX #$1C             ; E0 1C | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    JMP $E0FC            ; 4C FC E0 | Game work RAM access
    BEQ $60              ; F0 60 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_393
; Address: $DDFE1E
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_393:
    BRA $80              ; 80 80 | Branch always
    ROL $06              ; 26 06 | Rotate left (zero page)
    RTI                  ; 40 | Return from interrupt
    WDM #$02             ; 42 02 | Reserved instruction
    BVC $10              ; 50 10 | Branch if overflow clear
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    BPL $3F              ; 10 3F | Branch if positive
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $0B              ; 80 0B | Branch always
    ORA $AD06,Y          ; 19 06 AD | Logical OR with accumulator (absolute,Y)
    ASL $04C5            ; 0E C5 04 | Arithmetic shift left (absolute)
    STA $0E8C            ; 8D 8C 0E | Update graphics data
    RTI                  ; 40 | Return from interrupt
    PLA                  ; 68 | Pull accumulator from stack
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    PHA                  ; 48 | Push accumulator to stack
    CLC                  ; 18 | Clear carry flag
    ROL $F684,X          ; 3E 84 F6 | Rotate left (absolute,X)
    BEQ $40              ; F0 40 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_394
; Address: $DDFE64
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_394:
    JSL $303220          ; 22 20 32 30 | Jump to subroutine long
    DEC                  ; 3A | Decrement accumulator
    SEC                  ; 38 | Set carry flag
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    BPL $90              ; 10 90 | Branch if positive

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_396
; Address: $DDFE74
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_396:
    JSR $30FC            ; 20 FC 30 | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    BPL $10              ; 10 10 | Branch if positive
    LDY #$E0             ; A0 E0 | Game work RAM access
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA $2301,Y          ; 19 01 23 | Logical OR with accumulator (absolute,Y)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_399
; Address: $DDFEA0
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_399:
    JSR $1102            ; 20 02 11 | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    EOR #$09             ; 49 09 | Exclusive OR with accumulator (immediate)
    PHA                  ; 48 | Push accumulator to stack
    ORA $0C00,X          ; 1D 00 0C | Logical OR with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ORA ($1C,X)          ; 01 1C | Logical OR with accumulator ((zero page,X))
    ORA #$3F             ; 09 3F | Logical OR with accumulator (immediate)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    EOR ($01),Y          ; 51 01 | Exclusive OR with accumulator ((zero page),Y)
    EOR ($03,X)          ; 41 03 | Exclusive OR with accumulator ((zero page,X))
    EOR ($03,X)          ; 41 03 | Exclusive OR with accumulator ((zero page,X))
    ASL $1E              ; 06 1E | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    AND $1E02,Y          ; 39 02 1E | Logical AND with accumulator (absolute,Y)
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    ORA ($3C,X)          ; 01 3C | Logical OR with accumulator ((zero page,X))
    ORA ($3C,X)          ; 01 3C | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    LDY #$00             ; A0 00 | Load immediate value into Y register
    JMP $9200            ; 4C 00 92 | Jump to address
    BRA $05              ; 80 05 | Branch always
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_39A
; Address: $DDFEEB
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_39A:
    JSR $6804            ; 20 04 68 | Jump to subroutine
    CLD                  ; D8 | Clear decimal mode flag
    CLC                  ; 18 | Clear carry flag
    BCS $00              ; B0 00 | Branch if carry set
    JMP ($FA00)          ; 6C 00 FA | Jump to address (absolute indirect)
    RTI                  ; 40 | Return from interrupt
    BPL $80              ; 10 80 | Branch if positive
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    PLP                  ; 28 | Pull processor status from stack
    CPY #$34             ; C0 34 | Compare Y register (immediate)
    CPX #$DA             ; E0 DA | Compare X register (immediate)
    PEA #$0C92           ; F4 92 0C | Push effective address to stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    BPL $00              ; 10 00 | Branch if positive
    BPL $08              ; 10 08 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_39C
; Address: $DDFF21
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_39C:
    JSR $00E0            ; 20 E0 00 | Jump to subroutine
    BEQ $E0              ; F0 E0 | Game work RAM access
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_39D
; Address: $DDFF27
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_39D:
    BNE $68              ; D0 68 | Branch if not equal
    BCC $A4              ; 90 A4 | Branch if carry clear
    CLI                  ; 58 | Clear interrupt disable flag
    PEA #$A808           ; F4 08 A8 | Push effective address to stack
    BPL $20              ; 10 20 | Branch if positive
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    BCS $F0              ; B0 F0 | Branch if carry set

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_39E
; Address: $DDFF40
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_39E:
    JSR $1102            ; 20 02 11 | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    EOR ($01,X)          ; 41 01 | Exclusive OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $0C00,X          ; 1D 00 0C | Logical OR with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ORA ($1C,X)          ; 01 1C | Logical OR with accumulator ((zero page,X))
    ASL $3F01,X          ; 1E 01 3F | Arithmetic shift left (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHA                  ; 48 | Push accumulator to stack
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    EOR ($02),Y          ; 51 02 | Exclusive OR with accumulator ((zero page),Y)
    EOR ($03,X)          ; 41 03 | Exclusive OR with accumulator ((zero page,X))
    WDM #$07             ; 42 07 | Reserved instruction
    AND $0E              ; 25 0E | Logical AND with accumulator (zero page)
    ORA $0002,X          ; 1D 02 00 | Logical OR with accumulator (absolute,X)
    ORA ($3C,X)          ; 01 3C | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    ASL $10              ; 06 10 | Arithmetic shift left (zero page)
    INX                  ; E8 | Increment X register
    TYA                  ; 98 | Transfer Y register to accumulator
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    BRA $28              ; 80 28 | Branch always
    CPY #$D4             ; C0 D4 | Compare Y register (immediate)
    CPX #$8A             ; E0 8A | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    BPL $08              ; 10 08 | Branch if positive
    BVS $00              ; 70 00 | Branch if overflow set
    BRA $00              ; 80 00 | Branch always
    CPX #$18             ; E0 18 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_3A0
; Address: $DDFFA5
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_3A0:
    JSR $8070            ; 20 70 80 | Jump to subroutine
    INY                  ; C8 | Increment Y register
    BMI $88              ; 30 88 | Branch if negative

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_3A2
; Address: $DDFFAD
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_3A2:
    JSR $2050            ; 20 50 20 | Jump to subroutine
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_3A3
; Address: $DDFFBC
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_3A3:
    JSR $6000            ; 20 00 60 | Jump to subroutine
    CPX #$00             ; E0 00 | Compare X register (immediate)
    INC                  ; 1A | Increment accumulator
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    ASL $28              ; 06 28 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    BMI $0A              ; 30 0A | Branch if negative
    BVC $0F              ; 50 0F | Branch if overflow clear
    INC                  ; 1A | Increment accumulator
    PHP                  ; 08 | Push processor status to stack
    AND ($06),Y          ; 31 06 | Logical AND with accumulator ((zero page),Y)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3A_GraphicsFunction_3A5
; Address: $DDFFE3
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3A_GraphicsFunction_3A5:
    JSR $6D9F            ; 20 9F 6D | Jump to subroutine
    ROL $5463,X          ; 3E 63 54 | Rotate left (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    STZ $7F07,X          ; 9E 07 7F | Store zero to absolute,X
    BRA $00              ; 80 00 | Branch always
    INX                  ; E8 | Increment X register
    RTI                  ; 40 | Return from interrupt
    BIT $0CE0            ; 2C E0 0C | Test bits in accumulator (absolute)
    RTS                  ; 60 | Return from subroutine
