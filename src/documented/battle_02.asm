;==============================================================================
; Dragon Quest III - Battle 02
;==============================================================================
; File: battle_02.asm
; Purpose: Game system module with comprehensive documentation
; Functions: Auto-analyzed and labeled with meaningful names
; Comments: Context-aware instruction documentation
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

; Dragon Quest III - Battle System (Bank $02)
; Comprehensive code extraction


.segment "BATTLE_CODE"

;==============================================================================
; GeneralPurpose_000
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_000:
    CMP $29,X            ; D5 29 | Compare with accumulator
    SBC $0000,Y          ; F9 00 00 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $4C              ; 00 4C | Software interrupt
    CMP $F7              ; C7 F7 | Compare with accumulator
    ASL                  ; 0A | Arithmetic shift left
    ASL                  ; 0A | Arithmetic shift left
    BIT $0126            ; 2C 26 01 | Unknown operation
    DEC $F7C7,X          ; DE C7 F7 | Unknown operation
    BPL $0026            ; 10 11 | Unknown operation
    ORA $37011E,X        ; 1F 1E 01 37 | Logical OR with accumulator
    INY                  ; C8 | Unknown operation
    SBC $01              ; F7 01 | Unknown operation
    ASL                  ; 0A | Arithmetic shift left
    ASL $0110,X          ; 1E 10 01 | Arithmetic shift left
    ROR                  ; 6A | Unknown operation
    INY                  ; C8 | Unknown operation
    SBC $0A              ; F7 0A | Unknown operation
    PLP                  ; 28 | Pull processor status from stack
    ASL $0118            ; 0E 18 01 | Arithmetic shift left
    LDA $C8              ; A3 C8 | Load value into accumulator
    SBC $00              ; F7 00 | Unknown operation
    COP $20              ; 02 20 | Unknown operation
    INC                  ; 1A | Unknown operation
    ORA $E0              ; 01 E0 | Logical OR with accumulator
    INY                  ; C8 | Unknown operation
    SBC $00              ; F7 00 | Unknown operation
    PHD                  ; 0B | Unknown operation
    RTS                  ; 60 | Return from local function
    


;==============================================================================
; GeneralPurpose_001
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_001:
    PHP                  ; 08 | Push processor status to stack
    ORA $19              ; 01 19 | Logical OR with accumulator
    CMP #$F7             ; C9 F7 | Compare with accumulator
    ORA $34              ; 17 34 | Logical OR with accumulator
    AND $46              ; 37 46 | Logical AND with accumulator
    ORA $3A              ; 01 3A | Logical OR with accumulator
    DEX                  ; CA | Unknown operation
    SBC $17              ; F7 17 | Unknown operation
    ROR $46,X            ; 76 46 | Unknown operation
    WDM $01              ; 42 01 | Unknown operation
    DEY                  ; 88 | Unknown operation
    WAI                  ; CB | Unknown operation
    SBC $4B              ; F7 4B | Unknown operation
    TSB $6A1C            ; 0C 1C 6A | Unknown operation
    ORA $73              ; 01 73 | Logical OR with accumulator
    CPY $00F7            ; CC F7 00 | Unknown operation
    COP $20              ; 02 20 | Unknown operation
    INC                  ; 1A | Unknown operation
    ORA $B0              ; 01 B0 | Logical OR with accumulator
    CPY $10F7            ; CC F7 10 | Unknown operation
    ORA $18              ; 12 18 | Logical OR with accumulator
    ORA $01,X            ; 15 01 | Logical OR with accumulator
    SBC $F7CC,Y          ; F9 CC F7 | Unknown operation
    TRB $12              ; 14 12 | Unknown operation
    BPL $007E            ; 10 17 | Unknown operation
    ORA $20              ; 01 20 | Logical OR with accumulator
    CMP $0FF7            ; CD F7 0F | Compare with accumulator
    ASL                  ; 0A | Arithmetic shift left
    MVP $0147            ; 44 47 01 | Unknown operation
    STZ $F7CE            ; 9C CE F7 | Unknown operation
    BPL $0083            ; 10 0E | Unknown operation
    AND $17              ; 23 17 | Logical AND with accumulator
    ORA $07              ; 01 07 | Logical OR with accumulator
    CMP $110FF7          ; CF F7 0F 11 | Compare with accumulator
    JSR $0147            ; 20 47 01 | Call local function
    CMP $CF              ; C1 CF | Compare with accumulator
    SBC $00              ; F7 00 | Unknown operation
    BRK $40              ; 00 40 | Software interrupt
    BRA $0089            ; 80 01 | Unknown operation
    CMP $D1,X            ; D5 D1 | Compare with accumulator
    SBC $0F              ; F7 0F | Unknown operation
    BPL $00A4            ; 10 16 | Unknown operation
    AND $01              ; 23 01 | Logical AND with accumulator
    JSL $08F7D2          ; 22 D2 F7 08 | Call external function
    BRK $48              ; 00 48 | Software interrupt
    LSR                  ; 4A | Unknown operation
    ORA $7D              ; 01 7D | Logical OR with accumulator
    CMP $F7              ; D3 F7 | Compare with accumulator
    ORA $12              ; 12 12 | Logical OR with accumulator

    ORA $12              ; 12 12
    LSR                  ; 4A
    LSR $01,X            ; 56 01
    STA $D5              ; 85 D5
    SBC $12              ; F7 12
    TRB $10              ; 14 10
    ORA $A101            ; 0D 01 A1
    CMP $F7,X            ; D5 F7
    BPL $00BF            ; 10 12
    BPL $00C4            ; 10 15
    ORA $D3              ; 01 D3
    CMP $F7,X            ; D5 F7
    BPL $00C7            ; 10 12
    BPL $00CC            ; 10 15
    ORA $FD              ; 01 FD
    CMP $F7,X            ; D5 F7
    TRB $18              ; 14 18
    BPL $00D2            ; 10 13
    ORA $2C              ; 01 2C
    DEC $F7,X            ; D6 F7
    TRB $0E              ; 14 0E
    BPL $00E2            ; 10 1B
    ORA $5E              ; 01 5E
    DEC $F7,X            ; D6 F7
    ASL $660E            ; 0E 0E 66
    LSR $01,X            ; 56 01
    TCD                  ; 5B
    CMP $13F7,Y          ; D9 F7 13
    CLC                  ; 18
    ASL $1D,X            ; 16 1D
    ORA $A6              ; 01 A6
    CMP $13F7,Y          ; D9 F7 13
    CLC                  ; 18
    ORA $0D              ; 12 0D
    ORA $CF              ; 01 CF
    CMP $11F7,Y          ; D9 F7 11
    TRB $3F28            ; 1C 28 3F
    ORA $B0              ; 01 B0
    PHX                  ; DA
    SBC $0C              ; F7 0C
    BPL $0118            ; 10 2A
    ROL $01,X            ; 36 01
    ADC $DB              ; 63 DB
    SBC $0C              ; F7 0C
    ORA $32              ; 12 32
    MVP $7D01            ; 44 01 7D
    JMP $0EF7            ; DC F7 0E
    ORA $4A              ; 12 4A
    LSR $5B01            ; 4E 01 5B
    DEC $10F7,X          ; DE F7 10
    ORA $60              ; 12 60
    BVC $0109            ; 50 01
    LDA $10F7E0          ; AF E0 F7 10
    ORA $60              ; 12 60
    BVC $0111            ; 50 01
    BRK $E3              ; 00 E3
    SBC $13              ; F7 13
    ASL $0C,X            ; 16 0C
    PHD                  ; 0B
    ORA $18              ; 01 18
    SBC $F7              ; E3 F7
    ORA $16              ; 13 16
    ORA $1D              ; 12 1D
    ORA $53              ; 01 53
    SBC $F7              ; E3 F7
    ORA $1D2A16          ; 0F 16 2A 1D
    ORA $CD              ; 01 CD
    SBC $F7              ; E3 F7
    ORA $1D2A16          ; 0F 16 2A 1D
    ORA $47              ; 01 47
    CPX $F7              ; E4 F7
    ORA $16              ; 13 16
    ASL $010D            ; 0E 0D 01
    ADC $E4              ; 65 E4
    SBC $08              ; F7 08
    ASL $4A46,X          ; 1E 46 4A
    ORA $1C              ; 01 1C
    INC $F7              ; E6 F7
    TRB $18              ; 14 18
    JSR $0116            ; 20 16 01
    ROR $E6,X            ; 76 E6
    SBC $10              ; F7 10
    CLC                  ; 18
    ORA $0F              ; 12 0F
    ORA $9D              ; 01 9D
    INC $F7              ; E6 F7
    BPL $016D            ; 10 18
    ORA $0D              ; 12 0D
    ORA $C2              ; 01 C2
    INC $F7              ; E6 F7
    BPL $016D            ; 10 10
    ROL $0158,X          ; 3E 58 01
    INX                  ; E8
    INX                  ; E8
    SBC $10              ; F7 10
    BPL $0188            ; 10 22
    ASL $4A01,X          ; 1E 01 4A
    SBC #$F7             ; E9 F7
    BPL $0180            ; 10 13
    INC                  ; 1A
    ORA $01              ; 12 01
    BRL $F95C            ; 82 E9 F7
    ORA $10              ; 12 10
    MVP $015B            ; 44 5B 01
    BCC $0165            ; 90 EB
    SBC $11              ; F7 11
    TRB $0E              ; 14 0E
    ORA $BF01,Y          ; 19 01 BF
    XBA                  ; EB
    SBC $1A              ; F7 1A
    CLC                  ; 18
    ASL $011B            ; 0E 1B 01
    INX                  ; E8
    XBA                  ; EB
    SBC $11              ; F7 11
    TRB $22              ; 14 22
    ORA $4F01,Y          ; 19 01 4F
    CPX $10F7            ; EC F7 10
    TRB $42              ; 14 42
    BRL $059A            ; 82 01 04
    SBC $1A12F7          ; EF F7 12 1A
    CLC                  ; 18
    ORA $01              ; 13 01
    WDM $EF              ; 42 EF
    SBC $11              ; F7 11
    ORA $42,X            ; 15 42
    ROR                  ; 6A
    ORA $C1              ; 01 C1
    SBC $F7              ; F1 F7
    ORA $1A,X            ; 15 1A
    CLC                  ; 18
    ORA $01              ; 17 01
    TSB $F2              ; 04 F2
    SBC $13              ; F7 13
    CLC                  ; 18
    ORA $15              ; 12 15
    ORA $40              ; 01 40
    SBC $F7              ; F2 F7
    ORA $2A12            ; 0D 12 2A
    AND $01,X            ; 35 01
    ASL                  ; 0A
    SBC $F7              ; F3 F7
    ORA $08              ; 12 08
    ROR                  ; 6A
    MVN $EB01            ; 54 01 EB
    SBC $F7,X            ; F5 F7
    BPL $01DD            ; 10 10
    INC                  ; 1A
    ORA $01              ; 13 01
    PLD                  ; 2B
    INC $F7,X            ; F6 F7
    ORA $10              ; 11 10
    INC                  ; 1A
    ORA $01              ; 17 01
    ADC $F6              ; 72 F6
    SBC $10              ; F7 10
    BPL $0224            ; 10 46
    PER $C901            ; 62 01 C9
    SED                  ; F8
    SBC $13              ; F7 13
    TRB $12              ; 14 12
    ORA $F001            ; 0D 01 F0
    SED                  ; F8
    SBC $13              ; F7 13
    TRB $16              ; 14 16
    ORA $01              ; 17 01
    AND $F9,X            ; 35 F9
    SBC $11              ; F7 11
    ORA $015446          ; 0F 46 54 01
    ADC #$FB             ; 69 FB
    SBC $13              ; F7 13
    TRB $0C              ; 14 0C
    ORA $01              ; 17 01

;==============================================================================
; GeneralPurpose_002
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_002:
    STA $FB              ; 93 FB | Store accumulator to memory
    SBC $13              ; F7 13 | Unknown operation
    TRB $14              ; 14 14 | Unknown operation
    ORA $FBBA01          ; 0F 01 BA FB | Logical OR with accumulator
    SBC $15              ; F7 15 | Unknown operation
    ASL $28,X            ; 16 28 | Arithmetic shift left
    AND $01              ; 33 01 | Logical AND with accumulator
    STA $FC              ; 85 FC | Store accumulator to memory
    SBC $11              ; F7 11 | Unknown operation
    BPL $025F            ; 10 49 | Unknown operation
    EOR $01              ; 52 01 | Unknown operation
    ORA $FF              ; 03 FF | Logical OR with accumulator
    SBC $10              ; F7 10 | Unknown operation
    BPL $022C            ; 10 0E | Unknown operation
    ORA $01              ; 13 01 | Logical OR with accumulator
    BIT $F7FF            ; 2C FF F7 | Unknown operation
    ORA $10              ; 12 10 | Logical OR with accumulator
    ASL                  ; 0A | Arithmetic shift left
    ORA $4101            ; 0D 01 41 | Set bits in CustomControl2
    SBC $1010F7,X        ; FF F7 10 10 | Unknown operation
    TRB $13              ; 14 13 | Unknown operation
    ORA $70              ; 01 70 | Logical OR with accumulator
    SBC $0E10F7,X        ; FF F7 10 0E | Unknown operation
    WDM $48              ; 42 48 | Unknown operation
    ORA $1C              ; 01 1C | Logical OR with accumulator
    ORA $F8              ; 01 F8 | Logical OR with accumulator
    BPL $024F            ; 10 12 | Unknown operation
    ASL $13,X            ; 16 13 | Arithmetic shift left
    ORA $56              ; 01 56 | Logical OR with accumulator
    ORA $F8              ; 01 F8 | Logical OR with accumulator
    ASL $0E,X            ; 16 0E | Arithmetic shift left
    ORA $7F0115          ; 0F 15 01 7F | Logical OR with accumulator
    ORA $F8              ; 01 F8 | Logical OR with accumulator
    BPL $025D            ; 10 10 | Unknown operation
    LSR                  ; 4A | Unknown operation
    JMP $03B701          ; 5C 01 B7 03 | Unknown operation
    SED                  ; F8 | Unknown operation
    


;==============================================================================
; GeneralPurpose_003
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_003:
    PHP                  ; 08 | Push processor status to stack
    JSR $644C            ; 20 4C 64 | Call local function
    ORA $3C              ; 01 3C | Logical OR with accumulator
    ASL $F8              ; 06 F8 | Arithmetic shift left
    BPL $0277            ; 10 1A | Unknown operation
    BPL $0274            ; 10 15 | Unknown operation
    ORA $63              ; 01 63 | Logical OR with accumulator
    ASL $F8              ; 06 F8 | Arithmetic shift left
    ORA $1A              ; 11 1A | Logical OR with accumulator
    ASL $0115            ; 0E 15 01 | Arithmetic shift left
    BRL $FA71            ; 82 06 F8 | Unknown operation
    ASL $4C18            ; 0E 18 4C | Arithmetic shift left
    ROR $01              ; 66 01 | Unknown operation
    ORA $09              ; 17 09 | Logical OR with accumulator
    SED                  ; F8 | Unknown operation
    TRB $16              ; 14 16 | Unknown operation
    ASL $0115            ; 0E 15 01 | Arithmetic shift left
    LSR $09              ; 46 09 | Unknown operation
    SED                  ; F8 | Unknown operation
    ORA $1C              ; 12 1C | Logical OR with accumulator
    ASL $0113            ; 0E 13 01 | Arithmetic shift left
    ADC $11F809          ; 6F 09 F8 11 | Unknown operation
    TRB $1B10            ; 1C 10 1B | Unknown operation
    ORA $9B              ; 01 9B | Logical OR with accumulator
    ORA #$F8             ; 09 F8 | Logical OR with accumulator
    TSB $4E0C            ; 0C 0C 4E | Unknown operation
    BRL $BF92            ; 82 01 BD | Unknown operation
    TSB $11F8            ; 0C F8 11 | Unknown operation
    ORA $38              ; 12 38 | Logical OR with accumulator
    AND $0DEF01,X        ; 3F 01 EF 0D | Logical AND with accumulator
    SED                  ; F8 | Unknown operation
    ORA $09              ; 07 09 | Logical OR with accumulator
    BPL $02B1            ; 10 12 | Unknown operation
    ORA $11              ; 01 11 | Logical OR with accumulator
    ASL $06F8            ; 0E F8 06 | Arithmetic shift left
    TSB $6646            ; 0C 46 66 | Unknown operation
    ORA $4A              ; 01 4A | Logical OR with accumulator
    BPL $02A3            ; 10 F8 | Unknown operation
    ORA $1A              ; 11 1A | Logical OR with accumulator
    TSB $010F            ; 0C 0F 01 | Unknown operation
    ADC $10              ; 65 10 | Unknown operation
    SED                  ; F8 | Unknown operation
    ORA $1A              ; 11 1A | Logical OR with accumulator
    BPL $02C8            ; 10 11 | Unknown operation
    ORA $8A              ; 01 8A | Logical OR with accumulator
    BPL $02B3            ; 10 F8 | Unknown operation
    ASL $3E16            ; 0E 16 3E | Arithmetic shift left
    EOR $01              ; 47 01 | Unknown operation
    ROL                  ; 2A | Unknown operation

    ROL                  ; 2A
    ORA $F8              ; 12 F8
    BPL $02DB            ; 10 16
    ORA $11              ; 12 11
    ORA $53              ; 01 53
    ORA $F8              ; 12 F8
    BPL $02E1            ; 10 14
    TRB $13              ; 14 13
    ORA $82              ; 01 82
    ORA $F8              ; 12 F8
    BPL $02E3            ; 10 0E
    PHA                  ; 48
    PER $5301            ; 62 01 53
    TRB $F8              ; 14 F8
    ORA $16              ; 13 16
    BPL $02F2            ; 10 13
    ORA $7E              ; 01 7E
    TRB $F8              ; 14 F8
    ORA $22              ; 12 22
    MVP $0154            ; 44 54 01
    CLV                  ; B8
    ASL $F8,X            ; 16 F8
    TSB $1C0E            ; 0C 0E 1C
    TRB $01              ; 14 01
    ORA $17              ; 01 17
    SED                  ; F8

;==============================================================================
; GeneralPurpose_004
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_004:
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    LSR $69,X            ; 56 69 | Unknown operation
    ORA $0C              ; 01 0C | Logical OR with accumulator
    INC                  ; 1A | Unknown operation
    SED                  ; F8 | Unknown operation
    TRB $06              ; 14 06 | Unknown operation
    ORA $24              ; 17 24 | Logical OR with accumulator
    ORA $57              ; 01 57 | Logical OR with accumulator
    INC                  ; 1A | Unknown operation
    SED                  ; F8 | Unknown operation
    TRB $0E              ; 14 0E | Unknown operation
    TRB $15              ; 14 15 | Unknown operation
    ORA $93              ; 01 93 | Logical OR with accumulator
    INC                  ; 1A | Unknown operation
    SED                  ; F8 | Unknown operation
    TRB $0E              ; 14 0E | Unknown operation
    ASL $1D,X            ; 16 1D | Arithmetic shift left
    ORA $E8              ; 01 E8 | Logical OR with accumulator
    INC                  ; 1A | Unknown operation
    SED                  ; F8 | Unknown operation
    TRB $10              ; 14 10 | Unknown operation
    TRB $25              ; 14 25 | Unknown operation
    ORA $3C              ; 01 3C | Logical OR with accumulator
    TCS                  ; 1B | Unknown operation
    SED                  ; F8 | Unknown operation
    TRB $10              ; 14 10 | Unknown operation
    TRB $23              ; 14 23 | Unknown operation
    ORA $89              ; 01 89 | Logical OR with accumulator
    TCS                  ; 1B | Unknown operation
    SED                  ; F8 | Unknown operation
    TRB $0E              ; 14 0E | Unknown operation
    BPL $0342            ; 10 1B | Unknown operation
    ORA $B8              ; 01 B8 | Logical OR with accumulator
    TCS                  ; 1B | Unknown operation
    SED                  ; F8 | Unknown operation
    ORA $14,X            ; 15 14 | Logical OR with accumulator
    BPL $0340            ; 10 11 | Unknown operation
    ORA $E7              ; 01 E7 | Logical OR with accumulator
    TCS                  ; 1B | Unknown operation
    SED                  ; F8 | Unknown operation
    ORA #$23             ; 09 23 | Logical OR with accumulator
    EOR $5A              ; 47 5A | Unknown operation
    ORA $17              ; 01 17 | Logical OR with accumulator
    ASL $13F8,X          ; 1E F8 13 | Arithmetic shift left
    TRB $3726            ; 1C 26 37 | Unknown operation
    ORA $D3              ; 01 D3 | Logical OR with accumulator
    ASL $0FF8,X          ; 1E F8 0F | Arithmetic shift left
    TRB $18              ; 14 18 | Unknown operation

    TRB $18              ; 14 18
    AND $01              ; 21 01
    ORA $13F81F,X        ; 1F 1F F8 13
    ORA $011418,X        ; 1F 18 14 01
    LSR $1F,X            ; 56 1F
    SED                  ; F8
    ORA #$18             ; 09 18
    EOR $5B              ; 52 5B
    ORA $D4              ; 01 D4
    AND $F8              ; 21 F8
    BPL $036F            ; 10 12
    BPL $037A            ; 10 1B
    ORA $12              ; 01 12
    JSL $0E14F8          ; 22 F8 14 0E
    TRB $011B            ; 1C 1B 01
    ROR $22              ; 66 22
    SED                  ; F8
    ORA $12              ; 11 12
    ROL                  ; 2A
    AND $1B01            ; 2D 01 1B
    AND $F8              ; 23 F8
    ORA $16              ; 11 16
    TSB $0117            ; 0C 17 01
    PHA                  ; 48
    AND $F8              ; 23 F8
    ORA $16              ; 11 16
    TSB $0117            ; 0C 17 01
    ADC $23,X            ; 75 23
    SED                  ; F8
    ORA $554624          ; 0F 24 46 55
    ORA $43              ; 01 43
    AND $F8              ; 25 F8
    ORA $16              ; 11 16
    WDM $29              ; 42 29
    ORA $1B              ; 01 1B
    ROL $F8              ; 26 F8
    ORA $1C              ; 13 1C
    TSB $010D            ; 0C 0D 01
    BMI $03C0            ; 30 26
    SED                  ; F8
    ORA $1C              ; 13 1C
    TSB $010D            ; 0C 0D 01
    EOR $26              ; 45 26
    SED                  ; F8
    ORA $1C              ; 13 1C
    ASL $0115            ; 0E 15 01
    ROR $F826            ; 6E 26 F8
    ORA $1C              ; 13 1C
    ASL $0115            ; 0E 15 01
    STA $26              ; 97 26
    SED                  ; F8
    ORA $1C              ; 13 1C
    ASL $011F            ; 0E 1F 01
    CMP $26              ; C3 26
    SED                  ; F8
    ORA $18              ; 13 18
    ROL $014D,X          ; 3E 4D 01
    EOR $28              ; 43 28
    SED                  ; F8
    ORA #$1C             ; 09 1C
    ROL $4D,X            ; 36 4D
    ORA $BE              ; 01 BE
    AND #$F8             ; 29 F8
    ORA #$34             ; 09 34
    JSL $570133          ; 22 33 01 57
    ROL                  ; 2A
    SED                  ; F8

;==============================================================================
; GeneralPurpose_005
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_005:
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    JSL $50014C          ; 22 4C 01 50 | Call external function
    PLD                  ; 2B | Unknown operation
    SED                  ; F8 | Unknown operation
    TSB $4F10            ; 0C 10 4F | Unknown operation
    STA $01              ; 91 01 | Store accumulator to memory
    LDA #$2E             ; A9 2E | Load value into accumulator
    SED                  ; F8 | Unknown operation
    


;==============================================================================
; GeneralPurpose_006
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_006:
    PHP                  ; 08 | Push processor status to stack
    ORA $33              ; 12 33 | Logical OR with accumulator
    EOR $01              ; 43 01 | Unknown operation
    LDY $F82F            ; AC 2F F8 | Load Y register
    ORA $10,X            ; 15 10 | Logical OR with accumulator
    INC                  ; 1A | Unknown operation
    AND $01              ; 21 01 | Logical AND with accumulator
    SBC $2F              ; F7 2F | Unknown operation
    SED                  ; F8 | Unknown operation
    ORA $3018            ; 0D 18 30 | Logical OR with accumulator
    EOR $0F01            ; 4D 01 0F | Unknown operation
    AND $F8              ; 31 F8 | Logical AND with accumulator
    ORA $17              ; 13 17 | Logical OR with accumulator
    TSB $0116            ; 0C 16 01 | Unknown operation
    


;==============================================================================
; GeneralPurpose_007
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_007:
    AND $F831,Y          ; 39 31 F8 | Logical AND with accumulator
    ORA $560A            ; 0D 0A 56 | Logical OR with accumulator
    ADC $34E101,X        ; 7F 01 E1 34 | Unknown operation
    SED                  ; F8 | Unknown operation
    ORA $21,X            ; 15 21 | Logical OR with accumulator
    LSR                  ; 4A | Unknown operation
    AND $01,X            ; 35 01 | Logical AND with accumulator
    AND $36              ; 33 36 | Logical AND with accumulator
    SED                  ; F8 | Unknown operation
    ORA $14,X            ; 15 14 | Logical OR with accumulator
    JMP $0153            ; 4C 53 01 | Unknown operation
    BVC $0452            ; 50 38 | Unknown operation
    SED                  ; F8 | Unknown operation
    ORA $14,X            ; 15 14 | Logical OR with accumulator
    TRB $011B            ; 1C 1B 01 | Unknown operation
    LDY $38              ; A4 38 | Load Y register
    SED                  ; F8 | Unknown operation
    ORA $0C              ; 11 0C | Logical OR with accumulator
    PHA                  ; 48 | Push accumulator to stack
    EOR $3A5001          ; 4F 01 50 3A | Unknown operation
    SED                  ; F8 | Unknown operation
    ORA $0610,X          ; 1D 10 06 | Logical OR with accumulator
    AND $3A6F01          ; 2F 01 6F 3A | Logical AND with accumulator
    SED                  ; F8 | Unknown operation
    ORA $1C              ; 17 1C | Logical OR with accumulator
    BIT $37,X            ; 34 37 | Unknown operation
    ORA $7A              ; 01 7A | Logical OR with accumulator
    TSC                  ; 3B | Unknown operation
    SED                  ; F8 | Unknown operation
    ORA $4C16,X          ; 1D 16 4C | Logical OR with accumulator
    STA $01              ; 83 01 | Store accumulator to memory
    ADC $21F83E,X        ; 7F 3E F8 21 | Unknown operation
    JSL $015750          ; 22 50 57 01 | Call external function
    TSX                  ; BA | Unknown operation
    RTI                  ; 40 | Unknown operation
    SED                  ; F8 | Unknown operation
    TCS                  ; 1B | Unknown operation
    INC                  ; 1A | Unknown operation
    JSL $570137          ; 22 37 01 57 | Call external function
    EOR $F8              ; 41 F8 | Unknown operation
    ORA #$22             ; 09 22 | Logical OR with accumulator
    MVP $0167            ; 44 67 01 | Unknown operation
    CMP $43              ; C3 43 | Compare with accumulator
    SED                  ; F8 | Unknown operation
    TRB $0E              ; 14 0E | Unknown operation
    ASL $0117            ; 0E 17 01 | Arithmetic shift left
    BEQ $04A5            ; F0 43 | Branch if equal (zero flag set)
    SED                  ; F8 | Unknown operation
    ORA $12              ; 11 12 | Logical OR with accumulator

    ORA $12              ; 11 12
    TSB $010D            ; 0C 0D 01
    ASL                  ; 0A
    MVP $10F8            ; 44 F8 10
    ORA $18              ; 12 18
    ORA $01              ; 17 01
    EOR $F844            ; 4D 44 F8
    ORA $2B2E12          ; 0F 12 2E 2B
    ORA $0E              ; 01 0E
    EOR $F8              ; 45 F8
    BPL $048F            ; 10 12
    ASL $0119            ; 0E 19 01
    RTI                  ; 40
    EOR $F8              ; 45 F8
    ORA $0A,X            ; 15 0A
    PER $0151            ; 62 51 01
    DEC $F847            ; CE 47 F8
    ORA $2A              ; 07 2A
    LSR $53              ; 46 53
    ORA $A5              ; 01 A5
    EOR #$F8             ; 49 F8
    ORA $20141B          ; 0F 1B 14 20
    ORA $FD              ; 01 FD
    EOR #$F8             ; 49 F8
    ORA $0B0A1C          ; 0F 1C 0A 0B
    ORA $0E              ; 01 0E
    LSR                  ; 4A
    SED                  ; F8
    ORA $16              ; 13 16
    ROL $3D              ; 26 3D
    ORA $CB              ; 01 CB
    LSR                  ; 4A
    SED                  ; F8
    ORA $16              ; 13 16
    BMI $04FC            ; 30 4D
    ORA $E7              ; 01 E7

;==============================================================================
; GeneralPurpose_008
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_008:
    PHK                  ; 4B | Unknown operation
    SED                  ; F8 | Unknown operation
    BPL $04C3            ; 10 0E | Unknown operation
    PLA                  ; 68 | Pull accumulator from stack
    LSR $D101            ; 4E 01 D1 | Unknown operation
    LSR $10F8            ; 4E F8 10 | Unknown operation
    ASL $16,X            ; 16 16 | Arithmetic shift left
    ORA $4EF801          ; 0F 01 F8 4E | Logical OR with accumulator
    SED                  ; F8 | Unknown operation
    ORA $12              ; 11 12 | Logical OR with accumulator
    CLC                  ; 18 | Clear carry flag
    ORA $2701            ; 0D 01 27 | Logical OR with accumulator
    EOR $1210F8          ; 4F F8 10 12 | Unknown operation
    ASL $010F            ; 0E 0F 01 | Arithmetic shift left
    EOR $4F              ; 45 4F | Unknown operation
    SED                  ; F8 | Unknown operation
    ASL $10,X            ; 16 10 | Arithmetic shift left
    AND $0160,Y          ; 39 60 01 | Logical AND with accumulator
    AND $51              ; 31 51 | Logical AND with accumulator
    SED                  ; F8 | Unknown operation
    ASL $0A,X            ; 16 0A | Arithmetic shift left
    LSR $4B              ; 46 4B | Unknown operation
    ORA $BC              ; 01 BC | Logical OR with accumulator
    EOR $F8              ; 52 F8 | Unknown operation
    ORA $321E,X          ; 1D 1E 32 | Logical OR with accumulator
    EOR $01              ; 53 01 | Unknown operation
    BVC $053E            ; 50 54 | Unknown operation
    SED                  ; F8 | Unknown operation
    ORA $14              ; 11 14 | Logical OR with accumulator
    ASL $0123,X          ; 1E 23 01 | Arithmetic shift left
    


;==============================================================================
; GeneralPurpose_009
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_009:
    REP #$54             ; C2 54 | Clear processor status bits
    SED                  ; F8 | Unknown operation
    ORA $14              ; 11 14 | Logical OR with accumulator
    ASL $012B,X          ; 1E 2B 01 | Arithmetic shift left
    ROL $55,X            ; 36 55 | Unknown operation
    SED                  ; F8 | Unknown operation
    ORA $14              ; 11 14 | Logical OR with accumulator
    ASL $010B            ; 0E 0B 01 | Arithmetic shift left
    EOR $55              ; 52 55 | Unknown operation
    SED                  ; F8 | Unknown operation
    ORA $14              ; 11 14 | Logical OR with accumulator
    ASL $21,X            ; 16 21 | Arithmetic shift left
    ORA $A3              ; 01 A3 | Logical OR with accumulator
    EOR $F8,X            ; 55 F8 | Unknown operation
    ORA $6B5E22          ; 0F 22 5E 6B | Logical OR with accumulator
    ORA $30              ; 01 30 | Logical OR with accumulator
    EOR $11F8,Y          ; 59 F8 11 | Unknown operation
    ASL $38,X            ; 16 38 | Arithmetic shift left
    ADC $01              ; 73 01 | Unknown operation
    ASL $F85B,X          ; 1E 5B F8 | Arithmetic shift left
    TRB $12              ; 14 12 | Unknown operation
    BMI $0591            ; 30 72 | Unknown operation
    ORA $4E              ; 01 4E | Logical OR with accumulator
    EOR $11F8,X          ; 5D F8 11 | Unknown operation
    TSB $7B4E            ; 0C 4E 7B | Unknown operation
    ORA $58              ; 01 58 | Logical OR with accumulator
    RTS                  ; 60 | Return from local function
    SED                  ; F8 | Unknown operation
    ORA $20              ; 17 20 | Logical OR with accumulator
    LSR $7F,X            ; 56 7F | Unknown operation
    ORA $D5              ; 01 D5 | Logical OR with accumulator
    ADC $F8              ; 63 F8 | Unknown operation
    AND $20,X            ; 35 20 | Logical AND with accumulator
    INC                  ; 1A | Unknown operation
    ADC $01              ; 65 01 | Unknown operation
    INC $64,X            ; F6 64 | Unknown operation
    SED                  ; F8 | Unknown operation
    AND $20,X            ; 35 20 | Logical AND with accumulator
    INC                  ; 1A | Unknown operation
    AND $01              ; 32 01 | Logical AND with accumulator
    ADC $F865            ; 6D 65 F8 | Unknown operation
    ORA $12              ; 13 12 | Logical OR with accumulator
    ASL $0116            ; 0E 16 01 | Arithmetic shift left
    TXA                  ; 8A | Transfer X to accumulator
    ADC $F8              ; 65 F8 | Unknown operation
    ORA $7614            ; 0D 14 76 | Logical OR with accumulator
    PHY                  ; 5A | Push Y register to stack
    ORA $80              ; 01 80 | Logical OR with accumulator
    PLA                  ; 68 | Pull accumulator from stack

    PLA                  ; 68
    SED                  ; F8
    ASL $3410            ; 0E 10 34
    ROL $4E01            ; 2E 01 4E
    ADC #$F8             ; 69 F8
    ASL                  ; 0A
    TSB $4C4A            ; 0C 4A 4C
    ORA $3B              ; 01 3B
    RTL                  ; 6B
    SED                  ; F8
    ORA $16              ; 13 16
    ROL $012F,X          ; 3E 2F 01
    ORA $6C              ; 13 6C
    SED                  ; F8
    ORA $16              ; 13 16
    CLI                  ; 58
    STA $01,X            ; 95 01
    TYX                  ; BB
    ADC $1211F8          ; 6F F8 11 12
    AND $53              ; 32 53
    ORA $F0              ; 01 F0
    BVS $0573            ; 70 F8
    ORA $16              ; 13 16
    ROL $0129            ; 2E 29 01

;==============================================================================
; GeneralPurpose_00A
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00A:
    PHB                  ; 8B | Push data bank register
    ADC $F8              ; 71 F8 | Unknown operation
    PHD                  ; 0B | Unknown operation
    ASL $723C            ; 0E 3C 72 | Arithmetic shift left
    ORA $AF              ; 01 AF | Logical OR with accumulator
    ADC $F8              ; 73 F8 | Unknown operation
    ORA $420E            ; 0D 0E 42 | Set bits in FastROMEnable
    ROR                  ; 6A | Unknown operation
    ORA $FF              ; 01 FF | Logical OR with accumulator
    ADC $F8,X            ; 75 F8 | Unknown operation
    ORA $14,X            ; 15 14 | Logical OR with accumulator
    ASL                  ; 0A | Arithmetic shift left
    ORA $01              ; 12 01 | Logical OR with accumulator
    INC                  ; 1A | Unknown operation
    ROR $F8,X            ; 76 F8 | Unknown operation
    ORA $1C,X            ; 15 1C | Logical OR with accumulator
    ASL $0A,X            ; 16 0A | Arithmetic shift left
    ORA $2F              ; 01 2F | Logical OR with accumulator
    ROR $F8,X            ; 76 F8 | Unknown operation
    ORA $0E              ; 11 0E | Logical OR with accumulator
    LSR $013E,X          ; 5E 3E 01 | Unknown operation
    JSR ($F877,X)        ; FC 77 F8 | Call local function
    PHD                  ; 0B | Unknown operation
    


;==============================================================================
; GeneralPurpose_00B
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00B:
    PHP                  ; 08 | Push processor status to stack
    INC                  ; 1A | Unknown operation
    TRB $4801            ; 1C 01 48 | Unknown operation
    SEI                  ; 78 | Unknown operation
    SED                  ; F8 | Unknown operation
    ORA $3818,Y          ; 19 18 38 | Logical OR with accumulator
    SEC                  ; 38 | Set carry flag
    ORA $75              ; 01 75 | Logical OR with accumulator
    ADC $0FF8,Y          ; 79 F8 0F | Unknown operation
    TRB $82              ; 14 82 | Unknown operation
    AND $01,X            ; 35 01 | Logical AND with accumulator
    STA $F87B,X          ; 9D 7B F8 | Store accumulator to memory
    TCS                  ; 1B | Unknown operation
    PLP                  ; 28 | Pull processor status from stack
    ADC $2F              ; 67 2F | Unknown operation
    ORA $19              ; 01 19 | Logical OR with accumulator
    ADC $0DF8,X          ; 7D F8 0D | Unknown operation
    CLC                  ; 18 | Clear carry flag
    


;==============================================================================
; GeneralPurpose_00C
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00C:
    PHK                  ; 4B | Unknown operation
    ORA $E601,X          ; 1D 01 E6 | Logical OR with accumulator
    ADC $1FF8,X          ; 7D F8 1F | Unknown operation
    INC                  ; 1A | Unknown operation
    ADC $016B,X          ; 7D 6B 01 | Unknown operation
    ROR $82,X            ; 76 82 | Unknown operation
    SED                  ; F8 | Unknown operation
    ASL $4C28            ; 0E 28 4C | Arithmetic shift left
    ADC $01              ; 65 01 | Unknown operation
    ASL $F885            ; 0E 85 F8 | Arithmetic shift left
    MVN $4C56            ; 54 56 4C | Unknown operation
    ORA $A601,Y          ; 19 01 A6 | Logical OR with accumulator
    STA $F8              ; 85 F8 | Store accumulator to memory
    ASL                  ; 0A | Arithmetic shift left
    ASL $4A,X            ; 16 4A | Arithmetic shift left
    AND $01              ; 31 01 | Logical AND with accumulator
    LDA $86              ; B3 86 | Load value into accumulator
    SED                  ; F8 | Unknown operation
    ORA $635C24          ; 0F 24 5C 63 | Logical OR with accumulator
    ORA $A7              ; 01 A7 | Logical OR with accumulator
    BIT #$F8             ; 89 F8 | Unknown operation
    ASL $1A,X            ; 16 1A | Arithmetic shift left
    STX $5B              ; 86 5B | Store X register
    ORA $BD              ; 01 BD | Logical OR with accumulator
    STX $19F8            ; 8E F8 19 | Store X register
    CLC                  ; 18 | Clear carry flag
    LSR $0185            ; 4E 85 01 | Unknown operation
    ASL $92              ; 06 92 | Arithmetic shift left
    SED                  ; F8 | Unknown operation
    ORA $14              ; 13 14 | Logical OR with accumulator
    ROL $0167,X          ; 3E 67 01 | Unknown operation
    


;==============================================================================
; GeneralPurpose_00D
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00D:
    PHP                  ; 08 | Push processor status to stack
    STY $F8,X            ; 94 F8 | Store Y register
    ORA $1E              ; 12 1E | Logical OR with accumulator
    ADC $65              ; 63 65 | Unknown operation
    ORA $66              ; 01 66 | Logical OR with accumulator
    STA $F8              ; 97 F8 | Store accumulator to memory
    BPL $063D            ; 10 20 | Unknown operation
    TCD                  ; 5B | Unknown operation
    PHA                  ; 48 | Push accumulator to stack
    ORA $6E              ; 01 6E | Logical OR with accumulator
    STA $31F8,Y          ; 99 F8 31 | Store accumulator to memory
    TRB $0E              ; 14 0E | Unknown operation
    LSR                  ; 4A | Unknown operation
    ORA $D9              ; 01 D9 | Logical OR with accumulator
    STA $1BF8,Y          ; 99 F8 1B | Store accumulator to memory
    TCD                  ; 5B | Unknown operation
    AND $010A,Y          ; 39 0A 01 | Logical AND with accumulator
    ORA $F89A            ; 0D 9A F8 | Logical OR with accumulator
    ORA $3662,X          ; 1D 62 36 | Logical OR with accumulator
    


;==============================================================================
; GeneralPurpose_00E
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00E:
    PHK                  ; 4B | Unknown operation
    ORA $6B              ; 01 6B | Logical OR with accumulator
    TXY                  ; 9B | Unknown operation
    SED                  ; F8 | Unknown operation
    AND $3EAA            ; 2D AA 3E | Logical AND with accumulator
    ORA $01              ; 13 01 | Logical OR with accumulator
    CLD                  ; D8 | Unknown operation
    TXY                  ; 9B | Unknown operation
    SED                  ; F8 | Unknown operation
    ORA $14              ; 11 14 | Logical OR with accumulator
    PLP                  ; 28 | Pull processor status from stack
    ORA #$01             ; 09 01 | Logical OR with accumulator
    SBC $9B              ; F7 9B | Unknown operation
    SED                  ; F8 | Unknown operation
    ORA $14              ; 13 14 | Logical OR with accumulator
    PHY                  ; 5A | Push Y register to stack
    ADC #$01             ; 69 01 | Unknown operation
    EOR $15F89E,X        ; 5F 9E F8 15 | Unknown operation
    BPL $067C            ; 10 26 | Unknown operation
    ORA $8B01            ; 0D 01 8B | Logical OR with accumulator
    STZ $11F8,X          ; 9E F8 11 | Unknown operation
    BPL $0688            ; 10 2A | Unknown operation
    AND $9F2701          ; 2F 01 27 9F | Logical AND with accumulator
    SED                  ; F8 | Unknown operation
    ORA $14              ; 13 14 | Logical OR with accumulator
    ROR $33              ; 66 33 | Unknown operation
    ORA $BD              ; 01 BD | Logical OR with accumulator
    LDY #$F8             ; A0 F8 | Load Y register
    ORA $720E            ; 0D 0E 72 | Logical OR with accumulator
    ROR $01              ; 66 01 | Unknown operation
    AND $F8A4,Y          ; 39 A4 F8 | Logical AND with accumulator
    ORA $0C,X            ; 15 0C | Logical OR with accumulator
    BRL $07CE            ; 82 56 01 | Unknown operation
    ROR $F8A7            ; 6E A7 F8 | Unknown operation
    ORA $520E            ; 0D 0E 52 | Logical OR with accumulator
    EOR $7601            ; 4D 01 76 | Unknown operation
    LDA #$F8             ; A9 F8 | Load value into accumulator
    ORA $140E11          ; 0F 11 0E 14 | Logical OR with accumulator
    ORA $A4              ; 01 A4 | Logical OR with accumulator
    LDA #$F8             ; A9 F8 | Load value into accumulator
    ORA $16,X            ; 15 16 | Logical OR with accumulator
    BIT $37,X            ; 34 37 | Unknown operation
    ORA $9C              ; 01 9C | Logical OR with accumulator
    TAX                  ; AA | Transfer accumulator to X
    SED                  ; F8 | Unknown operation
    ORA $22,X            ; 15 22 | Logical OR with accumulator
    BIT $3F,X            ; 34 3F | Unknown operation
    ORA $B4              ; 01 B4 | Logical OR with accumulator
    PLB                  ; AB | Pull data bank register

    PLB                  ; AB
    SED                  ; F8
    ORA #$12             ; 09 12
    AND $45              ; 31 45
    ORA $D2              ; 01 D2
    LDY $11F8            ; AC F8 11
    ASL $2E,X            ; 16 2E
    STZ $01,X            ; 74 01
    STX $AE              ; 86 AE
    SED                  ; F8
    ORA $18              ; 17 18
    ROR $69              ; 66 69
    ORA $C8              ; 01 C8
    LDA $F8              ; B1 F8
    TCS                  ; 1B
    CLC                  ; 18
    LSR $016D            ; 4E 6D 01
    STY $B4              ; 84 B4
    SED                  ; F8
    ORA $14              ; 13 14
    ASL $15,X            ; 16 15
    ORA $AE              ; 01 AE
    LDY $F8,X            ; B4 F8
    ORA $16              ; 11 16
    JSL $000115          ; 22 15 01 00
    LDA $F8,X            ; B5 F8
    AND $2E              ; 23 2E
    TRB $0127            ; 1C 27 01
    ROR $F8B5            ; 6E B5 F8
    ORA $14              ; 11 14
    ORA $15              ; 12 15
    ORA $96              ; 01 96
    LDA $F8,X            ; B5 F8
    ORA $14              ; 11 14
    ORA $15              ; 12 15
    ORA $BE              ; 01 BE
    LDA $F8,X            ; B5 F8
    ORA $15              ; 11 15
    ASL $15,X            ; 16 15
    ORA $F0              ; 01 F0
    LDA $F8,X            ; B5 F8
    ORA $16,X            ; 15 16
    ROL $49,X            ; 36 49
    ORA $45              ; 01 45
    LDA $F8              ; B7 F8
    ORA $10              ; 11 10
    ASL $17,X            ; 16 17
    ORA $81              ; 01 81
    LDA $F8              ; B7 F8
    ORA $18,X            ; 15 18
    TRB $1D              ; 14 1D
    ORA $C4              ; 01 C4
    LDA $F8              ; B7 F8
    TCS                  ; 1B
    TRB $3220            ; 1C 20 32
    ORA $4E              ; 01 4E
    CLV                  ; B8
    SED                  ; F8
    ORA $10              ; 13 10
    ROL $1F              ; 26 1F
    ORA $D0              ; 01 D0
    CLV                  ; B8
    SED                  ; F8
    ORA $16              ; 11 16
    TRB $0121            ; 1C 21 01
    ROL                  ; 2A
    LDA $11F8,Y          ; B9 F8 11
    CLC                  ; 18
    SEC                  ; 38
    AND $B9FE01          ; 2F 01 FE B9
    SED                  ; F8
    ASL $1E0A            ; 0E 0A 1E
    ROL $7E01            ; 2E 01 7E
    TSX                  ; BA
    SED                  ; F8
    ORA $12              ; 11 12
    TSB $010F            ; 0C 0F 01
    STA $BA,X            ; 95 BA
    SED                  ; F8
    ASL                  ; 0A
    TSB $4840            ; 0C 40 48
    ORA $5F              ; 01 5F
    LDY $0FF8,X          ; BC F8 0F
    CLC                  ; 18
    JSL $DE012B          ; 22 2B 01 DE
    LDY $11F8,X          ; BC F8 11
    INC                  ; 1A
    PLP                  ; 28
    ROL $7001            ; 2E 01 70
    LDA $13F8,X          ; BD F8 13
    ASL $2C,X            ; 16 2C
    AND $01              ; 31 01
    AND $BE              ; 27 BE
    SED                  ; F8
    INC                  ; 1A
    BPL $0766            ; 10 10
    JSR $5701            ; 20 01 57
    LDX $13F8,Y          ; BE F8 13
    ASL $14,X            ; 16 14
    ORA $8501,Y          ; 19 01 85
    LDX $13F8,Y          ; BE F8 13
    JSR $1B46            ; 20 46 1B
    ORA $2C              ; 01 2C
    LDA $1413F8,X        ; BF F8 13 14
    ROL                  ; 2A
    AND $01              ; 31 01
    CMP $BF              ; D3 BF
    SED                  ; F8
    ORA $16              ; 11 16
    BIT $35              ; 24 35
    ORA $61              ; 01 61
    CPY #$F8             ; C0 F8
    ASL                  ; 0A
    TRB $2C              ; 14 2C
    ROL $0001            ; 2E 01 00
    CMP $F8              ; C1 F8
    ASL $1E              ; 06 1E
    BMI $07B3            ; 30 2C
    ORA $CC              ; 01 CC
    CMP $F8              ; C1 F8
    AND $352A24          ; 2F 24 2A 35
    ORA $93              ; 01 93

;==============================================================================
; GeneralPurpose_00F
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00F:
    REP #$F8             ; C2 F8 | Clear processor status bits
    AND $1E              ; 21 1E | Logical AND with accumulator
    PLP                  ; 28 | Pull processor status from stack
    AND $4F01            ; 2D 01 4F | Logical AND with accumulator
    CMP $F8              ; C3 F8 | Compare with accumulator
    AND $330C3F          ; 2F 3F 0C 33 | Logical AND with accumulator
    ORA $90              ; 01 90 | Logical OR with accumulator
    CMP $F8              ; C3 F8 | Compare with accumulator
    ORA $3A12,Y          ; 19 12 3A | Logical OR with accumulator
    ADC $01              ; 67 01 | Unknown operation
    PER $F8C5            ; 62 C5 F8 | Unknown operation
    ORA $3918,Y          ; 19 18 39 | Logical OR with accumulator
    JMP $C6EF01          ; 5C 01 EF C6 | Unknown operation
    SED                  ; F8 | Unknown operation
    ASL $13,X            ; 16 13 | Arithmetic shift left
    BIT $015A,X          ; 3C 5A 01 | Unknown operation
    STY $C8              ; 84 C8 | Store Y register
    SED                  ; F8 | Unknown operation
    ORA $11              ; 12 11 | Logical OR with accumulator
    BIT $38              ; 24 38 | Unknown operation
    ORA $24              ; 01 24 | Logical OR with accumulator
    CMP #$F8             ; C9 F8 | Compare with accumulator
    ORA $18              ; 17 18 | Logical OR with accumulator
    ORA $15              ; 12 15 | Logical OR with accumulator
    ORA $4F              ; 01 4F | Logical OR with accumulator
    CMP #$F8             ; C9 F8 | Compare with accumulator
    ORA $18              ; 17 18 | Logical OR with accumulator
    JMP ($015D,X)        ; 7C 5D 01 | Unknown operation
    STA $CC              ; 87 CC | Store accumulator to memory
    SED                  ; F8 | Unknown operation
    TSB $7C08            ; 0C 08 7C | Unknown operation
    PLA                  ; 68 | Pull accumulator from stack
    ORA $2E              ; 01 2E | Logical OR with accumulator
    BNE $07D3            ; D0 F8 | Branch if not equal (zero flag clear)
    ASL $6312            ; 0E 12 63 | Arithmetic shift left
    


;==============================================================================
; GeneralPurpose_010
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_010:
    PHK                  ; 4B | Unknown operation
    ORA $67              ; 01 67 | Logical OR with accumulator
    CMP $F8              ; D2 F8 | Compare with accumulator
    ORA $24              ; 13 24 | Logical OR with accumulator
    EOR $31              ; 52 31 | Unknown operation
    ORA $AE              ; 01 AE | Logical OR with accumulator
    CMP $F8              ; D3 F8 | Compare with accumulator
    ORA $2D              ; 13 2D | Logical OR with accumulator
    PHY                  ; 5A | Push Y register to stack
    ROL $01              ; 26 01 | Unknown operation
    LDA $D4              ; B3 D4 | Load value into accumulator
    SED                  ; F8 | Unknown operation
    ORA $30              ; 13 30 | Logical OR with accumulator
    PHY                  ; 5A | Push Y register to stack
    ORA $7F01,X          ; 1D 01 7F | Logical OR with accumulator
    CMP $F8,X            ; D5 F8 | Compare with accumulator
    ORA $18              ; 17 18 | Logical OR with accumulator
    ASL $0D              ; 06 0D | Arithmetic shift left
    ORA $94              ; 01 94 | Logical OR with accumulator
    CMP $F8,X            ; D5 F8 | Compare with accumulator
    CLC                  ; 18 | Clear carry flag
    ORA $38,X            ; 15 38 | Logical OR with accumulator
    TDC                  ; 7B | Unknown operation
    ORA $8B              ; 01 8B | Logical OR with accumulator
    CMP $F8              ; D7 F8 | Compare with accumulator
    CLC                  ; 18 | Clear carry flag
    ASL $34,X            ; 16 34 | Arithmetic shift left
    BIT $01,X            ; 34 01 | Unknown operation
    ADC $F8D8,X          ; 7D D8 F8 | Unknown operation
    ORA $2E16,Y          ; 19 16 2E | Logical OR with accumulator
    AND $3701            ; 2D 01 37 | Logical AND with accumulator
    CMP $1DF8,Y          ; D9 F8 1D | Compare with accumulator
    INC                  ; 1A | Unknown operation
    ROL $27              ; 26 27 | Unknown operation
    ORA $A5              ; 01 A5 | Logical OR with accumulator
    CMP $1DF8,Y          ; D9 F8 1D | Compare with accumulator
    INC                  ; 1A | Unknown operation
    ROL $27              ; 26 27 | Unknown operation
    ORA $17              ; 01 17 | Logical OR with accumulator
    PHX                  ; DA | Push X register to stack
    SED                  ; F8 | Unknown operation
    ORA $461C,X          ; 1D 1C 46 | Logical OR with accumulator
    ADC $01              ; 63 01 | Unknown operation
    AND $DC              ; 37 DC | Logical AND with accumulator
    SED                  ; F8 | Unknown operation
    ASL $3C11,X          ; 1E 11 3C | Arithmetic shift left
    PER $F901            ; 62 01 F9 | Unknown operation
    CMP $1EF8,X          ; DD F8 1E | Compare with accumulator
    CLC                  ; 18 | Clear carry flag

    CLC                  ; 18
    MVP $0157            ; 44 57 01
    CPY #$DF             ; C0 DF
    SED                  ; F8
    ORA $09              ; 12 09
    BIT $4E,X            ; 34 4E
    ORA $05              ; 01 05
    SBC $F8              ; E1 F8
    TSB $200E            ; 0C 0E 20
    AND $01              ; 21 01
    BVS $0833            ; 70 E1
    SED                  ; F8
    ORA $0B              ; 11 0B
    ASL $26,X            ; 16 26
    ORA $DB              ; 01 DB
    SBC $F8              ; E1 F8
    ORA $11              ; 17 11
    LSR $7B,X            ; 56 7B
    ORA $90              ; 01 90
    SBC $F8              ; E5 F8
    ASL $4817,X          ; 1E 17 48
    ADC $01              ; 65 01
    AND $F8E8            ; 2D E8 F8
    ASL $4818,X          ; 1E 18 48
    STZ $01              ; 64 01
    EOR $F8EA,Y          ; 59 EA F8
    ASL $4818,X          ; 1E 18 48
    STZ $01              ; 64 01

;==============================================================================
; GeneralPurpose_011
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_011:
    PHB                  ; 8B | Push data bank register
    CPX $1EF8            ; EC F8 1E | Unknown operation
    CLC                  ; 18 | Clear carry flag
    PHA                  ; 48 | Push accumulator to stack
    STZ $01              ; 64 01 | Unknown operation
    CMP $F8EE            ; CD EE F8 | Compare with accumulator
    INC                  ; 1A | Unknown operation
    TRB $44              ; 14 44 | Unknown operation
    ADC $01              ; 73 01 | Unknown operation
    PLB                  ; AB | Pull data bank register
    SBC $F8              ; F1 F8 | Unknown operation
    TCS                  ; 1B | Unknown operation
    BPL $08C4            ; 10 36 | Unknown operation
    AND #$01             ; 29 01 | Logical AND with accumulator
    PLA                  ; 68 | Pull accumulator from stack
    SBC $F8              ; F2 F8 | Unknown operation
    ORA $3620,Y          ; 19 20 36 | Logical OR with accumulator
    PLD                  ; 2B | Unknown operation
    ORA $3F              ; 01 3F | Logical OR with accumulator
    SBC $F8              ; F3 F8 | Unknown operation
    AND $18              ; 21 18 | Logical AND with accumulator
    ROL $43,X            ; 36 43 | Unknown operation
    ORA $97              ; 01 97 | Logical OR with accumulator
    PEA $1BF8            ; F4 F8 1B | Push effective address
    BRK $2A              ; 00 2A | Software interrupt
    EOR $AD01            ; 4D 01 AD | Unknown operation
    SBC $F8,X            ; F5 F8 | Unknown operation
    ORA $11              ; 11 11 | Logical OR with accumulator
    ASL $0178,X          ; 1E 78 01 | Arithmetic shift left
    ROL $F7              ; 26 F7 | Unknown operation
    SED                  ; F8 | Unknown operation
    ORA $1E              ; 13 1E | Logical OR with accumulator
    TRB $016B            ; 1C 6B 01 | Unknown operation
    BRA $08B2            ; 80 F8 | Unknown operation
    SED                  ; F8 | Unknown operation
    ORA $9E,X            ; 15 9E | Logical OR with accumulator
    SEI                  ; 78 | Unknown operation
    ASL $01              ; 06 01 | Arithmetic shift left
    LDY $F8F8,X          ; BC F8 F8 | Load Y register
    EOR $0634            ; 4D 34 06 | Unknown operation
    ADC $F90001          ; 6F 01 00 F9 | Unknown operation
    SED                  ; F8 | Unknown operation
    AND $3E              ; 21 3E | Logical AND with accumulator
    LSR $3B,X            ; 56 3B | Unknown operation
    ORA $A7              ; 01 A7 | Logical OR with accumulator
    PLX                  ; FA | Pull X register from stack
    SED                  ; F8 | Unknown operation
    RTL                  ; 6B | Return from external function
    JSR $2918            ; 20 18 29 | Call local function

    JSR $2918            ; 20 18 29
    ORA $0A              ; 01 0A
    XCE                  ; FB
    SED                  ; F8
    ORA $133820,X        ; 1F 20 38 13
    ORA $5C              ; 01 5C
    XCE                  ; FB
    SED                  ; F8
    ORA $621C,X          ; 1D 1C 62
    ADC $01              ; 61 01
    ORA $FE              ; 05 FE
    SED                  ; F8
    ORA $4B461A,X        ; 1F 1A 46 4B
    ORA $E3              ; 01 E3
    SBC $1A23F8,X        ; FF F8 23 1A
    ROL $013D            ; 2E 3D 01
    CMP $00              ; D1 00
    SBC $1A23,Y          ; F9 23 1A
    TRB $17              ; 14 17
    ORA $04              ; 01 04
    ORA $F9              ; 01 F9
    ORA $1B              ; 12 1B
    TRB $0C              ; 14 0C
    ORA $23              ; 01 23
    ORA $F9              ; 01 F9
    AND $1C              ; 23 1C
    JMP $0157            ; 4C 57 01

;==============================================================================
; GeneralPurpose_012
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_012:
    PHP                  ; 08 | Push processor status to stack
    ORA $F9              ; 03 F9 | Logical OR with accumulator
    AND $1E              ; 21 1E | Logical AND with accumulator
    BMI $094A            ; 30 33 | Unknown operation
    ORA $CF              ; 01 CF | Logical OR with accumulator
    ORA $F9              ; 03 F9 | Logical OR with accumulator
    BPL $0931            ; 10 14 | Unknown operation
    JMP $0153            ; 4C 53 01 | Unknown operation
    LDX $05,Y            ; B6 05 | Load X register
    SBC $1410,Y          ; F9 10 14 | Unknown operation
    JMP $0153            ; 4C 53 01 | Unknown operation
    SBC $07              ; F1 07 | Unknown operation
    SBC $1610,Y          ; F9 10 16 | Unknown operation
    BIT $0132            ; 2C 32 01 | Unknown operation
    LDX $F908            ; AE 08 F9 | Load X register
    ORA $14              ; 11 14 | Logical OR with accumulator
    JSR $0139            ; 20 39 01 | Call local function
    WDM $09              ; 42 09 | Unknown operation
    SBC $140F,Y          ; F9 0F 14 | Unknown operation
    ROL $6D              ; 26 6D | Unknown operation
    ORA $92              ; 01 92 | Logical OR with accumulator
    ASL                  ; 0A | Arithmetic shift left
    SBC $1812,Y          ; F9 12 18 | Unknown operation
    BMI $0977            ; 30 30 | Unknown operation
    ORA $48              ; 01 48 | Logical OR with accumulator
    PHD                  ; 0B | Unknown operation
    SBC $120F,Y          ; F9 0F 12 | Unknown operation
    JSL $980119          ; 22 19 01 98 | Call external function
    PHD                  ; 0B | Unknown operation
    SBC $2013,Y          ; F9 13 20 | Unknown operation
    ROL $47,X            ; 36 47 | Unknown operation
    ORA $BB              ; 01 BB | Logical OR with accumulator
    TSB $15F9            ; 0C F9 15 | Unknown operation
    TSB $2430            ; 0C 30 24 | Unknown operation
    ORA $56              ; 01 56 | Logical OR with accumulator
    ORA $17F9            ; 0D F9 17 | Logical OR with accumulator
    INC                  ; 1A | Unknown operation
    WDM $44              ; 42 44 | Unknown operation
    ORA $B6              ; 01 B6 | Logical OR with accumulator
    ASL $16F9            ; 0E F9 16 | Arithmetic shift left
    INC                  ; 1A | Unknown operation
    RTI                  ; 40 | Unknown operation
    JMP $1601            ; 4C 01 16 | Unknown operation
    BPL $096C            ; 10 F9 | Unknown operation
    ORA $0C              ; 17 0C | Logical OR with accumulator
    ROL $32              ; 26 32 | Unknown operation
    ORA $A4              ; 01 A4 | Logical OR with accumulator
    BPL $0974            ; 10 F9 | Unknown operation
    ORA $18              ; 13 18 | Logical OR with accumulator

    ORA $18              ; 13 18
    MVP $0159            ; 44 59 01
    RTS                  ; 60
    ORA $F9              ; 12 F9
    ORA $3C12,Y          ; 19 12 3C
    LSR $C701            ; 4E 01 C7
    ORA $F9              ; 13 F9
    PHD                  ; 0B
    ASL $3E,X            ; 16 3E
    EOR #$01             ; 49 01
    ROL $15,X            ; 36 15
    SBC $1417,Y          ; F9 17 14
    LSR $48              ; 46 48
    ORA $EE              ; 01 EE
    ASL $F9,X            ; 16 F9
    ORA #$10             ; 09 10
    ROL $0143            ; 2E 43 01
    TSB $18              ; 04 18
    SBC $0C0F,Y          ; F9 0F 0C
    LSR $6D              ; 46 6D
    ORA $90              ; 01 90
    INC                  ; 1A
    SBC $0E0B,Y          ; F9 0B 0E
    LSR $016B            ; 4E 6B 01
    BVC $09CF            ; 50 1D
    SBC $221B,Y          ; F9 1B 22
    ROL $0147,X          ; 3E 47 01
    ADC $1BF91E          ; 6F 1E F9 1B
    CLC                  ; 18
    ROL $015D            ; 2E 5D 01
    STY $1F,X            ; 94 1F
    SBC $110F,Y          ; F9 0F 11
    JSR $0149            ; 20 49 01
    ADC $20              ; 61 20
    SBC $1210,Y          ; F9 10 12
    INC                  ; 1A
    ORA $01              ; 17 01
    LDY $F920            ; AC 20 F9
    ORA $472011          ; 0F 11 20 47
    ORA $72              ; 01 72
    AND $F9              ; 21 F9
    ORA $472011          ; 0F 11 20 47
    ORA $30              ; 01 30
    JSL $1115F9          ; 22 F9 15 11
    TRB $47              ; 14 47
    ORA $BF              ; 01 BF
    JSL $110FF9          ; 22 F9 0F 11
    JSR $0147            ; 20 47 01
    BRA $0A15            ; 80 23
    SBC $1109,Y          ; F9 09 11
    JSR $014D            ; 20 4D 01
    EOR $2AF924          ; 4F 24 F9 2A
    ORA $56              ; 12 56
    ROR                  ; 6A
    ORA $40              ; 01 40
    AND $F9              ; 27 F9
    ORA $05              ; 03 05
    INC                  ; 1A
    CLC                  ; 18
    ORA $7F              ; 01 7F
    AND $F9              ; 27 F9
    BPL $0A1B            ; 10 0E
    WDM $48              ; 42 48
    ORA $2E              ; 01 2E
    AND #$F9             ; 29 F9
    DEC                  ; 3A
    ORA $12              ; 12 12
    ORA $01              ; 13 01
    TCD                  ; 5B
    AND #$F9             ; 29 F9
    DEC                  ; 3A
    BPL $0A30            ; 10 12
    ASL $01,X            ; 16 01
    TYA                  ; 98
    AND #$F9             ; 29 F9
    AND $24              ; 25 24
    ORA $010F            ; 0D 0F 01
    LDA $29              ; B3 29
    SBC $2E44,Y          ; F9 44 2E
    TSB $0110            ; 0C 10 01
    ORA $EF              ; 01 EF
    ORA $FF              ; 03 FF
    ORA $F6              ; 03 F6
    ORA $02              ; 03 02
    SBC $03,X            ; F5 03
    COP $F4              ; 02 F4
    ORA $02              ; 03 02
    SBC $03              ; F3 03
    COP $F2              ; 02 F2
    ORA $02              ; 03 02
    SBC $03              ; F1 03
    ORA $03F0,Y          ; 19 F0 03
    COP $F1              ; 02 F1
    ORA $02              ; 03 02
    SBC $03              ; F2 03
    COP $F3              ; 02 F3
    ORA $02              ; 03 02
    PEA $0303            ; F4 03 03
    SBC $03,X            ; F5 03
    ORA $F6              ; 03 F6
    ORA $FF              ; 03 FF
    ORA $F7              ; 01 F7
    ORA $FF              ; 03 FF
    ORA $F8              ; 01 F8
    ORA $FF              ; 03 FF
    ORA $F9              ; 01 F9
    ORA $FF              ; 03 FF
    ORA $FA              ; 01 FA
    ORA $01              ; 03 01
    XCE                  ; FB
    ORA $01              ; 03 01
    JSR ($0103,X)        ; FC 03 01
    SBC $0103,X          ; FD 03 01
    INC $0103,X          ; FE 03 01
    SBC $000103,X        ; FF 03 01 00
    TSB $01              ; 04 01
    ORA $04              ; 01 04
    ORA $02              ; 01 02
    TSB $01              ; 04 01
    ORA $04              ; 03 04
    ASL $0404            ; 0E 04 04
    SBC $040501,X        ; FF 01 05 04
    SBC $040601,X        ; FF 01 06 04
    ORA $07              ; 01 07
    TSB $01              ; 04 01

;==============================================================================
; GeneralPurpose_013
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_013:
    PHP                  ; 08 | Push processor status to stack
    TSB $01              ; 04 01 | Unknown operation
    ORA #$04             ; 09 04 | Logical OR with accumulator
    ORA $0A              ; 01 0A | Logical OR with accumulator
    TSB $02              ; 04 02 | Unknown operation
    PHD                  ; 0B | Unknown operation
    TSB $02              ; 04 02 | Unknown operation
    TSB $0204            ; 0C 04 02 | Unknown operation
    ORA $0204            ; 0D 04 02 | Logical OR with accumulator
    ASL $0204            ; 0E 04 02 | Arithmetic shift left
    ORA $100204          ; 0F 04 02 10 | Logical OR with accumulator
    TSB $FF              ; 04 FF | Unknown operation
    ORA $11              ; 01 11 | Logical OR with accumulator
    TSB $FF              ; 04 FF | Unknown operation
    ORA $12              ; 01 12 | Logical OR with accumulator
    TSB $FF              ; 04 FF | Unknown operation
    ORA $13              ; 01 13 | Logical OR with accumulator
    TSB $FF              ; 04 FF | Unknown operation
    ORA $14              ; 01 14 | Logical OR with accumulator
    TSB $FF              ; 04 FF | Unknown operation
    COP $15              ; 02 15 | Unknown operation
    TSB $02              ; 04 02 | Unknown operation
    ASL $04,X            ; 16 04 | Arithmetic shift left
    COP $17              ; 02 17 | Unknown operation
    TSB $02              ; 04 02 | Unknown operation
    CLC                  ; 18 | Clear carry flag
    TSB $02              ; 04 02 | Unknown operation
    ORA $0204,Y          ; 19 04 02 | Logical OR with accumulator
    INC                  ; 1A | Unknown operation
    TSB $02              ; 04 02 | Unknown operation
    TCS                  ; 1B | Unknown operation
    TSB $02              ; 04 02 | Unknown operation
    TRB $FF04            ; 1C 04 FF | Unknown operation
    ORA $1D              ; 01 1D | Logical OR with accumulator
    TSB $FF              ; 04 FF | Unknown operation
    ORA $1E              ; 01 1E | Logical OR with accumulator
    TSB $01              ; 04 01 | Unknown operation
    ORA $200104,X        ; 1F 04 01 20 | Logical OR with accumulator
    TSB $01              ; 04 01 | Unknown operation
    AND $04              ; 21 04 | Logical AND with accumulator
    ORA $22              ; 01 22 | Logical OR with accumulator
    TSB $01              ; 04 01 | Unknown operation
    AND $04              ; 23 04 | Logical AND with accumulator
    ORA $24              ; 01 24 | Logical OR with accumulator
    TSB $01              ; 04 01 | Unknown operation
    AND $04              ; 25 04 | Logical AND with accumulator
    ORA $26              ; 01 26 | Logical OR with accumulator
    TSB $01              ; 04 01 | Unknown operation
    AND $04              ; 27 04 | Logical AND with accumulator

    AND $04              ; 27 04
    ORA $28              ; 01 28
    TSB $01              ; 04 01
    AND #$04             ; 29 04
    ORA $2A              ; 01 2A
    TSB $01              ; 04 01
    PLD                  ; 2B
    TSB $01              ; 04 01
    BIT $0104            ; 2C 04 01
    AND $FF04            ; 2D 04 FF
    ORA $2E              ; 01 2E
    TSB $01              ; 04 01
    AND $300104          ; 2F 04 01 30
    TSB $01              ; 04 01
    AND $04              ; 31 04
    ORA $32              ; 01 32
    TSB $01              ; 04 01
    AND $04              ; 33 04
    ORA $34              ; 01 34
    TSB $01              ; 04 01
    AND $04,X            ; 35 04
    ORA $36              ; 01 36
    TSB $01              ; 04 01
    AND $04              ; 37 04
    ORA $38              ; 01 38
    TSB $01              ; 04 01
    AND $FF04,Y          ; 39 04 FF
    ORA $3A              ; 01 3A
    TSB $FF              ; 04 FF
    ORA $3B              ; 01 3B
    TSB $FF              ; 04 FF
    ORA $3C              ; 01 3C
    TSB $01              ; 04 01
    AND $0104,X          ; 3D 04 01
    ROL $0104,X          ; 3E 04 01
    AND $400104,X        ; 3F 04 01 40
    TSB $01              ; 04 01
    EOR $04              ; 41 04
    ORA $42              ; 01 42
    TSB $01              ; 04 01
    EOR $04              ; 43 04
    ORA $44              ; 01 44
    TSB $01              ; 04 01
    EOR $04              ; 45 04
    ORA $46              ; 01 46
    TSB $01              ; 04 01
    EOR $04              ; 47 04
    SBC $044801,X        ; FF 01 48 04
    ORA $49              ; 01 49
    TSB $01              ; 04 01
    LSR                  ; 4A
    TSB $01              ; 04 01

;==============================================================================
; GeneralPurpose_014
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_014:
    PHK                  ; 4B | Unknown operation
    TSB $01              ; 04 01 | Unknown operation
    JMP $0104            ; 4C 04 01 | Unknown operation
    EOR $0104            ; 4D 04 01 | Unknown operation
    LSR $0104            ; 4E 04 01 | Unknown operation
    EOR $500104          ; 4F 04 01 50 | Unknown operation
    TSB $01              ; 04 01 | Unknown operation
    EOR $04              ; 51 04 | Unknown operation
    ORA $52              ; 01 52 | Logical OR with accumulator
    TSB $01              ; 04 01 | Unknown operation
    EOR $04              ; 53 04 | Unknown operation
    ORA $54              ; 01 54 | Logical OR with accumulator
    TSB $01              ; 04 01 | Unknown operation
    EOR $04,X            ; 55 04 | Unknown operation
    ORA $56              ; 01 56 | Logical OR with accumulator
    TSB $01              ; 04 01 | Unknown operation
    EOR $04              ; 57 04 | Unknown operation
    ORA $58              ; 01 58 | Logical OR with accumulator
    TSB $01              ; 04 01 | Unknown operation
    EOR $0104,Y          ; 59 04 01 | Unknown operation
    PHY                  ; 5A | Push Y register to stack
    TSB $01              ; 04 01 | Unknown operation
    TCD                  ; 5B | Unknown operation
    TSB $01              ; 04 01 | Unknown operation
    JMP $5D0104          ; 5C 04 01 5D | Unknown operation
    TSB $FF              ; 04 FF | Unknown operation
    ORA $5E              ; 01 5E | Logical OR with accumulator
    TSB $01              ; 04 01 | Unknown operation
    EOR $600104,X        ; 5F 04 01 60 | Unknown operation
    TSB $01              ; 04 01 | Unknown operation
    ADC $04              ; 61 04 | Unknown operation
    ORA $62              ; 01 62 | Logical OR with accumulator
    TSB $01              ; 04 01 | Unknown operation
    ADC $04              ; 63 04 | Unknown operation
    ORA $64              ; 01 64 | Logical OR with accumulator
    TSB $01              ; 04 01 | Unknown operation
    ADC $04              ; 65 04 | Unknown operation
    ORA $66              ; 01 66 | Logical OR with accumulator
    TSB $01              ; 04 01 | Unknown operation
    ADC $04              ; 67 04 | Unknown operation
    ORA $68              ; 01 68 | Logical OR with accumulator
    TSB $01              ; 04 01 | Unknown operation
    ADC #$04             ; 69 04 | Unknown operation
    ORA $6A              ; 01 6A | Logical OR with accumulator
    TSB $01              ; 04 01 | Unknown operation
    RTL                  ; 6B | Return from external function
    TSB $01              ; 04 01 | Unknown operation
    JMP ($0104)          ; 6C 04 01 | Unknown operation
    ADC $0104            ; 6D 04 01 | Unknown operation

    ADC $0104            ; 6D 04 01
    ROR $0104            ; 6E 04 01
    ADC $700104          ; 6F 04 01 70
    TSB $01              ; 04 01
    ADC $04              ; 71 04
    ORA $72              ; 01 72
    TSB $01              ; 04 01
    ADC $04              ; 73 04
    SBC $047401,X        ; FF 01 74 04
    ORA $75              ; 01 75
    TSB $01              ; 04 01
    ROR $04,X            ; 76 04
    ORA $77              ; 01 77
    TSB $01              ; 04 01
    SEI                  ; 78
    TSB $01              ; 04 01
    ADC $0104,Y          ; 79 04 01
    PLY                  ; 7A
    TSB $01              ; 04 01
    TDC                  ; 7B
    TSB $01              ; 04 01
    JMP ($0104,X)        ; 7C 04 01
    ADC $0104,X          ; 7D 04 01
    ROR $0104,X          ; 7E 04 01
    ADC $800104,X        ; 7F 04 01 80
    TSB $01              ; 04 01
    STA $04              ; 81 04
    ORA $82              ; 01 82
    TSB $01              ; 04 01
    STA $04              ; 83 04
    ORA $84              ; 01 84
    TSB $01              ; 04 01
    STA $04              ; 85 04
    SBC $048602,X        ; FF 02 86 04
    ORA $87              ; 01 87
    TSB $02              ; 04 02
    DEY                  ; 88
    TSB $01              ; 04 01
    BIT #$04             ; 89 04
    COP $8A              ; 02 8A
    TSB $01              ; 04 01

;==============================================================================
; GeneralPurpose_015
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_015:
    PHB                  ; 8B | Push data bank register
    TSB $02              ; 04 02 | Unknown operation
    STY $0104            ; 8C 04 01 | Store Y register
    STA $0204            ; 8D 04 02 | Store accumulator to memory
    STX $0104            ; 8E 04 01 | Store X register
    STA $12FF04          ; 8F 04 FF 12 | Store accumulator to memory
    LDA $C1              ; B2 C1 | Load value into accumulator
    ASL $B2,X            ; 16 B2 | Arithmetic shift left
    CMP $46              ; C1 46 | Compare with accumulator
    LDA $C1              ; B2 C1 | Load value into accumulator
    LDA $B3              ; B7 B3 | Load value into accumulator
    CMP $D1              ; C1 D1 | Compare with accumulator
    LDA $C1              ; B3 C1 | Load value into accumulator
    ASL                  ; 0A | Arithmetic shift left
    LDX $C1,Y            ; B6 C1 | Load X register
    CMP #$B5             ; C9 B5 | Compare with accumulator
    CMP $5C              ; C1 5C | Compare with accumulator
    LDA $C1              ; B7 C1 | Load value into accumulator
    BIT #$B7             ; 89 B7 | Unknown operation
    CMP $B0              ; C1 B0 | Compare with accumulator
    LDA $C1              ; B7 C1 | Load value into accumulator
    LDA $D6C1B7,X        ; BF B7 C1 D6 | Load value into accumulator
    LDA $C1              ; B7 C1 | Load value into accumulator
    SBC $B7              ; E5 B7 | Unknown operation
    CMP $EE              ; C1 EE | Compare with accumulator
    LDA $C1              ; B7 C1 | Load value into accumulator
    AND $C1B6            ; 2D B6 C1 | Logical AND with accumulator
    JSR $C1B7            ; 20 B7 C1 | Call local function
    DEX                  ; CA | Unknown operation
    CLV                  ; B8 | Unknown operation
    CMP $9A              ; C1 9A | Compare with accumulator
    LDX $C1,Y            ; B6 C1 | Load X register
    LDY #$B6             ; A0 B6 | Load Y register
    CMP $A6              ; C1 A6 | Compare with accumulator
    LDX $C1,Y            ; B6 C1 | Load X register
    LDY $C1B6            ; AC B6 C1 | Load Y register
    TSB $B8              ; 04 B8 | Unknown operation
    CMP $14              ; C1 14 | Compare with accumulator
    CLV                  ; B8 | Unknown operation
    CMP $AC              ; C1 AC | Compare with accumulator
    LDA $C1,X            ; B5 C1 | Load value into accumulator
    BIT $B8              ; 24 B8 | Unknown operation
    CMP $45              ; C1 45 | Compare with accumulator
    LDA $DAC1,Y          ; B9 C1 DA | Load value into accumulator
    CLV                  ; B8 | Unknown operation
    CMP $03              ; C1 03 | Compare with accumulator
    LDX $C1,Y            ; B6 C1 | Load X register
    CMP $B7              ; C7 B7 | Compare with accumulator
    CMP $20              ; C1 20 | Compare with accumulator

    CMP $20              ; C1 20
    LDA $C1              ; B7 C1
    ROL                  ; 2A
    CLV                  ; B8
    CMP $30              ; C1 30
    CLV                  ; B8
    CMP $5E              ; C1 5E
    CLV                  ; B8
    CMP $83              ; C1 83
    CLV                  ; B8
    CMP $20              ; C1 20
    LDA $C1              ; B7 C1
    STX $B6,Y            ; 96 B6
    CMP $19              ; C1 19
    LDX $C1,Y            ; B6 C1
    AND $B6              ; 23 B6
    CMP $64              ; C1 64
    LDX $C1,Y            ; B6 C1
    BVS $0C69            ; 70 B6
    CMP $7C              ; C1 7C
    LDX $C1,Y            ; B6 C1
    DEY                  ; 88
    LDX $C1,Y            ; B6 C1
    AND $B6              ; 37 B6
    CMP $46              ; C1 46
    LDX $C1,Y            ; B6 C1
    EOR $B6,X            ; 55 B6
    CMP $C7              ; C1 C7
    LDA $92C1,Y          ; B9 C1 92
    LDA $C1              ; B7 C1
    LDA #$B4             ; A9 B4
    CMP $EA              ; C1 EA
    CLV                  ; B8
    CMP $5D              ; C1 5D
    LDA $51C1,Y          ; B9 C1 51
    LDA $CCC1,Y          ; B9 C1 CC
    TSB $00              ; 04 00
    COP $38              ; 02 38
    ORA $CA              ; 05 CA
    TSB $31              ; 04 31
    ORA $F5              ; 05 F5
    ORA $25              ; 05 25
    ORA $79              ; 05 79
    ORA $58              ; 05 58
    ORA $F1              ; 05 F1
    TSB $5A              ; 04 5A
    ORA $2B              ; 05 2B
    ORA $10              ; 05 10
    ORA $D2              ; 05 D2
    ORA $E3              ; 05 E3
    TSB $11              ; 04 11
    ORA $12              ; 05 12
    ORA $13              ; 05 13
    ORA $CD              ; 05 CD
    TSB $E4              ; 04 E4
    TSB $14              ; 04 14
    ORA $E9              ; 05 E9
    ORA $E5              ; 05 E5
    TSB $E6              ; 04 E6
    TSB $15              ; 04 15
    ORA $16              ; 05 16
    ORA $CE              ; 05 CE
    TSB $17              ; 04 17
    ORA $CF              ; 05 CF
    TSB $EE              ; 04 EE
    ORA $F0              ; 05 F0
    ORA $E8              ; 05 E8
    TSB $19              ; 04 19
    ORA $F3              ; 05 F3
    ORA $DF              ; 05 DF
    ORA $FC              ; 05 FC
    TSB $D3              ; 04 D3
    ORA $D0              ; 05 D0
    TSB $FD              ; 04 FD
    TSB $FE              ; 04 FE
    TSB $59              ; 04 59
    ORA $F4              ; 05 F4
    ORA $D1              ; 05 D1
    TSB $00              ; 04 00
    ORA $1B              ; 05 1B
    ORA $01              ; 05 01
    ORA $D2              ; 05 D2
    TSB $1C              ; 04 1C
    ORA $1D              ; 05 1D
    ORA $E9              ; 05 E9
    TSB $D3              ; 04 D3
    TSB $EA              ; 04 EA
    TSB $D4              ; 04 D4
    TSB $02              ; 04 02
    ORA $D5              ; 05 D5
    TSB $03              ; 04 03
    ORA $D6              ; 05 D6
    TSB $D7              ; 04 D7
    TSB $BA              ; 04 BA
    ORA $2C              ; 05 2C
    ORA $D6              ; 05 D6
    ORA $D7              ; 05 D7
    ORA $BB              ; 05 BB
    ORA $EA              ; 05 EA
    ORA $EB              ; 05 EB
    ORA $EC              ; 05 EC
    ORA $56              ; 05 56
    ORA $1F              ; 05 1F
    ORA $67              ; 05 67
    ORA $2F              ; 05 2F
    ORA $EF              ; 05 EF
    ORA $5C              ; 05 5C
    ORA $30              ; 05 30
    ORA $5D              ; 05 5D
    ORA $68              ; 05 68
    ORA $5E              ; 05 5E
    ORA $F6              ; 05 F6
    ORA $86              ; 05 86
    ORA $20              ; 05 20
    ORA $F7              ; 05 F7
    ORA $04              ; 05 04
    ORA $F8              ; 05 F8
    ORA $69              ; 05 69
    ORA $5F              ; 05 5F
    ORA $21              ; 05 21
    ORA $22              ; 05 22
    ORA $BE              ; 05 BE
    TSB $60              ; 04 60
    ORA $00              ; 05 00
    ASL $F9              ; 06 F9
    ORA $87              ; 05 87
    ORA $D8              ; 05 D8
    TSB $D4              ; 04 D4
    ORA $D9              ; 05 D9
    TSB $FA              ; 04 FA
    ORA $02              ; 05 02
    ASL $89              ; 06 89
    ORA $F1              ; 05 F1
    ORA $EB              ; 05 EB
    TSB $05              ; 04 05
    ORA $F2              ; 05 F2
    TSB $D5              ; 04 D5
    ORA $8A              ; 05 8A
    ORA $01              ; 05 01
    ASL $0A              ; 06 0A
    ASL $23              ; 06 23
    ORA $BF              ; 05 BF
    TSB $06              ; 04 06
    ORA $DA              ; 05 DA
    TSB $FB              ; 04 FB
    ORA $DB              ; 05 DB
    TSB $EC              ; 04 EC
    TSB $F2              ; 04 F2
    ORA $ED              ; 05 ED
    ORA $57              ; 05 57
    ORA $D8              ; 05 D8
    ORA $FF              ; 05 FF
    ORA $BC              ; 05 BC
    ORA $BD              ; 05 BD
    ORA $BE              ; 05 BE
    ORA $08              ; 05 08
    ASL $09              ; 06 09
    ASL $CC              ; 06 CC
    TSB $CC              ; 04 CC
    TSB $6B              ; 04 6B
    ORA $35              ; 05 35
    ORA $2D              ; 05 2D
    ORA $2E              ; 05 2E
    ORA $39              ; 05 39
    ORA $52              ; 05 52
    ORA $37              ; 05 37
    ORA $29              ; 05 29
    ORA $2A              ; 05 2A
    ORA $54              ; 05 54
    ORA $50              ; 05 50
    ORA $B5              ; 05 B5
    TSB $C0              ; 04 C0
    TSB $B6              ; 04 B6
    TSB $B7              ; 04 B7
    TSB $B8              ; 04 B8
    TSB $B9              ; 04 B9
    TSB $BA              ; 04 BA
    TSB $BB              ; 04 BB
    TSB $BC              ; 04 BC
    TSB $BD              ; 04 BD
    TSB $C1              ; 04 C1
    TSB $DC              ; 04 DC
    TSB $ED              ; 04 ED
    TSB $EE              ; 04 EE
    TSB $DD              ; 04 DD

;==============================================================================
; GeneralPurpose_016
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_016:
    TSB $DE              ; 04 DE | Unknown operation
    TSB $EF              ; 04 EF | Unknown operation
    TSB $C2              ; 04 C2 | Unknown operation
    TSB $F3              ; 04 F3 | Unknown operation
    TSB $F0              ; 04 F0 | Unknown operation
    TSB $C3              ; 04 C3 | Unknown operation
    TSB $DF              ; 04 DF | Unknown operation
    TSB $F4              ; 04 F4 | Unknown operation
    TSB $C4              ; 04 C4 | Unknown operation
    TSB $E0              ; 04 E0 | Unknown operation
    TSB $E1              ; 04 E1 | Unknown operation
    TSB $C5              ; 04 C5 | Unknown operation
    TSB $C6              ; 04 C6 | Unknown operation
    TSB $E2              ; 04 E2 | Unknown operation
    TSB $C7              ; 04 C7 | Unknown operation
    TSB $0F              ; 04 0F | Unknown operation
    ORA $C8              ; 05 C8 | Logical OR with accumulator
    TSB $F5              ; 04 F5 | Unknown operation
    TSB $F6              ; 04 F6 | Unknown operation
    TSB $F7              ; 04 F7 | Unknown operation
    TSB $C9              ; 04 C9 | Unknown operation
    ; Skipped 47 bytes of data
    CPY $CC04            ; CC 04 CC | Unknown operation
    TSB $CC              ; 04 CC | Unknown operation
    TSB $CC              ; 04 CC | Unknown operation
    TSB $CC              ; 04 CC | Unknown operation
    TSB $CC              ; 04 CC | Unknown operation
    TSB $CC              ; 04 CC | Unknown operation
    TSB $3A              ; 04 3A | Unknown operation
    ORA $D9              ; 05 D9 | Logical OR with accumulator
    ORA $DA              ; 05 DA | Logical OR with accumulator
    ORA $E6              ; 05 E6 | Logical OR with accumulator
    ORA $DB              ; 05 DB | Logical OR with accumulator
    ORA $F9              ; 05 F9 | Logical OR with accumulator
    TSB $E7              ; 04 E7 | Unknown operation
    TSB $DC              ; 04 DC | Unknown operation
    ORA $E7              ; 05 E7 | Logical OR with accumulator
    ORA $DD              ; 05 DD | Logical OR with accumulator
    ORA $18              ; 05 18 | Logical OR with accumulator
    ORA $FA              ; 05 FA | Logical OR with accumulator
    TSB $DE              ; 04 DE | Unknown operation
    ORA $E8              ; 05 E8 | Logical OR with accumulator
    ORA $FB              ; 05 FB | Logical OR with accumulator
    TSB $E0              ; 04 E0 | Unknown operation
    ORA $E1              ; 05 E1 | Logical OR with accumulator
    ORA $FF              ; 05 FF | Logical OR with accumulator
    TSB $1A              ; 04 1A | Unknown operation
    ORA $E2              ; 05 E2 | Logical OR with accumulator
    ORA $8B              ; 05 8B | Logical OR with accumulator

    ORA $8B              ; 05 8B
    ORA $84              ; 05 84
    ORA $3E              ; 05 3E
    ORA $85              ; 05 85
    ORA $3F              ; 05 3F
    ORA $40              ; 05 40
    ORA $41              ; 05 41
    ORA $E3              ; 05 E3
    ORA $42              ; 05 42
    ORA $E4              ; 05 E4
    ORA $43              ; 05 43
    ORA $44              ; 05 44
    ORA $45              ; 05 45
    ORA $46              ; 05 46
    ORA $E5              ; 05 E5
    ORA $6A              ; 05 6A
    ORA $47              ; 05 47
    ORA $49              ; 05 49
    ORA $4A              ; 05 4A
    ORA $4C              ; 05 4C
    ORA $4D              ; 05 4D
    ORA $3B              ; 05 3B
    ORA $3C              ; 05 3C
    ORA $72              ; 05 72
    ORA $5B              ; 05 5B
    ORA $3D              ; 05 3D
    ORA $48              ; 05 48
    ORA $88              ; 05 88
    ORA $4B              ; 05 4B
    ORA $03              ; 05 03
    ASL $4E              ; 06 4E
    ORA $36              ; 05 36
    ORA $F8              ; 05 F8
    TSB $AC              ; 04 AC
    BRK $1E              ; 00 1E
    LDY #$1F             ; A0 1F
    ROL                  ; 2A
    INC $D55F,X          ; FE 5F D5
    LDY $F2              ; A4 F2
    ORA $10              ; 01 10
    JSR ($1861,X)        ; FC 61 18
    ROL $E0              ; 26 E0
    BEQ $0F21            ; F0 3C
    SBC $7FC141,X        ; FF 41 C1 7F
    EOR $92              ; 52 92
    STA $FF              ; 92 FF
    LDY #$F0             ; A0 F0
    ADC $228800,X        ; 7F 00 88 22
    EOR $85              ; 52 85

;==============================================================================
; GeneralPurpose_017
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_017:
    SEP #$23             ; E2 23 | Set processor status bits
    


;==============================================================================
; GeneralPurpose_018
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_018:
    PHP                  ; 08 | Push processor status to stack
    INC $401F,X          ; FE 1F 40 | Unknown operation
    JSR $E100            ; 20 00 E1 | Call local function
    SBC $082084,X        ; FF 84 20 08 | Unknown operation
    


;==============================================================================
; GeneralPurpose_019
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_019:
    REP #$90             ; C2 90 | Clear processor status bits
    ORA $03              ; 01 03 | Logical OR with accumulator
    ROR $0C,X            ; 76 0C | Unknown operation
    ASL $FF01,X          ; 1E 01 FF | Arithmetic shift left
    LDA $24              ; A7 24 | Load value into accumulator
    AND $FF              ; 25 FF | Logical AND with accumulator
    ORA #$48             ; 09 48 | Logical OR with accumulator
    CMP $94528B,X        ; DF 8B 52 94 | Compare with accumulator
    LDX $A514,Y          ; BE 14 A5 | Load X register
    INX                  ; E8 | Unknown operation
    ADC $FDF0,X          ; 7D F0 FD | Unknown operation
    PLP                  ; 28 | Pull processor status from stack
    ROR $8A3F,X          ; 7E 3F 8A | Unknown operation
    CMP $3E610F,X        ; DF 0F 61 3E | Compare with accumulator
    LDA $D8              ; A3 D8 | Load value into accumulator
    CMP $33E644,X        ; DF 44 E6 33 | Compare with accumulator
    STA $FB              ; 91 FB | Store accumulator to memory
    BIT $12,X            ; 34 12 | Unknown operation
    EOR #$50             ; 49 50 | Unknown operation
    SBC $FF              ; F2 FF | Unknown operation
    BRK $82              ; 00 82 | Software interrupt
    CPX #$FF             ; E0 FF | Unknown operation
    JSR $0380            ; 20 80 03 | Call local function
    ROL                  ; 2A | Unknown operation
    JMP $6232            ; 4C 32 62 | Unknown operation
    BPL $0F3F            ; 10 00 | Unknown operation
    ORA $04              ; 03 04 | Logical OR with accumulator
    BRK $10              ; 00 10 | Software interrupt
    ORA $005009          ; 0F 09 50 00 | Logical OR with accumulator
    TDC                  ; 7B | Unknown operation
    CLI                  ; 58 | Unknown operation
    LDY #$84             ; A0 84 | Load Y register
    MVP $1C26            ; 44 26 1C | Unknown operation
    ORA $18              ; 05 18 | Logical OR with accumulator
    BPL $0F43            ; 10 F1 | Unknown operation
    ADC $808044,X        ; 7F 44 80 80 | Unknown operation
    AND $092124,X        ; 3F 24 21 09 | Logical AND with accumulator
    EOR #$FE             ; 49 FE | Unknown operation
    ORA $302805          ; 0F 05 28 30 | Logical OR with accumulator
    INC $E0              ; E6 E0 | Unknown operation
    CMP $F4548B,X        ; DF 8B 54 F4 | Compare with accumulator
    JSL $4A3DF5          ; 22 F5 3D 4A | Call external function
    EOR $8F              ; 51 8F | Unknown operation
    ASL                  ; 0A | Arithmetic shift left
    MVN $9695            ; 54 95 96 | Unknown operation
    MVN $18A5            ; 54 A5 18 | Unknown operation
    INC                  ; 1A | Unknown operation
    


;==============================================================================
; GeneralPurpose_01A
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_01A:
    PHP                  ; 08 | Push processor status to stack
    SBC $FE202F,X        ; FF 2F 20 FE | Unknown operation
    BRA $0EFB            ; 80 80 | Unknown operation
    LDA $0FE525,X        ; BF 25 E5 0F | Load value into accumulator
    EOR #$F8             ; 49 F8 | Unknown operation
    


;==============================================================================
; GeneralPurpose_01B
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_01B:
    PHB                  ; 8B | Push data bank register
    CPY $1446            ; CC 46 14 | Unknown operation
    BIT $08              ; 24 08 | Unknown operation
    JMP $2242            ; 4C 42 22 | Unknown operation
    PLP                  ; 28 | Pull processor status from stack
    AND $62              ; 31 62 | Logical AND with accumulator
    CPX #$20             ; E0 20 | Unknown operation
    BMI $0F9A            ; 30 09 | Unknown operation
    BIT #$A0             ; 89 A0 | Unknown operation
    STY $08              ; 84 08 | Store Y register
    STA $0C              ; 83 0C | Store accumulator to memory
    CLD                  ; D8 | Unknown operation
    AND $02              ; 27 02 | Logical AND with accumulator
    SBC $A5              ; F2 A5 | Unknown operation
    CPY #$7E             ; C0 7E | Unknown operation
    CMP $C4              ; C7 C4 | Compare with accumulator
    CLD                  ; D8 | Unknown operation
    ADC $5C6585          ; 6F 85 65 5C | Unknown operation
    EOR $A9              ; 53 A9 | Unknown operation
    EOR $23              ; 52 23 | Unknown operation
    COP $61              ; 02 61 | Unknown operation
    LDA $3FE041,X        ; BF 41 E0 3F | Load value into accumulator
    WDM $17              ; 42 17 | Unknown operation
    TXA                  ; 8A | Transfer X to accumulator
    EOR $176230,X        ; 5F 30 62 17 | Unknown operation
    PEI $98              ; D4 98 | Unknown operation
    JMP ($FF74)          ; 6C 74 FF | Unknown operation
    STX $A0              ; 86 A0 | Store X register
    LDA $094124,X        ; BF 24 41 09 | Load value into accumulator
    PHA                  ; 48 | Push accumulator to stack
    PLX                  ; FA | Pull X register from stack
    


;==============================================================================
; GeneralPurpose_01C
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_01C:
    PHK                  ; 4B | Unknown operation
    BPL $0F68            ; 10 A2 | Unknown operation
    JSR $A505            ; 20 05 A5 | Call local function
    BPL $1014            ; 10 49 | Unknown operation
    CMP $B1              ; D1 B1 | Compare with accumulator
    PLY                  ; 7A | Pull Y register from stack
    BPL $102C            ; 10 5C | Unknown operation
    BRA $1042            ; 80 70 | Unknown operation
    TSB $3C              ; 04 3C | Unknown operation
    EOR $B5              ; 51 B5 | Unknown operation
    ASL                  ; 0A | Arithmetic shift left
    EOR $90              ; 52 90 | Unknown operation
    BRL $B230            ; 82 54 A2 | Unknown operation
    TRB $4869            ; 1C 69 48 | Unknown operation
    AND $0F              ; 21 0F | Logical AND with accumulator
    CMP #$5F             ; C9 5F | Compare with accumulator
    TXA                  ; 8A | Transfer X to accumulator
    LSR $A298,X          ; 5E 98 A2 | Unknown operation
    LDY $3C              ; A4 3C | Load Y register
    AND $11              ; 25 11 | Logical AND with accumulator
    CMP #$78             ; C9 78 | Compare with accumulator
    ORA #$4C             ; 09 4C | Logical OR with accumulator
    ROL                  ; 2A | Unknown operation
    STY $52,X            ; 94 52 | Store Y register
    CPX #$7E             ; E0 7E | Unknown operation
    TRB $A2              ; 14 A2 | Unknown operation
    SBC $64              ; E3 64 | Unknown operation
    INC $8410,X          ; FE 10 84 | Unknown operation
    AND $0FE104,X        ; 3F 04 E1 0F | Logical AND with accumulator
    EOR $08              ; 41 08 | Unknown operation
    


;==============================================================================
; GeneralPurpose_01D
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_01D:
    REP #$10             ; C2 10 | Clear processor status bits
    SBC $504A0B          ; EF 0B 4A 50 | Unknown operation
    BRL $CE1C            ; 82 12 BE | Unknown operation
    EOR $A1              ; 57 A1 | Unknown operation
    ASL                  ; 0A | Arithmetic shift left
    CMP $4728,X          ; DD 28 47 | Compare with accumulator
    AND $FA              ; 31 FA | Logical AND with accumulator
    EOR $7C              ; 51 7C | Unknown operation
    ROL $FE08,X          ; 3E 08 FE | Unknown operation
    ORA $00FE02          ; 0F 02 FE 00 | Logical OR with accumulator
    CPX #$FF             ; E0 FF | Unknown operation
    ORA $8C              ; 01 8C | Logical OR with accumulator
    JSL $112014          ; 22 14 20 11 | Call external function
    BIT #$88             ; 89 88 | Unknown operation
    BIT $8518,X          ; 3C 18 85 | Unknown operation
    INC $8142,X          ; FE 42 81 | Unknown operation
    AND $0FE505,X        ; 3F 05 E5 0F | Logical AND with accumulator
    EOR $F8              ; 41 F8 | Unknown operation
    ORA $42              ; 03 42 | Logical OR with accumulator
    SBC $112142,X        ; FF 42 21 11 | Unknown operation
    ORA $EB              ; 07 EB | Logical OR with accumulator
    ORA $91              ; 13 91 | Logical OR with accumulator
    SED                  ; F8 | Unknown operation
    MVP $BEB4            ; 44 B4 BE | Unknown operation
    LDA $A8              ; A5 A8 | Load value into accumulator
    EOR $17F228          ; 4F 28 F2 17 | Unknown operation
    STA $74              ; 91 74 | Store accumulator to memory
    ASL                  ; 0A | Arithmetic shift left
    EOR $5E              ; 51 5E | Unknown operation
    STY $D0              ; 84 D0 | Store Y register
    SBC $48              ; F7 48 | Unknown operation
    ROL                  ; 2A | Unknown operation
    DEY                  ; 88 | Unknown operation
    STA $223F44          ; 8F 44 3F 22 | Store accumulator to memory
    STA $47DA8B,X        ; 9F 8B DA 47 | Store accumulator to memory
    AND $1A              ; 23 1A | Logical AND with accumulator
    STA $8F              ; 91 8F | Store accumulator to memory
    BEQ $0FEC            ; F0 8E | Branch if equal (zero flag set)
    MVN $22A4            ; 54 A4 22 | Unknown operation
    ORA $E9,X            ; 15 E9 | Logical OR with accumulator
    PHA                  ; 48 | Push accumulator to stack
    EOR $2A              ; 45 2A | Unknown operation
    CMP $91              ; D2 91 | Compare with accumulator
    TAX                  ; AA | Transfer accumulator to X
    MVN $2AA5            ; 54 A5 2A | Unknown operation
    CMP $29,X            ; D5 29 | Compare with accumulator
    ORA $F2              ; 01 F2 | Logical OR with accumulator
    STA $AA              ; 91 AA | Store accumulator to memory
    MVN $B2B5            ; 54 B5 B2 | Unknown operation

    MVN $B2B5            ; 54 B5 B2
    ORA $FD,X            ; 15 FD
    PHA                  ; 48
    EOR $2A              ; 45 2A
    EOR $95              ; 53 95
    ROL                  ; 2A
    ADC $8008,X          ; 7D 08 80
    PEA $D1C0            ; F4 C0 D1
    EOR $08              ; 52 08
    AND $90              ; 23 90
    SBC $0A1145,X        ; FF 45 11 0A
;==============================================================================
; Function Index (30 functions)
;==============================================================================
; GeneralPurpose_000
; GeneralPurpose_001
; GeneralPurpose_002
; GeneralPurpose_003
; GeneralPurpose_004
; GeneralPurpose_005
; GeneralPurpose_006
; GeneralPurpose_007
; GeneralPurpose_008
; GeneralPurpose_009
; GeneralPurpose_00A
; GeneralPurpose_00B
; GeneralPurpose_00C
; GeneralPurpose_00D
; GeneralPurpose_00E
; GeneralPurpose_00F
; GeneralPurpose_010
; GeneralPurpose_011
; GeneralPurpose_012
; GeneralPurpose_013
; GeneralPurpose_014
; GeneralPurpose_015
; GeneralPurpose_016
; GeneralPurpose_017
; GeneralPurpose_018
; GeneralPurpose_019
; GeneralPurpose_01A
; GeneralPurpose_01B
; GeneralPurpose_01C
; GeneralPurpose_01D
;==============================================================================