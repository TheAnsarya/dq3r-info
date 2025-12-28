;==============================================================================
; Dragon Quest III - Bank $6A Code
; Ultra-aggressive code extraction
;==============================================================================

.include "../include/hardware.inc"

.segment "BANK_6A_CODE"


Bank_6A_Function_00:
    SED                  ; F8
    CLD                  ; D8
    PLY                  ; 7A
    BRK $F0              ; 00 F0
    BNE $000D            ; D0 06
    BRK $F0              ; 00 F0
    CLD                  ; D8
    PHP                  ; 08
    BRK $F8              ; 00 F8
    CLD                  ; D8
    ORA $00              ; 17 00
    SED                  ; F8
    CMP $07              ; D1 07
    BRK $F8              ; 00 F8
    CMP #$0A             ; C9 0A
    BRK $EA              ; 00 EA
    SBC $0B              ; E7 0B
    RTI                  ; 40
    SBC $E7              ; F2 E7
    TSB $EA40            ; 0C 40 EA
    CMP $00              ; D7 00
    BVC $0034            ; 50 0F
    WAI                  ; CB
    ORA $0F40            ; 0D 40 0F
    CMP $02              ; D3 02
    BVC $002C            ; 50 FF
    CMP #$0A             ; C9 0A
    RTI                  ; 40
    SBC $5006D1,X        ; FF D1 06 50
    TSB $00              ; 04 00
    BRK $00              ; 00 00
    ORA $07,X            ; 15 07
    STP                  ; DB
    TDC                  ; 7B
    BRK $FE              ; 00 FE
    XCE                  ; FB
    BRL $FE42            ; 82 00 FE
    SBC $83              ; F3 83
    BRK $F0              ; 00 F0
    XBA                  ; EB
    STY $00              ; 84 00
    SED                  ; F8
    XBA                  ; EB
    STA $00              ; 85 00
    BRK $EB              ; 00 EB
    STX $00              ; 86 00
    BRK $E3              ; 00 E3
    STA $00              ; 87 00
    BRK $DB              ; 00 DB
    DEY                  ; 88
    BRK $F0              ; 00 F0
    STP                  ; DB
    BRA $006D            ; 80 10
    BEQ $002A            ; F0 CB
    ASL $00              ; 06 00
    BEQ $0036            ; F0 D3
    PHP                  ; 08
    BRK $F8              ; 00 F8
    CMP $17              ; D3 17
    BRK $F8              ; 00 F8
    WAI                  ; CB
    ORA $00              ; 07 00
    SED                  ; F8
    CMP $0A              ; C3 0A
    BRK $EA              ; 00 EA
    CPX #$0B             ; E0 0B
    RTI                  ; 40
    SBC $E0              ; F2 E0
    TSB $EA40            ; 0C 40 EA
    BNE $007C            ; D0 00
    BVC $008D            ; 50 0F
    CMP $0D              ; C5 0D
    RTI                  ; 40
    ORA $5002CD          ; 0F CD 02 50
    SBC $400AC3,X        ; FF C3 0A 40
    SBC $5006CB,X        ; FF CB 06 50
    TSB $00              ; 04 00
    BRK $00              ; 00 00
    ORA $07              ; 05 07
    CMP $1020,X          ; DD 20 10
    BRK $E8              ; 00 E8
    BIT #$10             ; 89 10
    BEQ $0084            ; F0 E8
    PHB                  ; 8B
    BPL $009F            ; 10 00
    CLD                  ; D8
    ROL $10              ; 26 10
    BEQ $007C            ; F0 D8
    PLP                  ; 28
    BPL $00AB            ; 10 04
    BRK $00              ; 00 00
    BRK $05              ; 00 05
    ORA $DE              ; 07 DE
    JSR $0010            ; 20 10 00
    INX                  ; E8
    JSL $E8F010          ; 22 10 F0 E8
    BIT $10              ; 24 10
    BRK $D8              ; 00 D8
    ROL $10              ; 26 10
    BEQ $0095            ; F0 D8
    PLP                  ; 28
    BPL $00C4            ; 10 04
    BRK $00              ; 00 00
    BRK $07              ; 00 07
    BEQ $00AF            ; F0 E9
    BIT $00              ; 24 00
    SED                  ; F8
    SBC $8F              ; F1 8F
    BRK $F8              ; 00 F8
    SBC #$92             ; E9 92
    BRK $07              ; 00 07
    CMP $001020,X        ; DF 20 10 00
    SBC #$8D             ; E9 8D
    BPL $00D9            ; 10 00
    CMP $1026,Y          ; D9 26 10
    BEQ $00B7            ; F0 D9
    PLP                  ; 28
    BPL $00E5            ; 10 04
    BRK $00              ; 00 00
    BRK $0A              ; 00 0A
    ORA $E0              ; 07 E0
    JSR $0810            ; 20 10 08
    NOP                  ; EA
    STX $0000            ; 8E 00 00
    SBC $9D              ; F2 9D
    BRK $08              ; 00 08
    SBC $9E              ; F1 9E
    BRK $00              ; 00 00
    NOP                  ; EA
    STA $F800            ; 8D 00 F8
    NOP                  ; EA
    STA $00              ; 92 00
    BEQ $00E9            ; F0 EA
    BIT $00              ; 24 00
    SED                  ; F8
    SBC $8F              ; F1 8F
    BRK $00              ; 00 00
    PHX                  ; DA
    ROL $10              ; 26 10
    BEQ $00E5            ; F0 DA
    PLP                  ; 28
    BPL $0112            ; 10 04
    BRK $00              ; 00 00
    BRK $0A              ; 00 0A
    ORA $E1              ; 07 E1
    JSR $0810            ; 20 10 08
    NOP                  ; EA
    STX $0000            ; 8E 00 00
    SBC $9D              ; F2 9D
    BRK $08              ; 00 08
    SBC $9E              ; F1 9E
    BRK $00              ; 00 00
    NOP                  ; EA
    STA $F800            ; 8D 00 F8
    NOP                  ; EA
    STA $00              ; 92 00
    BEQ $0117            ; F0 EB
    BIT $00              ; 24 00
    SED                  ; F8
    SBC $8F              ; F1 8F
    BRK $00              ; 00 00
    STP                  ; DB
    ROL $10              ; 26 10
    BEQ $0113            ; F0 DB
    PLP                  ; 28
    BPL $013F            ; 10 04
    BRK $00              ; 00 00
    BRK $07              ; 00 07
    BEQ $012A            ; F0 E9
    BIT $00              ; 24 00
    SED                  ; F8
    SBC $8F              ; F1 8F
    BRK $F8              ; 00 F8
    SBC #$92             ; E9 92
    BRK $07              ; 00 07
    SEP #$20             ; E2 20
    BPL $0150            ; 10 00
    SBC #$8D             ; E9 8D
    BPL $0154            ; 10 00
    PHX                  ; DA
    ROL $10              ; 26 10
    BEQ $0132            ; F0 D9
    PLP                  ; 28
    BPL $0160            ; 10 04
    BRK $00              ; 00 00
    BRK $05              ; 00 05
    ORA $E0              ; 07 E0
    JSR $0010            ; 20 10 00
    INX                  ; E8
    JSL $E8F010          ; 22 10 F0 E8
    BIT $10              ; 24 10
    BRK $D8              ; 00 D8
    ROL $10              ; 26 10
    BEQ $014A            ; F0 D8
    PLP                  ; 28
    BPL $0179            ; 10 04
    BRK $00              ; 00 00
    BRK $0B              ; 00 0B
    BEQ $0152            ; F0 D7
    LDY #$10             ; A0 10
    ASL $DF              ; 06 DF
    JSR $F810            ; 20 10 F8
    CMP $0093,Y          ; D9 93 00
    BRK $E1              ; 00 E1
    STY $00,X            ; 94 00
    BRK $D9              ; 00 D9
    STA $00,X            ; 95 00
    SED                  ; F8
    CPX #$96             ; E0 96
    BRK $F8              ; 00 F8
    CLD                  ; D8
    STA $00              ; 97 00
    BRK $D8              ; 00 D8
    LDX #$10             ; A2 10
    SED                  ; F8
    BEQ $0134            ; F0 98
    BRK $F8              ; 00 F8
    INX                  ; E8
    STA $E80000,X        ; 9F 00 00 E8
    LDY $10              ; A4 10
    TSB $00              ; 04 00
    BRK $00              ; 00 00
    ORA #$00             ; 09 00
    CPX #$20             ; E0 20
    BPL $01A9            ; 10 FA
    DEC $A0,X            ; D6 A0
    BVC $01AB            ; 50 F8
    CLD                  ; D8
    STA $00              ; 93 00
    BRK $E0              ; 00 E0
    STY $00,X            ; 94 00
    BRK $D8              ; 00 D8
    STA $00,X            ; 95 00
    SED                  ; F8
    CLD                  ; D8
    LDX $10              ; A6 10
    PHP                  ; 08
    BEQ $017A            ; F0 B5
    BRK $08              ; 00 08
    INX                  ; E8
    LDA $00              ; A5 00
    SED                  ; F8
    INX                  ; E8
    TAY                  ; A8
    BPL $01D3            ; 10 04
    BRK $00              ; 00 00
    BRK $09              ; 00 09
    SBC $1020DF,X        ; FF DF 20 10
    XCE                  ; FB
    DEC $A0,X            ; D6 A0
    BVC $01D4            ; 50 F8
    CLD                  ; D8
    STA $00              ; 93 00
    BRK $E0              ; 00 E0
    STY $00,X            ; 94 00
    BRK $D8              ; 00 D8
    STA $00,X            ; 95 00
    SED                  ; F8
    CLD                  ; D8
    LDX $10              ; A6 10
    PHP                  ; 08
    BEQ $01A3            ; F0 B5
    BRK $08              ; 00 08
    INX                  ; E8
    LDA $00              ; A5 00
    SED                  ; F8
    INX                  ; E8
    TAY                  ; A8
    BPL $01FC            ; 10 04
    BRK $00              ; 00 00
    BRK $09              ; 00 09
    INC $20DD,X          ; FE DD 20
    BPL $01FC            ; 10 FB
    CMP $A0,X            ; D5 A0
    BVC $01FD            ; 50 F8
    CLD                  ; D8
    STA $00              ; 93 00
    BRK $E0              ; 00 E0
    STY $00,X            ; 94 00
    BRK $D8              ; 00 D8
    STA $00,X            ; 95 00
    SED                  ; F8
    CLD                  ; D8
    LDX $10              ; A6 10
    PHP                  ; 08
    BEQ $01CC            ; F0 B5
    BRK $08              ; 00 08
    INX                  ; E8
    LDA $00              ; A5 00
    SED                  ; F8
    INX                  ; E8
    TAY                  ; A8
    BPL $0225            ; 10 04
    BRK $00              ; 00 00
    BRK $09              ; 00 09
    INC $20DB,X          ; FE DB 20
    BPL $0225            ; 10 FB
    CMP $A0              ; D3 A0
    BVC $0226            ; 50 F8
    CLD                  ; D8
    STA $00              ; 93 00
    BRK $E0              ; 00 E0
    STY $00,X            ; 94 00
    BRK $D8              ; 00 D8
    STA $00,X            ; 95 00
    SED                  ; F8
    CLD                  ; D8
    LDX $10              ; A6 10
    PHP                  ; 08
    BEQ $01F5            ; F0 B5
    BRK $08              ; 00 08
    INX                  ; E8
    LDA $00              ; A5 00
    SED                  ; F8
    INX                  ; E8
    TAY                  ; A8
    BPL $024E            ; 10 04
    BRK $00              ; 00 00
    BRK $09              ; 00 09
    INC $20DA,X          ; FE DA 20
    BPL $024E            ; 10 FB
    CMP $A0              ; D2 A0
    BVC $024F            ; 50 F8
    CLD                  ; D8
    STA $00              ; 93 00
    BRK $E0              ; 00 E0
    STY $00,X            ; 94 00
    BRK $D8              ; 00 D8
    STA $00,X            ; 95 00
    SED                  ; F8
    CLD                  ; D8
    LDX $10              ; A6 10
    PHP                  ; 08
    BEQ $021E            ; F0 B5
    BRK $08              ; 00 08
    INX                  ; E8
    LDA $00              ; A5 00
    SED                  ; F8
    INX                  ; E8
    TAY                  ; A8
    BPL $0277            ; 10 04
    BRK $00              ; 00 00
    BRK $0D              ; 00 0D
    ORA $E8              ; 03 E8
    TAX                  ; AA
    CPY $FB              ; C4 FB
    INX                  ; E8
    TAX                  ; AA
    STY $03              ; 84 03
    CPX #$AA             ; E0 AA
    MVP $E0FB            ; 44 FB E0
    TAX                  ; AA
    TSB $00              ; 04 00
    CPX #$20             ; E0 20
    BPL $0286            ; 10 FA
    DEC $A0,X            ; D6 A0
    BVC $0288            ; 50 F8
    CLD                  ; D8
    STA $00              ; 93 00
    BRK $E0              ; 00 E0
    STY $00,X            ; 94 00
    BRK $D8              ; 00 D8
    STA $00,X            ; 95 00
    SED                  ; F8
    CLD                  ; D8
    LDX $10              ; A6 10
    PHP                  ; 08
    BEQ $0257            ; F0 B5
    BRK $08              ; 00 08
    INX                  ; E8
    LDA $00              ; A5 00
    SED                  ; F8
    INX                  ; E8
    TAY                  ; A8
    BPL $02B0            ; 10 04
    BRK $00              ; 00 00
    BRK $0D              ; 00 0D
    ORA $E8              ; 03 E8
    PLB                  ; AB
    CPY $03              ; C4 03
    CPX #$AB             ; E0 AB
    MVP $E8FB            ; 44 FB E8
    PLB                  ; AB
    STY $FB              ; 84 FB
    CPX #$AB             ; E0 AB
    TSB $FF              ; 04 FF
    CMP $FB1020,X        ; DF 20 10 FB
    DEC $A0,X            ; D6 A0
    BVC $02C1            ; 50 F8
    CLD                  ; D8
    STA $00              ; 93 00
    BRK $E0              ; 00 E0
    STY $00,X            ; 94 00
    BRK $D8              ; 00 D8
    STA $00,X            ; 95 00
    SED                  ; F8
    CLD                  ; D8
    LDX $10              ; A6 10
    PHP                  ; 08
    BEQ $0290            ; F0 B5
    BRK $08              ; 00 08
    INX                  ; E8
    LDA $00              ; A5 00
    SED                  ; F8
    INX                  ; E8
    TAY                  ; A8
    BPL $02E9            ; 10 04
    BRK $00              ; 00 00
    BRK $0D              ; 00 0D
    ORA $E0              ; 03 E0
    LDY $0344            ; AC 44 03
    INX                  ; E8
    LDY $FBC4            ; AC C4 FB
    INX                  ; E8
    LDY $FB84            ; AC 84 FB
    CPX #$AC             ; E0 AC
    TSB $FE              ; 04 FE
    CMP $1020,X          ; DD 20 10
    XCE                  ; FB
    CMP $A0,X            ; D5 A0

Bank_6A_Function_03:
    BVC $02FA            ; 50 F8
    CLD                  ; D8
    STA $00              ; 93 00
    BRK $E0              ; 00 E0
    STY $00,X            ; 94 00
    BRK $D8              ; 00 D8
    STA $00,X            ; 95 00
    SED                  ; F8
    CLD                  ; D8
    LDX $10              ; A6 10
    PHP                  ; 08
    BEQ $02C9            ; F0 B5
    BRK $08              ; 00 08
    INX                  ; E8
    LDA $00              ; A5 00
    SED                  ; F8
    INX                  ; E8
    TAY                  ; A8
    BPL $0322            ; 10 04
    BRK $00              ; 00 00
    BRK $0D              ; 00 0D
    ORA $E0              ; 03 E0
    LDA $0344            ; AD 44 03
    INX                  ; E8
    LDA $FBC4            ; AD C4 FB
    INX                  ; E8
    LDA $FB84            ; AD 84 FB
    CPX #$AD             ; E0 AD
    TSB $FF              ; 04 FF
    CMP $FB1020,X        ; DF 20 10 FB
    DEC $A0,X            ; D6 A0
    BVC $0333            ; 50 F8
    CLD                  ; D8
    STA $00              ; 93 00
    BRK $E0              ; 00 E0
    STY $00,X            ; 94 00
    BRK $D8              ; 00 D8
    STA $00,X            ; 95 00
    SED                  ; F8
    CLD                  ; D8
    LDX $10              ; A6 10
    PHP                  ; 08
    BEQ $0302            ; F0 B5
    BRK $08              ; 00 08
    INX                  ; E8
    LDA $00              ; A5 00
    SED                  ; F8
    INX                  ; E8
    TAY                  ; A8
    BPL $035B            ; 10 04
    BRK $00              ; 00 00
    BRK $0D              ; 00 0D
    ORA $E0              ; 03 E0
    LDX $0344            ; AE 44 03
    INX                  ; E8
    LDX $FBC4            ; AE C4 FB
    INX                  ; E8
    LDX $FB84            ; AE 84 FB
    CPX #$AE             ; E0 AE
    TSB $00              ; 04 00
    CPX #$20             ; E0 20
    BPL $036A            ; 10 FA
    DEC $A0,X            ; D6 A0
    BVC $036C            ; 50 F8
    CLD                  ; D8
    STA $00              ; 93 00
    BRK $E0              ; 00 E0
    STY $00,X            ; 94 00
    BRK $D8              ; 00 D8
    STA $00,X            ; 95 00
    SED                  ; F8
    CLD                  ; D8
    LDX $10              ; A6 10
    PHP                  ; 08
    BEQ $033B            ; F0 B5
    BRK $08              ; 00 08
    INX                  ; E8
    LDA $00              ; A5 00
    SED                  ; F8
    INX                  ; E8
    TAY                  ; A8
    BPL $0394            ; 10 04
    BRK $00              ; 00 00
    BRK $05              ; 00 05
    ORA $DD              ; 07 DD
    JSR $0010            ; 20 10 00
    INX                  ; E8
    CPY #$10             ; C0 10
    BEQ $0386            ; F0 E8
    REP #$10             ; C2 10
    BRK $D8              ; 00 D8
    ROL $10              ; 26 10
    BEQ $037E            ; F0 D8
    PLP                  ; 28
    BPL $03AD            ; 10 04
    BRK $00              ; 00 00
    BRK $05              ; 00 05
    ORA $DC              ; 07 DC
    JSR $0010            ; 20 10 00
    INX                  ; E8
    CPY $10              ; C4 10
    BEQ $039F            ; F0 E8
    DEC $10              ; C6 10
    BRK $D8              ; 00 D8
    ROL $10              ; 26 10
    BEQ $0397            ; F0 D8
    PLP                  ; 28
    BPL $03C6            ; 10 04
    BRK $00              ; 00 00
    BRK $05              ; 00 05
    ORA $DD              ; 07 DD
    JSR $0010            ; 20 10 00
    INX                  ; E8
    INY                  ; C8
    BPL $03BF            ; 10 F0
    INX                  ; E8
    PHB                  ; 8B
    BPL $03D3            ; 10 00
    CLD                  ; D8
    ROL $10              ; 26 10
    BEQ $03B0            ; F0 D8
    PLP                  ; 28
    BPL $03DF            ; 10 04
    BRK $00              ; 00 00
    BRK $0C              ; 00 0C
    SBC $CE              ; F3 CE
    LDA $D6F000          ; AF 00 F0 D6
    DEX                  ; CA
    BPL $03EC            ; 10 04
    CPX #$CC             ; E0 CC
    BPL $03E4            ; 10 F8
    PHX                  ; DA
    STA $00              ; 93 00
    BRK $E2              ; 00 E2
    STY $00,X            ; 94 00
    BRK $DA              ; 00 DA
    STA $00,X            ; 95 00
    SED                  ; F8
    CPX #$96             ; E0 96
    BRK $F8              ; 00 F8
    CLD                  ; D8
    STA $00              ; 97 00
    BRK $D8              ; 00 D8
    LDX #$10             ; A2 10
    SED                  ; F8
    BEQ $039E            ; F0 98
    BRK $F8              ; 00 F8
    INX                  ; E8
    STA $E80000,X        ; 9F 00 00 E8
    LDY $10              ; A4 10
    TSB $00              ; 04 00
    BRK $00              ; 00 00
    PHD                  ; 0B
    PEA $CED4            ; F4 D4 CE
    BPL $041C            ; 10 03
    SBC $CC              ; E1 CC
    BPL $0415            ; 10 F8
    STP                  ; DB
    STA $00              ; 93 00
    BRK $E3              ; 00 E3
    STY $00,X            ; 94 00
    BRK $DB              ; 00 DB
    STA $00,X            ; 95 00
    SED                  ; F8
    CPX #$96             ; E0 96
    BRK $F8              ; 00 F8
    CLD                  ; D8
    STA $00              ; 97 00
    BRK $D8              ; 00 D8
    LDX #$10             ; A2 10
    SED                  ; F8
    BEQ $03CF            ; F0 98
    BRK $F8              ; 00 F8
    INX                  ; E8
    STA $E80000,X        ; 9F 00 00 E8
    LDY $10              ; A4 10
    TSB $00              ; 04 00
    BRK $00              ; 00 00
    PHD                  ; 0B
    PEA $E0D4            ; F4 D4 E0
    BPL $044B            ; 10 01
    SEP #$CC             ; E2 CC
    BPL $0446            ; 10 F8
    STP                  ; DB
    STA $00              ; 93 00
    BRK $E3              ; 00 E3
    STY $00,X            ; 94 00
    BRK $DB              ; 00 DB
    STA $00,X            ; 95 00
    SED                  ; F8
    CPX #$96             ; E0 96
    BRK $F8              ; 00 F8
    CLD                  ; D8
    STA $00              ; 97 00
    BRK $D8              ; 00 D8
    LDX #$10             ; A2 10
    SED                  ; F8
    BEQ $0400            ; F0 98
    BRK $F8              ; 00 F8
    INX                  ; E8
    STA $E80000,X        ; 9F 00 00 E8
    LDY $10              ; A4 10
    TSB $00              ; 04 00
    BRK $00              ; 00 00
    PHD                  ; 0B
    PLX                  ; FA
    SBC $E2              ; E3 E2
    BPL $0473            ; 10 F8
    PHX                  ; DA
    STA $00              ; 93 00
    BRK $E2              ; 00 E2
    STY $00,X            ; 94 00
    BRK $DA              ; 00 DA
    STA $00,X            ; 95 00
    ASL $DC              ; 06 DC
    JSR $0810            ; 20 10 08
    CLD                  ; D8
    AND $00              ; 27 00
    PHP                  ; 08
    BEQ $044B            ; F0 BA
    BRK $08              ; 00 08
    INX                  ; E8
    TYX                  ; BB
    BRK $08              ; 00 08
    CPX #$BC             ; E0 BC
    BRK $F8              ; 00 F8
    CLD                  ; D8
    CPX $10              ; E4 10
    SED                  ; F8
    INX                  ; E8
    INC $10              ; E6 10
    TSB $00              ; 04 00
    BRK $00              ; 00 00
    PHD                  ; 0B
    PLX                  ; FA
    SBC $E8              ; E3 E8
    BPL $04A4            ; 10 F8
    PHX                  ; DA
    STA $00              ; 93 00
    BRK $E2              ; 00 E2
    STY $00,X            ; 94 00
    BRK $DA              ; 00 DA
    STA $00,X            ; 95 00
    ASL $DB              ; 06 DB
    JSR $0810            ; 20 10 08
    CLD                  ; D8
    AND $00              ; 27 00
    PHP                  ; 08
    BEQ $047C            ; F0 BA
    BRK $08              ; 00 08
    INX                  ; E8
    TYX                  ; BB
    BRK $08              ; 00 08
    CPX #$BC             ; E0 BC
    BRK $F8              ; 00 F8
    CLD                  ; D8
    CPX $10              ; E4 10
    SED                  ; F8
    INX                  ; E8
    INC $10              ; E6 10
    TSB $00              ; 04 00
    BRK $00              ; 00 00
    ASL                  ; 0A
    SED                  ; F8
    STP                  ; DB
    STA $00              ; 93 00
    BRK $E3              ; 00 E3
    STY $00,X            ; 94 00
    BRK $DB              ; 00 DB
    STA $00,X            ; 95 00
    ASL $DA              ; 06 DA
    JSR $0810            ; 20 10 08
    CLD                  ; D8
    AND $00              ; 27 00
    PHP                  ; 08
    BEQ $04A9            ; F0 BA
    BRK $08              ; 00 08
    INX                  ; E8
    TYX                  ; BB
    BRK $08              ; 00 08
    CPX #$BC             ; E0 BC
    BRK $F8              ; 00 F8
    CLD                  ; D8
    CPX $10              ; E4 10
    SED                  ; F8
    INX                  ; E8
    INC $10              ; E6 10

Bank_6A_Function_05:
    TSB $00              ; 04 00
    BRK $00              ; 00 00
    ASL                  ; 0A
    SED                  ; F8
    PHX                  ; DA
    STA $00              ; 93 00
    BRK $E2              ; 00 E2
    STY $00,X            ; 94 00
    BRK $DA              ; 00 DA
    STA $00,X            ; 95 00
    ASL $DC              ; 06 DC
    JSR $0810            ; 20 10 08
    CLD                  ; D8
    AND $00              ; 27 00
    PHP                  ; 08
    BEQ $04D6            ; F0 BA
    BRK $08              ; 00 08
    INX                  ; E8
    TYX                  ; BB
    BRK $08              ; 00 08
    CPX #$BC             ; E0 BC
    BRK $F8              ; 00 F8
    CLD                  ; D8
    CPX $10              ; E4 10
    SED                  ; F8
    INX                  ; E8
    INC $10              ; E6 10
    TSB $00              ; 04 00
    BRK $00              ; 00 00
    TSB $D1F3            ; 0C F3 D1
    LDA $D9F000          ; AF 00 F0 D9
    DEX                  ; CA
    BPL $053F            ; 10 04
    SBC $CC              ; E3 CC
    BPL $0537            ; 10 F8
    CMP $0093,X          ; DD 93 00
    BRK $E5              ; 00 E5
    STY $00,X            ; 94 00
    BRK $DD              ; 00 DD
    STA $00,X            ; 95 00
    SED                  ; F8
    SBC $96              ; E3 96
    BRK $F8              ; 00 F8
    STP                  ; DB
    STA $00              ; 97 00
    BRK $DB              ; 00 DB
    LDX #$10             ; A2 10
    SED                  ; F8
    SBC $BD              ; F3 BD
    BRK $F8              ; 00 F8
    XBA                  ; EB
    LDX $0000,Y          ; BE 00 00
    XBA                  ; EB
    NOP                  ; EA
    BPL $0567            ; 10 04
    BRK $00              ; 00 00
    BRK $17              ; 00 17
    ASL $C2              ; 06 C2
    LDA $D10600,X        ; BF 00 06 D1
    INC $0600            ; EE 00 06
    CMP #$EF             ; C9 EF
    BRK $07              ; 00 07
    TYX                  ; BB
    INC $0700,X          ; FE 00 07
    CMP $FF              ; C3 FF
    BRK $FF              ; 00 FF
    CMP $00              ; C3 00
    ORA $FF              ; 01 FF
    WAI                  ; CB
    CPX $FE10            ; EC 10 FE
    XCE                  ; FB
    BRL $0388            ; 82 00 FE
    SBC $83              ; F3 83
    BRK $F0              ; 00 F0
    XBA                  ; EB
    STY $00              ; 84 00
    SED                  ; F8
    XBA                  ; EB
    STA $00              ; 85 00
    BRK $EB              ; 00 EB
    STX $00              ; 86 00
    BRK $E3              ; 00 E3
    STA $00              ; 87 00
    BRK $DB              ; 00 DB
    DEY                  ; 88
    BRK $F0              ; 00 F0
    STP                  ; DB
    BRA $05B3            ; 80 10
    BEQ $0570            ; F0 CB
    ASL $00              ; 06 00
    BEQ $057C            ; F0 D3
    PHP                  ; 08
    BRK $F8              ; 00 F8
    CMP $17              ; D3 17
    BRK $F8              ; 00 F8
    WAI                  ; CB
    ORA $00              ; 07 00
    SED                  ; F8
    CMP $0A              ; C3 0A
    BRK $EA              ; 00 EA
    CPX #$0B             ; E0 0B
    RTI                  ; 40
    SBC $E0              ; F2 E0
    TSB $EA40            ; 0C 40 EA
    BNE $05C2            ; D0 00
    BVC $05C8            ; 50 04
    BRK $00              ; 00 00
    BRK $16              ; 00 16
    ASL $C2              ; 06 C2
    ORA $01              ; 01 01
    ASL $C9              ; 06 C9
    COP $01              ; 02 01
    ORA $BB              ; 07 BB
    INC $0700,X          ; FE 00 07
    CMP $FF              ; C3 FF
    BRK $FF              ; 00 FF
    CMP $00              ; C3 00
    ORA $FF              ; 01 FF
    WAI                  ; CB
    CPX $FE10            ; EC 10 FE
    XCE                  ; FB
    BRL $03E5            ; 82 00 FE
    SBC $83              ; F3 83
    BRK $F0              ; 00 F0
    XBA                  ; EB
    STY $00              ; 84 00
    SED                  ; F8
    XBA                  ; EB
    STA $00              ; 85 00
    BRK $EB              ; 00 EB
    STX $00              ; 86 00
    BRK $E3              ; 00 E3
    STA $00              ; 87 00
    BRK $DB              ; 00 DB
    DEY                  ; 88
    BRK $F0              ; 00 F0
    STP                  ; DB
    BRA $0610            ; 80 10

Bank_6A_Function_06:
    BEQ $05CD            ; F0 CB
    ASL $00              ; 06 00
    BEQ $05D9            ; F0 D3
    PHP                  ; 08
    BRK $F8              ; 00 F8
    CMP $17              ; D3 17
    BRK $F8              ; 00 F8
    WAI                  ; CB
    ORA $00              ; 07 00
    SED                  ; F8
    CMP $0A              ; C3 0A
    BRK $E9              ; 00 E9
    SBC $0B              ; E3 0B
    RTI                  ; 40
    SBC $E3              ; F1 E3
    TSB $E940            ; 0C 40 E9
    CMP $00              ; D3 00
    BVC $0625            ; 50 04
    BRK $00              ; 00 00
    BRK $16              ; 00 16
    ASL $BD              ; 06 BD
    ORA $01              ; 01 01
    ASL $C4              ; 06 C4
    COP $01              ; 02 01
    ORA $BB              ; 07 BB
    INC $0700,X          ; FE 00 07
    CMP $FF              ; C3 FF
    BRK $FF              ; 00 FF
    CMP $00              ; C3 00
    ORA $FF              ; 01 FF
    WAI                  ; CB
    CPX $FE10            ; EC 10 FE
    XCE                  ; FB
    BRL $0442            ; 82 00 FE
    SBC $83              ; F3 83
    BRK $F0              ; 00 F0
    XBA                  ; EB
    STY $00              ; 84 00
    SED                  ; F8
    XBA                  ; EB
    STA $00              ; 85 00
    BRK $EB              ; 00 EB
    STX $00              ; 86 00
    BRK $E3              ; 00 E3
    STA $00              ; 87 00
    BRK $DB              ; 00 DB
    DEY                  ; 88
    BRK $F0              ; 00 F0
    STP                  ; DB
    BRA $066D            ; 80 10
    BEQ $062A            ; F0 CB
    ASL $00              ; 06 00
    BEQ $0636            ; F0 D3
    PHP                  ; 08
    BRK $F8              ; 00 F8
    CMP $17              ; D3 17
    BRK $F8              ; 00 F8
    WAI                  ; CB
    ORA $00              ; 07 00
    SED                  ; F8
    CMP $0A              ; C3 0A
    BRK $E8              ; 00 E8
    CPX $0B              ; E4 0B
    RTI                  ; 40
    BEQ $065B            ; F0 E4
    TSB $E840            ; 0C 40 E8
    PEI $00              ; D4 00
    BVC $0628            ; 50 AA
    ASL $F5              ; 06 F5
    SBC $30F506          ; EF 06 F5 30
    PHP                  ; 08
    SBC $49,X            ; F5 49
    PHP                  ; 08
    SBC $8A,X            ; F5 8A
    PHP                  ; 08
    SBC $33,X            ; F5 33
    ORA #$F5             ; 09 F5
    STY $F509            ; 8C 09 F5
    AND $0A,X            ; 35 0A
    SBC $6E,X            ; F5 6E
    ASL                  ; 0A
    SBC $2F,X            ; F5 2F
    PHD                  ; 0B
    SBC $FC,X            ; F5 FC
    TSB $F9F5            ; 0C F5 F9
    ORA $1EF5            ; 0D F5 1E
    ASL $DFF5            ; 0E F5 DF
    ASL $48F5            ; 0E F5 48
    ORA $0400F5          ; 0F F5 00 04
    BRK $FF              ; 00 FF
    ORA $04              ; 01 04
    BRK $00              ; 00 00
    COP $05              ; 02 05
    BRK $01              ; 00 01
    ORA $04              ; 03 04
    BRK $01              ; 00 01
    TSB $05              ; 04 05
    BRK $01              ; 00 01
    ORA $04              ; 05 04
    BRK $00              ; 00 00
    ASL $05              ; 06 05
    BRK $FF              ; 00 FF
    ORA $04              ; 07 04
    BRK $FF              ; 00 FF
    BRK $05              ; 00 05
    BRK $FF              ; 00 FF
    ORA $04              ; 01 04
    BRK $00              ; 00 00
    COP $05              ; 02 05
    BRK $01              ; 00 01
    ORA $04              ; 03 04
    BRK $01              ; 00 01
    TSB $05              ; 04 05
    BRK $01              ; 00 01
    ORA $04              ; 05 04
    BRK $00              ; 00 00
    ASL $05              ; 06 05
    BRK $FF              ; 00 FF
    ORA $04              ; 07 04
    BRK $FF              ; 00 FF
    BRK $05              ; 00 05
    BRK $FF              ; 00 FF
    SBC $000401,X        ; FF 01 04 00
    BRK $02              ; 00 02
    ORA $00              ; 05 00
    ORA $03              ; 01 03
    TSB $00              ; 04 00
    ORA $04              ; 01 04
    ORA $00              ; 05 00
    ORA $05              ; 01 05

Bank_6A_Function_07:
    TSB $00              ; 04 00
    BRK $06              ; 00 06
    COP $00              ; 02 00
    BRK $07              ; 00 07
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    COP $00              ; 02 00
    BRK $01              ; 00 01
    ORA $00              ; 01 00
    BRK $02              ; 00 02
    COP $00              ; 02 00
    BRK $03              ; 00 03
    ORA $00              ; 01 00
    BRK $04              ; 00 04
    COP $00              ; 02 00
    BRK $05              ; 00 05
    ORA $00              ; 01 00
    BRK $06              ; 00 06
    COP $00              ; 02 00
    BRK $07              ; 00 07
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    COP $00              ; 02 00
    BRK $01              ; 00 01
    ORA $00              ; 01 00
    BRK $02              ; 00 02
    COP $00              ; 02 00
    SBC $000103,X        ; FF 03 01 00
    SBC $000204,X        ; FF 04 02 00
    INC $0105,X          ; FE 05 01
    BRK $FE              ; 00 FE
    ASL $02              ; 06 02
    BRK $FE              ; 00 FE
    ORA $01              ; 07 01
    BRK $FF              ; 00 FF
    BRK $02              ; 00 02
    BRK $FF              ; 00 FF
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    COP $02              ; 02 02
    BRK $01              ; 00 01
    ORA $01              ; 03 01
    BRK $02              ; 00 02
    TSB $04              ; 04 04
    BRK $02              ; 00 02
    TSB $04              ; 04 04
    BRK $03              ; 00 03
    TSB $04              ; 04 04
    BRK $04              ; 00 04
    TSB $04              ; 04 04
    BRK $03              ; 00 03
    TSB $04              ; 04 04
    BRK $02              ; 00 02
    TSB $04              ; 04 04
    BRK $02              ; 00 02
    TSB $04              ; 04 04
    BRK $01              ; 00 01
    ORA $01              ; 05 01
    BRK $01              ; 00 01
    ASL $02              ; 06 02
    BRK $01              ; 00 01
    ORA $01              ; 07 01
    BRK $01              ; 00 01
    BRK $02              ; 00 02
    BRK $01              ; 00 01
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    COP $02              ; 02 02
    BRK $01              ; 00 01
    ORA $01              ; 03 01
    BRK $00              ; 00 00
    TSB $02              ; 04 02
    BRK $01              ; 00 01
    ORA $01              ; 05 01
    BRK $00              ; 00 00
    ASL $02              ; 06 02
    BRK $00              ; 00 00
    ORA $01              ; 07 01
    BRK $00              ; 00 00
    BRK $02              ; 00 02
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $FF              ; 00 FF
    COP $02              ; 02 02
    BRK $FF              ; 00 FF
    ORA $01              ; 03 01
    BRK $FF              ; 00 FF
    TSB $02              ; 04 02
    BRK $FE              ; 00 FE
    ORA $01              ; 05 01
    ORA $FE              ; 01 FE
    ASL $02              ; 06 02
    BRK $FE              ; 00 FE
    ORA $01              ; 07 01
    ORA $FD              ; 01 FD
    BRK $02              ; 00 02
    BRK $FD              ; 00 FD
    ORA $01              ; 01 01
    ORA $FC              ; 01 FC
    ORA #$02             ; 09 02
    ORA $FC              ; 01 FC
    ASL                  ; 0A
    COP $01              ; 02 01
    JSR ($020B,X)        ; FC 0B 02
    COP $FD              ; 02 FD
    TSB $0202            ; 0C 02 02
    SBC $0208,X          ; FD 08 02
    COP $FE              ; 02 FE
    ORA $0302            ; 0D 02 03
    INC $0208,X          ; FE 08 02
    ORA $FF              ; 03 FF
    ASL $0302            ; 0E 02 03
    SBC $04020F,X        ; FF 0F 02 04
    BRK $10              ; 00 10
    COP $04              ; 02 04
    ORA $0F              ; 01 0F
    COP $04              ; 02 04
    COP $0E              ; 02 0E
    COP $05              ; 02 05
    ORA $08              ; 03 08
    COP $05              ; 02 05
    TSB $0D              ; 04 0D

Bank_6A_Function_08:
    COP $04              ; 02 04
    ASL $11              ; 06 11
    COP $04              ; 02 04
    PHP                  ; 08
    ORA $02              ; 12 02
    TSB $05              ; 04 05
    ORA $02              ; 13 02
    ORA $04              ; 03 04
    TRB $02              ; 14 02
    ORA $02              ; 03 02
    ORA $02,X            ; 15 02
    ORA $01              ; 03 01
    ORA $02,X            ; 15 02
    ORA $00              ; 03 00
    TRB $02              ; 14 02
    ORA $FF              ; 03 FF
    ORA $04              ; 13 04
    ORA $FD              ; 03 FD
    ORA $04              ; 12 04
    ORA $FA              ; 03 FA
    ORA $04              ; 11 04
    ORA $F7              ; 03 F7
    ORA $030A            ; 0D 0A 03
    INC $FF,X            ; F6 FF
    ASL $0B,X            ; 16 0B
    BRK $05              ; 00 05
    ASL $08,X            ; 16 08
    BRK $04              ; 00 04
    ASL $07,X            ; 16 07
    BRK $03              ; 00 03
    ASL $07,X            ; 16 07
    BRK $02              ; 00 02
    ASL $07,X            ; 16 07
    BRK $01              ; 00 01
    ASL $01,X            ; 16 01
    BRK $00              ; 00 00
    SBC $000316,X        ; FF 16 03 00
    COP $17              ; 02 17
    COP $00              ; 02 00
    ORA $18              ; 03 18
    ORA $00              ; 03 00
    COP $19              ; 02 19
    ORA $00              ; 03 00
    ORA $1A              ; 01 1A
    ORA $00              ; 03 00
    ORA $1B              ; 01 1B
    COP $00              ; 02 00
    BRK $1C              ; 00 1C
    ORA $00              ; 03 00
    SBC $00031C,X        ; FF 1C 03 00
    SBC $00031D,X        ; FF 1D 03 00
    INC $021D,X          ; FE 1D 02
    BRK $FD              ; 00 FD
    TRB $0003            ; 1C 03 00
    INC $031B,X          ; FE 1B 03
    BRK $FF              ; 00 FF
    INC                  ; 1A
    ORA $00              ; 03 00
    SBC $000219,X        ; FF 19 02 00
    BRK $18              ; 00 18
    ORA $00              ; 03 00
    ORA $17              ; 01 17
    ORA $00              ; 03 00
    ORA $FF              ; 01 FF
    ASL $01,X            ; 16 01
    BRK $00              ; 00 00
    ORA $01              ; 17 01
    SBC $011800,X        ; FF 00 18 01
    INC $19FF,X          ; FE FF 19
    ORA $FE              ; 01 FE
    INC $011B,X          ; FE 1B 01
    SBC $1CFD,X          ; FD FD 1C
    ORA $FC              ; 01 FC
    SBC $011D,X          ; FD 1D 01
    JSR ($1CFC,X)        ; FC FC 1C
    ORA $FD              ; 01 FD
    SBC $011B,X          ; FD 1B 01
    INC $1AFE,X          ; FE FE 1A
    ORA $FE              ; 01 FE
    SBC $FF0119,X        ; FF 19 01 FF
    SBC $FF0118,X        ; FF 18 01 FF
    BRK $16              ; 00 16
    ORA $00              ; 01 00
    BRK $17              ; 00 17
    ORA $FF              ; 01 FF
    BRK $18              ; 00 18
    ORA $FE              ; 01 FE
    ORA $19              ; 01 19
    ORA $FE              ; 01 FE
    COP $1B              ; 02 1B
    ORA $FD              ; 01 FD
    ORA $1C              ; 03 1C
    ORA $FC              ; 01 FC
    TSB $1D              ; 04 1D
    ORA $FC              ; 01 FC
    ASL $1C              ; 06 1C
    ORA $FD              ; 01 FD
    ORA $1B              ; 05 1B
    ORA $FE              ; 01 FE
    TSB $1A              ; 04 1A
    ORA $FE              ; 01 FE
    ORA $1A              ; 03 1A
    ORA $FF              ; 01 FF
    COP $1A              ; 02 1A
    ORA $00              ; 01 00
    ORA $1A              ; 01 1A
    COP $00              ; 02 00
    BRK $1A              ; 00 1A
    ORA $00              ; 01 00
    SBC $FF021E,X        ; FF 1E 02 FF
    INC $021E,X          ; FE 1E 02
    INC $1EFD,X          ; FE FD 1E
    COP $FE              ; 02 FE
    JSR ($021E,X)        ; FC 1E 02

Bank_6A_Function_09:
    SBC $1FFD,X          ; FD FD 1F
    COP $FD              ; 02 FD
    INC $021F,X          ; FE 1F 02
    JSR ($1FFF,X)        ; FC FF 1F
    COP $FD              ; 02 FD
    INC $0220,X          ; FE 20 02
    SBC $20FE,X          ; FD FE 20
    COP $FE              ; 02 FE
    SBC $0221,X          ; FD 21 02
    INC $21FD,X          ; FE FD 21
    COP $FF              ; 02 FF
    JSR ($0221,X)        ; FC 21 02
    SBC $0221FC,X        ; FF FC 21 02
    BRK $FB              ; 00 FB
    AND $02              ; 21 02
    SBC $0221FB,X        ; FF FB 21 02
    BRK $FA              ; 00 FA
    AND $0A              ; 21 0A
    BRK $FA              ; 00 FA
    SBC $04091A,X        ; FF 1A 09 04
    ORA $1A              ; 05 1A
    PHP                  ; 08
    TSB $04              ; 04 04
    INC                  ; 1A
    ORA $03              ; 07 03
    ORA $1A              ; 03 1A
    TSB $03              ; 04 03
    COP $1E              ; 02 1E
    TSB $02              ; 04 02
    ORA $22              ; 01 22
    COP $02              ; 02 02
    BRK $1F              ; 00 1F
    COP $02              ; 02 02
    BRK $23              ; 00 23
    COP $02              ; 02 02
    SBC $020224,X        ; FF 24 02 02
    SBC $020225,X        ; FF 25 02 02
    SBC $010226,X        ; FF 26 02 01
    INC $0227,X          ; FE 27 02
    ORA $FE              ; 01 FE
    JSL $FE0102          ; 22 02 01 FE
    ORA $FC0102,X        ; 1F 02 01 FC
    AND $02              ; 23 02
    ORA $FC              ; 01 FC
    BIT $02              ; 24 02
    ORA $FC              ; 01 FC
    AND $02              ; 25 02
    ORA $FA              ; 01 FA
    ROL $02              ; 26 02
    ORA $FA              ; 01 FA
    AND $02              ; 27 02
    ORA $FA              ; 01 FA
    JSL $FA0102          ; 22 02 01 FA
    ORA $FA0102,X        ; 1F 02 01 FA
    AND $02              ; 23 02
    ORA $FA              ; 01 FA
    SBC $000D1E,X        ; FF 1E 0D 00
    ORA #$1E             ; 09 1E
    ORA $01              ; 05 01
    ORA $1F              ; 07 1F
    TSB $01              ; 04 01
    TSB $23              ; 04 23
    TSB $01              ; 04 01
    COP $24              ; 02 24
    ORA $01              ; 05 01
    ORA $25              ; 01 25
    TSB $00              ; 04 00
    BRK $27              ; 00 27
    COP $00              ; 02 00
    SBC $000227,X        ; FF 27 02 00
    SBC $000222,X        ; FF 22 02 00
    INC $0222,X          ; FE 22 02
    BRK $FE              ; 00 FE
    ORA $FF0002,X        ; 1F 02 00 FF
    ORA $FF0002,X        ; 1F 02 00 FF
    AND $02              ; 23 02
    BRK $00              ; 00 00
    AND $02              ; 23 02
    BRK $00              ; 00 00
    BIT $02              ; 24 02
    BRK $01              ; 00 01
    BIT $02              ; 24 02
    BRK $01              ; 00 01
    AND $02              ; 25 02
    BRK $02              ; 00 02
    AND $02              ; 25 02
    BRK $02              ; 00 02
    ROL $02              ; 26 02
    BRK $01              ; 00 01
    ROL $02              ; 26 02
    BRK $01              ; 00 01
    AND $02              ; 27 02
    BRK $00              ; 00 00
    AND $02              ; 27 02
    BRK $00              ; 00 00
    JSL $FF0002          ; 22 02 00 FF
    JSL $FF0002          ; 22 02 00 FF
    ORA $FE0002,X        ; 1F 02 00 FE
    ORA $FE0002,X        ; 1F 02 00 FE
    AND $02              ; 23 02
    BRK $FF              ; 00 FF
    AND $02              ; 23 02
    BRK $FF              ; 00 FF
    BIT $02              ; 24 02
    BRK $00              ; 00 00

Bank_6A_Function_0A:
    BIT $02              ; 24 02
    BRK $00              ; 00 00
    AND $02              ; 25 02
    BRK $01              ; 00 01
    AND $02              ; 25 02
    BRK $01              ; 00 01
    ROL $02              ; 26 02
    BRK $03              ; 00 03
    ROL $02              ; 26 02
    BRK $03              ; 00 03
    PLP                  ; 28
    TSB $00              ; 04 00
    COP $28              ; 02 28
    ORA $01              ; 03 01
    SBC $010328,X        ; FF 28 03 01
    SBC $01030C,X        ; FF 0C 03 01
    INC $030C,X          ; FE 0C 03
    ORA $FD              ; 01 FD
    PHP                  ; 08
    ORA $01              ; 03 01
    JSR ($0308,X)        ; FC 08 03
    ORA $FA              ; 01 FA
    PHP                  ; 08
    AND $01              ; 33 01
    SED                  ; F8
    SBC $01051E,X        ; FF 1E 05 01
    ASL $1E              ; 06 1E
    ORA $01              ; 05 01
    ORA $1E              ; 05 1E
    ORA $01              ; 05 01
    TSB $1F              ; 04 1F
    ORA $01              ; 05 01
    ORA $23              ; 03 23
    ORA $01              ; 05 01
    COP $24              ; 02 24
    ORA $01              ; 05 01
    ORA $25              ; 01 25
    TSB $01              ; 04 01
    BRK $26              ; 00 26
    TSB $01              ; 04 01
    SBC $010427,X        ; FF 27 04 01
    INC $0422,X          ; FE 22 04
    ORA $FD              ; 01 FD
    JSL $FC0104          ; 22 04 01 FC
    JSL $FB0104          ; 22 04 01 FB
    JSL $FA0104          ; 22 04 01 FA
    JSL $F90104          ; 22 04 01 F9
    SBC $FE031C,X        ; FF 1C 03 FE
    SBC $FE031C,X        ; FF 1C 03 FE
    SBC $FD031D,X        ; FF 1D 03 FD
    INC $021D,X          ; FE 1D 02
    SBC $1CFD,X          ; FD FD 1C
    ORA $FD              ; 03 FD
    INC $031B,X          ; FE 1B 03
    SBC $1AFF,X          ; FD FF 1A
    ORA $FD              ; 03 FD
    SBC $FE0219,X        ; FF 19 02 FE
    BRK $18              ; 00 18
    ORA $FD              ; 03 FD
    ORA $17              ; 01 17
    ORA $FD              ; 03 FD
    COP $16              ; 02 16
    ORA $FD              ; 03 FD
    ORA $17              ; 03 17
    COP $FD              ; 02 FD
    TSB $18              ; 04 18
    ORA $FD              ; 03 FD
    ORA $19              ; 03 19
    ORA $FD              ; 03 FD
    COP $1A              ; 02 1A
    ORA $FD              ; 03 FD
    ORA $1B              ; 01 1B
    COP $FE              ; 02 FE
    BRK $1C              ; 00 1C
    ORA $FE              ; 03 FE
    SBC $FE031C,X        ; FF 1C 03 FE
    SBC $FD031D,X        ; FF 1D 03 FD
    INC $021D,X          ; FE 1D 02
    SBC $1CFD,X          ; FD FD 1C
    ORA $FD              ; 03 FD
    INC $031B,X          ; FE 1B 03
    SBC $1AFF,X          ; FD FF 1A
    ORA $FD              ; 03 FD
    SBC $FE0219,X        ; FF 19 02 FE
    BRK $18              ; 00 18
    ORA $FD              ; 03 FD
    ORA $17              ; 01 17
    ORA $FD              ; 03 FD
    COP $16              ; 02 16
    ORA $FD              ; 03 FD
    ORA $17              ; 03 17
    COP $FD              ; 02 FD
    TSB $18              ; 04 18
    ORA $FD              ; 03 FD
    ORA $19              ; 03 19
    ORA $FD              ; 03 FD
    COP $1A              ; 02 1A
    ORA $FD              ; 03 FD
    ORA $1B              ; 01 1B
    COP $FE              ; 02 FE
    BRK $1C              ; 00 1C
    ORA $FE              ; 03 FE
    SBC $FE031C,X        ; FF 1C 03 FE
    SBC $FD031D,X        ; FF 1D 03 FD
    INC $021D,X          ; FE 1D 02
    SBC $1CFD,X          ; FD FD 1C
    ORA $FD              ; 03 FD
    INC $031B,X          ; FE 1B 03
    SBC $1AFF,X          ; FD FF 1A
    ORA $FD              ; 03 FD
    SBC $FE0219,X        ; FF 19 02 FE
    BRK $18              ; 00 18
    ORA $FD              ; 03 FD
    ORA $17              ; 01 17
    ORA $FD              ; 03 FD
    COP $16              ; 02 16
    ORA $FD              ; 03 FD
    ORA $17              ; 03 17
    COP $FD              ; 02 FD
    TSB $18              ; 04 18
    ORA $FD              ; 03 FD
    ORA $19              ; 03 19
    ORA $FD              ; 03 FD
    COP $1A              ; 02 1A
    ORA $FD              ; 03 FD
    ORA $1B              ; 01 1B
    COP $FE              ; 02 FE
    BRK $FF              ; 00 FF
    ORA $02              ; 01 02
    ORA $07              ; 01 07
    ORA $02              ; 01 02
    ORA $07              ; 01 07
    ORA $02              ; 01 02
    ORA $06              ; 01 06
    ORA $02              ; 01 02
    ORA $06              ; 01 06
    ORA $02              ; 01 02
    ORA $05              ; 01 05
    ORA $02              ; 01 02
    ORA $05              ; 01 05
    ORA $02              ; 01 02
    ORA $04              ; 01 04
    ORA #$02             ; 09 02
    ORA $04              ; 01 04
    ORA #$02             ; 09 02
    ORA $03              ; 01 03
    ASL                  ; 0A
    COP $01              ; 02 01
    ORA $0A              ; 03 0A
    COP $01              ; 02 01
    COP $0B              ; 02 0B
    COP $01              ; 02 01
    COP $0B              ; 02 0B
    COP $01              ; 02 01
    COP $0C              ; 02 0C
    COP $01              ; 02 01
    ORA $0C              ; 01 0C
    COP $01              ; 02 01
    ORA $08              ; 01 08
    COP $01              ; 02 01
    COP $08              ; 02 08
    COP $01              ; 02 01
    ORA $0D              ; 01 0D
    COP $00              ; 02 00
    ORA $11              ; 01 11
    COP $01              ; 02 01
    BRK $12              ; 00 12
    COP $00              ; 02 00
    BRK $11              ; 00 11
    COP $01              ; 02 01
    BRK $0D              ; 00 0D
    COP $00              ; 02 00
    SBC $010208,X        ; FF 08 02 01
    SBC $01020E,X        ; FF 0E 02 01
    INC $020F,X          ; FE 0F 02
    ORA $FE              ; 01 FE
    BPL $0B97            ; 10 02
    ORA $FD              ; 01 FD
    AND #$02             ; 29 02
    ORA $FE              ; 01 FE
    BPL $0B9F            ; 10 02
    ORA $FE              ; 01 FE
    ORA $FF0102          ; 0F 02 01 FF
    ASL $0102            ; 0E 02 01
    SBC $010208,X        ; FF 08 02 01
    ORA $11              ; 01 11
    COP $01              ; 02 01
    ORA $12              ; 01 12
    COP $01              ; 02 01
    COP $13              ; 02 13
    COP $01              ; 02 01
    COP $14              ; 02 14
    COP $01              ; 02 01
    ORA $15              ; 03 15
    COP $01              ; 02 01
    COP $14              ; 02 14
    COP $01              ; 02 01
    COP $13              ; 02 13
    COP $01              ; 02 01
    ORA $12              ; 01 12
    COP $01              ; 02 01
    ORA $11              ; 01 11
    COP $01              ; 02 01
    BRK $0D              ; 00 0D
    COP $01              ; 02 01
    SBC $010208,X        ; FF 08 02 01
    SBC $01020E,X        ; FF 0E 02 01
    INC $020F,X          ; FE 0F 02
    ORA $FE              ; 01 FE
    BPL $0BE3            ; 10 02
    ORA $FD              ; 01 FD
    AND #$02             ; 29 02
    ORA $FE              ; 01 FE
    BPL $0BEB            ; 10 02
    ORA $FE              ; 01 FE
    ORA $FF0102          ; 0F 02 01 FF
    ASL $0102            ; 0E 02 01
    SBC $010208,X        ; FF 08 02 01
    ORA $11              ; 01 11
    COP $01              ; 02 01
    ORA $12              ; 01 12
    COP $01              ; 02 01
    COP $13              ; 02 13

Bank_6A_Function_0C:
    COP $01              ; 02 01
    COP $14              ; 02 14
    COP $01              ; 02 01
    ORA $15              ; 03 15
    COP $01              ; 02 01
    COP $14              ; 02 14
    COP $01              ; 02 01
    COP $13              ; 02 13
    COP $01              ; 02 01
    ORA $12              ; 01 12
    COP $01              ; 02 01
    ORA $11              ; 01 11
    COP $01              ; 02 01
    BRK $0D              ; 00 0D
    COP $01              ; 02 01
    SBC $010208,X        ; FF 08 02 01
    SBC $01020E,X        ; FF 0E 02 01
    INC $020F,X          ; FE 0F 02
    ORA $FE              ; 01 FE
    BPL $0C2F            ; 10 02
    ORA $FD              ; 01 FD
    AND #$02             ; 29 02
    ORA $FE              ; 01 FE
    BPL $0C37            ; 10 02
    ORA $FE              ; 01 FE
    ORA $FF0102          ; 0F 02 01 FF
    ASL $0102            ; 0E 02 01
    SBC $010208,X        ; FF 08 02 01
    ORA $11              ; 01 11
    COP $01              ; 02 01
    ORA $12              ; 01 12
    COP $01              ; 02 01
    COP $13              ; 02 13
    COP $01              ; 02 01
    COP $14              ; 02 14
    COP $01              ; 02 01
    ORA $15              ; 03 15
    COP $01              ; 02 01
    COP $14              ; 02 14
    COP $01              ; 02 01
    COP $13              ; 02 13
    COP $01              ; 02 01
    ORA $12              ; 01 12
    COP $01              ; 02 01
    ORA $11              ; 01 11
    COP $01              ; 02 01
    BRK $0D              ; 00 0D
    COP $01              ; 02 01
    SBC $010208,X        ; FF 08 02 01
    SBC $01020E,X        ; FF 0E 02 01
    INC $020F,X          ; FE 0F 02
    ORA $FE              ; 01 FE
    BPL $0C7B            ; 10 02
    ORA $FD              ; 01 FD
    AND #$02             ; 29 02
    ORA $FE              ; 01 FE
    BPL $0C83            ; 10 02
    ORA $FE              ; 01 FE
    ORA $FF0102          ; 0F 02 01 FF
    ASL $0102            ; 0E 02 01
    SBC $010208,X        ; FF 08 02 01
    ORA $11              ; 01 11
    COP $01              ; 02 01
    ORA $12              ; 01 12
    COP $01              ; 02 01
    COP $13              ; 02 13
    COP $01              ; 02 01
    ORA $14              ; 03 14
    COP $01              ; 02 01
    TSB $15              ; 04 15
    COP $01              ; 02 01
    ORA $14              ; 05 14
    COP $01              ; 02 01
    TSB $13              ; 04 13
    COP $01              ; 02 01
    ORA $12              ; 03 12
    COP $01              ; 02 01
    COP $11              ; 02 11
    COP $01              ; 02 01
    ORA $0D              ; 01 0D
    COP $01              ; 02 01
    SBC $010208,X        ; FF 08 02 01
    INC $020E,X          ; FE 0E 02
    ORA $FD              ; 01 FD
    ORA $FC0102          ; 0F 02 01 FC
    BPL $0CC7            ; 10 02
    ORA $FB              ; 01 FB
    AND #$02             ; 29 02
    ORA $FB              ; 01 FB
    BPL $0CCF            ; 10 02
    ORA $FA              ; 01 FA
    ORA $FA0102          ; 0F 02 01 FA
    ASL $0102            ; 0E 02 01
    SBC $0208,Y          ; F9 08 02
    ORA $F9              ; 01 F9
    ORA $02              ; 11 02
    ORA $F8              ; 01 F8
    ORA $02              ; 12 02
    ORA $F8              ; 01 F8
    ORA $02              ; 13 02
    ORA $F7              ; 01 F7
    TRB $02              ; 14 02
    ORA $F7              ; 01 F7
    ORA $02,X            ; 15 02
    ORA $F6              ; 01 F6
    TRB $02              ; 14 02
    ORA $F6              ; 01 F6
    ORA $02              ; 13 02
    ORA $F6              ; 01 F6
    ORA $02              ; 12 02
    ORA $F6              ; 01 F6
    SBC $000401,X        ; FF 01 04 00
    BRK $02              ; 00 02
    ORA $00              ; 05 00
    COP $03              ; 02 03
    TSB $00              ; 04 00
    ORA $04              ; 03 04
    ORA $FF              ; 05 FF
    COP $05              ; 02 05
    TSB $FF              ; 04 FF
    BRK $06              ; 00 06
    ORA $FF              ; 05 FF
    SBC $000407,X        ; FF 07 04 00
    SBC $000500,X        ; FF 00 05 00
    SBC $000401,X        ; FF 01 04 00
    BRK $02              ; 00 02
    ORA $00              ; 05 00
    COP $03              ; 02 03
    TSB $01              ; 04 01
    ORA $04              ; 03 04
    ORA $01              ; 05 01
    COP $05              ; 02 05
    TSB $01              ; 04 01
    BRK $06              ; 00 06
    ORA $00              ; 05 00
    SBC $000407,X        ; FF 07 04 00
    SBC $000500,X        ; FF 00 05 00
    SBC $000401,X        ; FF 01 04 00
    BRK $02              ; 00 02
    ORA $00              ; 05 00
    COP $03              ; 02 03
    TSB $FF              ; 04 FF
    ORA $04              ; 03 04
    ORA $FF              ; 05 FF
    COP $05              ; 02 05
    TSB $FF              ; 04 FF
    BRK $06              ; 00 06
    ORA $00              ; 05 00
    SBC $000407,X        ; FF 07 04 00
    SBC $000500,X        ; FF 00 05 00
    SBC $000401,X        ; FF 01 04 00
    BRK $02              ; 00 02
    ORA $00              ; 05 00
    COP $03              ; 02 03
    TSB $01              ; 04 01
    ORA $04              ; 03 04
    ORA $01              ; 05 01
    COP $05              ; 02 05
    TSB $01              ; 04 01
    BRK $06              ; 00 06
    ORA $00              ; 05 00
    SBC $000407,X        ; FF 07 04 00
    SBC $000500,X        ; FF 00 05 00
    SBC $000401,X        ; FF 01 04 00
    BRK $02              ; 00 02
    ORA $00              ; 05 00
    ORA $03              ; 01 03
    TSB $00              ; 04 00
    ORA $04              ; 01 04
    ORA $00              ; 05 00
    ORA $05              ; 01 05
    TSB $00              ; 04 00
    BRK $06              ; 00 06
    ORA $00              ; 05 00
    SBC $000407,X        ; FF 07 04 00
    SBC $000500,X        ; FF 00 05 00
    SBC $000401,X        ; FF 01 04 00
    BRK $02              ; 00 02
    ORA $00              ; 05 00
    ORA $03              ; 01 03
    TSB $00              ; 04 00
    ORA $04              ; 03 04
    ORA $FF              ; 05 FF
    TSB $04              ; 04 04
    TSB $FF              ; 04 FF
    TSB $04              ; 04 04
    ORA $FF              ; 05 FF
    ORA $04              ; 03 04
    TSB $FE              ; 04 FE
    COP $04              ; 02 04
    ORA $FE              ; 05 FE
    ORA $05              ; 01 05
    ORA $FE              ; 03 FE
    BRK $06              ; 00 06
    ORA $FF              ; 03 FF
    SBC $FF0307,X        ; FF 07 03 FF
    SBC $000300,X        ; FF 00 03 00
    INC $0301,X          ; FE 01 03
    BRK $FD              ; 00 FD
    ORA #$03             ; 09 03
    ORA $FC              ; 01 FC
    ASL                  ; 0A
    ORA $02              ; 03 02
    PLX                  ; FA
    PHD                  ; 0B
    ORA $03              ; 03 03
    XCE                  ; FB
    TSB $0303            ; 0C 03 03
    SBC $0208,X          ; FD 08 02
    TSB $FE              ; 04 FE
    ORA $02              ; 11 02
    TSB $FF              ; 04 FF
    ORA $02              ; 12 02
    ORA $FF              ; 03 FF
    ORA $02              ; 13 02
    ORA $FF              ; 03 FF
    TRB $02              ; 14 02
    COP $00              ; 02 00
    ORA $02,X            ; 15 02
    ORA $00              ; 01 00
    SBC $FF0315,X        ; FF 15 03 FF
    BRK $15              ; 00 15
    ORA $03              ; 03 03

Bank_6A_Function_0E:
    BRK $15              ; 00 15
    ORA $FE              ; 03 FE
    BRK $15              ; 00 15
    ORA $04              ; 03 04
    BRK $15              ; 00 15
    ORA $FA              ; 03 FA
    BRK $15              ; 00 15
    ORA $01              ; 03 01
    BRK $15              ; 00 15
    ORA $FE              ; 03 FE
    BRK $15              ; 00 15
    ORA $04              ; 03 04
    BRK $15              ; 00 15
    ORA $FF              ; 03 FF
    BRK $FF              ; 00 FF
    ORA $01,X            ; 15 01
    BRK $00              ; 00 00
    ORA $03,X            ; 15 03
    BRK $01              ; 00 01
    ORA $01,X            ; 15 01
    BRK $00              ; 00 00
    ORA $03,X            ; 15 03
    BRK $01              ; 00 01
    ORA $01,X            ; 15 01
    BRK $00              ; 00 00
    ORA $03,X            ; 15 03
    BRK $01              ; 00 01
    ORA $01,X            ; 15 01
    BRK $00              ; 00 00
    ORA $03,X            ; 15 03
    BRK $01              ; 00 01
    ORA $01,X            ; 15 01
    BRK $00              ; 00 00
    ORA $03,X            ; 15 03
    BRK $02              ; 00 02
    ORA $01,X            ; 15 01
    BRK $00              ; 00 00
    ORA $03,X            ; 15 03
    BRK $02              ; 00 02
    ORA $01,X            ; 15 01
    BRK $00              ; 00 00
    ORA $03,X            ; 15 03
    BRK $02              ; 00 02
    ORA $01,X            ; 15 01
    BRK $00              ; 00 00
    ORA $03,X            ; 15 03
    BRK $02              ; 00 02
    ORA $01,X            ; 15 01
    BRK $00              ; 00 00
    ORA $03,X            ; 15 03
    BRK $03              ; 00 03
    ORA $01,X            ; 15 01
    BRK $00              ; 00 00
    ORA $03,X            ; 15 03
    BRK $03              ; 00 03
    ORA $01,X            ; 15 01
    BRK $00              ; 00 00
    ORA $03,X            ; 15 03
    BRK $03              ; 00 03
    ORA $01,X            ; 15 01
    BRK $00              ; 00 00
    ORA $03,X            ; 15 03
    BRK $03              ; 00 03
    ORA $01,X            ; 15 01
    BRK $00              ; 00 00
    ORA $03,X            ; 15 03
    BRK $04              ; 00 04
    ORA $01,X            ; 15 01
    BRK $00              ; 00 00
    ORA $03,X            ; 15 03
    BRK $04              ; 00 04
    ORA $01,X            ; 15 01
    BRK $00              ; 00 00
    ORA $03,X            ; 15 03
    BRK $04              ; 00 04
    ORA $01,X            ; 15 01
    BRK $00              ; 00 00
    ORA $03,X            ; 15 03
    BRK $04              ; 00 04
    ORA $01,X            ; 15 01
    BRK $00              ; 00 00
    ORA $03,X            ; 15 03
    BRK $04              ; 00 04
    ORA $01,X            ; 15 01
    BRK $00              ; 00 00
    ORA $03,X            ; 15 03
    BRK $04              ; 00 04
    ORA $01,X            ; 15 01
    BRK $00              ; 00 00
    ORA $03,X            ; 15 03
    BRK $04              ; 00 04
    ORA $01,X            ; 15 01
    BRK $00              ; 00 00
    ORA $03,X            ; 15 03
    BRK $04              ; 00 04
    ORA $01,X            ; 15 01
    BRK $00              ; 00 00
    ORA $03,X            ; 15 03
    BRK $04              ; 00 04
    ORA $01,X            ; 15 01
    BRK $00              ; 00 00
    ORA $03,X            ; 15 03
    BRK $04              ; 00 04
    ORA $01,X            ; 15 01
    BRK $00              ; 00 00
    ORA $03,X            ; 15 03
    BRK $04              ; 00 04
    ORA $01,X            ; 15 01
    BRK $00              ; 00 00
    ORA $03,X            ; 15 03
    BRK $04              ; 00 04
    SBC $010716,X        ; FF 16 07 01
    ASL $16              ; 06 16
    ORA $01              ; 07 01
    ORA $16              ; 05 16
    ASL $01              ; 06 01
    TSB $16              ; 04 16
    TSB $01              ; 04 01
    ORA $17              ; 03 17
    COP $01              ; 02 01
    COP $18              ; 02 18
    ORA $01              ; 03 01
    COP $19              ; 02 19
    ORA $01              ; 03 01
    ORA $1A              ; 01 1A
    ORA $01              ; 03 01
    ORA $1B              ; 01 1B

Bank_6A_Function_0F:
    COP $01              ; 02 01
    BRK $1C              ; 00 1C
    ORA $00              ; 03 00
    SBC $00031C,X        ; FF 1C 03 00
    SBC $00031D,X        ; FF 1D 03 00
    INC $021D,X          ; FE 1D 02
    BRK $FD              ; 00 FD
    TRB $0003            ; 1C 03 00
    INC $031B,X          ; FE 1B 03
    BRK $FF              ; 00 FF
    INC                  ; 1A
    ORA $00              ; 03 00
    SBC $000219,X        ; FF 19 02 00
    ORA $18              ; 01 18
    ORA $00              ; 03 00
    COP $17              ; 02 17
    ORA $00              ; 03 00
    ORA $17              ; 01 17
    ORA $00              ; 03 00
    ORA $18              ; 01 18
    ORA $00              ; 03 00
    BRK $19              ; 00 19
    ORA $00              ; 05 00
    INC $061A,X          ; FE 1A 06
    BRK $FD              ; 00 FD
    TCS                  ; 1B
    ORA $00              ; 05 00
    JSR ($051C,X)        ; FC 1C 05
    BRK $FA              ; 00 FA
    TRB $0005            ; 1C 05 00
    SBC $2AFF,Y          ; F9 FF 2A
    ORA $00              ; 03 00
    SBC $000323,X        ; FF 23 03 00
    ORA $24              ; 01 24
    ORA $00              ; 03 00
    ORA $25              ; 01 25
    ORA $00              ; 03 00
    ORA $26              ; 01 26
    ORA $00              ; 03 00
    BRK $27              ; 00 27
    ORA $00              ; 03 00
    SBC $000322,X        ; FF 22 03 00
    SBC $0FE6FF,X        ; FF FF E6 0F
    SBC $07,X            ; F5 07
    BPL $0F60            ; 10 F5
    PLP                  ; 28
    BPL $0F63            ; 10 F5
    EOR #$10             ; 49 10
    SBC $6A,X            ; F5 6A
    BPL $0F69            ; 10 F5
    PHB                  ; 8B
    BPL $0F6C            ; 10 F5
    LDY $F510            ; AC 10 F5
    CMP $F510            ; CD 10 F5
    INC $F510            ; EE 10 F5
    STA $C4F511          ; 8F 11 F5 C4
    ORA $F5              ; 11 F5
    ORA #$12             ; 09 12
    SBC $62,X            ; F5 62
    ORA $F5              ; 12 F5
    CMP $12              ; C1 12
    SBC $62,X            ; F5 62
    ORA $F5              ; 13 F5
    ORA $14              ; 03 14
    SBC $A4,X            ; F5 A4
    TRB $F5              ; 14 F5
    EOR $15              ; 45 15
    SBC $DC,X            ; F5 DC
    ORA $F5,X            ; 15 F5
    ADC $16              ; 73 16
    SBC $22,X            ; F5 22
    ORA $F5              ; 17 F5
    CMP $17              ; D1 17
    SBC $80,X            ; F5 80
    CLC                  ; 18
    SBC $15,X            ; F5 15
    ORA $AAF5,Y          ; 19 F5 AA
    ORA $3FF5,Y          ; 19 F5 3F
    INC                  ; 1A
    SBC $BC,X            ; F5 BC
    INC                  ; 1A
    SBC $39,X            ; F5 39
    TCS                  ; 1B
    SBC $CE,X            ; F5 CE
    TCS                  ; 1B
    SBC $33,X            ; F5 33
    TRB $98F5            ; 1C F5 98
    TRB $EDF5            ; 1C F5 ED
    TRB $28F5            ; 1C F5 28
    ORA $63F5,X          ; 1D F5 63
    ORA $A4F5,X          ; 1D F5 A4
    ORA $01F5,X          ; 1D F5 01
    ASL $46F5,X          ; 1E F5 46
    ASL $8BF5,X          ; 1E F5 8B
    ASL $D0F5,X          ; 1E F5 D0
    ASL $15F5,X          ; 1E F5 15
    ORA $1F5AF5,X        ; 1F F5 5A 1F
    SBC $B3,X            ; F5 B3
    ORA $2054F5,X        ; 1F F5 54 20
    SBC $10,X            ; F5 10
    BRK $12              ; 00 12
    BRK $71              ; 00 71
    BVS $0FF8            ; 70 0B
    LDA $A5              ; A5 A5
    LDY $0D              ; A4 0D
    SBC $1BA51A,X        ; FF 1A A5 1B
    LDA $04              ; A5 04
    BRK $E8              ; 00 E8
    COP $60              ; 02 60
    SED                  ; F8
    INX                  ; E8
    COP $20              ; 02 20
    BRK $D8              ; 00 D8
    BRK $70              ; 00 70
    BEQ $0FDD            ; F0 D8
    BRK $30              ; 00 30
    BPL $1009            ; 10 00
    ORA $00              ; 12 00
    TCD                  ; 5B
    LDY $5C              ; A4 5C
    LDY $7A              ; A4 7A
    LDY $0D              ; A4 0D
    SBC $6A0000,X        ; FF 00 00 6A
    LDY $04              ; A4 04
    BRK $EB              ; 00 EB
    COP $60              ; 02 60
    SED                  ; F8
    XBA                  ; EB
    COP $20              ; 02 20
    BRK $DB              ; 00 DB
    BRK $70              ; 00 70
    BEQ $1001            ; F0 DB
    BRK $30              ; 00 30
    BPL $102A            ; 10 00
    ORA $00              ; 12 00
    STA $A4              ; 87 A4
    DEY                  ; 88
    LDY $A5              ; A4 A5
    LDY $0D              ; A4 0D
    SBC $961141,X        ; FF 41 11 96
    LDY $04              ; A4 04
    BRK $E9              ; 00 E9
    COP $60              ; 02 60
    SED                  ; F8
    SBC #$02             ; E9 02
    JSR $D900            ; 20 00 D9
    BRK $70              ; 00 70
    BEQ $1020            ; F0 D9
    BRK $30              ; 00 30
    BPL $104B            ; 10 00
    ORA $00              ; 12 00
    LDY $A4,X            ; B4 A4
    LDA $A4,X            ; B5 A4
    LDA $A4              ; A5 A4
    ORA $C4FF            ; 0D FF C4
    LDY $96              ; A4 96
    LDY $04              ; A4 04
    BRK $EA              ; 00 EA
    COP $60              ; 02 60
    SED                  ; F8
    NOP                  ; EA
    COP $20              ; 02 20
    BRK $DA              ; 00 DA
    BRK $70              ; 00 70
    BEQ $1042            ; F0 DA
    BRK $30              ; 00 30
    BPL $106C            ; 10 00
    ORA $00              ; 12 00
    CMP $A4              ; D2 A4
    CMP $A4              ; D3 A4
    LDA $A4              ; A5 A4
    ORA $E0FF            ; 0D FF E0
    LDY $E1              ; A4 E1
    LDY $04              ; A4 04
    BRK $EB              ; 00 EB
    COP $60              ; 02 60
    SED                  ; F8
    XBA                  ; EB
    COP $20              ; 02 20
    BRK $DB              ; 00 DB
    BRK $70              ; 00 70
    BEQ $1064            ; F0 DB
    BRK $30              ; 00 30
    BPL $108D            ; 10 00
    ORA $00              ; 12 00
    BEQ $1035            ; F0 A4
    SBC $A4              ; F1 A4
    LDA $A4              ; A5 A4
    ORA $FFFF            ; 0D FF FF
    LDY $00              ; A4 00
    LDA $04              ; A5 04
    BRK $EA              ; 00 EA
    COP $60              ; 02 60
    SED                  ; F8
    NOP                  ; EA
    COP $20              ; 02 20
    BRK $DA              ; 00 DA
    BRK $70              ; 00 70
    BEQ $1084            ; F0 DA
    BRK $30              ; 00 30
    BPL $10AE            ; 10 00
    ORA $00              ; 12 00
    ASL $0FA5            ; 0E A5 0F
    LDA $A5              ; A5 A5
    LDY $0D              ; A4 0D
    SBC $1FA51E,X        ; FF 1E A5 1F
    LDA $04              ; A5 04
    BRK $E9              ; 00 E9
    COP $60              ; 02 60
    SED                  ; F8
    SBC #$02             ; E9 02
    JSR $D900            ; 20 00 D9
    BRK $70              ; 00 70
    BEQ $10A4            ; F0 D9
    BRK $30              ; 00 30
    BPL $10CF            ; 10 00
    ORA $00              ; 12 00
    BRK $00              ; 00 00
    INC $A5A4,X          ; FE A4 A5
    LDY $0D              ; A4 0D
    SBC $0DA50C,X        ; FF 0C A5 0D
    LDA $04              ; A5 04
    BRK $E8              ; 00 E8
    COP $60              ; 02 60
    SED                  ; F8
    INX                  ; E8
    COP $20              ; 02 20
    BRK $D8              ; 00 D8
    BRK $70              ; 00 70
    BEQ $10C4            ; F0 D8
    BRK $30              ; 00 30
    RTI                  ; 40
    BRK $1E              ; 00 1E
    BRK $47              ; 00 47
    LDY $48              ; A4 48
    LDY $62              ; A4 62
    LDY $63              ; A4 63
    LDY $45              ; A4 45
    LDY $46              ; A4 46
    LDY $41              ; A4 41
    LDY $42              ; A4 42
    LDY $60              ; A4 60
    LDY $61              ; A4 61
    LDY $43              ; A4 43
    LDY $44              ; A4 44
    LDY $65              ; A4 65
    LDY $7E              ; A4 7E
    LDY $7D              ; A4 7D
    LDY $6E              ; A4 6E
    LDY $56              ; A4 56
    LDY $57              ; A4 57
    LDY $71              ; A4 71
    LDY $72              ; A4 72
    LDY $54              ; A4 54
    LDY $55              ; A4 55
    LDY $51              ; A4 51
    LDY $52              ; A4 52
    LDY $6F              ; A4 6F
    LDY $70              ; A4 70
    LDY $53              ; A4 53
    LDY $4C              ; A4 4C
    LDY $5F              ; A4 5F
    BIT #$5F             ; 89 5F
    LDY $18              ; A4 18
    BRK $E6              ; 00 E6
    TSB $F860            ; 0C 60 F8
    INC $0C              ; E6 0C
    JSR $D600            ; 20 00 D6
    BRK $70              ; 00 70
    BEQ $1113            ; F0 D6
    BRK $30              ; 00 30
    BRK $EE              ; 00 EE
    COP $70              ; 02 70
    BEQ $1133            ; F0 EE
    COP $30              ; 02 30
    BRK $DE              ; 00 DE
    TSB $70              ; 04 70
    BEQ $112B            ; F0 DE
    TSB $30              ; 04 30
    PHP                  ; 08
    BEQ $115F            ; F0 0D
    RTS                  ; 60
    BEQ $1145            ; F0 F0
    ORA $1020            ; 0D 20 10
    BEQ $1168            ; F0 0E
    RTS                  ; 60
    INX                  ; E8
    BEQ $116C            ; F0 0E
    JSR $E810            ; 20 10 E8
    ORA $E8E860          ; 0F 60 E8 E8
    ORA $E01020          ; 0F 20 10 E0
    TRB $E860            ; 1C 60 E8
    CPX #$1C             ; E0 1C
    JSR $E018            ; 20 18 E0
    ORA $E060,X          ; 1D 60 E0
    CPX #$1D             ; E0 1D
    JSR $D010            ; 20 10 D0
    ASL $70              ; 06 70
    CPX #$D0             ; E0 D0
    ASL $30              ; 06 30
    BRK $E0              ; 00 E0
    PHP                  ; 08
    BVS $1174            ; 70 F0
    CPX #$08             ; E0 08
    BMI $1188            ; 30 00
    BNE $1194            ; D0 0A
    BVS $117C            ; 70 F0
    BNE $1198            ; D0 0A
    BMI $11A4            ; 30 14
    BRK $12              ; 00 12
    BRK $D0              ; 00 D0
    LDY $D1              ; A4 D1
    LDY $79              ; A4 79
    LDY $EF              ; A4 EF
    LDY $EE              ; A4 EE
    LDY $0B              ; A4 0B
    SBC $DFA4DE,X        ; FF DE A4 DF
    LDY $08              ; A4 08
    BRK $EF              ; 00 EF
    COP $60              ; 02 60
    SED                  ; F8
    SBC $002002          ; EF 02 20 00
    SBC $03              ; E7 03
    RTS                  ; 60
    SED                  ; F8
    SBC $03              ; E7 03
    JSR $E708            ; 20 08 E7
    TSB $60              ; 04 60
    BEQ $11A1            ; F0 E7
    TSB $20              ; 04 20
    BRK $D7              ; 00 D7
    BRK $70              ; 00 70
    BEQ $1199            ; F0 D7
    BRK $30              ; 00 30
    TRB $1400            ; 1C 00 14
    BRK $EC              ; 00 EC
    LDY $ED              ; A4 ED
    LDY $CE              ; A4 CE
    LDY $CF              ; A4 CF
    LDY $C1              ; A4 C1
    LDY $C0              ; A4 C0
    LDY $3D              ; A4 3D
    LDY $09              ; A4 09
    SBC $FDA4FC,X        ; FF FC A4 FD
    LDY $DC              ; A4 DC
    LDY $DD              ; A4 DD
    LDY $0A              ; A4 0A
    BPL $11B7            ; 10 D4
    TSB $60              ; 04 60
    INX                  ; E8
    PEI $04              ; D4 04
    JSR $DC10            ; 20 10 DC
    ORA $60              ; 05 60
    INX                  ; E8
    JMP $2005            ; DC 05 20
    BRK $F4              ; 00 F4
    ASL $60              ; 06 60
    SED                  ; F8
    PEA $2006            ; F4 06 20
    BRK $E4              ; 00 E4
    BRK $70              ; 00 70
    BEQ $11E3            ; F0 E4
    BRK $30              ; 00 30
    BRK $D4              ; 00 D4
    COP $70              ; 02 70
    BEQ $11DB            ; F0 D4
    COP $30              ; 02 30
    JSR $1400            ; 20 00 14
    BRK $5D              ; 00 5D
    LDY $5E              ; A4 5E
    LDY $3F              ; A4 3F
    LDY $40              ; A4 40
    LDY $4E              ; A4 4E
    LDY $4D              ; A4 4D
    LDY $3E              ; A4 3E
    LDY $7C              ; A4 7C
    LDY $7B              ; A4 7B
    LDY $07              ; A4 07
    SBC $6CA46B,X        ; FF 6B A4 6C
    LDY $4F              ; A4 4F
    LDY $50              ; A4 50
    LDY $0E              ; A4 0E
    BPL $1205            ; 10 D9
    TSB $60              ; 04 60
    INX                  ; E8
    CMP $2004,Y          ; D9 04 20
    CLC                  ; 18
    CMP $6005,Y          ; D9 05 60
    CPX #$D9             ; E0 D9
    ORA $20              ; 05 20
    BPL $120D            ; 10 D1
    ASL $60              ; 06 60
    INX                  ; E8
    CMP $06              ; D1 06
    JSR $F100            ; 20 00 F1
    ORA $60              ; 07 60
    SED                  ; F8
    SBC $07              ; F1 07
    JSR $F108            ; 20 08 F1
    PHP                  ; 08
    JSR $F1F0            ; 20 F0 F1
    PHP                  ; 08
    JSR $E100            ; 20 00 E1
    BRK $70              ; 00 70
    BEQ $1239            ; F0 E1
    BRK $30              ; 00 30
    BRK $D1              ; 00 D1
    COP $70              ; 02 70
    BEQ $1231            ; F0 D1
    COP $30              ; 02 30
    ROL $00              ; 26 00
    ASL $00,X            ; 16 00
    ADC $70              ; 71 70
    STA $A4              ; 93 A4
    LDA $A4              ; B2 A4
    LDA $A4              ; B3 A4
    STY $A4,X            ; 94 A4
    STA $A4,X            ; 95 A4
    STY $A4              ; 84 A4
    ADC $A4,X            ; 75 A4
    BCS $121C            ; B0 A4
    LDA $A4              ; B1 A4
    ASL $FF              ; 06 FF
    LDA $A4              ; A1 A4
    LDX #$A4             ; A2 A4
    REP #$A4             ; C2 A4
    CMP $A4              ; C3 A4
    LDA $A4              ; A3 A4
    LDY $A4              ; A4 A4
    ASL $F800            ; 0E 00 F8
    ASL $60              ; 06 60
    SED                  ; F8
    SED                  ; F8
    ASL $20              ; 06 20
    BRK $F0              ; 00 F0
    ORA $60              ; 07 60
    SED                  ; F8
    BEQ $129F            ; F0 07
    JSR $F010            ; 20 10 F0
    PHP                  ; 08
    RTS                  ; 60
    INX                  ; E8
    BEQ $12A8            ; F0 08
    JSR $F008            ; 20 08 F0
    ORA #$60             ; 09 60
    BEQ $1297            ; F0 F0
    ORA #$20             ; 09 20
    BPL $127C            ; 10 D1
    BRK $70              ; 00 70
    CPX #$D1             ; E0 D1
    BRK $30              ; 00 30
    BRK $E0              ; 00 E0
    COP $70              ; 02 70
    BEQ $1297            ; F0 E0
    COP $30              ; 02 30
    BRK $D0              ; 00 D0
    TSB $70              ; 04 70
    BEQ $128F            ; F0 D0
    TSB $30              ; 04 30
    RTI                  ; 40
    BRK $1E              ; 00 1E
    BRK $47              ; 00 47
    LDY $48              ; A4 48
    LDY $62              ; A4 62
    LDY $63              ; A4 63
    LDY $45              ; A4 45
    LDY $46              ; A4 46
    LDY $41              ; A4 41
    LDY $42              ; A4 42
    LDY $60              ; A4 60
    LDY $61              ; A4 61
    LDY $43              ; A4 43
    LDY $44              ; A4 44
    LDY $65              ; A4 65
    LDY $7E              ; A4 7E
    LDY $7D              ; A4 7D
    LDY $6E              ; A4 6E
    LDY $56              ; A4 56
    LDY $57              ; A4 57
    LDY $71              ; A4 71
    LDY $72              ; A4 72
    LDY $54              ; A4 54
    LDY $55              ; A4 55
    LDY $51              ; A4 51
    LDY $52              ; A4 52
    LDY $6F              ; A4 6F
    LDY $70              ; A4 70
    LDY $53              ; A4 53
    LDY $4C              ; A4 4C
    LDY $5F              ; A4 5F
    BIT #$5F             ; 89 5F

Bank_6A_Function_13:
    LDY $18              ; A4 18
    BRK $E5              ; 00 E5
    TSB $F860            ; 0C 60 F8
    SBC $0C              ; E5 0C
    JSR $D500            ; 20 00 D5
    BRK $70              ; 00 70
    BEQ $12E5            ; F0 D5
    BRK $30              ; 00 30
    BRK $ED              ; 00 ED
    COP $70              ; 02 70
    BEQ $1305            ; F0 ED
    COP $30              ; 02 30
    BRK $DD              ; 00 DD
    TSB $70              ; 04 70
    BEQ $12FD            ; F0 DD
    TSB $30              ; 04 30
    PHP                  ; 08
    BEQ $1332            ; F0 0D
    RTS                  ; 60
    BEQ $1318            ; F0 F0
    ORA $1020            ; 0D 20 10
    BEQ $133B            ; F0 0E
    RTS                  ; 60
    INX                  ; E8
    BEQ $133F            ; F0 0E
    JSR $E810            ; 20 10 E8
    ORA $E8E860          ; 0F 60 E8 E8
    ORA $E11020          ; 0F 20 10 E1
    TRB $E860            ; 1C 60 E8
    SBC $1C              ; E1 1C
    JSR $E018            ; 20 18 E0
    ORA $E060,X          ; 1D 60 E0
    CPX #$1D             ; E0 1D
    JSR $D110            ; 20 10 D1
    ASL $70              ; 06 70
    CPX #$D1             ; E0 D1
    ASL $30              ; 06 30
    BRK $E0              ; 00 E0
    PHP                  ; 08
    BVS $1347            ; 70 F0
    CPX #$08             ; E0 08
    BMI $135B            ; 30 00
    CMP $0A              ; D1 0A
    BVS $134F            ; 70 F0
    CMP $0A              ; D1 0A
    BMI $13A3            ; 30 40
    BRK $1E              ; 00 1E
    BRK $47              ; 00 47
    LDY $48              ; A4 48
    LDY $62              ; A4 62
    LDY $63              ; A4 63
    LDY $45              ; A4 45
    LDY $46              ; A4 46
    LDY $41              ; A4 41
    LDY $42              ; A4 42
    LDY $60              ; A4 60
    LDY $61              ; A4 61
    LDY $43              ; A4 43
    LDY $44              ; A4 44
    LDY $65              ; A4 65
    LDY $7E              ; A4 7E
    LDY $7D              ; A4 7D
    LDY $6E              ; A4 6E
    LDY $56              ; A4 56
    LDY $57              ; A4 57
    LDY $71              ; A4 71
    LDY $72              ; A4 72
    LDY $54              ; A4 54
    LDY $55              ; A4 55
    LDY $51              ; A4 51
    LDY $52              ; A4 52
    LDY $6F              ; A4 6F
    LDY $70              ; A4 70
    LDY $53              ; A4 53
    LDY $4C              ; A4 4C
    LDY $5F              ; A4 5F
    BIT #$5F             ; 89 5F
    LDY $18              ; A4 18
    BRK $E7              ; 00 E7
    TSB $F860            ; 0C 60 F8
    SBC $0C              ; E7 0C
    JSR $D700            ; 20 00 D7
    BRK $70              ; 00 70
    BEQ $1388            ; F0 D7
    BRK $30              ; 00 30
    ORA $EF              ; 01 EF
    COP $70              ; 02 70
    SBC $3002EF          ; EF EF 02 30
    ORA $DF              ; 01 DF
    TSB $70              ; 04 70
    SBC $3004DF          ; EF DF 04 30
    PHP                  ; 08
    BEQ $13D3            ; F0 0D
    RTS                  ; 60
    BEQ $13B9            ; F0 F0
    ORA $1020            ; 0D 20 10
    BEQ $13DC            ; F0 0E
    RTS                  ; 60
    INX                  ; E8
    BEQ $13E0            ; F0 0E
    JSR $E810            ; 20 10 E8
    ORA $E8E860          ; 0F 60 E8 E8
    ORA $DF1020          ; 0F 20 10 DF
    TRB $E860            ; 1C 60 E8
    CMP $18201C,X        ; DF 1C 20 18
    CMP $E0601D,X        ; DF 1D 60 E0
    CMP $10201D,X        ; DF 1D 20 10
    CMP $E07006          ; CF 06 70 E0
    CMP $003006          ; CF 06 30 00
    CPX #$08             ; E0 08
    BVS $13E8            ; 70 F0
    CPX #$08             ; E0 08
    BMI $13FC            ; 30 00
    BNE $1408            ; D0 0A
    BVS $13F0            ; 70 F0

Bank_6A_Function_14:
    BNE $140C            ; D0 0A
    BMI $1444            ; 30 40
    BRK $1E              ; 00 1E
    BRK $47              ; 00 47
    LDY $48              ; A4 48
    LDY $62              ; A4 62
    LDY $63              ; A4 63
    LDY $45              ; A4 45
    LDY $46              ; A4 46
    LDY $41              ; A4 41
    LDY $42              ; A4 42
    LDY $60              ; A4 60
    LDY $61              ; A4 61
    LDY $43              ; A4 43
    LDY $44              ; A4 44
    LDY $65              ; A4 65
    LDY $7E              ; A4 7E
    LDY $7D              ; A4 7D
    LDY $6E              ; A4 6E
    LDY $56              ; A4 56
    LDY $57              ; A4 57
    LDY $71              ; A4 71
    LDY $72              ; A4 72
    LDY $54              ; A4 54
    LDY $55              ; A4 55
    LDY $51              ; A4 51
    LDY $52              ; A4 52
    LDY $6F              ; A4 6F
    LDY $70              ; A4 70
    LDY $53              ; A4 53
    LDY $4C              ; A4 4C
    LDY $5F              ; A4 5F
    BIT #$5F             ; 89 5F
    LDY $18              ; A4 18
    BRK $E8              ; 00 E8
    TSB $F860            ; 0C 60 F8
    INX                  ; E8
    TSB $0020            ; 0C 20 00
    CLD                  ; D8
    BRK $70              ; 00 70
    BEQ $142A            ; F0 D8
    BRK $30              ; 00 30
    ORA $F0              ; 01 F0
    COP $70              ; 02 70
    SBC $3002F0          ; EF F0 02 30
    ORA $E0              ; 01 E0
    TSB $70              ; 04 70
    SBC $3004E0          ; EF E0 04 30
    PHP                  ; 08
    SBC $F0600D          ; EF 0D 60 F0
    SBC $10200D          ; EF 0D 20 10
    SBC $E8600E          ; EF 0E 60 E8
    SBC $10200E          ; EF 0E 20 10
    SBC $0F              ; E7 0F
    RTS                  ; 60
    INX                  ; E8
    INX                  ; E8
    ORA $DE1020          ; 0F 20 10 DE
    TRB $E860            ; 1C 60 E8
    DEC $201C,X          ; DE 1C 20
    CLC                  ; 18
    DEC $601D,X          ; DE 1D 60
    CPX #$DE             ; E0 DE
    ORA $1020,X          ; 1D 20 10
    DEC $7006            ; CE 06 70
    CPX #$CE             ; E0 CE
    ASL $30              ; 06 30
    BRK $DF              ; 00 DF
    PHP                  ; 08
    BVS $1489            ; 70 F0
    CMP $003008,X        ; DF 08 30 00
    BNE $14A9            ; D0 0A
    BVS $1491            ; 70 F0
    BNE $14AD            ; D0 0A
    BMI $14E5            ; 30 40
    BRK $1E              ; 00 1E
    BRK $47              ; 00 47
    LDY $48              ; A4 48
    LDY $62              ; A4 62
    LDY $63              ; A4 63
    LDY $45              ; A4 45
    LDY $46              ; A4 46
    LDY $41              ; A4 41
    LDY $42              ; A4 42
    LDY $60              ; A4 60
    LDY $61              ; A4 61
    LDY $43              ; A4 43
    LDY $44              ; A4 44
    LDY $65              ; A4 65
    LDY $7E              ; A4 7E
    LDY $7D              ; A4 7D
    LDY $6E              ; A4 6E
    LDY $56              ; A4 56
    LDY $57              ; A4 57
    LDY $71              ; A4 71
    LDY $72              ; A4 72
    LDY $54              ; A4 54
    LDY $55              ; A4 55
    LDY $51              ; A4 51
    LDY $52              ; A4 52
    LDY $6F              ; A4 6F
    LDY $70              ; A4 70
    LDY $53              ; A4 53
    LDY $4C              ; A4 4C
    LDY $5F              ; A4 5F
    BIT #$5F             ; 89 5F
    LDY $18              ; A4 18
    BRK $E9              ; 00 E9
    TSB $F860            ; 0C 60 F8
    SBC #$0C             ; E9 0C
    JSR $D900            ; 20 00 D9
    BRK $70              ; 00 70
    BEQ $14CC            ; F0 D9
    BRK $30              ; 00 30
    COP $F1              ; 02 F1
    COP $70              ; 02 70
    INC $02F1            ; EE F1 02
    BMI $1500            ; 30 02
    SBC $04              ; E1 04

Bank_6A_Function_15:
    BVS $14F0            ; 70 EE
    SBC $04              ; E1 04
    BMI $150E            ; 30 08
    INC $600D            ; EE 0D 60
    BEQ $14F9            ; F0 EE
    ORA $1020            ; 0D 20 10
    INC $600E            ; EE 0E 60
    INX                  ; E8
    INC $200E            ; EE 0E 20
    BPL $14FD            ; 10 E6
    ORA $E6E860          ; 0F 60 E8 E6
    ORA $DE1020          ; 0F 20 10 DE
    TRB $E860            ; 1C 60 E8
    DEC $201C,X          ; DE 1C 20
    CLC                  ; 18
    DEC $601D,X          ; DE 1D 60
    CPX #$DE             ; E0 DE
    ORA $1020,X          ; 1D 20 10
    DEC $7006            ; CE 06 70
    CPX #$CE             ; E0 CE
    ASL $30              ; 06 30
    BRK $DE              ; 00 DE
    PHP                  ; 08
    BVS $152A            ; 70 F0
    DEC $3008,X          ; DE 08 30
    BRK $D0              ; 00 D0
    ASL                  ; 0A
    BVS $1532            ; 70 F0
    BNE $154E            ; D0 0A
    BMI $1584            ; 30 3E
    BRK $1D              ; 00 1D
    BRK $47              ; 00 47
    LDY $48              ; A4 48
    LDY $62              ; A4 62
    LDY $63              ; A4 63
    LDY $45              ; A4 45
    LDY $46              ; A4 46
    LDY $39              ; A4 39
    LDY $3A              ; A4 3A
    LDY $60              ; A4 60
    LDY $61              ; A4 61
    LDY $3B              ; A4 3B
    LDY $3C              ; A4 3C
    LDY $64              ; A4 64
    LDY $65              ; A4 65
    LDY $7E              ; A4 7E
    LDY $7D              ; A4 7D
    LDY $56              ; A4 56
    LDY $57              ; A4 57
    LDY $71              ; A4 71
    LDY $72              ; A4 72
    LDY $54              ; A4 54
    LDY $55              ; A4 55
    LDY $49              ; A4 49
    LDY $4A              ; A4 4A
    LDY $6F              ; A4 6F
    LDY $70              ; A4 70
    LDY $4B              ; A4 4B
    LDY $4C              ; A4 4C
    LDY $6E              ; A4 6E
    LDY $16              ; A4 16
    JSR $0CD5            ; 20 D5 0C
    RTS                  ; 60
    CLD                  ; D8
    CMP $0C,X            ; D5 0C
    JSR $E400            ; 20 00 E4
    ORA $F860            ; 0D 60 F8
    CPX $0D              ; E4 0D
    JSR $D400            ; 20 00 D4
    BRK $70              ; 00 70
    BEQ $156E            ; F0 D4
    BRK $30              ; 00 30
    ORA $ED              ; 01 ED
    COP $70              ; 02 70
    SBC $3002ED          ; EF ED 02 30
    ORA $DD              ; 01 DD
    TSB $70              ; 04 70
    SBC $3004DD          ; EF DD 04 30
    PHP                  ; 08
    SBC $0E              ; F1 0E
    RTS                  ; 60
    BEQ $15A3            ; F0 F1
    ASL $1020            ; 0E 20 10
    SBC $0F              ; F1 0F
    RTS                  ; 60
    INX                  ; E8
    SBC $0F              ; F1 0F
    JSR $E910            ; 20 10 E9
    TRB $E860            ; 1C 60 E8
    SBC #$1C             ; E9 1C
    JSR $D110            ; 20 10 D1
    ASL $70              ; 06 70
    CPX #$D1             ; E0 D1
    ASL $30              ; 06 30
    BRK $E1              ; 00 E1
    PHP                  ; 08
    BVS $15C1            ; 70 F0
    SBC $08              ; E1 08
    BMI $15D5            ; 30 00
    CMP $0A              ; D1 0A
    BVS $15C9            ; 70 F0
    CMP $0A              ; D1 0A
    BMI $161B            ; 30 3E
    BRK $1D              ; 00 1D
    BRK $47              ; 00 47
    LDY $48              ; A4 48
    LDY $62              ; A4 62
    LDY $63              ; A4 63
    LDY $45              ; A4 45
    LDY $46              ; A4 46
    LDY $39              ; A4 39
    LDY $3A              ; A4 3A
    LDY $60              ; A4 60
    LDY $61              ; A4 61
    LDY $3B              ; A4 3B
    LDY $3C              ; A4 3C
    LDY $64              ; A4 64
    LDY $65              ; A4 65
    LDY $7E              ; A4 7E
    LDY $7D              ; A4 7D
    LDY $56              ; A4 56
    LDY $57              ; A4 57
    LDY $71              ; A4 71
    LDY $72              ; A4 72
    LDY $54              ; A4 54
    LDY $55              ; A4 55
    LDY $49              ; A4 49
    LDY $4A              ; A4 4A
    LDY $6F              ; A4 6F
    LDY $70              ; A4 70
    LDY $4B              ; A4 4B
    LDY $4C              ; A4 4C
    LDY $6E              ; A4 6E
    LDY $16              ; A4 16
    JSR $0CD6            ; 20 D6 0C
    RTS                  ; 60
    CLD                  ; D8
    DEC $0C,X            ; D6 0C
    JSR $E300            ; 20 00 E3
    ORA $F860            ; 0D 60 F8
    SBC $0D              ; E3 0D
    JSR $D300            ; 20 00 D3
    BRK $70              ; 00 70
    BEQ $1604            ; F0 D3
    BRK $30              ; 00 30
    COP $EC              ; 02 EC
    COP $70              ; 02 70
    INC $02EC            ; EE EC 02
    BMI $163E            ; 30 02
    JMP $7004            ; DC 04 70
    INC $04DC            ; EE DC 04
    BMI $164C            ; 30 08
    SBC $0E              ; F2 0E
    RTS                  ; 60
    BEQ $163B            ; F0 F2
    ASL $1020            ; 0E 20 10
    SBC $0F              ; F2 0F
    RTS                  ; 60
    INX                  ; E8
    SBC $0F              ; F2 0F
    JSR $EA10            ; 20 10 EA
    TRB $E860            ; 1C 60 E8
    NOP                  ; EA
    TRB $1020            ; 1C 20 10
    CMP $06              ; D2 06
    BVS $1640            ; 70 E0
    CMP $06              ; D2 06
    BMI $1664            ; 30 00
    SEP #$08             ; E2 08
    BVS $1658            ; 70 F0
    SEP #$08             ; E2 08
    BMI $166C            ; 30 00
    CMP $0A              ; D2 0A
    BVS $1660            ; 70 F0
    CMP $0A              ; D2 0A
    BMI $16B2            ; 30 3E
    BRK $1D              ; 00 1D
    BRK $47              ; 00 47
    LDY $48              ; A4 48
    LDY $62              ; A4 62
    LDY $63              ; A4 63
    LDY $45              ; A4 45
    LDY $46              ; A4 46
    LDY $60              ; A4 60
    LDY $61              ; A4 61
    LDY $3B              ; A4 3B
    LDY $3C              ; A4 3C
    LDY $06              ; A4 06
    LDA $F7              ; A5 F7
    LDY $E7              ; A4 E7
    LDY $4A              ; A4 4A
    LDY $3A              ; A4 3A
    LDY $65              ; A4 65
    LDY $56              ; A4 56
    LDY $57              ; A4 57
    LDY $71              ; A4 71
    LDY $72              ; A4 72
    LDY $54              ; A4 54
    LDY $55              ; A4 55
    LDY $6F              ; A4 6F
    LDY $70              ; A4 70
    LDY $4B              ; A4 4B
    LDY $4C              ; A4 4C
    LDY $7E              ; A4 7E
    LDY $7D              ; A4 7D
    LDY $6E              ; A4 6E
    LDY $1C              ; A4 1C
    JSR $0AD3            ; 20 D3 0A
    RTS                  ; 60
    CLD                  ; D8
    CMP $0A              ; D3 0A
    JSR $DB18            ; 20 18 DB
    PHD                  ; 0B
    RTS                  ; 60
    CPX #$DB             ; E0 DB
    PHD                  ; 0B
    JSR $D318            ; 20 18 D3
    TSB $E060            ; 0C 60 E0
    CMP $0C              ; D3 0C
    JSR $DB10            ; 20 10 DB
    ORA $E860            ; 0D 60 E8
    STP                  ; DB
    ORA $1020            ; 0D 20 10
    CMP $0E              ; D3 0E
    RTS                  ; 60
    INX                  ; E8
    CMP $0E              ; D3 0E
    JSR $E200            ; 20 00 E2
    ORA $E2F860          ; 0F 60 F8 E2
    ORA $D20020          ; 0F 20 00 D2
    BRK $70              ; 00 70
    BEQ $16BA            ; F0 D2
    BRK $30              ; 00 30
    COP $EA              ; 02 EA
    COP $70              ; 02 70
    INC $02EA            ; EE EA 02
    BMI $16F5            ; 30 02
    PHX                  ; DA
    TSB $70              ; 04 70
    INC $04DA            ; EE DA 04
    BMI $1703            ; 30 08
    SBC $1A              ; F3 1A
    RTS                  ; 60
    BEQ $16F3            ; F0 F3

Bank_6A_Function_17:
    INC                  ; 1A
    JSR $F310            ; 20 10 F3
    TCS                  ; 1B
    RTS                  ; 60
    INX                  ; E8
    SBC $1B              ; F3 1B
    JSR $EB10            ; 20 10 EB
    TRB $E860            ; 1C 60 E8
    XBA                  ; EB
    TRB $0020            ; 1C 20 00
    SBC $06              ; E3 06
    BVS $1707            ; 70 F0
    SBC $06              ; E3 06
    BMI $171B            ; 30 00
    CMP $08              ; D3 08
    BVS $170F            ; 70 F0
    CMP $08              ; D3 08
    BMI $1761            ; 30 3E
    BRK $1D              ; 00 1D
    BRK $47              ; 00 47
    LDY $48              ; A4 48
    LDY $62              ; A4 62
    LDY $63              ; A4 63
    LDY $45              ; A4 45
    LDY $46              ; A4 46
    LDY $60              ; A4 60
    LDY $61              ; A4 61
    LDY $3B              ; A4 3B
    LDY $3C              ; A4 3C
    LDY $06              ; A4 06
    LDA $F7              ; A5 F7
    LDY $E7              ; A4 E7
    LDY $4A              ; A4 4A
    LDY $3A              ; A4 3A
    LDY $65              ; A4 65
    LDY $56              ; A4 56
    LDY $57              ; A4 57
    LDY $71              ; A4 71
    LDY $72              ; A4 72
    LDY $54              ; A4 54
    LDY $55              ; A4 55
    LDY $6F              ; A4 6F
    LDY $70              ; A4 70
    LDY $4B              ; A4 4B
    LDY $4C              ; A4 4C
    LDY $7E              ; A4 7E
    LDY $7D              ; A4 7D
    LDY $6E              ; A4 6E
    LDY $1C              ; A4 1C
    JSR $0AD3            ; 20 D3 0A
    RTS                  ; 60
    CLD                  ; D8
    CMP $0A              ; D3 0A
    JSR $DB18            ; 20 18 DB
    PHD                  ; 0B
    RTS                  ; 60
    CPX #$DB             ; E0 DB
    PHD                  ; 0B
    JSR $D318            ; 20 18 D3
    TSB $E060            ; 0C 60 E0
    CMP $0C              ; D3 0C
    JSR $DB10            ; 20 10 DB
    ORA $E860            ; 0D 60 E8
    STP                  ; DB
    ORA $1020            ; 0D 20 10
    CMP $0E              ; D3 0E
    RTS                  ; 60
    INX                  ; E8
    CMP $0E              ; D3 0E
    JSR $E100            ; 20 00 E1
    ORA $E1F860          ; 0F 60 F8 E1
    ORA $D10020          ; 0F 20 00 D1
    BRK $70              ; 00 70
    BEQ $1768            ; F0 D1
    BRK $30              ; 00 30
    COP $E9              ; 02 E9
    COP $70              ; 02 70
    INC $02E9            ; EE E9 02
    BMI $17A4            ; 30 02
    CMP $7004,Y          ; D9 04 70
    INC $04D9            ; EE D9 04
    BMI $17B2            ; 30 08
    PEA $601A            ; F4 1A 60
    BEQ $17A3            ; F0 F4
    INC                  ; 1A
    JSR $F410            ; 20 10 F4
    TCS                  ; 1B
    RTS                  ; 60
    INX                  ; E8
    PEA $201B            ; F4 1B 20
    BPL $17A7            ; 10 EC
    TRB $E860            ; 1C 60 E8
    CPX $201C            ; EC 1C 20
    BRK $E4              ; 00 E4
    ASL $70              ; 06 70
    BEQ $17AB            ; F0 E4
    ASL $30              ; 06 30
    BRK $D4              ; 00 D4
    PHP                  ; 08
    BVS $17BE            ; 70 F0
    PEI $08              ; D4 08
    BMI $1810            ; 30 3E
    BRK $1D              ; 00 1D
    BRK $47              ; 00 47
    LDY $48              ; A4 48
    LDY $62              ; A4 62
    LDY $63              ; A4 63
    LDY $45              ; A4 45
    LDY $46              ; A4 46
    LDY $60              ; A4 60
    LDY $61              ; A4 61
    LDY $3B              ; A4 3B
    LDY $3C              ; A4 3C
    LDY $06              ; A4 06
    LDA $F7              ; A5 F7
    LDY $E7              ; A4 E7
    LDY $4A              ; A4 4A
    LDY $3A              ; A4 3A
    LDY $65              ; A4 65
    LDY $56              ; A4 56
    LDY $57              ; A4 57
    LDY $71              ; A4 71
    LDY $72              ; A4 72
    LDY $54              ; A4 54
    LDY $55              ; A4 55

Bank_6A_Function_18:
    LDY $6F              ; A4 6F
    LDY $70              ; A4 70
    LDY $4B              ; A4 4B
    LDY $4C              ; A4 4C
    LDY $7E              ; A4 7E
    LDY $7D              ; A4 7D
    LDY $6E              ; A4 6E
    LDY $1C              ; A4 1C
    JSR $0AD2            ; 20 D2 0A
    RTS                  ; 60
    CLD                  ; D8
    CMP $0A              ; D2 0A
    JSR $DB18            ; 20 18 DB
    PHD                  ; 0B
    RTS                  ; 60
    CPX #$DB             ; E0 DB
    PHD                  ; 0B
