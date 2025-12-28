;==============================================================================
; Dragon Quest III - Boot System (Bank $00)
; Comprehensive code extraction
;==============================================================================

.include "hardware.inc"

.segment "BOOT_CODE"

Boot_Function_000:
    JSR $74A9            ; 20 A9 74
    BCC $FF0E            ; 90 09
    PLB                  ; AB

Boot_Function_001:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    SEC                  ; 38
    RTL                  ; 6B
    LDX $AEA2            ; AE A2 AE
    JSL $C0601F          ; 22 1F 60 C0
    LDX $AE9A            ; AE 9A AE
    JSL $C09052          ; 22 52 90 C0
    PLB                  ; AB

Boot_Function_002:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    CLC                  ; 18
    RTL                  ; 6B

Boot_Function_003:
    PHP                  ; 08

Boot_Function_004:
    REP #$30             ; C2 30
    PHA                  ; 48
    PHX                  ; DA
    PHY                  ; 5A

Boot_Function_005:
    PHB                  ; 8B
    PEA $7F7F            ; F4 7F 7F
    PLB                  ; AB
    PLB                  ; AB
    STX $E086            ; 8E 86 E0
    STY $E088            ; 8C 88 E0
    TXA                  ; 8A
    ORA $E088            ; 0D 88 E0
    BEQ $FF7E            ; F0 41

Boot_Function_006:
    SEP #$20             ; E2 20
    LDA $E086            ; AD 86 E0
    XBA                  ; EB
    LDA $E088            ; AD 88 E0
    JSL $C01098          ; 22 98 10 C0

Boot_Function_007:
    REP #$20             ; C2 20
    STA $E08A            ; 8D 8A E0
    ASL                  ; 0A
    JSL $C08FD7          ; 22 D7 8F C0
    BCC $FF7E            ; 90 28
    LDX #$00             ; A2 00
    BRK $22              ; 00 22
    SBC $5C              ; E1 5C
    CPY #$90             ; C0 90
    CLC                  ; 18
    LDA #$00             ; A9 00
    BRK $20              ; 00 20
    STZ $9075            ; 9C 75 90
    ORA #$AB             ; 09 AB

Boot_Function_008:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    SEC                  ; 38
    RTL                  ; 6B
    LDX $AEA2            ; AE A2 AE
    JSL $C05F21          ; 22 21 5F C0
    LDX $AE9A            ; AE 9A AE
    JSL $C09052          ; 22 52 90 C0
    PLB                  ; AB

Boot_Function_009:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    CLC                  ; 18
    RTL                  ; 6B

Boot_Function_00A:
    PHP                  ; 08

Boot_Function_00B:
    REP #$30             ; C2 30
    PHA                  ; 48
    PHX                  ; DA
    PHY                  ; 5A

Boot_Function_00C:
    PHB                  ; 8B
    PEA $7F7F            ; F4 7F 7F
    PLB                  ; AB
    PLB                  ; AB
    STX $E086            ; 8E 86 E0
    STY $E088            ; 8C 88 E0
    TXA                  ; 8A
    ORA $E088            ; 0D 88 E0
    BEQ $FFE0            ; F0 41

Boot_Function_00D:
    SEP #$20             ; E2 20
    LDA $E086            ; AD 86 E0
    XBA                  ; EB
    LDA $E088            ; AD 88 E0
    JSL $C01098          ; 22 98 10 C0

Boot_Function_00E:
    REP #$20             ; C2 20
    STA $E08A            ; 8D 8A E0
    ASL                  ; 0A
    JSL $C08FD7          ; 22 D7 8F C0
    BCC $FFE0            ; 90 28
    LDX #$00             ; A2 00
    BRK $22              ; 00 22
    LDA $5D              ; A1 5D
    CPY #$90             ; C0 90
    CLC                  ; 18
    LDA #$02             ; A9 02
    BRK $20              ; 00 20
    STZ $9075            ; 9C 75 90
    ORA #$AB             ; 09 AB

Boot_Function_00F:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    SEC                  ; 38
    RTL                  ; 6B
    LDX $AEA2            ; AE A2 AE
    JSL $C05FA0          ; 22 A0 5F C0
    LDX $AE9A            ; AE 9A AE
    JSL $C09052          ; 22 52 90 C0
    PLB                  ; AB

Boot_Function_010:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    CLC                  ; 18
    RTL                  ; 6B

Boot_Function_011:
    PHP                  ; 08

Boot_Function_012:
    REP #$30             ; C2 30
    PHA                  ; 48
    PHX                  ; DA
    PHY                  ; 5A

Boot_Function_013:
    PHB                  ; 8B
    PEA $7F7F            ; F4 7F 7F
    PLB                  ; AB
    PLB                  ; AB
    STX $E086            ; 8E 86 E0
    STY $E088            ; 8C 88 E0
    TXA                  ; 8A
    ORA $E088            ; 0D 88 E0
    BEQ $0042            ; F0 41

Boot_Function_014:
    SEP #$20             ; E2 20
    LDA $E086            ; AD 86 E0
    XBA                  ; EB
    LDA $E088            ; AD 88 E0
    JSL $C01098          ; 22 98 10 C0

Boot_Function_015:
    REP #$20             ; C2 20
    STA $E08A            ; 8D 8A E0
    ASL                  ; 0A
    JSL $C08FD7          ; 22 D7 8F C0
    BCC $0042            ; 90 28
    LDX #$00             ; A2 00
    BRK $22              ; 00 22
    ADC $5E              ; 61 5E
    CPY #$90             ; C0 90
    CLC                  ; 18
    LDA #$04             ; A9 04
    BRK $20              ; 00 20
    STZ $9075            ; 9C 75 90
    ORA #$AB             ; 09 AB

Boot_Function_016:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    SEC                  ; 38
    RTL                  ; 6B
    LDX $AEA2            ; AE A2 AE
    JSL $C0601F          ; 22 1F 60 C0
    LDX $AE9A            ; AE 9A AE
    JSL $C09052          ; 22 52 90 C0
    PLB                  ; AB

Boot_Function_017:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    CLC                  ; 18
    RTL                  ; 6B

Boot_Function_018:
    PHP                  ; 08

Boot_Function_019:
    REP #$30             ; C2 30
    PHA                  ; 48
    PHX                  ; DA
    PHY                  ; 5A

Boot_Function_01A:
    PHB                  ; 8B
    PEA $7F7F            ; F4 7F 7F
    PLB                  ; AB
    PLB                  ; AB
    LDA $E3E2,Y          ; B9 E2 E3
    BPL $0061            ; 10 05
    LDA $E4A2,Y          ; B9 A2 E4
    BPL $0064            ; 10 03
    JMP $71FB            ; 4C FB 71
    JSR $754E            ; 20 4E 75
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $AB              ; 00 AB
    ORA $C5              ; 01 C5
    BRK $00              ; 00 00
    SBC $8D0000,X        ; FF 00 00 8D
    STX $E0,Y            ; 96 E0
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $AB              ; 00 AB
    ORA $C5              ; 01 C5
    ORA $00              ; 01 00
    SBC $8D0000,X        ; FF 00 00 8D
    TXS                  ; 9A
    CPX #$E2             ; E0 E2
    JSR $96AD            ; 20 AD 96
    CPX #$EB             ; E0 EB
    LDA $E09A            ; AD 9A E0
    JSL $C01098          ; 22 98 10 C0

Boot_Function_01B:
    REP #$20             ; C2 20
    STA $E08A            ; 8D 8A E0
    JSL $C903EE          ; 22 EE 03 C9
    BRK $09              ; 00 09
    BRK $AB              ; 00 AB
    ORA $C5              ; 01 C5
    ASL $00              ; 06 00
    STA $00              ; 85 00
    JSL $C903EE          ; 22 EE 03 C9
    BRK $09              ; 00 09
    BRK $AB              ; 00 AB
    ORA $C5              ; 01 C5

Boot_Function_01C:
    PHP                  ; 08
    BRK $29              ; 00 29
    SBC $028500,X        ; FF 00 85 02
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $AB              ; 00 AB
    ORA $C5              ; 01 C5
    BRK $00              ; 00 00
    SBC $850000,X        ; FF 00 00 85
    TSB $7222            ; 0C 22 72
    ORA $C9              ; 05 C9
    BRK $09              ; 00 09
    BRK $AB              ; 00 AB
    ORA $C5              ; 01 C5
    TSB $00              ; 04 00
    SBC $AA0003,X        ; FF 03 00 AA
    JSL $C05CE1          ; 22 E1 5C C0
    BCC $00FB            ; 90 18
    JSR $7563            ; 20 63 75
    LDA $AEA6            ; AD A6 AE
    STA $2E              ; 85 2E
    LDA $E08A            ; AD 8A E0
    JSL $C04A5B          ; 22 5B 4A C0
    PLB                  ; AB

Boot_Function_01D:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    SEC                  ; 38
    RTL                  ; 6B
    PLB                  ; AB

Boot_Function_01E:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA

Boot_Function_01F:
    PLA                  ; 68
    PLP                  ; 28
    CLC                  ; 18
    RTL                  ; 6B

Boot_Function_020:
    PHP                  ; 08

Boot_Function_021:
    REP #$30             ; C2 30
    PHA                  ; 48
    PHX                  ; DA
    PHY                  ; 5A

Boot_Function_022:
    PHB                  ; 8B
    PEA $7F7F            ; F4 7F 7F
    PLB                  ; AB
    PLB                  ; AB
    LDA $E3E2,Y          ; B9 E2 E3
    BPL $011A            ; 10 05
    LDA $E4A2,Y          ; B9 A2 E4
    BPL $011D            ; 10 03
    JMP $72B4            ; 4C B4 72
    JSR $754E            ; 20 4E 75
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $50              ; 00 50
    CLC                  ; 18
    CMP $00              ; C5 00
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    STA $E096            ; 8D 96 E0
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $50              ; 00 50
    CLC                  ; 18
    CMP $01              ; C5 01
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    STA $E09A            ; 8D 9A E0

Boot_Function_023:
    SEP #$20             ; E2 20
    LDA $E096            ; AD 96 E0
    XBA                  ; EB
    LDA $E09A            ; AD 9A E0
    JSL $C01098          ; 22 98 10 C0

Boot_Function_024:
    REP #$20             ; C2 20
    STA $E08A            ; 8D 8A E0
    JSL $C903EE          ; 22 EE 03 C9
    BRK $09              ; 00 09
    BRK $50              ; 00 50
    CLC                  ; 18
    CMP $06              ; C5 06
    BRK $85              ; 00 85
    BRK $22              ; 00 22
    INC $C903            ; EE 03 C9
    BRK $09              ; 00 09
    BRK $50              ; 00 50
    CLC                  ; 18
    CMP $08              ; C5 08
    BRK $29              ; 00 29
    SBC $028500,X        ; FF 00 85 02
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $50              ; 00 50
    CLC                  ; 18
    CMP $00              ; C5 00
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    STA $0C              ; 85 0C
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $50              ; 00 50
    CLC                  ; 18
    CMP $04              ; C5 04
    BRK $FF              ; 00 FF
    ORA $00              ; 03 00
    TAX                  ; AA
    JSL $C05DA1          ; 22 A1 5D C0
    BCC $01B4            ; 90 18
    JSR $7563            ; 20 63 75
    LDA $AEA6            ; AD A6 AE
    STA $2E              ; 85 2E
    LDA $E08A            ; AD 8A E0
    JSL $C04A5B          ; 22 5B 4A C0
    PLB                  ; AB

Boot_Function_025:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    SEC                  ; 38
    RTL                  ; 6B
    PLB                  ; AB

Boot_Function_026:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    CLC                  ; 18
    RTL                  ; 6B

Boot_Function_027:
    PHP                  ; 08

Boot_Function_028:
    REP #$30             ; C2 30
    PHA                  ; 48
    PHX                  ; DA
    PHY                  ; 5A

Boot_Function_029:
    PHB                  ; 8B
    PEA $7F7F            ; F4 7F 7F
    PLB                  ; AB
    PLB                  ; AB
    LDA $E3E2,Y          ; B9 E2 E3
    BPL $01D3            ; 10 05
    LDA $E4A2,Y          ; B9 A2 E4
    BPL $01D6            ; 10 03
    JMP $736D            ; 4C 6D 73
    JSR $754E            ; 20 4E 75
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $78              ; 00 78
    WDM $C5              ; 42 C5
    BRK $00              ; 00 00
    SBC $8D0000,X        ; FF 00 00 8D
    STX $E0,Y            ; 96 E0
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $78              ; 00 78
    WDM $C5              ; 42 C5
    ORA $00              ; 01 00
    SBC $8D0000,X        ; FF 00 00 8D
    TXS                  ; 9A
    CPX #$E2             ; E0 E2
    JSR $96AD            ; 20 AD 96
    CPX #$EB             ; E0 EB
    LDA $E09A            ; AD 9A E0
    JSL $C01098          ; 22 98 10 C0

Boot_Function_02A:
    REP #$20             ; C2 20
    STA $E08A            ; 8D 8A E0
    JSL $C903EE          ; 22 EE 03 C9
    BRK $09              ; 00 09
    BRK $78              ; 00 78
    WDM $C5              ; 42 C5
    ASL $00              ; 06 00
    STA $00              ; 85 00
    JSL $C903EE          ; 22 EE 03 C9
    BRK $09              ; 00 09
    BRK $78              ; 00 78
    WDM $C5              ; 42 C5

Boot_Function_02B:
    PHP                  ; 08
    BRK $29              ; 00 29
    SBC $028500,X        ; FF 00 85 02
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $78              ; 00 78
    WDM $C5              ; 42 C5
    BRK $00              ; 00 00
    SBC $850000,X        ; FF 00 00 85
    TSB $7222            ; 0C 22 72
    ORA $C9              ; 05 C9
    BRK $09              ; 00 09
    BRK $78              ; 00 78
    WDM $C5              ; 42 C5
    TSB $00              ; 04 00
    SBC $AA0003,X        ; FF 03 00 AA
    JSL $C05E61          ; 22 61 5E C0
    BCC $026D            ; 90 18
    JSR $7563            ; 20 63 75
    LDA $AEA6            ; AD A6 AE
    STA $2E              ; 85 2E
    LDA $E08A            ; AD 8A E0
    JSL $C04A5B          ; 22 5B 4A C0
    PLB                  ; AB

Boot_Function_02C:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    SEC                  ; 38
    RTL                  ; 6B
    PLB                  ; AB

Boot_Function_02D:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    CLC                  ; 18
    RTL                  ; 6B

Boot_Function_02E:
    PHP                  ; 08

Boot_Function_02F:
    REP #$30             ; C2 30
    PHA                  ; 48
    PHX                  ; DA
    PHY                  ; 5A

Boot_Function_030:
    PHB                  ; 8B
    PEA $7F7F            ; F4 7F 7F
    PLB                  ; AB
    PLB                  ; AB
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $AB              ; 00 AB
    ORA $C5              ; 01 C5
    BRK $00              ; 00 00
    SBC $290000,X        ; FF 00 00 29
    ORA $00              ; 03 00
    STA $E096            ; 8D 96 E0
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $AB              ; 00 AB
    ORA $C5              ; 01 C5
    ORA $00              ; 01 00
    SBC $290000,X        ; FF 00 00 29
    ORA $00              ; 01 00
    STA $E09A            ; 8D 9A E0

Boot_Function_031:
    SEP #$20             ; E2 20
    LDA $E096            ; AD 96 E0
    XBA                  ; EB
    LDA $E09A            ; AD 9A E0
    JSL $C01098          ; 22 98 10 C0

Boot_Function_032:
    REP #$20             ; C2 20
    STA $E08A            ; 8D 8A E0
    JSL $C903EE          ; 22 EE 03 C9
    BRK $09              ; 00 09
    BRK $AB              ; 00 AB
    ORA $C5              ; 01 C5
    ASL $00              ; 06 00
    STA $00              ; 85 00
    JSL $C903EE          ; 22 EE 03 C9
    BRK $09              ; 00 09
    BRK $AB              ; 00 AB
    ORA $C5              ; 01 C5

Boot_Function_033:
    PHP                  ; 08
    BRK $29              ; 00 29
    SBC $028500,X        ; FF 00 85 02
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $AB              ; 00 AB
    ORA $C5              ; 01 C5
    BRK $00              ; 00 00
    SBC $850000,X        ; FF 00 00 85
    TSB $7222            ; 0C 22 72
    ORA $C9              ; 05 C9
    BRK $09              ; 00 09
    BRK $AB              ; 00 AB
    ORA $C5              ; 01 C5
    TSB $00              ; 04 00
    SBC $AA0003,X        ; FF 03 00 AA
    JSL $C05CE1          ; 22 E1 5C C0
    BCC $0349            ; 90 45
    STZ $04              ; 64 04
    LDA $E096            ; AD 96 E0
    STA $06              ; 85 06
    STZ $08              ; 64 08
    LDA $E09A            ; AD 9A E0
    STA $0A              ; 85 0A
    LDA $E442,Y          ; B9 42 E4
    SEC                  ; 38
    SBC $E432,Y          ; F9 32 E4
    INC                  ; 1A
    ASL                  ; 0A
    STA $0E              ; 85 0E
    LDX #$18             ; A2 18
    BRK $85              ; 00 85
    CLC                  ; 18
    LDA $E090            ; AD 90 E0
    JSL $C010D6          ; 22 D6 10 C0
    LDA $E08C            ; AD 8C E0
    ASL                  ; 0A
    CLC                  ; 18
    ADC $18              ; 65 18
    ADC $E412,Y          ; 79 12 E4
    TAX                  ; AA
    LDA $AEA6            ; AD A6 AE
    STA $2E              ; 85 2E
    LDA $E08A            ; AD 8A E0
    JSL $C04A5B          ; 22 5B 4A C0
    PLB                  ; AB

Boot_Function_034:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    SEC                  ; 38
    RTL                  ; 6B
    PLB                  ; AB

Boot_Function_035:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    CLC                  ; 18
    RTL                  ; 6B

Boot_Function_036:
    PHP                  ; 08

Boot_Function_037:
    REP #$30             ; C2 30
    PHA                  ; 48
    PHX                  ; DA
    PHY                  ; 5A

Boot_Function_038:
    PHB                  ; 8B
    SEI                  ; 78
    PEA $7F7F            ; F4 7F 7F
    PLB                  ; AB
    PLB                  ; AB
    STA $E096            ; 8D 96 E0
    STX $E09A            ; 8E 9A E0
    LDA $E3E2,Y          ; B9 E2 E3
    BPL $03A0            ; 10 36
    LDA $E4A2,Y          ; B9 A2 E4
    BMI $03A0            ; 30 31
    JSR $754E            ; 20 4E 75

Boot_Function_039:
    SEP #$20             ; E2 20
    LDA $E096            ; AD 96 E0
    XBA                  ; EB
    LDA $E09A            ; AD 9A E0
    JSL $C01098          ; 22 98 10 C0

Boot_Function_03A:
    REP #$20             ; C2 20
    STA $E08A            ; 8D 8A E0
    LDA $E096            ; AD 96 E0
    STA $0C              ; 85 0C
    JSR $7563            ; 20 63 75
    STZ $00              ; 64 00
    STZ $2E              ; 64 2E
    LDA $E08A            ; AD 8A E0
    JSL $C04C15          ; 22 15 4C C0
    PLB                  ; AB

Boot_Function_03B:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    SEC                  ; 38
    RTL                  ; 6B
    PLB                  ; AB

Boot_Function_03C:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    CLC                  ; 18
    RTL                  ; 6B
    JSL $C05A71          ; 22 71 5A C0
    BCS $03B0            ; B0 01
    RTS                  ; 60
    JSR $74D0            ; 20 D0 74
    LDA $E412,Y          ; B9 12 E4
    TAX                  ; AA
    LDA $E08A            ; AD 8A E0
    JSL $C04923          ; 22 23 49 C0
    TAY                  ; A8
    LDA $0000,X          ; BD 00 00
    CLC                  ; 18
    ADC $AEA6            ; 6D A6 AE
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEY                  ; 88
    BNE $03BF            ; D0 F1
    SEC                  ; 38
    RTS                  ; 60
    STA $E3F2,Y          ; 99 F2 E3
    LDA $AEA2            ; AD A2 AE
    STA $E492,Y          ; 99 92 E4
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
    JSL $00A9E4          ; 22 E4 A9 00
    BRA $0395            ; 80 99

Boot_Function_03D:
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
    LDA #$00             ; A9 00
    BRK $99              ; 00 99
    COP $E4              ; 02 E4
    LDA $E086            ; AD 86 E0
    AND #$FF             ; 29 FF
    BRK $48              ; 00 48
    LDA $FC46            ; AD 46 FC
    STA $E432,Y          ; 99 32 E4
    CLC                  ; 18
    ADC $01              ; 63 01
    DEC                  ; 3A
    STA $E442,Y          ; 99 42 E4
    PLA                  ; 68
    LDA $E088            ; AD 88 E0
    AND #$FF             ; 29 FF
    BRK $48              ; 00 48
    LDA $FC48            ; AD 48 FC
    STA $E452,Y          ; 99 52 E4
    CLC                  ; 18
    ADC $01              ; 63 01
    DEC                  ; 3A
    STA $E462,Y          ; 99 62 E4
    PLA                  ; 68
    RTS                  ; 60
    LDA $7E967C          ; AF 7C 96 7E
    LSR                  ; 4A
    LSR                  ; 4A
    LSR                  ; 4A
    STA $E08C            ; 8D 8C E0
    LDA $7E967E          ; AF 7E 96 7E
    LSR                  ; 4A
    LSR                  ; 4A
    LSR                  ; 4A
    STA $E090            ; 8D 90 E0
    RTS                  ; 60
    STZ $04              ; 64 04
    LDA $E096            ; AD 96 E0
    STA $06              ; 85 06
    STZ $08              ; 64 08
    LDA $E09A            ; AD 9A E0
    STA $0A              ; 85 0A
    LDA $E442,Y          ; B9 42 E4
    SEC                  ; 38
    SBC $E432,Y          ; F9 32 E4
    INC                  ; 1A
    ASL                  ; 0A
    STA $0E              ; 85 0E
    LDX #$18             ; A2 18
    BRK $85              ; 00 85
    CLC                  ; 18
    LDA $E090            ; AD 90 E0
    SEC                  ; 38
    SBC $E452,Y          ; F9 52 E4
    JSL $C010D6          ; 22 D6 10 C0
    LDA $E08C            ; AD 8C E0
    SEC                  ; 38
    SBC $E432,Y          ; F9 32 E4
    ASL                  ; 0A
    CLC                  ; 18
    ADC $18              ; 65 18
    ADC $E412,Y          ; 79 12 E4
    TAX                  ; AA
    RTS                  ; 60
    JSL $C05A71          ; 22 71 5A C0
    BCC $04B6            ; 90 14
    JSR $74D0            ; 20 D0 74
    LDA $AEA6            ; AD A6 AE
    STA $00              ; 85 00
    LDA $E412,Y          ; B9 12 E4
    TAX                  ; AA
    LDA $E08A            ; AD 8A E0
    JSL $C04A44          ; 22 44 4A C0
    SEC                  ; 38
    RTS                  ; 60

Boot_Function_03E:
    PHP                  ; 08

Boot_Function_03F:
    REP #$30             ; C2 30
    PHA                  ; 48
    PHX                  ; DA
    PHY                  ; 5A

Boot_Function_040:
    PHB                  ; 8B
    PEA $7F7F            ; F4 7F 7F
    PLB                  ; AB
    PLB                  ; AB
    TAX                  ; AA
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $66              ; 00 66
    ORA $C5              ; 07 C5
    BRK $00              ; 00 00
    SBC $8D0000,X        ; FF 00 00 8D
    STZ $22E0            ; 9C E0 22
    ADC $05              ; 72 05
    CMP #$00             ; C9 00
    ORA #$00             ; 09 00
    ROR $07              ; 66 07
    CMP $01              ; C5 01
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    STA $E09E            ; 8D 9E E0
    ORA $E09C            ; 0D 9C E0
    BNE $04F0            ; D0 03
    JMP $7693            ; 4C 93 76

Boot_Function_041:
    SEP #$20             ; E2 20
    LDA $E09C            ; AD 9C E0
    XBA                  ; EB
    LDA $E09E            ; AD 9E E0
    JSL $C01098          ; 22 98 10 C0

Boot_Function_042:
    REP #$20             ; C2 20
    STA $E0A0            ; 8D A0 E0
    ASL                  ; 0A
    JSL $C08FD7          ; 22 D7 8F C0
    BCS $050C            ; B0 03
    JMP $7693            ; 4C 93 76
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $66              ; 00 66
    ORA $C5              ; 07 C5
    COP $00              ; 02 00
    SBC $0A0000,X        ; FF 00 00 0A
    ADC $FC46            ; 6D 46 FC
    STA $FC46            ; 8D 46 FC
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $66              ; 00 66
    ORA $C5              ; 07 C5
    ORA $00              ; 03 00
    SBC $0A0000,X        ; FF 00 00 0A
    ADC $FC48            ; 6D 48 FC
    STA $FC48            ; 8D 48 FC
    JSL $C903EE          ; 22 EE 03 C9
    BRK $09              ; 00 09
    BRK $66              ; 00 66
    ORA $C5              ; 07 C5
    ASL $00              ; 06 00
    STA $00              ; 85 00
    JSL $C903EE          ; 22 EE 03 C9
    BRK $09              ; 00 09
    BRK $66              ; 00 66
    ORA $C5              ; 07 C5

Boot_Function_043:
    PHP                  ; 08
    BRK $29              ; 00 29
    SBC $028500,X        ; FF 00 85 02
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $66              ; 00 66
    ORA $C5              ; 07 C5
    TSB $00              ; 04 00
    SBC $AA0003,X        ; FF 03 00 AA
    JSL $C0675C          ; 22 5C 67 C0
    BCC $058C            ; 90 1F
    LDA #$06             ; A9 06
    BRK $20              ; 00 20
    LDA $79              ; A1 79
    BCC $057E            ; 90 09
    PLB                  ; AB

Boot_Function_044:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    SEC                  ; 38
    RTL                  ; 6B
    LDX $B750            ; AE 50 B7
    JSL $C06AE7          ; 22 E7 6A C0
    LDX $AEA2            ; AE A2 AE
    JSL $C05F21          ; 22 21 5F C0
    LDX $AE9A            ; AE 9A AE
    JSL $C09052          ; 22 52 90 C0
    PLB                  ; AB

Boot_Function_045:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    CLC                  ; 18
    RTL                  ; 6B

Boot_Function_046:
    PHP                  ; 08

Boot_Function_047:
    REP #$30             ; C2 30
    PHA                  ; 48
    PHX                  ; DA
    PHY                  ; 5A

Boot_Function_048:
    PHB                  ; 8B
    PEA $7F7F            ; F4 7F 7F
    PLB                  ; AB
    PLB                  ; AB
    TAX                  ; AA
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $7D              ; 00 7D
    CLC                  ; 18
    CMP $00              ; C5 00
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    STA $E09C            ; 8D 9C E0
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $7D              ; 00 7D
    CLC                  ; 18
    CMP $01              ; C5 01
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    STA $E09E            ; 8D 9E E0
    ORA $E09C            ; 0D 9C E0
    BNE $05D5            ; D0 03
    JMP $7778            ; 4C 78 77

Boot_Function_049:
    SEP #$20             ; E2 20
    LDA $E09C            ; AD 9C E0
    XBA                  ; EB
    LDA $E09E            ; AD 9E E0
    JSL $C01098          ; 22 98 10 C0

Boot_Function_04A:
    REP #$20             ; C2 20
    STA $E0A0            ; 8D A0 E0
    ASL                  ; 0A
    JSL $C08FD7          ; 22 D7 8F C0
    BCS $05F1            ; B0 03
    JMP $7778            ; 4C 78 77
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $7D              ; 00 7D
    CLC                  ; 18
    CMP $02              ; C5 02
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    ASL                  ; 0A
    ADC $FC46            ; 6D 46 FC
    STA $FC46            ; 8D 46 FC
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $7D              ; 00 7D
    CLC                  ; 18
    CMP $03              ; C5 03
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    ASL                  ; 0A
    ADC $FC48            ; 6D 48 FC
    STA $FC48            ; 8D 48 FC
    JSL $C903EE          ; 22 EE 03 C9
    BRK $09              ; 00 09
    BRK $7D              ; 00 7D
    CLC                  ; 18
    CMP $06              ; C5 06
    BRK $85              ; 00 85
    BRK $22              ; 00 22
    INC $C903            ; EE 03 C9
    BRK $09              ; 00 09
    BRK $7D              ; 00 7D
    CLC                  ; 18
    CMP $08              ; C5 08
    BRK $29              ; 00 29
    SBC $028500,X        ; FF 00 85 02
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $7D              ; 00 7D
    CLC                  ; 18
    CMP $04              ; C5 04
    BRK $FF              ; 00 FF
    ORA $00              ; 03 00
    TAX                  ; AA
    JSL $C067FD          ; 22 FD 67 C0
    BCC $0671            ; 90 1F
    LDA #$08             ; A9 08
    BRK $20              ; 00 20
    LDA $79              ; A1 79
    BCC $0663            ; 90 09
    PLB                  ; AB

Boot_Function_04B:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    SEC                  ; 38
    RTL                  ; 6B
    LDX $B750            ; AE 50 B7
    JSL $C06AE7          ; 22 E7 6A C0
    LDX $AEA2            ; AE A2 AE
    JSL $C05FA0          ; 22 A0 5F C0
    LDX $AE9A            ; AE 9A AE
    JSL $C09052          ; 22 52 90 C0
    PLB                  ; AB

Boot_Function_04C:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    CLC                  ; 18
    RTL                  ; 6B

Boot_Function_04D:
    PHP                  ; 08

Boot_Function_04E:
    REP #$30             ; C2 30
    PHA                  ; 48
    PHX                  ; DA
    PHY                  ; 5A

Boot_Function_04F:
    PHB                  ; 8B
    PEA $7F7F            ; F4 7F 7F
    PLB                  ; AB
    PLB                  ; AB
    TAX                  ; AA
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $81              ; 00 81
    WDM $C5              ; 42 C5
    BRK $00              ; 00 00
    SBC $8D0000,X        ; FF 00 00 8D
    STZ $22E0            ; 9C E0 22
    ADC $05              ; 72 05
    CMP #$00             ; C9 00
    ORA #$00             ; 09 00
    STA $42              ; 81 42
    CMP $01              ; C5 01
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    STA $E09E            ; 8D 9E E0
    ORA $E09C            ; 0D 9C E0
    BNE $06BA            ; D0 03
    JMP $785D            ; 4C 5D 78

Boot_Function_050:
    SEP #$20             ; E2 20
    LDA $E09C            ; AD 9C E0
    XBA                  ; EB
    LDA $E09E            ; AD 9E E0
    JSL $C01098          ; 22 98 10 C0

Boot_Function_051:
    REP #$20             ; C2 20
    STA $E0A0            ; 8D A0 E0
    ASL                  ; 0A
    JSL $C08FD7          ; 22 D7 8F C0
    BCS $06D6            ; B0 03
    JMP $785D            ; 4C 5D 78
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $81              ; 00 81
    WDM $C5              ; 42 C5
    COP $00              ; 02 00
    SBC $0A0000,X        ; FF 00 00 0A
    ADC $FC46            ; 6D 46 FC
    STA $FC46            ; 8D 46 FC
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $81              ; 00 81
    WDM $C5              ; 42 C5
    ORA $00              ; 03 00
    SBC $0A0000,X        ; FF 00 00 0A
    ADC $FC48            ; 6D 48 FC
    STA $FC48            ; 8D 48 FC
    JSL $C903EE          ; 22 EE 03 C9
    BRK $09              ; 00 09
    BRK $81              ; 00 81
    WDM $C5              ; 42 C5
    ASL $00              ; 06 00
    STA $00              ; 85 00
    JSL $C903EE          ; 22 EE 03 C9
    BRK $09              ; 00 09
    BRK $81              ; 00 81
    WDM $C5              ; 42 C5

Boot_Function_052:
    PHP                  ; 08
    BRK $29              ; 00 29
    SBC $028500,X        ; FF 00 85 02
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $81              ; 00 81
    WDM $C5              ; 42 C5
    TSB $00              ; 04 00
    SBC $AA0003,X        ; FF 03 00 AA
    JSL $C0689E          ; 22 9E 68 C0
    BCC $0756            ; 90 1F
    LDA #$0A             ; A9 0A
    BRK $20              ; 00 20
    LDA $79              ; A1 79
    BCC $0748            ; 90 09
    PLB                  ; AB

Boot_Function_053:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    SEC                  ; 38
    RTL                  ; 6B
    LDX $B750            ; AE 50 B7
    JSL $C06AE7          ; 22 E7 6A C0
    LDX $AEA2            ; AE A2 AE
    JSL $C0601F          ; 22 1F 60 C0
    LDX $AE9A            ; AE 9A AE
    JSL $C09052          ; 22 52 90 C0
    PLB                  ; AB

Boot_Function_054:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    CLC                  ; 18
    RTL                  ; 6B

Boot_Function_055:
    PHP                  ; 08

Boot_Function_056:
    REP #$30             ; C2 30
    PHA                  ; 48
    PHX                  ; DA
    PHY                  ; 5A

Boot_Function_057:
    PHB                  ; 8B
    PEA $7F7F            ; F4 7F 7F
    PLB                  ; AB
    PLB                  ; AB
    STX $E09C            ; 8E 9C E0
    STY $E09E            ; 8C 9E E0
    TXA                  ; 8A
    ORA $E09E            ; 0D 9E E0
    BEQ $07C6            ; F0 48

Boot_Function_058:
    SEP #$20             ; E2 20
    LDA $E09C            ; AD 9C E0
    XBA                  ; EB
    LDA $E09E            ; AD 9E E0
    JSL $C01098          ; 22 98 10 C0

Boot_Function_059:
    REP #$20             ; C2 20
    STA $E0A0            ; 8D A0 E0
    ASL                  ; 0A
    JSL $C08FD7          ; 22 D7 8F C0
    BCC $07C6            ; 90 2F
    LDX #$01             ; A2 01
    BRK $22              ; 00 22
    JMP $90C067          ; 5C 67 C0 90
    ORA $0006A9,X        ; 1F A9 06 00
    JSR $79CF            ; 20 CF 79
    BCC $07B1            ; 90 09
    PLB                  ; AB

Boot_Function_05A:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    SEC                  ; 38
    RTL                  ; 6B
    LDX $B750            ; AE 50 B7
    JSL $C06AE7          ; 22 E7 6A C0
    LDX $AEA2            ; AE A2 AE
    JSL $C05F21          ; 22 21 5F C0
    LDX $AE9A            ; AE 9A AE
    JSL $C09052          ; 22 52 90 C0
    PLB                  ; AB

Boot_Function_05B:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    CLC                  ; 18
    RTL                  ; 6B

Boot_Function_05C:
    PHP                  ; 08

Boot_Function_05D:
    REP #$30             ; C2 30
    PHA                  ; 48
    PHX                  ; DA
    PHY                  ; 5A

Boot_Function_05E:
    PHB                  ; 8B
    PEA $7F7F            ; F4 7F 7F
    PLB                  ; AB
    PLB                  ; AB
    STX $E09C            ; 8E 9C E0
    STY $E09E            ; 8C 9E E0
    TXA                  ; 8A
    ORA $E09E            ; 0D 9E E0
    BEQ $082F            ; F0 48

Boot_Function_05F:
    SEP #$20             ; E2 20
    LDA $E09C            ; AD 9C E0
    XBA                  ; EB
    LDA $E09E            ; AD 9E E0
    JSL $C01098          ; 22 98 10 C0

Boot_Function_060:
    REP #$20             ; C2 20
    STA $E0A0            ; 8D A0 E0
    ASL                  ; 0A
    JSL $C08FD7          ; 22 D7 8F C0
    BCC $082F            ; 90 2F
    LDX #$01             ; A2 01
    BRK $22              ; 00 22
    SBC $C067,X          ; FD 67 C0
    BCC $0828            ; 90 1F
    LDA #$08             ; A9 08
    BRK $20              ; 00 20
    CMP $099079          ; CF 79 90 09
    PLB                  ; AB

Boot_Function_061:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    SEC                  ; 38
    RTL                  ; 6B
    LDX $B750            ; AE 50 B7
    JSL $C06AE7          ; 22 E7 6A C0
    LDX $AEA2            ; AE A2 AE
    JSL $C05FA0          ; 22 A0 5F C0
    LDX $AE9A            ; AE 9A AE
    JSL $C09052          ; 22 52 90 C0
    PLB                  ; AB

Boot_Function_062:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    CLC                  ; 18
    RTL                  ; 6B

Boot_Function_063:
    PHP                  ; 08

Boot_Function_064:
    REP #$30             ; C2 30
    PHA                  ; 48
    PHX                  ; DA
    PHY                  ; 5A

Boot_Function_065:
    PHB                  ; 8B
    PEA $7F7F            ; F4 7F 7F
    PLB                  ; AB
    PLB                  ; AB
    STX $E09C            ; 8E 9C E0
    STY $E09E            ; 8C 9E E0
    TXA                  ; 8A
    ORA $E09E            ; 0D 9E E0
    BEQ $0898            ; F0 48

Boot_Function_066:
    SEP #$20             ; E2 20
    LDA $E09C            ; AD 9C E0
    XBA                  ; EB
    LDA $E09E            ; AD 9E E0
    JSL $C01098          ; 22 98 10 C0

Boot_Function_067:
    REP #$20             ; C2 20
    STA $E0A0            ; 8D A0 E0
    ASL                  ; 0A
    JSL $C08FD7          ; 22 D7 8F C0
    BCC $0898            ; 90 2F
    LDX #$01             ; A2 01
    BRK $22              ; 00 22
    STZ $C068,X          ; 9E 68 C0
    BCC $0891            ; 90 1F
    LDA #$0A             ; A9 0A
    BRK $20              ; 00 20
    CMP $099079          ; CF 79 90 09
    PLB                  ; AB

Boot_Function_068:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    SEC                  ; 38
    RTL                  ; 6B
    LDX $B750            ; AE 50 B7
    JSL $C06AE7          ; 22 E7 6A C0
    LDX $AEA2            ; AE A2 AE
    JSL $C0601F          ; 22 1F 60 C0
    LDX $AE9A            ; AE 9A AE
    JSL $C09052          ; 22 52 90 C0
    PLB                  ; AB

Boot_Function_069:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    CLC                  ; 18
    RTL                  ; 6B
    JSL $C05A71          ; 22 71 5A C0
    BCC $08CE            ; 90 27
    JSR $79EE            ; 20 EE 79
    LDA $E412,Y          ; B9 12 E4
    TAX                  ; AA
    LDA $E0A0            ; AD A0 E0
    JSL $C04923          ; 22 23 49 C0
    TAY                  ; A8
    LDA $B754            ; AD 54 B7
    ORA $7E99BB          ; 0F BB 99 7E
    STA $18              ; 85 18
    LDA $0000,X          ; BD 00 00
    CLC                  ; 18
    ADC $18              ; 65 18
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEY                  ; 88
    BNE $08BF            ; D0 F2
    SEC                  ; 38
    RTS                  ; 60
    JSL $C05A71          ; 22 71 5A C0
    BCC $08ED            ; 90 18
    JSR $79EE            ; 20 EE 79
    LDA $B754            ; AD 54 B7
    ORA $7E99BB          ; 0F BB 99 7E
    STA $00              ; 85 00
    LDA $E412,Y          ; B9 12 E4
    TAX                  ; AA
    LDA $E0A0            ; AD A0 E0
    JSL $C04A44          ; 22 44 4A C0
    SEC                  ; 38
    RTS                  ; 60
    STA $E3F2,Y          ; 99 F2 E3
    LDA $FC4C            ; AD 4C FC
    STA $E472,Y          ; 99 72 E4
    LDA $FC4A            ; AD 4A FC
    STA $E4B2,Y          ; 99 B2 E4
    LDX $AE9A            ; AE 9A AE

Boot_Function_06A:
    TXA                  ; 8A
    STA $E4A2,Y          ; 99 A2 E4
    LDA $ADF4,X          ; BD F4 AD
    STA $E412,Y          ; 99 12 E4
    LDA #$7F             ; A9 7F
    BRK $99              ; 00 99
    JSL $50ADE4          ; 22 E4 AD 50
    LDA $99              ; B7 99
    BRL $B6FB            ; 82 E4 AD
    LDX #$AE             ; A2 AE
    STA $E492,Y          ; 99 92 E4
    LDA #$00             ; A9 00
    BRA $08B9            ; 80 99

Boot_Function_06B:
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
    LDA #$00             ; A9 00
    BRK $99              ; 00 99
    COP $E4              ; 02 E4
    LDA $E09C            ; AD 9C E0
    AND #$FF             ; 29 FF
    BRK $0A              ; 00 0A
    PHA                  ; 48
    LDA $FC46            ; AD 46 FC
    STA $E432,Y          ; 99 32 E4
    CLC                  ; 18
    ADC $01              ; 63 01
    DEC                  ; 3A
    STA $E442,Y          ; 99 42 E4
    PLA                  ; 68
    LDA $E09E            ; AD 9E E0
    AND #$FF             ; 29 FF
    BRK $0A              ; 00 0A
    PHA                  ; 48
    LDA $FC48            ; AD 48 FC
    STA $E452,Y          ; 99 52 E4
    CLC                  ; 18
    ADC $01              ; 63 01
    DEC                  ; 3A
    STA $E462,Y          ; 99 62 E4
    PLA                  ; 68
    RTS                  ; 60

Boot_Function_06C:
    PHP                  ; 08

Boot_Function_06D:
    REP #$30             ; C2 30
    PHA                  ; 48
    PHX                  ; DA
    PHY                  ; 5A

Boot_Function_06E:
    PHB                  ; 8B
    SEI                  ; 78
    PEA $7F7F            ; F4 7F 7F
    PLB                  ; AB
    PLB                  ; AB
    LDA $E3E2,Y          ; B9 E2 E3
    BPL $098B            ; 10 05
    LDA $E4A2,Y          ; B9 A2 E4
    BPL $098E            ; 10 03
    JMP $7B2B            ; 4C 2B 7B
    JSR $7DAB            ; 20 AB 7D
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $66              ; 00 66
    ORA $C5              ; 07 C5
    BRK $00              ; 00 00
    SBC $8D0000,X        ; FF 00 00 8D
    LDY $22E0            ; AC E0 22
    ADC $05              ; 72 05
    CMP #$00             ; C9 00
    ORA #$00             ; 09 00
    ROR $07              ; 66 07
    CMP $01              ; C5 01
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    STA $E0B0            ; 8D B0 E0

Boot_Function_06F:
    SEP #$20             ; E2 20
    LDA $E0AC            ; AD AC E0
    XBA                  ; EB
    LDA $E0B0            ; AD B0 E0
    JSL $C01098          ; 22 98 10 C0

Boot_Function_070:
    REP #$20             ; C2 20
    STA $E0A0            ; 8D A0 E0
    JSL $C903EE          ; 22 EE 03 C9
    BRK $09              ; 00 09
    BRK $66              ; 00 66
    ORA $C5              ; 07 C5
    ASL $00              ; 06 00
    STA $00              ; 85 00
    JSL $C903EE          ; 22 EE 03 C9
    BRK $09              ; 00 09
    BRK $66              ; 00 66
    ORA $C5              ; 07 C5

Boot_Function_071:
    PHP                  ; 08
    BRK $29              ; 00 29
    SBC $028500,X        ; FF 00 85 02
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $66              ; 00 66
    ORA $C5              ; 07 C5
    BRK $00              ; 00 00
    SBC $850000,X        ; FF 00 00 85
    TSB $7222            ; 0C 22 72
    ORA $C9              ; 05 C9
    BRK $09              ; 00 09
    BRK $66              ; 00 66
    ORA $C5              ; 07 C5
    TSB $00              ; 04 00
    SBC $DA0003,X        ; FF 03 00 DA
    TAX                  ; AA
    JSL $C0675C          ; 22 5C 67 C0
    PLX                  ; FA
    BCC $0A2B            ; 90 1C
    JSR $7DDA            ; 20 DA 7D
    LDA $B754            ; AD 54 B7
    ORA $7E9684          ; 0F 84 96 7E
    STA $2E              ; 85 2E
    LDA $E0A0            ; AD A0 E0
    JSL $C04A5B          ; 22 5B 4A C0
    PLB                  ; AB

Boot_Function_072:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    SEC                  ; 38
    RTL                  ; 6B
    PLB                  ; AB

Boot_Function_073:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    CLC                  ; 18
    RTL                  ; 6B

Boot_Function_074:
    PHP                  ; 08

Boot_Function_075:
    REP #$30             ; C2 30
    PHA                  ; 48
    PHX                  ; DA
    PHY                  ; 5A

Boot_Function_076:
    PHB                  ; 8B
    SEI                  ; 78
    PEA $7F7F            ; F4 7F 7F
    PLB                  ; AB
    PLB                  ; AB
    LDA $E3E2,Y          ; B9 E2 E3
    BPL $0A4B            ; 10 05
    LDA $E4A2,Y          ; B9 A2 E4
    BPL $0A4E            ; 10 03
    JMP $7BEB            ; 4C EB 7B
    JSR $7DAB            ; 20 AB 7D
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $7D              ; 00 7D
    CLC                  ; 18
    CMP $00              ; C5 00
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    STA $E0AC            ; 8D AC E0
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $7D              ; 00 7D
    CLC                  ; 18
    CMP $01              ; C5 01
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    STA $E0B0            ; 8D B0 E0

Boot_Function_077:
    SEP #$20             ; E2 20
    LDA $E0AC            ; AD AC E0
    XBA                  ; EB
    LDA $E0B0            ; AD B0 E0
    JSL $C01098          ; 22 98 10 C0

Boot_Function_078:
    REP #$20             ; C2 20
    STA $E0A0            ; 8D A0 E0
    JSL $C903EE          ; 22 EE 03 C9
    BRK $09              ; 00 09
    BRK $7D              ; 00 7D
    CLC                  ; 18
    CMP $06              ; C5 06
    BRK $85              ; 00 85
    BRK $22              ; 00 22
    INC $C903            ; EE 03 C9
    BRK $09              ; 00 09
    BRK $7D              ; 00 7D
    CLC                  ; 18
    CMP $08              ; C5 08
    BRK $29              ; 00 29
    SBC $028500,X        ; FF 00 85 02
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $7D              ; 00 7D
    CLC                  ; 18
    CMP $00              ; C5 00
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    STA $0C              ; 85 0C
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $7D              ; 00 7D
    CLC                  ; 18
    CMP $04              ; C5 04
    BRK $FF              ; 00 FF
    ORA $00              ; 03 00
    PHX                  ; DA
    TAX                  ; AA
    JSL $C067FD          ; 22 FD 67 C0
    PLX                  ; FA
    BCC $0AEB            ; 90 1C
    JSR $7DDA            ; 20 DA 7D
    LDA $B754            ; AD 54 B7
    ORA $7E9684          ; 0F 84 96 7E
    STA $2E              ; 85 2E
    LDA $E0A0            ; AD A0 E0
    JSL $C04A5B          ; 22 5B 4A C0
    PLB                  ; AB

Boot_Function_079:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    SEC                  ; 38
    RTL                  ; 6B
    PLB                  ; AB

Boot_Function_07A:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    CLC                  ; 18
    RTL                  ; 6B

Boot_Function_07B:
    PHP                  ; 08

Boot_Function_07C:
    REP #$30             ; C2 30
    PHA                  ; 48
    PHX                  ; DA
    PHY                  ; 5A

Boot_Function_07D:
    PHB                  ; 8B
    SEI                  ; 78
    PEA $7F7F            ; F4 7F 7F
    PLB                  ; AB

Boot_Function_07E:
    PLB                  ; AB
    LDA $E3E2,Y          ; B9 E2 E3
    BPL $0B0B            ; 10 05
    LDA $E4A2,Y          ; B9 A2 E4
    BPL $0B0E            ; 10 03
    JMP $7CAB            ; 4C AB 7C
    JSR $7DAB            ; 20 AB 7D
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $81              ; 00 81
    WDM $C5              ; 42 C5
    BRK $00              ; 00 00
    SBC $8D0000,X        ; FF 00 00 8D
    LDY $22E0            ; AC E0 22
    ADC $05              ; 72 05
    CMP #$00             ; C9 00
    ORA #$00             ; 09 00
    STA $42              ; 81 42
    CMP $01              ; C5 01
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    STA $E0B0            ; 8D B0 E0

Boot_Function_07F:
    SEP #$20             ; E2 20
    LDA $E0AC            ; AD AC E0
    XBA                  ; EB
    LDA $E0B0            ; AD B0 E0
    JSL $C01098          ; 22 98 10 C0

Boot_Function_080:
    REP #$20             ; C2 20
    STA $E0A0            ; 8D A0 E0
    JSL $C903EE          ; 22 EE 03 C9
    BRK $09              ; 00 09
    BRK $81              ; 00 81
    WDM $C5              ; 42 C5
    ASL $00              ; 06 00
    STA $00              ; 85 00
    JSL $C903EE          ; 22 EE 03 C9
    BRK $09              ; 00 09
    BRK $81              ; 00 81
    WDM $C5              ; 42 C5

Boot_Function_081:
    PHP                  ; 08
    BRK $29              ; 00 29
    SBC $028500,X        ; FF 00 85 02
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $81              ; 00 81
    WDM $C5              ; 42 C5
    BRK $00              ; 00 00
    SBC $850000,X        ; FF 00 00 85
    TSB $7222            ; 0C 22 72
    ORA $C9              ; 05 C9
    BRK $09              ; 00 09
    BRK $81              ; 00 81
    WDM $C5              ; 42 C5
    TSB $00              ; 04 00
    SBC $DA0003,X        ; FF 03 00 DA
    TAX                  ; AA
    JSL $C0689E          ; 22 9E 68 C0
    PLX                  ; FA
    BCC $0BAB            ; 90 1C
    JSR $7DDA            ; 20 DA 7D
    LDA $B754            ; AD 54 B7
    ORA $7E9684          ; 0F 84 96 7E
    STA $2E              ; 85 2E
    LDA $E0A0            ; AD A0 E0
    JSL $C04A5B          ; 22 5B 4A C0
    PLB                  ; AB

Boot_Function_082:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    SEC                  ; 38
    RTL                  ; 6B
    PLB                  ; AB

Boot_Function_083:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    CLC                  ; 18
    RTL                  ; 6B

Boot_Function_084:
    PHP                  ; 08

Boot_Function_085:
    REP #$30             ; C2 30
    PHA                  ; 48
    PHX                  ; DA
    PHY                  ; 5A

Boot_Function_086:
    PHB                  ; 8B
    SEI                  ; 78
    PEA $7F7F            ; F4 7F 7F
    PLB                  ; AB
    PLB                  ; AB
    STA $E0AC            ; 8D AC E0
    STX $E0B0            ; 8E B0 E0
    LDA $E3E2,Y          ; B9 E2 E3
    BPL $0C06            ; 10 3A
    LDA $E4A2,Y          ; B9 A2 E4
    BMI $0C06            ; 30 35
    JSR $7DAB            ; 20 AB 7D

Boot_Function_087:
    SEP #$20             ; E2 20
    LDA $E0AC            ; AD AC E0
    XBA                  ; EB
    LDA $E0B0            ; AD B0 E0
    JSL $C01098          ; 22 98 10 C0

Boot_Function_088:
    REP #$20             ; C2 20
    STA $E0A0            ; 8D A0 E0
    LDA $E0AC            ; AD AC E0
    STA $0C              ; 85 0C
    JSR $7DDA            ; 20 DA 7D
    STZ $00              ; 64 00
    LDA $7E9684          ; AF 84 96 7E
    STA $2E              ; 85 2E
    LDA $E0A0            ; AD A0 E0
    JSL $C04C15          ; 22 15 4C C0
    PLB                  ; AB

Boot_Function_089:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    SEC                  ; 38
    RTL                  ; 6B
    PLB                  ; AB

Boot_Function_08A:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    CLC                  ; 18
    RTL                  ; 6B

Boot_Function_08B:
    PHP                  ; 08

Boot_Function_08C:
    REP #$30             ; C2 30
    PHA                  ; 48
    PHX                  ; DA
    PHY                  ; 5A

Boot_Function_08D:
    PHB                  ; 8B
    PEA $7F7F            ; F4 7F 7F
    PLB                  ; AB
    PLB                  ; AB
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $66              ; 00 66
    ORA $C5              ; 07 C5
    TSB $00              ; 04 00
    SBC $AA0003,X        ; FF 03 00 AA
    JSL $C0675C          ; 22 5C 67 C0
    BCC $0C3A            ; 90 09
    PLB                  ; AB

Boot_Function_08E:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    SEC                  ; 38
    RTL                  ; 6B
    PLB                  ; AB

Boot_Function_08F:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    CLC                  ; 18
    RTL                  ; 6B

Boot_Function_090:
    PHP                  ; 08

Boot_Function_091:
    REP #$30             ; C2 30
    PHA                  ; 48
    PHX                  ; DA
    PHY                  ; 5A

Boot_Function_092:
    PHB                  ; 8B
    PEA $7F7F            ; F4 7F 7F
    PLB                  ; AB
    PLB                  ; AB
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $7D              ; 00 7D
    CLC                  ; 18
    CMP $04              ; C5 04
    BRK $FF              ; 00 FF
    ORA $00              ; 03 00
    TAX                  ; AA
    JSL $C067FD          ; 22 FD 67 C0
    BCC $0C6E            ; 90 09
    PLB                  ; AB

Boot_Function_093:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    SEC                  ; 38
    RTL                  ; 6B
    PLB                  ; AB

Boot_Function_094:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    CLC                  ; 18
    RTL                  ; 6B

Boot_Function_095:
    PHP                  ; 08

Boot_Function_096:
    REP #$30             ; C2 30
    PHA                  ; 48
    PHX                  ; DA
    PHY                  ; 5A

Boot_Function_097:
    PHB                  ; 8B
    PEA $7F7F            ; F4 7F 7F
    PLB                  ; AB
    PLB                  ; AB
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $81              ; 00 81
    WDM $C5              ; 42 C5
    TSB $00              ; 04 00
    SBC $AA0003,X        ; FF 03 00 AA
    JSL $C0689E          ; 22 9E 68 C0
    BCC $0CA2            ; 90 09
    PLB                  ; AB

Boot_Function_098:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    SEC                  ; 38
    RTL                  ; 6B
    PLB                  ; AB

Boot_Function_099:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    CLC                  ; 18
    RTL                  ; 6B
    LDA $E432,Y          ; B9 32 E4
    AND #$01             ; 29 01
    BRK $48              ; 00 48
    LDA $7E9680          ; AF 80 96 7E
    LSR                  ; 4A
    LSR                  ; 4A
    LSR                  ; 4A
    AND #$FE             ; 29 FE
    SBC $8D0103,X        ; FF 03 01 8D
    LDX #$E0             ; A2 E0
    PLA                  ; 68
    LDA $E452,Y          ; B9 52 E4
    AND #$01             ; 29 01
    BRK $48              ; 00 48
    LDA $7E9682          ; AF 82 96 7E
    LSR                  ; 4A
    LSR                  ; 4A
    LSR                  ; 4A
    AND #$FE             ; 29 FE
    SBC $8D0103,X        ; FF 03 01 8D
    LDX $E0              ; A6 E0
    PLA                  ; 68
    RTS                  ; 60
    STZ $04              ; 64 04
    LDA $E0AC            ; AD AC E0
    STA $06              ; 85 06
    STZ $08              ; 64 08
    LDA $E0B0            ; AD B0 E0
    STA $0A              ; 85 0A
    LDA $E442,Y          ; B9 42 E4
    SEC                  ; 38
    SBC $E432,Y          ; F9 32 E4
    INC                  ; 1A
    STA $0E              ; 85 0E
    LDX #$18             ; A2 18
    BRK $85              ; 00 85
    CLC                  ; 18
    LDA $E0A6            ; AD A6 E0
    SEC                  ; 38
    SBC $E452,Y          ; F9 52 E4
    LSR                  ; 4A
    JSL $C010D6          ; 22 D6 10 C0
    LDA $E0A2            ; AD A2 E0
    SEC                  ; 38
    SBC $E432,Y          ; F9 32 E4
    AND #$FE             ; 29 FE
    SBC $186518,X        ; FF 18 65 18
    ADC $E412,Y          ; 79 12 E4
    TAX                  ; AA
    RTS                  ; 60

Boot_Function_09A:
    PHP                  ; 08

Boot_Function_09B:
    REP #$30             ; C2 30

Boot_Function_09C:
    PHB                  ; 8B
    PHX                  ; DA
    PHY                  ; 5A
    SEI                  ; 78
    PEA $7F7F            ; F4 7F 7F
    PLB                  ; AB
    PLB                  ; AB
    JSR $7E47            ; 20 47 7E
    LDA $0000,Y          ; B9 00 00
    PLY                  ; 7A
    PLX                  ; FA
    PLB                  ; AB
    PLP                  ; 28
    RTL                  ; 6B

Boot_Function_09D:
    PHP                  ; 08

Boot_Function_09E:
    REP #$30             ; C2 30

Boot_Function_09F:
    PHB                  ; 8B
    PHA                  ; 48
    PHX                  ; DA
    PHY                  ; 5A
    SEI                  ; 78
    PEA $7F7F            ; F4 7F 7F
    PLB                  ; AB
    PLB                  ; AB
    JSR $7E47            ; 20 47 7E
    LDA $05              ; A3 05
    STA $0000,Y          ; 99 00 00
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLB                  ; AB
    PLP                  ; 28
    RTL                  ; 6B
    LDA $1A              ; A5 1A
    SEC                  ; 38
    SBC $E452,X          ; FD 52 E4
    LSR                  ; 4A
    PHA                  ; 48
    LDA $E442,X          ; BD 42 E4
    SEC                  ; 38
    SBC $E432,X          ; FD 32 E4
    INC                  ; 1A
    LSR                  ; 4A

Boot_Function_0A0:
    SEP #$20             ; E2 20
    STA $004202          ; 8F 02 42 00
    LDA $01              ; A3 01
    STA $004203          ; 8F 03 42 00
    NOP                  ; EA
    NOP                  ; EA
    NOP                  ; EA
    NOP                  ; EA

Boot_Function_0A1:
    REP #$20             ; C2 20
    LDA $004216          ; AF 16 42 00
    STA $01              ; 83 01
    LDA $18              ; A5 18
    SEC                  ; 38
    SBC $E432,X          ; FD 32 E4
    LSR                  ; 4A
    CLC                  ; 18
    ADC $01              ; 63 01
    ASL                  ; 0A
    STA $01              ; 83 01
    CLC                  ; 18
    ADC $E412,X          ; 7D 12 E4
    TAY                  ; A8
    PLA                  ; 68
    RTS                  ; 60

Boot_Function_0A2:
    PHP                  ; 08

Boot_Function_0A3:
    REP #$30             ; C2 30
    PHA                  ; 48
    PHX                  ; DA
    PHY                  ; 5A

Boot_Function_0A4:
    PHB                  ; 8B
    PEA $7F7F            ; F4 7F 7F
    PLB                  ; AB
    PLB                  ; AB
    TAX                  ; AA
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $93              ; 00 93
    BPL $0D60            ; 10 C5
    BRK $00              ; 00 00
    SBC $8D0000,X        ; FF 00 00 8D
    LDA $E0              ; B2 E0
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $93              ; 00 93
    BPL $0D72            ; 10 C5
    ORA $00              ; 01 00
    SBC $8D0000,X        ; FF 00 00 8D
    LDY $E0,X            ; B4 E0
    ORA $E0B2            ; 0D B2 E0
    BNE $0DBD            ; D0 03
    JMP $7F74            ; 4C 74 7F

Boot_Function_0A5:
    SEP #$20             ; E2 20
    LDA $E0B2            ; AD B2 E0
    XBA                  ; EB
    LDA $E0B4            ; AD B4 E0
    JSL $C01098          ; 22 98 10 C0

Boot_Function_0A6:
    REP #$20             ; C2 20
    STA $E0B6            ; 8D B6 E0
    ASL                  ; 0A
    JSL $C08FD7          ; 22 D7 8F C0
    BCS $0DD9            ; B0 03
    JMP $7F74            ; 4C 74 7F
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $93              ; 00 93
    BPL $0DA8            ; 10 C5
    COP $00              ; 02 00
    SBC $0A0000,X        ; FF 00 00 0A
    ADC $FC46            ; 6D 46 FC
    STA $FC46            ; 8D 46 FC
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $93              ; 00 93
    BPL $0DBE            ; 10 C5
    ORA $00              ; 03 00
    SBC $0A0000,X        ; FF 00 00 0A
    ADC $FC48            ; 6D 48 FC
    STA $FC48            ; 8D 48 FC
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $93              ; 00 93
    BPL $0DD4            ; 10 C5
    TSB $00              ; 04 00
    SBC $DA0003,X        ; FF 03 00 DA
    TAX                  ; AA
    JSL $C90572          ; 22 72 05 C9
    BRK $04              ; 00 04
    BRK $9C              ; 00 9C
    BPL $0DE5            ; 10 C5
    ORA $00              ; 01 00
    JSR ($03FF,X)        ; FC FF 03
    STA $E0B8            ; 8D B8 E0
    JSL $C90572          ; 22 72 05 C9
    BRK $04              ; 00 04
    BRK $9C              ; 00 9C
    BPL $0DF7            ; 10 C5
    BRK $00              ; 00 00
    SBC $AA0003,X        ; FF 03 00 AA
    JSL $C0675C          ; 22 5C 67 C0
    PLX                  ; FA
    BCC $0E6D            ; 90 2E
    JSL $C903EE          ; 22 EE 03 C9
    BRK $09              ; 00 09
    BRK $93              ; 00 93
    BPL $0E0E            ; 10 C5
    ASL $00              ; 06 00
    STA $00              ; 85 00
    JSL $C903EE          ; 22 EE 03 C9
    BRK $09              ; 00 09
    BRK $93              ; 00 93
    BPL $0E1C            ; 10 C5

Boot_Function_0A7:
    PHP                  ; 08
    BRK $29              ; 00 29
    SBC $028500,X        ; FF 00 85 02
    LDA #$0C             ; A9 0C
    BRK $20              ; 00 20
    PLY                  ; 7A
    STY $AB              ; 84 AB

Boot_Function_0A8:
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

Boot_Function_0A9:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    CLC                  ; 18
    RTL                  ; 6B

Boot_Function_0AA:
    PHP                  ; 08

Boot_Function_0AB:
    REP #$30             ; C2 30
    PHA                  ; 48
    PHX                  ; DA
    PHY                  ; 5A

Boot_Function_0AC:
    PHB                  ; 8B
    PEA $7F7F            ; F4 7F 7F
    PLB                  ; AB
    PLB                  ; AB
    TAX                  ; AA
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $D8              ; 00 D8
    EOR $C5              ; 41 C5
    BRK $00              ; 00 00
    SBC $8D0000,X        ; FF 00 00 8D
    LDA $E0              ; B2 E0
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $D8              ; 00 D8
    EOR $C5              ; 41 C5
    ORA $00              ; 01 00
    SBC $8D0000,X        ; FF 00 00 8D
    LDY $E0,X            ; B4 E0
    ORA $E0B2            ; 0D B2 E0
    BNE $0EB6            ; D0 03
    JMP $806D            ; 4C 6D 80

Boot_Function_0AD:
    SEP #$20             ; E2 20
    LDA $E0B2            ; AD B2 E0
    XBA                  ; EB
    LDA $E0B4            ; AD B4 E0
    JSL $C01098          ; 22 98 10 C0

Boot_Function_0AE:
    REP #$20             ; C2 20
    STA $E0B6            ; 8D B6 E0
    ASL                  ; 0A
    JSL $C08FD7          ; 22 D7 8F C0
    BCS $0ED2            ; B0 03
    JMP $806D            ; 4C 6D 80
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $D8              ; 00 D8
    EOR $C5              ; 41 C5
    COP $00              ; 02 00
    SBC $0A0000,X        ; FF 00 00 0A
    ADC $FC46            ; 6D 46 FC
    STA $FC46            ; 8D 46 FC
    JSL $C90572          ; 22 72 05 C9
    BRK $09              ; 00 09
    BRK $D8              ; 00 D8
    EOR $C5              ; 41 C5
    ORA $00              ; 03 00
    SBC $0A0000,X        ; FF 00 00 0A
    ADC $FC48            ; 6D 48 FC
    STA $FC48            ; 8D 48 FC
    JSL $C90572          ; 22 72 05 C9
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
