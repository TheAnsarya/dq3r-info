;==============================================================================
; Dragon Quest III - Game Engine (Bank 01)
; Main game logic and system management
;==============================================================================

.include "hardware.inc"

.segment "ENGINE_CODE"

Engine_Function_0000:
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
    PHP                  ; 08
    BRK $29              ; 00 29
    SBC $028500,X        ; FF 00 85 02
    LDA #$0E             ; A9 0E
    BRK $20              ; 00 20
    PLY                  ; 7A
    STY $AB              ; 84 AB
Engine_Function_005E:
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

Engine_Function_006E:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28

Engine_Function_0074:
    CLC                  ; 18
    RTL                  ; 6B
    PHP                  ; 08

Engine_Function_0077:
    REP #$30             ; C2 30
    PHA                  ; 48
    PHX                  ; DA
    PHY                  ; 5A
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

Engine_Function_00AF:
    SEP #$20             ; E2 20
    LDA $E0B2            ; AD B2 E0
    XBA                  ; EB
    LDA $E0B4            ; AD B4 E0
    JSL $C01098          ; 22 98 10 C0

Engine_Function_00BC:
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
    PHP                  ; 08
    BRK $29              ; 00 29
    SBC $028500,X        ; FF 00 85 02
    LDA #$10             ; A9 10
    BRK $20              ; 00 20
    PLY                  ; 7A
    STY $AB              ; 84 AB

Engine_Function_0157:
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

Engine_Function_0167:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28

Engine_Function_016D:
    CLC                  ; 18
    RTL                  ; 6B
    PHP                  ; 08

Engine_Function_0170:
    REP #$30             ; C2 30
    PHA                  ; 48
    PHX                  ; DA
    PHY                  ; 5A
    PHB                  ; 8B

Engine_Function_0176:
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

Engine_Function_01BD:
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

Engine_Function_023C:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    SEC                  ; 38
    RTL                  ; 6B
    PLB                  ; AB

Engine_Function_0245:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28

Engine_Function_024B:
    CLC                  ; 18
    RTL                  ; 6B
    PHP                  ; 08

Engine_Function_024E:
    REP #$30             ; C2 30
    PHA                  ; 48
    PHX                  ; DA
    PHY                  ; 5A
    PHB                  ; 8B

Engine_Function_0254:
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

Engine_Function_029B:
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

Engine_Function_031A:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    SEC                  ; 38
    RTL                  ; 6B
    PLB                  ; AB

Engine_Function_0323:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28

Engine_Function_0329:
    CLC                  ; 18
    RTL                  ; 6B
    PHP                  ; 08

Engine_Function_032C:
    REP #$30             ; C2 30
    PHA                  ; 48
    PHX                  ; DA
    PHY                  ; 5A
    PHB                  ; 8B

Engine_Function_0332:
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

Engine_Function_0379:
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

Engine_Function_03F8:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    SEC                  ; 38
    RTL                  ; 6B

Engine_Function_0400:
    PLB                  ; AB

Engine_Function_0401:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28

Engine_Function_0407:
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

Engine_Function_0458:
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

Engine_Function_0472:
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

Engine_Function_0497:
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

Engine_Function_04DC:
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

Engine_Function_0510:
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

Engine_Function_0525:
    CLC                  ; 18
    ADC $01              ; 63 01
    DEC                  ; 3A
    STA $E462,Y          ; 99 62 E4
    PLA                  ; 68
    RTS                  ; 60

Engine_Function_052E:
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

Engine_Function_0541:
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
    PHP                  ; 08
    BRK $8D              ; 00 8D

Engine_Function_05C8:
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

Engine_Function_0660:
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

Engine_Function_0700:
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

Engine_Function_07D6:
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

Engine_Function_0855:
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
