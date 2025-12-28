;==============================================================================
; Dragon Quest III - Engine System (Bank $01)
; Comprehensive code extraction
;==============================================================================

.include "hardware.inc"

.segment "ENGINE_CODE"

Engine_Function_000:
    ORA $C9              ; 05 C9
    BRK $09              ; 00 09
    BRK $D8              ; 00 D8
    EOR $C5              ; 41 C5
    TSB $00              ; 04 00
    SBC $DA0003,X        ; FF 03 00 DA
    TAX                  ; AA
    JSL $C90572          ; 22 72 05 C9
    BRK $04              ; 00 04
    BRK $32              ; 00 32
    WDM $C5              ; 42 C5
    ORA $00              ; 01 00
    JSR ($03FF,X)        ; FC FF 03
    STA $E0B8            ; 8D B8 E0
    JSL $C90572          ; 22 72 05 C9
    BRK $04              ; 00 04
    BRK $32              ; 00 32
    WDM $C5              ; 42 C5
    BRK $00              ; 00 00
    SBC $AA0003,X        ; FF 03 00 AA
    JSL $C067FD          ; 22 FD 67 C0
    PLX                  ; FA
    BCC $8066            ; 90 2E
    JSL $C903EE          ; 22 EE 03 C9
    BRK $09              ; 00 09
    BRK $D8              ; 00 D8
    EOR $C5              ; 41 C5
    ASL $00              ; 06 00
    STA $00              ; 85 00
    JSL $C903EE          ; 22 EE 03 C9
    BRK $09              ; 00 09
    BRK $D8              ; 00 D8
    EOR $C5              ; 41 C5

Engine_Function_001:
    PHP                  ; 08
    BRK $29              ; 00 29
    SBC $028500,X        ; FF 00 85 02
    LDA #$0E             ; A9 0E
    BRK $20              ; 00 20
    PLY                  ; 7A
    STY $AB              ; 84 AB

Engine_Function_002:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    SEC                  ; 38
    RTL                  ; 6B
    LDX $AE9A            ; AE 9A AE
    JSL $C09052          ; 22 52 90 C0
    PLB                  ; AB

Engine_Function_003:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    CLC                  ; 18
    RTL                  ; 6B

Engine_Function_004:
    PHP                  ; 08

Engine_Function_005:
    REP #$30             ; C2 30
    PHA                  ; 48
    PHX                  ; DA
    PHY                  ; 5A

Engine_Function_006:
    PHB                  ; 8B
    PEA $7F7F            ; F4 7F 7F
    PLB                  ; AB
    PLB                  ; AB
    TAX                  ; AA
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $93              ; 00 93
    WDM $C5              ; 42 C5
    BRK $00              ; 00 00
    SBC $8D0000,X        ; FF 00 00 8D
    LDA $E0              ; B2 E0
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $93              ; 00 93
    WDM $C5              ; 42 C5
    ORA $00              ; 01 00
    SBC $8D0000,X        ; FF 00 00 8D
    LDY $E0,X            ; B4 E0
    ORA $E0B2            ; 0D B2 E0
    BNE $80AF            ; D0 03
    JMP $8166            ; 4C 66 81

Engine_Function_007:
    SEP #$20             ; E2 20
    LDA $E0B2            ; AD B2 E0
    XBA                  ; EB
    LDA $E0B4            ; AD B4 E0
    JSL $C01098          ; 22 98 10 C0

Engine_Function_008:
    REP #$20             ; C2 20
    STA $E0B6            ; 8D B6 E0
    ASL                  ; 0A
    JSL $C08FD7          ; 22 D7 8F C0
    BCS $80CB            ; B0 03
    JMP $8166            ; 4C 66 81
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $93              ; 00 93
    WDM $C5              ; 42 C5
    COP $00              ; 02 00
    SBC $0A0000,X        ; FF 00 00 0A
    ADC $FC46            ; 6D 46 FC
    STA $FC46            ; 8D 46 FC
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $93              ; 00 93
    WDM $C5              ; 42 C5
    ORA $00              ; 03 00
    SBC $0A0000,X        ; FF 00 00 0A
    ADC $FC48            ; 6D 48 FC
    STA $FC48            ; 8D 48 FC
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $93              ; 00 93
    WDM $C5              ; 42 C5
    TSB $00              ; 04 00
    SBC $DA0003,X        ; FF 03 00 DA
    TAX                  ; AA
    JSL $C90572          ; 22 72 05 C9
    BRK $04              ; 00 04
    BRK $9C              ; 00 9C
    WDM $C5              ; 42 C5
    ORA $00              ; 01 00
    JSR ($03FF,X)        ; FC FF 03
    STA $E0B8            ; 8D B8 E0
    JSL $C90572          ; 22 72 05 C9
    BRK $04              ; 00 04
    BRK $9C              ; 00 9C
    WDM $C5              ; 42 C5
    BRK $00              ; 00 00
    SBC $AA0003,X        ; FF 03 00 AA
    JSL $C0689E          ; 22 9E 68 C0
    PLX                  ; FA
    BCC $815F            ; 90 2E
    JSL $C903EE          ; 22 EE 03 C9
    BRK $09              ; 00 09
    BRK $93              ; 00 93
    WDM $C5              ; 42 C5
    ASL $00              ; 06 00
    STA $00              ; 85 00
    JSL $C903EE          ; 22 EE 03 C9
    BRK $09              ; 00 09
    BRK $93              ; 00 93
    WDM $C5              ; 42 C5

Engine_Function_009:
    PHP                  ; 08
    BRK $29              ; 00 29
    SBC $028500,X        ; FF 00 85 02
    LDA #$10             ; A9 10
    BRK $20              ; 00 20
    PLY                  ; 7A
    STY $AB              ; 84 AB

Engine_Function_00A:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    SEC                  ; 38
    RTL                  ; 6B
    LDX $AE9A            ; AE 9A AE
    JSL $C09052          ; 22 52 90 C0
    PLB                  ; AB

Engine_Function_00B:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    CLC                  ; 18
    RTL                  ; 6B

Engine_Function_00C:
    PHP                  ; 08

Engine_Function_00D:
    REP #$30             ; C2 30
    PHA                  ; 48
    PHX                  ; DA
    PHY                  ; 5A

Engine_Function_00E:
    PHB                  ; 8B
    SEI                  ; 78
    PEA $7F7F            ; F4 7F 7F
    PLB                  ; AB
    PLB                  ; AB
    LDA $E3E2,Y          ; B9 E2 E3
    BPL $8186            ; 10 05
    LDA $E4A2,Y          ; B9 A2 E4
    BPL $8189            ; 10 03
    JMP $8244            ; 4C 44 82
    JSR $8409            ; 20 09 84
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $93              ; 00 93
    BPL $815B            ; 10 C5
    BRK $00              ; 00 00
    SBC $8D0000,X        ; FF 00 00 8D
    CPY $E0              ; C4 E0
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $93              ; 00 93
    BPL $816D            ; 10 C5
    ORA $00              ; 01 00
    SBC $8D0000,X        ; FF 00 00 8D
    INY                  ; C8
    CPX #$E2             ; E0 E2
    JSR $C4AD            ; 20 AD C4
    CPX #$EB             ; E0 EB
    LDA $E0C8            ; AD C8 E0
    JSL $C01098          ; 22 98 10 C0

Engine_Function_00F:
    REP #$20             ; C2 20
    STA $E0B6            ; 8D B6 E0
    JSL $C903EE          ; 22 EE 03 C9
    BRK $09              ; 00 09
    BRK $93              ; 00 93
    BPL $8191            ; 10 C5
    ASL $00              ; 06 00
    STA $00              ; 85 00
    JSL $C903EE          ; 22 EE 03 C9
    BRK $09              ; 00 09
    BRK $93              ; 00 93
    BPL $819F            ; 10 C5

Engine_Function_010:
    PHP                  ; 08
    BRK $29              ; 00 29
    SBC $028500,X        ; FF 00 85 02
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $93              ; 00 93
    BPL $81B0            ; 10 C5
    BRK $00              ; 00 00
    SBC $850000,X        ; FF 00 00 85
    TSB $7222            ; 0C 22 72
    ORA $C9              ; 05 C9
    BRK $09              ; 00 09
    BRK $93              ; 00 93
    BPL $81C1            ; 10 C5
    TSB $00              ; 04 00
    SBC $DA0003,X        ; FF 03 00 DA
    TAX                  ; AA
    JSL $C90572          ; 22 72 05 C9
    BRK $04              ; 00 04
    BRK $9C              ; 00 9C
    BPL $81D2            ; 10 C5
    ORA $00              ; 01 00
    JSR ($03FF,X)        ; FC FF 03
    STA $E0B8            ; 8D B8 E0
    JSL $C90572          ; 22 72 05 C9
    BRK $04              ; 00 04
    BRK $9C              ; 00 9C
    BPL $81E4            ; 10 C5
    BRK $00              ; 00 00
    SBC $AA0003,X        ; FF 03 00 AA
    JSL $C0675C          ; 22 5C 67 C0
    PLX                  ; FA
    BCC $8244            ; 90 18
    JSR $8438            ; 20 38 84
    LDA $E0B8            ; AD B8 E0
    STA $2E              ; 85 2E
    LDA $E0B6            ; AD B6 E0
    JSL $C04A5B          ; 22 5B 4A C0
    PLB                  ; AB

Engine_Function_011:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    SEC                  ; 38
    RTL                  ; 6B
    PLB                  ; AB

Engine_Function_012:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    CLC                  ; 18
    RTL                  ; 6B

Engine_Function_013:
    PHP                  ; 08

Engine_Function_014:
    REP #$30             ; C2 30
    PHA                  ; 48
    PHX                  ; DA
    PHY                  ; 5A

Engine_Function_015:
    PHB                  ; 8B
    SEI                  ; 78
    PEA $7F7F            ; F4 7F 7F
    PLB                  ; AB
    PLB                  ; AB
    LDA $E3E2,Y          ; B9 E2 E3
    BPL $8264            ; 10 05
    LDA $E4A2,Y          ; B9 A2 E4
    BPL $8267            ; 10 03
    JMP $8322            ; 4C 22 83
    JSR $8409            ; 20 09 84
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $D8              ; 00 D8
    EOR $C5              ; 41 C5
    BRK $00              ; 00 00
    SBC $8D0000,X        ; FF 00 00 8D
    CPY $E0              ; C4 E0
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $D8              ; 00 D8
    EOR $C5              ; 41 C5
    ORA $00              ; 01 00
    SBC $8D0000,X        ; FF 00 00 8D
    INY                  ; C8
    CPX #$E2             ; E0 E2
    JSR $C4AD            ; 20 AD C4
    CPX #$EB             ; E0 EB
    LDA $E0C8            ; AD C8 E0
    JSL $C01098          ; 22 98 10 C0

Engine_Function_016:
    REP #$20             ; C2 20
    STA $E0B6            ; 8D B6 E0
    JSL $C903EE          ; 22 EE 03 C9
    BRK $09              ; 00 09
    BRK $D8              ; 00 D8
    EOR $C5              ; 41 C5
    ASL $00              ; 06 00
    STA $00              ; 85 00
    JSL $C903EE          ; 22 EE 03 C9
    BRK $09              ; 00 09
    BRK $D8              ; 00 D8
    EOR $C5              ; 41 C5

Engine_Function_017:
    PHP                  ; 08
    BRK $29              ; 00 29
    SBC $028500,X        ; FF 00 85 02
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $D8              ; 00 D8
    EOR $C5              ; 41 C5
    BRK $00              ; 00 00
    SBC $850000,X        ; FF 00 00 85
    TSB $7222            ; 0C 22 72
    ORA $C9              ; 05 C9
    BRK $09              ; 00 09
    BRK $D8              ; 00 D8
    EOR $C5              ; 41 C5
    TSB $00              ; 04 00
    SBC $DA0003,X        ; FF 03 00 DA
    TAX                  ; AA
    JSL $C90572          ; 22 72 05 C9
    BRK $04              ; 00 04
    BRK $32              ; 00 32
    WDM $C5              ; 42 C5
    ORA $00              ; 01 00
    JSR ($03FF,X)        ; FC FF 03
    STA $E0B8            ; 8D B8 E0
    JSL $C90572          ; 22 72 05 C9
    BRK $04              ; 00 04
    BRK $32              ; 00 32
    WDM $C5              ; 42 C5
    BRK $00              ; 00 00
    SBC $AA0003,X        ; FF 03 00 AA
    JSL $C067FD          ; 22 FD 67 C0
    PLX                  ; FA
    BCC $8322            ; 90 18
    JSR $8438            ; 20 38 84
    LDA $E0B8            ; AD B8 E0
    STA $2E              ; 85 2E
    LDA $E0B6            ; AD B6 E0
    JSL $C04A5B          ; 22 5B 4A C0
    PLB                  ; AB

Engine_Function_018:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    SEC                  ; 38
    RTL                  ; 6B
    PLB                  ; AB

Engine_Function_019:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    CLC                  ; 18
    RTL                  ; 6B

Engine_Function_01A:
    PHP                  ; 08

Engine_Function_01B:
    REP #$30             ; C2 30
    PHA                  ; 48
    PHX                  ; DA
    PHY                  ; 5A

Engine_Function_01C:
    PHB                  ; 8B
    SEI                  ; 78
    PEA $7F7F            ; F4 7F 7F
    PLB                  ; AB
    PLB                  ; AB
    LDA $E3E2,Y          ; B9 E2 E3
    BPL $8342            ; 10 05
    LDA $E4A2,Y          ; B9 A2 E4
    BPL $8345            ; 10 03
    JMP $8400            ; 4C 00 84
    JSR $8409            ; 20 09 84
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $93              ; 00 93
    WDM $C5              ; 42 C5
    BRK $00              ; 00 00
    SBC $8D0000,X        ; FF 00 00 8D
    CPY $E0              ; C4 E0
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $93              ; 00 93
    WDM $C5              ; 42 C5
    ORA $00              ; 01 00
    SBC $8D0000,X        ; FF 00 00 8D
    INY                  ; C8
    CPX #$E2             ; E0 E2
    JSR $C4AD            ; 20 AD C4
    CPX #$EB             ; E0 EB
    LDA $E0C8            ; AD C8 E0
    JSL $C01098          ; 22 98 10 C0

Engine_Function_01D:
    REP #$20             ; C2 20
    STA $E0B6            ; 8D B6 E0
    JSL $C903EE          ; 22 EE 03 C9
    BRK $09              ; 00 09
    BRK $93              ; 00 93
    WDM $C5              ; 42 C5
    ASL $00              ; 06 00
    STA $00              ; 85 00
    JSL $C903EE          ; 22 EE 03 C9
    BRK $09              ; 00 09
    BRK $93              ; 00 93
    WDM $C5              ; 42 C5

Engine_Function_01E:
    PHP                  ; 08
    BRK $29              ; 00 29
    SBC $028500,X        ; FF 00 85 02
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $93              ; 00 93
    WDM $C5              ; 42 C5
    BRK $00              ; 00 00
    SBC $850000,X        ; FF 00 00 85
    TSB $7222            ; 0C 22 72
    ORA $C9              ; 05 C9
    BRK $09              ; 00 09
    BRK $93              ; 00 93
    WDM $C5              ; 42 C5
    TSB $00              ; 04 00
    SBC $DA0003,X        ; FF 03 00 DA
    TAX                  ; AA
    JSL $C90572          ; 22 72 05 C9
    BRK $04              ; 00 04
    BRK $9C              ; 00 9C
    WDM $C5              ; 42 C5
    ORA $00              ; 01 00
    JSR ($03FF,X)        ; FC FF 03
    STA $E0B8            ; 8D B8 E0
    JSL $C90572          ; 22 72 05 C9
    BRK $04              ; 00 04
    BRK $9C              ; 00 9C
    WDM $C5              ; 42 C5
    BRK $00              ; 00 00
    SBC $AA0003,X        ; FF 03 00 AA
    JSL $C0689E          ; 22 9E 68 C0
    PLX                  ; FA
    BCC $8400            ; 90 18
    JSR $8438            ; 20 38 84
    LDA $E0B8            ; AD B8 E0
    STA $2E              ; 85 2E
    LDA $E0B6            ; AD B6 E0
    JSL $C04A5B          ; 22 5B 4A C0
    PLB                  ; AB

Engine_Function_01F:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    SEC                  ; 38
    RTL                  ; 6B

Engine_Function_020:
    PLB                  ; AB

Engine_Function_021:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    CLC                  ; 18
    RTL                  ; 6B
    LDA $E432,Y          ; B9 32 E4
    AND #$07             ; 29 07
    BRK $48              ; 00 48
    LDA $7E9686          ; AF 86 96 7E
    LSR                  ; 4A
    LSR                  ; 4A
    LSR                  ; 4A
    AND #$F8             ; 29 F8
    SBC $8D0103,X        ; FF 03 01 8D
    TSX                  ; BA
    CPX #$68             ; E0 68
    LDA $E452,Y          ; B9 52 E4
    AND #$08             ; 29 08
    BRK $48              ; 00 48
    LDA $7E9688          ; AF 88 96 7E
    LSR                  ; 4A
    LSR                  ; 4A
    LSR                  ; 4A
    AND #$F8             ; 29 F8
    SBC $8D0103,X        ; FF 03 01 8D
    LDX $68E0,Y          ; BE E0 68
    RTS                  ; 60
    STZ $04              ; 64 04
    LDA $E0C4            ; AD C4 E0
    STA $06              ; 85 06
    STZ $08              ; 64 08
    LDA $E0C8            ; AD C8 E0
    STA $0A              ; 85 0A
    LDA $E442,Y          ; B9 42 E4
    SEC                  ; 38
    SBC $E432,Y          ; F9 32 E4
    INC                  ; 1A
    LSR                  ; 4A
    LSR                  ; 4A
    LSR                  ; 4A
    ASL                  ; 0A
    STA $0E              ; 85 0E
    LDX #$18             ; A2 18
    BRK $85              ; 00 85
    CLC                  ; 18
    LDA $E0BE            ; AD BE E0
    SEC                  ; 38
    SBC $E452,Y          ; F9 52 E4
    LSR                  ; 4A
    LSR                  ; 4A
    LSR                  ; 4A
    JSL $C010D6          ; 22 D6 10 C0
    LDA $E0BA            ; AD BA E0
    SEC                  ; 38
    SBC $E432,Y          ; F9 32 E4
    LSR                  ; 4A
    LSR                  ; 4A
    LSR                  ; 4A
    ASL                  ; 0A
    CLC                  ; 18
    ADC $18              ; 65 18
    ADC $E412,Y          ; 79 12 E4
    TAX                  ; AA
    RTS                  ; 60
    JSL $C05A71          ; 22 71 5A C0
    BCC $84A3            ; 90 23
    JSR $84A4            ; 20 A4 84
    LDA $E412,Y          ; B9 12 E4
    TAX                  ; AA
    LDA $E0B6            ; AD B6 E0
    JSL $C04923          ; 22 23 49 C0
    TAY                  ; A8
    LDA $E0B8            ; AD B8 E0
    STA $18              ; 85 18
    LDA $0000,X          ; BD 00 00
    CLC                  ; 18
    ADC $18              ; 65 18
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEY                  ; 88
    BNE $8494            ; D0 F2
    SEC                  ; 38
    RTS                  ; 60
    STA $E3F2,Y          ; 99 F2 E3
    LDA $FC4C            ; AD 4C FC
    STA $E472,Y          ; 99 72 E4
    LDA $FC4A            ; AD 4A FC
    STA $E4B2,Y          ; 99 B2 E4
    LDX $AE9A            ; AE 9A AE
    TXA                  ; 8A
    STA $E4A2,Y          ; 99 A2 E4
    LDA $ADF4,X          ; BD F4 AD
    STA $E412,Y          ; 99 12 E4
    LDA #$7F             ; A9 7F
    BRK $99              ; 00 99
    JSL $50ADE4          ; 22 E4 AD 50
    LDA $99              ; B7 99
    BRL $32B1            ; 82 E4 AD
    LDX #$AE             ; A2 AE
    STA $E492,Y          ; 99 92 E4
    LDA $B754            ; AD 54 B7
    STA $E4C2,Y          ; 99 C2 E4
    LDA #$00             ; A9 00
    BRA $8475            ; 80 99

Engine_Function_022:
    SEP #$E3             ; E2 E3
    TYA                  ; 98
    STA $E552            ; 8D 52 E5
    LDA #$00             ; A9 00
    BRK $99              ; 00 99
    CMP $E4              ; D2 E4
    STA $E4E2,Y          ; 99 E2 E4
    STA $E4F2,Y          ; 99 F2 E4
    STA $E502,Y          ; 99 02 E5
    STA $E512,Y          ; 99 12 E5
    STA $E522,Y          ; 99 22 E5
    STA $E532,Y          ; 99 32 E5
    STA $E542,Y          ; 99 42 E5
    LDA #$01             ; A9 01
    BRK $99              ; 00 99
    COP $E4              ; 02 E4
    LDA $E0B2            ; AD B2 E0
    ASL                  ; 0A
    ASL                  ; 0A
    ASL                  ; 0A
    PHA                  ; 48
    LDA $FC46            ; AD 46 FC
    STA $E432,Y          ; 99 32 E4
    CLC                  ; 18
    ADC $01              ; 63 01
    DEC                  ; 3A
    STA $E442,Y          ; 99 42 E4
    PLA                  ; 68
    LDA $E0B4            ; AD B4 E0
    ASL                  ; 0A
    ASL                  ; 0A
    ASL                  ; 0A
    PHA                  ; 48
    LDA $FC48            ; AD 48 FC
    STA $E452,Y          ; 99 52 E4
    CLC                  ; 18
    ADC $01              ; 63 01
    DEC                  ; 3A
    STA $E462,Y          ; 99 62 E4
    PLA                  ; 68
    RTS                  ; 60

Engine_Function_023:
    REP #$30             ; C2 30
    PEA $7E7E            ; F4 7E 7E
    PLB                  ; AB
    PLB                  ; AB
    PHA                  ; 48
    PHX                  ; DA
    PHY                  ; 5A
    TAX                  ; AA
    CPX #$3C             ; E0 3C
    COP $90              ; 02 90
    ORA $A2              ; 03 A2
    ORA $00              ; 01 00

Engine_Function_024:
    SEP #$20             ; E2 20
    JSL $C903EE          ; 22 EE 03 C9
    BRK $34              ; 00 34
    BRK $03              ; 00 03
    BRK $C0              ; 00 C0
    BRK $00              ; 00 00
    STA $7F8C            ; 8D 8C 7F
    JSL $C903EE          ; 22 EE 03 C9
    BRK $34              ; 00 34
    BRK $03              ; 00 03
    BRK $C0              ; 00 C0
    ORA $00              ; 01 00
    STA $7F8A            ; 8D 8A 7F
    JSL $C903EE          ; 22 EE 03 C9
    BRK $34              ; 00 34
    BRK $03              ; 00 03
    BRK $C0              ; 00 C0
    COP $00              ; 02 00
    STA $7F90            ; 8D 90 7F
    JSL $C903EE          ; 22 EE 03 C9
    BRK $34              ; 00 34
    BRK $03              ; 00 03
    BRK $C0              ; 00 C0
    ORA $00              ; 03 00
    STA $7F92            ; 8D 92 7F
    JSL $C903EE          ; 22 EE 03 C9
    BRK $34              ; 00 34
    BRK $03              ; 00 03
    BRK $C0              ; 00 C0
    TSB $00              ; 04 00
    STA $7F94            ; 8D 94 7F
    JSL $C903EE          ; 22 EE 03 C9
    BRK $34              ; 00 34
    BRK $03              ; 00 03
    BRK $C0              ; 00 C0
    ORA $00              ; 05 00
    STA $7F96            ; 8D 96 7F
    JSL $C903EE          ; 22 EE 03 C9
    BRK $34              ; 00 34
    BRK $03              ; 00 03
    BRK $C0              ; 00 C0
    ASL $00              ; 06 00
    STA $7F98            ; 8D 98 7F
    JSL $C903EE          ; 22 EE 03 C9
    BRK $34              ; 00 34
    BRK $03              ; 00 03
    BRK $C0              ; 00 C0
    ORA $00              ; 07 00
    STA $7F9A            ; 8D 9A 7F
    JSL $C903EE          ; 22 EE 03 C9
    BRK $34              ; 00 34
    BRK $03              ; 00 03
    BRK $C0              ; 00 C0

Engine_Function_025:
    PHP                  ; 08
    BRK $8D              ; 00 8D

Engine_Function_026:
    REP #$7F             ; C2 7F
    JSL $C903EE          ; 22 EE 03 C9
    BRK $34              ; 00 34
    BRK $03              ; 00 03
    BRK $C0              ; 00 C0
    ORA #$00             ; 09 00
    STA $7FC3            ; 8D C3 7F
    JSL $C903EE          ; 22 EE 03 C9
    BRK $34              ; 00 34
    BRK $03              ; 00 03
    BRK $C0              ; 00 C0
    ASL                  ; 0A
    BRK $8D              ; 00 8D
    TSX                  ; BA
    ADC $03EE22,X        ; 7F 22 EE 03
    CMP #$00             ; C9 00
    BIT $00,X            ; 34 00
    ORA $00              ; 03 00
    CPY #$0B             ; C0 0B
    BRK $8D              ; 00 8D
    LDY $227F,X          ; BC 7F 22
    INC $C903            ; EE 03 C9
    BRK $34              ; 00 34
    BRK $03              ; 00 03
    BRK $C0              ; 00 C0
    TSB $8D00            ; 0C 00 8D
    LDX $227F,Y          ; BE 7F 22
    INC $C903            ; EE 03 C9
    BRK $34              ; 00 34
    BRK $03              ; 00 03
    BRK $C0              ; 00 C0
    ORA $8D00            ; 0D 00 8D
    INY                  ; C8
    ADC $03EE22,X        ; 7F 22 EE 03
    CMP #$00             ; C9 00
    BIT $00,X            ; 34 00
    ORA $00              ; 03 00
    CPY #$0E             ; C0 0E
    BRK $8D              ; 00 8D
    CPY $227F            ; CC 7F 22
    INC $C903            ; EE 03 C9
    BRK $34              ; 00 34
    BRK $03              ; 00 03
    BRK $C0              ; 00 C0
    ORA $CA8D00          ; 0F 00 8D CA
    ADC $03EE22,X        ; 7F 22 EE 03
    CMP #$00             ; C9 00
    BIT $00,X            ; 34 00
    ORA $00              ; 03 00
    CPY #$10             ; C0 10
    BRK $8D              ; 00 8D
    DEC $227F            ; CE 7F 22
    INC $C903            ; EE 03 C9
    BRK $34              ; 00 34
    BRK $03              ; 00 03
    BRK $C0              ; 00 C0
    ORA $00              ; 11 00
    STA $7FD0            ; 8D D0 7F
    JSL $C903EE          ; 22 EE 03 C9
    BRK $34              ; 00 34
    BRK $03              ; 00 03
    BRK $C0              ; 00 C0
    ORA $00              ; 12 00
    STA $7FD2            ; 8D D2 7F

Engine_Function_027:
    REP #$30             ; C2 30
    STX $99D9            ; 8E D9 99
    JSL $C903EE          ; 22 EE 03 C9
    BRK $34              ; 00 34
    BRK $03              ; 00 03
    BRK $C0              ; 00 C0
    ORA $00,X            ; 15 00
    STA $99F1            ; 8D F1 99
    JSL $C903EE          ; 22 EE 03 C9
    BRK $34              ; 00 34
    BRK $03              ; 00 03
    BRK $C0              ; 00 C0
    ORA $00              ; 17 00
    STA $99ED            ; 8D ED 99
    JSL $C903EE          ; 22 EE 03 C9
    BRK $34              ; 00 34
    BRK $03              ; 00 03
    BRK $C0              ; 00 C0
    ORA $8D00,Y          ; 19 00 8D
    SBC $99              ; F3 99
    JSL $C903EE          ; 22 EE 03 C9
    BRK $34              ; 00 34
    BRK $03              ; 00 03
    BRK $C0              ; 00 C0
    TCS                  ; 1B
    BRK $8D              ; 00 8D
    SBC $EE2299          ; EF 99 22 EE
    ORA $C9              ; 03 C9
    BRK $34              ; 00 34
    BRK $03              ; 00 03
    BRK $C0              ; 00 C0
    ORA $8D00,X          ; 1D 00 8D
    SBC $99,X            ; F5 99
    JSL $C903EE          ; 22 EE 03 C9
    BRK $34              ; 00 34
    BRK $03              ; 00 03
    BRK $C0              ; 00 C0
    ORA $718D00,X        ; 1F 00 8D 71
    LDY $22,X            ; B4 22
    INC $C903            ; EE 03 C9
    BRK $34              ; 00 34
    BRK $03              ; 00 03
    BRK $C0              ; 00 C0
    AND $00              ; 23 00
    STA $B475            ; 8D 75 B4
    JSL $C903EE          ; 22 EE 03 C9
    BRK $34              ; 00 34
    BRK $03              ; 00 03
    BRK $C0              ; 00 C0
    ORA $00              ; 13 00
    STA $7FD4            ; 8D D4 7F
    JSL $C903EE          ; 22 EE 03 C9
    BRK $34              ; 00 34
    BRK $03              ; 00 03
    BRK $C0              ; 00 C0
    AND $00              ; 25 00
    AND #$FF             ; 29 FF
    BRK $8D              ; 00 8D
    ADC $22B4,Y          ; 79 B4 22
    INC $C903            ; EE 03 C9
    BRK $34              ; 00 34
    BRK $03              ; 00 03
    BRK $C0              ; 00 C0
    ROL $00              ; 26 00
    AND #$FF             ; 29 FF
    BRK $8D              ; 00 8D
    TDC                  ; 7B
    LDY $22,X            ; B4 22
    INC $C903            ; EE 03 C9
    BRK $34              ; 00 34
    BRK $03              ; 00 03
    BRK $C0              ; 00 C0
    AND $00              ; 27 00
    AND #$FF             ; 29 FF
    BRK $8D              ; 00 8D
    ADC $22B4,X          ; 7D B4 22
    INC $C903            ; EE 03 C9
    BRK $34              ; 00 34
    BRK $03              ; 00 03
    BRK $C0              ; 00 C0
    PLP                  ; 28
    BRK $29              ; 00 29
    SBC $7F8D00,X        ; FF 00 8D 7F
    LDY $8D,X            ; B4 8D
    STA $B4              ; 83 B4
    JSL $C903EE          ; 22 EE 03 C9
    BRK $34              ; 00 34
    BRK $03              ; 00 03
    BRK $C0              ; 00 C0
    AND #$00             ; 29 00
    AND #$FF             ; 29 FF
    BRK $8D              ; 00 8D
    STA $B4              ; 81 B4
    JSR $87DC            ; 20 DC 87
    LDA #$00             ; A9 00
    BRK $9C              ; 00 9C
    CPY #$7F             ; C0 7F
    STZ $7F8E            ; 9C 8E 7F
    STZ $7FC4            ; 9C C4 7F
    STZ $7FC6            ; 9C C6 7F
    LDA $7F8A            ; AD 8A 7F
    AND #$03             ; 29 03
    BRK $0A              ; 00 0A
    XBA                  ; EB
    ASL                  ; 0A
    ASL                  ; 0A
    ASL                  ; 0A
    ASL                  ; 0A
    STA $99E3            ; 8D E3 99
    LDA $7F98            ; AD 98 7F
    AND #$0F             ; 29 0F
    BRK $EB              ; 00 EB
    ASL                  ; 0A
    ASL                  ; 0A
    ASL                  ; 0A
    ASL                  ; 0A
    STA $99DB            ; 8D DB 99
    LDA $7F98            ; AD 98 7F
    AND #$F0             ; 29 F0
    BRK $EB              ; 00 EB
    STA $99DD            ; 8D DD 99
    LDA $7F9A            ; AD 9A 7F
    AND #$0F             ; 29 0F
    BRK $EB              ; 00 EB
    ASL                  ; 0A
    ASL                  ; 0A
    ASL                  ; 0A
    ASL                  ; 0A
    STA $99DF            ; 8D DF 99
    LDA $7F9A            ; AD 9A 7F
    AND #$F0             ; 29 F0
    BRK $EB              ; 00 EB
    STA $99E1            ; 8D E1 99
    LDA $7F90            ; AD 90 7F
    AND #$FC             ; 29 FC
    BRK $EB              ; 00 EB
    STA $99E5            ; 8D E5 99
    LDA $7F92            ; AD 92 7F
    AND #$FC             ; 29 FC
    BRK $EB              ; 00 EB
    STA $99E7            ; 8D E7 99
    LDA $7F94            ; AD 94 7F
    AND #$FC             ; 29 FC
    BRK $EB              ; 00 EB
    STA $99E9            ; 8D E9 99
    LDA $7F96            ; AD 96 7F
    AND #$FC             ; 29 FC
    BRK $EB              ; 00 EB
    STA $99EB            ; 8D EB 99
    LDA $B471            ; AD 71 B4
    JSL $C014F2          ; 22 F2 14 C0
    STA $B473            ; 8D 73 B4
    LDA $B471            ; AD 71 B4
    ASL                  ; 0A
    TAX                  ; AA
    LDA $99E5,X          ; BD E5 99
    STA $B477            ; 8D 77 B4
    LDA $99D9            ; AD D9 99
    CMP #$0A             ; C9 0A
    BRK $F0              ; 00 F0
    ORA $20              ; 05 20
    JMP $8088            ; 4C 88 80
    ORA $20              ; 03 20

Engine_Function_028:
    REP #$88             ; C2 88
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    RTL                  ; 6B
    LDA $B481            ; AD 81 B4
    JSR $8847            ; 20 47 88
    STA $B48D            ; 8D 8D B4
    LDA $B47F            ; AD 7F B4
    JSR $8847            ; 20 47 88
    STA $B48F            ; 8D 8F B4
    LDA $B471            ; AD 71 B4
    CMP #$02             ; C9 02
    BRK $F0              ; 00 F0
    AND $AD              ; 25 AD
    ADC $20B4,Y          ; 79 B4 20
    RTI                  ; 40
    DEY                  ; 88
    STA $B485            ; 8D 85 B4
    LDA $B47B            ; AD 7B B4
    JSR $8840            ; 20 40 88
    STA $B487            ; 8D 87 B4
    LDA $B47D            ; AD 7D B4
    JSR $8840            ; 20 40 88
    STA $B489            ; 8D 89 B4
    LDA $B47F            ; AD 7F B4
    JSR $8840            ; 20 40 88
    STA $B48B            ; 8D 8B B4
    RTS                  ; 60
    LDA $B479            ; AD 79 B4
    JSR $8847            ; 20 47 88
    STA $B485            ; 8D 85 B4
    LDA $B47B            ; AD 7B B4
    JSR $8847            ; 20 47 88
    STA $B487            ; 8D 87 B4
    LDA $B47D            ; AD 7D B4
    JSR $8847            ; 20 47 88
    STA $B489            ; 8D 89 B4
    LDA $B47F            ; AD 7F B4
    JSR $8847            ; 20 47 88
    STA $B48B            ; 8D 8B B4
    RTS                  ; 60
    AND #$70             ; 29 70
    BRK $EB              ; 00 EB
    LSR                  ; 4A
    LSR                  ; 4A
    RTS                  ; 60
    AND #$1C             ; 29 1C
    BRK $EB              ; 00 EB
    RTS                  ; 60
    PEA $7F7F            ; F4 7F 7F
    PLB                  ; AB
    PLB                  ; AB
    LDA #$01             ; A9 01
    BRK $8D              ; 00 8D

Engine_Function_029:
    REP #$E3             ; C2 E3
    LDA #$20             ; A9 20
    BRK $8D              ; 00 8D
    LDA $E3              ; B2 E3
    LDA #$F8             ; A9 F8
    BRK $8D              ; 00 8D
    LDX $E3,Y            ; B6 E3
    LDA #$1B             ; A9 1B
    BRK $8D              ; 00 8D
    LDY $E3,X            ; B4 E3
    LDA #$D8             ; A9 D8
    BRK $8D              ; 00 8D
    CLV                  ; B8
    SBC $A9              ; E3 A9
    SBC $BA8D00,X        ; FF 00 8D BA
    SBC $A9              ; E3 A9
    BRK $00              ; 00 00
    STA $E3BC            ; 8D BC E3
    ASL                  ; 0A
    ASL                  ; 0A
    STA $E3BE            ; 8D BE E3
    LDA #$08             ; A9 08
    BRK $8D              ; 00 8D
    CPY #$E3             ; C0 E3
    PEA $7E7E            ; F4 7E 7E
    PLB                  ; AB
    PLB                  ; AB
    LDA #$78             ; A9 78
    BRK $8D              ; 00 8D
    STX $A996            ; 8E 96 A9
    RTS                  ; 60
    BRK $8D              ; 00 8D
    BCC $882D            ; 90 96
    LDA #$70             ; A9 70
    BRK $8D              ; 00 8D
    STA $96              ; 92 96
    LDA #$58             ; A9 58
    BRK $8D              ; 00 8D
    STY $96,X            ; 94 96
    LDA #$78             ; A9 78
    BRK $8D              ; 00 8D
    STX $96,Y            ; 96 96
    LDA #$70             ; A9 70
    BRK $8D              ; 00 8D
    TYA                  ; 98
    STX $A9,Y            ; 96 A9
    BEQ $88B2            ; F0 00
    STA $969A            ; 8D 9A 96
    LDA #$D0             ; A9 D0
    BRK $8D              ; 00 8D
    STZ $A996            ; 9C 96 A9

Engine_Function_02A:
    PHP                  ; 08
    BRK $8D              ; 00 8D
    STZ $6096,X          ; 9E 96 60
    PEA $7F7F            ; F4 7F 7F
    PLB                  ; AB
    PLB                  ; AB
    LDA #$01             ; A9 01
    BRK $8D              ; 00 8D

Engine_Function_02B:
    REP #$E3             ; C2 E3
    LDA #$80             ; A9 80
    BRK $8D              ; 00 8D
    LDA $E3              ; B2 E3
    LDA #$78             ; A9 78
    COP $8D              ; 02 8D
    LDX $E3,Y            ; B6 E3
    LDA #$80             ; A9 80
    BRK $8D              ; 00 8D
    LDY $E3,X            ; B4 E3
    LDA #$78             ; A9 78
    COP $8D              ; 02 8D
    CLV                  ; B8
    SBC $A9              ; E3 A9
    SBC $BA8D03,X        ; FF 03 8D BA
    SBC $A9              ; E3 A9
    BRK $00              ; 00 00
    STA $E3BC            ; 8D BC E3
    ASL                  ; 0A
    ASL                  ; 0A
    STA $E3BE            ; 8D BE E3
    LDA #$08             ; A9 08
    BRK $8D              ; 00 8D
    CPY #$E3             ; C0 E3
    PEA $7E7E            ; F4 7E 7E
    PLB                  ; AB
    PLB                  ; AB
    LDA #$78             ; A9 78
    BRK $8D              ; 00 8D
    STX $A996            ; 8E 96 A9
    RTS                  ; 60
    BRK $8D              ; 00 8D
    BCC $88A3            ; 90 96
    LDA #$70             ; A9 70
    BRK $8D              ; 00 8D
    STA $96              ; 92 96
    LDA #$58             ; A9 58
    BRK $8D              ; 00 8D
    STY $96,X            ; 94 96
    LDA #$78             ; A9 78
    BRK $8D              ; 00 8D
    STX $96,Y            ; 96 96
    LDA #$70             ; A9 70
    BRK $8D              ; 00 8D
    TYA                  ; 98
    STX $A9,Y            ; 96 A9
    BEQ $8928            ; F0 00
    STA $969A            ; 8D 9A 96
    LDA #$D0             ; A9 D0
    BRK $8D              ; 00 8D
    STZ $A996            ; 9C 96 A9

Engine_Function_02C:
    PHP                  ; 08
    BRK $8D              ; 00 8D
    STZ $6096,X          ; 9E 96 60

Engine_Function_02D:
    REP #$30             ; C2 30
    PEA $7E7E            ; F4 7E 7E
    PLB                  ; AB
    PLB                  ; AB
    LDX $B475            ; AE 75 B4
    JSR ($8949,X)        ; FC 49 89
    JSR $8951            ; 20 51 89
    RTL                  ; 6B
    ADC $89,X            ; 75 89
    ROR $89,X            ; 76 89
    LDA $89              ; A5 89
    SBC #$89             ; E9 89
    LDA #$81             ; A9 81
    ADC $8D              ; 61 8D
    BVS $88ED            ; 70 96
    LDA #$C5             ; A9 C5
    BRK $8D              ; 00 8D
    ADC $96              ; 72 96
    LDA $99EF            ; AD EF 99
    CLC                  ; 18
    ADC #$00             ; 69 00
    ORA $8D              ; 07 8D
    STZ $96,X            ; 74 96
    LDA #$70             ; A9 70
    BRK $8D              ; 00 8D
    ROR $96,X            ; 76 96
    LDX #$70             ; A2 70
    STX $22,Y            ; 96 22
    STA $25              ; 87 25
    CPY #$60             ; C0 60
    RTS                  ; 60
    LDA #$00             ; A9 00
    BPL $899A            ; 10 20
    LDY $AC8A,X          ; BC 8A AC
    RTI                  ; 40
    TYA                  ; 98
    LDX #$00             ; A2 00
    BRK $E2              ; 00 E2
    JSR $81BF            ; 20 BF 81
    EOR $C5              ; 51 C5
    PHA                  ; 48
    LDA $C55182,X        ; BF 82 51 C5
    AND $01              ; 23 01
    STA $0001,Y          ; 99 01 00
    PLA                  ; 68
    STA $0000,Y          ; 99 00 00
    INX                  ; E8
    INX                  ; E8
    INY                  ; C8
    INY                  ; C8
    CPX #$00             ; E0 00
    BPL $892E            ; 10 90
    SBC $C2              ; E5 C2
    JSR $C120            ; 20 20 C1
    BIT #$60             ; 89 60
    LDA #$00             ; A9 00
    BPL $89C9            ; 10 20
    LDY $AC8A,X          ; BC 8A AC
    RTI                  ; 40
    TYA                  ; 98
    LDX #$00             ; A2 00
    BRK $BF              ; 00 BF
    STA $51              ; 81 51
    CMP $99              ; C5 99
    BRK $00              ; 00 00
    INX                  ; E8
    INX                  ; E8
    INY                  ; C8
    INY                  ; C8
    CPX #$00             ; E0 00
    BPL $8950            ; 10 90
    BEQ $896E            ; F0 AC
    LDX $AD93            ; AE 93 AD
    RTI                  ; 40
    TYA                  ; 98
    STA $8BAE,Y          ; 99 AE 8B
    LDA #$7E             ; A9 7E
    BRK $99              ; 00 99
    LDX $AD8D            ; AE 8D AD
    SBC $9999            ; ED 99 99
    LDX $AD8F            ; AE 8F AD
    WDM $98              ; 42 98
    STA $91AE,Y          ; 99 AE 91
    INY                  ; C8
    INY                  ; C8
    STY $93AE            ; 8C AE 93
    JSL $C02892          ; 22 92 28 C0
    JSR $8AD2            ; 20 D2 8A
    RTS                  ; 60
    LDA #$00             ; A9 00
    BPL $8A0D            ; 10 20
    LDY $AC8A,X          ; BC 8A AC
    RTI                  ; 40
    TYA                  ; 98
    LDX #$00             ; A2 00
    BRK $20              ; 00 20
    EOR $8A              ; 51 8A
    LDY $93AE            ; AC AE 93
    LDA $9840            ; AD 40 98
    STA $8BAE,Y          ; 99 AE 8B
    LDA #$7E             ; A9 7E
    BRK $99              ; 00 99
    LDX $AD8D            ; AE 8D AD
    SBC $9999            ; ED 99 99
    LDX $AD8F            ; AE 8F AD
    WDM $98              ; 42 98
    STA $91AE,Y          ; 99 AE 91
    INY                  ; C8
    INY                  ; C8
    STY $93AE            ; 8C AE 93
    JSL $C02892          ; 22 92 28 C0
    LDY $9840            ; AC 40 98
    LDX #$00             ; A2 00

Engine_Function_02E:
    PHP                  ; 08
    JSR $8A51            ; 20 51 8A
    LDY $93AE            ; AC AE 93
    LDA $9840            ; AD 40 98
    STA $8BAE,Y          ; 99 AE 8B
    LDA #$7E             ; A9 7E
    BRK $99              ; 00 99
    LDX $AD8D            ; AE 8D AD
    SBC $1899            ; ED 99 18
    ADC #$00             ; 69 00

Engine_Function_02F:
    PHP                  ; 08
    STA $8FAE,Y          ; 99 AE 8F
    LDA $9842            ; AD 42 98
    STA $91AE,Y          ; 99 AE 91
    INY                  ; C8
    INY                  ; C8
    STY $93AE            ; 8C AE 93
    JSL $C02892          ; 22 92 28 C0
    JSR $8AD2            ; 20 D2 8A
    RTS                  ; 60
    LDA #$80             ; A9 80
    BRK $8D              ; 00 8D
    MVP $BF98            ; 44 98 BF
    STA $51              ; 81 51
    CMP $99              ; C5 99
    BRK $00              ; 00 00
    LDA $C55183,X        ; BF 83 51 C5
    STA $0002,Y          ; 99 02 00
    LDA $C55185,X        ; BF 85 51 C5
    STA $0004,Y          ; 99 04 00
    LDA $C55187,X        ; BF 87 51 C5
    STA $0006,Y          ; 99 06 00
    LDA $C55189,X        ; BF 89 51 C5
    STA $0008,Y          ; 99 08 00
    LDA $C5518B,X        ; BF 8B 51 C5
    STA $000A,Y          ; 99 0A 00
    LDA $C5518D,X        ; BF 8D 51 C5
    STA $000C,Y          ; 99 0C 00
    LDA $C5518F,X        ; BF 8F 51 C5
    STA $000E,Y          ; 99 0E 00
    LDA #$FF             ; A9 FF
    SBC $001099,X        ; FF 99 10 00
    STA $0012,Y          ; 99 12 00
    STA $0014,Y          ; 99 14 00
    STA $0016,Y          ; 99 16 00
    STA $0018,Y          ; 99 18 00
    STA $001A,Y          ; 99 1A 00
    STA $001C,Y          ; 99 1C 00
    STA $001E,Y          ; 99 1E 00
    TXA                  ; 8A
    CLC                  ; 18
    ADC #$10             ; 69 10
    BRK $AA              ; 00 AA
    TYA                  ; 98
    CLC                  ; 18
    ADC #$20             ; 69 20
    BRK $A8              ; 00 A8
    DEC $9844            ; CE 44 98
    BNE $8A57            ; D0 9C
    RTS                  ; 60
    STA $9842            ; 8D 42 98
    JSL $C08DA0          ; 22 A0 8D C0
    BCS $8AC5            ; B0 00
    LDA $7DC8            ; AD C8 7D
    STA $983E            ; 8D 3E 98
    LDA $7DCC            ; AD CC 7D
    STA $9840            ; 8D 40 98
    RTS                  ; 60
    LDX $983E            ; AE 3E 98
    JSL $C08E1B          ; 22 1B 8E C0
    RTS                  ; 60

Engine_Function_030:
    REP #$30             ; C2 30
    PEA $7E7E            ; F4 7E 7E
    PLB                  ; AB
    PLB                  ; AB
    PHA                  ; 48
    PHX                  ; DA
    PHY                  ; 5A
    LDA $B479            ; AD 79 B4
    JSR $8B66            ; 20 66 8B
    LDA #$DE             ; A9 DE
    ADC $99              ; 77 99
    BRK $00              ; 00 00
    LDA #$C6             ; A9 C6
    TRB $99              ; 14 99
    COP $00              ; 02 00
    LDA #$DE             ; A9 DE
    ADC $99              ; 77 99
    TSB $00              ; 04 00
    LDA $B47B            ; AD 7B B4
    JSR $8B66            ; 20 66 8B
    LDA #$DE             ; A9 DE
    ADC $99              ; 77 99
    BRK $00              ; 00 00
    LDA #$C6             ; A9 C6
    TRB $99              ; 14 99
    COP $00              ; 02 00
    LDA #$5F             ; A9 5F
    AND $000499,X        ; 3F 99 04 00
    LDA $B47D            ; AD 7D B4
    JSR $8B66            ; 20 66 8B
    LDA #$DE             ; A9 DE
    ADC $99              ; 77 99
    BRK $00              ; 00 00
    LDA #$C6             ; A9 C6
    TRB $99              ; 14 99
    COP $00              ; 02 00
    LDA #$9F             ; A9 9F
    PHY                  ; 5A
    STA $0004,Y          ; 99 04 00
    LDA $B47F            ; AD 7F B4
    JSR $8B66            ; 20 66 8B
    LDA #$73             ; A9 73
    LSR                  ; 4A
    STA $0000,Y          ; 99 00 00
    LDA #$84             ; A9 84
    TSB $0299            ; 0C 99 02
    BRK $A9              ; 00 A9
    ADC $4A              ; 73 4A
    STA $0004,Y          ; 99 04 00
    LDA $B479            ; AD 79 B4
    JSR $8B66            ; 20 66 8B
    LDA #$DE             ; A9 DE
    ADC $99              ; 77 99
    BRK $00              ; 00 00
    LDA #$C6             ; A9 C6
    TRB $99              ; 14 99
    COP $00              ; 02 00
    LDA #$DE             ; A9 DE
    ADC $99              ; 77 99
    TSB $00              ; 04 00
    PLY                  ; 7A
    LDA #$00             ; A9 00
    BRK $99              ; 00 99
    SEC                  ; 38
    BRK $FA              ; 00 FA
    PLA                  ; 68
    RTL                  ; 6B
    ASL                  ; 0A
    ADC $03              ; 63 03
    TAY                  ; A8
    RTS                  ; 60
    LDA #$06             ; A9 06
    BRK $22              ; 00 22
    TRB $C8              ; 14 C8
    CPY #$22             ; C0 22
    ASL $8D              ; 06 8D
    CPY #$22             ; C0 22
    STZ $C08B            ; 9C 8B C0
    JSL $C028B4          ; 22 B4 28 C0
    RTL                  ; 6B
    LDA #$06             ; A9 06
    BRK $22              ; 00 22
    TRB $C8              ; 14 C8
    CPY #$22             ; C0 22
    ASL $8D              ; 06 8D
    CPY #$22             ; C0 22
    STZ $C08B            ; 9C 8B C0
    RTL                  ; 6B
    JSL $C08D3C          ; 22 3C 8D C0
    JSL $C08B9C          ; 22 9C 8B C0
    JSL $C028B4          ; 22 B4 28 C0
    RTL                  ; 6B
    LDA #$71             ; A9 71
    LDA $77AE            ; AD AE 77
    LDY $A0,X            ; B4 A0
    BRK $07              ; 00 07
    JSL $C02627          ; 22 27 26 C0
    LDA #$01             ; A9 01
    BRK $8D              ; 00 8D
    INX                  ; E8
    ADC $DA486B,X        ; 7F 6B 48 DA
    PHY                  ; 5A
    CPX #$00             ; E0 00
    ORA $B0              ; 07 B0
    INC $F2BD,X          ; FE BD F2
    PLD                  ; 2B
    STA $AD71,X          ; 9D 71 AD
    PHX                  ; DA
    TXA                  ; 8A
    LSR                  ; 4A
    CLC                  ; 18
    ADC $B477            ; 6D 77 B4
    TAX                  ; AA
    LDY #$02             ; A0 02
    BRK $68              ; 00 68
    CLC                  ; 18
    ADC #$71             ; 69 71
    LDA $2722            ; AD 22 27
    ROL $C0              ; 26 C0
    JSL $C028B4          ; 22 B4 28 C0
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    RTL                  ; 6B
    LDA #$00             ; A9 00
    BRK $8D              ; 00 8D
    STA $B4              ; 93 B4
    LDA #$1B             ; A9 1B
    BRK $8D              ; 00 8D
    STA $B4,X            ; 95 B4
    JMP $C08C06          ; 5C 06 8C C0
    LDA $B493            ; AD 93 B4
    CMP $B495            ; CD 95 B4
    BEQ $8C02            ; F0 10
    BCC $8C02            ; 90 0E
    LDA $B493            ; AD 93 B4
    PHA                  ; 48
    LDA $B495            ; AD 95 B4
    STA $B493            ; 8D 93 B4
    PLA                  ; 68
    STA $B495            ; 8D 95 B4
    JMP $C08C06          ; 5C 06 8C C0
    JSL $C08D06          ; 22 06 8D C0
    LDA $B493            ; AD 93 B4
    AND #$FE             ; 29 FE
    SBC $978D0A,X        ; FF 0A 8D 97
    LDY $AD,X            ; B4 AD
    STA $B4,X            ; 95 B4
    AND #$FE             ; 29 FE
    SBC $998D0A,X        ; FF 0A 8D 99
    LDY $9C,X            ; B4 9C
    TXY                  ; 9B
    LDY $AE,X            ; B4 AE
    STA $ADB4,Y          ; 99 B4 AD
    STA $F0B4,X          ; 9D B4 F0
    TRB $BD              ; 14 BD
    AND $F0C0,Y          ; 39 C0 F0
    ORA $20              ; 03 20
    LDY $8C              ; A4 8C
    LDA $C03B,X          ; BD 3B C0
    BEQ $8C3D            ; F0 07
    PHX                  ; DA
    INX                  ; E8
    INX                  ; E8
    JSR $8CA4            ; 20 A4 8C
    PLX                  ; FA
    LDA $F59D,X          ; BD 9D F5
    CMP #$FF             ; C9 FF
    BRK $F0              ; 00 F0
    ORA $20              ; 05 20
    STZ $8C,X            ; 74 8C
    BRA $8C55            ; 80 0B
    LDA $F59F,X          ; BD 9F F5
    CMP #$FF             ; C9 FF
    BRK $F0              ; 00 F0
    ORA $20              ; 03 20
    STZ $8C,X            ; 74 8C
    LDA $B49B            ; AD 9B B4
    BEQ $8C5E            ; F0 04
    JSL $C028B4          ; 22 B4 28 C0
    LDX $B499            ; AE 99 B4
    DEX                  ; CA
    DEX                  ; CA
    DEX                  ; CA
    DEX                  ; CA
    STX $B499            ; 8E 99 B4
    BMI $8C6F            ; 30 05
    CPX $B497            ; EC 97 B4
    BCS $8C1E            ; B0 AF
    JSL $C0CBA0          ; 22 A0 CB C0
    RTL                  ; 6B
    PHX                  ; DA
    JSL $C0CBF9          ; 22 F9 CB C0
    INX                  ; E8
    INX                  ; E8
    JSL $C0CBF9          ; 22 F9 CB C0
    INC $7FE6            ; EE E6 7F
    LDA $B499            ; AD 99 B4
    ASL                  ; 0A
    ASL                  ; 0A
    ASL                  ; 0A
    ASL                  ; 0A
    ADC $B477            ; 6D 77 B4
    TAX                  ; AA
    LDA $B499            ; AD 99 B4
    ASL                  ; 0A
    ASL                  ; 0A
    ASL                  ; 0A
    ASL                  ; 0A
    ASL                  ; 0A
    ADC #$71             ; 69 71
    LDA $80A0            ; AD A0 80
    BRK $22              ; 00 22
    AND $26              ; 27 26
    CPY #$EE             ; C0 EE
    TXY                  ; 9B
    LDY $FA,X            ; B4 FA
    RTS                  ; 60
    PHX                  ; DA
    PHY                  ; 5A
    STZ $BE43            ; 9C 43 BE
    STZ $C039,X          ; 9E 39 C0
    TXA                  ; 8A
    LSR                  ; 4A
    ADC $03              ; 63 03
    TAY                  ; A8
    LDX $99D9            ; AE D9 99
    JSL $C903EE          ; 22 EE 03 C9
    BRK $34              ; 00 34
    BRK $03              ; 00 03
    BRK $C0              ; 00 C0
    ROL                  ; 2A
    BRK $29              ; 00 29
    SBC $AA0A00,X        ; FF 00 0A AA
    JSR ($8CCE,X)        ; FC CE 8C
    INC $B49B            ; EE 9B B4
    PLY                  ; 7A
    PLX                  ; FA
    RTS                  ; 60
    PEI $8C              ; D4 8C
    PEI $8C              ; D4 8C
    SBC $A98C,Y          ; F9 8C A9
    AND $2A99EE,X        ; 3F EE 99 2A
    XBA                  ; EB
    LDA #$4F             ; A9 4F
    INC $8A99            ; EE 99 8A
    XBA                  ; EB
    LDA #$55             ; A9 55
    INC $EA99            ; EE 99 EA
    XBA                  ; EB
    LDA #$59             ; A9 59
    INC $4A99            ; EE 99 4A
    CPX $5DA9            ; EC A9 5D
    INC $AA99            ; EE 99 AA
    CPX $5FA9            ; EC A9 5F
    INC $0A99            ; EE 99 0A
    SBC $A960            ; ED 60 A9
    AND $2A99EE,X        ; 3F EE 99 2A
    XBA                  ; EB
    LDA #$4B             ; A9 4B
    INC $8A99            ; EE 99 8A
    XBA                  ; EB
    RTS                  ; 60
    LDA $B491            ; AD 91 B4
    BEQ $8D28            ; F0 1D
    JSL $C05668          ; 22 68 56 C0
    LDA $B471            ; AD 71 B4
    ASL                  ; 0A
    TAX                  ; AA
    LDA #$C6             ; A9 C6
    SBC $F4              ; E5 F4
    ADC $ABAB7F,X        ; 7F 7F AB AB
    JSL $C0533E          ; 22 3E 53 C0
    PEA $7E7E            ; F4 7E 7E
    PLB                  ; AB
    PLB                  ; AB
    STZ $B491            ; 9C 91 B4
    LDX #$FE             ; A2 FE
    ASL $BD              ; 06 BD
    SBC $2B              ; F2 2B
    BNE $8D34            ; D0 04
    LDA $7FE5C6,X        ; BF C6 E5 7F
    STA $AD71,X          ; 9D 71 AD
    DEX                  ; CA
    DEX                  ; CA
    BPL $8D2B            ; 10 F0
    RTL                  ; 6B
    LDX #$FE             ; A2 FE
    ASL $BD              ; 06 BD
    SBC $2B              ; F2 2B
    BEQ $8D47            ; F0 03
    STA $AD71,X          ; 9D 71 AD
    DEX                  ; CA
    DEX                  ; CA
    BPL $8D3F            ; 10 F4
    RTL                  ; 6B
    PHA                  ; 48
    PHX                  ; DA
    LDX #$00             ; A2 00
    BRK $9E              ; 00 9E
    AND $E8C0,Y          ; 39 C0 E8
    INX                  ; E8
    CPX #$40             ; E0 40
    BRK $90              ; 00 90
    INC $FA,X            ; F6 FA
    PLA                  ; 68
    RTL                  ; 6B

Engine_Function_031:
    PHP                  ; 08

Engine_Function_032:
    REP #$30             ; C2 30
    PHA                  ; 48
    PHX                  ; DA
    PHY                  ; 5A

Engine_Function_033:
    PHB                  ; 8B
    PEA $7E7E            ; F4 7E 7E
    PLB                  ; AB
    PLB                  ; AB
    LDX #$00             ; A2 00
    BRK $9E              ; 00 9E
    WDM $7C              ; 42 7C
    INX                  ; E8
    INX                  ; E8
    CPX #$40             ; E0 40
    BRK $90              ; 00 90
    INC $A2,X            ; F6 A2
    BRK $00              ; 00 00
    STZ $7D02,X          ; 9E 02 7D
    INX                  ; E8
    INX                  ; E8
    CPX #$42             ; E0 42
    BRK $90              ; 00 90
    INC $A9,X            ; F6 A9
    BRK $51              ; 00 51
    STA $7D44            ; 8D 44 7D
    CLC                  ; 18
    ADC #$40             ; 69 40
    ORA $868D3A,X        ; 1F 3A 8D 86
    ADC $00A9,X          ; 7D A9 00
    BRA $8D23            ; 80 8D
    COP $7D              ; 02 7D
    PLB                  ; AB

Engine_Function_034:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    RTL                  ; 6B

Engine_Function_035:
    PHP                  ; 08

Engine_Function_036:
    REP #$30             ; C2 30
    PHA                  ; 48
    PHX                  ; DA
    PHY                  ; 5A

Engine_Function_037:
    PHB                  ; 8B
    PEA $7E7E            ; F4 7E 7E
    PLB                  ; AB
    PLB                  ; AB
    STA $7DCA            ; 8D CA 7D
    LDX #$00             ; A2 00
    BRK $BD              ; 00 BD
    COP $7D              ; 02 7D
    BPL $8DC4            ; 10 0D
    LDA $7D86,X          ; BD 86 7D
    SEC                  ; 38
    SBC $7D44,X          ; FD 44 7D
    INC                  ; 1A
    CMP $7DCA            ; CD CA 7D
    BCS $8DCE            ; B0 0A
    INX                  ; E8
    INX                  ; E8
    CPX #$42             ; E0 42
    BRK $90              ; 00 90
    SBC $4C              ; E7 4C
    ORA $8E              ; 12 8E
    LDY #$00             ; A0 00
    BRK $B9              ; 00 B9
    WDM $7C              ; 42 7C
    BPL $8DE0            ; 10 0A
    INY                  ; C8
    INY                  ; C8
    CPY #$40             ; C0 40
    BRK $90              ; 00 90
    PEA $124C            ; F4 4C 12
    STX $44BD            ; 8E BD 44
    ADC $8299,X          ; 7D 99 82
    JMP ($6D18,X)        ; 7C 18 6D
    DEX                  ; CA
    ADC $993A,X          ; 7D 3A 99

Engine_Function_038:
    REP #$7C             ; C2 7C
    INC                  ; 1A
    STA $7D44,X          ; 9D 44 7D
    CMP $7D86,X          ; DD 86 7D
    BCC $8DFA            ; 90 03
    JSR $8F77            ; 20 77 8F
    LDA #$00             ; A9 00
    BRA $8D97            ; 80 99
    WDM $7C              ; 42 7C

Engine_Function_039:
    STY $7DC8            ; 8C C8 7D
    LDA $7C82,Y          ; B9 82 7C
    STA $7DCC            ; 8D CC 7D
    PLB                  ; AB

Engine_Function_03A:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    SEC                  ; 38
    RTL                  ; 6B
    PLB                  ; AB

Engine_Function_03B:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    CLC                  ; 18
    RTL                  ; 6B

Engine_Function_03C:
    PHP                  ; 08

Engine_Function_03D:
    REP #$30             ; C2 30
    PHA                  ; 48
    PHX                  ; DA
    PHY                  ; 5A

Engine_Function_03E:
    PHB                  ; 8B
    PEA $7E7E            ; F4 7E 7E
    PLB                  ; AB
    PLB                  ; AB
    TXY                  ; 9B
    LDA $7C42,Y          ; B9 42 7C
    BPL $8EA8            ; 10 7B
    LDA $7C82,Y          ; B9 82 7C
    STA $7DCC            ; 8D CC 7D
    LDA $7CC2,Y          ; B9 C2 7C
    STA $7DCE            ; 8D CE 7D
    LDA #$00             ; A9 00
    BRK $99              ; 00 99
    WDM $7C              ; 42 7C
    LDX #$00             ; A2 00
    BRK $BD              ; 00 BD
    COP $7D              ; 02 7D
    BPL $8E4F            ; 10 08
    LDA $7D44,X          ; BD 44 7D
    CMP $7DCC            ; CD CC 7D
    BCS $8E73            ; B0 24
    INX                  ; E8
    INX                  ; E8
    CPX #$42             ; E0 42
    BRK $90              ; 00 90
    CPX $40A2            ; EC A2 40
    BRK $BD              ; 00 BD
    COP $7D              ; 02 7D
    BPL $8E6C            ; 10 0E
    INX                  ; E8
    INX                  ; E8
    CPX #$42             ; E0 42
    BRK $B0              ; 00 B0
    EOR $BD              ; 43 BD
    COP $7D              ; 02 7D
    BPL $8E73            ; 10 09
    DEX                  ; CA
    DEX                  ; CA
    DEX                  ; CA
    DEX                  ; CA
    BPL $8E59            ; 10 E9
    LDX #$00             ; A2 00
    BRK $9B              ; 00 9B
    DEY                  ; 88
    DEY                  ; 88
    BMI $8E81            ; 30 09
    LDA $7D86,Y          ; B9 86 7D
    INC                  ; 1A
    CMP $7DCC            ; CD CC 7D
    BEQ $8E86            ; F0 05
    JSR $8F41            ; 20 41 8F
    BRA $8E8D            ; 80 07
    LDA $7DCE            ; AD CE 7D
    STA $7D86,Y          ; 99 86 7D
    TYX                  ; BB
    TXY                  ; 9B
    INY                  ; C8
    INY                  ; C8
    CPY #$42             ; C0 42
    BRK $B0              ; 00 B0
    ORA $AD              ; 13 AD
    DEC $1A7D            ; CE 7D 1A
    CMP $7D44,Y          ; D9 44 7D
    BNE $8EA8            ; D0 0A
    LDA $7D86,Y          ; B9 86 7D
    STA $7D86,X          ; 9D 86 7D
    TYX                  ; BB
    JSR $8F77            ; 20 77 8F
    PLB                  ; AB

Engine_Function_03F:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    RTL                  ; 6B

Engine_Function_040:
    PHP                  ; 08

Engine_Function_041:
    REP #$30             ; C2 30
    PHA                  ; 48
    PHX                  ; DA
    PHY                  ; 5A

Engine_Function_042:
    PHB                  ; 8B
    PEA $7E7E            ; F4 7E 7E
    PLB                  ; AB
    PLB                  ; AB
    LDA #$10             ; A9 10
    ASL $CA8D            ; 0E 8D CA
    ADC $00A9,X          ; 7D A9 00
    EOR $18              ; 51 18
    ADC #$40             ; 69 40
    ORA $CE8D3A,X        ; 1F 3A 8D CE
    ADC $00A2,X          ; 7D A2 00
    BRK $BD              ; 00 BD
    COP $7D              ; 02 7D
    BPL $8EE7            ; 10 12
    LDA $7D86,X          ; BD 86 7D
    CMP $7DCE            ; CD CE 7D
    BNE $8EE7            ; D0 0A
    SEC                  ; 38
    SBC $7D44,X          ; FD 44 7D
    INC                  ; 1A
    CMP $7DCA            ; CD CA 7D
    BCS $8EF1            ; B0 0A
    INX                  ; E8
    INX                  ; E8
    CPX #$42             ; E0 42
    BRK $90              ; 00 90

Engine_Function_043:
    SEP #$4C             ; E2 4C
    SEC                  ; 38
    STA $0000A0          ; 8F A0 00 00
    LDA $7C42,Y          ; B9 42 7C
    BPL $8F03            ; 10 0A
    INY                  ; C8
    INY                  ; C8
    CPY #$40             ; C0 40
    BRK $90              ; 00 90
    PEA $384C            ; F4 4C 38
    STA $7D86BD          ; 8F BD 86 7D
    STA $7CC2,Y          ; 99 C2 7C
    SEC                  ; 38
    SBC $7DCA            ; ED CA 7D
    INC                  ; 1A
    STA $7C82,Y          ; 99 82 7C
    DEC                  ; 3A
    STA $7D86,X          ; 9D 86 7D
    LDA $7D44,X          ; BD 44 7D
    CMP $7D86,X          ; DD 86 7D
    BCC $8F20            ; 90 03
    JSR $8F77            ; 20 77 8F
    LDA #$00             ; A9 00
    BRA $8EBD            ; 80 99
    WDM $7C              ; 42 7C
    STY $7DC8            ; 8C C8 7D
    LDA $7C82,Y          ; B9 82 7C
    STA $7DCC            ; 8D CC 7D
    PLB                  ; AB

Engine_Function_044:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    SEC                  ; 38
    RTL                  ; 6B
    PLB                  ; AB

Engine_Function_045:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    CLC                  ; 18
    RTL                  ; 6B
    PHX                  ; DA
    LDX #$3E             ; A2 3E
    BRK $BD              ; 00 BD
    COP $7D              ; 02 7D
    STA $7D04,X          ; 9D 04 7D
    LDA $7D44,X          ; BD 44 7D
    STA $7D46,X          ; 9D 46 7D
    LDA $7D86,X          ; BD 86 7D
    STA $7D88,X          ; 9D 88 7D
    TXA                  ; 8A
    CMP $01              ; C3 01
    BEQ $8F60            ; F0 04
    DEX                  ; CA
    DEX                  ; CA
    BPL $8F45            ; 10 E5
    LDA $01              ; A3 01
    TAX                  ; AA
    LDA #$00             ; A9 00
    BRA $8F04            ; 80 9D
    COP $7D              ; 02 7D
    LDA $7DCC            ; AD CC 7D
    STA $7D44,X          ; 9D 44 7D
    LDA $7DCE            ; AD CE 7D
    STA $7D86,X          ; 9D 86 7D
    PLX                  ; FA
    RTS                  ; 60
    PHX                  ; DA
    INX                  ; E8
    INX                  ; E8
    CPX #$42             ; E0 42
    BRK $B0              ; 00 B0
    TRB $BD              ; 14 BD
    COP $7D              ; 02 7D
    STA $7D00,X          ; 9D 00 7D
    LDA $7D44,X          ; BD 44 7D
    STA $7D42,X          ; 9D 42 7D
    LDA $7D86,X          ; BD 86 7D
    STA $7D84,X          ; 9D 84 7D
    BRA $8F78            ; 80 E5
    PLX                  ; FA
    RTS                  ; 60

Engine_Function_046:
    PHP                  ; 08

Engine_Function_047:
    REP #$30             ; C2 30
    PHA                  ; 48
    PHX                  ; DA
    PHY                  ; 5A

Engine_Function_048:
    PHB                  ; 8B
    PEA $7F7F            ; F4 7F 7F
    PLB                  ; AB
    PLB                  ; AB
    LDX #$00             ; A2 00
    BRK $9E              ; 00 9E
    PEI $AD              ; D4 AD
    INX                  ; E8
    INX                  ; E8
    CPX #$20             ; E0 20
    BRK $90              ; 00 90
    INC $A2,X            ; F6 A2
    BRK $00              ; 00 00
    STZ $AE34,X          ; 9E 34 AE
    INX                  ; E8
    INX                  ; E8
    CPX #$22             ; E0 22
    BRK $90              ; 00 90
    INC $A9,X            ; F6 A9
    BRK $00              ; 00 00
    STA $AE56            ; 8D 56 AE
    CLC                  ; 18
    ADC #$D4             ; 69 D4
    LDA $8D3A            ; AD 3A 8D
    SEI                  ; 78
    LDX $00A9            ; AE A9 00
    BRA $8F5A            ; 80 8D
    BIT $AE,X            ; 34 AE
    PLB                  ; AB

Engine_Function_049:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    RTL                  ; 6B

Engine_Function_04A:
    PHP                  ; 08

Engine_Function_04B:
    REP #$30             ; C2 30
    PHA                  ; 48
    PHX                  ; DA
    PHY                  ; 5A

Engine_Function_04C:
    PHB                  ; 8B
    PEA $7F7F            ; F4 7F 7F
    PLB                  ; AB
    PLB                  ; AB
    STA $AE9C            ; 8D 9C AE
    LDX #$00             ; A2 00
    BRK $BD              ; 00 BD
    BIT $AE,X            ; 34 AE
    BPL $8FFB            ; 10 0D
    LDA $AE78,X          ; BD 78 AE
    SEC                  ; 38
    SBC $AE56,X          ; FD 56 AE
    INC                  ; 1A
    CMP $AE9C            ; CD 9C AE
    BCS $9005            ; B0 0A
    INX                  ; E8
    INX                  ; E8
    CPX #$22             ; E0 22
    BRK $90              ; 00 90
    SBC $4C              ; E7 4C
    EOR #$90             ; 49 90
    LDY #$00             ; A0 00
    BRK $B9              ; 00 B9
    PEI $AD              ; D4 AD
    BPL $9017            ; 10 0A
    INY                  ; C8
    INY                  ; C8
    CPY #$20             ; C0 20
    BRK $90              ; 00 90
    PEA $494C            ; F4 4C 49
    BCC $8FD5            ; 90 BD
    LSR $AE,X            ; 56 AE
    STA $ADF4,Y          ; 99 F4 AD
    CLC                  ; 18
    ADC $AE9C            ; 6D 9C AE
    DEC                  ; 3A
    STA $AE14,Y          ; 99 14 AE
    INC                  ; 1A
    STA $AE56,X          ; 9D 56 AE
    CMP $AE78,X          ; DD 78 AE
    BCC $9031            ; 90 03
    JSR $9103            ; 20 03 91
    LDA #$00             ; A9 00
    BRA $8FCE            ; 80 99
    PEI $AD              ; D4 AD
    STY $AE9A            ; 8C 9A AE
    LDA $ADF4,Y          ; B9 F4 AD
    STA $AE9E            ; 8D 9E AE
    PLB                  ; AB

Engine_Function_04D:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    SEC                  ; 38
    RTL                  ; 6B
    PLB                  ; AB

Engine_Function_04E:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    CLC                  ; 18
    RTL                  ; 6B

Engine_Function_04F:
    PHP                  ; 08

Engine_Function_050:
    REP #$30             ; C2 30
    PHA                  ; 48
    PHX                  ; DA
    PHY                  ; 5A

Engine_Function_051:
    PHB                  ; 8B
    PEA $7F7F            ; F4 7F 7F
    PLB                  ; AB
    PLB                  ; AB
    TXY                  ; 9B
    LDA $ADD4,Y          ; B9 D4 AD
    BPL $90C5            ; 10 61
    LDA $ADF4,Y          ; B9 F4 AD
    STA $AE9E            ; 8D 9E AE
    LDA $AE14,Y          ; B9 14 AE
    STA $AEA0            ; 8D A0 AE
    LDA #$00             ; A9 00
    BRK $99              ; 00 99
    PEI $AD              ; D4 AD
    LDX #$00             ; A2 00
    BRK $BD              ; 00 BD
    BIT $AE,X            ; 34 AE
    BPL $9086            ; 10 08
