;==============================================================================
; Dragon Quest III - Bank $0A
; Type: Dma
; Purpose: DMA operations and data transfer
; Address Range: $C50000-$C57FFF
; Instructions: 8602
; Bytes: 32768
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_0A"

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_003
; Address: $C5800D
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_003:
    LDA #$3C             ; A9 3C | Load immediate value into accumulator
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BRA $60              ; 80 60 | Branch always
    LDA #$3D             ; A9 3D | Load immediate value into accumulator
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BRA $60              ; 80 60 | Branch always
    LDA #$3E             ; A9 3E | Load immediate value into accumulator
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BRA $60              ; 80 60 | Branch always
    LDA #$3F             ; A9 3F | Load immediate value into accumulator
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BRA $60              ; 80 60 | Branch always

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_006
; Address: $C5802F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_006:
    JSL $C270E1          ; 22 E1 70 C2 | Jump to subroutine long
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BCS $07              ; B0 07 | Branch if carry set
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    STA $23E6            ; 8D E6 23 | Store accumulator to absolute address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_007
; Address: $C5803F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_007:
    LDA #$03             ; A9 03 | Load immediate value into accumulator
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BRA $60              ; 80 60 | Branch always

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_008
; Address: $C58046
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_008:
    JSL $C012D1          ; 22 D1 12 C0 | Jump to subroutine long
    AND #$03             ; 29 03 | Logical AND with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF 89 80 C2 | Load from absolute long,X into accumulator
    STA $BE77            ; 8D 77 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_009
; Address: $C58056
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_009:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    SBC $2200,X          ; FD 00 22 | Subtract with carry (absolute,X)
    CMP ($12),Y          ; D1 12 | Compare accumulator ((zero page),Y)
    CPY #$29             ; C0 29 | Compare Y register (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF 91 80 C2 | Load from absolute long,X into accumulator
    STA $BE77            ; 8D 77 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_00B
; Address: $C58073
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_00B:
    CMP ($12),Y          ; D1 12 | Compare accumulator ((zero page),Y)
    CPY #$29             ; C0 29 | Compare Y register (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF 99 80 C2 | Load from absolute long,X into accumulator
    STA $BE77            ; 8D 77 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_00D
; Address: $C58089
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_00D:
    NOP                  ; EA | No operation
    XBA                  ; EB | Exchange accumulator bytes
    CPX $ED02            ; EC 02 ED | Compare X register (absolute)
    INC $EF02            ; EE 02 EF | Increment (absolute)
    BEQ $02              ; F0 02 | Branch if equal
    SBC ($02),Y          ; F1 02 | Subtract with carry ((zero page),Y)
    PEA #$F502           ; F4 02 F5 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_00F
; Address: $C580A7
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_00F:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_013
; Address: $C580BB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_013:
    JSL $C1E59C          ; 22 9C E5 C1 | Jump to subroutine long
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    BCS $06              ; B0 06 | Branch if carry set

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_019
; Address: $C580D9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_019:
    JSL $C0133E          ; 22 3E 13 C0 | Jump to subroutine long
    BEQ $14              ; F0 14 | Branch if equal
    LDX #$00             ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_01A
; Address: $C580E2
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_01A:
    JSL $C01407          ; 22 07 14 C0 | Jump to subroutine long
    BCC $0B              ; 90 0B | Branch if carry clear
    STA $23E6            ; 8D E6 23 | Store accumulator to absolute address
    STA $23E8            ; 8D E8 23 | Store accumulator to absolute address
    LDA #$F4             ; A9 F4 | Load immediate value into accumulator
    BRA $09              ; 80 09 | Branch always
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    STA $23E6            ; 8D E6 23 | Store accumulator to absolute address
    LDA #$F5             ; A9 F5 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_01E
; Address: $C5810A
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_01E:
    LSR                  ; 4A | Logical shift right (accumulator)
    BCC $06              ; 90 06 | Branch if carry clear
    LDA #$D6             ; A9 D6 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_020
; Address: $C58114
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_020:
    JSL $C012D1          ; 22 D1 12 C0 | Jump to subroutine long
    LSR                  ; 4A | Logical shift right (accumulator)
    BCS $34              ; B0 34 | Branch if carry set
    LDY $23E4            ; AC E4 23 | Load from absolute address into Y register
    CPY $23E6            ; CC E6 23 | Compare Y register (absolute)
    BEQ $2C              ; F0 2C | Branch if equal
    LDA #$01             ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_026
; Address: $C58141
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_026:
    JSR $00F0            ; 20 F0 00 | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF 7A BB C2 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_028
; Address: $C5814F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_028:
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    STA $23E6            ; 8D E6 23 | Store accumulator to absolute address
    LDY $23E4            ; AC E4 23 | Load from absolute address into Y register
    LDA #$01             ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_02E
; Address: $C58176
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_02E:
    JSR $00F0            ; 20 F0 00 | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF 7A BB C2 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_036
; Address: $C581A1
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_036:
    JSR $E122            ; 20 22 E1 | Jump to subroutine
    BVS $C2              ; 70 C2 | Branch if overflow set
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BCS $0D              ; B0 0D | Branch if carry set
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    STA $23E6            ; 8D E6 23 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_038
; Address: $C581B8
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_038:
    JSL $C012D1          ; 22 D1 12 C0 | Jump to subroutine long
    LSR                  ; 4A | Logical shift right (accumulator)
    BCS $07              ; B0 07 | Branch if carry set

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_039
; Address: $C581BF
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_039:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    SBC $00              ; E5 00 | Subtract with carry (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_03C
; Address: $C581CC
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_03C:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    INC $00              ; E6 00 | Increment (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_03F
; Address: $C581E0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_03F:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_042
; Address: $C581F1
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_042:
    JSL $C0133E          ; 22 3E 13 C0 | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF 05 82 C2 | Load from absolute long,X into accumulator
    STA $BE77            ; 8D 77 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_043
; Address: $C581FE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_043:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    BNE $00              ; D0 00 | Branch if not equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_044
; Address: $C58207
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_044:
    SBC $1401            ; ED 01 14 | Subtract with carry (absolute)
    SBC #$02             ; E9 02 | Subtract with carry (immediate)
    ORA $6C02,X          ; 1D 02 6C | Logical OR with accumulator (absolute,X)
    LDA $23E4            ; AD E4 23 | Load from absolute address into accumulator
    STA $2428            ; 8D 28 24 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_046
; Address: $C5821E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_046:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    INY                  ; C8 | Increment Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_049
; Address: $C5822C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_049:
    JSL $C012D1          ; 22 D1 12 C0 | Jump to subroutine long
    AND #$03             ; 29 03 | Logical AND with accumulator (immediate)
    BNE $07              ; D0 07 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_04A
; Address: $C58235
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_04A:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_04D
; Address: $C58242
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_04D:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    CPY $00              ; C4 00 | Compare Y register (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_04F
; Address: $C5824C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_04F:
    JSL $C0133E          ; 22 3E 13 C0 | Jump to subroutine long
    INC                  ; 1A | Increment accumulator
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address
    STZ $BE82            ; 9C 82 BE | Store zero to absolute

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_050
; Address: $C58257
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_050:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    LDX $6000,Y          ; BE 00 60 | Load from absolute,Y into X register
    LDA #$08             ; A9 08 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_051
; Address: $C58261
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_051:
    JSL $C0133E          ; 22 3E 13 C0 | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF 70 82 C2 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_053
; Address: $C58270
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_053:
    LDA ($00),Y          ; B1 00 | Load from (zero page),Y into accumulator
    CLV                  ; B8 | Clear overflow flag
    LDA $BA00,Y          ; B9 00 BA | Load from absolute,Y into accumulator
    LDY $2200,X          ; BC 00 22 | Load from absolute,X into Y register
    CMP ($12),Y          ; D1 12 | Compare accumulator ((zero page),Y)
    CPY #$29             ; C0 29 | Compare Y register (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF B5 82 C2 | Load from absolute long,X into accumulator
    STA $BE77            ; 8D 77 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_055
; Address: $C58298
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_055:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    LDY $2200            ; AC 00 22 | Load from absolute address into Y register
    CMP ($12),Y          ; D1 12 | Compare accumulator ((zero page),Y)
    CPY #$29             ; C0 29 | Compare Y register (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF BD 82 C2 | Load from absolute long,X into accumulator
    STA $BE77            ; 8D 77 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_056
; Address: $C582AE
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_056:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    LDA $6000            ; AD 00 60 | Load from absolute address into accumulator
    SBC ($02,X)          ; E1 02 | Subtract with carry ((zero page,X))
    SEP #$02             ; E2 02 | Set processor status bits

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_057
; Address: $C582BB
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_057:
    CPX $02              ; E4 02 | Compare X register (zero page)
    SBC $02              ; E5 02 | Subtract with carry (zero page)
    INC $02              ; E6 02 | Increment (zero page)
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_058
; Address: $C582C5
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_058:
    JSL $C012D1          ; 22 D1 12 C0 | Jump to subroutine long
    LSR                  ; 4A | Logical shift right (accumulator)
    BCC $07              ; 90 07 | Branch if carry clear
    LDA $23E4            ; AD E4 23 | Load from absolute address into accumulator
    STA $23E6            ; 8D E6 23 | Store accumulator to absolute address
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_05A
; Address: $C582D8
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_05A:
    JSR $82C5            ; 20 C5 82 | Jump to subroutine
    BCC $05              ; 90 05 | Branch if carry clear
    LDA #$9D             ; A9 9D | Load immediate value into accumulator
    ORA ($AD,X)          ; 01 AD | Logical OR with accumulator ((zero page,X))
    INC $23              ; E6 23 | Increment (zero page)
    STA $23E8            ; 8D E8 23 | Store accumulator to absolute address
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_05D
; Address: $C582F2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_05D:
    JSL $C012D1          ; 22 D1 12 C0 | Jump to subroutine long
    AND #$07             ; 29 07 | Logical AND with accumulator (immediate)
    BNE $0B              ; D0 0B | Branch if not equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_063
; Address: $C5831A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_063:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    PLY                  ; 7A | Pull Y register from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_064
; Address: $C58321
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_064:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    AND ($01),Y          ; 31 01 | Logical AND with accumulator ((zero page),Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_06D
; Address: $C58359
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_06D:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    ORA ($60,X)          ; 01 60 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_06F
; Address: $C58367
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_06F:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    DEC                  ; 3A | Decrement accumulator
    ORA ($60,X)          ; 01 60 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_070
; Address: $C5836E
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_070:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    ORA ($60,X)          ; 01 60 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDX #$16             ; A2 16 | Load immediate value into X register
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    STA $243E,X          ; 9D 3E 24 | Store accumulator to absolute,X
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    BPL $F9              ; 10 F9 | Branch if positive
    STZ $00              ; 64 00 | Store zero to zero page
    STZ $2426            ; 9C 26 24 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_071
; Address: $C58393
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_071:
    JSR $83D2            ; 20 D2 83 | Jump to subroutine
    INC $2426            ; EE 26 24 | Increment (absolute)
    LDA $2426            ; AD 26 24 | Load from absolute address into accumulator
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BCC $F2              ; 90 F2 | Branch if carry clear
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    STA $2426            ; 8D 26 24 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_073
; Address: $C583AA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_073:
    JSL $C2B9A6          ; 22 A6 B9 C2 | Jump to subroutine long
    TAX                  ; AA | Transfer accumulator to X register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    DEX                  ; CA | Decrement X register
    BMI $15              ; 30 15 | Branch if negative
    PHX                  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_074
; Address: $C583B6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_074:
    JSL $C2AF66          ; 22 66 AF C2 | Jump to subroutine long
    TXA                  ; 8A | Transfer X register to accumulator
    LDX $00              ; A6 00 | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_075
; Address: $C583BD
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_075:
    SEP #$20             ; E2 20 | Set processor status bits
    STA $243E,X          ; 9D 3E 24 | Store accumulator to absolute,X
    REP #$20             ; C2 20 | Reset processor status bits
    PLX                  ; FA | Pull X register from stack
    INC $00              ; E6 00 | Increment (zero page)
    INY                  ; C8 | Increment Y register
    BRA $E8              ; 80 E8 | Branch always
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_077
; Address: $C583D7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_077:
    JSL $C2CB32          ; 22 32 CB C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    BEQ $16              ; F0 16 | Branch if equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_079
; Address: $C583E6
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_079:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP $2426            ; CD 26 24 | Compare accumulator (absolute)
    BNE $09              ; D0 09 | Branch if not equal
    TYA                  ; 98 | Transfer Y register to accumulator
    SEP #$20             ; E2 20 | Set processor status bits
    STA $243E,X          ; 9D 3E 24 | Store accumulator to absolute,X
    REP #$20             ; C2 20 | Reset processor status bits
    INX                  ; E8 | Increment X register
    INY                  ; C8 | Increment Y register
    CPY #$18             ; C0 18 | Compare Y register (immediate)
    BCC $DA              ; 90 DA | Branch if carry clear
    STX $00              ; 86 00 | Store X register to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_07A
; Address: $C58400
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_07A:
    LDA $243E,Y          ; B9 3E 24 | Load from absolute,Y into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP #$18             ; C9 18 | Compare accumulator (immediate)
    BCS $19              ; B0 19 | Branch if carry set
    STA $23E8            ; 8D E8 23 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_07B
; Address: $C5840E
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_07B:
    JSL $C2CA04          ; 22 04 CA C2 | Jump to subroutine long
    LDA $00              ; A5 00 | Load from zero page into accumulator
    AND $23EA            ; 2D EA 23 | Logical AND with accumulator (absolute)
    STA $00              ; 85 00 | Store accumulator to zero page
    LDA $02              ; A5 02 | Load from zero page into accumulator
    AND $23EC            ; 2D EC 23 | Logical AND with accumulator (absolute)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    BEQ $02              ; F0 02 | Branch if equal
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_07D
; Address: $C58426
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_07D:
    PHY                  ; 5A | Push Y register to stack
    LDX $23EE            ; AE EE 23 | Load from absolute address into X register
    LDY $23E8            ; AC E8 23 | Load from absolute address into Y register
    STY $2428            ; 8C 28 24 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_07E
; Address: $C58430
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_07E:
    JSL $C2CB32          ; 22 32 CB C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    BEQ $2A              ; F0 2A | Branch if equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_087
; Address: $C5845C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_087:
    JSR $84F2            ; 20 F2 84 | Jump to subroutine
    BCS $03              ; B0 03 | Branch if carry set
    PLY                  ; 7A | Pull Y register from stack
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_088
; Address: $C58464
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_088:
    PLY                  ; 7A | Pull Y register from stack
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_089
; Address: $C58467
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_089:
    CPX #$CA             ; E0 CA | Compare X register (immediate)
    BEQ $02              ; F0 02 | Branch if equal
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_08A
; Address: $C5846E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_08A:
    CPY $23E4            ; CC E4 23 | Compare Y register (absolute)
    BNE $F9              ; D0 F9 | Branch if not equal
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_08B
; Address: $C58475
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_08B:
    JSL $C2CED4          ; 22 D4 CE C2 | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    PEA #$23AD           ; F4 AD 23 | Push effective address to stack
    PEA #$0010           ; F4 10 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_08D
; Address: $C5848A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_08D:
    PEA #$23AD           ; F4 AD 23 | Push effective address to stack
    PEA #$0008           ; F4 08 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_092
; Address: $C584A6
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_092:
    JSL $C1A87A          ; 22 7A A8 C1 | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    PEA #$23AD           ; F4 AD 23 | Push effective address to stack
    PEA #$0008           ; F4 08 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_094
; Address: $C584BB
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_094:
    PEA #$23AD           ; F4 AD 23 | Push effective address to stack
    PEA #$0002           ; F4 02 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_095
; Address: $C584C4
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_095:
    JSL $C9029E          ; 22 9E 02 C9 | Jump to subroutine long
    BNE $13              ; D0 13 | Branch if not equal
    INC $23DA            ; EE DA 23 | Increment (absolute)
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    PEA #$23AD           ; F4 AD 23 | Push effective address to stack
    PEA #$0002           ; F4 02 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_097
; Address: $C584DE
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_097:
    JSL $C2CC25          ; 22 25 CC C2 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    BNE $05              ; D0 05 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_09B
; Address: $C584FB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_09B:
    JSR $854B            ; 20 4B 85 | Jump to subroutine
    BCC $03              ; 90 03 | Branch if carry clear
    PLY                  ; 7A | Pull Y register from stack
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_09D
; Address: $C58504
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_09D:
    JSL $C2B6D9          ; 22 D9 B6 C2 | Jump to subroutine long
    LDA #$0E             ; A9 0E | Load immediate value into accumulator
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_09F
; Address: $C58511
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_09F:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BCS $05              ; B0 05 | Branch if carry set
    LDA #$0D             ; A9 0D | Load immediate value into accumulator
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0A3
; Address: $C5852A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0A3:
    JSL $C2CC47          ; 22 47 CC C2 | Jump to subroutine long
    ADC $0218,Y          ; 79 18 02 | Add with carry (absolute,Y)
    BEQ $15              ; F0 15 | Branch if equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0A4
; Address: $C58534
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0A4:
    JSL $C2CB32          ; 22 32 CB C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    BEQ $0B              ; F0 0B | Branch if equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0A5
; Address: $C5853E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0A5:
    JSL $C012D1          ; 22 D1 12 C0 | Jump to subroutine long
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $02              ; D0 02 | Branch if not equal
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0A8
; Address: $C58550
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0A8:
    JSL $C2CC47          ; 22 47 CC C2 | Jump to subroutine long
    PLY                  ; 7A | Pull Y register from stack
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    BEQ $22              ; F0 22 | Branch if equal
    LDA $2428            ; AD 28 24 | Load from absolute address into accumulator
    PHA                  ; 48 | Push accumulator to stack
    STY $2428            ; 8C 28 24 | Store Y register to absolute address
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    STA $242C            ; 8D 2C 24 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0A9
; Address: $C58567
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0A9:
    JSL $C2B87A          ; 22 7A B8 C2 | Jump to subroutine long
    PLA                  ; 68 | Pull accumulator from stack
    STA $2428            ; 8D 28 24 | Store accumulator to absolute address
    BVC $0B              ; 50 0B | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0AA
; Address: $C58571
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0AA:
    JSL $C012D1          ; 22 D1 12 C0 | Jump to subroutine long
    AND #$07             ; 29 07 | Logical AND with accumulator (immediate)
    BNE $02              ; D0 02 | Branch if not equal
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0AC
; Address: $C5857E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0AC:
    JSL $C2CC47          ; 22 47 CC C2 | Jump to subroutine long
    PLY                  ; 7A | Pull Y register from stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BEQ $3B              ; F0 3B | Branch if equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0AE
; Address: $C5858D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0AE:
    JSR $3490            ; 20 90 34 | Jump to subroutine
    PEA #$23AE           ; F4 AE 23 | Push effective address to stack
    PEA #$0008           ; F4 08 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0B0
; Address: $C5859D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0B0:
    BNE $24              ; D0 24 | Branch if not equal
    LDA $23E8            ; AD E8 23 | Load from absolute address into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDA $23E6            ; AD E6 23 | Load from absolute address into accumulator
    STA $23E8            ; 8D E8 23 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0B1
; Address: $C585A9
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0B1:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    ROR $6800            ; 6E 00 68 | Rotate right (absolute)
    STA $23E8            ; 8D E8 23 | Store accumulator to absolute address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    PEA #$23AE           ; F4 AE 23 | Push effective address to stack
    PEA #$0008           ; F4 08 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0B2
; Address: $C585BF
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0B2:
    JSL $C902E9          ; 22 E9 02 C9 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0B3
; Address: $C585C5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0B3:
    PEA #$23AD           ; F4 AD 23 | Push effective address to stack
    PEA #$0004           ; F4 04 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0B4
; Address: $C585CE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0B4:
    JSL $C9029E          ; 22 9E 02 C9 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    BNE $2F              ; D0 2F | Branch if not equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0B8
; Address: $C585E7
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0B8:
    JSR $8605            ; 20 05 86 | Jump to subroutine
    LDY $23E4            ; AC E4 23 | Load from absolute address into Y register
    STY $2428            ; 8C 28 24 | Store Y register to absolute address
    STY $23E8            ; 8C E8 23 | Store Y register to absolute address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    PEA #$23AD           ; F4 AD 23 | Push effective address to stack
    PEA #$0004           ; F4 04 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0B9
; Address: $C585FF
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0B9:
    JSL $C902E9          ; 22 E9 02 C9 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0BC
; Address: $C5860B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0BC:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BCC $08              ; 90 08 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0BD
; Address: $C58613
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0BD:
    JSL $C1E32E          ; 22 2E E3 C1 | Jump to subroutine long
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    BRA $21              ; 80 21 | PPU graphics register access
    LDX #$43             ; A2 43 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0BE
; Address: $C5861E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0BE:
    JSL $C2CC03          ; 22 03 CC C2 | Jump to subroutine long
    JMP ($8D18)          ; 6C 18 8D | Jump to address (absolute indirect)
    JMP $A94F            ; 4C 4F A9 | Jump to address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0C2
; Address: $C58638
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0C2:
    JSL $C48D49          ; 22 49 8D C4 | Jump to subroutine long
    LDA #$55             ; A9 55 | Load immediate value into accumulator
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0C4
; Address: $C58645
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0C4:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BCC $05              ; 90 05 | Branch if carry clear
    LDA #$56             ; A9 56 | Load immediate value into accumulator
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0C5
; Address: $C58653
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0C5:
    JSL $C1A87A          ; 22 7A A8 C1 | Jump to subroutine long
    PLX                  ; FA | Pull X register from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0C7
; Address: $C5865E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0C7:
    JSL $C2CC47          ; 22 47 CC C2 | Jump to subroutine long
    SEI                  ; 78 | Set interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    BRA $00              ; 80 00 | Branch always
    BNE $11              ; D0 11 | Branch if not equal
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0C8
; Address: $C5866A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0C8:
    PEA #$23AD           ; F4 AD 23 | Push effective address to stack
    PEA #$0040           ; F4 40 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0C9
; Address: $C58673
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0C9:
    JSL $C9029E          ; 22 9E 02 C9 | Jump to subroutine long
    BEQ $EF              ; F0 EF | Branch if equal
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0CB
; Address: $C5867C
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0CB:
    JSL $C2CB32          ; 22 32 CB C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    BPL $00              ; 10 00 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    BEQ $07              ; F0 07 | Branch if equal
    CPY $23E4            ; CC E4 23 | Compare Y register (absolute)
    CLC                  ; 18 | Clear carry flag
    BEQ $01              ; F0 01 | Branch if equal
    SEC                  ; 38 | Set carry flag
    PLX                  ; FA | Pull X register from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0CF
; Address: $C5869F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0CF:
    JSL $C2B774          ; 22 74 B7 C2 | Jump to subroutine long
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $25              ; F0 25 | Branch if equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0D6
; Address: $C586C8
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0D6:
    JSR $86DB            ; 20 DB 86 | Jump to subroutine
    BCC $02              ; 90 02 | Branch if carry clear
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0D8
; Address: $C586D3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0D8:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    BPL $00              ; 10 00 | Branch if positive
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0DA
; Address: $C586E0
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0DA:
    JSR $000C            ; 20 0C 00 | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    BEQ $05              ; F0 05 | Branch if equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0DB
; Address: $C586E6
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0DB:
    JSL $C012D1          ; 22 D1 12 C0 | Jump to subroutine long
    LSR                  ; 4A | Logical shift right (accumulator)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0DC
; Address: $C586EC
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0DC:
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    LDA $2428            ; AD 28 24 | Load from absolute address into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDA $23E4            ; AD E4 23 | Load from absolute address into accumulator
    STA $2428            ; 8D 28 24 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0DD
; Address: $C586F8
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0DD:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    PLP                  ; 28 | Pull processor status from stack
    BCC $37              ; 90 37 | Branch if carry clear
    LDX $23E4            ; AE E4 23 | Load from absolute address into X register
    LDY $23E8            ; AC E8 23 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0DF
; Address: $C5870A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0DF:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BCS $0F              ; B0 0F | Branch if carry set

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0E1
; Address: $C58717
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0E1:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BCS $17              ; B0 17 | Branch if carry set

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0E4
; Address: $C58726
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0E4:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BCC $08              ; 90 08 | Branch if carry clear
    PLA                  ; 68 | Pull accumulator from stack
    STA $2428            ; 8D 28 24 | Store accumulator to absolute address
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0E5
; Address: $C58736
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0E5:
    PLA                  ; 68 | Pull accumulator from stack
    STA $2428            ; 8D 28 24 | Store accumulator to absolute address
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0E8
; Address: $C58749
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0E8:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    LDA #$3F             ; A9 3F | Load immediate value into accumulator
    BCS $03              ; B0 03 | Branch if carry set
    LDA #$2F             ; A9 2F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0E9
; Address: $C58757
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0E9:
    JSL $C0133E          ; 22 3E 13 C0 | Jump to subroutine long
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0EB
; Address: $C58763
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0EB:
    JSL $C2B8AA          ; 22 AA B8 C2 | Jump to subroutine long
    LDA $242C            ; AD 2C 24 | Load from absolute address into accumulator
    LDX #$08             ; A2 08 | Load immediate value into X register
    BIT #$87             ; 89 87 | Test bits in accumulator (immediate)
    REP #$F0             ; C2 F0 | Reset processor status bits
    PHP                  ; 08 | Push processor status to stack
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    BPL $F4              ; 10 F4 | Branch if positive
    BRA $0B              ; 80 0B | Branch always
    LDA                  ; BF 8B 87 C2 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0EC
; Address: $C5877F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0EC:
    JSL $C0133E          ; 22 3E 13 C0 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    BEQ $01              ; F0 01 | Branch if equal
    SEC                  ; 38 | Set carry flag
    PLX                  ; FA | Pull X register from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0F0
; Address: $C5879D
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0F0:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BCS $0A              ; B0 0A | Branch if carry set
    LDA $23AE            ; AD AE 23 | Load from absolute address into accumulator
    AND #$7F             ; 29 7F | Logical AND with accumulator (immediate)
    STA $23AE            ; 8D AE 23 | Store accumulator to absolute address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0F1
; Address: $C587AF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0F1:
    LDA $23AE            ; AD AE 23 | Load from absolute address into accumulator
    ORA #$80             ; 09 80 | Logical OR with accumulator (immediate)
    STA $23AE            ; 8D AE 23 | Store accumulator to absolute address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0F2
; Address: $C587B9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0F2:
    PHY                  ; 5A | Push Y register to stack
    PEA #$2011           ; F4 11 20 | Push effective address to stack
    PEA #$0020           ; F4 20 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0F3
; Address: $C587C3
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0F3:
    JSL $C9029E          ; 22 9E 02 C9 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    BNE $67              ; D0 67 | Branch if not equal
    LDA $23F2            ; AD F2 23 | Load from absolute address into accumulator
    CLC                  ; 18 | Clear carry flag
    BNE $61              ; D0 61 | Branch if not equal
    LDX $23EE            ; AE EE 23 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0F4
; Address: $C587D3
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0F4:
    JSL $C2CC47          ; 22 47 CC C2 | Jump to subroutine long
    PLY                  ; 7A | Pull Y register from stack
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    BEQ $53              ; F0 53 | Branch if equal
    LDA $23E4            ; AD E4 23 | Load from absolute address into accumulator
    STA $2428            ; 8D 28 24 | Store accumulator to absolute address
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0F5
; Address: $C587E7
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0F5:
    JSL $C2B8AA          ; 22 AA B8 C2 | Jump to subroutine long
    LDA $242C            ; AD 2C 24 | Load from absolute address into accumulator
    CMP #$09             ; C9 09 | Compare accumulator (immediate)
    BEQ $06              ; F0 06 | Branch if equal
    CMP #$31             ; C9 31 | Compare accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    BNE $38              ; D0 38 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0F6
; Address: $C587F9
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0F6:
    JSL $C012D1          ; 22 D1 12 C0 | Jump to subroutine long
    AND #$0F             ; 29 0F | Logical AND with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    BNE $2E              ; D0 2E | Branch if not equal
    LDA $23E8            ; AD E8 23 | Load from absolute address into accumulator
    STA $2428            ; 8D 28 24 | Store accumulator to absolute address
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    STA $00              ; 85 00 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0F8
; Address: $C58812
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0F8:
    ASL $22              ; 06 22 | Arithmetic shift left (zero page)
    LDA $ADC2,Y          ; B9 C2 AD | Load from absolute,Y into accumulator
    INC $4823            ; EE 23 48 | Increment (absolute)
    LDA #$18             ; A9 18 | Load immediate value into accumulator
    STA $23EE            ; 8D EE 23 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0F9
; Address: $C58821
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0F9:
    JSL $C2CFCE          ; 22 CE CF C2 | Jump to subroutine long
    PLA                  ; 68 | Pull accumulator from stack
    STA $23EE            ; 8D EE 23 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0FB
; Address: $C5882C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0FB:
    JSL $C2B054          ; 22 54 B0 C2 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    PLY                  ; 7A | Pull Y register from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0FD
; Address: $C58839
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0FD:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    BVC $01              ; 50 01 | Branch if overflow clear
    LDA #$51             ; A9 51 | Load immediate value into accumulator
    ORA ($48,X)          ; 01 48 | Logical OR with accumulator ((zero page,X))
    LDX $23E8            ; AE E8 23 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_0FF
; Address: $C5884B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_0FF:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BCC $05              ; 90 05 | Branch if carry clear
    LDA #$52             ; A9 52 | Load immediate value into accumulator
    ORA ($83,X)          ; 01 83 | Logical OR with accumulator ((zero page,X))
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_101
; Address: $C5885E
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_101:
    PHY                  ; 5A | Push Y register to stack
    SEP #$20             ; E2 20 | Set processor status bits
    LDA #$C2             ; A9 C2 | Load immediate value into accumulator
    PHA                  ; 48 | Push accumulator to stack
    REP #$20             ; C2 20 | Reset processor status bits
    LDA #$8E             ; A9 8E | Load immediate value into accumulator
    DEY                  ; 88 | Decrement Y register
    DEC                  ; 3A | Decrement accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDX $23EE            ; AE EE 23 | Load from absolute address into X register
    SEP #$20             ; E2 20 | Set processor status bits

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_102
; Address: $C58870
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_102:
    JSL $C903EE          ; 22 EE 03 C9 | Jump to subroutine long
    ORA $6000,X          ; 1D 00 60 | Logical OR with accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag
    REP #$08             ; C2 08 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    REP #$20             ; C2 20 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_103
; Address: $C5887F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_103:
    JSL $C903EE          ; 22 EE 03 C9 | Jump to subroutine long
    ORA $6000,X          ; 1D 00 60 | Logical OR with accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag
    REP #$06             ; C2 06 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_104
; Address: $C5888B
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_104:
    DEC                  ; 3A | Decrement accumulator
    PHA                  ; 48 | Push accumulator to stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_105
; Address: $C5888E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_105:
    BCC $21              ; 90 21 | PPU graphics register access
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    PEA #$23AD           ; F4 AD 23 | Push effective address to stack
    PEA #$0001           ; F4 01 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_106
; Address: $C5889C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_106:
    JSL $C902E9          ; 22 E9 02 C9 | Jump to subroutine long
    PEA #$23AE           ; F4 AE 23 | Push effective address to stack
    PEA #$0002           ; F4 02 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_108
; Address: $C588AD
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_108:
    JSL $C2CF00          ; 22 00 CF C2 | Jump to subroutine long
    PLY                  ; 7A | Pull Y register from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_109
; Address: $C588B3
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_109:
    LDA $2458            ; AD 58 24 | Load from absolute address into accumulator
    STA $00              ; 85 00 | Store accumulator to zero page
    LDA $245A            ; AD 5A 24 | Load from absolute address into accumulator
    STA $02              ; 85 02 | Store accumulator to zero page
    LDA $23E8            ; AD E8 23 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_10A
; Address: $C588C0
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_10A:
    JSL $C2CA46          ; 22 46 CA C2 | Jump to subroutine long
    LDA $00              ; A5 00 | Load from zero page into accumulator
    STA $2458            ; 8D 58 24 | Store accumulator to absolute address
    LDA $02              ; A5 02 | Load from zero page into accumulator
    STA $245A            ; 8D 5A 24 | Store accumulator to absolute address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_10B
; Address: $C588CF
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_10B:
    PHY                  ; 5A | Push Y register to stack
    LDA $23FA            ; AD FA 23 | Load from absolute address into accumulator
    BEQ $27              ; F0 27 | Branch if equal
    LDY $23E8            ; AC E8 23 | Load from absolute address into Y register
    STY $2428            ; 8C 28 24 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_10C
; Address: $C588DB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_10C:
    JSL $C2CB32          ; 22 32 CB C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    BEQ $17              ; F0 17 | Branch if equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_10D
; Address: $C588E5
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_10D:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    BCS $10              ; B0 10 | Branch if carry set
    LDX #$04             ; A2 04 | Load immediate value into X register
    LDA $23EE            ; AD EE 23 | Load from absolute address into accumulator
    BIT #$C2             ; 89 C2 | Test bits in accumulator (immediate)
    BEQ $06              ; F0 06 | Branch if equal
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    BPL $F6              ; 10 F6 | Branch if positive
    PLY                  ; 7A | Pull Y register from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_10E
; Address: $C588FF
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_10E:
    ORA #$89             ; 09 89 | Logical OR with accumulator (immediate)
    PLY                  ; 7A | Pull Y register from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_110
; Address: $C5890A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_110:
    BIT #$3E             ; 89 3E | Test bits in accumulator (immediate)
    BIT #$56             ; 89 56 | Test bits in accumulator (immediate)
    BIT #$22             ; 89 22 | Test bits in accumulator (immediate)
    ASL $A4              ; 06 A4 | Arithmetic shift left (zero page)
    REP #$90             ; C2 90 | Reset processor status bits
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_112
; Address: $C5891B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_112:
    JSL $C2B977          ; 22 77 B9 C2 | Jump to subroutine long
    LDA #$41             ; A9 41 | Load immediate value into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDY $23E8            ; AC E8 23 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_114
; Address: $C5892B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_114:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BCS $05              ; B0 05 | Branch if carry set
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_11D
; Address: $C58966
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_11D:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_11E
; Address: $C5896D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_11E:
    LDA $23F2            ; AD F2 23 | Load from absolute address into accumulator
    BNE $52              ; D0 52 | Branch if not equal
    LDX $23EE            ; AE EE 23 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_11F
; Address: $C58975
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_11F:
    JSL $C2CC25          ; 22 25 CC C2 | Jump to subroutine long
    ADC $0818,Y          ; 79 18 08 | Add with carry (absolute,Y)
    BEQ $45              ; F0 45 | Branch if equal
    LDX $23E4            ; AE E4 23 | Load from absolute address into X register
    STX $2428            ; 8E 28 24 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_120
; Address: $C58985
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_120:
    JSL $C2CB2B          ; 22 2B CB C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    BEQ $35              ; F0 35 | Branch if equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_121
; Address: $C5898F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_121:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    BCS $2E              ; B0 2E | Branch if carry set
    LDA #$15             ; A9 15 | Load immediate value into accumulator
    STA $242C            ; 8D 2C 24 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_122
; Address: $C5899C
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_122:
    JSL $C2B87A          ; 22 7A B8 C2 | Jump to subroutine long
    BVC $22              ; 50 22 | Branch if overflow clear
    LDA $23FA            ; AD FA 23 | Load from absolute address into accumulator
    BEQ $1D              ; F0 1D | Branch if equal
    PHA                  ; 48 | Push accumulator to stack
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    INC                  ; 1A | Increment accumulator
    STA $23FA            ; 8D FA 23 | Store accumulator to absolute address
    LDA $23E8            ; AD E8 23 | Load from absolute address into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDA $23E4            ; AD E4 23 | Load from absolute address into accumulator
    STA $23E8            ; 8D E8 23 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_123
; Address: $C589B8
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_123:
    JSL $C29200          ; 22 00 92 C2 | Jump to subroutine long
    PLA                  ; 68 | Pull accumulator from stack
    STA $23E8            ; 8D E8 23 | Store accumulator to absolute address
    PLA                  ; 68 | Pull accumulator from stack
    STA $23FA            ; 8D FA 23 | Store accumulator to absolute address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_124
; Address: $C589C5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_124:
    LDA $23F2            ; AD F2 23 | Load from absolute address into accumulator
    BNE $61              ; D0 61 | Branch if not equal
    LDX $23EE            ; AE EE 23 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_125
; Address: $C589CD
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_125:
    JSL $C2CC47          ; 22 47 CC C2 | Jump to subroutine long
    ADC $0818,Y          ; 79 18 08 | Add with carry (absolute,Y)
    BEQ $54              ; F0 54 | Branch if equal
    LDX $23E4            ; AE E4 23 | Load from absolute address into X register
    STX $2428            ; 8E 28 24 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_126
; Address: $C589DD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_126:
    JSL $C2CB2B          ; 22 2B CB C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    BEQ $44              ; F0 44 | Branch if equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_127
; Address: $C589E7
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_127:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    BCS $3D              ; B0 3D | Branch if carry set
    LDX $23E8            ; AE E8 23 | Load from absolute address into X register
    STX $2428            ; 8E 28 24 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_128
; Address: $C589F4
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_128:
    JSL $C2CB2B          ; 22 2B CB C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    BEQ $2D              ; F0 2D | Branch if equal
    LDA #$53             ; A9 53 | Load immediate value into accumulator
    STA $242C            ; 8D 2C 24 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_129
; Address: $C58A04
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_129:
    JSL $C2B87A          ; 22 7A B8 C2 | Jump to subroutine long
    BVC $21              ; 50 21 | PPU graphics register access
    LDA $23FA            ; AD FA 23 | Load from absolute address into accumulator
    BEQ $1C              ; F0 1C | Branch if equal
    PHA                  ; 48 | Push accumulator to stack
    LSR                  ; 4A | Logical shift right (accumulator)
    INC                  ; 1A | Increment accumulator
    STA $23FA            ; 8D FA 23 | Store accumulator to absolute address
    LDA $23E8            ; AD E8 23 | Load from absolute address into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDA $23E4            ; AD E4 23 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_12B
; Address: $C58A1F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_12B:
    JSL $C29200          ; 22 00 92 C2 | Jump to subroutine long
    PLA                  ; 68 | Pull accumulator from stack
    STA $23E8            ; 8D E8 23 | Store accumulator to absolute address
    PLA                  ; 68 | Pull accumulator from stack
    STA $23FA            ; 8D FA 23 | Store accumulator to absolute address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_12C
; Address: $C58A2C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_12C:
    LDA $23F2            ; AD F2 23 | Load from absolute address into accumulator
    BNE $64              ; D0 64 | Branch if not equal
    LDA $23FA            ; AD FA 23 | Load from absolute address into accumulator
    BEQ $5F              ; F0 5F | Branch if equal
    LDX $23EE            ; AE EE 23 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_12D
; Address: $C58A39
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_12D:
    JSL $C2CC47          ; 22 47 CC C2 | Jump to subroutine long
    ADC $0818,Y          ; 79 18 08 | Add with carry (absolute,Y)
    BEQ $52              ; F0 52 | Branch if equal
    LDX $23E8            ; AE E8 23 | Load from absolute address into X register
    STX $2428            ; 8E 28 24 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_12E
; Address: $C58A49
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_12E:
    JSL $C2CB2B          ; 22 2B CB C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    BEQ $42              ; F0 42 | Hardware register operation
    LDA #$69             ; A9 69 | Load immediate value into accumulator
    STA $242C            ; 8D 2C 24 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_12F
; Address: $C58A59
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_12F:
    JSL $C2B87A          ; 22 7A B8 C2 | Jump to subroutine long
    BVC $36              ; 50 36 | Branch if overflow clear
    LDA $23E8            ; AD E8 23 | Load from absolute address into accumulator
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_131
; Address: $C58A68
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_131:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BCS $07              ; B0 07 | Branch if carry set

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_132
; Address: $C58A70
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_132:
    JSL $C2C739          ; 22 39 C7 C2 | Jump to subroutine long
    ASL $80              ; 06 80 | Arithmetic shift left (zero page)
    ORA $22              ; 05 22 | Logical OR with accumulator (zero page)
    AND $C2C7,Y          ; 39 C7 C2 | Logical AND with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_134
; Address: $C58A84
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_134:
    JSL $C01407          ; 22 07 14 C0 | Jump to subroutine long
    BCC $07              ; 90 07 | Branch if carry clear
    STA $23E8            ; 8D E8 23 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_135
; Address: $C58A8D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_135:
    JSL $C29200          ; 22 00 92 C2 | Jump to subroutine long
    PLA                  ; 68 | Pull accumulator from stack
    STA $23E8            ; 8D E8 23 | Store accumulator to absolute address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_136
; Address: $C58A96
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_136:
    LDX #$24             ; A2 24 | Load immediate value into X register
    LDA $23EE            ; AD EE 23 | Load from absolute address into accumulator
    PLB                  ; AB | Pull data bank register from stack
    TXA                  ; 8A | Transfer X register to accumulator
    REP #$F0             ; C2 F0 | Reset processor status bits
    ORA $CA              ; 05 CA | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_137
; Address: $C58AA3
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_137:
    DEX                  ; CA | Decrement X register
    BPL $F6              ; 10 F6 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_139
; Address: $C58AAB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_139:
    INC                  ; 1A | Increment accumulator
    WDM #$00             ; 42 00 | Reserved instruction
    LSR                  ; 4A | Logical shift right (accumulator)
    EOR $8600            ; 4D 00 86 | Exclusive OR with accumulator (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_13A
; Address: $C58ABD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_13A:
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    STZ $00              ; 64 00 | Store zero to zero page
    ADC $00              ; 65 00 | Add with carry (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_13B
; Address: $C58ACB
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_13B:
    BVC $00              ; 50 00 | Branch if overflow clear
    EOR ($00),Y          ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
    ROR                  ; 6A | Rotate right (accumulator)
    PHB                  ; 8B | Push data bank register to stack
    PHB                  ; 8B | Push data bank register to stack
    DEX                  ; CA | Decrement X register
    PHB                  ; 8B | Push data bank register to stack
    PHB                  ; 8B | Push data bank register to stack
    INC $158B,X          ; FE 8B 15 | Increment (absolute,X)
    STY $8AF7            ; 8C F7 8A | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_13C
; Address: $C58ADF
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_13C:
    JSL $8CA38C          ; 22 8C A3 8C | Jump to subroutine long
    SBC ($8C),Y          ; F1 8C | Subtract with carry ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    STY $8CFF            ; 8C FF 8C | Store Y register to absolute address
    ASL $8D              ; 06 8D | Arithmetic shift left (zero page)
    ORA $4D8D            ; 0D 8D 4D | Logical OR with accumulator (absolute)
    STA $8D71            ; 8D 71 8D | Store accumulator to absolute address
    EOR $478B,X          ; 5D 8B 47 | Exclusive OR with accumulator (absolute,X)
    PHB                  ; 8B | Push data bank register to stack
    TXA                  ; 8A | Transfer X register to accumulator
    LDX #$00             ; A2 00 | Load immediate value into X register
    PEA #$2011           ; F4 11 20 | Push effective address to stack
    PEA #$0080           ; F4 80 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_13E
; Address: $C58B09
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_13E:
    JSL $C1D13B          ; 22 3B D1 C1 | Jump to subroutine long
    BNE $27              ; D0 27 | Branch if not equal
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    PEA #$23AB           ; F4 AB 23 | Push effective address to stack
    PEA #$000F           ; F4 0F 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_13F
; Address: $C58B1B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_13F:
    JSL $C902E9          ; 22 E9 02 C9 | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    PEA #$23AE           ; F4 AE 23 | Push effective address to stack
    PEA #$0002           ; F4 02 00 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_143
; Address: $C58B36
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_143:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF 41 8B C2 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_145
; Address: $C58B41
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_145:
    EOR ($01,X)          ; 41 01 | Exclusive OR with accumulator ((zero page,X))
    CLI                  ; 58 | Clear interrupt disable flag
    PEA #$23AE           ; F4 AE 23 | Push effective address to stack
    PEA #$0002           ; F4 02 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_147
; Address: $C58B56
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_147:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    EOR ($01,X)          ; 41 01 | Exclusive OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_149
; Address: $C58B63
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_149:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    SEI                  ; 78 | Set interrupt disable flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_14C
; Address: $C58B71
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_14C:
    PEA #$23AE           ; F4 AE 23 | Push effective address to stack
    PEA #$0004           ; F4 04 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_14D
; Address: $C58B7A
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_14D:
    JSL $C9029E          ; 22 9E 02 C9 | Jump to subroutine long
    BEQ $25              ; F0 25 | Branch if equal
    LDA $23E4            ; AD E4 23 | Load from absolute address into accumulator
    STA $2428            ; 8D 28 24 | Store accumulator to absolute address
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    STA $00              ; 85 00 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_154
; Address: $C58BA7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_154:
    LDA #$03             ; A9 03 | Load immediate value into accumulator
    PEA #$23AC           ; F4 AC 23 | Push effective address to stack
    PEA #$0018           ; F4 18 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_158
; Address: $C58BC3
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_158:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    ADC $6000            ; 6D 00 60 | Add with carry (absolute)
    LDA $23E6            ; AD E6 23 | Load from absolute address into accumulator
    STA $23E8            ; 8D E8 23 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_15B
; Address: $C58BD7
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_15B:
    LDA $23E4            ; AD E4 23 | Load from absolute address into accumulator
    PEA #$23AA           ; F4 AA 23 | Push effective address to stack
    PEA #$00FF           ; F4 FF 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_15C
; Address: $C58BE3
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_15C:
    JSL $C902E9          ; 22 E9 02 C9 | Jump to subroutine long
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    PEA #$23AC           ; F4 AC 23 | Push effective address to stack
    PEA #$0007           ; F4 07 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_15F
; Address: $C58BFE
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_15F:
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    PEA #$23AE           ; F4 AE 23 | Push effective address to stack
    PEA #$0040           ; F4 40 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_164
; Address: $C58C22
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_164:
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $2484            ; 8D 84 24 | Store accumulator to absolute address
    STA $2486            ; 8D 86 24 | Store accumulator to absolute address
    STA $2488            ; 8D 88 24 | Store accumulator to absolute address
    STA $248A            ; 8D 8A 24 | Store accumulator to absolute address
    STA $4054            ; 8D 54 40 | Store accumulator to absolute address
    INC                  ; 1A | Increment accumulator
    STA $4056            ; 8D 56 40 | Store accumulator to absolute address
    INC                  ; 1A | Increment accumulator
    STA $4058            ; 8D 58 40 | Store accumulator to absolute address
    INC                  ; 1A | Increment accumulator
    STA $405A            ; 8D 5A 40 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_165
; Address: $C58C40
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_165:
    JSL $C4297C          ; 22 7C 29 C4 | Jump to subroutine long
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    DEX                  ; CA | Decrement X register
    BMI $0F              ; 30 0F | Branch if negative

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_166
; Address: $C58C49
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_166:
    TXA                  ; 8A | Transfer X register to accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_167
; Address: $C58C4C
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_167:
    JSL $C43115          ; 22 15 31 C4 | Jump to subroutine long
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    STA $2484,Y          ; 99 84 24 | Store accumulator to absolute,Y
    BRA $EE              ; 80 EE | Branch always
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $2484,X          ; BD 84 24 | Load from absolute,X into accumulator
    CMP $2486,Y          ; D9 86 24 | Compare accumulator (absolute,Y)
    BCS $1C              ; B0 1C | Branch if carry set
    LDA $2484,X          ; BD 84 24 | Load from absolute,X into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDA $2486,Y          ; B9 86 24 | Load from absolute,Y into accumulator
    STA $2484,X          ; 9D 84 24 | Store accumulator to absolute,X
    PLA                  ; 68 | Pull accumulator from stack
    STA $2486,Y          ; 99 86 24 | Store accumulator to absolute,Y
    LDA $4054,X          ; BD 54 40 | Load from absolute,X into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDA $4056,Y          ; B9 56 40 | Load from absolute,Y into accumulator
    STA $4054,X          ; 9D 54 40 | Store accumulator to absolute,X
    PLA                  ; 68 | Pull accumulator from stack
    STA $4056,Y          ; 99 56 40 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    CPY #$06             ; C0 06 | Compare Y register (immediate)
    BCC $D5              ; 90 D5 | Branch if carry clear
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$06             ; E0 06 | Compare X register (immediate)
    BCC $CD              ; 90 CD | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_169
; Address: $C58C92
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_169:
    JSL $C2B977          ; 22 77 B9 C2 | Jump to subroutine long
    LDA #$42             ; A9 42 | Hardware register operation
    STA $23E8            ; 8D E8 23 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_16A
; Address: $C58C9C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_16A:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    ADC $6000,Y          ; 79 00 60 | Add with carry (absolute,Y)
    LDX $23E4            ; AE E4 23 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_16B
; Address: $C58CA6
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_16B:
    JSL $C2CAD9          ; 22 D9 CA C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BNE $3A              ; D0 3A | Branch if not equal
    STA $241E            ; 8D 1E 24 | Store accumulator to absolute address
    STA $2422            ; 8D 22 24 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_16C
; Address: $C58CB6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_16C:
    JSL $C2CA5B          ; 22 5B CA C2 | Jump to subroutine long
    EOR #$20             ; 49 20 | Exclusive OR with accumulator (immediate)
    STA $2420            ; 8D 20 24 | Store accumulator to absolute address
    STA $2424            ; 8D 24 24 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_170
; Address: $C58CCD
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_170:
    JSL $C2AB00          ; 22 00 AB C2 | Jump to subroutine long
    LDA $2428            ; AD 28 24 | Load from absolute address into accumulator
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    BEQ $11              ; F0 11 | Branch if equal
    STA $23E8            ; 8D E8 23 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_171
; Address: $C58CDC
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_171:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    STA $28AE00          ; 8F 00 AE 28 | Store accumulator to absolute long address
    BIT $22              ; 24 22 | Test bits in accumulator (zero page)
    AND $C2B5            ; 2D B5 C2 | Logical AND with accumulator (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_172
; Address: $C58CEA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_172:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    BCC $00              ; 90 00 | Branch if carry clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_17D
; Address: $C58D14
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_17D:
    STA $2420            ; 8D 20 24 | Store accumulator to absolute address
    STA $2424            ; 8D 24 24 | Store accumulator to absolute address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $241E            ; 8D 1E 24 | Store accumulator to absolute address
    STA $2422            ; 8D 22 24 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_17F
; Address: $C58D29
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_17F:
    JSL $C2AB00          ; 22 00 AB C2 | Jump to subroutine long
    LDA $2428            ; AD 28 24 | Load from absolute address into accumulator
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    BEQ $11              ; F0 11 | Branch if equal
    STA $23E8            ; 8D E8 23 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_180
; Address: $C58D38
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_180:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    STA $28AE00          ; 8F 00 AE 28 | Store accumulator to absolute long address
    BIT $22              ; 24 22 | Test bits in accumulator (zero page)
    AND $C2B5            ; 2D B5 C2 | Logical AND with accumulator (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_181
; Address: $C58D46
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_181:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    BCC $00              ; 90 00 | Branch if carry clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_183
; Address: $C58D50
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_183:
    PEA #$23AE           ; F4 AE 23 | Push effective address to stack
    PEA #$0040           ; F4 40 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_184
; Address: $C58D59
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_184:
    JSL $C902E9          ; 22 E9 02 C9 | Jump to subroutine long
    PEA #$23AC           ; F4 AC 23 | Push effective address to stack
    PEA #$0018           ; F4 18 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_186
; Address: $C58D6A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_186:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    DEY                  ; 88 | Decrement Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_187
; Address: $C58D71
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_187:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    EOR ($01,X)          ; 41 01 | Exclusive OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_188
; Address: $C58D78
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_188:
    LDA $23F6            ; AD F6 23 | Load from absolute address into accumulator
    BEQ $29              ; F0 29 | Branch if equal
    PEA #$23AE           ; F4 AE 23 | Push effective address to stack
    PEA #$0002           ; F4 02 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_189
; Address: $C58D86
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_189:
    JSL $C9029E          ; 22 9E 02 C9 | Jump to subroutine long
    BEQ $1A              ; F0 1A | Branch if equal
    LDA $23F8            ; AD F8 23 | Load from absolute address into accumulator
    STA $242E            ; 8D 2E 24 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_18A
; Address: $C58D92
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_18A:
    JSL $C2B8D7          ; 22 D7 B8 C2 | Jump to subroutine long
    BCC $0E              ; 90 0E | Branch if carry clear
    LDA $242C            ; AD 2C 24 | Load from absolute address into accumulator
    CMP #$85             ; C9 85 | Compare accumulator (immediate)
    BNE $06              ; D0 06 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_18B
; Address: $C58DA0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_18B:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    ORA ($60,X)          ; 01 60 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_18F
; Address: $C58DB6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_18F:
    JSL $C2CA62          ; 22 62 CA C2 | Jump to subroutine long
    EOR ($20,X)          ; 41 20 | Exclusive OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_191
; Address: $C58DC3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_191:
    JSR $0285            ; 20 85 02 | Jump to subroutine
    PHA                  ; 48 | Push accumulator to stack
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    STA $04              ; 85 04 | Store accumulator to zero page
    PLA                  ; 68 | Pull accumulator from stack
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_194
; Address: $C58DD8
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_194:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BCS $04              ; B0 04 | Branch if carry set

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_198
; Address: $C58DEB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_198:
    LDA $00              ; A5 00 | Load from zero page into accumulator
    BMI $15              ; 30 15 | Branch if negative
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BCC $10              ; 90 10 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_19A
; Address: $C58DFB
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_19A:
    JSL $C010D6          ; 22 D6 10 C0 | Jump to subroutine long
    LDA $01              ; A5 01 | Load from zero page into accumulator
    STA $00              ; 85 00 | Store accumulator to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_19B
; Address: $C58E04
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_19B:
    JSL $C012D1          ; 22 D1 12 C0 | Jump to subroutine long
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    STA $00              ; 85 00 | Store accumulator to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_19C
; Address: $C58E0E
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_19C:
    LDA $00              ; A5 00 | Load from zero page into accumulator
    BMI $06              ; 30 06 | Branch if negative
    LDA $04              ; A5 04 | Load from zero page into accumulator
    CMP $00              ; C5 00 | Compare accumulator (zero page)
    BCC $1B              ; 90 1B | Branch if carry clear
    LDA $02              ; A5 02 | Load from zero page into accumulator
    CMP #$10             ; C9 10 | Compare accumulator (immediate)
    BCS $0A              ; B0 0A | Branch if carry set

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_19D
; Address: $C58E1F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_19D:
    JSL $C012D1          ; 22 D1 12 C0 | Jump to subroutine long
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    STA $00              ; 85 00 | Store accumulator to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_19F
; Address: $C58E2C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_19F:
    JSL $C0133E          ; 22 3E 13 C0 | Jump to subroutine long
    STA $00              ; 85 00 | Store accumulator to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1A0
; Address: $C58E33
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1A0:
    LDA $02              ; A5 02 | Load from zero page into accumulator
    CMP #$08             ; C9 08 | Compare accumulator (immediate)
    BCC $E5              ; 90 E5 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1A2
; Address: $C58E41
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1A2:
    JSL $C010D6          ; 22 D6 10 C0 | Jump to subroutine long
    LDA $01              ; A5 01 | Load from zero page into accumulator
    STA $00              ; 85 00 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1A4
; Address: $C58E4A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1A4:
    LDA $23F2            ; AD F2 23 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $13              ; D0 13 | Branch if not equal
    LSR $00              ; 46 00 | Logical shift right (zero page)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    LDA #$02             ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1A5
; Address: $C58E5B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1A5:
    JSL $C0133E          ; 22 3E 13 C0 | Jump to subroutine long
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    ADC $00              ; 65 00 | Add with carry (zero page)
    STA $00              ; 85 00 | Store accumulator to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1A8
; Address: $C58E70
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1A8:
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    PEA #$23AE           ; F4 AE 23 | Push effective address to stack
    PEA #$0010           ; F4 10 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1AB
; Address: $C58E84
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1AB:
    JSL $C28EFB          ; 22 FB 8E C2 | Jump to subroutine long
    LDA $00              ; A5 00 | Load from zero page into accumulator
    STA $23FA            ; 8D FA 23 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1AD
; Address: $C58E92
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1AD:
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDA $23E4            ; AD E4 23 | Load from absolute address into accumulator
    STA $2428            ; 8D 28 24 | Store accumulator to absolute address
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1AE
; Address: $C58EA7
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1AE:
    JSL $C2B8AA          ; 22 AA B8 C2 | Jump to subroutine long
    LDA $242C            ; AD 2C 24 | Load from absolute address into accumulator
    STA $245C            ; 8D 5C 24 | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $23EE            ; AD EE 23 | Load from absolute address into accumulator
    PHB                  ; 8B | Push data bank register to stack
    STA $07F0C2          ; 8F C2 F0 07 | Store accumulator to absolute long address
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1AF
; Address: $C58EBF
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1AF:
    BPL $F6              ; 10 F6 | Branch if positive
    LDX #$00             ; A2 00 | Load immediate value into X register
    BRA $8E              ; 80 8E | Branch always
    LSR $AD24,X          ; 5E 24 AD | Logical shift right (absolute,X)
    INC $0A23            ; EE 23 0A | Increment (absolute)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF 6A 37 C2 | Load from absolute long,X into accumulator
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF 7A 18 C2 | Load from absolute long,X into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BEQ $13              ; F0 13 | Branch if equal
    LDX #$02             ; A2 02 | Load immediate value into X register
    LDA $245C            ; AD 5C 24 | Load from absolute address into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $C28F,Y          ; 99 8F C2 | Store accumulator to absolute,Y
    BEQ $07              ; F0 07 | Branch if equal
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    BPL $F6              ; 10 F6 | Branch if positive
    LDX #$00             ; A2 00 | Load immediate value into X register
    BRA $8E              ; 80 8E | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1B0
; Address: $C58EF2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1B0:
    BIT $AB              ; 24 AB | Test bits in accumulator (zero page)
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1B1
; Address: $C58EFB
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1B1:
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDA $23E8            ; AD E8 23 | Load from absolute address into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF D3 CB C2 | Load from absolute long,X into accumulator
    STA $0A              ; 85 0A | Store accumulator to zero page
    TAX                  ; AA | Transfer accumulator to X register
    LDA $2049,X          ; BD 49 20 | Load from absolute,X into accumulator
    STA $2420            ; 8D 20 24 | Store accumulator to absolute address
    LDA $2050,X          ; BD 50 20 | Load from absolute,X into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    STA $241E            ; 8D 1E 24 | Store accumulator to absolute address
    LDA $23EE            ; AD EE 23 | Load from absolute address into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF 6A 37 C2 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1BC
; Address: $C58F45
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1BC:
    JSR $91DF            ; 20 DF 91 | Jump to subroutine
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1BD
; Address: $C58F4B
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1BD:
    LDA $23EE            ; AD EE 23 | Load from absolute address into accumulator
    CMP #$AC             ; C9 AC | Compare accumulator (immediate)
    BEQ $05              ; F0 05 | Branch if equal
    CMP #$AD             ; C9 AD | Compare accumulator (immediate)
    BNE $1D              ; D0 1D | Branch if not equal
    LDA $23DA            ; AD DA 23 | Load from absolute address into accumulator
    DEC                  ; 3A | Decrement accumulator
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    LDA #$05             ; A9 05 | Load immediate value into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF 76 8F C2 | Load from absolute long,X into accumulator
    LDX #$00             ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1BE
; Address: $C58F6D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1BE:
    JSL $C01146          ; 22 46 11 C0 | Jump to subroutine long
    LDA $01              ; A5 01 | Load from zero page into accumulator
    STA $00              ; 85 00 | Store accumulator to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1BF
; Address: $C58F77
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1BF:
    ORA ($CD,X)          ; 01 CD | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    EOR $3300            ; 4D 00 33 | Exclusive OR with accumulator (absolute)
    LDX $245E            ; AE 5E 24 | Load from absolute address into X register
    BMI $03              ; 30 03 | Branch if negative
    STA $608F            ; 8D 8F 60 | Store accumulator to absolute address
    STA $AE608F          ; 8F 8F 60 AE | Store accumulator to absolute long address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1C1
; Address: $C58F99
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1C1:
    JSR $1800            ; 20 00 18 | Jump to subroutine
    LDA ($8F,X)          ; A1 8F | Load from (zero page,X) into accumulator
    DEC $AD8F            ; CE 8F AD | Decrement (absolute)
    ASL $D024,X          ; 1E 24 D0 | Arithmetic shift left (absolute,X)
    ASL $20AD,X          ; 1E AD 20 | Arithmetic shift left (absolute,X)
    BIT $0A              ; 24 0A | Test bits in accumulator (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF 20 17 C2 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1C2
; Address: $C58FAF
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1C2:
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF 02 00 C2 | Load from absolute long,X into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BEQ $0B              ; F0 0B | Branch if equal
    LDA $23AE            ; AD AE 23 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $04              ; D0 04 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1C4
; Address: $C58FC5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1C4:
    LDA #$18             ; A9 18 | Load immediate value into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC $00              ; 65 00 | Add with carry (zero page)
    STA $00              ; 85 00 | Store accumulator to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1C5
; Address: $C58FCE
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1C5:
    LDA $23EE            ; AD EE 23 | Load from absolute address into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDA #$1B             ; A9 1B | Load immediate value into accumulator
    STA $23EE            ; 8D EE 23 | Store accumulator to absolute address
    LDA $23AE            ; AD AE 23 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $0D              ; D0 0D | Branch if not equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1C7
; Address: $C58FE5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1C7:
    JSR $9004            ; 20 04 90 | Jump to subroutine
    PLA                  ; 68 | Pull accumulator from stack
    STA $23EE            ; 8D EE 23 | Store accumulator to absolute address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1C8
; Address: $C58FED
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1C8:
    LDA $00              ; A5 00 | Load from zero page into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDA #$18             ; A9 18 | Load immediate value into accumulator
    STA $00              ; 85 00 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1C9
; Address: $C58FF5
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1C9:
    JSR $A3CE            ; 20 CE A3 | Jump to subroutine
    LDA $00              ; A5 00 | Load from zero page into accumulator
    CLC                  ; 18 | Clear carry flag
    ORA ($83,X)          ; 01 83 | Logical OR with accumulator ((zero page,X))
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))
    STA $00              ; 85 00 | Store accumulator to zero page
    BRA $E4              ; 80 E4 | Branch always
    LDA #$10             ; A9 10 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1CA
; Address: $C59007
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1CA:
    JSL $C0133E          ; 22 3E 13 C0 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    ADC #$10             ; 69 10 | Add with carry (immediate)
    CLC                  ; 18 | Clear carry flag
    ADC $00              ; 65 00 | Add with carry (zero page)
    STA $00              ; 85 00 | Store accumulator to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1CB
; Address: $C59015
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1CB:
    LDX $08              ; A6 08 | Load from zero page into X register
    LDA                  ; BF 79 18 C2 | Load from absolute long,X into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BEQ $1D              ; F0 1D | Branch if equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1CC
; Address: $C59020
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1CC:
    LDA $23E4            ; AD E4 23 | Load from absolute address into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF D3 CB C2 | Load from absolute long,X into accumulator
    TAX                  ; AA | Transfer accumulator to X register
    LDA $2051,X          ; BD 51 20 | Load from absolute,X into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BEQ $0B              ; F0 0B | Branch if equal
    LDA $23DA            ; AD DA 23 | Load from absolute address into accumulator
    DEC                  ; 3A | Decrement accumulator
    ORA $23D8            ; 0D D8 23 | Logical OR with accumulator (absolute)
    BNE $02              ; D0 02 | Branch if not equal
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1CD
; Address: $C5903E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1CD:
    LDA $23AE            ; AD AE 23 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $20              ; D0 20 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1CE
; Address: $C59046
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1CE:
    JSL $C2B774          ; 22 74 B7 C2 | Jump to subroutine long
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $14              ; F0 14 | Branch if equal
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BEQ $12              ; F0 12 | Branch if equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1D5
; Address: $C59072
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1D5:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BCC $2B              ; 90 2B | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1D6
; Address: $C5907A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1D6:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    BIT $B0              ; 24 B0 | Test bits in accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $13              ; D0 13 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1D7
; Address: $C59086
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1D7:
    JSL $C2C240          ; 22 40 C2 C2 | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BCC $09              ; 90 09 | Branch if carry clear
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1D8
; Address: $C59091
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1D8:
    JSL $C012D1          ; 22 D1 12 C0 | Jump to subroutine long
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1DA
; Address: $C5909D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1DA:
    AND #$3F             ; 29 3F | Logical AND with accumulator (immediate)
    SEC                  ; 38 | Set carry flag
    BNE $02              ; D0 02 | Branch if not equal
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1DC
; Address: $C590A7
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1DC:
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $245C            ; AD 5C 24 | Load from absolute address into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP #$10             ; C9 10 | Compare accumulator (immediate)
    BEQ $08              ; F0 08 | Branch if equal
    INX                  ; E8 | Increment X register
    CMP #$14             ; C9 14 | Compare accumulator (immediate)
    BEQ $02              ; F0 02 | Branch if equal
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1DE
; Address: $C590C4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1DE:
    JSL $C0133E          ; 22 3E 13 C0 | Jump to subroutine long
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $EE              ; D0 EE | Branch if not equal
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1DF
; Address: $C590D1
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1DF:
    LDA $23EE            ; AD EE 23 | Load from absolute address into accumulator
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $0E              ; D0 0E | Branch if not equal
    LDA #$07             ; A9 07 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1E0
; Address: $C590DC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1E0:
    JSL $C0133E          ; 22 3E 13 C0 | Jump to subroutine long
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $02              ; D0 02 | Branch if not equal
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1E2
; Address: $C590E9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1E2:
    JSL $C1E32E          ; 22 2E E3 C1 | Jump to subroutine long
    LDA #$09             ; A9 09 | Load immediate value into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDX $23E4            ; AE E4 23 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1E4
; Address: $C590FB
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1E4:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BCS $05              ; B0 05 | Branch if carry set
    LDA #$0A             ; A9 0A | Load immediate value into accumulator
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1E5
; Address: $C59109
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1E5:
    JSL $C1A87A          ; 22 7A A8 C1 | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    PEA #$23AD           ; F4 AD 23 | Push effective address to stack
    PEA #$0020           ; F4 20 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1E8
; Address: $C59125
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1E8:
    JSR $0085            ; 20 85 00 | Jump to subroutine
    LSR                  ; 4A | Logical shift right (accumulator)
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1EA
; Address: $C59131
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1EA:
    JSL $C010D6          ; 22 D6 10 C0 | Jump to subroutine long
    LDA $01              ; A5 01 | Load from zero page into accumulator
    CLC                  ; 18 | Clear carry flag
    ORA ($85,X)          ; 01 85 | Logical OR with accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1ED
; Address: $C59148
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1ED:
    JSL $A82DB0          ; 22 B0 2D A8 | Jump to subroutine long
    LDA $23EE            ; AD EE 23 | Load from absolute address into accumulator
    STA $242A            ; 8D 2A 24 | Store accumulator to absolute address
    LDA $00              ; A5 00 | Load from zero page into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1EE
; Address: $C59154
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1EE:
    JSL $C2BBD5          ; 22 D5 BB C2 | Jump to subroutine long
    STA $00              ; 85 00 | Store accumulator to zero page
    LDA $23F2            ; AD F2 23 | Load from absolute address into accumulator
    BNE $19              ; D0 19 | Branch if not equal
    LDX $08              ; A6 08 | Load from zero page into X register
    LDA                  ; BF 79 18 C2 | Load from absolute long,X into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BEQ $0E              ; F0 0E | Branch if equal
    LDA #$69             ; A9 69 | Load immediate value into accumulator
    STA $242C            ; 8D 2C 24 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1EF
; Address: $C59170
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1EF:
    JSL $C2B87A          ; 22 7A B8 C2 | Jump to subroutine long
    BVC $02              ; 50 02 | Branch if overflow clear
    LSR $00              ; 46 00 | Logical shift right (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1F0
; Address: $C59179
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1F0:
    LDX $08              ; A6 08 | Load from zero page into X register
    LDA                  ; BF 79 18 C2 | Load from absolute long,X into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BEQ $16              ; F0 16 | Branch if equal
    LDX $0A              ; A6 0A | Load from zero page into X register
    LDA $2051,X          ; BD 51 20 | Load from absolute,X into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BEQ $0C              ; F0 0C | Branch if equal
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1F3
; Address: $C591A0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1F3:
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BEQ $02              ; F0 02 | Branch if equal
    LSR $00              ; 46 00 | Logical shift right (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1F4
; Address: $C591A8
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1F4:
    LDA $23EE            ; AD EE 23 | Load from absolute address into accumulator
    CMP #$1A             ; C9 1A | Compare accumulator (immediate)
    BEQ $2A              ; F0 2A | Branch if equal
    CMP #$03             ; C9 03 | Compare accumulator (immediate)
    BEQ $25              ; F0 25 | Branch if equal
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BEQ $20              ; F0 20 | Branch if equal
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BEQ $1B              ; F0 1B | Branch if equal
    CMP #$AA             ; C9 AA | Compare accumulator (immediate)
    BEQ $17              ; F0 17 | Branch if equal
    CMP #$85             ; C9 85 | Compare accumulator (immediate)
    BEQ $12              ; F0 12 | Branch if equal
    CMP #$CE             ; C9 CE | Compare accumulator (immediate)
    BEQ $0C              ; F0 0C | Branch if equal
    CMP #$CF             ; C9 CF | Compare accumulator (immediate)
    BEQ $07              ; F0 07 | Branch if equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1F5
; Address: $C591D3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1F5:
    JSR $A3EB            ; 20 EB A3 | Jump to subroutine
    BCS $02              ; B0 02 | Branch if carry set
    STZ $00              ; 64 00 | Store zero to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1F7
; Address: $C591DF
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1F7:
    LDA $23F2            ; AD F2 23 | Load from absolute address into accumulator
    BNE $1B              ; D0 1B | Branch if not equal
    LDX $08              ; A6 08 | Load from zero page into X register
    LDA                  ; BF 7A 18 C2 | Load from absolute long,X into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BEQ $10              ; F0 10 | Branch if equal
    LDA $245C            ; AD 5C 24 | Load from absolute address into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP #$09             ; C9 09 | Compare accumulator (immediate)
    BNE $05              ; D0 05 | Branch if not equal
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $00              ; 85 00 | Store accumulator to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1F8
; Address: $C59200
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1F8:
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDA $23E8            ; AD E8 23 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1F9
; Address: $C5920F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1F9:
    STA $2428            ; 8D 28 24 | Store accumulator to absolute address
    STZ $BE83            ; 9C 83 BE | Store zero to absolute
    LDA $23FA            ; AD FA 23 | Load from absolute address into accumulator
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address
    BNE $0C              ; D0 0C | Branch if not equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1FA
; Address: $C5921D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1FA:
    JSR $92CE            ; 20 CE 92 | Jump to subroutine
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_1FB
; Address: $C59229
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_1FB:
    JSR $9312            ; 20 12 93 | Jump to subroutine
    LDA $23FA            ; AD FA 23 | Load from absolute address into accumulator
    STA $00              ; 85 00 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_200
; Address: $C59241
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_200:
    JSL $C31394          ; 22 94 13 C3 | Jump to subroutine long
    PLP                  ; 28 | Pull processor status from stack
    BCC $0B              ; 90 0B | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_203
; Address: $C5924F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_203:
    JSL $C2B054          ; 22 54 B0 C2 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_204
; Address: $C5925C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_204:
    LDA #$0C             ; A9 0C | Load immediate value into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDX $23E8            ; AE E8 23 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_206
; Address: $C59268
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_206:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BCS $05              ; B0 05 | Branch if carry set
    LDA #$0B             ; A9 0B | Load immediate value into accumulator
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_20E
; Address: $C59294
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_20E:
    JSL $C02ABA          ; 22 BA 2A C0 | Jump to subroutine long
    ROL $87              ; 26 87 | Rotate left (zero page)
    CPY $22              ; C4 22 | Compare Y register (zero page)
    CPY $60              ; C4 60 | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_213
; Address: $C592B7
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_213:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BCS $02              ; B0 02 | Branch if carry set
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA                  ; BF CA 92 C2 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_216
; Address: $C592D4
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_216:
    JSL $C2CC2C          ; 22 2C CC C2 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    BEQ $03              ; F0 03 | Branch if equal
    LDX #$04             ; A2 04 | Load immediate value into X register
    LDY $23E8            ; AC E8 23 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_218
; Address: $C592E9
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_218:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BCC $02              ; 90 02 | Branch if carry clear
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA                  ; BF 0A 93 C2 | Load from absolute long,X into accumulator
    CMP #$0D             ; C9 0D | Compare accumulator (immediate)
    BEQ $05              ; F0 05 | Branch if equal
    CMP #$0E             ; C9 0E | Compare accumulator (immediate)
    BNE $04              ; D0 04 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_21B
; Address: $C5930A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_21B:
    ORA $0E00            ; 0D 00 0E | Logical OR with accumulator (absolute)
    LDA $23AD            ; AD AD 23 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $05              ; D0 05 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_220
; Address: $C5932F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_220:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_221
; Address: $C59337
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_221:
    JSR $9372            ; 20 72 93 | Jump to subroutine
    BCS $34              ; B0 34 | Branch if carry set
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    STA $00              ; 85 00 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_222
; Address: $C59341
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_222:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    ASL $22              ; 06 22 | Arithmetic shift left (zero page)
    LDA $22C2,Y          ; B9 C2 22 | Load from absolute,Y into accumulator
    DEC $C2CF            ; CE CF C2 | Decrement (absolute)
    LDA #$18             ; A9 18 | Load immediate value into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDX $23E8            ; AE E8 23 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_224
; Address: $C5935A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_224:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BCS $05              ; B0 05 | Branch if carry set
    LDA #$17             ; A9 17 | Load immediate value into accumulator
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_226
; Address: $C5936C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_226:
    JSL $C2B054          ; 22 54 B0 C2 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_22A
; Address: $C59384
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_22A:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    STA $603893          ; 8F 93 38 60 | Store accumulator to absolute long address
    LDX $2428            ; AE 28 24 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_22D
; Address: $C5939C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_22D:
    JSL $C2CAD9          ; 22 D9 CA C2 | Jump to subroutine long
    AND $FF20,X          ; 3D 20 FF | Logical AND with accumulator (absolute,X)
    CMP #$A8             ; C9 A8 | Compare accumulator (immediate)
    BNE $14              ; D0 14 | Branch if not equal
    STA $242C            ; 8D 2C 24 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_22E
; Address: $C593AC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_22E:
    JSL $C2B87A          ; 22 7A B8 C2 | Jump to subroutine long
    BCC $0C              ; 90 0C | Branch if carry clear
    LDA $242E            ; AD 2E 24 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_22F
; Address: $C593B5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_22F:
    JSL $C2CB70          ; 22 70 CB C2 | Jump to subroutine long
    ROL $FF20,X          ; 3E 20 FF | Rotate left (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_237
; Address: $C593E0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_237:
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    PEA #$23AE           ; F4 AE 23 | Push effective address to stack
    PEA #$0004           ; F4 04 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_238
; Address: $C593EC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_238:
    JSL $C902E9          ; 22 E9 02 C9 | Jump to subroutine long
    LDA $23E8            ; AD E8 23 | Load from absolute address into accumulator
    STA $2428            ; 8D 28 24 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_23A
; Address: $C593FB
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_23A:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_23B
; Address: $C59403
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_23B:
    JSR $9372            ; 20 72 93 | Jump to subroutine
    BCS $2B              ; B0 2B | Branch if carry set
    PEA #$23AD           ; F4 AD 23 | Push effective address to stack
    PEA #$0040           ; F4 40 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_23C
; Address: $C59411
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_23C:
    JSL $C9029E          ; 22 9E 02 C9 | Jump to subroutine long
    BNE $1E              ; D0 1E | Branch if not equal
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    STA $00              ; 85 00 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_23D
; Address: $C5941C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_23D:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    ASL $22              ; 06 22 | Arithmetic shift left (zero page)
    LDA $22C2,Y          ; B9 C2 22 | Load from absolute,Y into accumulator
    DEC $C2CF            ; CE CF C2 | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_23E
; Address: $C59429
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_23E:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    ORA $2200,Y          ; 19 00 22 | Logical OR with accumulator (absolute,Y)
    BCS $C2              ; B0 C2 | Branch if carry set
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_23F
; Address: $C59435
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_23F:
    LDA $247C            ; AD 7C 24 | Load from absolute address into accumulator
    CMP #$58             ; C9 58 | Compare accumulator (immediate)
    ORA ($B0,X)          ; 01 B0 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_240
; Address: $C5943E
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_240:
    SBC #$04             ; E9 04 | Subtract with carry (immediate)
    BCS $03              ; B0 03 | Branch if carry set
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    AND #$FC             ; 29 FC | Logical AND with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    ADC #$05             ; 69 05 | Add with carry (immediate)
    BRA $08              ; 80 08 | Branch always
    SEC                  ; 38 | Set carry flag
    SBC #$04             ; E9 04 | Subtract with carry (immediate)
    AND #$FC             ; 29 FC | Logical AND with accumulator (immediate)
    INC                  ; 1A | Increment accumulator
    STA $00              ; 85 00 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_243
; Address: $C59460
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_243:
    JSL $C2CAD9          ; 22 D9 CA C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BNE $05              ; D0 05 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_245
; Address: $C5946F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_245:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_249
; Address: $C59487
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_249:
    JSL $C2B054          ; 22 54 B0 C2 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_24C
; Address: $C59498
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_24C:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_250
; Address: $C594AE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_250:
    JSL $C2CFCE          ; 22 CE CF C2 | Jump to subroutine long
    LDA #$1C             ; A9 1C | Load immediate value into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDX $23E8            ; AE E8 23 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_253
; Address: $C594C1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_253:
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BCS $05              ; B0 05 | Branch if carry set
    LDA #$1D             ; A9 1D | Load immediate value into accumulator
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_255
; Address: $C594D0
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_255:
    JSL $C2B054          ; 22 54 B0 C2 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_258
; Address: $C594DE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_258:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BNE $14              ; D0 14 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_25B
; Address: $C594F0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_25B:
    JSL $C270E1          ; 22 E1 70 C2 | Jump to subroutine long
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BCS $01              ; B0 01 | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_25E
; Address: $C594FF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_25E:
    JSL $C2CAD9          ; 22 D9 CA C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BEQ $3D              ; F0 3D | Branch if equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_25F
; Address: $C59509
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_25F:
    JSL $C2CA5B          ; 22 5B CA C2 | Jump to subroutine long
    EOR #$20             ; 49 20 | Exclusive OR with accumulator (immediate)
    STA $2420            ; 8D 20 24 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_260
; Address: $C59512
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_260:
    JSL $C610BE          ; 22 BE 10 C6 | Jump to subroutine long
    BCS $2C              ; B0 2C | Branch if carry set
    LDA $2420            ; AD 20 24 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_261
; Address: $C5951B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_261:
    JSL $C42DA1          ; 22 A1 2D C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    SBC $0690,X          ; FD 90 06 | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_262
; Address: $C59524
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_262:
    JSL $CC8C5A          ; 22 5A 8C CC | Jump to subroutine long
    BCC $1A              ; 90 1A | Branch if carry clear
    LDA $2420            ; AD 20 24 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_265
; Address: $C5953B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_265:
    JSL $C42A6D          ; 22 6D 2A C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    BCC $02              ; 90 02 | Branch if carry clear
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_269
; Address: $C59551
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_269:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_26C
; Address: $C59563
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_26C:
    JSR $958B            ; 20 8B 95 | Jump to subroutine
    LDA $23FA            ; AD FA 23 | Load from absolute address into accumulator
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address
    STZ $BE83            ; 9C 83 BE | Store zero to absolute

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_26D
; Address: $C5956F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_26D:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    EOR $3800,Y          ; 59 00 38 | Exclusive OR with accumulator (absolute,Y)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_26F
; Address: $C5957D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_26F:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    PHP                  ; 08 | Push processor status to stack
    CMP $23FA            ; CD FA 23 | Compare accumulator (absolute)
    BCS $03              ; B0 03 | Branch if carry set
    STA $23FA            ; 8D FA 23 | Store accumulator to absolute address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_270
; Address: $C5958B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_270:
    LDA $23E8            ; AD E8 23 | Load from absolute address into accumulator
    STA $2428            ; 8D 28 24 | Store accumulator to absolute address
    LDA $23FA            ; AD FA 23 | Load from absolute address into accumulator
    STA $00              ; 85 00 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_271
; Address: $C59596
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_271:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    ASL $7722            ; 0E 22 77 | Arithmetic shift left (absolute)
    LDA $F4C2,Y          ; B9 C2 F4 | Load from absolute,Y into accumulator
    LDA $F423            ; AD 23 F4 | Load from absolute address into accumulator
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_272
; Address: $C595A8
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_272:
    JSL $C9029E          ; 22 9E 02 C9 | Jump to subroutine long
    BEQ $08              ; F0 08 | Branch if equal
    LDA $23E4            ; AD E4 23 | Load from absolute address into accumulator
    CMP $23E8            ; CD E8 23 | Compare accumulator (absolute)
    BEQ $14              ; F0 14 | Branch if equal
    LDA $23E4            ; AD E4 23 | Load from absolute address into accumulator
    STA $2428            ; 8D 28 24 | Store accumulator to absolute address
    LDA $23FA            ; AD FA 23 | Load from absolute address into accumulator
    STA $00              ; 85 00 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_276
; Address: $C595D0
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_276:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_279
; Address: $C595DE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_279:
    JSL $C2C240          ; 22 40 C2 C2 | Jump to subroutine long
    PHP                  ; 08 | Push processor status to stack
    STA $00              ; 85 00 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_27B
; Address: $C595EA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_27B:
    JSR $0285            ; 20 85 02 | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    SBC $00              ; E5 00 | Subtract with carry (zero page)
    BPL $03              ; 10 03 | Branch if positive
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_27D
; Address: $C595FA
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_27D:
    JSR $0485            ; 20 85 04 | Jump to subroutine
    LDA $02              ; A5 02 | Load from zero page into accumulator
    SEC                  ; 38 | Set carry flag
    SBC $04              ; E5 04 | Subtract with carry (zero page)
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address
    STZ $BE83            ; 9C 83 BE | Store zero to absolute

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_27E
; Address: $C59608
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_27E:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    ADC $00              ; 65 00 | Add with carry (zero page)
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_27F
; Address: $C59610
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_27F:
    LDA $23F2            ; AD F2 23 | Load from absolute address into accumulator
    BEQ $2A              ; F0 2A | Branch if equal
    LDX $23E8            ; AE E8 23 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_280
; Address: $C59618
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_280:
    JSL $C2CAD9          ; 22 D9 CA C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BNE $1D              ; D0 1D | Branch if not equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_281
; Address: $C59622
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_281:
    JSL $C2CA5B          ; 22 5B CA C2 | Jump to subroutine long
    EOR #$20             ; 49 20 | Exclusive OR with accumulator (immediate)
    CMP #$88             ; C9 88 | Compare accumulator (immediate)
    BNE $12              ; D0 12 | Branch if not equal
    LDX #$10             ; A2 10 | Load immediate value into X register
    LDA $23EE            ; AD EE 23 | Load from absolute address into accumulator
    LDX $96              ; A6 96 | Load from zero page into X register
    REP #$F0             ; C2 F0 | Reset processor status bits
    EOR $CACA,Y          ; 59 CA CA | Exclusive OR with accumulator (absolute,Y)
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    BPL $F4              ; 10 F4 | Branch if positive
    LDA $23E8            ; AD E8 23 | Load from absolute address into accumulator
    STA $2428            ; 8D 28 24 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_284
; Address: $C59652
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_284:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    LDA $23EE            ; AD EE 23 | Load from absolute address into accumulator
    CMP #$83             ; C9 83 | Compare accumulator (immediate)
    BNE $09              ; D0 09 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_285
; Address: $C5965F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_285:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    CMP $02              ; C5 02 | Compare accumulator (zero page)
    BEQ $22              ; F0 22 | Branch if equal
    LDX $23E8            ; AE E8 23 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_287
; Address: $C59670
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_287:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BCC $0A              ; 90 0A | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_28A
; Address: $C59682
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_28A:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    LSR $3800,X          ; 5E 00 38 | Logical shift right (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_28B
; Address: $C5968A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_28B:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    EOR ($01,X)          ; 41 01 | Exclusive OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_28C
; Address: $C59692
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_28C:
    LDA $23EE            ; AD EE 23 | Load from absolute address into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDA                  ; BF A8 96 C2 | Load from absolute long,X into accumulator
    STA $23EE            ; 8D EE 23 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_28D
; Address: $C5969D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_28D:
    JSL $C28E66          ; 22 66 8E C2 | Jump to subroutine long
    PLA                  ; 68 | Pull accumulator from stack
    STA $23EE            ; 8D EE 23 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_28F
; Address: $C596AA
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_28F:
    JSL $00A700          ; 22 00 A7 00 | Jump to subroutine long
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    LDX $1100            ; AE 00 11 | Load from absolute address into X register
    ORA ($AD,X)          ; 01 AD | Logical OR with accumulator ((zero page,X))
    INX                  ; E8 | Increment X register
    STA $2428            ; 8D 28 24 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_291
; Address: $C596C7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_291:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    EOR ($01,X)          ; 41 01 | Exclusive OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_29B
; Address: $C596FA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_29B:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BCC $0C              ; 90 0C | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_29E
; Address: $C5970E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_29E:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2A0
; Address: $C5971B
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2A0:
    JSR $974D            ; 20 4D 97 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2A3
; Address: $C59728
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2A3:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BCS $1B              ; B0 1B | Branch if carry set

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2A4
; Address: $C59730
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2A4:
    JSL $C2CA62          ; 22 62 CA C2 | Jump to subroutine long
    EOR #$20             ; 49 20 | Exclusive OR with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2A8
; Address: $C59746
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2A8:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2AC
; Address: $C59754
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2AC:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    ASL $4022,X          ; 1E 22 40 | Arithmetic shift left (absolute,X)
    REP #$C2             ; C2 C2 | Reset processor status bits
    STA $00              ; 85 00 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2B1
; Address: $C59774
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2B1:
    ASL $20              ; 06 20 | Arithmetic shift left (zero page)
    STA $4022,Y          ; 99 22 40 | Store accumulator to absolute,Y
    REP #$C2             ; C2 C2 | Reset processor status bits
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2B3
; Address: $C59782
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2B3:
    JSR $D922            ; 20 22 D9 | Jump to subroutine
    DEX                  ; CA | Decrement X register
    REP #$3C             ; C2 3C | Reset processor status bits

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2B4
; Address: $C59788
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2B4:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    INC $240E,X          ; FE 0E 24 | Increment (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2B6
; Address: $C59797
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2B6:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    BCS $10              ; B0 10 | Branch if carry set
    LDA $23EE            ; AD EE 23 | Load from absolute address into accumulator
    CMP #$51             ; C9 51 | Compare accumulator (immediate)
    BEQ $06              ; F0 06 | Branch if equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2B7
; Address: $C597A6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2B7:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    EOR ($01,X)          ; 41 01 | Exclusive OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2BB
; Address: $C597BF
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2BB:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BCC $0C              ; 90 0C | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2BE
; Address: $C597D3
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2BE:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2C6
; Address: $C597FF
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2C6:
    LDA #$9A             ; A9 9A | Load immediate value into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDA $23EE            ; AD EE 23 | Load from absolute address into accumulator
    CMP #$B8             ; C9 B8 | Compare accumulator (immediate)
    BEQ $17              ; F0 17 | Branch if equal
    LDA #$41             ; A9 41 | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    CPX #$CA             ; E0 CA | Compare X register (immediate)
    REP #$3C             ; C2 3C | Reset processor status bits

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2C7
; Address: $C59815
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2C7:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BCS $05              ; B0 05 | Branch if carry set
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2C8
; Address: $C59823
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2C8:
    JSL $C1A87A          ; 22 7A A8 C1 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2C9
; Address: $C59829
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2C9:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    WDM #$00             ; 42 00 | Reserved instruction
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2CD
; Address: $C5983E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2CD:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    AND $3800,X          ; 3D 00 38 | Logical AND with accumulator (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2CE
; Address: $C59846
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2CE:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2D0
; Address: $C59851
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2D0:
    JSL $C2CAD9          ; 22 D9 CA C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    BEQ $02              ; F0 02 | Branch if equal
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2D3
; Address: $C59867
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2D3:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2D6
; Address: $C5987A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2D6:
    JSL $C2B977          ; 22 77 B9 C2 | Jump to subroutine long
    LDA #$67             ; A9 67 | Load immediate value into accumulator
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2D8
; Address: $C59887
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2D8:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BCS $05              ; B0 05 | Branch if carry set
    LDA #$66             ; A9 66 | Load immediate value into accumulator
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2D9
; Address: $C59895
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2D9:
    JSL $C1A87A          ; 22 7A A8 C1 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2DB
; Address: $C5989E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2DB:
    JSL $C2CAD9          ; 22 D9 CA C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    BEQ $0C              ; F0 0C | Branch if equal
    STX $2428            ; 8E 28 24 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2DC
; Address: $C598AC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2DC:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    BNE $01              ; D0 01 | Branch if not equal
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2DE
; Address: $C598B9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2DE:
    JSL $C2CAD9          ; 22 D9 CA C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    BEQ $02              ; F0 02 | Branch if equal
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2DF
; Address: $C598C5
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2DF:
    JSR $A3EB            ; 20 EB A3 | Jump to subroutine
    BCS $18              ; B0 18 | Branch if carry set
    LDA #$0F             ; A9 0F | Load immediate value into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDA $23EE            ; AD EE 23 | Load from absolute address into accumulator
    CMP #$BE             ; C9 BE | Compare accumulator (immediate)
    BNE $05              ; D0 05 | Branch if not equal
    LDA #$A4             ; A9 A4 | Load immediate value into accumulator
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2E0
; Address: $C598DC
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2E0:
    JSL $C1A87A          ; 22 7A A8 C1 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2E3
; Address: $C598ED
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2E3:
    JSL $C2B977          ; 22 77 B9 C2 | Jump to subroutine long
    LDA #$62             ; A9 62 | Load immediate value into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDA $23EE            ; AD EE 23 | Load from absolute address into accumulator
    CMP #$BE             ; C9 BE | Compare accumulator (immediate)
    BNE $17              ; D0 17 | Branch if not equal
    LDA #$A3             ; A9 A3 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2E5
; Address: $C59907
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2E5:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BCC $05              ; 90 05 | Branch if carry clear
    LDA #$A5             ; A9 A5 | Load immediate value into accumulator
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2E6
; Address: $C59915
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2E6:
    JSL $C1A87A          ; 22 7A A8 C1 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2E7
; Address: $C5991B
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2E7:
    JSR $A3EB            ; 20 EB A3 | Jump to subroutine
    BCS $14              ; B0 14 | Branch if carry set
    LDY $23EE            ; AC EE 23 | Load from absolute address into Y register
    LDA #$F2             ; A9 F2 | Load immediate value into accumulator
    CPY #$D6             ; C0 D6 | Compare Y register (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    LDA #$0F             ; A9 0F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2E8
; Address: $C5992E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2E8:
    JSL $C1A87A          ; 22 7A A8 C1 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2E9
; Address: $C59934
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2E9:
    JSR $9992            ; 20 92 99 | Jump to subroutine
    LDX $23E8            ; AE E8 23 | Load from absolute address into X register
    STX $2428            ; 8E 28 24 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2EA
; Address: $C5993D
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2EA:
    JSL $C2CA5B          ; 22 5B CA C2 | Jump to subroutine long
    EOR ($20,X)          ; 41 20 | Exclusive OR with accumulator ((zero page,X))
    STA $02              ; 85 02 | Store accumulator to zero page
    SEC                  ; 38 | Set carry flag
    SBC $00              ; E5 00 | Subtract with carry (zero page)
    BCS $03              ; B0 03 | Branch if carry set
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2EB
; Address: $C5994D
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2EB:
    JSR $99F5            ; 20 F5 99 | Jump to subroutine
    STA $04              ; 85 04 | Store accumulator to zero page
    LDA $02              ; A5 02 | Load from zero page into accumulator
    SEC                  ; 38 | Set carry flag
    SBC $04              ; E5 04 | Subtract with carry (zero page)
    BEQ $31              ; F0 31 | Branch if equal
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address
    STZ $BE83            ; 9C 83 BE | Store zero to absolute
    LDA $23EE            ; AD EE 23 | Load from absolute address into accumulator
    CMP #$D6             ; C9 D6 | Compare accumulator (immediate)
    BNE $06              ; D0 06 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2EC
; Address: $C59967
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2EC:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    LDA #$64             ; A9 64 | Load immediate value into accumulator
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2EE
; Address: $C59976
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2EE:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BCS $05              ; B0 05 | Branch if carry set
    LDA #$63             ; A9 63 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2F0
; Address: $C59984
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2F0:
    JSL $C1A87A          ; 22 7A A8 C1 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2F1
; Address: $C5998A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2F1:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    EOR ($01,X)          ; 41 01 | Exclusive OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2F2
; Address: $C59992
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2F2:
    LDX #$14             ; A2 14 | Load immediate value into X register
    LDA $23EE            ; AD EE 23 | Load from absolute address into accumulator
    LDA ($99),Y          ; B1 99 | Load from (zero page),Y into accumulator
    REP #$F0             ; C2 F0 | Reset processor status bits
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    BPL $F6              ; 10 F6 | Branch if positive
    STZ $00              ; 64 00 | Store zero to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2F3
; Address: $C599A5
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2F3:
    LDA $23E8            ; AD E8 23 | Load from absolute address into accumulator
    STA $2428            ; 8D 28 24 | Store accumulator to absolute address
    STA $0085,Y          ; 99 85 00 | Store accumulator to absolute,Y
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2F4
; Address: $C599B3
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2F4:
    SEC                  ; 38 | Set carry flag
    AND $3A00,Y          ; 39 00 3A | Logical AND with accumulator (absolute,Y)
    AND $3500,X          ; 3D 00 35 | Logical AND with accumulator (absolute,X)
    CMP $DD99,X          ; DD 99 DD | Compare accumulator (absolute,X)
    STA $99DD,Y          ; 99 DD 99 | Store accumulator to absolute,Y
    STA $99E3,Y          ; 99 E3 99 | Store accumulator to absolute,Y
    STA $99DD,Y          ; 99 DD 99 | Store accumulator to absolute,Y
    CMP $EA99,X          ; DD 99 EA | Compare accumulator (absolute,X)
    STA $99EA,Y          ; 99 EA 99 | Store accumulator to absolute,Y
    CMP $2299,X          ; DD 99 22 | Compare accumulator (absolute,X)
    RTI                  ; 40 | Return from interrupt
    REP #$C2             ; C2 C2 | Reset processor status bits
    ASL $60              ; 06 60 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2F5
; Address: $C599E3
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2F5:
    JSL $C2C240          ; 22 40 C2 C2 | Jump to subroutine long
    ASL $4A              ; 06 4A | Arithmetic shift left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2F7
; Address: $C599ED
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2F7:
    JSL $C2CA5B          ; 22 5B CA C2 | Jump to subroutine long
    EOR ($20,X)          ; 41 20 | Exclusive OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2F8
; Address: $C599F5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2F8:
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    LDX $2428            ; AE 28 24 | Load from absolute address into X register
    PHA                  ; 48 | Push accumulator to stack
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2FB
; Address: $C59A07
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2FB:
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    BCC $0E              ; 90 0E | Branch if carry clear
    LDA #$01             ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_2FE
; Address: $C59A1A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_2FE:
    JSL $C2CA98          ; 22 98 CA C2 | Jump to subroutine long
    EOR ($20,X)          ; 41 20 | Exclusive OR with accumulator ((zero page,X))
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_300
; Address: $C59A29
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_300:
    JSL $C2CA5B          ; 22 5B CA C2 | Jump to subroutine long
    EOR ($20,X)          ; 41 20 | Exclusive OR with accumulator ((zero page,X))
    STA $02              ; 85 02 | Store accumulator to zero page
    CLC                  ; 18 | Clear carry flag
    ADC $00              ; 65 00 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_301
; Address: $C59A34
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_301:
    JSR $99F5            ; 20 F5 99 | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    SBC $02              ; E5 02 | Subtract with carry (zero page)
    BEQ $21              ; F0 21 | PPU graphics register access
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address
    STZ $BE83            ; 9C 83 BE | Store zero to absolute

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_303
; Address: $C59A47
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_303:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BCC $06              ; 90 06 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_305
; Address: $C59A55
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_305:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    ADC #$00             ; 69 00 | Add with carry (immediate)
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_306
; Address: $C59A5D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_306:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    EOR ($01,X)          ; 41 01 | Exclusive OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_30A
; Address: $C59A73
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_30A:
    JSL $C2C240          ; 22 40 C2 C2 | Jump to subroutine long
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    ADC $00              ; 65 00 | Add with carry (zero page)
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    LDA #$FF             ; A9 FF | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_30C
; Address: $C59A88
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_30C:
    JSR $E538            ; 20 38 E5 | Jump to subroutine
    BEQ $21              ; F0 21 | PPU graphics register access
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address
    STZ $BE83            ; 9C 83 BE | Store zero to absolute

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_30E
; Address: $C59A99
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_30E:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BCC $06              ; 90 06 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_310
; Address: $C59AA7
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_310:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    ROR                  ; 6A | Rotate right (accumulator)
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_311
; Address: $C59AAF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_311:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    EOR ($01,X)          ; 41 01 | Exclusive OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_313
; Address: $C59ABD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_313:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    PLP                  ; 28 | Pull processor status from stack
    BCC $08              ; 90 08 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_314
; Address: $C59AC4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_314:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_315
; Address: $C59ACC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_315:
    JSL $C2CAE0          ; 22 E0 CA C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    BNE $05              ; D0 05 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_317
; Address: $C59ADB
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_317:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_31A
; Address: $C59AEB
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_31A:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_31B
; Address: $C59AF3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_31B:
    LDX $23E4            ; AE E4 23 | Load from absolute address into X register
    LDY $23E8            ; AC E8 23 | Load from absolute address into Y register
    STY $2428            ; 8C 28 24 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_31C
; Address: $C59AFC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_31C:
    JSL $C2CAD9          ; 22 D9 CA C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BEQ $24              ; F0 24 | Branch if equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_31F
; Address: $C59B10
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_31F:
    JSL $C2CA62          ; 22 62 CA C2 | Jump to subroutine long
    EOR #$20             ; 49 20 | Exclusive OR with accumulator (immediate)
    STA $00              ; 85 00 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_322
; Address: $C59B22
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_322:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_323
; Address: $C59B2A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_323:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    EOR ($01,X)          ; 41 01 | Exclusive OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_325
; Address: $C59B35
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_325:
    JSL $C2CB70          ; 22 70 CB C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_326
; Address: $C59B3D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_326:
    JSL $C2CAE0          ; 22 E0 CA C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_327
; Address: $C59B45
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_327:
    JSL $C2CB70          ; 22 70 CB C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_32C
; Address: $C59B63
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_32C:
    JSR $4022            ; 20 22 40 | Jump to subroutine
    REP #$C2             ; C2 C2 | Reset processor status bits
    ASL $48              ; 06 48 | Arithmetic shift left (zero page)
    LDA $2428            ; AD 28 24 | Load from absolute address into accumulator
    PHA                  ; 48 | Push accumulator to stack
    STX $2428            ; 8E 28 24 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_32D
; Address: $C59B73
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_32D:
    JSR $99F5            ; 20 F5 99 | Jump to subroutine
    PLA                  ; 68 | Pull accumulator from stack
    STA $2428            ; 8D 28 24 | Store accumulator to absolute address
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_330
; Address: $C59B85
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_330:
    JSR $5B22            ; 20 22 5B | Jump to subroutine
    DEX                  ; CA | Decrement X register
    REP #$49             ; C2 49 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_336
; Address: $C59B9E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_336:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_337
; Address: $C59BA6
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_337:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_339
; Address: $C59BB4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_339:
    JSL $C2CB70          ; 22 70 CB C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_33A
; Address: $C59BBF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_33A:
    JSL $C2CB70          ; 22 70 CB C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA #$7E             ; A9 7E | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_33E
; Address: $C59BDE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_33E:
    JSR $9222            ; 20 22 92 | Jump to subroutine
    CPY $07C2            ; CC C2 07 | Compare Y register (absolute)
    BEQ $3F              ; F0 3F | Branch if equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_345
; Address: $C59C03
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_345:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    BVS $00              ; 70 00 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_348
; Address: $C59C18
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_348:
    JSL $C2CB70          ; 22 70 CB C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    BRA $00              ; 80 00 | Branch always
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_34B
; Address: $C59C29
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_34B:
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    BPL $00              ; 10 00 | Branch if positive
    BEQ $02              ; F0 02 | Branch if equal
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_34D
; Address: $C59C34
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_34D:
    JSL $C2CB70          ; 22 70 CB C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_34F
; Address: $C59C41
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_34F:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BCC $06              ; 90 06 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_351
; Address: $C59C4F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_351:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    JMP ($3800)          ; 6C 00 38 | Jump to address (absolute indirect)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_356
; Address: $C59C6D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_356:
    JSL $C2CB70          ; 22 70 CB C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    LDA $23EE            ; AD EE 23 | Load from absolute address into accumulator
    CMP #$D5             ; C9 D5 | Compare accumulator (immediate)
    BNE $06              ; D0 06 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_358
; Address: $C59C83
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_358:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    PLA                  ; 68 | Pull accumulator from stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_35B
; Address: $C59C98
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_35B:
    JSL $C2B977          ; 22 77 B9 C2 | Jump to subroutine long
    LDA #$4E             ; A9 4E | Load immediate value into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDA $23EE            ; AD EE 23 | Load from absolute address into accumulator
    CMP #$84             ; C9 84 | Compare accumulator (immediate)
    BNE $05              ; D0 05 | Branch if not equal
    LDA #$4F             ; A9 4F | Load immediate value into accumulator
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_35C
; Address: $C59CAE
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_35C:
    JSL $C1A87A          ; 22 7A A8 C1 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_35D
; Address: $C59CB4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_35D:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    EOR ($01,X)          ; 41 01 | Exclusive OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_361
; Address: $C59CCC
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_361:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_362
; Address: $C59CD4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_362:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    EOR ($01,X)          ; 41 01 | Exclusive OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_364
; Address: $C59CE2
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_364:
    JSL $C2CAD9          ; 22 D9 CA C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BNE $10              ; D0 10 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_367
; Address: $C59CF6
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_367:
    JSL $C2B054          ; 22 54 B0 C2 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_368
; Address: $C59CFC
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_368:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    INC                  ; 1A | Increment accumulator
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_36A
; Address: $C59D0A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_36A:
    JSL $C2BB2C          ; 22 2C BB C2 | Jump to subroutine long
    LDY $23E8            ; AC E8 23 | Load from absolute address into Y register
    STY $2428            ; 8C 28 24 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_36E
; Address: $C59D25
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_36E:
    JSR $A3EB            ; 20 EB A3 | Jump to subroutine
    BCC $2D              ; 90 2D | Branch if carry clear
    LDA #$01             ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_374
; Address: $C59D48
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_374:
    JSR $00F0            ; 20 F0 00 | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF 7A BB C2 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_375
; Address: $C59D51
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_375:
    JSL $C1A87A          ; 22 7A A8 C1 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_376
; Address: $C59D57
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_376:
    LDA $2482            ; AD 82 24 | Load from absolute address into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF 8E BB C2 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_377
; Address: $C59D60
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_377:
    JSL $C1A87A          ; 22 7A A8 C1 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_378
; Address: $C59D66
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_378:
    LDA $23E8            ; AD E8 23 | Load from absolute address into accumulator
    STA $2428            ; 8D 28 24 | Store accumulator to absolute address
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    STA $00              ; 85 00 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_379
; Address: $C59D71
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_379:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    ASL $22              ; 06 22 | Arithmetic shift left (zero page)
    LDA $22C2,Y          ; B9 C2 22 | Load from absolute,Y into accumulator
    DEC $C2CF            ; CE CF C2 | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_37A
; Address: $C59D7E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_37A:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    ORA $2200,Y          ; 19 00 22 | Logical OR with accumulator (absolute,Y)
    BCS $C2              ; B0 C2 | Branch if carry set
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_37D
; Address: $C59D95
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_37D:
    JSR $0001            ; 20 01 00 | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_37F
; Address: $C59DA0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_37F:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    PHP                  ; 08 | Push processor status to stack
    STA $23FA            ; 8D FA 23 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_381
; Address: $C59DAB
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_381:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    PHY                  ; 5A | Push Y register to stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_386
; Address: $C59DC5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_386:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    EOR $1800            ; 4D 00 18 | Exclusive OR with accumulator (absolute)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_389
; Address: $C59DD6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_389:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    JMP $3800            ; 4C 00 38 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_38D
; Address: $C59DF0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_38D:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    LSR                  ; 4A | Logical shift right (accumulator)
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_390
; Address: $C59E00
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_390:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_392
; Address: $C59E0D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_392:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_394
; Address: $C59E1C
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_394:
    JSR $9577            ; 20 77 95 | Jump to subroutine
    LDA $23FA            ; AD FA 23 | Load from absolute address into accumulator
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address
    STZ $BE83            ; 9C 83 BE | Store zero to absolute
    LDA $23E8            ; AD E8 23 | Load from absolute address into accumulator
    STA $2428            ; 8D 28 24 | Store accumulator to absolute address
    LDA $23FA            ; AD FA 23 | Load from absolute address into accumulator
    STA $00              ; 85 00 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_395
; Address: $C59E33
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_395:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    ASL $7722            ; 0E 22 77 | Arithmetic shift left (absolute)
    LDA $22C2,Y          ; B9 C2 22 | Load from absolute,Y into accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    CMP ($5C,X)          ; C1 5C | Compare accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_398
; Address: $C59E4E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_398:
    JSL $C2CAD9          ; 22 D9 CA C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    BRA $00              ; 80 00 | Branch always
    BNE $0A              ; D0 0A | Branch if not equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_399
; Address: $C59E58
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_399:
    JSL $C2CAD9          ; 22 D9 CA C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    BEQ $04              ; F0 04 | Branch if equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_39C
; Address: $C59E6E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_39C:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BCS $12              ; B0 12 | Branch if carry set

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_39E
; Address: $C59E7B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_39E:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BCS $12              ; B0 12 | Branch if carry set

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_3A1
; Address: $C59E8D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_3A1:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BCS $EE              ; B0 EE | Branch if carry set

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_3A3
; Address: $C59E98
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_3A3:
    JSL $C2B977          ; 22 77 B9 C2 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_3A9
; Address: $C59EBB
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_3A9:
    JSR $4022            ; 20 22 40 | Jump to subroutine
    REP #$C2             ; C2 C2 | Reset processor status bits
    ASL $20              ; 06 20 | Arithmetic shift left (zero page)
    STA $4022,Y          ; 99 22 40 | Store accumulator to absolute,Y
    REP #$C2             ; C2 C2 | Reset processor status bits
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_3AB
; Address: $C59ECE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_3AB:
    JSR $8A22            ; 20 22 8A | Jump to subroutine
    LDX $00C2,Y          ; BE C2 00 | Load from absolute,Y into X register
    STA $00              ; 85 00 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_3AF
; Address: $C59EE2
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_3AF:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_3B1
; Address: $C59EEB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_3B1:
    JSL $C2CB70          ; 22 70 CB C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_3B3
; Address: $C59EF9
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_3B3:
    JSR $2200            ; 20 00 22 | Jump to subroutine
    BVS $CB              ; 70 CB | Branch if overflow set
    REP #$51             ; C2 51 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_3B5
; Address: $C59F03
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_3B5:
    JSL $C2CB70          ; 22 70 CB C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_3B6
; Address: $C59F0B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_3B6:
    JSL $C2CB70          ; 22 70 CB C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_3B9
; Address: $C59F1D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_3B9:
    JSR $4022            ; 20 22 40 | Jump to subroutine
    REP #$C2             ; C2 C2 | Reset processor status bits
    ASL $20              ; 06 20 | Arithmetic shift left (zero page)
    STA $4022,Y          ; 99 22 40 | Store accumulator to absolute,Y
    REP #$C2             ; C2 C2 | Reset processor status bits
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_3BB
; Address: $C59F30
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_3BB:
    JSR $8A22            ; 20 22 8A | Jump to subroutine
    LDX $00C2,Y          ; BE C2 00 | Load from absolute,Y into X register
    STA $00              ; 85 00 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_3BD
; Address: $C59F3D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_3BD:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    PHP                  ; 08 | Push processor status to stack
    STA $00              ; 85 00 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_3BE
; Address: $C59F44
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_3BE:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_3C0
; Address: $C59F50
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_3C0:
    JSL $C2CB70          ; 22 70 CB C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    BRA $00              ; 80 00 | Branch always
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_3C1
; Address: $C59F5A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_3C1:
    LDX #$18             ; A2 18 | Load immediate value into X register
    LDA $23EE            ; AD EE 23 | Load from absolute address into accumulator
    LDY $C29F            ; AC 9F C2 | Load from absolute address into Y register
    BEQ $0D              ; F0 0D | Branch if equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_3C2
; Address: $C59F66
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_3C2:
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    BPL $F0              ; 10 F0 | Branch if positive
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY $23E8            ; AC E8 23 | Load from absolute address into Y register
    STY $2428            ; 8C 28 24 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_3C3
; Address: $C59F79
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_3C3:
    JSL $C2CAE0          ; 22 E0 CA C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BNE $1F              ; D0 1F | Branch if not equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_3C8
; Address: $C59F9C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_3C8:
    JSL $C2B054          ; 22 54 B0 C2 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_3CA
; Address: $C59FA6
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_3CA:
    JSL $C1A87A          ; 22 7A A8 C1 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_3CB
; Address: $C59FAC
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_3CB:
    ROR                  ; 6A | Rotate right (accumulator)
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    INY                  ; C8 | Increment Y register
    CMP $00              ; C5 00 | Compare accumulator (zero page)
    DEC $00              ; C6 00 | Decrement (zero page)
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    SEP #$00             ; E2 00 | Set processor status bits

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_3CC
; Address: $C59FCC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_3CC:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    WDM #$01             ; 42 01 | Reserved instruction
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_3D3
; Address: $C59FF4
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_3D3:
    JSL $C43414          ; 22 14 34 C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    SEC                  ; 38 | Set carry flag
    SBC $02              ; E5 02 | Subtract with carry (zero page)
    BEQ $1B              ; F0 1B | Branch if equal
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address
    STZ $BE83            ; 9C 83 BE | Store zero to absolute

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_3D4
; Address: $C5A006
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_3D4:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    WDM #$3A             ; 42 3A | Reserved instruction
    CPY $06              ; C4 06 | Compare Y register (zero page)
    SBC $22FF,X          ; FD FF 22 | Subtract with carry (absolute,X)
    TYA                  ; 98 | Transfer Y register to accumulator
    DEX                  ; CA | Decrement X register
    REP #$3F             ; C2 3F | Reset processor status bits

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_3D6
; Address: $C5A01B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_3D6:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    EOR ($01,X)          ; 41 01 | Exclusive OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_3E2
; Address: $C5A060
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_3E2:
    JSR $E538            ; 20 38 E5 | Jump to subroutine
    BEQ $0C              ; F0 0C | Branch if equal
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address
    STZ $BE83            ; 9C 83 BE | Store zero to absolute

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_3E4
; Address: $C5A072
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_3E4:
    JSL $C43672          ; 22 72 36 C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    CMP $04              ; C5 04 | Compare accumulator (zero page)
    BEQ $02              ; F0 02 | Branch if equal
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_3E6
; Address: $C5A083
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_3E6:
    EOR ($01,X)          ; 41 01 | Exclusive OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_3EE
; Address: $C5A0AE
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_3EE:
    JSL $C437C1          ; 22 C1 37 C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    SEC                  ; 38 | Set carry flag
    SBC $02              ; E5 02 | Subtract with carry (zero page)
    BEQ $0C              ; F0 0C | Branch if equal
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address
    STZ $BE83            ; 9C 83 BE | Store zero to absolute

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_3F0
; Address: $C5A0C6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_3F0:
    JSL $C43808          ; 22 08 38 C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    CMP $04              ; C5 04 | Compare accumulator (zero page)
    BEQ $02              ; F0 02 | Branch if equal
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_3F1
; Address: $C5A0D3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_3F1:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    EOR ($01,X)          ; 41 01 | Exclusive OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_3F9
; Address: $C5A102
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_3F9:
    JSL $C438FB          ; 22 FB 38 C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    SEC                  ; 38 | Set carry flag
    SBC $02              ; E5 02 | Subtract with carry (zero page)
    BEQ $0C              ; F0 0C | Branch if equal
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_3FB
; Address: $C5A114
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_3FB:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    AND #$39             ; 29 39 | Logical AND with accumulator (immediate)
    CPY $06              ; C4 06 | Compare Y register (zero page)
    SBC $C5FF,X          ; FD FF C5 | Subtract with carry (absolute,X)
    BEQ $02              ; F0 02 | Branch if equal
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_3FC
; Address: $C5A127
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_3FC:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    EOR ($01,X)          ; 41 01 | Exclusive OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_404
; Address: $C5A156
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_404:
    JSL $C4350C          ; 22 0C 35 C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    SEC                  ; 38 | Set carry flag
    SBC $02              ; E5 02 | Subtract with carry (zero page)
    BEQ $0C              ; F0 0C | Branch if equal
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address
    STZ $BE83            ; 9C 83 BE | Store zero to absolute

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_405
; Address: $C5A168
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_405:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    PHA                  ; 48 | Push accumulator to stack
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    EOR $C435,X          ; 5D 35 C4 | Exclusive OR with accumulator (absolute,X)
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    CMP $04              ; C5 04 | Compare accumulator (zero page)
    BEQ $02              ; F0 02 | Branch if equal
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_406
; Address: $C5A17B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_406:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    EOR ($01,X)          ; 41 01 | Exclusive OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_40D
; Address: $C5A1A3
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_40D:
    JSL $C43041          ; 22 41 30 C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    SEC                  ; 38 | Set carry flag
    SBC $02              ; E5 02 | Subtract with carry (zero page)
    BEQ $0E              ; F0 0E | Branch if equal
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address
    STZ $BE83            ; 9C 83 BE | Store zero to absolute

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_40E
; Address: $C5A1B5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_40E:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    EOR #$01             ; 49 01 | Exclusive OR with accumulator (immediate)
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_40F
; Address: $C5A1BD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_40F:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    EOR ($01,X)          ; 41 01 | Exclusive OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_416
; Address: $C5A1E5
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_416:
    JSL $C43231          ; 22 31 32 C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    SEC                  ; 38 | Set carry flag
    SBC $02              ; E5 02 | Subtract with carry (zero page)
    BEQ $0E              ; F0 0E | Branch if equal
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address
    STZ $BE83            ; 9C 83 BE | Store zero to absolute

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_417
; Address: $C5A1F7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_417:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    LSR                  ; 4A | Logical shift right (accumulator)
    ORA ($38,X)          ; 01 38 | Logical OR with accumulator ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_418
; Address: $C5A1FF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_418:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    EOR ($01,X)          ; 41 01 | Exclusive OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_41A
; Address: $C5A20D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_41A:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    PHP                  ; 08 | Push processor status to stack
    STA $02              ; 85 02 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_41E
; Address: $C5A223
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_41E:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    SBC $02              ; E5 02 | Subtract with carry (zero page)
    BEQ $0E              ; F0 0E | Branch if equal
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address
    STZ $BE83            ; 9C 83 BE | Store zero to absolute

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_41F
; Address: $C5A233
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_41F:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    EOR $3800,X          ; 5D 00 38 | Exclusive OR with accumulator (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_420
; Address: $C5A23B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_420:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    EOR ($01,X)          ; 41 01 | Exclusive OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_421
; Address: $C5A243
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_421:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    JMP $6B01            ; 4C 01 6B | Jump to address
    LDX $23E8            ; AE E8 23 | Load from absolute address into X register
    STX $2428            ; 8E 28 24 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_422
; Address: $C5A250
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_422:
    JSL $C2CAD9          ; 22 D9 CA C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BNE $0B              ; D0 0B | Branch if not equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_423
; Address: $C5A25A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_423:
    JSL $C2CA5B          ; 22 5B CA C2 | Jump to subroutine long
    EOR #$20             ; 49 20 | Exclusive OR with accumulator (immediate)
    CMP #$87             ; C9 87 | Compare accumulator (immediate)
    BEQ $08              ; F0 08 | Branch if equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_424
; Address: $C5A265
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_424:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    EOR ($01,X)          ; 41 01 | Exclusive OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_426
; Address: $C5A272
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_426:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA #$88             ; A9 88 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_42A
; Address: $C5A28C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_42A:
    JSL $C2CB70          ; 22 70 CB C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_42B
; Address: $C5A294
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_42B:
    JSL $C2CB70          ; 22 70 CB C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_42E
; Address: $C5A2AF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_42E:
    JSL $C2CB70          ; 22 70 CB C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_430
; Address: $C5A2BD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_430:
    JSR $2200            ; 20 00 22 | Jump to subroutine
    BVS $CB              ; 70 CB | Branch if overflow set
    REP #$51             ; C2 51 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_432
; Address: $C5A2C7
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_432:
    JSL $C2CB70          ; 22 70 CB C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_433
; Address: $C5A2CF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_433:
    JSL $C2CB70          ; 22 70 CB C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_436
; Address: $C5A2E1
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_436:
    JSR $4022            ; 20 22 40 | Jump to subroutine
    REP #$C2             ; C2 C2 | Reset processor status bits
    ASL $20              ; 06 20 | Arithmetic shift left (zero page)
    STA $4022,Y          ; 99 22 40 | Store accumulator to absolute,Y
    REP #$C2             ; C2 C2 | Reset processor status bits
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_438
; Address: $C5A2F4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_438:
    JSR $4022            ; 20 22 40 | Jump to subroutine
    REP #$C2             ; C2 C2 | Reset processor status bits
    STA $00              ; 85 00 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_43C
; Address: $C5A30D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_43C:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    LSR $2201            ; 4E 01 22 | Logical shift right (absolute)
    CMP $C2CA,Y          ; D9 CA C2 | Compare accumulator (absolute,Y)
    DEC                  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_43F
; Address: $C5A322
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_43F:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    ORA ($A9,X)          ; 01 A9 | Logical OR with accumulator ((zero page,X))
    STA $FBC1            ; 8D C1 FB | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_440
; Address: $C5A32E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_440:
    JSL $C1E32E          ; 22 2E E3 C1 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_441
; Address: $C5A336
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_441:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    BIT $1801            ; 2C 01 18 | Test bits in accumulator (absolute)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_442
; Address: $C5A33E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_442:
    LDA $23E8            ; AD E8 23 | Load from absolute address into accumulator
    STA $2428            ; 8D 28 24 | Store accumulator to absolute address
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    STA $00              ; 85 00 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_443
; Address: $C5A349
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_443:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    ASL $22              ; 06 22 | Arithmetic shift left (zero page)
    LDA $22C2,Y          ; B9 C2 22 | Load from absolute,Y into accumulator
    DEC $C2CF            ; CE CF C2 | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_444
; Address: $C5A356
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_444:
    JSL $C2B054          ; 22 54 B0 C2 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_445
; Address: $C5A35C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_445:
    JSL $C012D1          ; 22 D1 12 C0 | Jump to subroutine long
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    INC                  ; 1A | Increment accumulator
    LDX $23E8            ; AE E8 23 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_447
; Address: $C5A36C
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_447:
    JSR $000C            ; 20 0C 00 | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_44B
; Address: $C5A382
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_44B:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    TAY                  ; A8 | Transfer accumulator to Y register
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_44E
; Address: $C5A395
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_44E:
    JSR $8DB0            ; 20 B0 8D | Jump to subroutine
    LDA $00              ; A5 00 | Load from zero page into accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    CLC                  ; 18 | Clear carry flag
    ADC $00              ; 65 00 | Add with carry (zero page)
    STA $00              ; 85 00 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_450
; Address: $C5A3A4
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_450:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_452
; Address: $C5A3B1
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_452:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    CMP $2000,X          ; DD 00 20 | Compare accumulator (absolute,X)
    BCS $8D              ; B0 8D | Branch if carry set
    LDA $00              ; A5 00 | Load from zero page into accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_455
; Address: $C5A3C6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_455:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    DEC $1800,X          ; DE 00 18 | Decrement (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_456
; Address: $C5A3CE
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_456:
    LDA $23E8            ; AD E8 23 | Load from absolute address into accumulator
    STA $2428            ; 8D 28 24 | Store accumulator to absolute address
    LDA $23EE            ; AD EE 23 | Load from absolute address into accumulator
    STA $242A            ; 8D 2A 24 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_458
; Address: $C5A3E2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_458:
    JSL $C01146          ; 22 46 11 C0 | Jump to subroutine long
    LDA $01              ; A5 01 | Load from zero page into accumulator
    STA $00              ; 85 00 | Store accumulator to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_459
; Address: $C5A3EB
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_459:
    JSL $C012D1          ; 22 D1 12 C0 | Jump to subroutine long
    INC                  ; 1A | Increment accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDA $23E8            ; AD E8 23 | Load from absolute address into accumulator
    STA $2428            ; 8D 28 24 | Store accumulator to absolute address
    LDA $23EE            ; AD EE 23 | Load from absolute address into accumulator
    STA $242A            ; 8D 2A 24 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_45A
; Address: $C5A3FD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_45A:
    JSL $C2C240          ; 22 40 C2 C2 | Jump to subroutine long
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_45B
; Address: $C5A406
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_45B:
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_45C
; Address: $C5A410
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_45C:
    JSR $A3EB            ; 20 EB A3 | Jump to subroutine
    BCC $07              ; 90 07 | Branch if carry clear
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_45D
; Address: $C5A41F
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_45D:
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    PEA #$23AB           ; F4 AB 23 | Push effective address to stack
    PEA #$0030           ; F4 30 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_45E
; Address: $C5A434
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_45E:
    JSL $C902E9          ; 22 E9 02 C9 | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    PEA #$23AE           ; F4 AE 23 | Push effective address to stack
    PEA #$0020           ; F4 20 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_460
; Address: $C5A448
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_460:
    JSR $A44E            ; 20 4E A4 | Jump to subroutine
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_461
; Address: $C5A44E
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_461:
    JSL $C28375          ; 22 75 83 C2 | Jump to subroutine long
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDA $243E,Y          ; B9 3E 24 | Load from absolute,Y into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP #$18             ; C9 18 | Compare accumulator (immediate)
    BCS $18              ; B0 18 | Branch if carry set
    STA $2428            ; 8D 28 24 | Store accumulator to absolute address
    TAX                  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_462
; Address: $C5A464
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_462:
    JSL $C2CAD9          ; 22 D9 CA C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    BEQ $0A              ; F0 0A | Branch if equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_464
; Address: $C5A475
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_464:
    JSR $A47F            ; 20 7F A4 | Jump to subroutine
    INY                  ; C8 | Increment Y register
    CPY #$18             ; C0 18 | Compare Y register (immediate)
    BCC $D7              ; 90 D7 | Branch if carry clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_467
; Address: $C5A48C
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_467:
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    INC $23D0            ; EE D0 23 | Increment (absolute)
    PEA #$2011           ; F4 11 20 | Push effective address to stack
    PEA #$0040           ; F4 40 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_468
; Address: $C5A4A2
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_468:
    JSL $C9029E          ; 22 9E 02 C9 | Jump to subroutine long
    BNE $0D              ; D0 0D | Branch if not equal
    LDA $23D0            ; AD D0 23 | Load from absolute address into accumulator
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    BCC $33              ; 90 33 | Branch if carry clear
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    BRA $1A              ; 80 1A | Branch always

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_469
; Address: $C5A4B5
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_469:
    LDA $23D0            ; AD D0 23 | Load from absolute address into accumulator
    CMP #$0A             ; C9 0A | Compare accumulator (immediate)
    BCC $26              ; 90 26 | Branch if carry clear
    PEA #$23AB           ; F4 AB 23 | Push effective address to stack
    PEA #$000F           ; F4 0F 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_46A
; Address: $C5A4C6
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_46A:
    JSL $C9029E          ; 22 9E 02 C9 | Jump to subroutine long
    BNE $10              ; D0 10 | Branch if not equal
    LDA #$07             ; A9 07 | Load immediate value into accumulator
    PEA #$23AB           ; F4 AB 23 | Push effective address to stack
    PEA #$000F           ; F4 0F 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_46B
; Address: $C5A4D8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_46B:
    JSL $C902E9          ; 22 E9 02 C9 | Jump to subroutine long
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_46C
; Address: $C5A4E6
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_46C:
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    PEA #$23AF           ; F4 AF 23 | Push effective address to stack
    PEA #$0004           ; F4 04 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_46E
; Address: $C5A500
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_46E:
    JSR $A521            ; 20 21 A5 | Jump to subroutine
    PEA #$23AB           ; F4 AB 23 | Push effective address to stack
    PEA #$000F           ; F4 0F 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_46F
; Address: $C5A50C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_46F:
    JSL $C9029E          ; 22 9E 02 C9 | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $90              ; A5 90 | Load from zero page into accumulator
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_471
; Address: $C5A527
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_471:
    JSL $C2CAD9          ; 22 D9 CA C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    BEQ $22              ; F0 22 | Branch if equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_476
; Address: $C5A54F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_476:
    JSL $C2B6A6          ; 22 A6 B6 C2 | Jump to subroutine long
    DEX                  ; CA | Decrement X register
    BPL $CE              ; 10 CE | Branch if positive

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_479
; Address: $C5A561
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_479:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    ROL                  ; 2A | Rotate left (accumulator)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_47A
; Address: $C5A567
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_47A:
    LDA #$A6             ; A9 A6 | Load immediate value into accumulator
    LDA $A70FA6          ; AF A6 0F A7 | Load from absolute long address into accumulator
    ADC $BBA5,Y          ; 79 A5 BB | Add with carry (absolute,Y)
    LDA $FF              ; A5 FF | Load from zero page into accumulator
    LDA $A7              ; A5 A7 | Load from zero page into accumulator
    LDX $22              ; A6 22 | Load from zero page into X register
    EOR ($22),Y          ; 51 22 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_47F
; Address: $C5A58F
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_47F:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    EOR $AD01,X          ; 5D 01 AD | Exclusive OR with accumulator (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    BIT $22              ; 24 22 | Test bits in accumulator (zero page)
    BIT #$E5             ; 89 E5 | Test bits in accumulator (immediate)
    CMP ($B0,X)          ; C1 B0 | Compare accumulator ((zero page,X))
    ASL $22              ; 06 22 | Arithmetic shift left (zero page)
    PLP                  ; 28 | Pull processor status from stack
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    SBC ($22),Y          ; F1 22 | Subtract with carry ((zero page),Y)
    STZ $E2              ; 64 E2 | Store zero to zero page
    CMP ($20,X)          ; C1 20 | Compare accumulator ((zero page,X))
    TAX                  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_481
; Address: $C5A5B0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_481:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    LSR $2001,X          ; 5E 01 20 | Logical shift right (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    TAX                  ; AA | Transfer accumulator to X register
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_482
; Address: $C5A5BB
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_482:
    PEA #$23AD           ; F4 AD 23 | Push effective address to stack
    PEA #$0080           ; F4 80 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_484
; Address: $C5A5CA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_484:
    JSR $A66C            ; 20 6C A6 | Jump to subroutine
    LDA $23D0            ; AD D0 23 | Load from absolute address into accumulator
    CMP #$0A             ; C9 0A | Compare accumulator (immediate)
    BCS $12              ; B0 12 | Branch if carry set

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_486
; Address: $C5A5D8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_486:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    TAX                  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_487
; Address: $C5A5E1
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_487:
    JSL $C1E264          ; 22 64 E2 C1 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_48B
; Address: $C5A5F3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_48B:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    STZ $E2              ; 64 E2 | Store zero to zero page
    CMP ($18,X)          ; C1 18 | Compare accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_495
; Address: $C5A625
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_495:
    JSL $C1E264          ; 22 64 E2 C1 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_496
; Address: $C5A62B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_496:
    LDA $981A            ; AD 1A 98 | Load from absolute address into accumulator
    STA $2478            ; 8D 78 24 | Store accumulator to absolute address
    LDX #$FF             ; A2 FF | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_498
; Address: $C5A639
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_498:
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $3374            ; AD 74 33 | Load from absolute address into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $337C,Y          ; B9 7C 33 | Load from absolute,Y into accumulator
    CMP #$08             ; C9 08 | Compare accumulator (immediate)
    BCS $11              ; B0 11 | Branch if carry set
    CMP #$05             ; C9 05 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_499
; Address: $C5A64C
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_499:
    BCS $0E              ; B0 0E | Branch if carry set
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BCC $0B              ; 90 0B | Branch if carry clear
    LDA $3384,Y          ; B9 84 33 | Load from absolute,Y into accumulator
    BEQ $06              ; F0 06 | Branch if equal
    BRA $02              ; 80 02 | Branch always
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA                  ; BF 66 A6 C2 | Load from absolute long,X into accumulator
    STA $2478            ; 8D 78 24 | Store accumulator to absolute address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_49A
; Address: $C5A666
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_49A:
    ROL $2F00            ; 2E 00 2F | Rotate left (absolute)
    BMI $00              ; 30 00 | Branch if negative
    LDA #$23             ; A9 23 | Load immediate value into accumulator
    STA $BE77            ; 8D 77 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_49C
; Address: $C5A67A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_49C:
    JSL $C01407          ; 22 07 14 C0 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    STA $23E4            ; 8D E4 23 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_49D
; Address: $C5A683
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_49D:
    JSL $C4297C          ; 22 7C 29 C4 | Jump to subroutine long
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    INY                  ; C8 | Increment Y register
    DEX                  ; CA | Decrement X register
    BMI $16              ; 30 16 | Branch if negative

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_49E
; Address: $C5A690
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_49E:
    JSL $C43F87          ; 22 87 3F C4 | Jump to subroutine long
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $F0              ; D0 F0 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_49F
; Address: $C5A69C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_49F:
    JSL $C42F5E          ; 22 5E 2F C4 | Jump to subroutine long
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    STA $BE77            ; 8D 77 BE | Store accumulator to absolute address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4A1
; Address: $C5A6A9
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4A1:
    STA $C2D13F          ; 8F 3F D1 C2 | Store accumulator to absolute long address
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4A2
; Address: $C5A6AF
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4A2:
    JSL $C1E32E          ; 22 2E E3 C1 | Jump to subroutine long
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    LDX #$00             ; A2 00 | Load immediate value into X register
    PEA #$23AB           ; F4 AB 23 | Push effective address to stack
    PEA #$00C0           ; F4 C0 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4A3
; Address: $C5A6C1
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4A3:
    JSL $C9029E          ; 22 9E 02 C9 | Jump to subroutine long
    BEQ $0C              ; F0 0C | Branch if equal
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4A4
; Address: $C5A6C8
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4A4:
    INX                  ; E8 | Increment X register
    DEC                  ; 3A | Decrement accumulator
    BEQ $07              ; F0 07 | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    DEC                  ; 3A | Decrement accumulator
    BEQ $02              ; F0 02 | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    BRA $8D              ; 80 8D | Branch always
    CPX $23              ; E4 23 | Compare X register (zero page)
    LDA                  ; BF 07 A7 C2 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4A6
; Address: $C5A6E1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4A6:
    JSL $C1E59C          ; 22 9C E5 C1 | Jump to subroutine long
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BCS $06              ; B0 06 | Branch if carry set

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4AE
; Address: $C5A702
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4AE:
    JSR $AAF8            ; 20 F8 AA | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4B1
; Address: $C5A70F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4B1:
    JSL $C1E255          ; 22 55 E2 C1 | Jump to subroutine long
    LDA #$42             ; A9 42 | Hardware register operation
    STA $23E4            ; 8D E4 23 | Store accumulator to absolute address
    LDA #$1F             ; A9 1F | Load immediate value into accumulator
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4B2
; Address: $C5A71D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4B2:
    JSL $C2B9A6          ; 22 A6 B9 C2 | Jump to subroutine long
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BCS $05              ; B0 05 | Branch if carry set
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4B3
; Address: $C5A72C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4B3:
    JSL $C1A87A          ; 22 7A A8 C1 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4B5
; Address: $C5A734
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4B5:
    JSL $C1E255          ; 22 55 E2 C1 | Jump to subroutine long
    LDA #$42             ; A9 42 | Hardware register operation
    STA $23E4            ; 8D E4 23 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4B8
; Address: $C5A746
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4B8:
    JSR $A7A1            ; 20 A1 A7 | Jump to subroutine
    PHA                  ; 48 | Push accumulator to stack
    LDA $23DC            ; AD DC 23 | Load from absolute address into accumulator
    STA $00              ; 85 00 | Store accumulator to zero page
    LDA $23DE            ; AD DE 23 | Load from absolute address into accumulator
    STA $02              ; 85 02 | Store accumulator to zero page
    LDX #$00             ; A2 00 | Load immediate value into X register
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4B9
; Address: $C5A758
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4B9:
    JSL $C01243          ; 22 43 12 C0 | Jump to subroutine long
    LDA $00              ; A5 00 | Load from zero page into accumulator
    STA $23DC            ; 8D DC 23 | Store accumulator to absolute address
    LDA $02              ; A5 02 | Load from zero page into accumulator
    STA $23DE            ; 8D DE 23 | Store accumulator to absolute address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4BA
; Address: $C5A767
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4BA:
    LDA $23DC            ; AD DC 23 | Load from absolute address into accumulator
    ORA $23DE            ; 0D DE 23 | Logical OR with accumulator (absolute)
    BEQ $31              ; F0 31 | Branch if equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4BB
; Address: $C5A76F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4BB:
    JSR $AAF3            ; 20 F3 AA | Jump to subroutine
    LDA #$42             ; A9 42 | Hardware register operation
    STA $23E4            ; 8D E4 23 | Store accumulator to absolute address
    LDA #$28             ; A9 28 | Load immediate value into accumulator
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4BC
; Address: $C5A77C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4BC:
    JSR $A7A1            ; 20 A1 A7 | Jump to subroutine
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BCS $05              ; B0 05 | Branch if carry set
    LDA #$29             ; A9 29 | Load immediate value into accumulator
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4BD
; Address: $C5A78A
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4BD:
    JSL $C1A87A          ; 22 7A A8 C1 | Jump to subroutine long
    LDA $23DC            ; AD DC 23 | Load from absolute address into accumulator
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address
    LDA $23DE            ; AD DE 23 | Load from absolute address into accumulator
    STA $BE83            ; 8D 83 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4BE
; Address: $C5A79A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4BE:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    ROL                  ; 2A | Rotate left (accumulator)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4C3
; Address: $C5A7B3
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4C3:
    JSL $C2B9A6          ; 22 A6 B9 C2 | Jump to subroutine long
    TAX                  ; AA | Transfer accumulator to X register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    DEX                  ; CA | Decrement X register
    BMI $2D              ; 30 2D | Branch if negative

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4C4
; Address: $C5A7BE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4C4:
    JSL $C43F87          ; 22 87 3F C4 | Jump to subroutine long
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4C5
; Address: $C5A7C8
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4C5:
    BNE $1E              ; D0 1E | Branch if not equal
    LDA $23DC            ; AD DC 23 | Load from absolute address into accumulator
    STA $00              ; 85 00 | Store accumulator to zero page
    LDA $23DE            ; AD DE 23 | Load from absolute address into accumulator
    STA $02              ; 85 02 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4C7
; Address: $C5A7DB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4C7:
    JSL $C43C52          ; 22 52 3C C4 | Jump to subroutine long
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    BCC $05              ; 90 05 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4C8
; Address: $C5A7E3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4C8:
    JSR $A7EC            ; 20 EC A7 | Jump to subroutine
    BRA $F3              ; 80 F3 | Branch always
    INY                  ; C8 | Increment Y register
    BRA $D0              ; 80 D0 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4CA
; Address: $C5A7EF
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4CA:
    JSL $C1E32E          ; 22 2E E3 C1 | Jump to subroutine long
    PLP                  ; 28 | Pull processor status from stack
    PHX                  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4CB
; Address: $C5A7F6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4CB:
    JSL $C2AF66          ; 22 66 AF C2 | Jump to subroutine long
    STX $23E4            ; 8E E4 23 | Store X register to absolute address
    PLX                  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4CC
; Address: $C5A7FE
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4CC:
    JSL $C42FEB          ; 22 EB 2F C4 | Jump to subroutine long
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address
    STZ $BE83            ; 9C 83 BE | Store zero to absolute
    STZ $BE87            ; 9C 87 BE | Store zero to absolute

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4CE
; Address: $C5A814
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4CE:
    JSL $C1E59C          ; 22 9C E5 C1 | Jump to subroutine long
    PLP                  ; 28 | Pull processor status from stack
    BCS $06              ; B0 06 | Branch if carry set

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4D1
; Address: $C5A826
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4D1:
    JSL $C1E264          ; 22 64 E2 C1 | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    PEA #$23AF           ; F4 AF 23 | Push effective address to stack
    PEA #$0004           ; F4 04 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4D2
; Address: $C5A836
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4D2:
    JSL $C902E9          ; 22 E9 02 C9 | Jump to subroutine long
    LDA $4069            ; AD 69 40 | Load from absolute address into accumulator
    ORA $406B            ; 0D 6B 40 | Logical OR with accumulator (absolute)
    BEQ $1F              ; F0 1F | Branch if equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4D3
; Address: $C5A842
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4D3:
    JSR $AAF3            ; 20 F3 AA | Jump to subroutine
    LDA $4069            ; AD 69 40 | Load from absolute address into accumulator
    BEQ $09              ; F0 09 | Branch if equal
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4D4
; Address: $C5A84D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4D4:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    BIT $AD00            ; 2C 00 AD | Test bits in accumulator (absolute)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4D5
; Address: $C5A855
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4D5:
    RTI                  ; 40 | Return from interrupt
    BEQ $09              ; F0 09 | Branch if equal
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4D6
; Address: $C5A85B
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4D6:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    AND $AD00            ; 2D 00 AD | Logical AND with accumulator (absolute)
    ADC $0D40            ; 6D 40 0D | Add with carry (absolute)
    RTI                  ; 40 | Return from interrupt
    ORA $4071            ; 0D 71 40 | Logical OR with accumulator (absolute)
    ORA $4073            ; 0D 73 40 | Logical OR with accumulator (absolute)
    ORA $4075            ; 0D 75 40 | Logical OR with accumulator (absolute)
    BEQ $3F              ; F0 3F | Branch if equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4D8
; Address: $C5A875
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4D8:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    ROL $AD00            ; 2E 00 AD | Rotate left (absolute)
    ADC $8D40            ; 6D 40 8D | Add with carry (absolute)
    STA ($BE,X)          ; 81 BE | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4D9
; Address: $C5A881
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4D9:
    JSR $A8E3            ; 20 E3 A8 | Jump to subroutine
    LDA $406F            ; AD 6F 40 | Load from absolute address into accumulator
    STA $BE85            ; 8D 85 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4DA
; Address: $C5A88A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4DA:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    LDA $4071            ; AD 71 40 | Load from absolute address into accumulator
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4DB
; Address: $C5A896
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4DB:
    JSR $A8E3            ; 20 E3 A8 | Jump to subroutine
    LDA $4073            ; AD 73 40 | Load from absolute address into accumulator
    STA $BE85            ; 8D 85 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4DC
; Address: $C5A89F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4DC:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    BMI $00              ; 30 00 | Branch if negative
    LDA $4075            ; AD 75 40 | Load from absolute address into accumulator
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4DD
; Address: $C5A8AB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4DD:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    LDX #$00             ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4DE
; Address: $C5A8B6
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4DE:
    JSL $C458C8          ; 22 C8 58 C4 | Jump to subroutine long
    SBC $23B0,X          ; FD B0 23 | Subtract with carry (absolute,X)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BNE $07              ; D0 07 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4E3
; Address: $C5A8D2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4E3:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    INX                  ; E8 | Increment X register
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$03             ; 29 03 | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    BRA $D6              ; 80 D6 | Branch always

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4E4
; Address: $C5A8E0
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4E4:
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4E5
; Address: $C5A8E3
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4E5:
    PHX                  ; DA | Push X register to stack
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $BE81            ; AD 81 BE | Load from absolute address into accumulator
    CMP #$64             ; C9 64 | Compare accumulator (immediate)
    BCS $09              ; B0 09 | Branch if carry set
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CMP #$0A             ; C9 0A | Compare accumulator (immediate)
    BCS $02              ; B0 02 | Branch if carry set
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA                  ; BF 01 A9 C2 | Load from absolute long,X into accumulator
    STA $BE77            ; 8D 77 BE | Store accumulator to absolute address
    PLX                  ; FA | Pull X register from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4E9
; Address: $C5A910
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4E9:
    STZ $00              ; 64 00 | Store zero to zero page
    STZ $02              ; 64 02 | Store zero to zero page
    LDX #$06             ; A2 06 | Load immediate value into X register
    LDA $2008,X          ; BD 08 20 | Load from absolute,X into accumulator
    CLC                  ; 18 | Clear carry flag
    BEQ $01              ; F0 01 | Branch if equal
    SEC                  ; 38 | Set carry flag
    ROL $00              ; 26 00 | Rotate left (zero page)
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    BPL $F3              ; 10 F3 | Branch if positive
    LDX #$00             ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4EA
; Address: $C5A927
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4EA:
    JSL $C01407          ; 22 07 14 C0 | Jump to subroutine long
    BCC $5A              ; 90 5A | Branch if carry clear
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $2000,X          ; BD 00 20 | Load from absolute,X into accumulator
    STA $BE71            ; 8D 71 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4EC
; Address: $C5A93A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4EC:
    JSL $C4297C          ; 22 7C 29 C4 | Jump to subroutine long
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4ED
; Address: $C5A943
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4ED:
    JSL $C2AF66          ; 22 66 AF C2 | Jump to subroutine long
    STX $23E4            ; 8E E4 23 | Store X register to absolute address
    STX $2428            ; 8E 28 24 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4F1
; Address: $C5A95B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4F1:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    PLP                  ; 28 | Pull processor status from stack
    BCS $20              ; B0 20 | Branch if carry set

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4F2
; Address: $C5A962
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4F2:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    BIT $C9              ; 24 C9 | Test bits in accumulator (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BNE $16              ; D0 16 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4F3
; Address: $C5A96C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4F3:
    JSL $C2C240          ; 22 40 C2 C2 | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    INC                  ; 1A | Increment accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDA $00              ; A5 00 | Load from zero page into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4F4
; Address: $C5A979
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4F4:
    JSL $C0135F          ; 22 5F 13 C0 | Jump to subroutine long
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))
    BCC $07              ; 90 07 | Branch if carry clear
    INY                  ; C8 | Increment Y register
    CPY $02              ; C4 02 | Compare Y register (zero page)
    BNE $BC              ; D0 BC | Branch if not equal
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4F5
; Address: $C5A989
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4F5:
    LDA $242C            ; AD 2C 24 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $F6              ; F0 F6 | Branch if equal
    STA $BE79            ; 8D 79 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4F6
; Address: $C5A994
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4F6:
    JSL $C44739          ; 22 39 47 C4 | Jump to subroutine long
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    BCC $05              ; 90 05 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4F9
; Address: $C5A9A6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4F9:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4FA
; Address: $C5A9AE
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4FA:
    PEA #$23A9           ; F4 A9 23 | Push effective address to stack
    PEA #$00FF           ; F4 FF 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4FB
; Address: $C5A9B7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4FB:
    JSL $C9029E          ; 22 9E 02 C9 | Jump to subroutine long
    BEQ $57              ; F0 57 | Branch if equal
    STA $BE71            ; 8D 71 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_4FE
; Address: $C5A9C9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_4FE:
    LDA $242C            ; AD 2C 24 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $43              ; F0 43 | Branch if equal
    STA $BE79            ; 8D 79 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_500
; Address: $C5A9D7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_500:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    LDA #$42             ; A9 42 | Hardware register operation
    STA $23E4            ; 8D E4 23 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_504
; Address: $C5A9F8
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_504:
    JSL $C44824          ; 22 24 48 C4 | Jump to subroutine long
    STA $BE77            ; 8D 77 BE | Store accumulator to absolute address
    LDX #$37             ; A2 37 | Load immediate value into X register
    CMP #$20             ; C9 20 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    LDX #$36             ; A2 36 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_507
; Address: $C5AA15
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_507:
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_509
; Address: $C5AA23
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_509:
    JSL $C2CC92          ; 22 92 CC C2 | Jump to subroutine long
    ORA $3800,X          ; 1D 00 38 | Logical OR with accumulator (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF 34 AA C2 | Load from absolute long,X into accumulator
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_50C
; Address: $C5AA4B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_50C:
    LDA $23E0            ; AD E0 23 | Load from absolute address into accumulator
    ORA $23E2            ; 0D E2 23 | Logical OR with accumulator (absolute)
    BEQ $6C              ; F0 6C | Branch if equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_50D
; Address: $C5AA53
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_50D:
    JSL $C2B9A6          ; 22 A6 B9 C2 | Jump to subroutine long
    TAY                  ; A8 | Transfer accumulator to Y register
    DEY                  ; 88 | Decrement Y register
    BMI $64              ; 30 64 | Branch if negative

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_511
; Address: $C5AA70
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_511:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    BIT $B0              ; 24 B0 | Test bits in accumulator (zero page)
    SBC ($C9,X)          ; E1 C9 | Subtract with carry ((zero page,X))
    BNE $DC              ; D0 DC | Branch if not equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_512
; Address: $C5AA7C
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_512:
    JSL $C012D1          ; 22 D1 12 C0 | Jump to subroutine long
    AND #$03             ; 29 03 | Logical AND with accumulator (immediate)
    BNE $D3              ; D0 D3 | Branch if not equal
    LDA $23E0            ; AD E0 23 | Load from absolute address into accumulator
    STA $00              ; 85 00 | Store accumulator to zero page
    LDA $23E2            ; AD E2 23 | Load from absolute address into accumulator
    STA $02              ; 85 02 | Store accumulator to zero page
    LSR $02              ; 46 02 | Logical shift right (zero page)
    ROR $00              ; 66 00 | Rotate right (zero page)
    LSR $02              ; 46 02 | Logical shift right (zero page)
    ROR $00              ; 66 00 | Rotate right (zero page)
    LSR $02              ; 46 02 | Logical shift right (zero page)
    ROR $00              ; 66 00 | Rotate right (zero page)
    INC $00              ; E6 00 | Increment (zero page)
    BNE $02              ; D0 02 | Branch if not equal
    INC $02              ; E6 02 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_513
; Address: $C5AAA1
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_513:
    JSL $C45B1A          ; 22 1A 5B C4 | Jump to subroutine long
    LDA $00              ; A5 00 | Load from zero page into accumulator
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address
    LDA $02              ; A5 02 | Load from zero page into accumulator
    STA $BE83            ; 8D 83 BE | Store accumulator to absolute address
    LDA $2428            ; AD 28 24 | Load from absolute address into accumulator
    STA $23E4            ; 8D E4 23 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_515
; Address: $C5AAB9
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_515:
    JSL $C1A867          ; 22 67 A8 C1 | Jump to subroutine long
    DEC                  ; 3A | Decrement accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_516
; Address: $C5AAC0
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_516:
    LDA $23E0            ; AD E0 23 | Load from absolute address into accumulator
    STA $00              ; 85 00 | Store accumulator to zero page
    LDA $23E2            ; AD E2 23 | Load from absolute address into accumulator
    STA $02              ; 85 02 | Store accumulator to zero page
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    BEQ $24              ; F0 24 | Branch if equal
    LDA $00              ; A5 00 | Load from zero page into accumulator
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address
    LDA $02              ; A5 02 | Load from zero page into accumulator
    STA $BE83            ; 8D 83 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_517
; Address: $C5AAD8
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_517:
    JSL $C45B1A          ; 22 1A 5B C4 | Jump to subroutine long
    LDA $23DC            ; AD DC 23 | Load from absolute address into accumulator
    ORA $23DE            ; 0D DE 23 | Logical OR with accumulator (absolute)
    BNE $07              ; D0 07 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_51B
; Address: $C5AAF0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_51B:
    AND $6000,Y          ; 39 00 60 | Logical AND with accumulator (absolute,Y)
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    BRA $03              ; 80 03 | Branch always
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_51D
; Address: $C5AB00
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_51D:
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
; Bank0A_DmaFunction_522
; Address: $C5AB24
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_522:
    JSL $C2CB70          ; 22 70 CB C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    LDA $2426            ; AD 26 24 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_525
; Address: $C5AB3A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_525:
    JSL $C2CA98          ; 22 98 CA C2 | Jump to subroutine long
    EOR #$20             ; 49 20 | Exclusive OR with accumulator (immediate)
    LDA $2424            ; AD 24 24 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_527
; Address: $C5AB48
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_527:
    JSR $1EAD            ; 20 AD 1E | Jump to subroutine
    BIT $22              ; 24 22 | Test bits in accumulator (zero page)
    BVS $CB              ; 70 CB | Branch if overflow set
    REP #$50             ; C2 50 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_529
; Address: $C5AB57
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_529:
    JSL $C2CB70          ; 22 70 CB C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_52A
; Address: $C5AB5F
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_52A:
    JSR $ABA1            ; 20 A1 AB | Jump to subroutine
    LDA $2426            ; AD 26 24 | Load from absolute address into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $2420            ; AD 20 24 | Load from absolute address into accumulator
    STA $23FE,X          ; 9D FE 23 | Store accumulator to absolute,X
    INC $240E,X          ; FE 0E 24 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_52D
; Address: $C5AB76
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_52D:
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_52E
; Address: $C5AB7E
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_52E:
    LDA $23AC            ; AD AC 23 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $1A              ; D0 1A | Branch if not equal
    LDA $2426            ; AD 26 24 | Load from absolute address into accumulator
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BCS $12              ; B0 12 | Branch if carry set
    LDX $2420            ; AE 20 24 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_535
; Address: $C5ABAE
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_535:
    JSL $C2C240          ; 22 40 C2 C2 | Jump to subroutine long
    STA $00              ; 85 00 | Store accumulator to zero page
    PEA #$2011           ; F4 11 20 | Push effective address to stack
    PEA #$0020           ; F4 20 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_536
; Address: $C5ABBE
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_536:
    JSL $C9029E          ; 22 9E 02 C9 | Jump to subroutine long
    BNE $14              ; D0 14 | Branch if not equal
    LDA #$50             ; A9 50 | Load immediate value into accumulator
    STA $02              ; 85 02 | Store accumulator to zero page
    LDA #$64             ; A9 64 | Load immediate value into accumulator
    STA $04              ; 85 04 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_537
; Address: $C5ABCE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_537:
    JSL $C90B84          ; 22 84 0B C9 | Jump to subroutine long
    LDA $00              ; A5 00 | Load from zero page into accumulator
    BNE $02              ; D0 02 | Branch if not equal
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_538
; Address: $C5ABD8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_538:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    STA $00              ; 85 00 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_539
; Address: $C5ABE2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_539:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDX $2428            ; AE 28 24 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_53D
; Address: $C5ABF7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_53D:
    REP #$C2             ; C2 C2 | Reset processor status bits
    ASL $22              ; 06 22 | Arithmetic shift left (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator
    DEX                  ; CA | Decrement X register
    REP #$41             ; C2 41 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_53E
; Address: $C5ABFF
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_53E:
    JSR $4022            ; 20 22 40 | Jump to subroutine
    REP #$C2             ; C2 C2 | Reset processor status bits
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_540
; Address: $C5AC0A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_540:
    JSR $AE60            ; 20 60 AE | Jump to subroutine
    PLP                  ; 28 | Pull processor status from stack
    BIT $22              ; 24 22 | Test bits in accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    REP #$C2             ; C2 C2 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_542
; Address: $C5AC19
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_542:
    JSR $4022            ; 20 22 40 | Jump to subroutine
    REP #$C2             ; C2 C2 | Reset processor status bits
    ASL $22              ; 06 22 | Arithmetic shift left (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator
    DEX                  ; CA | Decrement X register
    REP #$41             ; C2 41 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_543
; Address: $C5AC24
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_543:
    JSR $4022            ; 20 22 40 | Jump to subroutine
    REP #$C2             ; C2 C2 | Reset processor status bits
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_545
; Address: $C5AC2F
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_545:
    JSR $1860            ; 20 60 18 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PEA #$23AC           ; F4 AC 23 | Push effective address to stack
    PEA #$0080           ; F4 80 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_546
; Address: $C5AC46
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_546:
    JSL $C9029E          ; 22 9E 02 C9 | Jump to subroutine long
    BNE $11              ; D0 11 | Branch if not equal
    LDA $2426            ; AD 26 24 | Load from absolute address into accumulator
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BCS $09              ; B0 09 | Branch if carry set
    LDX $2420            ; AE 20 24 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_548
; Address: $C5AC5D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_548:
    JSR $AC7C            ; 20 7C AC | Jump to subroutine
    STA $2428            ; 8D 28 24 | Store accumulator to absolute address
    BMI $05              ; 30 05 | Branch if negative

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_54A
; Address: $C5AC6A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_54A:
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    STA $2428            ; 8D 28 24 | Store accumulator to absolute address
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $7A              ; 06 7A | Arithmetic shift left (zero page)
    PLX                  ; FA | Pull X register from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_54C
; Address: $C5AC7F
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_54C:
    JSL $C2CB2B          ; 22 2B CB C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    BEQ $2A              ; F0 2A | Branch if equal
    INX                  ; E8 | Increment X register
    CPX #$18             ; E0 18 | Compare X register (immediate)
    BCC $F0              ; 90 F0 | Branch if carry clear
    LDX #$00             ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_54E
; Address: $C5AC97
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_54E:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BCS $0A              ; B0 0A | Branch if carry set

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_54F
; Address: $C5AC9F
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_54F:
    JSL $C2CB2B          ; 22 2B CB C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    BNE $0A              ; D0 0A | Branch if not equal
    INX                  ; E8 | Increment X register
    CPX #$18             ; E0 18 | Compare X register (immediate)
    BCC $E3              ; 90 E3 | Branch if carry clear
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_551
; Address: $C5ACB5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_551:
    LDA $241E            ; AD 1E 24 | Load from absolute address into accumulator
    BEQ $05              ; F0 05 | Branch if equal
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_553
; Address: $C5ACC4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_553:
    JSL $C2CB2B          ; 22 2B CB C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    BEQ $2F              ; F0 2F | Branch if equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_554
; Address: $C5ACCE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_554:
    JSL $C2CAD9          ; 22 D9 CA C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BNE $25              ; D0 25 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_555
; Address: $C5ACD8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_555:
    JSL $C2CA5B          ; 22 5B CA C2 | Jump to subroutine long
    EOR #$20             ; 49 20 | Exclusive OR with accumulator (immediate)
    CMP $2420            ; CD 20 24 | Compare accumulator (absolute)
    BNE $1A              ; D0 1A | Branch if not equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_557
; Address: $C5ACE8
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_557:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    TAY                  ; A8 | Transfer accumulator to Y register
    TXA                  ; 8A | Transfer X register to accumulator
    SEP #$20             ; E2 20 | Set processor status bits
    STA $2484,Y          ; 99 84 24 | Store accumulator to absolute,Y
    REP #$20             ; C2 20 | Reset processor status bits
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_558
; Address: $C5ACF5
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_558:
    JSL $C014F2          ; 22 F2 14 C0 | Jump to subroutine long
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    STA $00              ; 85 00 | Store accumulator to zero page
    DEX                  ; CA | Decrement X register
    BPL $C4              ; 10 C4 | Branch if positive
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDA $00              ; A5 00 | Load from zero page into accumulator
    BEQ $0D              ; F0 0D | Branch if equal
    BMI $0E              ; 30 0E | Branch if negative
    LDY #$10             ; A0 10 | Load immediate value into Y register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BCS $05              ; B0 05 | Branch if carry set
    DEY                  ; 88 | Decrement Y register
    BPL $FA              ; 10 FA | Branch if positive
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_559
; Address: $C5AD14
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_559:
    TYA                  ; 98 | Transfer Y register to accumulator
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_55A
; Address: $C5AD17
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_55A:
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    BEQ $0E              ; F0 0E | Branch if equal
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LSR                  ; 4A | Logical shift right (accumulator)
    BCC $F2              ; 90 F2 | Branch if carry clear
    INY                  ; C8 | Increment Y register
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    BCC $F7              ; 90 F7 | Branch if carry clear
    BRA $E8              ; 80 E8 | Branch always
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDA $2484,Y          ; B9 84 24 | Load from absolute,Y into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $2428            ; 8D 28 24 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_55B
; Address: $C5AD36
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_55B:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    BCS $08              ; B0 08 | Branch if carry set
    INY                  ; C8 | Increment Y register
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    BCC $EA              ; 90 EA | Branch if carry clear
    BRA $CD              ; 80 CD | Branch always
    LDX $2428            ; AE 28 24 | Load from absolute address into X register
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_55C
; Address: $C5AD4B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_55C:
    JSL $C2CB70          ; 22 70 CB C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    BRA $BF              ; 80 BF | Branch always

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_55D
; Address: $C5AD55
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_55D:
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
    SEP #$20             ; E2 20 | Set processor status bits

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_55E
; Address: $C5AD66
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_55E:
    JSL $C9050D          ; 22 0D 05 C9 | Jump to subroutine long
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    BMI $20              ; 30 20 | Branch if negative
    ROR $A000,X          ; 7E 00 A0 | Rotate right (absolute,X)
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    DEY                  ; 88 | Decrement Y register
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    DEY                  ; 88 | Decrement Y register
    BPL $FB              ; 10 FB | Branch if positive
    REP #$20             ; C2 20 | Reset processor status bits
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_55F
; Address: $C5AD86
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_55F:
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    PHX                  ; DA | Push X register to stack
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $F0              ; 80 F0 | Branch always
    AND $E0              ; 25 E0 | Game work RAM access
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    BEQ $4A              ; F0 4A | Branch if equal
    CPX #$42             ; E0 42 | Hardware register operation
    BEQ $30              ; F0 30 | Branch if equal
    CPX #$44             ; E0 44 | Compare X register (immediate)
    BEQ $1B              ; F0 1B | Branch if equal
    CPX #$48             ; E0 48 | Compare X register (immediate)
    BEQ $2B              ; F0 2B | Branch if equal
    CPX #$40             ; E0 40 | Compare X register (immediate)
    BCS $3B              ; B0 3B | Branch if carry set
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BCS $3C              ; B0 3C | Branch if carry set

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_560
; Address: $C5ADB3
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_560:
    JSR $AEF6            ; 20 F6 AE | Jump to subroutine
    PLX                  ; FA | Pull X register from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_561
; Address: $C5ADBA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_561:
    JSR $ADF4            ; 20 F4 AD | Jump to subroutine
    BRA $F7              ; 80 F7 | Branch always
    LDX $23E4            ; AE E4 23 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_563
; Address: $C5ADC7
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_563:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BCS $15              ; B0 15 | Branch if carry set

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_564
; Address: $C5ADCF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_564:
    JSR $AE32            ; 20 32 AE | Jump to subroutine
    BRA $E2              ; 80 E2 | Branch always
    LDX $23E4            ; AE E4 23 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_566
; Address: $C5ADDC
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_566:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BCS $EB              ; B0 EB | Branch if carry set

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_567
; Address: $C5ADE4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_567:
    JSR $AE9C            ; 20 9C AE | Jump to subroutine
    BRA $CD              ; 80 CD | Branch always
    LDY #$23             ; A0 23 | Load immediate value into Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    BRA $C7              ; 80 C7 | Branch always

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_568
; Address: $C5ADEF
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_568:
    JSR $AECC            ; 20 CC AE | Jump to subroutine
    BRA $C2              ; 80 C2 | Branch always
    PEA #$23A8           ; F4 A8 23 | Push effective address to stack
    PEA #$00FF           ; F4 FF 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_56A
; Address: $C5AE02
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_56A:
    JSL $C2CC70          ; 22 70 CC C2 | Jump to subroutine long
    TAY                  ; A8 | Transfer accumulator to Y register
    PEA #$23AC           ; F4 AC 23 | Push effective address to stack
    PEA #$0060           ; F4 60 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_56B
; Address: $C5AE12
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_56B:
    JSL $C9029E          ; 22 9E 02 C9 | Jump to subroutine long
    BEQ $0D              ; F0 0D | Branch if equal
    DEC                  ; 3A | Decrement accumulator
    BEQ $0F              ; F0 0F | Branch if equal
    DEC                  ; 3A | Decrement accumulator
    BEQ $10              ; F0 10 | Branch if equal
    LDY #$CD             ; A0 CD | Load immediate value into Y register
    LDA #$23             ; A9 23 | Load immediate value into accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_56C
; Address: $C5AE25
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_56C:
    LDY #$23             ; A0 23 | Load immediate value into Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_571
; Address: $C5AE39
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_571:
    JSL $C2B9A6          ; 22 A6 B9 C2 | Jump to subroutine long
    TAY                  ; A8 | Transfer accumulator to Y register
    LDX #$00             ; A2 00 | Load immediate value into X register
    DEY                  ; 88 | Decrement Y register
    BMI $1A              ; 30 1A | Branch if negative

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_572
; Address: $C5AE44
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_572:
    JSL $C43F87          ; 22 87 3F C4 | Jump to subroutine long
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BEQ $06              ; F0 06 | Branch if equal
    INX                  ; E8 | Increment X register
    BRA $EE              ; 80 EE | Branch always
    LDX #$00             ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_573
; Address: $C5AE56
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_573:
    JSL $C42F5E          ; 22 5E 2F C4 | Jump to subroutine long
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SBC $A260,X          ; FD 60 A2 | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_574
; Address: $C5AE61
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_574:
    JSR $AECC            ; 20 CC AE | Jump to subroutine
    CPY #$23             ; C0 23 | Compare Y register (immediate)
    BEQ $EA              ; F0 EA | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_575
; Address: $C5AE6A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_575:
    JSL $C2C739          ; 22 39 C7 C2 | Jump to subroutine long
    PHP                  ; 08 | Push processor status to stack
    PEA #$23AB           ; F4 AB 23 | Push effective address to stack
    PEA #$000F           ; F4 0F 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_576
; Address: $C5AE78
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_576:
    JSL $C9029E          ; 22 9E 02 C9 | Jump to subroutine long
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BEQ $0A              ; F0 0A | Branch if equal
    CMP #$06             ; C9 06 | Compare accumulator (immediate)
    BEQ $05              ; F0 05 | Branch if equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_578
; Address: $C5AE8B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_578:
    JSL $C270E1          ; 22 E1 70 C2 | Jump to subroutine long
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BCS $04              ; B0 04 | Branch if carry set
    LDA #$23             ; A9 23 | Load immediate value into accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_57A
; Address: $C5AE9C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_57A:
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDA #$03             ; A9 03 | Load immediate value into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $240E,X          ; BD 0E 24 | Load from absolute,X into accumulator
    BEQ $06              ; F0 06 | Branch if equal
    INY                  ; C8 | Increment Y register
    TXA                  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_57B
; Address: $C5AEAB
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_57B:
    LSR                  ; 4A | Logical shift right (accumulator)
    STA $2426            ; 8D 26 24 | Store accumulator to absolute address
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    BPL $F1              ; 10 F1 | Branch if positive
    TYA                  ; 98 | Transfer Y register to accumulator
    BEQ $0A              ; F0 0A | Branch if equal
    DEC                  ; 3A | Decrement accumulator
    BEQ $0C              ; F0 0C | Branch if equal
    LDY #$CD             ; A0 CD | Load immediate value into Y register
    LDA #$23             ; A9 23 | Load immediate value into accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_57C
; Address: $C5AEC0
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_57C:
    LDA #$23             ; A9 23 | Load immediate value into accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_57F
; Address: $C5AECC
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_57F:
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BEQ $1D              ; F0 1D | Branch if equal
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $23FE,X          ; BD FE 23 | Load from absolute,X into accumulator
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_580
; Address: $C5AEDB
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_580:
    JSL $C2CC70          ; 22 70 CC C2 | Jump to subroutine long
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $240E,X          ; BD 0E 24 | Load from absolute,X into accumulator
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BCS $04              ; B0 04 | Branch if carry set
    LDA #$23             ; A9 23 | Load immediate value into accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_583
; Address: $C5AEF6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_583:
    JSL $C2CB2B          ; 22 2B CB C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    BEQ $30              ; F0 30 | Branch if equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_584
; Address: $C5AF00
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_584:
    JSL $C2CAD9          ; 22 D9 CA C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BNE $2B              ; D0 2B | Branch if not equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_585
; Address: $C5AF0A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_585:
    JSL $C2CA5B          ; 22 5B CA C2 | Jump to subroutine long
    EOR #$20             ; 49 20 | Exclusive OR with accumulator (immediate)
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_58A
; Address: $C5AF22
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_58A:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF 46 AF C2 | Load from absolute long,X into accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_58C
; Address: $C5AF30
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_58C:
    LDY #$23             ; A0 23 | Load immediate value into Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_58E
; Address: $C5AF3B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_58E:
    JSL $C42F5E          ; 22 5E 2F C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    SBC $23A9,X          ; FD A9 23 | Subtract with carry (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_58F
; Address: $C5AF48
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_58F:
    BNE $02              ; D0 02 | Branch if not equal
    CMP ($02),Y          ; D1 02 | Compare accumulator ((zero page),Y)
    CLD                  ; D8 | Clear decimal mode flag
    CMP $DA02,Y          ; D9 02 DA | Compare accumulator (absolute,Y)
    CMP $DE02,X          ; DD 02 DE | Compare accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_590
; Address: $C5AF70
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_590:
    JSL $C429DA          ; 22 DA 29 C4 | Jump to subroutine long
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    LDX #$00             ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_591
; Address: $C5AF7B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_591:
    JSL $C2CB2B          ; 22 2B CB C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    BEQ $14              ; F0 14 | Branch if equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_592
; Address: $C5AF85
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_592:
    JSL $C2CB2B          ; 22 2B CB C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BEQ $0A              ; F0 0A | Branch if equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_593
; Address: $C5AF8F
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_593:
    JSL $C2CA5B          ; 22 5B CA C2 | Jump to subroutine long
    EOR #$20             ; 49 20 | Exclusive OR with accumulator (immediate)
    ORA ($F0,X)          ; 01 F0 | Logical OR with accumulator ((zero page,X))
    ORA $E0E8            ; 0D E8 E0 | Game work RAM access
    CLC                  ; 18 | Clear carry flag
    BCC $DC              ; 90 DC | Branch if carry clear
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    PLA                  ; 68 | Pull accumulator from stack
    PLB                  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_595
; Address: $C5AFAA
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_595:
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_596
; Address: $C5AFB7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_596:
    JSL $C43F87          ; 22 87 3F C4 | Jump to subroutine long
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    PHA                  ; 48 | Push accumulator to stack
    LDA #$78             ; A9 78 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_597
; Address: $C5AFC5
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_597:
    JSL $C44DC0          ; 22 C0 4D C4 | Jump to subroutine long
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    BVC $07              ; 50 07 | Branch if overflow clear
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    BPL $03              ; 10 03 | Branch if positive
    ORA ($83,X)          ; 01 83 | Logical OR with accumulator ((zero page,X))
    ORA ($F4,X)          ; 01 F4 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    PEA #$0003           ; F4 03 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_598
; Address: $C5AFDF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_598:
    JSL $C9029E          ; 22 9E 02 C9 | Jump to subroutine long
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $5B              ; D0 5B | Branch if not equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_59B
; Address: $C5AFF3
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_59B:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    BEQ $07              ; F0 07 | Branch if equal
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($83,X)          ; 01 83 | Logical OR with accumulator ((zero page,X))
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    REP #$51             ; C2 51 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_59C
; Address: $C5B004
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_59C:
    JSR $0010            ; 20 10 00 | Jump to subroutine
    BEQ $07              ; F0 07 | Branch if equal
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($83,X)          ; 01 83 | Logical OR with accumulator ((zero page,X))
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    REP #$51             ; C2 51 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_59D
; Address: $C5B015
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_59D:
    JSR $0004            ; 20 04 00 | Jump to subroutine
    BEQ $07              ; F0 07 | Branch if equal
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_59E
; Address: $C5B01E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_59E:
    ORA ($83,X)          ; 01 83 | Logical OR with accumulator ((zero page,X))
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    REP #$51             ; C2 51 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_59F
; Address: $C5B026
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_59F:
    JSR $0002            ; 20 02 00 | Jump to subroutine
    BEQ $07              ; F0 07 | Branch if equal
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    ORA ($83,X)          ; 01 83 | Logical OR with accumulator ((zero page,X))
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    REP #$50             ; C2 50 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_5A0
; Address: $C5B037
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_5A0:
    JSR $0010            ; 20 10 00 | Jump to subroutine
    BEQ $07              ; F0 07 | Branch if equal
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    BPL $03              ; 10 03 | Branch if positive
    ORA ($83,X)          ; 01 83 | Logical OR with accumulator ((zero page,X))
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))
    BEQ $09              ; F0 09 | Branch if equal
    TAX                  ; AA | Transfer accumulator to X register
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $8A              ; 06 8A | Arithmetic shift left (zero page)
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_5A1
; Address: $C5B054
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_5A1:
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
; Bank0A_DmaFunction_5A2
; Address: $C5B063
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_5A2:
    JSL $C2CB2B          ; 22 2B CB C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    BEQ $FE              ; F0 FE | Branch if equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_5A9
; Address: $C5B080
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_5A9:
    JSR $B271            ; 20 71 B2 | Jump to subroutine
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_5AA
; Address: $C5B088
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_5AA:
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_5AC
; Address: $C5B08E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_5AC:
    JSL $C2CAD9          ; 22 D9 CA C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    BEQ $34              ; F0 34 | Branch if equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_5B0
; Address: $C5B0A7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_5B0:
    JSR $00F0            ; 20 F0 00 | Jump to subroutine
    CMP #$06             ; C9 06 | Compare accumulator (immediate)
    BEQ $05              ; F0 05 | Branch if equal
    CMP #$07             ; C9 07 | Compare accumulator (immediate)
    BNE $18              ; D0 18 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_5B2
; Address: $C5B0B9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_5B2:
    JSR $001F            ; 20 1F 00 | Jump to subroutine
    CMP $2428            ; CD 28 24 | Compare accumulator (absolute)
    BNE $0B              ; D0 0B | Branch if not equal
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_5B4
; Address: $C5B0C9
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_5B4:
    JSR $0002            ; 20 02 00 | Jump to subroutine
    DEX                  ; CA | Decrement X register
    BPL $BF              ; 10 BF | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_5B5
; Address: $C5B0D0
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_5B5:
    SEP #$20             ; E2 20 | Set processor status bits
    LDX #$17             ; A2 17 | Load immediate value into X register
    LDA $23B8,X          ; BD B8 23 | Load from absolute,X into accumulator
    CMP $2428            ; CD 28 24 | Compare accumulator (absolute)
    BNE $05              ; D0 05 | Branch if not equal
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    STA $23B8,X          ; 9D B8 23 | Store accumulator to absolute,X
    DEX                  ; CA | Decrement X register
    BPL $F0              ; 10 F0 | Branch if positive
    REP #$20             ; C2 20 | Reset processor status bits
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_5B8
; Address: $C5B0F0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_5B8:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    DEC $240E,X          ; DE 0E 24 | Decrement (absolute,X)

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_5BC
; Address: $C5B104
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_5BC:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BCS $58              ; B0 58 | Branch if carry set

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_5BD
; Address: $C5B10C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_5BD:
    PEA #$23AB           ; F4 AB 23 | Push effective address to stack
    PEA #$00C0           ; F4 C0 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_5BE
; Address: $C5B115
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_5BE:
    JSL $C9029E          ; 22 9E 02 C9 | Jump to subroutine long
    PHA                  ; 48 | Push accumulator to stack
    LDX $23EE            ; AE EE 23 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_5BF
; Address: $C5B11D
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_5BF:
    JSL $C2CC25          ; 22 25 CC C2 | Jump to subroutine long
    SEI                  ; 78 | Set interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    BMI $00              ; 30 00 | Branch if negative
    ORA ($90,X)          ; 01 90 | Logical OR with accumulator ((zero page,X))
    DEC                  ; 3A | Decrement accumulator
    PHP                  ; 08 | Push processor status to stack
    PEA #$23AB           ; F4 AB 23 | Push effective address to stack
    PEA #$00C0           ; F4 C0 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_5C0
; Address: $C5B133
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_5C0:
    JSL $C902E9          ; 22 E9 02 C9 | Jump to subroutine long
    PLP                  ; 28 | Pull processor status from stack
    BEQ $10              ; F0 10 | Branch if equal
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    PEA #$23AC           ; F4 AC 23 | Push effective address to stack
    PEA #$0060           ; F4 60 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_5C3
; Address: $C5B150
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_5C3:
    JSL $C2CA5B          ; 22 5B CA C2 | Jump to subroutine long
    EOR #$20             ; 49 20 | Exclusive OR with accumulator (immediate)
    PEA #$23A8           ; F4 A8 23 | Push effective address to stack
    PEA #$00FF           ; F4 FF 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_5C4
; Address: $C5B15F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_5C4:
    JSL $C902E9          ; 22 E9 02 C9 | Jump to subroutine long
    PLA                  ; 68 | Pull accumulator from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_5C5
; Address: $C5B165
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_5C5:
    PEA #$23AC           ; F4 AC 23 | Push effective address to stack
    PEA #$0060           ; F4 60 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_5C6
; Address: $C5B16E
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_5C6:
    JSL $C9029E          ; 22 9E 02 C9 | Jump to subroutine long
    BEQ $17              ; F0 17 | Branch if equal
    DEC                  ; 3A | Decrement accumulator
    BEQ $19              ; F0 19 | Branch if equal
    DEC                  ; 3A | Decrement accumulator
    BEQ $16              ; F0 16 | Branch if equal
    LDA #$03             ; A9 03 | Load immediate value into accumulator
    PEA #$23AC           ; F4 AC 23 | Push effective address to stack
    PEA #$0060           ; F4 60 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_5CA
; Address: $C5B190
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_5CA:
    JSL $C2CA5B          ; 22 5B CA C2 | Jump to subroutine long
    EOR #$20             ; 49 20 | Exclusive OR with accumulator (immediate)
    PHA                  ; 48 | Push accumulator to stack
    PEA #$23A8           ; F4 A8 23 | Push effective address to stack
    PEA #$00FF           ; F4 FF 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_5CB
; Address: $C5B1A0
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_5CB:
    JSL $C9029E          ; 22 9E 02 C9 | Jump to subroutine long
    ORA ($F0,X)          ; 01 F0 | Logical OR with accumulator ((zero page,X))
    ASL $68              ; 06 68 | Arithmetic shift left (zero page)
    LDA #$03             ; A9 03 | Load immediate value into accumulator
    BRA $CF              ; 80 CF | Branch always
    PLA                  ; 68 | Pull accumulator from stack
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    BRA $C9              ; 80 C9 | Branch always
    LDX $2428            ; AE 28 24 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_5CF
; Address: $C5B1C6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_5CF:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BCS $0D              ; B0 0D | Branch if carry set

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_5D0
; Address: $C5B1CE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_5D0:
    JSL $C2CAD9          ; 22 D9 CA C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_5D6
; Address: $C5B1EF
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_5D6:
    JSR $ACAA            ; 20 AA AC | Jump to subroutine
    INC $2223            ; EE 23 22 | Increment (absolute)
    BIT $C2CC            ; 2C CC C2 | Test bits in accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    BEQ $0E              ; F0 0E | Branch if equal
    TXA                  ; 8A | Transfer X register to accumulator
    PEA #$23A9           ; F4 A9 23 | Push effective address to stack
    PEA #$00FF           ; F4 FF 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_5D8
; Address: $C5B20C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_5D8:
    JSL $C2CC2C          ; 22 2C CC C2 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BEQ $27              ; F0 27 | Branch if equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_5DA
; Address: $C5B21C
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_5DA:
    CLC                  ; 18 | Clear carry flag
    ADC $23DC            ; 6D DC 23 | Add with carry (absolute)
    STA $23DC            ; 8D DC 23 | Store accumulator to absolute address
    LDA $23DE            ; AD DE 23 | Load from absolute address into accumulator
    ADC #$00             ; 69 00 | Add with carry (immediate)
    STA $23DE            ; 8D DE 23 | Store accumulator to absolute address
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    ORA ($90,X)          ; 01 90 | Logical OR with accumulator ((zero page,X))
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    STA $23DC            ; 8D DC 23 | Store accumulator to absolute address
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    STA $23DE            ; 8D DE 23 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_5DB
; Address: $C5B23D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_5DB:
    JSL $C2CC2C          ; 22 2C CC C2 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    BEQ $29              ; F0 29 | Branch if equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_5DC
; Address: $C5B247
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_5DC:
    JSL $C2CC8B          ; 22 8B CC C2 | Jump to subroutine long
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ADC $23E0            ; 6D E0 23 | Add with carry (absolute)
    STA $23E0            ; 8D E0 23 | Store accumulator to absolute address
    LDA $23E2            ; AD E2 23 | Load from absolute address into accumulator
    ADC #$00             ; 69 00 | Add with carry (immediate)
    STA $23E2            ; 8D E2 23 | Store accumulator to absolute address
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    ORA ($90,X)          ; 01 90 | Logical OR with accumulator ((zero page,X))
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    STA $23E0            ; 8D E0 23 | Store accumulator to absolute address
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    STA $23E2            ; 8D E2 23 | Store accumulator to absolute address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_5DE
; Address: $C5B274
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_5DE:
    JSL $C2CC25          ; 22 25 CC C2 | Jump to subroutine long
    SEI                  ; 78 | Set interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    BMI $00              ; 30 00 | Branch if negative
    CMP #$03             ; C9 03 | Compare accumulator (immediate)
    BEQ $05              ; F0 05 | Branch if equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_5E6
; Address: $C5B2A0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_5E6:
    JSR $2248            ; 20 48 22 | Jump to subroutine
    CMP $C2CA,Y          ; D9 CA C2 | Compare accumulator (absolute,Y)
    BVC $20              ; 50 20 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_5E8
; Address: $C5B2AB
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_5E8:
    JSL $C2CA5B          ; 22 5B CA C2 | Jump to subroutine long
    EOR #$20             ; 49 20 | Exclusive OR with accumulator (immediate)
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_5E9
; Address: $C5B2B2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_5E9:
    JSL $C2CAD9          ; 22 D9 CA C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_5F1
; Address: $C5B2DE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_5F1:
    JSR $2268            ; 20 68 22 | Jump to subroutine
    BVS $CB              ; 70 CB | Branch if overflow set
    REP #$51             ; C2 51 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_5F3
; Address: $C5B2E9
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_5F3:
    JSL $C2CA98          ; 22 98 CA C2 | Jump to subroutine long
    EOR #$20             ; 49 20 | Exclusive OR with accumulator (immediate)
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_5F4
; Address: $C5B2F0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_5F4:
    JSL $C2CB70          ; 22 70 CB C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_5F6
; Address: $C5B2FE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_5F6:
    JSR $2268            ; 20 68 22 | Jump to subroutine
    BVS $CB              ; 70 CB | Branch if overflow set
    REP #$3C             ; C2 3C | Reset processor status bits

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_5FD
; Address: $C5B329
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_5FD:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_5FF
; Address: $C5B330
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_5FF:
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHA                  ; 48 | Push accumulator to stack
    PEA #$23AB           ; F4 AB 23 | Push effective address to stack
    PEA #$000F           ; F4 0F 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_600
; Address: $C5B345
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_600:
    JSL $C9029E          ; 22 9E 02 C9 | Jump to subroutine long
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $05              ; F0 05 | Branch if equal
    CMP #$06             ; C9 06 | Compare accumulator (immediate)
    BNE $61              ; D0 61 | Branch if not equal
    LDX #$00             ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_601
; Address: $C5B356
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_601:
    JSR $B3C5            ; 20 C5 B3 | Jump to subroutine
    BEQ $07              ; F0 07 | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_602
; Address: $C5B35D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_602:
    JSR $B3E8            ; 20 E8 B3 | Jump to subroutine
    BNE $59              ; D0 59 | Branch if not equal
    PEA #$2011           ; F4 11 20 | Push effective address to stack
    PEA #$0040           ; F4 40 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_603
; Address: $C5B36B
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_603:
    JSL $C9029E          ; 22 9E 02 C9 | Jump to subroutine long
    BEQ $01              ; F0 01 | Branch if equal
    INX                  ; E8 | Increment X register
    LDA                  ; BF C1 B3 C2 | Load from absolute long,X into accumulator
    PEA #$23AB           ; F4 AB 23 | Push effective address to stack
    PEA #$000F           ; F4 0F 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_604
; Address: $C5B37F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_604:
    JSL $C902E9          ; 22 E9 02 C9 | Jump to subroutine long
    PEA #$2011           ; F4 11 20 | Push effective address to stack
    PEA #$0040           ; F4 40 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_607
; Address: $C5B397
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_607:
    JSL $C270E1          ; 22 E1 70 C2 | Jump to subroutine long
    BNE $12              ; D0 12 | Branch if not equal
    LDA #$07             ; A9 07 | Load immediate value into accumulator
    PEA #$23AB           ; F4 AB 23 | Push effective address to stack
    PEA #$000F           ; F4 0F 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_608
; Address: $C5B3A9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_608:
    JSL $C902E9          ; 22 E9 02 C9 | Jump to subroutine long
    BRA $05              ; 80 05 | Branch always
    CMP #$02             ; C9 02 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_609
; Address: $C5B3B2
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_609:
    BCS $07              ; B0 07 | Branch if carry set
    PHP                  ; 08 | Push processor status to stack
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    PLA                  ; 68 | Pull accumulator from stack
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_60A
; Address: $C5B3C2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_60A:
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA $22              ; 05 22 | Logical OR with accumulator (zero page)
    AND $C2C7,Y          ; 39 C7 C2 | Logical AND with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_60B
; Address: $C5B3CA
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_60B:
    JSL $C2C766          ; 22 66 C7 C2 | Jump to subroutine long
    PEA #$2011           ; F4 11 20 | Push effective address to stack
    PEA #$0040           ; F4 40 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_60D
; Address: $C5B3DE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_60D:
    JSL $C2C7C6          ; 22 C6 C7 C2 | Jump to subroutine long
    PLP                  ; 28 | Pull processor status from stack
    LDA $00              ; A5 00 | Load from zero page into accumulator
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_60E
; Address: $C5B3E8
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_60E:
    JSL $C2C739          ; 22 39 C7 C2 | Jump to subroutine long
    ASL $22              ; 06 22 | Arithmetic shift left (zero page)
    ROR $C7              ; 66 C7 | Rotate right (zero page)
    REP #$00             ; C2 00 | Reset processor status bits
    LDA $00              ; A5 00 | Load from zero page into accumulator
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_60F
; Address: $C5B3F7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_60F:
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_610
; Address: $C5B400
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_610:
    JSL $C1D832          ; 22 32 D8 C1 | Jump to subroutine long
    BCS $0C              ; B0 0C | Branch if carry set
    LDA $23AE            ; AD AE 23 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BNE $04              ; D0 04 | Branch if not equal
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_611
; Address: $C5B412
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_611:
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_613
; Address: $C5B416
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_613:
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHA                  ; 48 | Push accumulator to stack
    LDX $2428            ; AE 28 24 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_615
; Address: $C5B42B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_615:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BCC $11              ; 90 11 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_616
; Address: $C5B433
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_616:
    JSL $C2CB2B          ; 22 2B CB C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    BNE $07              ; D0 07 | Branch if not equal
    PHP                  ; 08 | Push processor status to stack
    AND #$FE             ; 29 FE | Logical AND with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    PLA                  ; 68 | Pull accumulator from stack
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_617
; Address: $C5B44A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_617:
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_618
; Address: $C5B456
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_618:
    JSL $C429DA          ; 22 DA 29 C4 | Jump to subroutine long
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    INC $0522,X          ; FE 22 05 | Increment (absolute,X)
    CPY $06              ; C4 06 | Compare Y register (zero page)
    INC $80FF,X          ; FE FF 80 | Increment (absolute,X)
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_619
; Address: $C5B46F
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_619:
    PLB                  ; AB | Pull data bank register from stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_61B
; Address: $C5B476
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_61B:
    JSL $2AACAA          ; 22 AA AC 2A | Jump to subroutine long
    BIT $22              ; 24 22 | Test bits in accumulator (zero page)
    TXA                  ; 8A | Transfer X register to accumulator
    LDX $08C2,Y          ; BE C2 08 | Load from absolute,Y into X register
    STA $247E            ; 8D 7E 24 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_61C
; Address: $C5B483
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_61C:
    JSL $C2CC2C          ; 22 2C CC C2 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    STA $2480            ; 8D 80 24 | Store accumulator to absolute address
    BEQ $22              ; F0 22 | Branch if equal
    CMP #$3F             ; C9 3F | Compare accumulator (immediate)
    BNE $0A              ; D0 0A | Branch if not equal
    LDA $247E            ; AD 7E 24 | Load from absolute address into accumulator
    STA $2480            ; 8D 80 24 | Store accumulator to absolute address
    BEQ $1C              ; F0 1C | Branch if equal
    BRA $13              ; 80 13 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $06              ; F0 06 | Branch if equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_61E
; Address: $C5B4A7
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_61E:
    JSR $B4DD            ; 20 DD B4 | Jump to subroutine
    LDA $247E            ; AD 7E 24 | Load from absolute address into accumulator
    CMP $2480            ; CD 80 24 | Compare accumulator (absolute)
    BCC $07              ; 90 07 | Branch if carry clear
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $AD              ; 06 AD | Arithmetic shift left (zero page)
    BRA $24              ; 80 24 | Branch always
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_620
; Address: $C5B4C4
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_620:
    JSL $C44DC0          ; 22 C0 4D C4 | Jump to subroutine long
    ASL $FE              ; 06 FE | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    BVC $0E              ; 50 0E | Branch if overflow clear
    LDA $2480            ; AD 80 24 | Load from absolute address into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLC                  ; 18 | Clear carry flag
    ADC $2480            ; 6D 80 24 | Add with carry (absolute)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    INC                  ; 1A | Increment accumulator
    STA $2480            ; 8D 80 24 | Store accumulator to absolute address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_622
; Address: $C5B4E0
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_622:
    JSL $C44DC0          ; 22 C0 4D C4 | Jump to subroutine long
    ASL $FE              ; 06 FE | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    BVC $06              ; 50 06 | Branch if overflow clear
    LSR $2480            ; 4E 80 24 | Logical shift right (absolute)
    INC $2480            ; EE 80 24 | Increment (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_623
; Address: $C5B4F1
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_623:
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
; Bank0A_DmaFunction_625
; Address: $C5B504
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_625:
    JSL $C2C240          ; 22 40 C2 C2 | Jump to subroutine long
    BPL $A8              ; 10 A8 | Branch if positive
    LDA #$A4             ; A9 A4 | Load immediate value into accumulator
    BRA $22              ; 80 22 | Branch always
    TYA                  ; 98 | Transfer Y register to accumulator
    DEX                  ; CA | Decrement X register
    REP #$34             ; C2 34 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_628
; Address: $C5B51B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_628:
    JSR $F088            ; 20 88 F0 | Jump to subroutine
    ASL $22              ; 06 22 | Arithmetic shift left (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator
    DEX                  ; CA | Decrement X register
    REP #$38             ; C2 38 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_629
; Address: $C5B524
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_629:
    JSR $C2AB            ; 20 AB C2 | Jump to subroutine
    BMI $7A              ; 30 7A | Branch if negative
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_62A
; Address: $C5B52D
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_62A:
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    BRA $22              ; 80 22 | Branch always
    TYA                  ; 98 | Transfer Y register to accumulator
    DEX                  ; CA | Decrement X register
    REP #$34             ; C2 34 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_62D
; Address: $C5B544
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_62D:
    JSR $9822            ; 20 22 98 | Jump to subroutine
    DEX                  ; CA | Decrement X register
    REP #$38             ; C2 38 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_632
; Address: $C5B55B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_632:
    JSR $0003            ; 20 03 00 | Jump to subroutine
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_633
; Address: $C5B561
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_633:
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
; Bank0A_DmaFunction_634
; Address: $C5B570
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_634:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    INC                  ; 1A | Increment accumulator
    BCS $2C              ; B0 2C | Branch if carry set
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_635
; Address: $C5B57A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_635:
    JSL $C2CB70          ; 22 70 CB C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_63B
; Address: $C5B597
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_63B:
    JSR $0002            ; 20 02 00 | Jump to subroutine
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_63C
; Address: $C5B5A3
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_63C:
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_63E
; Address: $C5B5AC
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_63E:
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
; Bank0A_DmaFunction_63F
; Address: $C5B5BB
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_63F:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    BCS $0D              ; B0 0D | Branch if carry set

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_640
; Address: $C5B5C2
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_640:
    JSL $C2B52D          ; 22 2D B5 C2 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_641
; Address: $C5B5CF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_641:
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_642
; Address: $C5B5D8
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_642:
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
; Bank0A_DmaFunction_645
; Address: $C5B5F3
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_645:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    BNE $2F              ; D0 2F | Branch if not equal
    LDA #$04             ; A9 04 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_649
; Address: $C5B606
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_649:
    JSL $C2CB70          ; 22 70 CB C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_64D
; Address: $C5B61B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_64D:
    JSR $0002            ; 20 02 00 | Jump to subroutine
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_64E
; Address: $C5B627
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_64E:
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_64F
; Address: $C5B630
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_64F:
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
; Bank0A_DmaFunction_651
; Address: $C5B644
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_651:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    BEQ $21              ; F0 21 | PPU graphics register access
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_656
; Address: $C5B65D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_656:
    JSL $C2B52D          ; 22 2D B5 C2 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_658
; Address: $C5B66A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_658:
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_659
; Address: $C5B673
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_659:
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
; Bank0A_DmaFunction_65A
; Address: $C5B67F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_65A:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    BIT $17B0            ; 2C B0 17 | Test bits in accumulator (absolute)
    LDX $2428            ; AE 28 24 | Load from absolute address into X register
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_65B
; Address: $C5B68C
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_65B:
    JSL $C2CB70          ; 22 70 CB C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    BRA $00              ; 80 00 | Branch always
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_65C
; Address: $C5B69D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_65C:
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_65D
; Address: $C5B6A6
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_65D:
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_65F
; Address: $C5B6B2
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_65F:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    ROL                  ; 2A | Rotate left (accumulator)
    BCS $17              ; B0 17 | Branch if carry set
    LDX $2428            ; AE 28 24 | Load from absolute address into X register
    LDA #$01             ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_661
; Address: $C5B6C5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_661:
    JSR $AB00            ; 20 00 AB | Jump to subroutine
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_662
; Address: $C5B6D0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_662:
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_663
; Address: $C5B6D9
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_663:
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDA #$62             ; A9 62 | Load immediate value into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDX $23E8            ; AE E8 23 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_665
; Address: $C5B6F1
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_665:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BCS $05              ; B0 05 | Branch if carry set
    LDA #$61             ; A9 61 | Load immediate value into accumulator
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_666
; Address: $C5B6FF
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_666:
    JSL $C1E314          ; 22 14 E3 C1 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_667
; Address: $C5B70B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_667:
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    PHX                  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_66A
; Address: $C5B71E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_66A:
    JSL $C903EE          ; 22 EE 03 C9 | Jump to subroutine long
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    STX $C239            ; 8E 39 C2 | Store X register to absolute address
    PLX                  ; FA | Pull X register from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_66B
; Address: $C5B72E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_66B:
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    PHX                  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_66E
; Address: $C5B741
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_66E:
    JSL $C903EE          ; 22 EE 03 C9 | Jump to subroutine long
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    STX $C239            ; 8E 39 C2 | Store X register to absolute address
    PLX                  ; FA | Pull X register from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_66F
; Address: $C5B751
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_66F:
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    PHX                  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_672
; Address: $C5B764
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_672:
    JSL $C903EE          ; 22 EE 03 C9 | Jump to subroutine long
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    STX $C239            ; 8E 39 C2 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_673
; Address: $C5B770
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_673:
    PLX                  ; FA | Pull X register from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_674
; Address: $C5B774
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_674:
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    LDA $2428            ; AD 28 24 | Load from absolute address into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDX $23E4            ; AE E4 23 | Load from absolute address into X register
    STX $2428            ; 8E 28 24 | Store X register to absolute address
    LDY $23EE            ; AC EE 23 | Load from absolute address into Y register
    LDA $23F2            ; AD F2 23 | Load from absolute address into accumulator
    BNE $52              ; D0 52 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_675
; Address: $C5B791
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_675:
    JSL $C2CC2C          ; 22 2C CC C2 | Jump to subroutine long
    ADC $4018,Y          ; 79 18 40 | Add with carry (absolute,Y)
    BEQ $48              ; F0 48 | Branch if equal
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_676
; Address: $C5B79E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_676:
    JSL $C2B8AA          ; 22 AA B8 C2 | Jump to subroutine long
    LDA $242C            ; AD 2C 24 | Load from absolute address into accumulator
    CMP #$09             ; C9 09 | Compare accumulator (immediate)
    BNE $0A              ; D0 0A | Branch if not equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_677
; Address: $C5B7AA
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_677:
    JSL $C2CC2C          ; 22 2C CC C2 | Jump to subroutine long
    PLY                  ; 7A | Pull Y register from stack
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_679
; Address: $C5B7B4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_679:
    JSL $C2CAD9          ; 22 D9 CA C2 | Jump to subroutine long
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    BEQ $0A              ; F0 0A | Branch if equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_67A
; Address: $C5B7BE
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_67A:
    JSL $C2CC2C          ; 22 2C CC C2 | Jump to subroutine long
    ADC $2018,Y          ; 79 18 20 | Add with carry (absolute,Y)
    BNE $1B              ; D0 1B | Branch if not equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_67C
; Address: $C5B7CD
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_67C:
    JSR $0001            ; 20 01 00 | Jump to subroutine
    BNE $16              ; D0 16 | Branch if not equal
    CPY #$B6             ; C0 B6 | Compare Y register (immediate)
    BEQ $11              ; F0 11 | Branch if equal
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    PLX                  ; FA | Pull X register from stack
    STX $2428            ; 8E 28 24 | Store X register to absolute address
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_67E
; Address: $C5B7E3
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_67E:
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    BRA $F2              ; 80 F2 | Branch always
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    BRA $ED              ; 80 ED | Branch always
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $23FE,X          ; BD FE 23 | Load from absolute,X into accumulator
    CMP $2420            ; CD 20 24 | Compare accumulator (absolute)
    BEQ $40              ; F0 40 | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $F1              ; 90 F1 | Branch if carry clear
    LDX #$00             ; A2 00 | Load immediate value into X register
    TXA                  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_67F
; Address: $C5B80F
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_67F:
    JSL $C2C739          ; 22 39 C7 C2 | Jump to subroutine long
    LDA $00              ; A5 00 | Load from zero page into accumulator
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    BEQ $1E              ; F0 1E | Branch if equal
    INX                  ; E8 | Increment X register
    CPX #$04             ; E0 04 | Compare X register (immediate)
    BCC $EE              ; 90 EE | Branch if carry clear
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $240E,X          ; BD 0E 24 | Load from absolute,X into accumulator
    BEQ $2A              ; F0 2A | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $F4              ; 90 F4 | Branch if carry clear
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_680
; Address: $C5B838
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_680:
    STX $2426            ; 8E 26 24 | Store X register to absolute address
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_681
; Address: $C5B83F
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_681:
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_682
; Address: $C5B844
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_682:
    TXA                  ; 8A | Transfer X register to accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    STA $2426            ; 8D 26 24 | Store accumulator to absolute address
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_683
; Address: $C5B852
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_683:
    TXA                  ; 8A | Transfer X register to accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    STA $2426            ; 8D 26 24 | Store accumulator to absolute address
    LDY #$17             ; A0 17 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_685
; Address: $C5B85F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_685:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP $2426            ; CD 26 24 | Compare accumulator (absolute)
    BNE $07              ; D0 07 | Branch if not equal
    STY $2428            ; 8C 28 24 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_686
; Address: $C5B86A
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_686:
    JSL $C2AD55          ; 22 55 AD C2 | Jump to subroutine long
    DEY                  ; 88 | Decrement Y register
    BPL $E9              ; 10 E9 | Branch if positive
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_687
; Address: $C5B87A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_687:
    CLC                  ; 18 | Clear carry flag
    CLV                  ; B8 | Clear overflow flag
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    PHX                  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_689
; Address: $C5B88A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_689:
    JSL $AE19B0          ; 22 B0 19 AE | Jump to subroutine long
    BIT $2224            ; 2C 24 22 | Test bits in accumulator (absolute)
    CPY #$4D             ; C0 4D | Compare Y register (immediate)
    CPY $FE              ; C4 FE | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_68A
; Address: $C5B895
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_68A:
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    STA $242E            ; 8D 2E 24 | Store accumulator to absolute address
    PHP                  ; 08 | Push processor status to stack
    ORA ($28,X)          ; 01 28 | Logical OR with accumulator ((zero page,X))
    AND #$41             ; 29 41 | Logical AND with accumulator (immediate)
    PLX                  ; FA | Pull X register from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_68B
; Address: $C5B8AA
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_68B:
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    PHX                  ; DA | Push X register to stack
    PHA                  ; 48 | Push accumulator to stack
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $242C            ; 8D 2C 24 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_68D
; Address: $C5B8BF
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_68D:
    JSL $AA10B0          ; 22 B0 10 AA | Jump to subroutine long
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    CPY $06              ; C4 06 | Compare Y register (zero page)
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    BCS $03              ; B0 03 | Branch if carry set
    STA $242C            ; 8D 2C 24 | Store accumulator to absolute address
    PLA                  ; 68 | Pull accumulator from stack
    PLX                  ; FA | Pull X register from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_68E
; Address: $C5B8D7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_68E:
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    PHX                  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_690
; Address: $C5B8E6
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_690:
    JSL $AE44B0          ; 22 B0 44 AE | Jump to subroutine long
    ROL $2224            ; 2E 24 22 | Rotate left (absolute)
    EOR #$C4             ; 49 C4 | Exclusive OR with accumulator (immediate)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    INC $8DFF,X          ; FE FF 8D | Increment (absolute,X)
    BIT $B024            ; 2C 24 B0 | Test bits in accumulator (absolute)
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    PLX                  ; FA | Pull X register from stack
    PLB                  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_692
; Address: $C5B904
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_692:
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    PHX                  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_694
; Address: $C5B913
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_694:
    JSL $AE17B0          ; 22 B0 17 AE | Jump to subroutine long
    ROL $2224            ; 2E 24 22 | Rotate left (absolute)
    PHA                  ; 48 | Push accumulator to stack
    CPY $06              ; C4 06 | Compare Y register (zero page)
    INC $8DFF,X          ; FE FF 8D | Increment (absolute,X)
    BIT $B024            ; 2C 24 B0 | Test bits in accumulator (absolute)
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    PLX                  ; FA | Pull X register from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_695
; Address: $C5B931
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_695:
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
; Bank0A_DmaFunction_698
; Address: $C5B947
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_698:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    ROL                  ; 2A | Rotate left (accumulator)
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_699
; Address: $C5B954
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_699:
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_69D
; Address: $C5B96A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_69D:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_69E
; Address: $C5B977
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_69E:
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
; Bank0A_DmaFunction_6A0
; Address: $C5B989
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6A0:
    JSL $C32209          ; 22 09 22 C3 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6A2
; Address: $C5B99A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6A2:
    JSL $C32209          ; 22 09 22 C3 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6A3
; Address: $C5B9A6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6A3:
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    PHX                  ; DA | Push X register to stack
    LDA $00              ; A5 00 | Load from zero page into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6A4
; Address: $C5B9B2
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6A4:
    PHA                  ; 48 | Push accumulator to stack
    LDA $02              ; A5 02 | Load from zero page into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDA #$05             ; A9 05 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6A6
; Address: $C5B9BE
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6A6:
    JSL $C270E1          ; 22 E1 70 C2 | Jump to subroutine long
    PLX                  ; FA | Pull X register from stack
    STX $02              ; 86 02 | Store X register to zero page
    PLX                  ; FA | Pull X register from stack
    STX $00              ; 86 00 | Store X register to zero page
    PLX                  ; FA | Pull X register from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    PHA                  ; 48 | Push accumulator to stack
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6A7
; Address: $C5B9CE
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6A7:
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDA $00              ; A5 00 | Load from zero page into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDA $02              ; A5 02 | Load from zero page into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDA $2428            ; AD 28 24 | Load from absolute address into accumulator
    PHA                  ; 48 | Push accumulator to stack
    STZ $2428            ; 9C 28 24 | Store zero to absolute
    LSR $02              ; 46 02 | Logical shift right (zero page)
    ROR $00              ; 66 00 | Rotate right (zero page)
    BCC $0B              ; 90 0B | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6A8
; Address: $C5B9EE
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6A8:
    JSL $C2C240          ; 22 40 C2 C2 | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BCC $02              ; 90 02 | Branch if carry clear
    INC $2428            ; EE 28 24 | Increment (absolute)
    LDA $2428            ; AD 28 24 | Load from absolute address into accumulator
    CMP #$18             ; C9 18 | Compare accumulator (immediate)
    BCC $E4              ; 90 E4 | Branch if carry clear
    PLA                  ; 68 | Pull accumulator from stack
    STA $2428            ; 8D 28 24 | Store accumulator to absolute address
    PLA                  ; 68 | Pull accumulator from stack
    STA $02              ; 85 02 | Store accumulator to zero page
    PLA                  ; 68 | Pull accumulator from stack
    STA $00              ; 85 00 | Store accumulator to zero page
    PLA                  ; 68 | Pull accumulator from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6AA
; Address: $C5BA12
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6AA:
    LDA $241E            ; AD 1E 24 | Load from absolute address into accumulator
    BNE $41              ; D0 41 | Branch if not equal
    LDA $2420            ; AD 20 24 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6AB
; Address: $C5BA1A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6AB:
    JSL $C2C739          ; 22 39 C7 C2 | Jump to subroutine long
    LSR $22              ; 46 22 | Logical shift right (zero page)
    ROR $C7              ; 66 C7 | Rotate right (zero page)
    REP #$48             ; C2 48 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6AC
; Address: $C5BA24
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6AC:
    JSL $C270E1          ; 22 E1 70 C2 | Jump to subroutine long
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BCC $2B              ; 90 2B | Branch if carry clear
    LDX #$04             ; A2 04 | Load immediate value into X register
    LDA $2467,X          ; BD 67 24 | Load from absolute,X into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP $2420            ; CD 20 24 | Compare accumulator (absolute)
    BEQ $1D              ; F0 1D | Branch if equal
    DEX                  ; CA | Decrement X register
    BPL $F2              ; 10 F2 | Branch if positive
    LDX #$04             ; A2 04 | Load immediate value into X register
    LDA $2467,X          ; BD 67 24 | Load from absolute,X into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    BEQ $05              ; F0 05 | Branch if equal
    DEX                  ; CA | Decrement X register
    BPL $F5              ; 10 F5 | Branch if positive
    BRA $0A              ; 80 0A | Branch always
    LDA $2420            ; AD 20 24 | Load from absolute address into accumulator
    SEP #$20             ; E2 20 | Set processor status bits
    STA $2467,X          ; 9D 67 24 | Store accumulator to absolute,X
    REP #$20             ; C2 20 | Reset processor status bits
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6AE
; Address: $C5BA5C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6AE:
    JSL $C2CAE0          ; 22 E0 CA C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BNE $33              ; D0 33 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6AF
; Address: $C5BA66
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6AF:
    JSL $C2CA62          ; 22 62 CA C2 | Jump to subroutine long
    EOR #$20             ; 49 20 | Exclusive OR with accumulator (immediate)
    STA $2420            ; 8D 20 24 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6B0
; Address: $C5BA6F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6B0:
    JSL $C2C739          ; 22 39 C7 C2 | Jump to subroutine long
    LSR $22              ; 46 22 | Logical shift right (zero page)
    ROR $C7              ; 66 C7 | Rotate right (zero page)
    REP #$48             ; C2 48 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6B1
; Address: $C5BA79
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6B1:
    JSL $C270E1          ; 22 E1 70 C2 | Jump to subroutine long
    BNE $1A              ; D0 1A | Branch if not equal
    LDX #$04             ; A2 04 | Load immediate value into X register
    LDA $2467,X          ; BD 67 24 | Load from absolute,X into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP $2420            ; CD 20 24 | Compare accumulator (absolute)
    BEQ $05              ; F0 05 | Branch if equal
    DEX                  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6B2
; Address: $C5BA8E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6B2:
    BPL $F2              ; 10 F2 | Branch if positive
    BRA $07              ; 80 07 | Branch always
    SEP #$20             ; E2 20 | Set processor status bits
    STZ $2467,X          ; 9E 67 24 | Store zero to absolute,X
    REP #$20             ; C2 20 | Reset processor status bits
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6B4
; Address: $C5BA9B
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6B4:
    JSL $C2CA5B          ; 22 5B CA C2 | Jump to subroutine long
    EOR #$20             ; 49 20 | Exclusive OR with accumulator (immediate)
    PHA                  ; 48 | Push accumulator to stack
    LDX #$04             ; A2 04 | Load immediate value into X register
    LDA $2467,X          ; BD 67 24 | Load from absolute,X into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))
    BEQ $04              ; F0 04 | Branch if equal
    DEX                  ; CA | Decrement X register
    BPL $F2              ; 10 F2 | Branch if positive
    SEC                  ; 38 | Set carry flag
    PLA                  ; 68 | Pull accumulator from stack
    PLX                  ; FA | Pull X register from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6B5
; Address: $C5BAB7
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6B5:
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    PHX                  ; DA | Push X register to stack
    LDX #$0C             ; A2 0C | Load immediate value into X register
    PHX                  ; DA | Push X register to stack
    TSX                  ; BA | Transfer stack pointer to X register
    REP #$F0             ; C2 F0 | Reset processor status bits
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    BPL $F6              ; 10 F6 | Branch if positive
    AND #$FE             ; 29 FE | Logical AND with accumulator (immediate)
    PLX                  ; FA | Pull X register from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6B6
; Address: $C5BADA
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6B6:
    STA $009000          ; 8F 00 90 00 | Store accumulator to absolute long address
    STA ($00),Y          ; 91 00 | Store accumulator to (zero page),Y
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6B7
; Address: $C5BAF2
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6B7:
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDX $2428            ; AE 28 24 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6B8
; Address: $C5BAF7
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6B8:
    JSL $C2CA5B          ; 22 5B CA C2 | Jump to subroutine long
    EOR #$20             ; 49 20 | Exclusive OR with accumulator (immediate)
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6B9
; Address: $C5BAFE
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6B9:
    JSL $C2CAD9          ; 22 D9 CA C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    BNE $07              ; D0 07 | Branch if not equal
    CMP #$19             ; C9 19 | Compare accumulator (immediate)
    BEQ $12              ; F0 12 | Branch if equal
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    BVS $CB              ; 70 CB | Branch if overflow set
    REP #$51             ; C2 51 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6BC
; Address: $C5BB21
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6BC:
    JSR $6868            ; 20 68 68 | Jump to subroutine
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6BD
; Address: $C5BB2C
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6BD:
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    LDA $242A            ; AD 2A 24 | Load from absolute address into accumulator
    LDX #$1C             ; A2 1C | Load immediate value into X register
    CLI                  ; 58 | Clear interrupt disable flag
    REP #$F0             ; C2 F0 | Reset processor status bits
    ORA #$CA             ; 09 CA | Logical OR with accumulator (immediate)
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    BPL $F4              ; 10 F4 | Branch if positive
    LDX #$1E             ; A2 1E | Load immediate value into X register
    LDA                  ; BF 5A BB C2 | Load from absolute long,X into accumulator
    STA $2482            ; 8D 82 24 | Store accumulator to absolute address
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6BF
; Address: $C5BB58
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6BF:
    EOR $0000            ; 4D 00 00 | Exclusive OR with accumulator (absolute)
    CMP $00              ; C5 00 | Compare accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    DEX                  ; CA | Decrement X register
    CPY $0400            ; CC 00 04 | Compare Y register (absolute)
    CMP $0500            ; CD 00 05 | Compare accumulator (absolute)
    CMP $0900,Y          ; D9 00 09 | Compare accumulator (absolute,Y)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    SBC #$00             ; E9 00 | Subtract with carry (immediate)
    CPX $F900            ; EC 00 F9 | Compare X register (absolute)
    CMP $D400            ; CD 00 D4 | Compare accumulator (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    REP #$00             ; C2 00 | Reset processor status bits
    CPY $D300            ; CC 00 D3 | Compare Y register (absolute)
    NOP                  ; EA | No operation
    XBA                  ; EB | Exchange accumulator bytes
    SBC $FA00            ; ED 00 FA | Subtract with carry (absolute)
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    STA $2474            ; 8D 74 24 | Store accumulator to absolute address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $2476            ; 8D 76 24 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6C0
; Address: $C5BBCA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6C0:
    JSR $BBF4            ; 20 F4 BB | Jump to subroutine
    LDA $2474            ; AD 74 24 | Load from absolute address into accumulator
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6C1
; Address: $C5BBD5
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6C1:
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    STA $2474            ; 8D 74 24 | Store accumulator to absolute address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $2476            ; 8D 76 24 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6C2
; Address: $C5BBE9
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6C2:
    JSR $BBF4            ; 20 F4 BB | Jump to subroutine
    LDA $2474            ; AD 74 24 | Load from absolute address into accumulator
    PLY                  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6C3
; Address: $C5BBF0
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6C3:
    PLX                  ; FA | Pull X register from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6C5
; Address: $C5BBF7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6C5:
    JSL $C44A03          ; 22 03 4A C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    STA $242C            ; 8D 2C 24 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6C7
; Address: $C5BC08
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6C7:
    JSL $C44A03          ; 22 03 4A C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    STA $242C            ; 8D 2C 24 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6C9
; Address: $C5BC19
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6C9:
    JSL $C44A03          ; 22 03 4A C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    STA $242C            ; 8D 2C 24 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6CB
; Address: $C5BC2A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6CB:
    JSL $C44A03          ; 22 03 4A C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    STA $242C            ; 8D 2C 24 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6CD
; Address: $C5BC3B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6CD:
    JSL $C44A03          ; 22 03 4A C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    STA $242C            ; 8D 2C 24 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6CF
; Address: $C5BC4A
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6CF:
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    LDY #$0E             ; A0 0E | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6D1
; Address: $C5BC5B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6D1:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    CMP $2476            ; CD 76 24 | Compare accumulator (absolute)
    BNE $14              ; D0 14 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6D2
; Address: $C5BC63
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6D2:
    JSL $C90566          ; 22 66 05 C9 | Jump to subroutine long
    REP #$00             ; C2 00 | Reset processor status bits
    CMP $242C            ; CD 2C 24 | Compare accumulator (absolute)
    BEQ $06              ; F0 06 | Branch if equal
    DEY                  ; 88 | Decrement Y register
    BPL $D5              ; 10 D5 | Branch if positive
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6D5
; Address: $C5BC86
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6D5:
    SED                  ; F8 | Set decimal mode flag
    CMP #$18             ; C9 18 | Compare accumulator (immediate)
    BCS $FE              ; B0 FE | Branch if carry set
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDY $20F0,X          ; BC F0 20 | Load from absolute,X into Y register
    LDA $2474            ; AD 74 24 | Load from absolute address into accumulator
    STA $6A              ; 85 6A | Store accumulator to zero page
    LDX #$6A             ; A2 6A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6D7
; Address: $C5BCAB
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6D7:
    JSL $C01146          ; 22 46 11 C0 | Jump to subroutine long
    LDA $6B              ; A5 6B | Load from zero page into accumulator
    STA $2474            ; 8D 74 24 | Store accumulator to absolute address
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6D8
; Address: $C5BCB8
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6D8:
    LDY $BCEB,X          ; BC EB BC | Load from absolute,X into Y register
    XBA                  ; EB | Exchange accumulator bytes
    LDY $BCEB,X          ; BC EB BC | Load from absolute,X into Y register
    XBA                  ; EB | Exchange accumulator bytes
    LDY $BCFB,X          ; BC FB BC | Load from absolute,X into Y register
    LDA $BCE7,X          ; BD E7 BC | Load from absolute,X into accumulator
    LDY $BCE7,X          ; BC E7 BC | Load from absolute,X into Y register
    LDY $BCE7,X          ; BC E7 BC | Load from absolute,X into Y register
    LDY $BCE7,X          ; BC E7 BC | Load from absolute,X into Y register
    LDY $BD1B,X          ; BC 1B BD | Load from absolute,X into Y register
    LDA $BCFB,X          ; BD FB BC | Load from absolute,X into accumulator
    LDY $BD1B,X          ; BC 1B BD | Load from absolute,X into Y register
    LDY $BCE7,X          ; BC E7 BC | Load from absolute,X into Y register
    LDY $BCE7,X          ; BC E7 BC | Load from absolute,X into Y register
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6D9
; Address: $C5BCEB
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6D9:
    JSL $C90566          ; 22 66 05 C9 | Jump to subroutine long
    REP #$02             ; C2 02 | Reset processor status bits
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6DA
; Address: $C5BCFB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6DA:
    JSL $C90566          ; 22 66 05 C9 | Jump to subroutine long
    REP #$02             ; C2 02 | Reset processor status bits
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6DB
; Address: $C5BD0B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6DB:
    JSL $C90566          ; 22 66 05 C9 | Jump to subroutine long
    REP #$02             ; C2 02 | Reset processor status bits
    BPL $00              ; 10 00 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6DC
; Address: $C5BD1B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6DC:
    JSL $C90566          ; 22 66 05 C9 | Jump to subroutine long
    REP #$02             ; C2 02 | Reset processor status bits
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6DF
; Address: $C5BD3B
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6DF:
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDA $00              ; A5 00 | Load from zero page into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDA $02              ; A5 02 | Load from zero page into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDX #$60             ; A2 60 | Load immediate value into X register
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $2484,X          ; 9D 84 24 | Store accumulator to absolute,X
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    BPL $F9              ; 10 F9 | Branch if positive

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6E0
; Address: $C5BD5A
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6E0:
    JSL $C28E92          ; 22 92 8E C2 | Jump to subroutine long
    LDA $00              ; A5 00 | Load from zero page into accumulator
    STA $0C              ; 85 0C | Store accumulator to zero page
    LDA $02              ; A5 02 | Load from zero page into accumulator
    STA $0E              ; 85 0E | Store accumulator to zero page
    STZ $2428            ; 9C 28 24 | Store zero to absolute
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $23DA            ; 8D DA 23 | Store accumulator to absolute address
    LSR $0E              ; 46 0E | Logical shift right (zero page)
    ROR $0C              ; 66 0C | Rotate right (zero page)
    BCC $27              ; 90 27 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6E2
; Address: $C5BD7D
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6E2:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    STA $08              ; 85 08 | Store accumulator to zero page
    SEC                  ; 38 | Set carry flag
    ORA ($F0,X)          ; 01 F0 | Logical OR with accumulator ((zero page,X))
    BCC $05              ; 90 05 | Branch if carry clear
    STA $2484,X          ; 9D 84 24 | Store accumulator to absolute,X
    BRA $0B              ; 80 0B | Branch always
    LDA $08              ; A5 08 | Load from zero page into accumulator
    STA $24B4,X          ; 9D B4 24 | Store accumulator to absolute,X
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $24E4            ; 8D E4 24 | Store accumulator to absolute address
    PLA                  ; 68 | Pull accumulator from stack
    INC $23DA            ; EE DA 23 | Increment (absolute)
    INC $2428            ; EE 28 24 | Increment (absolute)
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6E3
; Address: $C5BDA4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6E3:
    CPX #$30             ; E0 30 | Compare X register (immediate)
    BCC $C9              ; 90 C9 | Branch if carry clear
    LDA $24E4            ; AD E4 24 | Load from absolute address into accumulator
    BEQ $05              ; F0 05 | Branch if equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6E5
; Address: $C5BDB3
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6E5:
    JSR $BDE4            ; 20 E4 BD | Jump to subroutine
    LDA $2428            ; AD 28 24 | Load from absolute address into accumulator
    BMI $11              ; 30 11 | Branch if negative
    LSR $2428            ; 4E 28 24 | Logical shift right (absolute)
    PLA                  ; 68 | Pull accumulator from stack
    STA $02              ; 85 02 | Store accumulator to zero page
    PLA                  ; 68 | Pull accumulator from stack
    STA $00              ; 85 00 | Store accumulator to zero page
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6E6
; Address: $C5BDCC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6E6:
    PLA                  ; 68 | Pull accumulator from stack
    STA $02              ; 85 02 | Store accumulator to zero page
    PLA                  ; 68 | Pull accumulator from stack
    STA $00              ; 85 00 | Store accumulator to zero page
    LDX #$00             ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6E7
; Address: $C5BDD5
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6E7:
    JSL $C01407          ; 22 07 14 C0 | Jump to subroutine long
    STA $2428            ; 8D 28 24 | Store accumulator to absolute address
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6E8
; Address: $C5BDE4
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6E8:
    LDX #$2E             ; A2 2E | Load immediate value into X register
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    STA $2428            ; 8D 28 24 | Store accumulator to absolute address
    PHA                  ; 48 | Push accumulator to stack
    LDA $2484,X          ; BD 84 24 | Load from absolute,X into accumulator
    BEQ $0B              ; F0 0B | Branch if equal
    DEC                  ; 3A | Decrement accumulator
    ORA ($B0,X)          ; 01 B0 | Logical OR with accumulator ((zero page,X))
    ASL $1A              ; 06 1A | Arithmetic shift left (zero page)
    ORA ($8E,X)          ; 01 8E | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    BIT $CA              ; 24 CA | Test bits in accumulator (zero page)
    DEX                  ; CA | Decrement X register
    BPL $EC              ; 10 EC | Branch if positive
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6EA
; Address: $C5BE04
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6EA:
    LDX #$2E             ; A2 2E | Load immediate value into X register
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    STA $2428            ; 8D 28 24 | Store accumulator to absolute address
    INC                  ; 1A | Increment accumulator
    CMP $24B4,X          ; DD B4 24 | Compare accumulator (absolute,X)
    BCS $06              ; B0 06 | Branch if carry set
    LDA $24B4,X          ; BD B4 24 | Load from absolute,X into accumulator
    STX $2428            ; 8E 28 24 | Store X register to absolute address
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    BPL $F1              ; 10 F1 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6EB
; Address: $C5BE1E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6EB:
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    LDX $23EE            ; AE EE 23 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6EC
; Address: $C5BE2C
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6EC:
    JSL $C2CC25          ; 22 25 CC C2 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CMP #$03             ; C9 03 | Compare accumulator (immediate)
    BCS $FE              ; B0 FE | Branch if carry set
    TAX                  ; AA | Transfer accumulator to X register
    LSR $ADBE,X          ; 5E BE AD | Logical shift right (absolute,X)
    LDX $0923            ; AE 23 09 | Load from absolute address into X register
    BPL $00              ; 10 00 | Branch if positive
    STA $23AE            ; 8D AE 23 | Store accumulator to absolute address
    LDA $2428            ; AD 28 24 | Load from absolute address into accumulator
    STA $23E8            ; 8D E8 23 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6ED
; Address: $C5BE4D
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6ED:
    JSL $C28EFB          ; 22 FB 8E C2 | Jump to subroutine long
    LDA $23E8            ; AD E8 23 | Load from absolute address into accumulator
    STA $2428            ; 8D 28 24 | Store accumulator to absolute address
    LDA $00              ; A5 00 | Load from zero page into accumulator
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6EE
; Address: $C5BE5F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6EE:
    LDX $BE65,Y          ; BE 65 BE | Load from absolute,Y into X register
    STZ $00              ; 64 00 | Store zero to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6EF
; Address: $C5BE65
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6EF:
    STZ $00              ; 64 00 | Store zero to zero page
    LDX $23E4            ; AE E4 23 | Load from absolute address into X register
    LDY $2428            ; AC 28 24 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6F1
; Address: $C5BE71
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6F1:
    EOR ($20,X)          ; 41 20 | Exclusive OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    STA $02              ; 85 02 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6F3
; Address: $C5BE7B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6F3:
    JSR $E538            ; 20 38 E5 | Jump to subroutine
    BMI $08              ; 30 08 | Branch if negative
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    LSR                  ; 4A | Logical shift right (accumulator)
    STA $00              ; 85 00 | Store accumulator to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6F4
; Address: $C5BE8A
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6F4:
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    SEP #$20             ; E2 20 | Set processor status bits
    ORA #$48             ; 09 48 | Logical OR with accumulator (immediate)
    PLB                  ; AB | Pull data bank register from stack
    LDY #$01             ; A0 01 | Load immediate value into Y register
    REP #$20             ; C2 20 | Reset processor status bits
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    TAY                  ; A8 | Transfer accumulator to Y register
    INC                  ; 1A | Increment accumulator
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDA $2428            ; AD 28 24 | Load from absolute address into accumulator
    CMP #$18             ; C9 18 | Compare accumulator (immediate)
    BCS $FE              ; B0 FE | Branch if carry set
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF D3 CB C2 | Load from absolute long,X into accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $2050,Y          ; B9 50 20 | Load from absolute,Y into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BEQ $FE              ; F0 FE | Branch if equal
    LDA $2050,Y          ; B9 50 20 | Load from absolute,Y into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $0D              ; D0 0D | Branch if not equal
    SBC #$BE             ; E9 BE | Subtract with carry (immediate)
    BCS $11              ; B0 11 | Branch if carry set
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    PHA                  ; 48 | Push accumulator to stack
    PLA                  ; 68 | Pull accumulator from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6F5
; Address: $C5BED8
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6F5:
    LDA $2049,Y          ; B9 49 20 | Load from absolute,Y into accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA $90BF,Y          ; 19 BF 90 | Logical OR with accumulator (absolute,Y)
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    PHA                  ; 48 | Push accumulator to stack
    PLA                  ; 68 | Pull accumulator from stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6F6
; Address: $C5BEE9
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6F6:
    BIT $38C0            ; 2C C0 38 | Test bits in accumulator (absolute)
    CPY #$5B             ; C0 5B | Compare Y register (immediate)
    CPY #$75             ; C0 75 | Compare Y register (immediate)
    CPY #$A4             ; C0 A4 | Compare Y register (immediate)
    CPY #$B0             ; C0 B0 | Compare Y register (immediate)
    CPY #$D3             ; C0 D3 | Compare Y register (immediate)
    CPY #$ED             ; C0 ED | Compare Y register (immediate)
    CPY #$15             ; C0 15 | Compare Y register (immediate)
    CMP ($2F,X)          ; C1 2F | Compare accumulator ((zero page,X))
    CMP ($5A,X)          ; C1 5A | Compare accumulator ((zero page,X))
    CMP ($85,X)          ; C1 85 | Compare accumulator ((zero page,X))
    CMP ($9F,X)          ; C1 9F | Compare accumulator ((zero page,X))
    CMP ($CA,X)          ; C1 CA | Compare accumulator ((zero page,X))
    CMP ($F5,X)          ; C1 F5 | Compare accumulator ((zero page,X))
    CMP ($0F,X)          ; C1 0F | Compare accumulator ((zero page,X))
    REP #$20             ; C2 20 | Reset processor status bits
    REP #$2D             ; C2 2D | Reset processor status bits
    REP #$35             ; C2 35 | Reset processor status bits
    REP #$07             ; C2 07 | Reset processor status bits
    CPY #$5A             ; C0 5A | Compare Y register (immediate)
    LDA                  ; BF 87 BF C7 | Load from absolute long,X into accumulator
    LDA                  ; BF 49 BF 30 | Load from absolute long,X into accumulator
    CPY #$53             ; C0 53 | Compare Y register (immediate)
    CPY #$6D             ; C0 6D | Compare Y register (immediate)
    CPY #$8E             ; C0 8E | Compare Y register (immediate)
    CPY #$A8             ; C0 A8 | Compare Y register (immediate)
    CPY #$CB             ; C0 CB | Compare Y register (immediate)
    CPY #$E5             ; C0 E5 | Compare Y register (immediate)
    CPY #$01             ; C0 01 | Compare Y register (immediate)
    CMP ($20,X)          ; C1 20 | Compare accumulator ((zero page,X))
    CMP ($44,X)          ; C1 44 | Compare accumulator ((zero page,X))
    CMP ($6F,X)          ; C1 6F | Compare accumulator ((zero page,X))
    CMP ($90,X)          ; C1 90 | Compare accumulator ((zero page,X))
    CMP ($B4,X)          ; C1 B4 | Compare accumulator ((zero page,X))
    CMP ($DF,X)          ; C1 DF | Compare accumulator ((zero page,X))
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    REP #$19             ; C2 19 | Reset processor status bits
    REP #$22             ; C2 22 | Reset processor status bits
    REP #$32             ; C2 32 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6F7
; Address: $C5BF3C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6F7:
    REP #$37             ; C2 37 | Reset processor status bits
    REP #$07             ; C2 07 | Reset processor status bits
    CPY #$65             ; C0 65 | Compare Y register (immediate)
    LDA                  ; BF 9B BF DB | Load from absolute long,X into accumulator
    LDA                  ; BF 4B BF 18 | Load from absolute long,X into accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6F8
; Address: $C5BF4B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6F8:
    JSL $C42E19          ; 22 19 2E C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    BNE $01              ; D0 01 | Branch if not equal
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6F9
; Address: $C5BF5A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6F9:
    LDA $2050,Y          ; B9 50 20 | Load from absolute,Y into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    BEQ $01              ; F0 01 | Branch if equal
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6FB
; Address: $C5BF68
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6FB:
    JSL $C44DC0          ; 22 C0 4D C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    BVS $13              ; 70 13 | Branch if overflow set
    LDA $2428            ; AD 28 24 | Load from absolute address into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF D3 CB C2 | Load from absolute long,X into accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $2050,Y          ; B9 50 20 | Load from absolute,Y into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    BEQ $01              ; F0 01 | Branch if equal
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6FC
; Address: $C5BF87
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6FC:
    LDA $2050,Y          ; B9 50 20 | Load from absolute,Y into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    SEC                  ; 38 | Set carry flag
    BEQ $0A              ; F0 0A | Branch if equal
    LDA $2050,Y          ; B9 50 20 | Load from absolute,Y into accumulator
    AND #$EF             ; 29 EF | Logical AND with accumulator (immediate)
    STA $2050,Y          ; 99 50 20 | Store accumulator to absolute,Y
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6FE
; Address: $C5BF9E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6FE:
    JSL $C44DC0          ; 22 C0 4D C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    SEC                  ; 38 | Set carry flag
    BVS $1D              ; 70 1D | Branch if overflow set

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_6FF
; Address: $C5BFA9
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_6FF:
    LDA $2428            ; AD 28 24 | Load from absolute address into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF D3 CB C2 | Load from absolute long,X into accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $2050,Y          ; B9 50 20 | Load from absolute,Y into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    SEC                  ; 38 | Set carry flag
    BEQ $0A              ; F0 0A | Branch if equal
    LDA $2050,Y          ; B9 50 20 | Load from absolute,Y into accumulator
    AND #$EF             ; 29 EF | Logical AND with accumulator (immediate)
    STA $2050,Y          ; 99 50 20 | Store accumulator to absolute,Y
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_700
; Address: $C5BFC7
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_700:
    LDA $2050,Y          ; B9 50 20 | Load from absolute,Y into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    SEC                  ; 38 | Set carry flag
    BNE $0A              ; D0 0A | Branch if not equal
    LDA $2050,Y          ; B9 50 20 | Load from absolute,Y into accumulator
    ORA #$10             ; 09 10 | Logical OR with accumulator (immediate)
    STA $2050,Y          ; 99 50 20 | Store accumulator to absolute,Y
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_702
; Address: $C5BFDE
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_702:
    JSL $C44DC0          ; 22 C0 4D C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    SEC                  ; 38 | Set carry flag
    BVS $1D              ; 70 1D | Branch if overflow set
    LDA $2428            ; AD 28 24 | Load from absolute address into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF D3 CB C2 | Load from absolute long,X into accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $2050,Y          ; B9 50 20 | Load from absolute,Y into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    SEC                  ; 38 | Set carry flag
    BNE $0A              ; D0 0A | Branch if not equal
    LDA $2050,Y          ; B9 50 20 | Load from absolute,Y into accumulator
    ORA #$10             ; 09 10 | Logical OR with accumulator (immediate)
    STA $2050,Y          ; 99 50 20 | Store accumulator to absolute,Y
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_703
; Address: $C5C007
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_703:
    PEA #$23AC           ; F4 AC 23 | Push effective address to stack
    PEA #$0007           ; F4 07 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_704
; Address: $C5C010
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_704:
    JSL $C9029E          ; 22 9E 02 C9 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    BEQ $14              ; F0 14 | Branch if equal
    PEA #$23AA           ; F4 AA 23 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_706
; Address: $C5C020
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_706:
    JSL $C9029E          ; 22 9E 02 C9 | Jump to subroutine long
    CMP $2428            ; CD 28 24 | Compare accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    BEQ $01              ; F0 01 | Branch if equal
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_708
; Address: $C5C030
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_708:
    JSL $C43115          ; 22 15 31 C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_70A
; Address: $C5C03A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_70A:
    JSR $C041            ; 20 41 C0 | Jump to subroutine
    STA $2030,Y          ; 99 30 20 | Store accumulator to absolute,Y
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_70B
; Address: $C5C041
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_70B:
    PHA                  ; 48 | Push accumulator to stack
    LDA $204B,Y          ; B9 4B 20 | Load from absolute,Y into accumulator
    PHY                  ; 5A | Push Y register to stack
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_70C
; Address: $C5C047
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_70C:
    JSR $C2D0            ; 20 D0 C2 | Jump to subroutine
    PLY                  ; 7A | Pull Y register from stack
    ORA ($B0,X)          ; 01 B0 | Logical OR with accumulator ((zero page,X))
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_70D
; Address: $C5C053
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_70D:
    JSL $C43154          ; 22 54 31 C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_70E
; Address: $C5C05B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_70E:
    LDA $2030,Y          ; B9 30 20 | Load from absolute,Y into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC $00              ; 65 00 | Add with carry (zero page)
    BCC $03              ; 90 03 | Branch if carry clear
    LDA #$FF             ; A9 FF | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_70F
; Address: $C5C066
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_70F:
    JSR $C041            ; 20 41 C0 | Jump to subroutine
    STA $2030,Y          ; 99 30 20 | Store accumulator to absolute,Y
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_710
; Address: $C5C06D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_710:
    JSL $C43193          ; 22 93 31 C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_711
; Address: $C5C075
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_711:
    LDA $2030,Y          ; B9 30 20 | Load from absolute,Y into accumulator
    BEQ $0A              ; F0 0A | Branch if equal
    SEC                  ; 38 | Set carry flag
    SBC $00              ; E5 00 | Subtract with carry (zero page)
    BEQ $07              ; F0 07 | Branch if equal
    BCC $05              ; 90 05 | Branch if carry clear
    STA $2030,Y          ; 99 30 20 | Store accumulator to absolute,Y
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_713
; Address: $C5C089
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_713:
    STA $2030,Y          ; 99 30 20 | Store accumulator to absolute,Y
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_714
; Address: $C5C08E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_714:
    JSL $C43115          ; 22 15 31 C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $08              ; F0 08 | Branch if equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_715
; Address: $C5C09A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_715:
    JSL $C431D7          ; 22 D7 31 C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_718
; Address: $C5C0A8
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_718:
    JSL $C43305          ; 22 05 33 C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_71A
; Address: $C5C0B2
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_71A:
    JSR $C0B9            ; 20 B9 C0 | Jump to subroutine
    STA $2032,Y          ; 99 32 20 | Store accumulator to absolute,Y
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_71B
; Address: $C5C0B9
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_71B:
    PHA                  ; 48 | Push accumulator to stack
    LDA $204B,Y          ; B9 4B 20 | Load from absolute,Y into accumulator
    PHY                  ; 5A | Push Y register to stack
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_71C
; Address: $C5C0BF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_71C:
    JSR $C2DF            ; 20 DF C2 | Jump to subroutine
    PLY                  ; 7A | Pull Y register from stack
    ORA ($B0,X)          ; 01 B0 | Logical OR with accumulator ((zero page,X))
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_71D
; Address: $C5C0CB
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_71D:
    JSL $C43337          ; 22 37 33 C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_71E
; Address: $C5C0D3
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_71E:
    LDA $2032,Y          ; B9 32 20 | Load from absolute,Y into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC $00              ; 65 00 | Add with carry (zero page)
    BCC $03              ; 90 03 | Branch if carry clear
    LDA #$FF             ; A9 FF | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_71F
; Address: $C5C0DE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_71F:
    JSR $C0B9            ; 20 B9 C0 | Jump to subroutine
    STA $2032,Y          ; 99 32 20 | Store accumulator to absolute,Y
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_720
; Address: $C5C0E5
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_720:
    JSL $C43376          ; 22 76 33 C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_721
; Address: $C5C0ED
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_721:
    LDA $2032,Y          ; B9 32 20 | Load from absolute,Y into accumulator
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    BEQ $0B              ; F0 0B | Branch if equal
    SEC                  ; 38 | Set carry flag
    SBC $00              ; E5 00 | Subtract with carry (zero page)
    BCS $03              ; B0 03 | Branch if carry set

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_722
; Address: $C5C0FA
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_722:
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $2032,Y          ; 99 32 20 | Store accumulator to absolute,Y
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_723
; Address: $C5C101
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_723:
    JSL $C433BA          ; 22 BA 33 C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    BCC $0A              ; 90 0A | Branch if carry clear
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_724
; Address: $C5C10D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_724:
    JSL $C43337          ; 22 37 33 C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_725
; Address: $C5C115
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_725:
    LDA $2050,Y          ; B9 50 20 | Load from absolute,Y into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    BEQ $01              ; F0 01 | Branch if equal
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_726
; Address: $C5C120
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_726:
    JSL $C43F87          ; 22 87 3F C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    BEQ $01              ; F0 01 | Branch if equal
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_727
; Address: $C5C12F
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_727:
    LDA $2050,Y          ; B9 50 20 | Load from absolute,Y into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BEQ $0B              ; F0 0B | Branch if equal
    LDA $2050,Y          ; B9 50 20 | Load from absolute,Y into accumulator
    AND #$BF             ; 29 BF | Logical AND with accumulator (immediate)
    STA $2050,Y          ; 99 50 20 | Store accumulator to absolute,Y
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_729
; Address: $C5C144
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_729:
    JSL $C43F87          ; 22 87 3F C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BEQ $08              ; F0 08 | Branch if equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_72A
; Address: $C5C150
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_72A:
    JSL $C440B0          ; 22 B0 40 C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_72C
; Address: $C5C15A
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_72C:
    LDA $2050,Y          ; B9 50 20 | Load from absolute,Y into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BNE $0B              ; D0 0B | Branch if not equal
    LDA $2050,Y          ; B9 50 20 | Load from absolute,Y into accumulator
    ORA #$40             ; 09 40 | Logical OR with accumulator (immediate)
    STA $2050,Y          ; 99 50 20 | Store accumulator to absolute,Y
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_72F
; Address: $C5C16F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_72F:
    JSL $C43F87          ; 22 87 3F C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $08              ; D0 08 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_730
; Address: $C5C17B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_730:
    JSL $C44078          ; 22 78 40 C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_732
; Address: $C5C185
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_732:
    LDA $2050,Y          ; B9 50 20 | Load from absolute,Y into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    BEQ $01              ; F0 01 | Branch if equal
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_733
; Address: $C5C190
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_733:
    JSL $C43F87          ; 22 87 3F C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    BEQ $01              ; F0 01 | Branch if equal
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_734
; Address: $C5C19F
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_734:
    LDA $2050,Y          ; B9 50 20 | Load from absolute,Y into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BEQ $0B              ; F0 0B | Branch if equal
    LDA $2050,Y          ; B9 50 20 | Load from absolute,Y into accumulator
    AND #$F7             ; 29 F7 | Logical AND with accumulator (immediate)
    STA $2050,Y          ; 99 50 20 | Store accumulator to absolute,Y
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_736
; Address: $C5C1B4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_736:
    JSL $C43F87          ; 22 87 3F C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BEQ $08              ; F0 08 | Branch if equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_737
; Address: $C5C1C0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_737:
    JSL $C44129          ; 22 29 41 C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_739
; Address: $C5C1CA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_739:
    LDA $2050,Y          ; B9 50 20 | Load from absolute,Y into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $0B              ; D0 0B | Branch if not equal
    LDA $2050,Y          ; B9 50 20 | Load from absolute,Y into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_73A
; Address: $C5C1D5
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_73A:
    ORA #$08             ; 09 08 | Logical OR with accumulator (immediate)
    STA $2050,Y          ; 99 50 20 | Store accumulator to absolute,Y
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_73C
; Address: $C5C1DF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_73C:
    JSL $C43F87          ; 22 87 3F C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $08              ; D0 08 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_73D
; Address: $C5C1EB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_73D:
    JSL $C440F1          ; 22 F1 40 C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_73F
; Address: $C5C1F5
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_73F:
    LDA $2050,Y          ; B9 50 20 | Load from absolute,Y into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    BEQ $01              ; F0 01 | Branch if equal
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_740
; Address: $C5C200
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_740:
    JSL $C43F87          ; 22 87 3F C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    BEQ $01              ; F0 01 | Branch if equal
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_741
; Address: $C5C20F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_741:
    LDA $2050,Y          ; B9 50 20 | Load from absolute,Y into accumulator
    AND #$FB             ; 29 FB | Logical AND with accumulator (immediate)
    STA $2050,Y          ; 99 50 20 | Store accumulator to absolute,Y
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_742
; Address: $C5C219
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_742:
    JSL $C44045          ; 22 45 40 C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_744
; Address: $C5C222
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_744:
    LDA $23AC            ; AD AC 23 | Load from absolute address into accumulator
    AND #$18             ; 29 18 | Logical AND with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    BEQ $01              ; F0 01 | Branch if equal
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_745
; Address: $C5C22D
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_745:
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_746
; Address: $C5C232
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_746:
    TYA                  ; 98 | Transfer Y register to accumulator
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_748
; Address: $C5C237
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_748:
    JSL $C46951          ; 22 51 69 C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_749
; Address: $C5C240
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_749:
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDY #$01             ; A0 01 | Load immediate value into Y register
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    TAY                  ; A8 | Transfer accumulator to Y register
    INC                  ; 1A | Increment accumulator
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDA $2428            ; AD 28 24 | Load from absolute address into accumulator
    CMP #$18             ; C9 18 | Compare accumulator (immediate)
    BCS $FE              ; B0 FE | Branch if carry set
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF D3 CB C2 | Load from absolute long,X into accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $2050,Y          ; B9 50 20 | Load from absolute,Y into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BEQ $FE              ; F0 FE | Branch if equal
    LDA $2050,Y          ; B9 50 20 | Load from absolute,Y into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $11              ; D0 11 | Branch if not equal
    LDA $204B,Y          ; B9 4B 20 | Load from absolute,Y into accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    LDY #$C2             ; A0 C2 | Load immediate value into Y register
    BCS $11              ; B0 11 | Branch if carry set
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    PHA                  ; 48 | Push accumulator to stack
    PLA                  ; 68 | Pull accumulator from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_74A
; Address: $C5C28F
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_74A:
    LDA $2049,Y          ; B9 49 20 | Load from absolute,Y into accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    CLV                  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_74B
; Address: $C5C295
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_74B:
    REP #$90             ; C2 90 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    PHA                  ; 48 | Push accumulator to stack
    PLA                  ; 68 | Pull accumulator from stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_74C
; Address: $C5C2A0
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_74C:
    BNE $C2              ; D0 C2 | Branch if not equal
    REP #$F8             ; C2 F8 | Reset processor status bits
    REP #$09             ; C2 09 | Reset processor status bits
    INC                  ; 1A | Increment accumulator
    EOR #$C3             ; 49 C3 | Exclusive OR with accumulator (immediate)
    LDA                  ; BF C3 D7 C2 | Load from absolute long,X into accumulator
    BEQ $C2              ; F0 C2 | Branch if equal
    ORA ($C3,X)          ; 01 C3 | Logical OR with accumulator ((zero page,X))
    EOR $C3              ; 45 C3 | Exclusive OR with accumulator (zero page)
    ROR $AEC3,X          ; 7E C3 AE | Rotate right (absolute,X)
    CPX $22C4            ; EC C4 22 | Compare X register (absolute)
    BVS $CC              ; 70 CC | Branch if overflow set
    REP #$22             ; C2 22 | Reset processor status bits
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_74D
; Address: $C5C2D7
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_74D:
    JSL $C43041          ; 22 41 30 C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_74E
; Address: $C5C2DF
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_74E:
    JSL $C2CC92          ; 22 92 CC C2 | Jump to subroutine long
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_74F
; Address: $C5C2F0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_74F:
    JSL $C43231          ; 22 31 32 C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_750
; Address: $C5C2F8
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_750:
    JSL $C2CC92          ; 22 92 CC C2 | Jump to subroutine long
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_751
; Address: $C5C301
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_751:
    JSL $C43A42          ; 22 42 3A C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_752
; Address: $C5C309
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_752:
    JSL $C2CC92          ; 22 92 CC C2 | Jump to subroutine long
    BEQ $3F              ; F0 3F | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_753
; Address: $C5C312
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_753:
    JSL $C43AFA          ; 22 FA 3A C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_754
; Address: $C5C31A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_754:
    JSL $C2CC92          ; 22 92 CC C2 | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_758
; Address: $C5C334
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_758:
    JSL $C42FEB          ; 22 EB 2F C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_759
; Address: $C5C33C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_759:
    JSL $C2CC92          ; 22 92 CC C2 | Jump to subroutine long
    ORA $0700,X          ; 1D 00 07 | Logical OR with accumulator (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_75B
; Address: $C5C349
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_75B:
    JSL $C2CC92          ; 22 92 CC C2 | Jump to subroutine long
    BMI $00              ; 30 00 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_75D
; Address: $C5C356
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_75D:
    JSL $C2CC92          ; 22 92 CC C2 | Jump to subroutine long
    ORA $C000,X          ; 1D 00 C0 | Logical OR with accumulator (absolute,X)
    BNE $02              ; D0 02 | Branch if not equal
    INC                  ; 1A | Increment accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_75F
; Address: $C5C365
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_75F:
    JSL $C012D1          ; 22 D1 12 C0 | Jump to subroutine long
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    INC                  ; 1A | Increment accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_760
; Address: $C5C36E
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_760:
    DEC                  ; 3A | Decrement accumulator
    BNE $09              ; D0 09 | Branch if not equal
    LDA #$02             ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_761
; Address: $C5C374
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_761:
    JSL $C0133E          ; 22 3E 13 C0 | Jump to subroutine long
    INC                  ; 1A | Increment accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_764
; Address: $C5C382
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_764:
    JSL $C2CC92          ; 22 92 CC C2 | Jump to subroutine long
    ASL $0300,X          ; 1E 00 03 | Arithmetic shift left (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF A7 C3 C2 | Load from absolute long,X into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_765
; Address: $C5C393
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_765:
    JSL $C0133E          ; 22 3E 13 C0 | Jump to subroutine long
    PHA                  ; 48 | Push accumulator to stack
    LDA                  ; BF A6 C3 C2 | Load from absolute long,X into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    ORA ($83,X)          ; 01 83 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_767
; Address: $C5C3A8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_767:
    BPL $08              ; 10 08 | Branch if positive
    BIT $5A0C            ; 2C 0C 5A | Test bits in accumulator (absolute)
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_768
; Address: $C5C3B2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_768:
    JSL $C2CC92          ; 22 92 CC C2 | Jump to subroutine long
    ASL $0C00,X          ; 1E 00 0C | Arithmetic shift left (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_76B
; Address: $C5C3C2
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_76B:
    JSL $C2CC25          ; 22 25 CC C2 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    CMP #$18             ; C9 18 | Compare accumulator (immediate)
    BCS $FE              ; B0 FE | Branch if carry set
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    CPY $0A              ; C4 0A | Compare Y register (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF DB C3 C2 | Load from absolute long,X into accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_76C
; Address: $C5C3DC
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_76C:
    ORA ($C0,X)          ; 01 C0 | Logical OR with accumulator ((zero page,X))
    JMP $0000            ; 4C 00 00 | Jump to address
    ORA ($C0,X)          ; 01 C0 | Logical OR with accumulator ((zero page,X))
    JMP $0000            ; 4C 00 00 | Jump to address
    ORA ($CD,X)          ; 01 CD | Logical OR with accumulator ((zero page,X))
    TXS                  ; 9A | Transfer X register to stack pointer
    BRA $00              ; 80 00 | Branch always
    ORA ($C0,X)          ; 01 C0 | Logical OR with accumulator ((zero page,X))
    JMP $0000            ; 4C 00 00 | Jump to address
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_76E
; Address: $C5C401
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_76E:
    JSR $3F00            ; 20 00 3F | Jump to subroutine
    CPY $43              ; C4 43 | Compare Y register (zero page)
    CPY $4C              ; C4 4C | Compare Y register (zero page)
    CPY $55              ; C4 55 | Compare Y register (zero page)
    CPY $5E              ; C4 5E | Compare Y register (zero page)
    CPY $67              ; C4 67 | Compare Y register (zero page)
    CPY $74              ; C4 74 | Compare Y register (zero page)
    CPY $7D              ; C4 7D | Compare Y register (zero page)
    CPY $86              ; C4 86 | Compare Y register (zero page)
    CPY $8F              ; C4 8F | Compare Y register (zero page)
    CPY $98              ; C4 98 | Compare Y register (zero page)
    CPY $A1              ; C4 A1 | Compare Y register (zero page)
    CPY $AA              ; C4 AA | Compare Y register (zero page)
    CPY $B3              ; C4 B3 | Compare Y register (zero page)
    CPY $BC              ; C4 BC | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_76F
; Address: $C5C420
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_76F:
    CPY $43              ; C4 43 | Compare Y register (zero page)
    CPY $4C              ; C4 4C | Compare Y register (zero page)
    CPY $C5              ; C4 C5 | Compare Y register (zero page)
    CPY $CE              ; C4 CE | Compare Y register (zero page)
    CPY $D2              ; C4 D2 | Compare Y register (zero page)
    CPY $DF              ; C4 DF | Compare Y register (zero page)
    CPY $33              ; C4 33 | Compare Y register (zero page)
    CPY $37              ; C4 37 | Compare Y register (zero page)
    CPY $3B              ; C4 3B | Compare Y register (zero page)
    CPY $A9              ; C4 A9 | Compare Y register (zero page)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_773
; Address: $C5C443
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_773:
    JSL $C2CC92          ; 22 92 CC C2 | Jump to subroutine long
    ASL $3000,X          ; 1E 00 30 | Arithmetic shift left (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_774
; Address: $C5C44C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_774:
    JSL $C2CC92          ; 22 92 CC C2 | Jump to subroutine long
    ASL $C000,X          ; 1E 00 C0 | Arithmetic shift left (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_777
; Address: $C5C467
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_777:
    JSL $C2CC92          ; 22 92 CC C2 | Jump to subroutine long
    BMI $00              ; 30 00 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    ADC #$04             ; 69 04 | Add with carry (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_778
; Address: $C5C474
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_778:
    JSL $C2CC92          ; 22 92 CC C2 | Jump to subroutine long
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_779
; Address: $C5C47D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_779:
    JSL $C2CC92          ; 22 92 CC C2 | Jump to subroutine long
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_77A
; Address: $C5C486
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_77A:
    JSL $C2CC92          ; 22 92 CC C2 | Jump to subroutine long
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_77B
; Address: $C5C48F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_77B:
    JSL $C2CC92          ; 22 92 CC C2 | Jump to subroutine long
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    BMI $00              ; 30 00 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_784
; Address: $C5C4BC
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_784:
    JSL $C2CC92          ; 22 92 CC C2 | Jump to subroutine long
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_785
; Address: $C5C4C5
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_785:
    JSL $C2CC92          ; 22 92 CC C2 | Jump to subroutine long
    BMI $00              ; 30 00 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_787
; Address: $C5C4D2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_787:
    JSL $C2CC92          ; 22 92 CC C2 | Jump to subroutine long
    ASL $3000,X          ; 1E 00 30 | Arithmetic shift left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    ADC #$08             ; 69 08 | Add with carry (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_788
; Address: $C5C4DF
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_788:
    JSL $C2CC92          ; 22 92 CC C2 | Jump to subroutine long
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    ADC #$0C             ; 69 0C | Add with carry (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_789
; Address: $C5C4EC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_789:
    LDA $23F2            ; AD F2 23 | Load from absolute address into accumulator
    BNE $18              ; D0 18 | Branch if not equal
    LDX $242A            ; AE 2A 24 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_78A
; Address: $C5C4F4
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_78A:
    JSL $C2CC25          ; 22 25 CC C2 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    BEQ $00              ; F0 00 | Branch if equal
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_78E
; Address: $C5C50C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_78E:
    JSL $C2CC25          ; 22 25 CC C2 | Jump to subroutine long
    SEI                  ; 78 | Set interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_792
; Address: $C5C522
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_792:
    JSL $C2CC25          ; 22 25 CC C2 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    BPL $00              ; 10 00 | Branch if positive
    BEQ $2D              ; F0 2D | Branch if equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_793
; Address: $C5C52C
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_793:
    JSL $C438FB          ; 22 FB 38 C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    STA $6A              ; 85 6A | Store accumulator to zero page
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    ORA ($38,X)          ; 01 38 | Logical OR with accumulator ((zero page,X))
    SBC $6A              ; E5 6A | Subtract with carry (zero page)
    STA $6A              ; 85 6A | Store accumulator to zero page
    LDA $242A            ; AD 2A 24 | Load from absolute address into accumulator
    CMP #$2E             ; C9 2E | Compare accumulator (immediate)
    BEQ $16              ; F0 16 | Branch if equal
    LDX #$6A             ; A2 6A | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LSR $11              ; 46 11 | Logical shift right (zero page)
    CPY #$A9             ; C0 A9 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    CPY #$A5             ; C0 A5 | Compare Y register (immediate)
    ROR                  ; 6A | Rotate right (accumulator)
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_794
; Address: $C5C55B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_794:
    LDA #$FE             ; A9 FE | Load immediate value into accumulator
    STA $6C              ; 85 6C | Store accumulator to zero page
    LDX #$6C             ; A2 6C | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LSR $11              ; 46 11 | Logical shift right (zero page)
    CPY #$A5             ; C0 A5 | Compare Y register (immediate)
    ROR                  ; 6A | Rotate right (accumulator)

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_795
; Address: $C5C56B
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_795:
    JSL $C01295          ; 22 95 12 C0 | Jump to subroutine long
    LDA $6C              ; A5 6C | Load from zero page into accumulator
    BRA $E4              ; 80 E4 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    SEP #$20             ; E2 20 | Set processor status bits
    ORA #$48             ; 09 48 | Logical OR with accumulator (immediate)
    PLB                  ; AB | Pull data bank register from stack
    LDY #$01             ; A0 01 | Load immediate value into Y register
    REP #$20             ; C2 20 | Reset processor status bits
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_796
; Address: $C5C589
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_796:
    TAY                  ; A8 | Transfer accumulator to Y register
    INC                  ; 1A | Increment accumulator
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDA $2428            ; AD 28 24 | Load from absolute address into accumulator
    CMP #$18             ; C9 18 | Compare accumulator (immediate)
    BCS $FE              ; B0 FE | Branch if carry set
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF D3 CB C2 | Load from absolute long,X into accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $2050,Y          ; B9 50 20 | Load from absolute,Y into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BEQ $FE              ; F0 FE | Branch if equal
    LDA $2051,Y          ; B9 51 20 | Load from absolute,Y into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $11              ; D0 11 | Branch if not equal
    LDA $204B,Y          ; B9 4B 20 | Load from absolute,Y into accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    CMP $B0              ; C5 B0 | Compare accumulator (zero page)
    ORA ($7A),Y          ; 11 7A | Logical OR with accumulator ((zero page),Y)
    PLX                  ; FA | Pull X register from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    PHA                  ; 48 | Push accumulator to stack
    PLA                  ; 68 | Pull accumulator from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_797
; Address: $C5C5C5
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_797:
    LDA $204B,Y          ; B9 4B 20 | Load from absolute,Y into accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    CMP $90              ; C5 90 | Compare accumulator (zero page)
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    PHA                  ; 48 | Push accumulator to stack
    PLA                  ; 68 | Pull accumulator from stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_798
; Address: $C5C5D6
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_798:
    SEP #$C5             ; E2 C5 | Set processor status bits
    EOR $6AC6,X          ; 5D C6 6A | Exclusive OR with accumulator (absolute,X)
    DEC $59              ; C6 59 | Decrement (zero page)
    DEC $66              ; C6 66 | Decrement (zero page)
    DEC $C9              ; C6 C9 | Decrement (zero page)
    DEC $98              ; C6 98 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_799
; Address: $C5C5E3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_799:
    JSL $C2BAB7          ; 22 B7 BA C2 | Jump to subroutine long
    BCC $11              ; 90 11 | Branch if carry clear
    LDX $2428            ; AE 28 24 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_79B
; Address: $C5C5F1
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_79B:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $2014,X          ; BD 14 20 | Load from absolute,X into accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_79C
; Address: $C5C5FA
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_79C:
    LDA $00              ; A5 00 | Load from zero page into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    EOR #$C6             ; 49 C6 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_79D
; Address: $C5C601
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_79D:
    JSL $C2CC92          ; 22 92 CC C2 | Jump to subroutine long
    ASL $FF00            ; 0E 00 FF | Arithmetic shift left (absolute)
    ORA ($60,X)          ; 01 60 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_79F
; Address: $C5C613
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_79F:
    JSL $C2CC92          ; 22 92 CC C2 | Jump to subroutine long
    BPL $00              ; 10 00 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7A0
; Address: $C5C61C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7A0:
    JSL $C2CC92          ; 22 92 CC C2 | Jump to subroutine long
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7A1
; Address: $C5C625
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7A1:
    JSL $C2CC92          ; 22 92 CC C2 | Jump to subroutine long
    BEQ $1F              ; F0 1F | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7A2
; Address: $C5C62E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7A2:
    JSL $C2CC92          ; 22 92 CC C2 | Jump to subroutine long
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7A3
; Address: $C5C637
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7A3:
    JSL $C2CC92          ; 22 92 CC C2 | Jump to subroutine long
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7A4
; Address: $C5C640
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7A4:
    JSL $C2CC92          ; 22 92 CC C2 | Jump to subroutine long
    BRA $FF              ; 80 FF | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7A5
; Address: $C5C649
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7A5:
    ORA ($C6,X)          ; 01 C6 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    DEC $13              ; C6 13 | Decrement (zero page)
    DEC $1C              ; C6 1C | Decrement (zero page)
    DEC $25              ; C6 25 | Decrement (zero page)
    DEC $2E              ; C6 2E | Decrement (zero page)
    DEC $37              ; C6 37 | Decrement (zero page)
    DEC $40              ; C6 40 | Decrement (zero page)
    DEC $A9              ; C6 A9 | Decrement (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7A6
; Address: $C5C65D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7A6:
    JSL $C2CC92          ; 22 92 CC C2 | Jump to subroutine long
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7A9
; Address: $C5C66D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7A9:
    TAX                  ; AA | Transfer accumulator to X register
    LDA $22C6,Y          ; B9 C6 22 | Load from absolute,Y into accumulator
    CPY $17C2            ; CC C2 17 | Compare Y register (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7AC
; Address: $C5C68C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7AC:
    JSL $C2CC92          ; 22 92 CC C2 | Jump to subroutine long
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7AD
; Address: $C5C695
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7AD:
    JSL $C2CC92          ; 22 92 CC C2 | Jump to subroutine long
    BPL $00              ; 10 00 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7B0
; Address: $C5C6A7
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7B0:
    JSL $C2CC92          ; 22 92 CC C2 | Jump to subroutine long
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7B1
; Address: $C5C6B0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7B1:
    JSL $C2CC92          ; 22 92 CC C2 | Jump to subroutine long
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7B2
; Address: $C5C6B9
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7B2:
    ADC ($C6),Y          ; 71 C6 | Add with carry ((zero page),Y)
    PLY                  ; 7A | Pull Y register from stack
    DEC $83              ; C6 83 | Decrement (zero page)
    DEC $8C              ; C6 8C | Decrement (zero page)
    DEC $95              ; C6 95 | Decrement (zero page)
    DEC $9E              ; C6 9E | Decrement (zero page)
    DEC $A7              ; C6 A7 | Decrement (zero page)
    DEC $B0              ; C6 B0 | Decrement (zero page)
    DEC $A9              ; C6 A9 | Decrement (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7B3
; Address: $C5C6CD
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7B3:
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7B4
; Address: $C5C6D8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7B4:
    JSR $C6E0            ; 20 E0 C6 | Jump to subroutine
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7B9
; Address: $C5C6F1
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7B9:
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7BA
; Address: $C5C6FD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7BA:
    JSR $C6E0            ; 20 E0 C6 | Jump to subroutine
    STA $6A              ; 85 6A | Store accumulator to zero page
    LDX #$6A             ; A2 6A | Load immediate value into X register
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7BB
; Address: $C5C706
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7BB:
    JSL $C01146          ; 22 46 11 C0 | Jump to subroutine long
    LDA $6B              ; A5 6B | Load from zero page into accumulator
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7BC
; Address: $C5C711
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7BC:
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

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7BD
; Address: $C5C71E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7BD:
    JSL $C012D1          ; 22 D1 12 C0 | Jump to subroutine long
    INC                  ; 1A | Increment accumulator
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7BE
; Address: $C5C724
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7BE:
    JSR $C6E0            ; 20 E0 C6 | Jump to subroutine
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))
    BCC $07              ; 90 07 | Branch if carry clear
    PHP                  ; 08 | Push processor status to stack
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    PLA                  ; 68 | Pull accumulator from stack
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7C0
; Address: $C5C73C
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7C0:
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    STA $2434            ; 8D 34 24 | Store accumulator to absolute address
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    STA $2436            ; 8D 36 24 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7C1
; Address: $C5C751
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7C1:
    JSR $C7FB            ; 20 FB C7 | Jump to subroutine
    LDA $2438            ; AD 38 24 | Load from absolute address into accumulator
    STA $00              ; 85 00 | Store accumulator to zero page
    LDA $243A            ; AD 3A 24 | Load from absolute address into accumulator
    STA $02              ; 85 02 | Store accumulator to zero page
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7C2
; Address: $C5C766
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7C2:
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDA $00              ; A5 00 | Load from zero page into accumulator
    STA $2434            ; 8D 34 24 | Store accumulator to absolute address
    LDA $02              ; A5 02 | Load from zero page into accumulator
    STA $2436            ; 8D 36 24 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7C3
; Address: $C5C77C
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7C3:
    JSR $C7FB            ; 20 FB C7 | Jump to subroutine
    LDA $2438            ; AD 38 24 | Load from absolute address into accumulator
    STA $00              ; 85 00 | Store accumulator to zero page
    LDA $243A            ; AD 3A 24 | Load from absolute address into accumulator
    STA $02              ; 85 02 | Store accumulator to zero page
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7C5
; Address: $C5C794
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7C5:
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDA $00              ; A5 00 | Load from zero page into accumulator
    EOR #$FF             ; 49 FF | Exclusive OR with accumulator (immediate)
    STA $2434            ; 8D 34 24 | Store accumulator to absolute address
    LDA $02              ; A5 02 | Load from zero page into accumulator
    EOR #$FF             ; 49 FF | Exclusive OR with accumulator (immediate)
    STA $2436            ; 8D 36 24 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7C6
; Address: $C5C7AD
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7C6:
    JSR $C7FB            ; 20 FB C7 | Jump to subroutine
    LDA $00              ; A5 00 | Load from zero page into accumulator
    ORA $2438            ; 0D 38 24 | Logical OR with accumulator (absolute)
    STA $00              ; 85 00 | Store accumulator to zero page
    LDA $02              ; A5 02 | Load from zero page into accumulator
    ORA $243A            ; 0D 3A 24 | Logical OR with accumulator (absolute)
    STA $02              ; 85 02 | Store accumulator to zero page
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7C7
; Address: $C5C7C6
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7C7:
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDA $00              ; A5 00 | Load from zero page into accumulator
    STA $2434            ; 8D 34 24 | Store accumulator to absolute address
    LDA $02              ; A5 02 | Load from zero page into accumulator
    STA $2436            ; 8D 36 24 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7C8
; Address: $C5C7DC
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7C8:
    JSR $C7FB            ; 20 FB C7 | Jump to subroutine
    LDA $2438            ; AD 38 24 | Load from absolute address into accumulator
    EOR #$FF             ; 49 FF | Exclusive OR with accumulator (immediate)
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    STA $00              ; 85 00 | Store accumulator to zero page
    LDA $243A            ; AD 3A 24 | Load from absolute address into accumulator
    EOR #$FF             ; 49 FF | Exclusive OR with accumulator (immediate)
    AND $02              ; 25 02 | Logical AND with accumulator (zero page)
    STA $02              ; 85 02 | Store accumulator to zero page
    PLB                  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7C9
; Address: $C5C7F4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7C9:
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7CA
; Address: $C5C7FD
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7CA:
    INC                  ; 1A | Increment accumulator
    SEP #$20             ; E2 20 | Set processor status bits
    ORA $AB48            ; 0D 48 AB | Logical OR with accumulator (absolute)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    REP #$20             ; C2 20 | Reset processor status bits
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDA $2428            ; AD 28 24 | Load from absolute address into accumulator
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    LDX #$25             ; A2 25 | Load immediate value into X register
    LDA #$17             ; A9 17 | Load immediate value into accumulator
    STA $2428            ; 8D 28 24 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7CB
; Address: $C5C824
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7CB:
    JSL $C010B4          ; 22 B4 10 C0 | Jump to subroutine long
    TAY                  ; A8 | Transfer accumulator to Y register
    PLX                  ; FA | Pull X register from stack
    STZ $2438            ; 9C 38 24 | Store zero to absolute
    STZ $243A            ; 9C 3A 24 | Store zero to absolute
    LDA $2435            ; AD 35 24 | Load from absolute address into accumulator
    STA $2436            ; 8D 36 24 | Store accumulator to absolute address
    LDA $2433            ; AD 33 24 | Load from absolute address into accumulator
    STA $2434            ; 8D 34 24 | Store accumulator to absolute address
    ASL $2434            ; 0E 34 24 | Arithmetic shift left (absolute)
    ROL $2436            ; 2E 36 24 | Rotate left (absolute)
    BCC $0C              ; 90 0C | Branch if carry clear
    LDA $2050,Y          ; B9 50 20 | Load from absolute,Y into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    BEQ $03              ; F0 03 | Branch if equal
    ROR $C8              ; 66 C8 | Rotate right (zero page)
    ROL $2438            ; 2E 38 24 | Rotate left (absolute)
    ROL $243A            ; 2E 3A 24 | Rotate left (absolute)
    TYA                  ; 98 | Transfer Y register to accumulator
    SEC                  ; 38 | Set carry flag
    SBC #$25             ; E9 25 | Subtract with carry (immediate)
    TAY                  ; A8 | Transfer accumulator to Y register
    DEC $2428            ; CE 28 24 | Decrement (absolute)
    BPL $DB              ; 10 DB | Branch if positive
    PLA                  ; 68 | Pull accumulator from stack
    STA $2428            ; 8D 28 24 | Store accumulator to absolute address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7CC
; Address: $C5C866
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7CC:
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    XBA                  ; EB | Exchange accumulator bytes
    CMP #$E1             ; C9 E1 | Compare accumulator (immediate)
    INY                  ; C8 | Increment Y register
    BEQ $C8              ; F0 C8 | Branch if equal
    PLX                  ; FA | Pull X register from stack
    INY                  ; C8 | Increment Y register
    ORA $C9              ; 05 C9 | Logical OR with accumulator (zero page)
    BPL $C9              ; 10 C9 | Branch if positive
    SBC ($C9),Y          ; F1 C9 | Subtract with carry ((zero page),Y)
    CMP #$26             ; C9 26 | Compare accumulator (immediate)
    CMP #$2C             ; C9 2C | Compare accumulator (immediate)
    CMP #$32             ; C9 32 | Compare accumulator (immediate)
    CMP #$3D             ; C9 3D | Compare accumulator (immediate)
    CMP #$47             ; C9 47 | Compare accumulator (immediate)
    CMP #$4F             ; C9 4F | Compare accumulator (immediate)
    CMP #$F9             ; C9 F9 | Compare accumulator (immediate)
    CMP #$5A             ; C9 5A | Compare accumulator (immediate)
    CMP #$65             ; C9 65 | Compare accumulator (immediate)
    CMP #$75             ; C9 75 | Compare accumulator (immediate)
    CMP #$7B             ; C9 7B | Compare accumulator (immediate)
    CMP #$81             ; C9 81 | Compare accumulator (immediate)
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    LDX $C9              ; A6 C9 | Load from zero page into X register
    LDA ($C9),Y          ; B1 C9 | Load from (zero page),Y into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    DEC $C9              ; C6 C9 | Decrement (zero page)
    INY                  ; C8 | Increment Y register
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    CMP #$22             ; C9 22 | Compare accumulator (immediate)
    TXA                  ; 8A | Transfer X register to accumulator
    LDX $1CC2,Y          ; BE C2 1C | Load from absolute,Y into X register
    BCS $02              ; B0 02 | Branch if carry set
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7CE
; Address: $C5C8D3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7CE:
    LDA $203C,Y          ; B9 3C 20 | Load from absolute,Y into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    BEQ $02              ; F0 02 | Branch if equal
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7D0
; Address: $C5C8E1
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7D0:
    LDA $203C,Y          ; B9 3C 20 | Load from absolute,Y into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BCS $02              ; B0 02 | Branch if carry set

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7D3
; Address: $C5C8F0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7D3:
    LDA $203C,Y          ; B9 3C 20 | Load from absolute,Y into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7D4
; Address: $C5C8FA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7D4:
    LDA $2051,Y          ; B9 51 20 | Load from absolute,Y into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    BEQ $01              ; F0 01 | Branch if equal
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7D5
; Address: $C5C905
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7D5:
    LDA $2051,Y          ; B9 51 20 | Load from absolute,Y into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    BEQ $01              ; F0 01 | Branch if equal
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7D6
; Address: $C5C910
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7D6:
    LDA $2051,Y          ; B9 51 20 | Load from absolute,Y into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    BEQ $01              ; F0 01 | Branch if equal
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7D7
; Address: $C5C91B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7D7:
    LDA $2051,Y          ; B9 51 20 | Load from absolute,Y into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    BEQ $01              ; F0 01 | Branch if equal
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7D8
; Address: $C5C926
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7D8:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    PLP                  ; 28 | Pull processor status from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7DB
; Address: $C5C934
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7DB:
    JSR $FF29            ; 20 29 FF | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    BEQ $01              ; F0 01 | Branch if equal
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7DC
; Address: $C5C93D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7DC:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    BEQ $01              ; F0 01 | Branch if equal
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7DE
; Address: $C5C94B
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7DE:
    BEQ $01              ; F0 01 | Branch if equal
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7DF
; Address: $C5C94F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7DF:
    LDA $2052,Y          ; B9 52 20 | Load from absolute,Y into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    BEQ $01              ; F0 01 | Branch if equal
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7E0
; Address: $C5C95A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7E0:
    LDA $2051,Y          ; B9 51 20 | Load from absolute,Y into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    BEQ $01              ; F0 01 | Branch if equal
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7E1
; Address: $C5C965
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7E1:
    JSL $C2C240          ; 22 40 C2 C2 | Jump to subroutine long
    LSR                  ; 4A | Logical shift right (accumulator)
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7E2
; Address: $C5C96C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7E2:
    JSL $C2BE8A          ; 22 8A BE C2 | Jump to subroutine long
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7E7
; Address: $C5C98A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7E7:
    JSL $C2C240          ; 22 40 C2 C2 | Jump to subroutine long
    STA $00              ; 85 00 | Store accumulator to zero page
    LDA #$03             ; A9 03 | Load immediate value into accumulator
    PHX                  ; DA | Push X register to stack
    LDX #$00             ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7E8
; Address: $C5C998
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7E8:
    JSL $C0121C          ; 22 1C 12 C0 | Jump to subroutine long
    PLX                  ; FA | Pull X register from stack
    LDA $00              ; A5 00 | Load from zero page into accumulator
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack
    STA $00              ; 85 00 | Store accumulator to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7E9
; Address: $C5C9A6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7E9:
    LDA $2041,Y          ; B9 41 20 | Load from absolute,Y into accumulator
    BCS $02              ; B0 02 | Branch if carry set
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7EB
; Address: $C5C9B1
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7EB:
    LDA $2049,Y          ; B9 49 20 | Load from absolute,Y into accumulator
    CLC                  ; 18 | Clear carry flag
    BNE $01              ; D0 01 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7ED
; Address: $C5C9BB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7ED:
    LDA $2050,Y          ; B9 50 20 | Load from absolute,Y into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    BNE $01              ; D0 01 | Branch if not equal
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7EF
; Address: $C5C9C8
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7EF:
    LDA $203C,Y          ; B9 3C 20 | Load from absolute,Y into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BCS $0C              ; B0 0C | Branch if carry set
    LDA $2049,Y          ; B9 49 20 | Load from absolute,Y into accumulator
    PHX                  ; DA | Push X register to stack
    TAX                  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7F0
; Address: $C5C9D8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7F0:
    JSL $C47EA2          ; 22 A2 7E C4 | Jump to subroutine long
    PLX                  ; FA | Pull X register from stack
    BCS $02              ; B0 02 | Branch if carry set
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7F4
; Address: $C5C9F3
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7F4:
    JSR $F018            ; 20 18 F0 | Jump to subroutine
    ORA ($38,X)          ; 01 38 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7F5
; Address: $C5C9F9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7F5:
    LDA $2052,Y          ; B9 52 20 | Load from absolute,Y into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    BEQ $01              ; F0 01 | Branch if equal
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7F6
; Address: $C5CA04
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7F6:
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    PHX                  ; DA | Push X register to stack
    STZ $00              ; 64 00 | Store zero to zero page
    STZ $02              ; 64 02 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7F7
; Address: $C5CA12
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7F7:
    JSR $CA1B            ; 20 1B CA | Jump to subroutine
    PLX                  ; FA | Pull X register from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7F9
; Address: $C5CA1B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7F9:
    LDX #$00             ; A2 00 | Load immediate value into X register
    CMP #$10             ; C9 10 | Compare accumulator (immediate)
    BCC $06              ; 90 06 | Branch if carry clear
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    SEC                  ; 38 | Set carry flag
    SBC #$10             ; E9 10 | Subtract with carry (immediate)

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7FB
; Address: $C5CA2E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7FB:
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    PHX                  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7FC
; Address: $C5CA38
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7FC:
    JSR $CA1B            ; 20 1B CA | Jump to subroutine
    EOR #$FF             ; 49 FF | Exclusive OR with accumulator (immediate)
    PLX                  ; FA | Pull X register from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7FD
; Address: $C5CA46
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7FD:
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    PHX                  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7FE
; Address: $C5CA50
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7FE:
    JSR $CA1B            ; 20 1B CA | Jump to subroutine
    PLX                  ; FA | Pull X register from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_7FF
; Address: $C5CA5B
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_7FF:
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $05              ; 80 05 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    TYA                  ; 98 | Transfer Y register to accumulator
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    CMP #$18             ; C9 18 | Compare accumulator (immediate)
    BCS $FE              ; B0 FE | Branch if carry set
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_800
; Address: $C5CA70
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_800:
    LDA                  ; BF D3 CB C2 | Load from absolute long,X into accumulator
    TAX                  ; AA | Transfer accumulator to X register
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDY #$01             ; A0 01 | Load immediate value into Y register
    STA $60              ; 85 60 | Store accumulator to zero page
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    LDA #$7E             ; A9 7E | Load immediate value into accumulator
    STA $62              ; 85 62 | Store accumulator to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_801
; Address: $C5CA8F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_801:
    STA $64              ; 85 64 | Store accumulator to zero page
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    PHA                  ; 48 | Push accumulator to stack
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_802
; Address: $C5CA98
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_802:
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    STA $64              ; 85 64 | Store accumulator to zero page
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $07              ; 80 07 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    STA $64              ; 85 64 | Store accumulator to zero page
    TYA                  ; 98 | Transfer Y register to accumulator
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    CMP #$18             ; C9 18 | Compare accumulator (immediate)
    BCS $FE              ; B0 FE | Branch if carry set
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF D3 CB C2 | Load from absolute long,X into accumulator
    TAX                  ; AA | Transfer accumulator to X register
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDY #$01             ; A0 01 | Load immediate value into Y register
    STA $60              ; 85 60 | Store accumulator to zero page
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    LDA #$7E             ; A9 7E | Load immediate value into accumulator
    STA $62              ; 85 62 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_804
; Address: $C5CAD2
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_804:
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    PHA                  ; 48 | Push accumulator to stack
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_805
; Address: $C5CAD9
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_805:
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $05              ; 80 05 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    TYA                  ; 98 | Transfer Y register to accumulator
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    CMP #$18             ; C9 18 | Compare accumulator (immediate)
    BCS $FE              ; B0 FE | Branch if carry set
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF D3 CB C2 | Load from absolute long,X into accumulator
    TAX                  ; AA | Transfer accumulator to X register
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDY #$01             ; A0 01 | Load immediate value into Y register
    STA $60              ; 85 60 | Store accumulator to zero page
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    STA $66              ; 85 66 | Store accumulator to zero page
    STA $68              ; 85 68 | Store accumulator to zero page
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    LDA #$7E             ; A9 7E | Load immediate value into accumulator
    STA $62              ; 85 62 | Store accumulator to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_806
; Address: $C5CB17
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_806:
    AND $66              ; 25 66 | Logical AND with accumulator (zero page)
    LSR $68              ; 46 68 | Logical shift right (zero page)
    BCS $05              ; B0 05 | Branch if carry set
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR $68              ; 46 68 | Logical shift right (zero page)
    BCC $FB              ; 90 FB | Branch if carry clear
    STA $64              ; 85 64 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_807
; Address: $C5CB24
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_807:
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    PHA                  ; 48 | Push accumulator to stack
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_808
; Address: $C5CB2B
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_808:
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $B3              ; 80 B3 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    TYA                  ; 98 | Transfer Y register to accumulator
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    CMP #$18             ; C9 18 | Compare accumulator (immediate)
    BCS $FE              ; B0 FE | Branch if carry set
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF D3 CB C2 | Load from absolute long,X into accumulator
    TAX                  ; AA | Transfer accumulator to X register
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDY #$01             ; A0 01 | Load immediate value into Y register
    STA $60              ; 85 60 | Store accumulator to zero page
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    STA $66              ; 85 66 | Store accumulator to zero page
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    LDA #$7E             ; A9 7E | Load immediate value into accumulator
    STA $62              ; 85 62 | Store accumulator to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_809
; Address: $C5CB67
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_809:
    AND $66              ; 25 66 | Logical AND with accumulator (zero page)
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    PHA                  ; 48 | Push accumulator to stack
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_80B
; Address: $C5CB72
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_80B:
    REP #$30             ; C2 30 | Reset processor status bits
    STA $64              ; 85 64 | Store accumulator to zero page
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $07              ; 80 07 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    STA $64              ; 85 64 | Store accumulator to zero page
    TYA                  ; 98 | Transfer Y register to accumulator
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    CMP #$18             ; C9 18 | Compare accumulator (immediate)
    BCS $FE              ; B0 FE | Branch if carry set
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF D3 CB C2 | Load from absolute long,X into accumulator
    TAX                  ; AA | Transfer accumulator to X register
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDY #$01             ; A0 01 | Load immediate value into Y register
    STA $60              ; 85 60 | Store accumulator to zero page
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    STA $66              ; 85 66 | Store accumulator to zero page
    STA $68              ; 85 68 | Store accumulator to zero page
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    LDA #$7E             ; A9 7E | Load immediate value into accumulator
    STA $62              ; 85 62 | Store accumulator to zero page
    LDA $64              ; A5 64 | Load from zero page into accumulator
    LSR $68              ; 46 68 | Logical shift right (zero page)
    BCS $05              ; B0 05 | Branch if carry set
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LSR $68              ; 46 68 | Logical shift right (zero page)
    BCC $FB              ; 90 FB | Branch if carry clear
    AND $66              ; 25 66 | Logical AND with accumulator (zero page)
    STA $68              ; 85 68 | Store accumulator to zero page
    LDA $66              ; A5 66 | Load from zero page into accumulator
    EOR #$FF             ; 49 FF | Exclusive OR with accumulator (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_80D
; Address: $C5CBCA
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_80D:
    LDA $64              ; A5 64 | Load from zero page into accumulator
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLB                  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_80E
; Address: $C5CBCF
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_80E:
    PLP                  ; 28 | Pull processor status from stack
    PHA                  ; 48 | Push accumulator to stack
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_80F
; Address: $C5CBD5
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_80F:
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    LDA $DE00,Y          ; B9 00 DE | Load from absolute,Y into accumulator
    ORA ($28,X)          ; 01 28 | Logical OR with accumulator ((zero page,X))
    ORA ($4D,X)          ; 01 4D | Logical OR with accumulator ((zero page,X))
    ORA ($72,X)          ; 01 72 | Logical OR with accumulator ((zero page,X))
    ORA ($97,X)          ; 01 97 | Logical OR with accumulator ((zero page,X))
    ORA ($BC,X)          ; 01 BC | Logical OR with accumulator ((zero page,X))
    ORA ($E1,X)          ; 01 E1 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    BVC $02              ; 50 02 | Branch if overflow clear
    TXS                  ; 9A | Transfer X register to stack pointer
    LDA                  ; BF 02 E4 02 | Load from absolute long,X into accumulator
    ORA #$03             ; 09 03 | Logical OR with accumulator (immediate)
    ROL $5303            ; 2E 03 53 | Rotate left (absolute)
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $05              ; 80 05 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    TYA                  ; 98 | Transfer Y register to accumulator
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    CMP #$12             ; C9 12 | Compare accumulator (immediate)
    ORA ($B0,X)          ; 01 B0 | Logical OR with accumulator ((zero page,X))
    INC $AA0A,X          ; FE 0A AA | Increment (absolute,X)
    LDA                  ; BF 6A 37 C2 | Load from absolute long,X into accumulator
    TAX                  ; AA | Transfer accumulator to X register
    LDA #$C2             ; A9 C2 | Load immediate value into accumulator
    STA $62              ; 85 62 | Store accumulator to zero page
    JMP $CD35            ; 4C 35 CD | Jump to address
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $05              ; 80 05 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    TYA                  ; 98 | Transfer Y register to accumulator
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    CMP #$12             ; C9 12 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_810
; Address: $C5CC35
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_810:
    ORA ($B0,X)          ; 01 B0 | Logical OR with accumulator ((zero page,X))
    INC $AA0A,X          ; FE 0A AA | Increment (absolute,X)
    LDA                  ; BF 6A 37 C2 | Load from absolute long,X into accumulator
    TAX                  ; AA | Transfer accumulator to X register
    LDA #$C2             ; A9 C2 | Load immediate value into accumulator
    STA $62              ; 85 62 | Store accumulator to zero page
    JMP $CD53            ; 4C 53 CD | Jump to address
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $05              ; 80 05 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    TYA                  ; 98 | Transfer Y register to accumulator
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    CMP #$12             ; C9 12 | Compare accumulator (immediate)
    ORA ($B0,X)          ; 01 B0 | Logical OR with accumulator ((zero page,X))
    INC $AA0A,X          ; FE 0A AA | Increment (absolute,X)
    LDA                  ; BF 6A 37 C2 | Load from absolute long,X into accumulator
    TAX                  ; AA | Transfer accumulator to X register
    LDA #$C2             ; A9 C2 | Load immediate value into accumulator
    STA $62              ; 85 62 | Store accumulator to zero page
    JMP $CD86            ; 4C 86 CD | Jump to address
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $05              ; 80 05 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    TYA                  ; 98 | Transfer Y register to accumulator
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    CMP #$A0             ; C9 A0 | Compare accumulator (immediate)
    BCS $FE              ; B0 FE | Branch if carry set
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF 20 17 C2 | Load from absolute long,X into accumulator
    TAX                  ; AA | Transfer accumulator to X register
    LDA #$C2             ; A9 C2 | Load immediate value into accumulator
    STA $62              ; 85 62 | Store accumulator to zero page
    JMP $CD35            ; 4C 35 CD | Jump to address
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    TXA                  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_811
; Address: $C5CC90
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_811:
    BRA $05              ; 80 05 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    TYA                  ; 98 | Transfer Y register to accumulator
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    CMP #$A0             ; C9 A0 | Compare accumulator (immediate)
    BCS $FE              ; B0 FE | Branch if carry set
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF 20 17 C2 | Load from absolute long,X into accumulator
    TAX                  ; AA | Transfer accumulator to X register
    LDA #$C2             ; A9 C2 | Load immediate value into accumulator
    STA $62              ; 85 62 | Store accumulator to zero page
    JMP $CD53            ; 4C 53 CD | Jump to address
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $05              ; 80 05 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    TYA                  ; 98 | Transfer Y register to accumulator
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    CMP #$A0             ; C9 A0 | Compare accumulator (immediate)
    BCS $FE              ; B0 FE | Branch if carry set
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF 20 17 C2 | Load from absolute long,X into accumulator
    TAX                  ; AA | Transfer accumulator to X register
    LDA #$C2             ; A9 C2 | Load immediate value into accumulator
    STA $62              ; 85 62 | Store accumulator to zero page
    JMP $CD86            ; 4C 86 CD | Jump to address
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $05              ; 80 05 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    TYA                  ; 98 | Transfer Y register to accumulator
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    CMP #$32             ; C9 32 | Compare accumulator (immediate)
    BCS $FE              ; B0 FE | Branch if carry set
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_812
; Address: $C5CCE3
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_812:
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF 3E 3C C2 | Load from absolute long,X into accumulator
    TAX                  ; AA | Transfer accumulator to X register
    LDA #$C2             ; A9 C2 | Load immediate value into accumulator
    STA $62              ; 85 62 | Store accumulator to zero page
    JMP $CD35            ; 4C 35 CD | Jump to address
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $05              ; 80 05 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    TYA                  ; 98 | Transfer Y register to accumulator
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    CMP #$32             ; C9 32 | Compare accumulator (immediate)
    BCS $FE              ; B0 FE | Branch if carry set
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF 3E 3C C2 | Load from absolute long,X into accumulator
    TAX                  ; AA | Transfer accumulator to X register
    LDA #$C2             ; A9 C2 | Load immediate value into accumulator
    STA $62              ; 85 62 | Store accumulator to zero page
    JMP $CD53            ; 4C 53 CD | Jump to address
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $05              ; 80 05 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    TYA                  ; 98 | Transfer Y register to accumulator
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    CMP #$32             ; C9 32 | Compare accumulator (immediate)
    BCS $FE              ; B0 FE | Branch if carry set
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF 3E 3C C2 | Load from absolute long,X into accumulator
    TAX                  ; AA | Transfer accumulator to X register
    LDA #$C2             ; A9 C2 | Load immediate value into accumulator
    STA $62              ; 85 62 | Store accumulator to zero page
    JMP $CD86            ; 4C 86 CD | Jump to address
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_813
; Address: $C5CD3A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_813:
    LDY #$01             ; A0 01 | Load immediate value into Y register
    STA $60              ; 85 60 | Store accumulator to zero page
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_814
; Address: $C5CD4A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_814:
    STA $64              ; 85 64 | Store accumulator to zero page
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    PHA                  ; 48 | Push accumulator to stack
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_815
; Address: $C5CD54
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_815:
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDY #$01             ; A0 01 | Load immediate value into Y register
    STA $60              ; 85 60 | Store accumulator to zero page
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    STA $66              ; 85 66 | Store accumulator to zero page
    STA $68              ; 85 68 | Store accumulator to zero page
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_816
; Address: $C5CD72
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_816:
    AND $66              ; 25 66 | Logical AND with accumulator (zero page)
    LSR $68              ; 46 68 | Logical shift right (zero page)
    BCS $05              ; B0 05 | Branch if carry set
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR $68              ; 46 68 | Logical shift right (zero page)
    BCC $FB              ; 90 FB | Branch if carry clear
    STA $64              ; 85 64 | Store accumulator to zero page
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    PHA                  ; 48 | Push accumulator to stack
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_817
; Address: $C5CD87
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_817:
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDY #$01             ; A0 01 | Load immediate value into Y register
    STA $60              ; 85 60 | Store accumulator to zero page
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_818
; Address: $C5CD96
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_818:
    STA $66              ; 85 66 | Store accumulator to zero page
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_819
; Address: $C5CDA3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_819:
    AND $66              ; 25 66 | Logical AND with accumulator (zero page)
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    PHA                  ; 48 | Push accumulator to stack
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_81A
; Address: $C5CDAC
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_81A:
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDX $23E4            ; AE E4 23 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_81C
; Address: $C5CDC0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_81C:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BCS $26              ; B0 26 | Branch if carry set

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_81D
; Address: $C5CDC8
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_81D:
    JSL $C2CAD9          ; 22 D9 CA C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BNE $1C              ; D0 1C | Branch if not equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_81E
; Address: $C5CDD2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_81E:
    JSL $C2CA5B          ; 22 5B CA C2 | Jump to subroutine long
    EOR #$20             ; 49 20 | Exclusive OR with accumulator (immediate)
    STA $2420            ; 8D 20 24 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_822
; Address: $C5CDEB
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_822:
    JSR $CDF6            ; 20 F6 CD | Jump to subroutine
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_825
; Address: $C5CDFA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_825:
    JSL $C2CC25          ; 22 25 CC C2 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    TAY                  ; A8 | Transfer accumulator to Y register
    STZ $424D            ; 9C 4D 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_826
; Address: $C5CE06
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_826:
    JSL $C2CC25          ; 22 25 CC C2 | Jump to subroutine long
    ADC $18              ; 65 18 | Add with carry (zero page)
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    INC $424D            ; EE 4D 42 | Hardware register operation
    LDX $2456            ; AE 56 24 | Load from absolute address into X register
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_828
; Address: $C5CE1F
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_828:
    LDA $23F0            ; AD F0 23 | Load from absolute address into accumulator
    CMP #$09             ; C9 09 | Compare accumulator (immediate)
    BCS $0E              ; B0 0E | Branch if carry set
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDY $2420            ; AC 20 24 | Load from absolute address into Y register
    DEC $0FC9            ; CE C9 0F | Decrement (absolute)
    CLC                  ; 18 | Clear carry flag
    BNE $01              ; D0 01 | Branch if not equal
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_829
; Address: $C5CE37
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_829:
    EOR #$CE             ; 49 CE | Exclusive OR with accumulator (immediate)
    DEC $CE5B            ; CE 5B CE | Decrement (absolute)
    STZ $CE              ; 64 CE | Store zero to zero page
    ADC $76CE            ; 6D CE 76 | Add with carry (absolute)
    DEC $CE7F            ; CE 7F CE | Decrement (absolute)
    DEY                  ; 88 | Decrement Y register
    DEC $CE91            ; CE 91 CE | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_82A
; Address: $C5CE49
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_82A:
    JSL $C2CC92          ; 22 92 CC C2 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_82B
; Address: $C5CE52
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_82B:
    JSL $C2CC92          ; 22 92 CC C2 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    BEQ $00              ; F0 00 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_82C
; Address: $C5CE5B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_82C:
    JSL $C2CC92          ; 22 92 CC C2 | Jump to subroutine long
    ORA $0F00,Y          ; 19 00 0F | Logical OR with accumulator (absolute,Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_82D
; Address: $C5CE64
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_82D:
    JSL $C2CC92          ; 22 92 CC C2 | Jump to subroutine long
    ORA $F000,Y          ; 19 00 F0 | Logical OR with accumulator (absolute,Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_82E
; Address: $C5CE6D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_82E:
    JSL $C2CC92          ; 22 92 CC C2 | Jump to subroutine long
    INC                  ; 1A | Increment accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_832
; Address: $C5CE88
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_832:
    JSL $C2CC92          ; 22 92 CC C2 | Jump to subroutine long
    BEQ $00              ; F0 00 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_834
; Address: $C5CE9A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_834:
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDX $23EE            ; AE EE 23 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_835
; Address: $C5CEA9
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_835:
    JSL $C2CC25          ; 22 25 CC C2 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_836
; Address: $C5CEB3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_836:
    JSR $CEBE            ; 20 BE CE | Jump to subroutine
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_838
; Address: $C5CEC1
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_838:
    JSL $C2CC03          ; 22 03 CC C2 | Jump to subroutine long
    JMP ($8D18)          ; 6C 18 8D | Jump to address (absolute indirect)
    JMP $204F            ; 4C 4F 20 | Jump to address
    EOR $20CF,Y          ; 59 CF 20 | Exclusive OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_83A
; Address: $C5CED4
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_83A:
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDA $2428            ; AD 28 24 | Load from absolute address into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDX $23EE            ; AE EE 23 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_83D
; Address: $C5CEF1
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_83D:
    JSR $CEBE            ; 20 BE CE | Jump to subroutine
    PLA                  ; 68 | Pull accumulator from stack
    STA $2428            ; 8D 28 24 | Store accumulator to absolute address
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_83E
; Address: $C5CF00
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_83E:
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDA $2428            ; AD 28 24 | Load from absolute address into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDX $23EE            ; AE EE 23 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_83F
; Address: $C5CF13
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_83F:
    JSL $C2CC03          ; 22 03 CC C2 | Jump to subroutine long
    ROR $8D18            ; 6E 18 8D | Rotate right (absolute)
    JMP $204F            ; 4C 4F 20 | Jump to address
    STX $20CF            ; 8E CF 20 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_840
; Address: $C5CF22
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_840:
    JSR $CF31            ; 20 31 CF | Jump to subroutine
    PLA                  ; 68 | Pull accumulator from stack
    STA $2428            ; 8D 28 24 | Store accumulator to absolute address
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_844
; Address: $C5CF41
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_844:
    JSL $C2CAD9          ; 22 D9 CA C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    BEQ $0D              ; F0 0D | Branch if equal
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_848
; Address: $C5CF5C
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_848:
    JSL $C2CC25          ; 22 25 CC C2 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    BNE $0C              ; D0 0C | Branch if not equal
    LDA $23EA            ; AD EA 23 | Load from absolute address into accumulator
    STA $00              ; 85 00 | Store accumulator to zero page
    LDA $23EC            ; AD EC 23 | Load from absolute address into accumulator
    STA $02              ; 85 02 | Store accumulator to zero page
    BRA $05              ; 80 05 | Branch always

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_849
; Address: $C5CF72
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_849:
    JSL $C2C739          ; 22 39 C7 C2 | Jump to subroutine long
    ASL $A2              ; 06 A2 | Arithmetic shift left (zero page)
    STZ $4F4E            ; 9C 4E 4F | Store zero to absolute
    LSR $02              ; 46 02 | Logical shift right (zero page)
    ROR $00              ; 66 00 | Rotate right (zero page)
    BCC $03              ; 90 03 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_84A
; Address: $C5CF84
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_84A:
    JSR $CF9B            ; 20 9B CF | Jump to subroutine
    INX                  ; E8 | Increment X register
    CPX #$18             ; E0 18 | Compare X register (immediate)
    BCC $F1              ; 90 F1 | Branch if carry clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_84B
; Address: $C5CF8E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_84B:
    LDX $23E8            ; AE E8 23 | Load from absolute address into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    STZ $4F4E            ; 9C 4E 4F | Store zero to absolute

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_84E
; Address: $C5CF9E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_84E:
    JSL $C2CB2B          ; 22 2B CB C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    BEQ $24              ; F0 24 | Branch if equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_851
; Address: $C5CFB4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_851:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BCS $11              ; B0 11 | Branch if carry set

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_853
; Address: $C5CFC1
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_853:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    STA $4F50,Y          ; 99 50 4F | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INC $4F4E            ; EE 4E 4F | Increment (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_855
; Address: $C5CFCE
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_855:
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_856
; Address: $C5CFD2
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_856:
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDA $2428            ; AD 28 24 | Load from absolute address into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDX $23EE            ; AE EE 23 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_857
; Address: $C5CFE1
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_857:
    JSL $C2CC03          ; 22 03 CC C2 | Jump to subroutine long
    BVS $18              ; 70 18 | Branch if overflow set
    STA $4F4C            ; 8D 4C 4F | Store accumulator to absolute address
    PEA #$23AD           ; F4 AD 23 | Push effective address to stack
    PEA #$0040           ; F4 40 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_858
; Address: $C5CFF3
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_858:
    JSL $C9029E          ; 22 9E 02 C9 | Jump to subroutine long
    BEQ $06              ; F0 06 | Branch if equal
    LDA #$88             ; A9 88 | Load immediate value into accumulator
    TXA                  ; 8A | Transfer X register to accumulator
    STA $4F4C            ; 8D 4C 4F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_85B
; Address: $C5D005
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_85B:
    JSR $CF31            ; 20 31 CF | Jump to subroutine
    PLA                  ; 68 | Pull accumulator from stack
    STA $2428            ; 8D 28 24 | Store accumulator to absolute address
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_85C
; Address: $C5D014
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_85C:
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDA $2428            ; AD 28 24 | Load from absolute address into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDX $23E4            ; AE E4 23 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_85E
; Address: $C5D02C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_85E:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BCS $3B              ; B0 3B | Branch if carry set
    LDY $23E8            ; AC E8 23 | Load from absolute address into Y register
    STY $2428            ; 8C 28 24 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_85F
; Address: $C5D03A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_85F:
    JSL $C2CAE0          ; 22 E0 CA C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    BEQ $72              ; F0 72 | Branch if equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_862
; Address: $C5D050
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_862:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BCC $58              ; 90 58 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_864
; Address: $C5D05D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_864:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    STA $4F50            ; 8D 50 4F | Store accumulator to absolute address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $4F4E            ; 8D 4E 4F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_865
; Address: $C5D069
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_865:
    JSL $C4927F          ; 22 7F 92 C4 | Jump to subroutine long
    BRA $47              ; 80 47 | Branch always
    LDY $23E8            ; AC E8 23 | Load from absolute address into Y register
    STY $2428            ; 8C 28 24 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_866
; Address: $C5D075
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_866:
    JSL $C2CAE0          ; 22 E0 CA C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    BEQ $37              ; F0 37 | Branch if equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_869
; Address: $C5D08B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_869:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BCS $1D              ; B0 1D | Branch if carry set
    LDA #$1D             ; A9 1D | Load immediate value into accumulator
    STA $4F4C            ; 8D 4C 4F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_86B
; Address: $C5D09E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_86B:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    STA $4F50            ; 8D 50 4F | Store accumulator to absolute address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $4F4E            ; 8D 4E 4F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_86D
; Address: $C5D0B0
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_86D:
    JSL $C1E32E          ; 22 2E E3 C1 | Jump to subroutine long
    PLA                  ; 68 | Pull accumulator from stack
    STA $2428            ; 8D 28 24 | Store accumulator to absolute address
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_86F
; Address: $C5D0C5
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_86F:
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDX $23E4            ; AE E4 23 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_871
; Address: $C5D0D6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_871:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BCS $2B              ; B0 2B | Branch if carry set

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_872
; Address: $C5D0DE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_872:
    JSL $C2CAD9          ; 22 D9 CA C2 | Jump to subroutine long
    BVC $20              ; 50 20 | Branch if overflow clear
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BNE $21              ; D0 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_875
; Address: $C5D0F3
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_875:
    JSL $C2CA5B          ; 22 5B CA C2 | Jump to subroutine long
    EOR #$20             ; 49 20 | Exclusive OR with accumulator (immediate)
    STA $2420            ; 8D 20 24 | Store accumulator to absolute address
    CMP #$58             ; C9 58 | Compare accumulator (immediate)
    BEQ $05              ; F0 05 | Branch if equal

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_877
; Address: $C5D106
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_877:
    JSR $D111            ; 20 11 D1 | Jump to subroutine
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_879
; Address: $C5D117
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_879:
    JSL $C2CC2C          ; 22 2C CC C2 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0A_DmaFunction_87B
; Address: $C5D128
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0A_DmaFunction_87B:
    LDA #$8F             ; A9 8F | Load immediate value into accumulator
    PHB                  ; 8B | Push data bank register to stack
    STA $4F4C            ; 8D 4C 4F | Store accumulator to absolute address
    LDA $2456            ; AD 56 24 | Load from absolute address into accumulator
    STA $4F50            ; 8D 50 4F | Store accumulator to absolute address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $4F4E            ; 8D 4E 4F | Store accumulator to absolute address
