;==============================================================================
; Dragon Quest III - Graphics System (Bank $06)
; Comprehensive code extraction
;==============================================================================

.include "hardware.inc"

.segment "GRAPHICS_CODE"

Graphics_Function_000:
    AND $84              ; 21 84
    BVC $FFC4            ; 50 C0
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    EOR $62,X            ; 55 62
    BRK $AA              ; 00 AA
    BCS $0061            ; B0 52
    BRA $0031            ; 80 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    STZ $0060            ; 9C 60 00
    AND $BC              ; 21 BC
    BPL $FFAC            ; 10 90
    BPL $0098            ; 10 7A
    BRK $00              ; 00 00
    BRK $55              ; 00 55
    PER $4200            ; 62 00 42
    BCS $003A            ; B0 13
    BCC $0049            ; 90 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    CMP #$60             ; C9 60
    BRK $42              ; 00 42
    TAY                  ; A8
    ORA $90,X            ; 15 90
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    TSC                  ; 3B
    ADC $00              ; 61 00
    WDM $A8              ; 42 A8
    ORA $90              ; 13 90
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    LDA $0061,Y          ; B9 61 00
    LDA $B0              ; B2 B0
    ORA $90              ; 12 90
    RTS                  ; 60
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    TSB $0062            ; 0C 62 00
    ORA $FB              ; 01 FB
    EOR $80              ; 51 80
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    BIT $62,X            ; 34 62
    BRK $48              ; 00 48
    LDY $8046            ; AC 46 80
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    ROR                  ; 6A
    RTL                  ; 6B
    BRK $E8              ; 00 E8
    LDA $8045            ; AD 45 80
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    SBC $6B              ; F2 6B
    BRK $53              ; 00 53
    BCS $00C7            ; B0 4C
    BRA $009D            ; 80 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ROL $6E              ; 26 6E
    BRK $4C              ; 00 4C
    TYA                  ; 98
    ORA $90              ; 12 90
    RTS                  ; 60
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    LSR $0063,X          ; 5E 63 00
    EOR $13C8            ; 4D C8 13
    BCC $00B5            ; 90 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    PEA $00A6            ; F4 A6 00
    SBC $A1              ; E7 A1
    ORA $D0              ; 11 D0
    JSL $0000B0          ; 22 B0 00 00
    BRK $2B              ; 00 2B
    LDA $00              ; A7 00
    SEI                  ; 78
    ASL $54              ; 06 54
    BRA $00AE            ; 80 01
    ORA $00              ; 05 00
    BRK $00              ; 00 00
    STY $0062            ; 8C 62 00
    ADC $06              ; 73 06
    MVN $0180            ; 54 80 01
    ORA $00              ; 05 00
    BRK $00              ; 00 00
    STY $0062            ; 8C 62 00
    ROR $5406            ; 6E 06 54
    BRA $00C6            ; 80 01
    ORA $00              ; 05 00
    BRK $00              ; 00 00
    STY $0062            ; 8C 62 00
    ADC #$06             ; 69 06
    MVN $0180            ; 54 80 01
    ORA $00              ; 05 00
    BRK $00              ; 00 00
    STY $0062            ; 8C 62 00
    EOR $A4,X            ; 55 A4
    EOR $80              ; 51 80
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00

Graphics_Function_001:
    PHK                  ; 4B
    ADC $00              ; 63 00
    EOR $A4              ; 53 A4
    EOR $80              ; 51 80
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00

Graphics_Function_002:
    PHK                  ; 4B
    ADC $00              ; 63 00
    EOR $A4              ; 53 A4
    EOR $C0              ; 51 C0
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00

Graphics_Function_003:
    PHK                  ; 4B
    ADC $00              ; 63 00
    ORA $A6,X            ; 15 A6
    EOR $C0              ; 51 C0
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00

Graphics_Function_004:
    PHK                  ; 4B
    ADC $00              ; 63 00
    CLV                  ; B8
    TYA                  ; 98
    ORA $90              ; 12 90
    RTS                  ; 60
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    LSR $0063,X          ; 5E 63 00
    CLV                  ; B8
    STA $9012,Y          ; 99 12 90
    RTS                  ; 60
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    LSR $0063,X          ; 5E 63 00
    CLV                  ; B8
    STZ $9013            ; 9C 13 90
    RTS                  ; 60
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    STX $63              ; 86 63
    BRK $98              ; 00 98
    STA $9012,Y          ; 99 12 90
    RTS                  ; 60
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    LSR $0063,X          ; 5E 63 00
    EOR $901298          ; 4F 98 12 90
    RTS                  ; 60
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    LSR $0063,X          ; 5E 63 00
    LDA $99              ; A3 99
    ORA $90              ; 12 90
    RTS                  ; 60
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    LSR $0063,X          ; 5E 63 00
    LDX #$99             ; A2 99
    ORA $90              ; 12 90
    RTS                  ; 60
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    LSR $0063,X          ; 5E 63 00
    LDA $99              ; B1 99
    ORA $90              ; 12 90
    RTS                  ; 60
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    LSR $0063,X          ; 5E 63 00
    AND $99,X            ; 35 99
    ORA $90              ; 12 90
    RTS                  ; 60
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    LSR $0063,X          ; 5E 63 00
    EOR $1298            ; 4D 98 12
    BCC $01D9            ; 90 60
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    LSR $0063,X          ; 5E 63 00
    CLV                  ; B8
    TYA                  ; 98
    ORA $90              ; 12 90
    RTS                  ; 60
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    CMP $63              ; C7 63
    BRK $81              ; 00 81
    LDY #$12             ; A0 12
    BCC $0191            ; 90 00
    COP $22              ; 02 22
    BRK $00              ; 00 00
    SBC $490063          ; EF 63 00 49
    BCS $01E7            ; B0 4C
    STX $20,Y            ; 96 20
    BRK $92              ; 00 92
    BRK $00              ; 00 00
    JMP ($0064)          ; 6C 64 00
    EOR #$BC             ; 49 BC
    JMP $183899          ; 5C 99 38 18
    BRK $00              ; 00 00
    BRK $60              ; 00 60
    ADC $00              ; 65 00
    EOR $FA              ; 41 FA
    MVN $2040            ; 54 40 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    LDX #$65             ; A2 65
    BRK $85              ; 00 85
    STA $9357,Y          ; 99 57 93
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    DEC $0068            ; CE 68 00
    STA $99              ; 85 99
    EOR $93              ; 57 93
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    LSR $69              ; 46 69
    BRK $C5              ; 00 C5
    STA $9356,Y          ; 99 56 93
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    CMP $69              ; C5 69
    BRK $EA              ; 00 EA
    LDY #$12             ; A0 12
    STA $00              ; 92 00
    COP $7E              ; 02 7E
    AND #$00             ; 29 00
    LDA $520064          ; AF 64 00 52
    BCS $01FB            ; B0 0C
    STA $20              ; 91 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    TSB $9B              ; 04 9B
    BRK $22              ; 00 22
    TSB $54              ; 04 54
    CPY #$01             ; C0 01
    ORA $00              ; 05 00
    BRK $00              ; 00 00
    STY $0062            ; 8C 62 00
    JSL $C05304          ; 22 04 53 C0
    ORA $05              ; 01 05
    BRK $00              ; 00 00
    BRK $F9              ; 00 F9
    PER $4200            ; 62 00 42
    LDA $44              ; B2 44
    BCC $0235            ; 90 20
    BRK $2D              ; 00 2D
    BRK $00              ; 00 00
    LDA $65              ; A3 65
    BRK $4E              ; 00 4E

Graphics_Function_005:
    REP #$50             ; C2 50
    BCC $0221            ; 90 00
    COP $00              ; 02 00
    BRK $00              ; 00 00
    PLP                  ; 28
    ROR $00              ; 66 00
    LSR $50C2            ; 4E C2 50
    BCC $022D            ; 90 00
    COP $00              ; 02 00
    BRK $00              ; 00 00
    PLP                  ; 28
    ROR $00              ; 66 00
    CMP #$A6             ; C9 A6
    EOR $90              ; 52 90
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    JMP ($0066,X)        ; 7C 66 00
    LSR $10A2            ; 4E A2 10
    BCC $0245            ; 90 00
    COP $00              ; 02 00
    BRK $00              ; 00 00
    TAY                  ; A8
    ROR $00              ; 66 00
    LSR $A2,X            ; 56 A2
    BPL $01E0            ; 10 90
    BRK $02              ; 00 02
    BRK $00              ; 00 00
    BRK $A8              ; 00 A8
    ROR $00              ; 66 00
    STX $E2              ; 86 E2
    ORA $9A              ; 03 9A
    BIT $0000            ; 2C 00 00
    BRK $00              ; 00 00
    XBA                  ; EB
    ROR $00              ; 66 00
    WDM $D2              ; 42 D2
    MVP $3095            ; 44 95 30

Graphics_Function_006:
    PHP                  ; 08
    EOR $00              ; 52 00
    BRK $C9              ; 00 C9
    ADC $00              ; 67 00
    ASL $C9              ; 06 C9
    BPL $0204            ; 10 90
    BRK $02              ; 00 02
    BRK $00              ; 00 00
    BRK $B7              ; 00 B7
    TYA                  ; 98
    BRK $D2              ; 00 D2
    LDY #$13             ; A0 13
    BCC $0281            ; 90 00
    COP $00              ; 02 00
    BRK $00              ; 00 00
    TXA                  ; 8A
    ROR                  ; 6A
    BRK $C1              ; 00 C1
    STZ $9012            ; 9C 12 90
    BRK $02              ; 00 02
    AND $38              ; 37 38
    AND $6A2B,Y          ; 39 2B 6A
    BRK $48              ; 00 48
    LDY $8045            ; AC 45 80
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    SBC $A8006A,X        ; FF 6A 00 A8
    LDA $8045            ; AD 45 80
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    SBC $6B              ; F2 6B
    BRK $B3              ; 00 B3
    BCS $02F9            ; B0 4A
    BRA $02D1            ; 80 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ORA $6D              ; 07 6D
    BRK $A2              ; 00 A2
    BEQ $0312            ; F0 57
    BCC $02DD            ; 90 20
    BRK $3B              ; 00 3B
    BRK $00              ; 00 00
    ADC $4B006F,X        ; 7F 6F 00 4B
    TAY                  ; A8
    EOR $80              ; 51 80
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    CMP $0077            ; CD 77 00

Graphics_Function_007:
    REP #$F1             ; C2 F1
    LSR $93,X            ; 56 93
    JSR $3D00            ; 20 00 3D
    BRK $00              ; 00 00
    STA $006F,X          ; 9D 6F 00
    ADC $C9              ; 67 C9
    EOR $80              ; 51 80
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    CMP $0077            ; CD 77 00
    STX $D1              ; 86 D1
    ORA $92              ; 13 92
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    LDA $9D              ; A5 9D
    BRK $65              ; 00 65
    CMP $9216,X          ; DD 16 92
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    LDA $65009E,X        ; BF 9E 00 65
    CMP $9216,X          ; DD 16 92
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    SEI                  ; 78
    LDA $00              ; A1 00
    ADC $DD              ; 65 DD
    ASL $92,X            ; 16 92
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    TRB $00A4            ; 1C A4 00
    AND #$D8             ; 29 D8
    PHY                  ; 5A
    BCC $033D            ; 90 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    SED                  ; F8
    SEI                  ; 78
    BRK $21              ; 00 21
    BCS $0383            ; B0 5C
    BCC $0349            ; 90 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    INC $0077            ; EE 77 00
    WDM $B8              ; 42 B8
    EOR $90              ; 51 90
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    LDA #$7A             ; A9 7A
    BRK $42              ; 00 42
    CLV                  ; B8
    EOR $90              ; 53 90
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    CLV                  ; B8
    PLY                  ; 7A
    BRK $42              ; 00 42
    CLV                  ; B8
    EOR $90,X            ; 55 90
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    TSB $7B              ; 04 7B
    BRK $0C              ; 00 0C
    LDA $50              ; B1 50
    BCC $0359            ; 90 00
    COP $00              ; 02 00
    BRK $00              ; 00 00
    STZ $7B,X            ; 74 7B
    BRK $C4              ; 00 C4
    CPX $9350            ; EC 50 93
    BRK $02              ; 00 02
    LSR $0000            ; 4E 00 00
    LDA $7B              ; B1 7B
    BRK $C4              ; 00 C4
    CMP #$13             ; C9 13
    STA $20              ; 92 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    LDX $7C              ; A6 7C
    BRK $A7              ; 00 A7
    CMP #$13             ; C9 13
    STA $20              ; 92 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    LDX $7C              ; A6 7C
    BRK $6D              ; 00 6D
    LDX $51,Y            ; B6 51
    STA $20              ; 93 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BVC $040C            ; 50 7D
    BRK $B8              ; 00 B8
    STA $9012,Y          ; 99 12 90
    RTS                  ; 60
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    LSR $0063,X          ; 5E 63 00
    LDA $905299          ; AF 99 52 90
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    STZ $7D,X            ; 74 7D
    BRK $30              ; 00 30
    LDY $52,X            ; B4 52
    BRA $03CD            ; 80 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    EOR $7C              ; 47 7C
    BRK $30              ; 00 30
    LDY $42,X            ; B4 42
    BRA $03D9            ; 80 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    AND $95              ; 23 95
    BRK $C3              ; 00 C3
    CPX $9213            ; EC 13 92
    JSR $4F00            ; 20 00 4F
    BRK $00              ; 00 00
    JMP ($0094,X)        ; 7C 94 00
    WDM $F2              ; 42 F2
    MVN $20C0            ; 54 C0 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    STA $7D,X            ; 95 7D
    BRK $56              ; 00 56
    LDX $54              ; A6 54
    BRA $03FD            ; 80 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    LDA $7D,X            ; B5 7D
    BRK $47              ; 00 47
    LDY #$11             ; A0 11
    BCC $03E9            ; 90 00
    COP $54              ; 02 54
    BRK $00              ; 00 00
    PHY                  ; 5A
    ROR $4F00,X          ; 7E 00 4F
    BCS $043B            ; B0 48
    STY $30,X            ; 94 30
    BPL $044C            ; 10 55
    LSR $00,X            ; 56 00
    LDA $7E              ; B2 7E
    BRK $6C              ; 00 6C
    LDX $52              ; A6 52
    BRA $0421            ; 80 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    PLB                  ; AB
    ADC $AA7500,X        ; 7F 00 75 AA
    EOR $80              ; 53 80
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    SBC $7F              ; E3 7F
    BRK $4E              ; 00 4E
    BCS $045F            ; B0 48
    STY $30,X            ; 94 30
    BPL $0473            ; 10 58
    EOR $B200,Y          ; 59 00 B2
    ROR $6B00,X          ; 7E 00 6B
    LDX $52              ; A6 52
    BRA $0445            ; 80 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    PLB                  ; AB
    ADC $AA7400,X        ; 7F 00 74 AA
    EOR $80              ; 53 80
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    SBC $7F              ; E3 7F
    BRK $57              ; 00 57
    LDY #$11             ; A0 11
    BCC $043D            ; 90 00
    COP $5B              ; 02 5B
    BRK $00              ; 00 00
    AND $0080            ; 2D 80 00
    LDA $9D              ; B7 9D
    EOR $80              ; 43 80
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    STA $80              ; 85 80
    BRK $35              ; 00 35
    LDA $11              ; A1 11
    BCC $0455            ; 90 00
    COP $00              ; 02 00
    BRK $00              ; 00 00
    AND $0080            ; 2D 80 00
    AND $A1,X            ; 35 A1
    ORA $90              ; 11 90
    BRK $02              ; 00 02
    EOR $2D0000,X        ; 5F 00 00 2D
    BRA $0468            ; 80 00
    AND $A1,X            ; 35 A1
    ORA $90              ; 11 90
    BRK $02              ; 00 02
    RTS                  ; 60
    BRK $00              ; 00 00
    AND $0080            ; 2D 80 00
    STA $9E,X            ; 95 9E
    EOR $80              ; 43 80
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    STA $80              ; 85 80
    BRK $95              ; 00 95
    STZ $8043,X          ; 9E 43 80
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    SBC $80              ; F7 80
    BRK $42              ; 00 42
    INY                  ; C8
    JMP $2080            ; 4C 80 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ADC #$81             ; 69 81
    BRK $54              ; 00 54
    TAY                  ; A8
    PHA                  ; 48
    BRA $04BD            ; 80 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    LDX $0081,Y          ; BE 81 00
    CMP $AC              ; C7 AC
    EOR $90              ; 57 90
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    ADC $890082,X        ; 7F 82 00 89
    STY $5A              ; 84 5A
    BRA $04B6            ; 80 01
    ORA $00              ; 05 00
    BRK $00              ; 00 00
    PLD                  ; 2B
    STA $00              ; 83 00
    ADC #$84             ; 69 84
    PHY                  ; 5A
    BRA $04C2            ; 80 01
    ORA $00              ; 05 00
    BRK $00              ; 00 00
    PLD                  ; 2B
    STA $00              ; 83 00
    EOR $A0              ; 45 A0
    ORA $90              ; 11 90
    BRK $02              ; 00 02
    ADC $00              ; 67 00
    BRK $43              ; 00 43
    STY $00              ; 84 00
    EOR $45B0            ; 4D B0 45
    BRA $04F9            ; 80 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BVS $054B            ; 70 6C
    BRK $41              ; 00 41
    LDY $10,X            ; B4 10
    STA $00              ; 92 00
    COP $6A              ; 02 6A
    BRK $00              ; 00 00
    TXY                  ; 9B
    STY $00              ; 84 00
    LSR $54B0            ; 4E B0 54
    BRA $0511            ; 80 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    PLX                  ; FA
    STY $00              ; 84 00
    ROR $47B1            ; 6E B1 47
    BRA $051D            ; 80 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    EOR $85              ; 52 85
    BRK $E6              ; 00 E6
    BCS $054D            ; B0 46
    CPY #$20             ; C0 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    SEC                  ; 38
    STX $00              ; 86 00
    EOR $B4              ; 52 B4
    WDM $90              ; 42 90
    TRB $2A              ; 14 2A
    ADC $E20000,X        ; 7F 00 00 E2
    STX $00              ; 86 00
    EOR $B4              ; 52 B4
    WDM $90              ; 42 90
    TRB $32              ; 14 32
    ADC $550000,X        ; 7F 00 00 55
    STA $00              ; 87 00
    EOR $B4              ; 52 B4
    WDM $90              ; 42 90
    TRB $3A              ; 14 3A
    ADC $C80000,X        ; 7F 00 00 C8
    STA $00              ; 87 00
    EOR $B4              ; 52 B4
    WDM $90              ; 42 90
    TRB $42              ; 14 42
    ADC $3B0000,X        ; 7F 00 00 3B
    DEY                  ; 88
    BRK $52              ; 00 52
    LDY $42,X            ; B4 42
    BCC $0559            ; 90 14
    LSR                  ; 4A
    ADC $AE0000,X        ; 7F 00 00 AE
    DEY                  ; 88
    BRK $B6              ; 00 B6
    LDY #$53             ; A0 53
    BCC $0571            ; 90 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    AND $89              ; 21 89
    BRK $21              ; 00 21
    PEI $10              ; D4 10
    STA $00              ; 92 00
    COP $75              ; 02 75
    ADC $00              ; 77 00
    EOR $240089,X        ; 5F 89 00 24
    INY                  ; C8
    BPL $04FA            ; 10 92
    BRK $02              ; 00 02
    ROR $78,X            ; 76 78
    BRK $C1              ; 00 C1
    BIT #$00             ; 89 00
    BIT $C8              ; 24 C8
    BPL $0506            ; 10 92
    BRK $02              ; 00 02
    ROR $78,X            ; 76 78
    BRK $0A              ; 00 0A
    TXA                  ; 8A
    BRK $01              ; 00 01
    TSX                  ; BA
    EOR $80,X            ; 55 80
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    EOR $8A              ; 41 8A
    BRK $04              ; 00 04
    TSX                  ; BA
    EOR $80,X            ; 55 80
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    EOR $8A              ; 41 8A
    BRK $CF              ; 00 CF
    LDA $52              ; B2 52
    BRA $05B9            ; 80 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    STA $008A,X          ; 9D 8A 00
    CMP $B2              ; D2 B2
    EOR $80              ; 52 80
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    STA $008A,X          ; 9D 8A 00
    LDA $A8,X            ; B5 A8
    MVN $2090            ; 54 90 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    CMP $8A              ; D1 8A
    BRK $53              ; 00 53
    LDY $9054            ; AC 54 90
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    PLP                  ; 28

Graphics_Function_008:
    PHB                  ; 8B
    BRK $C1              ; 00 C1
    STZ $9011            ; 9C 11 90
    BPL $061C            ; 10 52
    STZ $9F9D,X          ; 9E 9D 9F
    ADC $8B              ; 71 8B
    BRK $D5              ; 00 D5
    LDA #$56             ; A9 56
    BRA $05F5            ; 80 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    CMP $8B              ; C5 8B
    BRK $4C              ; 00 4C
    CPY $8056            ; CC 56 80
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    STA $99,X            ; 95 99
    BRK $41              ; 00 41
    CPY $42              ; C4 42
    BRA $060D            ; 80 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    CLI                  ; 58
    STY $4100            ; 8C 00 41
    CPY $52              ; C4 52
    BRA $0619            ; 80 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    TXY                  ; 9B
    STY $4200            ; 8C 00 42
    BEQ $0643            ; F0 40
    BCS $061D            ; B0 18
    PHY                  ; 5A
    BRK $00              ; 00 00
    BRK $F1              ; 00 F1
    STY $4200            ; 8C 00 42
    BEQ $064F            ; F0 40
    BCS $0629            ; B0 18
    PER $0000            ; 62 00 00
    BRK $4B              ; 00 4B
    STA $4200            ; 8D 00 42
    BEQ $065B            ; F0 40
    BCS $0635            ; B0 18
    STA $00              ; 92 00
    BRK $00              ; 00 00
    LDA $8D              ; A5 8D
    BRK $42              ; 00 42
    BEQ $0667            ; F0 40
    BCS $0641            ; B0 18
    TXS                  ; 9A
    BRK $00              ; 00 00
    BRK $FF              ; 00 FF
    STA $4300            ; 8D 00 43
    CPY #$48             ; C0 48
    BRA $0655            ; 80 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    EOR $008E,Y          ; 59 8E 00
    EOR $C0              ; 43 C0
    JMP $2080            ; 4C 80 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    EOR $008E,Y          ; 59 8E 00
    EOR $C0              ; 43 C0
    JMP $2080            ; 4C 80 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    EOR $008E,Y          ; 59 8E 00
    EOR $AC              ; 53 AC
    JMP $2080            ; 4C 80 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    LDA $8E              ; A7 8E
    BRK $53              ; 00 53
    LDY $8048            ; AC 48 80
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    LDA $8E              ; A7 8E
    BRK $53              ; 00 53
    LDY $8048            ; AC 48 80
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    LDA $8E              ; A7 8E
    BRK $53              ; 00 53
    LDY $8048            ; AC 48 80
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    LDA $8E              ; A7 8E
    BRK $43              ; 00 43
    CPY #$48             ; C0 48
    BRA $06A9            ; 80 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00

Graphics_Function_009:
    SEP #$8E             ; E2 8E
    BRK $43              ; 00 43
    CPY #$4C             ; C0 4C
    BRA $06B5            ; 80 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00

Graphics_Function_00A:
    SEP #$8E             ; E2 8E
    BRK $43              ; 00 43
    CPY #$4C             ; C0 4C
    BRA $06C1            ; 80 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00

Graphics_Function_00B:
    SEP #$8E             ; E2 8E
    BRK $53              ; 00 53
    LDY $804C            ; AC 4C 80
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    BMI $0642            ; 30 8F
    BRK $53              ; 00 53
    LDY $8048            ; AC 48 80
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    BMI $064E            ; 30 8F
    BRK $53              ; 00 53
    LDY $8048            ; AC 48 80
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    BMI $065A            ; 30 8F
    BRK $53              ; 00 53
    LDY $8048            ; AC 48 80
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    BMI $0666            ; 30 8F
    BRK $55              ; 00 55
    LDY $43              ; A4 43
    BRA $06FD            ; 80 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    RTL                  ; 6B
    STA $A4B500          ; 8F 00 B5 A4
    ORA $92              ; 12 92
    BRK $02              ; 00 02
    STX $95,Y            ; 96 95
    BRK $C7              ; 00 C7
    STA $A4B500          ; 8F 00 B5 A4
    ORA $92              ; 12 92
    BRK $02              ; 00 02
    STA $00              ; 97 00
    BRK $C7              ; 00 C7
    STA $AA5500          ; 8F 00 55 AA
    EOR $80              ; 43 80
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    AND $0090,X          ; 3D 90 00
    EOR #$B0             ; 49 B0
    JMP $2080            ; 4C 80 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    JMP ($0064)          ; 6C 64 00
    WDM $CC              ; 42 CC
    JMP $2096            ; 4C 96 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ADC $420090          ; 6F 90 00 42
    CPY $985C            ; CC 5C 98
    SEC                  ; 38
    LDY #$00             ; A0 00
    BRK $00              ; 00 00
    LDX $90,Y            ; B6 90
    BRK $42              ; 00 42
    CLD                  ; D8
    JMP $A03898          ; 5C 98 38 A0
    BRK $00              ; 00 00
    BRK $F5              ; 00 F5
    BCC $0738            ; 90 00
    WDM $F0              ; 42 F0
    JMP $2080            ; 4C 80 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    TSC                  ; 3B
    STA $00              ; 91 00
    WDM $F0              ; 42 F0
    EOR $80              ; 45 80
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    STA $0091,Y          ; 99 91 00
    LDA $A4,X            ; B5 A4
    ORA $90              ; 11 90
    BRK $02              ; 00 02
    JSL $E10000          ; 22 00 00 E1
    STA $00              ; 93 00
    INX                  ; E8
    LDA $8045            ; AD 45 80
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    CLI                  ; 58
    STA $00              ; 92 00
    DEY                  ; 88
    LDY $8045            ; AC 45 80
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    SBC $91              ; F7 91
    BRK $93              ; 00 93
    BCS $07C1            ; B0 4A
    BRA $0799            ; 80 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    CPY $0092            ; CC 92 00
    ORA $99              ; 05 99
    EOR $90              ; 52 90
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    STZ $7D,X            ; 74 7D
    BRK $AB              ; 00 AB
    LDY $50              ; A4 50
    BCC $0791            ; 90 00
    COP $00              ; 02 00
    BRK $00              ; 00 00
    AND $0094,Y          ; 39 94 00
    LSR                  ; 4A
    LDA $A1              ; A5 A1
    LDA $20              ; A7 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BVS $0737            ; 70 94
    BRK $4A              ; 00 4A
    LDA $A1              ; A5 A1
    LDA $A0              ; A7 A0
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BVS $0743            ; 70 94
    BRK $63              ; 00 63
    LDA $51              ; B1 51
    BCC $07BF            ; 90 0A
    JSL $000000          ; 22 00 00 00
    DEY                  ; 88
    STA $00,X            ; 95 00
    JMP $11CC            ; 4C CC 11
    BCC $07D5            ; 90 14
    ROR                  ; 6A
    BRK $00              ; 00 00
    BRK $DC              ; 00 DC
    STA $00,X            ; 95 00
    JMP $10CC            ; 4C CC 10
    BCC $07E1            ; 90 14
    ADC $00              ; 72 00
    BRK $00              ; 00 00
    BMI $0769            ; 30 96
    BRK $4C              ; 00 4C
    BCS $07E7            ; B0 10
    BCC $07ED            ; 90 14
    TSX                  ; BA
    BRK $00              ; 00 00
    BRK $67              ; 00 67
    STX $00,Y            ; 96 00
    EOR $11A0            ; 4D A0 11
    BCC $07E5            ; 90 00
    COP $00              ; 02 00
    BRK $00              ; 00 00
    SBC $93              ; E1 93
    BRK $B6              ; 00 B6
    LDY #$53             ; A0 53
    BCC $0811            ; 90 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    STZ $0096,X          ; 9E 96 00
    STA $A5,X            ; 95 A5
    LDA $A7              ; A1 A7
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    INC $96              ; E6 96
    BRK $43              ; 00 43
    LDY $40              ; A4 40
    BCC $0809            ; 90 00
    COP $00              ; 02 00
    BRK $00              ; 00 00
    ORA $97              ; 07 97
    BRK $43              ; 00 43
    LDY #$11             ; A0 11
    BCC $0815            ; 90 00
    COP $00              ; 02 00
    BRK $00              ; 00 00
    SBC $93              ; E1 93
    BRK $43              ; 00 43
    LDY #$12             ; A0 12
    BCC $0821            ; 90 00
    COP $00              ; 02 00
    BRK $00              ; 00 00
    ROL $0097,X          ; 3E 97 00
    JMP $11C4            ; 4C C4 11
    BCC $0841            ; 90 14
    BRL $0830            ; 82 00 00
    BRK $B4              ; 00 B4
    STA $00              ; 97 00
    EOR $94,X            ; 55 94
    ORA $90              ; 13 90
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    BRA $07D7            ; 80 98
    BRK $30              ; 00 30
    LDY $52,X            ; B4 52
    BRA $0865            ; 80 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ORA $99              ; 12 99
    BRK $4C              ; 00 4C
    CPY $11              ; C4 11
    BCC $0865            ; 90 14
    TXA                  ; 8A
    BRK $00              ; 00 00
    BRK $1A              ; 00 1A
    TYA                  ; 98
    BRK $D1              ; 00 D1
    LDY $9052            ; AC 52 90
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    ADC $0099            ; 6D 99 00
    WDM $8C              ; 42 8C
    EOR $80              ; 51 80
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    SEC                  ; 38
    TXS                  ; 9A
    BRK $42              ; 00 42
    DEC $10              ; C6 10
    BCC $087D            ; 90 08
    BRL $092D            ; 82 B5 00
    BRK $3D              ; 00 3D
    TXS                  ; 9A
    BRK $42              ; 00 42
    BCS $08C0            ; B0 41
    BRA $08A1            ; 80 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    STX $9A              ; 86 9A
    BRK $4A              ; 00 4A
    STX $11              ; 86 11
    BCC $088E            ; 90 01
    ORA $00              ; 03 00
    BRK $00              ; 00 00
    STZ $009A,X          ; 9E 9A 00
    EOR $86              ; 41 86
    ORA $90              ; 01 90
    ORA $03              ; 01 03
    BRK $00              ; 00 00
    BRK $D1              ; 00 D1
    TXS                  ; 9A
    BRK $49              ; 00 49
    TAY                  ; A8
    ORA $D0,X            ; 15 D0
    JSR $BB00            ; 20 00 BB
    BRK $00              ; 00 00
    ROR $9B              ; 66 9B
    BRK $41              ; 00 41
    LDY #$53             ; A0 53
    CPY #$20             ; C0 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    STA $9C              ; 91 9C
    BRK $53              ; 00 53
    BCS $0912            ; B0 57
    CPY #$20             ; C0 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    CMP $A9009B          ; CF 9B 00 A9
    LDA #$52             ; A9 52
    CPY #$20             ; C0 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    SBC $9C              ; F3 9C
    BRK $4A              ; 00 4A
    LDA #$12             ; A9 12
    BCC $08F5            ; 90 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    TRB $009D            ; 1C 9D 00
    ADC $B0              ; 73 B0
    EOR $C0              ; 57 C0
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    CMP $29009B          ; CF 9B 00 29
    LDA #$54             ; A9 54
    CPY #$20             ; C0 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    EOR $9D              ; 41 9D
    BRK $42              ; 00 42
    CPY $50              ; C4 50
    BCS $0905            ; B0 0C
    TAX                  ; AA
    BRK $00              ; 00 00
    BRK $AB              ; 00 AB
    LDX $00              ; A6 00
    STX $08              ; 86 08
    INC                  ; 1A
    ORA $1810,Y          ; 19 10 18
    AND $03              ; 21 03
    BRL $C182            ; 82 77 B8
    LDA $BBBA,Y          ; B9 BA BB
    BRK $00              ; 00 00
    BRK $36              ; 00 36
    ORA $0D              ; 03 0D
    ROL $553F,X          ; 3E 3F 55
    ADC $B882,Y          ; 79 82 B8
    LDA $BBBA,Y          ; B9 BA BB
    LDA $000000,X        ; BF 00 00 00
    ORA $06              ; 07 06
    JSL $5C6641          ; 22 41 66 5C
    BRK $82              ; 00 82
    CLV                  ; B8
    ADC $0000,Y          ; 79 00 00
    BRK $00              ; 00 00
    BRK $82              ; 00 82
    CLV                  ; B8
    TSX                  ; BA
    TYX                  ; BB
    ADC $0000,Y          ; 79 00 00
    BRK $00              ; 00 00
    CLC                  ; 18
    TSC                  ; 3B
    AND $2B              ; 21 2B
    LSR $0000,X          ; 5E 00 00
    BRK $3B              ; 00 3B
    JSR $5E2B            ; 20 2B 5E
    ROR $0054            ; 6E 54 00
    BRL $C403            ; 82 B8 BA
    TYX                  ; BB
    DEC $C7              ; C6 C7
    LDA #$00             ; A9 00
    COP $07              ; 02 07

Graphics_Function_00C:
    PHP                  ; 08
    MVP $BBBA            ; 44 BA BB
    LDA $0800C7,X        ; BF C7 00 08
    AND $06              ; 32 06
    EOR $735C,Y          ; 59 5C 73
    BRK $00              ; 00 00
    TSB $0D              ; 04 0D
    ORA $23              ; 05 23
    ASL                  ; 0A
    ASL $00              ; 06 00
    BRL $C924            ; 82 B9 BF
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    JMP $6A41            ; 4C 41 6A
    JMP ($7C46)          ; 6C 46 7C
    BRK $82              ; 00 82
    CLV                  ; B8
    LDA $BBBA,Y          ; B9 BA BB
    CMP $98              ; C7 98
    BRK $00              ; 00 00
    AND $0C              ; 25 0C
    ASL $42,X            ; 16 42
    ADC $007F            ; 6D 7F 00
    BRL $C343            ; 82 B8 B9
    TSX                  ; BA
    TYX                  ; BB
    LDA $8200C7,X        ; BF C7 00 82
    TSX                  ; BA
    TYX                  ; BB
    LDA #$00             ; A9 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    JSL $44331A          ; 22 1A 33 44
    EOR #$43             ; 49 43
    PLY                  ; 7A
    BRK $19              ; 00 19
    AND $6E44            ; 2D 44 6E
    ADC $7E              ; 71 7E
    BRK $82              ; 00 82
    CLV                  ; B8
    LDA $BBBA,Y          ; B9 BA BB
    LDA $0000DF,X        ; BF DF 00 00
    JSR $490F            ; 20 0F 49
    EOR $67              ; 52 67
    LSR $8200            ; 4E 00 82
    ADC $B8              ; 77 B8
    LDA $BBBA,Y          ; B9 BA BB
    LDA $070000,X        ; BF 00 00 07
    AND $06              ; 32 06
    EOR $5D              ; 41 5D
    ROR $73              ; 66 73
    BRL $C242            ; 82 77 B8
    LDA $BBBA,Y          ; B9 BA BB
    LDA $050000,X        ; BF 00 00 05
    ASL                  ; 0A
    AND $41              ; 23 41
    PHA                  ; 48
    ROR                  ; 6A
    JMP ($7B82)          ; 6C 82 7B
    CLV                  ; B8
    LDA $BBBA,Y          ; B9 BA BB
    LDA $54828C,X        ; BF 8C 82 54
    STA $25              ; 85 25
    BMI $0982            ; 30 9C
    DEC $00,X            ; D6 00
    BRK $25              ; 00 25
    JSL $49590C          ; 22 0C 59 49
    EOR $83              ; 43 83
    BRL $C3AB            ; 82 B8 B9
    TSX                  ; BA
    TYX                  ; BB
    LDA $0000C6,X        ; BF C6 00 00
    AND $21              ; 37 21
    TSB $5C44            ; 0C 44 5C
    ADC $8200            ; 6D 00 82
    CLV                  ; B8
    LDA $C6BF,Y          ; B9 BF C6
    LDA #$90             ; A9 90
    ADC $0200,X          ; 7D 00 02
    ORA #$3A             ; 09 3A
    LSR $40,X            ; 56 40
    ADC $0000            ; 6D 00 00
    CLC                  ; 18
    TSC                  ; 3B
    AND $53              ; 33 53

Graphics_Function_00D:
    PHK                  ; 4B
    RTL                  ; 6B
    AND $BAB808          ; 2F 08 B8 BA
    TYX                  ; BB
    LDA $00009D,X        ; BF 9D 00 00
    COP $B8              ; 02 B8
    TSX                  ; BA
    TYX                  ; BB
    LDA $009D1E,X        ; BF 1E 9D 00
    BRL $C3E3            ; 82 B8 B9
    TYX                  ; BB
    BVS $0A2E            ; 70 00
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    COP $03              ; 02 03
    AND $3F4D,X          ; 3D 4D 3F
    ADC $82              ; 65 82
    LSR $79              ; 46 79
    CLV                  ; B8
    LDA $BBBA,Y          ; B9 BA BB
    LDA $0D0400,X        ; BF 00 04 0D
    ORA $3F              ; 05 3F
    BVC $0A93            ; 50 4C
    ROR                  ; 6A
    BRL $C403            ; 82 B8 B9
    TSX                  ; BA
    TYX                  ; BB
    LDA $0000C6,X        ; BF C6 00 00
    AND $33              ; 21 33
    CLC                  ; 18
    EOR $6E              ; 43 6E
    ADC $20007A,X        ; 7F 7A 00 20
    AND $54              ; 33 54
    EOR $6E              ; 52 6E
    RTL                  ; 6B
    BRL $C2E4            ; 82 82 B8
    LDA $BBBA,Y          ; B9 BA BB
    LDA $0600A9,X        ; BF A9 00 06
    ORA $57              ; 07 57
    ROR $00              ; 66 00
    BRK $00              ; 00 00
    BRK $06              ; 00 06
    EOR $3807,Y          ; 59 07 38
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ASL $28              ; 06 28
    STA $0083,Y          ; 99 83 00
    BRK $00              ; 00 00
    BRK $06              ; 00 06
    EOR $5B              ; 53 5B
    ASL $0000            ; 0E 00 00
    BRK $00              ; 00 00
    ASL $5A              ; 06 5A
    STZ $00E4            ; 9C E4 00
    BRK $00              ; 00 00
    BRK $06              ; 00 06
    STA $A8              ; 85 A8
    STP                  ; DB
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ASL                  ; 0A
    BRK $00              ; 00 00
    STZ $00              ; 64 00
    BRK $02              ; 00 02
    BRK $03              ; 00 03
    ASL                  ; 0A
    TSB $03              ; 04 03
    COP $08              ; 02 08
    ORA $0F              ; 03 0F
    TSB $0503            ; 0C 03 05
    BPL $0AB0            ; 10 03
    ORA $14              ; 07 14
    ORA $0C              ; 03 0C
    CLC                  ; 18
    ORA $0F              ; 03 0F
    TRB $1903            ; 1C 03 19
    JSR $1403            ; 20 03 14
    BIT $03              ; 24 03
    ORA $0328,Y          ; 19 28 03
    ASL                  ; 0A
    BIT $0403            ; 2C 03 04
    BMI $0AC8            ; 30 03
    ORA $34              ; 01 34
    ORA $0C              ; 03 0C
    SEC                  ; 38
    ORA $05              ; 03 05
    BIT $1F03,X          ; 3C 03 1F
    RTI                  ; 40
    ORA $02              ; 03 02
    MVP $0303            ; 44 03 03
    PHA                  ; 48
    ORA $02              ; 03 02
    JMP $1403            ; 4C 03 14
    BVC $0AE0            ; 50 03
    ORA $54              ; 01 54
    ORA $0F              ; 03 0F
    CLI                  ; 58
    ORA $0C              ; 03 0C
    JMP $600203          ; 5C 03 02 60
    ORA $64              ; 03 64
    BRK $00              ; 00 00
    INY                  ; C8
    BRK $00              ; 00 00
    PEA $0001            ; F4 01 00
    INX                  ; E8
    ORA $00              ; 03 00
    INC $02,X            ; F6 02
    SBC $02              ; F7 02
    SED                  ; F8
    COP $F9              ; 02 F9
    COP $FA              ; 02 FA
    COP $FB              ; 02 FB
    COP $FC              ; 02 FC
    COP $FD              ; 02 FD
    COP $FE              ; 02 FE
    COP $FF              ; 02 FF
    COP $00              ; 02 00
    ORA $01              ; 03 01
    ORA $02              ; 03 02
    ORA $03              ; 03 03
    ORA $04              ; 03 04
    ORA $05              ; 03 05
    ORA $06              ; 03 06
    ORA $07              ; 03 07
    ORA $08              ; 03 08
    ORA $09              ; 03 09
    ORA $0A              ; 03 0A
    ORA $0B              ; 03 0B
    ORA $0C              ; 03 0C
    ORA $0D              ; 03 0D
    ORA $0E              ; 03 0E
    ORA $0F              ; 03 0F
    ORA $10              ; 03 10
    ORA $11              ; 03 11
    ORA $12              ; 03 12
    ORA $13              ; 03 13
    ORA $97              ; 03 97
    ORA $99C9            ; 0D C9 99
    ORA $ABC9            ; 0D C9 AB
    ORA $BDC9            ; 0D C9 BD
    ORA $42C9            ; 0D C9 42
    ASL $61C9            ; 0E C9 61
    ASL $80C9            ; 0E C9 80
    ASL $EDC9            ; 0E C9 ED
    ASL $6EC9            ; 0E C9 6E
    ORA $0FFBC9          ; 0F C9 FB 0F
    CMP #$E5             ; C9 E5
    BPL $0B1B            ; 10 C9
    STA $C910,X          ; 9D 10 C9
    CMP $0F              ; C7 0F
    CMP #$19             ; C9 19
    ORA $C9              ; 11 C9
    EOR $C911            ; 4D 11 C9
    EOR $0F              ; 45 0F
    CMP #$19             ; C9 19
    TRB $C9              ; 14 C9
    LDA $14              ; B2 14
    CMP #$BE             ; C9 BE
    TRB $C9              ; 14 C9
    ASL $C918,X          ; 1E 18 C9
    INC $14,X            ; F6 14
    CMP #$0E             ; C9 0E
    ORA $C9,X            ; 15 C9
    INC $1A,X            ; F6 1A
    CMP #$C5             ; C9 C5
    INC                  ; 1A
    CMP #$E0             ; C9 E0
    CLC                  ; 18
    CMP #$E0             ; C9 E0
    CLC                  ; 18
    CMP #$E0             ; C9 E0
    CLC                  ; 18
    CMP #$52             ; C9 52
    CLC                  ; 18
    CMP #$FE             ; C9 FE
    TRB $C9              ; 14 C9
    STA $19              ; 92 19
    CMP #$1E             ; C9 1E
    ORA $C9,X            ; 15 C9
    AND $1F              ; 23 1F
    CMP #$A5             ; C9 A5
    ORA $FFC9,Y          ; 19 C9 FF
    ORA $06C9,Y          ; 19 C9 06
    ORA $C9,X            ; 15 C9
    ADC $18              ; 67 18
    CMP #$16             ; C9 16
    ORA $C9,X            ; 15 C9
    DEC $14              ; C6 14
    CMP #$D6             ; C9 D6
    TRB $C9              ; 14 C9
    INC $14              ; E6 14
    CMP #$EE             ; C9 EE
    TRB $C9              ; 14 C9
    DEC $C914            ; CE 14 C9
    DEC $C914,X          ; DE 14 C9
    ROL $15              ; 26 15
    CMP #$81             ; C9 81
    ORA $C9              ; 11 C9
    ORA $12              ; 17 12
    CMP #$8F             ; C9 8F
    ORA $C9              ; 12 C9
    PEA $C912            ; F4 12 C9
    ROL $13,X            ; 36 13
    CMP #$93             ; C9 93
    ORA $C9              ; 13 C9
    DEC $13,X            ; D6 13
    CMP #$49             ; C9 49
    TRB $C9              ; 14 C9
    SEI                  ; 78
    TRB $C9              ; 14 C9
    ROL $C915            ; 2E 15 C9
    CLV                  ; B8
    ORA $C9              ; 17 C9
    RTL                  ; 6B
    ORA $C9,X            ; 15 C9
    MVN $C919            ; 54 19 C9
    LDY #$1A             ; A0 1A
    CMP #$A7             ; C9 A7
    CLC                  ; 18
    CMP #$1D             ; C9 1D
    INC                  ; 1A
    CMP #$34             ; C9 34
    INC                  ; 1A
    CMP #$45             ; C9 45
    INC                  ; 1A
    CMP #$56             ; C9 56
    INC                  ; 1A
    CMP #$17             ; C9 17
    ORA $C9              ; 17 C9
    BNE $0C09            ; D0 16
    CMP #$3A             ; C9 3A
    ORA $79C9,Y          ; 19 C9 79
    ORA $C9              ; 17 C9
    ADC #$19             ; 69 19
    CMP #$F5             ; C9 F5
    ORA $C9,X            ; 15 C9

Graphics_Function_00E:
    BRL $D518            ; 82 15 C9
    BMI $0C1B            ; 30 16
    CMP #$24             ; C9 24
    TCS                  ; 1B
    CMP #$30             ; C9 30
    TCS                  ; 1B
    CMP #$7E             ; C9 7E
    TCS                  ; 1B
    CMP #$9D             ; C9 9D
    TCS                  ; 1B
    CMP #$B9             ; C9 B9
    TCS                  ; 1B
    CMP #$CB             ; C9 CB
    TCS                  ; 1B
    CMP #$D7             ; C9 D7
    TCS                  ; 1B
    CMP #$E3             ; C9 E3
    TCS                  ; 1B
    CMP #$08             ; C9 08
    TRB $2DC9            ; 1C C9 2D
    TRB $39C9            ; 1C C9 39
    TRB $45C9            ; 1C C9 45
    TRB $51C9            ; 1C C9 51
    TRB $5DC9            ; 1C C9 5D
    TRB $81C9            ; 1C C9 81
    TRB $99C9            ; 1C C9 99
    TRB $04C9            ; 1C C9 04
    ORA $16C9,X          ; 1D C9 16
    ORA $78C9,X          ; 1D C9 78
    ORA $A0C9,X          ; 1D C9 A0
    ORA $18C9,X          ; 1D C9 18
    ASL $B4C9,X          ; 1E C9 B4
    ORA $C8C9,X          ; 1D C9 C8
    ORA $DCC9,X          ; 1D C9 DC
    ORA $F0C9,X          ; 1D C9 F0
    ORA $47C9,X          ; 1D C9 47
    ASL $04C9,X          ; 1E C9 04
    ASL $28C9,X          ; 1E C9 28
    ORA $3CC9,X          ; 1D C9 3C
    ORA $50C9,X          ; 1D C9 50
    ORA $64C9,X          ; 1D C9 64
    ORA $76C9,X          ; 1D C9 76
    ASL $69C9,X          ; 1E C9 69
    AND $C9              ; 27 C9
    ROR                  ; 6A
    AND $C9              ; 27 C9
    TAX                  ; AA
    PLP                  ; 28
    CMP #$C0             ; C9 C0
    PLP                  ; 28
    CMP #$4C             ; C9 4C
    BIT $5FC9            ; 2C C9 5F
    BIT $B5C9            ; 2C C9 B5
    PLP                  ; 28
    CMP #$D3             ; C9 D3
    PLP                  ; 28
    CMP #$DE             ; C9 DE
    PLP                  ; 28
    CMP #$F4             ; C9 F4
    PLP                  ; 28
    CMP #$E9             ; C9 E9
    PLP                  ; 28
    CMP #$6C             ; C9 6C
    AND $61C9            ; 2D C9 61
    AND $88C9            ; 2D C9 88
    AND #$C9             ; 29 C9
    LDA $29              ; A3 29
    CMP #$FF             ; C9 FF
    PLP                  ; 28
    CMP #$15             ; C9 15
    AND #$C9             ; 29 C9
    ROL $29,X            ; 36 29
    CMP #$41             ; C9 41
    AND #$C9             ; 29 C9
    LDX $29,Y            ; B6 29
    CMP #$D4             ; C9 D4
    AND #$C9             ; 29 C9
    LSR $2A              ; 46 2A
    CMP #$33             ; C9 33
    ROL                  ; 2A
    CMP #$20             ; C9 20
    ROL                  ; 2A
    CMP #$0D             ; C9 0D
    ROL                  ; 2A
    CMP #$8F             ; C9 8F
    ROL $84C9            ; 2E C9 84
    ROL $41C9            ; 2E C9 41
    AND #$C9             ; 29 C9
    ROR $2E              ; 66 2E
    CMP #$53             ; C9 53
    ROL $48C9            ; 2E C9 48
    ROL $12C9            ; 2E C9 12
    ROL $79C9            ; 2E C9 79
    ROL $A2C9            ; 2E C9 A2
    ROL $07C9            ; 2E C9 07
    ROL $E1C9            ; 2E C9 E1
    AND $82C9            ; 2D C9 82
    AND $95C9            ; 2D C9 95
    AND $A8C9            ; 2D C9 A8
    AND $BBC9            ; 2D C9 BB
    AND $56C9            ; 2D C9 56
    AND $0AC9            ; 2D C9 0A
    AND $1DC9            ; 2D C9 1D
    AND $30C9            ; 2D C9 30
    AND $43C9            ; 2D C9 43
    AND $72C9            ; 2D C9 72
    BIT $F7C9            ; 2C C9 F7
    BIT $E4C9            ; 2C C9 E4
    BIT $D1C9            ; 2C C9 D1
    BIT $BEC9            ; 2C C9 BE
    BIT $ABC9            ; 2C C9 AB
    BIT $98C9            ; 2C C9 98
    BIT $85C9            ; 2C C9 85
    BIT $35C9            ; 2C C9 35
    PLD                  ; 2B
    CMP #$5B             ; C9 5B
    PLD                  ; 2B
    CMP #$59             ; C9 59
    ROL                  ; 2A
    CMP #$22             ; C9 22
    PLD                  ; 2B
    CMP #$E6             ; C9 E6
    ROL                  ; 2A
    CMP #$C0             ; C9 C0
    ROL                  ; 2A
    CMP #$AD             ; C9 AD
    ROL                  ; 2A
    CMP #$92             ; C9 92
    ROL                  ; 2A
    CMP #$AD             ; C9 AD
    ROL $2DC9            ; 2E C9 2D
    ROL $FAC9            ; 2E C9 FA
    AND #$C9             ; 29 C9
    CMP #$29             ; C9 29
    CMP #$CE             ; C9 CE
    AND $77C9            ; 2D C9 77
    AND $F4C9            ; 2D C9 F4
    AND $48C9            ; 2D C9 48
    PLD                  ; 2B
    CMP #$D2             ; C9 D2
    AND $2FAFC9          ; 2F C9 AF 2F
    CMP #$9C             ; C9 9C
    AND $2F89C9          ; 2F C9 89 2F
    CMP #$76             ; C9 76
    AND $2F63C9          ; 2F C9 63 2F
    CMP #$50             ; C9 50
    AND $2F3DC9          ; 2F C9 3D 2F
    CMP #$2A             ; C9 2A
    AND $2F17C9          ; 2F C9 17 2F
    CMP #$04             ; C9 04
    AND $2EF1C9          ; 2F C9 F1 2E
    CMP #$DE             ; C9 DE
    ROL $CBC9            ; 2E C9 CB
    ROL $31C9            ; 2E C9 31
    BIT $16C9            ; 2C C9 16
    BIT $FBC9            ; 2C C9 FB
    PLD                  ; 2B
    CMP #$E5             ; C9 E5
    AND $3000C9          ; 2F C9 00 30
    CMP #$1B             ; C9 1B
    BMI $0D3A            ; 30 C9
    CPX #$2B             ; E0 2B
    CMP #$36             ; C9 36
    BMI $0D40            ; 30 C9
    EOR $30              ; 51 30
    CMP #$C2             ; C9 C2
    PLD                  ; 2B
    CMP #$6C             ; C9 6C
    BMI $0D49            ; 30 C9
    ADC $92C930,X        ; 7F 30 C9 92
    BMI $0D4F            ; 30 C9
    LDA $30              ; A5 30
    CMP #$B8             ; C9 B8
    BMI $0D55            ; 30 C9
    WAI                  ; CB
    BMI $0D58            ; 30 C9
    DEC $C930,X          ; DE 30 C9
    SBC $30              ; F1 30
    CMP #$AF             ; C9 AF
    PLD                  ; 2B
    CMP #$04             ; C9 04
    AND $C9              ; 31 C9
    BIT #$2B             ; 89 2B
    CMP #$6E             ; C9 6E
    PLD                  ; 2B
    CMP #$9C             ; C9 9C
    PLD                  ; 2B
    CMP #$C0             ; C9 C0
    ROL $D3C9            ; 2E C9 D3
    ROL                  ; 2A
    CMP #$2B             ; C9 2B
    AND #$C9             ; 29 C9
    JSR $C929            ; 20 29 C9
    TSB $2B              ; 04 2B
    CMP #$6C             ; C9 6C
    ROL                  ; 2A
    CMP #$FA             ; C9 FA
    AND #$C9             ; 29 C9
    SBC $29              ; E7 29
    CMP #$6A             ; C9 6A
    AND #$C9             ; 29 C9
    JMP $C929            ; 4C 29 C9
    ADC $01C92A,X        ; 7F 2A C9 01
    TSB $02              ; 04 02
    TSB $03              ; 04 03
    ORA $00              ; 01 00
    BRK $06              ; 00 06
    COP $05              ; 02 05
    ASL                  ; 0A
    ORA $03              ; 07 03
    BRK $00              ; 00 00

Graphics_Function_00F:
    PHP                  ; 08
    ORA $0C              ; 03 0C
    TSB $08              ; 04 08
    ORA $00              ; 03 00
    BRK $08              ; 00 08
    TRB $0F              ; 14 0F
    ORA $11              ; 03 11
    ORA $00              ; 03 00
    BRK $0C              ; 00 0C
    ORA $0C              ; 05 0C
    ORA $0C              ; 05 0C
    ORA $0C              ; 05 0C
    ORA $0B              ; 05 0B
    ORA $04              ; 03 04
    ORA $04              ; 05 04
    ORA $04              ; 05 04
    ORA $05              ; 05 05
    TSB $09              ; 04 09
    COP $05              ; 02 05
    TSB $00              ; 04 00
    BRK $06              ; 00 06
    ORA $04              ; 03 04

Graphics_Function_010:
    TSB $09              ; 04 09
    ORA $00              ; 03 00
    BRK $03              ; 00 03
    ORA $02              ; 05 02
    ORA $07              ; 05 07
    ORA $00              ; 01 00
    BRK $0C              ; 00 0C
    ORA $0D,X            ; 15 0D
    TCS                  ; 1B
    ASL $0802            ; 0E 02 08
    ORA $0F              ; 13 0F
    COP $13              ; 02 13
    ASL $14              ; 06 14
    ORA $00              ; 03 00
    BRK $0E              ; 00 0E
    ASL $0316,X          ; 1E 16 03
    ASL $03,X            ; 16 03
    BRK $00              ; 00 00
    ORA $02              ; 12 02
    ORA $0D,X            ; 15 0D
    ORA $04              ; 17 04
    BRK $00              ; 00 00
    TRB $1A01            ; 1C 01 1A
    TSB $00              ; 04 00
    BRK $00              ; 00 00
    BRK $18              ; 00 18
    PHD                  ; 0B
    TCS                  ; 1B
    ASL                  ; 0A
    AND $02              ; 21 02
    ORA $032103,X        ; 1F 03 21 03
    AND $02              ; 25 02
    AND $03              ; 21 03
    BRK $00              ; 00 00
    BIT $05              ; 24 05
    TRB $1A02            ; 1C 02 1A
    ORA $00              ; 03 00
    BRK $0A              ; 00 0A
    STZ $1B              ; 64 1B
    ORA $1F              ; 03 1F
    COP $00              ; 02 00
    BRK $20              ; 00 20
    JSR $0216            ; 20 16 02
    ORA $1E13,X          ; 1D 13 1E
    ORA $6E              ; 03 6E
    ORA $32              ; 01 32
    TSB $23              ; 04 23
    TSB $00              ; 04 00
    BRK $29              ; 00 29
    TSB $26              ; 04 26
    TSB $39              ; 04 39
    ORA $00              ; 03 00
    BRK $34              ; 00 34
    TSB $30              ; 04 30
    ASL $31              ; 06 31
    COP $00              ; 02 00
    BRK $3B              ; 00 3B
    COP $48              ; 02 48

Graphics_Function_011:
    PHP                  ; 08
    PHA                  ; 48

Graphics_Function_012:
    PHP                  ; 08
    PHA                  ; 48

Graphics_Function_013:
    PHP                  ; 08
    ASL                  ; 0A
    INY                  ; C8
    AND $07              ; 32 07
    AND $07              ; 32 07
    ASL                  ; 0A
    INY                  ; C8
    RTI                  ; 40
    COP $41              ; 02 41
    ORA $42              ; 05 42
    ORA $00              ; 05 00
    BRK $61              ; 00 61
    ORA $61              ; 03 61
    ORA $61              ; 03 61
    ORA $00              ; 03 00
    BRK $51              ; 00 51
    ORA $46              ; 01 46
    ASL $0A50,X          ; 1E 50 0A
    BRK $00              ; 00 00
    ORA $DF              ; 01 DF
    AND $53              ; 32 53
    DEC                  ; 3A
    ASL                  ; 0A
    RTI                  ; 40
    AND $46              ; 31 46

Graphics_Function_014:
    PHP                  ; 08
    ADC $01              ; 61 01
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    EOR $02600A          ; 4F 0A 60 02
    EOR $02              ; 47 02
    BRK $00              ; 00 00
    CLI                  ; 58
    BEQ $0EEF            ; F0 37
    COP $00              ; 02 00
    BRK $00              ; 00 00
    BRK $3C              ; 00 3C
    ORA $4B              ; 03 4B
    ORA $49              ; 03 49
    ORA $00              ; 03 00
    BRK $53              ; 00 53
    TSB $4E              ; 04 4E
    ORA $4D              ; 03 4D
    ORA $00              ; 03 00
    BRK $65              ; 00 65
    ORA $64              ; 03 64
    TSB $65              ; 04 65
    ORA $00              ; 03 00
    BRK $70              ; 00 70
    COP $2F              ; 02 2F
    COP $00              ; 02 00
    BRK $00              ; 00 00
    BRK $60              ; 00 60
    ORA $5C0262          ; 0F 62 02 5C
    TSB $00              ; 04 00
    BRK $37              ; 00 37
    TSB $63              ; 04 63
    TSB $00              ; 04 00
    BRK $00              ; 00 00
    BRK $19              ; 00 19
    ORA $19              ; 07 19
    ORA $19              ; 07 19
    ORA $00              ; 07 00
    BRK $14              ; 00 14
    ORA $15              ; 03 15
    ORA $16              ; 03 16
    ORA $17              ; 03 17
    ORA $0B              ; 03 0B
    BRK $00              ; 00 00
    ORA $00              ; 07 00
    ORA $80              ; 01 80
    COP $02              ; 02 02
    BRA $0F09            ; 80 01
    ORA $00              ; 03 00
    BRK $04              ; 00 04
    TSB $0501            ; 0C 01 05
    ORA $01              ; 07 01
    ASL $80              ; 06 80
    ORA $07              ; 03 07
    BRA $0F17            ; 80 00

Graphics_Function_015:
    PHP                  ; 08
    BRK $01              ; 00 01
    ORA #$0A             ; 09 0A
    COP $0A              ; 02 0A
    ASL $02              ; 06 02
    PHD                  ; 0B
    BRA $0F23            ; 80 00
    TSB $0200            ; 0C 00 02
    ORA $0200            ; 0D 00 02
    ORA $030A            ; 0D 0A 03
    ASL $0306            ; 0E 06 03
    ORA $100300          ; 0F 00 03 10
    BRK $03              ; 00 03
    BPL $0F37            ; 10 00
    ORA $10              ; 03 10
    TSB $1104            ; 0C 04 11
    ORA $04              ; 07 04
    ORA $00              ; 12 00
    TSB $13              ; 04 13
    BRK $04              ; 00 04
    ORA $00              ; 13 00
    TSB $13              ; 04 13
    PHD                  ; 0B
    BRK $14              ; 00 14
    ORA $00              ; 07 00
    ORA $80,X            ; 15 80
    COP $16              ; 02 16
    BRA $0F56            ; 80 03
    ORA $00              ; 17 00
    BRK $18              ; 00 18
    PHD                  ; 0B
    BRK $19              ; 00 19
    BRA $0F5F            ; 80 03
    INC                  ; 1A
    BRA $0F61            ; 80 02
    TCS                  ; 1B
    BRA $0F63            ; 80 01
    TRB $0000            ; 1C 00 00
    ORA $010B,X          ; 1D 0B 01
    ASL $0107,X          ; 1E 07 01
    ORA $200080,X        ; 1F 80 00 20
    BRA $0F73            ; 80 02
    AND $00              ; 21 00
    ORA $22              ; 01 22

Graphics_Function_016:
    PHP                  ; 08
    ORA $23              ; 01 23
    BRA $0F7A            ; 80 00
    BIT $80              ; 24 80
    ORA $25              ; 03 25
    BRK $01              ; 00 01
    ROL $00              ; 26 00
    ORA $26              ; 01 26
    PHD                  ; 0B
    COP $27              ; 02 27
    ASL $02              ; 06 02
    PLP                  ; 28
    BRA $0F8F            ; 80 03
    AND #$00             ; 29 00
    COP $2A              ; 02 2A
    BRK $02              ; 00 02
    ROL                  ; 2A
    PHD                  ; 0B
    COP $2B              ; 02 2B
    ASL $02              ; 06 02
    BIT $0080            ; 2C 80 00
    AND $0200            ; 2D 00 02
    ROL $0200            ; 2E 00 02
    ROL $030A            ; 2E 0A 03
    AND $300306          ; 2F 06 03 30
    BRK $03              ; 00 03
    AND $00              ; 31 00
    ORA $31              ; 03 31
    BRK $03              ; 00 03
    AND $0A              ; 31 0A
    ORA $32              ; 03 32
    ASL $03              ; 06 03
    AND $00              ; 33 00
    ORA $33              ; 03 33
    BRK $03              ; 00 03
    AND $00              ; 33 00
    ORA $33              ; 03 33
    ASL                  ; 0A
    ORA $35              ; 03 35
    ASL $03              ; 06 03
    ROL $00,X            ; 36 00
    ORA $37              ; 03 37
    BRK $03              ; 00 03
    AND $00              ; 37 00
    ORA $37              ; 03 37
    TSB $3804            ; 0C 04 38
    ASL $04              ; 06 04
    AND $0400,Y          ; 39 00 04
    DEC                  ; 3A
    BRK $04              ; 00 04
    DEC                  ; 3A
    BRK $04              ; 00 04
    DEC                  ; 3A
    TSB $3B04            ; 0C 04 3B
    ASL $04              ; 06 04
    BIT $0400,X          ; 3C 00 04
    AND $0400,X          ; 3D 00 04
    AND $0400,X          ; 3D 00 04
    AND $0409,X          ; 3D 09 04
    ROL $0406,X          ; 3E 06 04
    AND $400400,X        ; 3F 00 04 40
    BRK $04              ; 00 04
    RTI                  ; 40
    BRK $04              ; 00 04
    RTI                  ; 40
    PHY                  ; 5A
    ORA $00              ; 05 00
    BRK $02              ; 00 02
    ORA $04              ; 01 04
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $68              ; 00 68
    LSR $00              ; 46 00
    BRK $01              ; 00 01
    ASL $07              ; 06 07
    ORA $00              ; 03 00
    BRK $00              ; 00 00
    BRK $88              ; 00 88
    MVP $0000            ; 44 00 00
    ORA $05              ; 03 05
    ORA #$04             ; 09 04
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    STA $65              ; 85 65
    BRK $00              ; 00 00

Graphics_Function_017:
    PHP                  ; 08
    ORA $28              ; 07 28
    PHD                  ; 0B
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ROR $86              ; 66 86
    ASL                  ; 0A
    BRK $09              ; 00 09
    ORA $100C            ; 0D 0C 10
    ORA $00              ; 11 00
    BRK $00              ; 00 00
    ROL $06              ; 26 06
    BRK $00              ; 00 00
    ORA $08              ; 12 08
    ORA $00              ; 13 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    STX $54              ; 86 54
    BRK $00              ; 00 00
    ORA $0A              ; 13 0A
    CLC                  ; 18
    PHD                  ; 0B
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    PLA                  ; 68
    COP $00              ; 02 00
    BRK $14              ; 00 14
    PLD                  ; 2B
    ASL $00,X            ; 16 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    MVP $0044            ; 44 44 00
    BRK $03              ; 00 03
    ORA $06              ; 07 06
    AND #$00             ; 29 00
    BRK $00              ; 00 00
    BRK $66              ; 00 66
    BIT $0A,X            ; 34 0A
    BRK $28              ; 00 28
    ORA $1A              ; 17 1A
    ORA $0011,Y          ; 19 11 00
    BRK $00              ; 00 00
    ROR $00              ; 66 00
    BRK $00              ; 00 00
    TCS                  ; 1B
    TRB $0000            ; 1C 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ROR $36              ; 66 36
    BRK $00              ; 00 00
    ASL $0E1F,X          ; 1E 1F 0E
    ORA #$00             ; 09 00
    BRK $00              ; 00 00
    BRK $55              ; 00 55
    ORA $00              ; 03 00
    BRK $01              ; 00 01
    ORA $0C              ; 05 0C
