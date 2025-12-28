;==============================================================================
; Dragon Quest III - Bank 0E
;==============================================================================
; File: bank_0E.asm
; Purpose: Game system module with comprehensive documentation
; Functions: Auto-analyzed and labeled with meaningful names
; Comments: Context-aware instruction documentation
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

; Dragon Quest III - Bank $0E Code
; Ultra-aggressive code extraction


.segment "BANK_0E_CODE"


;==============================================================================
; GeneralPurpose_00
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00:
    INC $01              ; E6 01 | Unknown operation
    CMP $29              ; C7 29 | Compare with accumulator
    COP $C7              ; 02 C7 | Unknown operation
    JMP ($C702)          ; 6C 02 C7 | Unknown operation
    LDA $F2C702          ; AF 02 C7 F2 | Load value into accumulator
    COP $C7              ; 02 C7 | Unknown operation
    AND $03,X            ; 35 03 | Logical AND with accumulator
    CMP $78              ; C7 78 | Compare with accumulator
    ORA $C7              ; 03 C7 | Logical OR with accumulator
    TYX                  ; BB | Unknown operation
    ORA $C7              ; 03 C7 | Logical OR with accumulator
    INC $C703,X          ; FE 03 C7 | Unknown operation
    EOR $04              ; 41 04 | Unknown operation
    CMP $84              ; C7 84 | Compare with accumulator
    TSB $C7              ; 04 C7 | Unknown operation
    CMP $04              ; C7 04 | Compare with accumulator
    CMP $0A              ; C7 0A | Compare with accumulator
    ORA $C7              ; 05 C7 | Logical OR with accumulator
    EOR $C705            ; 4D 05 C7 | Unknown operation
    BCC $0031            ; 90 05 | Branch if carry clear
    CMP $D3              ; C7 D3 | Compare with accumulator
    ORA $C7              ; 05 C7 | Logical OR with accumulator
    ASL $06,X            ; 16 06 | Arithmetic shift left
    CMP $59              ; C7 59 | Compare with accumulator
    ASL $C7              ; 06 C7 | Arithmetic shift left
    STZ $C706            ; 9C 06 C7 | Unknown operation
    CMP $22C706,X        ; DF 06 C7 22 | Compare with accumulator
    ORA $C7              ; 07 C7 | Logical OR with accumulator
    ADC $07              ; 65 07 | Unknown operation
    CMP $A8              ; C7 A8 | Compare with accumulator
    ORA $C7              ; 07 C7 | Logical OR with accumulator
    XBA                  ; EB | Exchange accumulator bytes
    ORA $C7              ; 07 C7 | Logical OR with accumulator
    ROL $C708            ; 2E 08 C7 | Unknown operation
    AND $08,X            ; 35 08 | Logical AND with accumulator
    CMP $3C              ; C7 3C | Compare with accumulator
    PHP                  ; 08 | Push processor status to stack
    CMP $43              ; C7 43 | Compare with accumulator
    PHP                  ; 08 | Push processor status to stack
    CMP $4A              ; C7 4A | Compare with accumulator
    PHP                  ; 08 | Push processor status to stack
    CMP $51              ; C7 51 | Compare with accumulator
    PHP                  ; 08 | Push processor status to stack
    CMP $58              ; C7 58 | Compare with accumulator
    PHP                  ; 08 | Push processor status to stack
    CMP $5F              ; C7 5F | Compare with accumulator
    PHP                  ; 08 | Push processor status to stack
    CMP $66              ; C7 66 | Compare with accumulator
    PHP                  ; 08 | Push processor status to stack

    PHP                  ; 08
    CMP $6D              ; C7 6D
    PHP                  ; 08
    CMP $74              ; C7 74
    PHP                  ; 08
    CMP $7B              ; C7 7B
    PHP                  ; 08
    CMP $82              ; C7 82
    PHP                  ; 08
    CMP $89              ; C7 89
    PHP                  ; 08
    CMP $90              ; C7 90
    PHP                  ; 08
    CMP $97              ; C7 97
    PHP                  ; 08
    CMP $9E              ; C7 9E
    PHP                  ; 08
    CMP $A5              ; C7 A5
    PHP                  ; 08
    CMP $AC              ; C7 AC
    PHP                  ; 08
    CMP $B3              ; C7 B3
    PHP                  ; 08
    CMP $BA              ; C7 BA
    PHP                  ; 08
    CMP $C1              ; C7 C1
    PHP                  ; 08
    CMP $C8              ; C7 C8
    PHP                  ; 08
    CMP $CF              ; C7 CF
    PHP                  ; 08
    CMP $D6              ; C7 D6
    PHP                  ; 08
    CMP $DD              ; C7 DD
    PHP                  ; 08
    CMP $E4              ; C7 E4
    PHP                  ; 08
    CMP $EB              ; C7 EB
    PHP                  ; 08
    CMP $F2              ; C7 F2
    PHP                  ; 08
    CMP $F9              ; C7 F9
    PHP                  ; 08
    CMP $00              ; C7 00
    ORA #$C7             ; 09 C7
    ORA $09              ; 07 09
    CMP $0E              ; C7 0E
    ORA #$C7             ; 09 C7
    STA $09              ; 91 09
    CMP $14              ; C7 14
    ASL                  ; 0A
    CMP $97              ; C7 97
    ASL                  ; 0A
    CMP $1A              ; C7 1A
    PHD                  ; 0B
    CMP $21              ; C7 21
    PHD                  ; 0B
    CMP $28              ; C7 28
    PHD                  ; 0B
    CMP $2F              ; C7 2F
    PHD                  ; 0B
    CMP $36              ; C7 36
    PHD                  ; 0B
    CMP $3D              ; C7 3D
    PHD                  ; 0B
    CMP $44              ; C7 44
    PHD                  ; 0B
    CMP $4B              ; C7 4B
    PHD                  ; 0B
    CMP $52              ; C7 52
    PHD                  ; 0B
    CMP $59              ; C7 59
    PHD                  ; 0B
    CMP $60              ; C7 60
    PHD                  ; 0B
    CMP $67              ; C7 67
    PHD                  ; 0B
    CMP $6E              ; C7 6E
    PHD                  ; 0B
    CMP $75              ; C7 75
    PHD                  ; 0B
    CMP $7C              ; C7 7C
    PHD                  ; 0B
    CMP $83              ; C7 83
    PHD                  ; 0B
    CMP $8A              ; C7 8A
    PHD                  ; 0B
    CMP $91              ; C7 91
    PHD                  ; 0B
    CMP $98              ; C7 98
    PHD                  ; 0B
    CMP $9F              ; C7 9F
    PHD                  ; 0B
    CMP $A6              ; C7 A6
    PHD                  ; 0B
    CMP $AD              ; C7 AD
    PHD                  ; 0B
    CMP $B4              ; C7 B4
    PHD                  ; 0B
    CMP $BB              ; C7 BB
    PHD                  ; 0B
    CMP $C2              ; C7 C2
    PHD                  ; 0B
    CMP $C9              ; C7 C9

;==============================================================================
; GeneralPurpose_01
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_01:
    PHD                  ; 0B | Unknown operation
    CMP $D0              ; C7 D0 | Compare with accumulator
    PHD                  ; 0B | Unknown operation
    CMP $D7              ; C7 D7 | Compare with accumulator
    PHD                  ; 0B | Unknown operation
    CMP $DE              ; C7 DE | Compare with accumulator
    PHD                  ; 0B | Unknown operation
    CMP $E5              ; C7 E5 | Compare with accumulator
    PHD                  ; 0B | Unknown operation
    CMP $EC              ; C7 EC | Compare with accumulator
    PHD                  ; 0B | Unknown operation
    CMP $F3              ; C7 F3 | Compare with accumulator
    PHD                  ; 0B | Unknown operation
    CMP $FA              ; C7 FA | Compare with accumulator
    PHD                  ; 0B | Unknown operation
    CMP $01              ; C7 01 | Compare with accumulator
    TSB $08C7            ; 0C C7 08 | Unknown operation
    TSB $0FC7            ; 0C C7 0F | Unknown operation
    TSB $16C7            ; 0C C7 16 | Unknown operation
    TSB $1DC7            ; 0C C7 1D | Unknown operation
    TSB $24C7            ; 0C C7 24 | Unknown operation
    TSB $2BC7            ; 0C C7 2B | Unknown operation
    TSB $32C7            ; 0C C7 32 | Unknown operation
    TSB $39C7            ; 0C C7 39 | Unknown operation
    TSB $40C7            ; 0C C7 40 | Unknown operation
    TSB $47C7            ; 0C C7 47 | Unknown operation
    TSB $72C7            ; 0C C7 72 | Unknown operation
    TSB $99C7            ; 0C C7 99 | Unknown operation
    TSB $C4C7            ; 0C C7 C4 | Unknown operation
    TSB $EBC7            ; 0C C7 EB | Unknown operation
    TSB $0EC7            ; 0C C7 0E | Unknown operation
    ORA $31C7            ; 0D C7 31 | Logical OR with accumulator
    ORA $58C7            ; 0D C7 58 | Logical OR with accumulator
    ORA $77C7            ; 0D C7 77 | Logical OR with accumulator
    ORA $A2C7            ; 0D C7 A2 | Logical OR with accumulator
    ORA $C5C7            ; 0D C7 C5 | Logical OR with accumulator
    ORA $E8C7            ; 0D C7 E8 | Logical OR with accumulator
    ORA $0BC7            ; 0D C7 0B | Logical OR with accumulator
    ASL $2EC7            ; 0E C7 2E | Arithmetic shift left
    ASL $4DC7            ; 0E C7 4D | Arithmetic shift left
    ASL $74C7            ; 0E C7 74 | Arithmetic shift left
    ASL $9BC7            ; 0E C7 9B | Arithmetic shift left
    ASL $FEC7            ; 0E C7 FE | Arithmetic shift left
    ASL $19C7            ; 0E C7 19 | Arithmetic shift left
    ORA $0F48C7          ; 0F C7 48 0F | Logical OR with accumulator
    CMP $67              ; C7 67 | Compare with accumulator
    ORA $0FA2C7          ; 0F C7 A2 0F | Logical OR with accumulator
    CMP $DD              ; C7 DD | Compare with accumulator
    ORA $1018C7          ; 0F C7 18 10 | Logical OR with accumulator

    ORA $1018C7          ; 0F C7 18 10
    CMP $53              ; C7 53
    BPL $0147            ; 10 C7
    PHY                  ; 5A
    BPL $014A            ; 10 C7
    ADC $10              ; 61 10
    CMP $74              ; C7 74
    BPL $0150            ; 10 C7
    STA $10              ; 87 10
    CMP $9A              ; C7 9A
    BPL $0156            ; 10 C7
    LDA $C710            ; AD 10 C7
    CPY #$10             ; C0 10
    CMP $D3              ; C7 D3
    BPL $015F            ; 10 C7
    SBC $10              ; F2 10
    CMP $FD              ; C7 FD
    BPL $0165            ; 10 C7
    TSB $11              ; 04 11
    CMP $0F              ; C7 0F
    ORA $C7              ; 11 C7
    ROL                  ; 2A
    ORA $C7              ; 11 C7
    EOR $11              ; 41 11
    CMP $54              ; C7 54
    TRB $C7              ; 14 C7
    STA $42C717          ; 8F 17 C7 42
    INC                  ; 1A
    CMP $F9              ; C7 F9
    TCS                  ; 1B
    CMP $2C              ; C7 2C
    ORA $201FC7,X        ; 1F C7 1F 20
    CMP $8A              ; C7 8A
    JSR $F1C7            ; 20 C7 F1
    JSR $10C7            ; 20 C7 10
    AND $C7              ; 21 C7
    AND $4EC721          ; 2F 21 C7 4E
    AND $C7              ; 21 C7
    ADC $C721            ; 6D 21 C7
    BRA $01F1            ; 80 21
    CMP $CB              ; C7 CB
    AND $C7              ; 21 C7
    ROR $C722,X          ; 7E 22 C7
    ADC $C723            ; 6D 23 C7
    SEI                  ; 78
    AND $C7              ; 23 C7
    STA $23              ; 83 23
    CMP $8A              ; C7 8A
    AND $C7              ; 23 C7
    LDA $23,X            ; B5 23
    CMP $00              ; C7 00
    SBC $000100,X        ; FF 00 01 00
    SBC $000700,X        ; FF 00 07 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000700,X        ; FF 00 07 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000700,X        ; FF 00 07 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000700,X        ; FF 00 07 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000700,X        ; FF 00 07 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000700,X        ; FF 00 07 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000700,X        ; FF 00 07 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000700,X        ; FF 00 07 00
    BRK $FF              ; 00 FF
    ORA $00              ; 01 00
    COP $01              ; 02 01
    ORA $00              ; 01 00
    COP $07              ; 02 07
    BRK $00              ; 00 00
    COP $01              ; 02 01
    ORA $00              ; 01 00
    COP $07              ; 02 07
    BRK $00              ; 00 00
    COP $01              ; 02 01
    ORA $00              ; 01 00
    COP $07              ; 02 07
    BRK $00              ; 00 00
    COP $01              ; 02 01
    ORA $00              ; 01 00
    COP $07              ; 02 07
    BRK $00              ; 00 00
    COP $01              ; 02 01
    ORA $00              ; 01 00
    COP $07              ; 02 07
    BRK $00              ; 00 00
    COP $01              ; 02 01
    ORA $00              ; 01 00
    COP $07              ; 02 07
    BRK $00              ; 00 00
    COP $01              ; 02 01
    ORA $00              ; 01 00
    COP $07              ; 02 07
    BRK $00              ; 00 00
    COP $01              ; 02 01
    ORA $00              ; 01 00
    COP $07              ; 02 07
    BRK $00              ; 00 00
    SBC $040100,X        ; FF 00 01 04
    ORA $00              ; 01 00
    ORA $04              ; 01 04
    ORA $00              ; 07 00
    BRK $04              ; 00 04
    ORA $00              ; 01 00
    ORA $04              ; 01 04
    ORA $00              ; 07 00
    BRK $04              ; 00 04
    ORA $00              ; 01 00
    ORA $04              ; 01 04
    ORA $00              ; 07 00
    BRK $04              ; 00 04
    ORA $00              ; 01 00
    ORA $04              ; 01 04
    ORA $00              ; 07 00
    BRK $04              ; 00 04
    ORA $00              ; 01 00
    ORA $04              ; 01 04
    ORA $00              ; 07 00
    BRK $04              ; 00 04
    ORA $00              ; 01 00
    ORA $04              ; 01 04
    ORA $00              ; 07 00
    BRK $04              ; 00 04
    ORA $00              ; 01 00
    ORA $04              ; 01 04
    ORA $00              ; 07 00
    BRK $04              ; 00 04
    ORA $00              ; 01 00
    ORA $04              ; 01 04
    ORA $00              ; 07 00
    BRK $FF              ; 00 FF
    SBC $010600,X        ; FF 00 06 01
    SBC $070600,X        ; FF 00 06 07
    BRK $00              ; 00 00
    ASL $01              ; 06 01
    SBC $070600,X        ; FF 00 06 07
    BRK $00              ; 00 00
    ASL $01              ; 06 01
    SBC $070600,X        ; FF 00 06 07
    BRK $00              ; 00 00
    ASL $01              ; 06 01
    SBC $070600,X        ; FF 00 06 07
    BRK $00              ; 00 00
    ASL $01              ; 06 01
    SBC $070600,X        ; FF 00 06 07
    BRK $00              ; 00 00
    ASL $01              ; 06 01
    SBC $070600,X        ; FF 00 06 07
    BRK $00              ; 00 00
    ASL $01              ; 06 01
    SBC $070600,X        ; FF 00 06 07
    BRK $00              ; 00 00
    ASL $01              ; 06 01
    SBC $070600,X        ; FF 00 06 07
    BRK $00              ; 00 00
    SBC $02FF01,X        ; FF 01 FF 02
    ORA $01              ; 01 01
    SBC $000702,X        ; FF 02 07 00
    BRK $02              ; 00 02
    ORA $01              ; 01 01
    SBC $000702,X        ; FF 02 07 00
    BRK $02              ; 00 02
    ORA $01              ; 01 01
    SBC $000702,X        ; FF 02 07 00
    BRK $02              ; 00 02
    ORA $01              ; 01 01
    SBC $000702,X        ; FF 02 07 00
    BRK $02              ; 00 02
    ORA $01              ; 01 01
    SBC $000702,X        ; FF 02 07 00
    BRK $02              ; 00 02
    ORA $01              ; 01 01
    SBC $000702,X        ; FF 02 07 00
    BRK $02              ; 00 02
    ORA $01              ; 01 01
    SBC $000702,X        ; FF 02 07 00
    BRK $02              ; 00 02
    ORA $01              ; 01 01
    SBC $000702,X        ; FF 02 07 00
    BRK $FF              ; 00 FF
    ORA $01              ; 01 01
    COP $01              ; 02 01
    ORA $01              ; 01 01
    COP $07              ; 02 07
    BRK $00              ; 00 00
    COP $01              ; 02 01
    ORA $01              ; 01 01
    COP $07              ; 02 07
    BRK $00              ; 00 00
    COP $01              ; 02 01
    ORA $01              ; 01 01
    COP $07              ; 02 07
    BRK $00              ; 00 00
    COP $01              ; 02 01
    ORA $01              ; 01 01
    COP $07              ; 02 07
    BRK $00              ; 00 00
    COP $01              ; 02 01
    ORA $01              ; 01 01
    COP $07              ; 02 07
    BRK $00              ; 00 00
    COP $01              ; 02 01
    ORA $01              ; 01 01
    COP $07              ; 02 07
    BRK $00              ; 00 00
    COP $01              ; 02 01
    ORA $01              ; 01 01
    COP $07              ; 02 07
    BRK $00              ; 00 00
    COP $01              ; 02 01
    ORA $01              ; 01 01
    COP $07              ; 02 07
    BRK $00              ; 00 00
    SBC $0601FF,X        ; FF FF 01 06
    ORA $FF              ; 01 FF
    ORA $06              ; 01 06
    ORA $00              ; 07 00
    BRK $06              ; 00 06
    ORA $FF              ; 01 FF
    ORA $06              ; 01 06
    ORA $00              ; 07 00
    BRK $06              ; 00 06
    ORA $FF              ; 01 FF
    ORA $06              ; 01 06
    ORA $00              ; 07 00
    BRK $06              ; 00 06
    ORA $FF              ; 01 FF
    ORA $06              ; 01 06
    ORA $00              ; 07 00
    BRK $06              ; 00 06
    ORA $FF              ; 01 FF
    ORA $06              ; 01 06
    ORA $00              ; 07 00
    BRK $06              ; 00 06
    ORA $FF              ; 01 FF
    ORA $06              ; 01 06
    ORA $00              ; 07 00
    BRK $06              ; 00 06
    ORA $FF              ; 01 FF
    ORA $06              ; 01 06
    ORA $00              ; 07 00
    BRK $06              ; 00 06
    ORA $FF              ; 01 FF
    ORA $06              ; 01 06
    ORA $00              ; 07 00
    BRK $FF              ; 00 FF
    SBC $0106FF,X        ; FF FF 06 01
    SBC $0706FF,X        ; FF FF 06 07
    BRK $00              ; 00 00
    ASL $01              ; 06 01
    SBC $0706FF,X        ; FF FF 06 07
    BRK $00              ; 00 00
    ASL $01              ; 06 01
    SBC $0706FF,X        ; FF FF 06 07
    BRK $00              ; 00 00
    ASL $01              ; 06 01
    SBC $0706FF,X        ; FF FF 06 07
    BRK $00              ; 00 00
    ASL $01              ; 06 01
    SBC $0706FF,X        ; FF FF 06 07
    BRK $00              ; 00 00
    ASL $01              ; 06 01
    SBC $0706FF,X        ; FF FF 06 07
    BRK $00              ; 00 00
    ASL $01              ; 06 01
    SBC $0706FF,X        ; FF FF 06 07
    BRK $00              ; 00 00
    ASL $01              ; 06 01
    SBC $0706FF,X        ; FF FF 06 07
    BRK $00              ; 00 00
    SBC $00FF00,X        ; FF 00 FF 00
    ORA $00              ; 01 00
    SBC $000300,X        ; FF 00 03 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000300,X        ; FF 00 03 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000300,X        ; FF 00 03 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000300,X        ; FF 00 03 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000300,X        ; FF 00 03 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000300,X        ; FF 00 03 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000300,X        ; FF 00 03 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000300,X        ; FF 00 03 00
    BRK $FF              ; 00 FF
    ORA $00              ; 01 00
    COP $01              ; 02 01
    ORA $00              ; 01 00
    COP $03              ; 02 03
    BRK $00              ; 00 00
    COP $01              ; 02 01
    ORA $00              ; 01 00
    COP $03              ; 02 03
    BRK $00              ; 00 00
    COP $01              ; 02 01
    ORA $00              ; 01 00
    COP $03              ; 02 03
    BRK $00              ; 00 00
    COP $01              ; 02 01
    ORA $00              ; 01 00
    COP $03              ; 02 03
    BRK $00              ; 00 00
    COP $01              ; 02 01
    ORA $00              ; 01 00
    COP $03              ; 02 03
    BRK $00              ; 00 00
    COP $01              ; 02 01
    ORA $00              ; 01 00
    COP $03              ; 02 03
    BRK $00              ; 00 00
    COP $01              ; 02 01
    ORA $00              ; 01 00
    COP $03              ; 02 03
    BRK $00              ; 00 00
    COP $01              ; 02 01
    ORA $00              ; 01 00
    COP $03              ; 02 03
    BRK $00              ; 00 00
    SBC $040100,X        ; FF 00 01 04
    ORA $00              ; 01 00
    ORA $04              ; 01 04
    ORA $00              ; 03 00
    BRK $04              ; 00 04
    ORA $00              ; 01 00
    ORA $04              ; 01 04
    ORA $00              ; 03 00
    BRK $04              ; 00 04
    ORA $00              ; 01 00
    ORA $04              ; 01 04
    ORA $00              ; 03 00
    BRK $04              ; 00 04
    ORA $00              ; 01 00
    ORA $04              ; 01 04
    ORA $00              ; 03 00
    BRK $04              ; 00 04
    ORA $00              ; 01 00
    ORA $04              ; 01 04
    ORA $00              ; 03 00
    BRK $04              ; 00 04
    ORA $00              ; 01 00
    ORA $04              ; 01 04
    ORA $00              ; 03 00
    BRK $04              ; 00 04
    ORA $00              ; 01 00
    ORA $04              ; 01 04
    ORA $00              ; 03 00
    BRK $04              ; 00 04
    ORA $00              ; 01 00
    ORA $04              ; 01 04
    ORA $00              ; 03 00
    BRK $FF              ; 00 FF
    SBC $010600,X        ; FF 00 06 01
    SBC $030600,X        ; FF 00 06 03
    BRK $00              ; 00 00
    ASL $01              ; 06 01
    SBC $030600,X        ; FF 00 06 03
    BRK $00              ; 00 00
    ASL $01              ; 06 01
    SBC $030600,X        ; FF 00 06 03
    BRK $00              ; 00 00
    ASL $01              ; 06 01
    SBC $030600,X        ; FF 00 06 03
    BRK $00              ; 00 00
    ASL $01              ; 06 01
    SBC $030600,X        ; FF 00 06 03
    BRK $00              ; 00 00
    ASL $01              ; 06 01
    SBC $030600,X        ; FF 00 06 03
    BRK $00              ; 00 00
    ASL $01              ; 06 01
    SBC $030600,X        ; FF 00 06 03
    BRK $00              ; 00 00
    ASL $01              ; 06 01
    SBC $030600,X        ; FF 00 06 03
    BRK $00              ; 00 00
    SBC $02FF01,X        ; FF 01 FF 02
    ORA $01              ; 01 01
    SBC $000302,X        ; FF 02 03 00
    BRK $02              ; 00 02
    ORA $01              ; 01 01
    SBC $000302,X        ; FF 02 03 00
    BRK $02              ; 00 02
    ORA $01              ; 01 01
    SBC $000302,X        ; FF 02 03 00
    BRK $02              ; 00 02
    ORA $01              ; 01 01
    SBC $000302,X        ; FF 02 03 00
    BRK $02              ; 00 02
    ORA $01              ; 01 01
    SBC $000302,X        ; FF 02 03 00
    BRK $02              ; 00 02
    ORA $01              ; 01 01
    SBC $000302,X        ; FF 02 03 00
    BRK $02              ; 00 02
    ORA $01              ; 01 01
    SBC $000302,X        ; FF 02 03 00
    BRK $02              ; 00 02
    ORA $01              ; 01 01
    SBC $000302,X        ; FF 02 03 00
    BRK $FF              ; 00 FF
    ORA $01              ; 01 01
    COP $01              ; 02 01
    ORA $01              ; 01 01
    COP $03              ; 02 03
    BRK $00              ; 00 00
    COP $01              ; 02 01
    ORA $01              ; 01 01
    COP $03              ; 02 03
    BRK $00              ; 00 00
    COP $01              ; 02 01
    ORA $01              ; 01 01
    COP $03              ; 02 03
    BRK $00              ; 00 00
    COP $01              ; 02 01
    ORA $01              ; 01 01
    COP $03              ; 02 03
    BRK $00              ; 00 00
    COP $01              ; 02 01
    ORA $01              ; 01 01
    COP $03              ; 02 03
    BRK $00              ; 00 00
    COP $01              ; 02 01
    ORA $01              ; 01 01
    COP $03              ; 02 03
    BRK $00              ; 00 00
    COP $01              ; 02 01
    ORA $01              ; 01 01
    COP $03              ; 02 03
    BRK $00              ; 00 00
    COP $01              ; 02 01
    ORA $01              ; 01 01
    COP $03              ; 02 03
    BRK $00              ; 00 00
    SBC $0601FF,X        ; FF FF 01 06
    ORA $FF              ; 01 FF
    ORA $06              ; 01 06
    ORA $00              ; 03 00
    BRK $06              ; 00 06
    ORA $FF              ; 01 FF
    ORA $06              ; 01 06
    ORA $00              ; 03 00
    BRK $06              ; 00 06
    ORA $FF              ; 01 FF
    ORA $06              ; 01 06
    ORA $00              ; 03 00
    BRK $06              ; 00 06
    ORA $FF              ; 01 FF
    ORA $06              ; 01 06
    ORA $00              ; 03 00
    BRK $06              ; 00 06
    ORA $FF              ; 01 FF
    ORA $06              ; 01 06
    ORA $00              ; 03 00
    BRK $06              ; 00 06
    ORA $FF              ; 01 FF
    ORA $06              ; 01 06
    ORA $00              ; 03 00
    BRK $06              ; 00 06
    ORA $FF              ; 01 FF
    ORA $06              ; 01 06
    ORA $00              ; 03 00
    BRK $06              ; 00 06
    ORA $FF              ; 01 FF
    ORA $06              ; 01 06
    ORA $00              ; 03 00
    BRK $FF              ; 00 FF
    SBC $0106FF,X        ; FF FF 06 01
    SBC $0306FF,X        ; FF FF 06 03
    BRK $00              ; 00 00
    ASL $01              ; 06 01
    SBC $0306FF,X        ; FF FF 06 03
    BRK $00              ; 00 00
    ASL $01              ; 06 01
    SBC $0306FF,X        ; FF FF 06 03
    BRK $00              ; 00 00
    ASL $01              ; 06 01
    SBC $0306FF,X        ; FF FF 06 03
    BRK $00              ; 00 00
    ASL $01              ; 06 01
    SBC $0306FF,X        ; FF FF 06 03
    BRK $00              ; 00 00
    ASL $01              ; 06 01
    SBC $0306FF,X        ; FF FF 06 03
    BRK $00              ; 00 00
    ASL $01              ; 06 01
    SBC $0306FF,X        ; FF FF 06 03
    BRK $00              ; 00 00
    ASL $01              ; 06 01
    SBC $0306FF,X        ; FF FF 06 03
    BRK $00              ; 00 00
    SBC $00FF00,X        ; FF 00 FF 00
    ORA $00              ; 01 00
    SBC $000100,X        ; FF 00 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000100,X        ; FF 00 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000100,X        ; FF 00 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000100,X        ; FF 00 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000100,X        ; FF 00 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000100,X        ; FF 00 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000100,X        ; FF 00 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000100,X        ; FF 00 01 00
    BRK $FF              ; 00 FF
    ORA $00              ; 01 00
    COP $01              ; 02 01
    ORA $00              ; 01 00
    COP $01              ; 02 01
    BRK $00              ; 00 00
    COP $01              ; 02 01
    ORA $00              ; 01 00
    COP $01              ; 02 01
    BRK $00              ; 00 00
    COP $01              ; 02 01
    ORA $00              ; 01 00
    COP $01              ; 02 01
    BRK $00              ; 00 00
    COP $01              ; 02 01
    ORA $00              ; 01 00
    COP $01              ; 02 01
    BRK $00              ; 00 00
    COP $01              ; 02 01
    ORA $00              ; 01 00
    COP $01              ; 02 01
    BRK $00              ; 00 00
    COP $01              ; 02 01
    ORA $00              ; 01 00
    COP $01              ; 02 01
    BRK $00              ; 00 00
    COP $01              ; 02 01
    ORA $00              ; 01 00
    COP $01              ; 02 01
    BRK $00              ; 00 00
    COP $01              ; 02 01
    ORA $00              ; 01 00
    COP $01              ; 02 01
    BRK $00              ; 00 00
    SBC $040100,X        ; FF 00 01 04
    ORA $00              ; 01 00
    ORA $04              ; 01 04
    ORA $00              ; 01 00
    BRK $04              ; 00 04
    ORA $00              ; 01 00
    ORA $04              ; 01 04
    ORA $00              ; 01 00
    BRK $04              ; 00 04
    ORA $00              ; 01 00
    ORA $04              ; 01 04
    ORA $00              ; 01 00
    BRK $04              ; 00 04
    ORA $00              ; 01 00
    ORA $04              ; 01 04
    ORA $00              ; 01 00
    BRK $04              ; 00 04
    ORA $00              ; 01 00
    ORA $04              ; 01 04
    ORA $00              ; 01 00
    BRK $04              ; 00 04
    ORA $00              ; 01 00
    ORA $04              ; 01 04
    ORA $00              ; 01 00
    BRK $04              ; 00 04
    ORA $00              ; 01 00
    ORA $04              ; 01 04
    ORA $00              ; 01 00
    BRK $04              ; 00 04
    ORA $00              ; 01 00
    ORA $04              ; 01 04
    ORA $00              ; 01 00
    BRK $FF              ; 00 FF
    SBC $010600,X        ; FF 00 06 01
    SBC $010600,X        ; FF 00 06 01
    BRK $00              ; 00 00
    ASL $01              ; 06 01
    SBC $010600,X        ; FF 00 06 01
    BRK $00              ; 00 00
    ASL $01              ; 06 01
    SBC $010600,X        ; FF 00 06 01
    BRK $00              ; 00 00
    ASL $01              ; 06 01
    SBC $010600,X        ; FF 00 06 01
    BRK $00              ; 00 00
    ASL $01              ; 06 01
    SBC $010600,X        ; FF 00 06 01
    BRK $00              ; 00 00
    ASL $01              ; 06 01
    SBC $010600,X        ; FF 00 06 01
    BRK $00              ; 00 00
    ASL $01              ; 06 01
    SBC $010600,X        ; FF 00 06 01
    BRK $00              ; 00 00
    ASL $01              ; 06 01
    SBC $010600,X        ; FF 00 06 01
    BRK $00              ; 00 00
    SBC $02FF01,X        ; FF 01 FF 02
    ORA $01              ; 01 01
    SBC $000102,X        ; FF 02 01 00
    BRK $02              ; 00 02
    ORA $01              ; 01 01
    SBC $000102,X        ; FF 02 01 00
    BRK $02              ; 00 02
    ORA $01              ; 01 01
    SBC $000102,X        ; FF 02 01 00
    BRK $02              ; 00 02
    ORA $01              ; 01 01
    SBC $000102,X        ; FF 02 01 00
    BRK $02              ; 00 02
    ORA $01              ; 01 01
    SBC $000102,X        ; FF 02 01 00
    BRK $02              ; 00 02
    ORA $01              ; 01 01
    SBC $000102,X        ; FF 02 01 00
    BRK $02              ; 00 02
    ORA $01              ; 01 01
    SBC $000102,X        ; FF 02 01 00
    BRK $02              ; 00 02
    ORA $01              ; 01 01
    SBC $000102,X        ; FF 02 01 00
    BRK $FF              ; 00 FF
    ORA $01              ; 01 01
    COP $01              ; 02 01
    ORA $01              ; 01 01
    COP $01              ; 02 01
    BRK $00              ; 00 00
    COP $01              ; 02 01
    ORA $01              ; 01 01
    COP $01              ; 02 01
    BRK $00              ; 00 00
    COP $01              ; 02 01
    ORA $01              ; 01 01
    COP $01              ; 02 01
    BRK $00              ; 00 00
    COP $01              ; 02 01
    ORA $01              ; 01 01
    COP $01              ; 02 01
    BRK $00              ; 00 00
    COP $01              ; 02 01
    ORA $01              ; 01 01
    COP $01              ; 02 01
    BRK $00              ; 00 00
    COP $01              ; 02 01
    ORA $01              ; 01 01
    COP $01              ; 02 01
    BRK $00              ; 00 00
    COP $01              ; 02 01
    ORA $01              ; 01 01
    COP $01              ; 02 01
    BRK $00              ; 00 00
    COP $01              ; 02 01
    ORA $01              ; 01 01
    COP $01              ; 02 01
    BRK $00              ; 00 00
    SBC $0601FF,X        ; FF FF 01 06
    ORA $FF              ; 01 FF
    ORA $06              ; 01 06
    ORA $00              ; 01 00
    BRK $06              ; 00 06
    ORA $FF              ; 01 FF
    ORA $06              ; 01 06
    ORA $00              ; 01 00
    BRK $06              ; 00 06
    ORA $FF              ; 01 FF
    ORA $06              ; 01 06
    ORA $00              ; 01 00
    BRK $06              ; 00 06
    ORA $FF              ; 01 FF
    ORA $06              ; 01 06
    ORA $00              ; 01 00
    BRK $06              ; 00 06
    ORA $FF              ; 01 FF
    ORA $06              ; 01 06
    ORA $00              ; 01 00
    BRK $06              ; 00 06
    ORA $FF              ; 01 FF
    ORA $06              ; 01 06
    ORA $00              ; 01 00
    BRK $06              ; 00 06
    ORA $FF              ; 01 FF
    ORA $06              ; 01 06
    ORA $00              ; 01 00
    BRK $06              ; 00 06
    ORA $FF              ; 01 FF
    ORA $06              ; 01 06
    ORA $00              ; 01 00
    BRK $FF              ; 00 FF
    SBC $0106FF,X        ; FF FF 06 01
    SBC $0106FF,X        ; FF FF 06 01
    BRK $00              ; 00 00
    ASL $01              ; 06 01
    SBC $0106FF,X        ; FF FF 06 01
    BRK $00              ; 00 00
    ASL $01              ; 06 01
    SBC $0106FF,X        ; FF FF 06 01
    BRK $00              ; 00 00
    ASL $01              ; 06 01
    SBC $0106FF,X        ; FF FF 06 01
    BRK $00              ; 00 00
    ASL $01              ; 06 01
    SBC $0106FF,X        ; FF FF 06 01
    BRK $00              ; 00 00
    ASL $01              ; 06 01
    SBC $0106FF,X        ; FF FF 06 01
    BRK $00              ; 00 00
    ASL $01              ; 06 01
    SBC $0106FF,X        ; FF FF 06 01
    BRK $00              ; 00 00
    ASL $01              ; 06 01
    SBC $0106FF,X        ; FF FF 06 01
    BRK $00              ; 00 00
    SBC $00FF00,X        ; FF 00 FF 00
    PHP                  ; 08
    BRK $FF              ; 00 FF
    SBC $020001,X        ; FF 01 00 02
    PHP                  ; 08
    ORA $00              ; 01 00
    SBC $040100,X        ; FF 00 01 04
    PHP                  ; 08
    BRK $01              ; 00 01
    SBC $0600FF,X        ; FF FF 00 06
    PHP                  ; 08
    SBC $01FF00,X        ; FF 00 FF 01
    SBC $010802,X        ; FF 02 08 01
    SBC $0101FF,X        ; FF FF 01 01
    COP $08              ; 02 08
    ORA $01              ; 01 01
    SBC $0601FF,X        ; FF FF 01 06
    PHP                  ; 08
    SBC $FFFF01,X        ; FF 01 FF FF
    SBC $FF0806,X        ; FF 06 08 FF
    SBC $FF00FF,X        ; FF FF 00 FF
    BRK $04              ; 00 04
    BRK $FE              ; 00 FE
    SBC $020001,X        ; FF 01 00 02
    TSB $02              ; 04 02
    BRK $FF              ; 00 FF
    BRK $01              ; 00 01
    TSB $04              ; 04 04
    BRK $02              ; 00 02
    SBC $0600FF,X        ; FF FF 00 06
    TSB $FE              ; 04 FE
    BRK $FF              ; 00 FF
    ORA $FF              ; 01 FF
    COP $04              ; 02 04
    COP $FE              ; 02 FE
    SBC $020101,X        ; FF 01 01 02
    TSB $02              ; 04 02
    COP $FF              ; 02 FF
    SBC $040601,X        ; FF 01 06 04
    INC $FF02,X          ; FE 02 FF
    SBC $0406FF,X        ; FF FF 06 04
    INC $FFFE,X          ; FE FE FF
    BRK $FF              ; 00 FF
    BRK $02              ; 00 02
    BRK $FC              ; 00 FC
    SBC $020001,X        ; FF 01 00 02
    COP $04              ; 02 04
    BRK $FF              ; 00 FF
    BRK $01              ; 00 01
    TSB $02              ; 04 02
    BRK $04              ; 00 04
    SBC $0600FF,X        ; FF FF 00 06
    COP $FC              ; 02 FC
    BRK $FF              ; 00 FF
    ORA $FF              ; 01 FF
    COP $02              ; 02 02
    TSB $FC              ; 04 FC
    SBC $020101,X        ; FF 01 01 02
    COP $04              ; 02 04
    TSB $FF              ; 04 FF
    SBC $020601,X        ; FF 01 06 02
    JSR ($FF04,X)        ; FC 04 FF
    SBC $0206FF,X        ; FF FF 06 02
    JSR ($FFFC,X)        ; FC FC FF
    BRK $FF              ; 00 FF
    BRK $01              ; 00 01
    BRK $F8              ; 00 F8
    SBC $020001,X        ; FF 01 00 02
    ORA $08              ; 01 08
    BRK $FF              ; 00 FF
    BRK $01              ; 00 01
    TSB $01              ; 04 01
    BRK $08              ; 00 08
    SBC $0600FF,X        ; FF FF 00 06
    ORA $F8              ; 01 F8
    BRK $FF              ; 00 FF
    ORA $FF              ; 01 FF
    COP $01              ; 02 01
    PHP                  ; 08
    SED                  ; F8
    SBC $020101,X        ; FF 01 01 02
    ORA $08              ; 01 08
    PHP                  ; 08
    SBC $0601FF,X        ; FF FF 01 06
    ORA $F8              ; 01 F8
    PHP                  ; 08
    SBC $06FFFF,X        ; FF FF FF 06
    ORA $F8              ; 01 F8
    SED                  ; F8
    SBC $00FE00,X        ; FF 00 FE 00
    ORA $00              ; 01 00
    SBC $000100,X        ; FF 00 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000100,X        ; FF 00 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000100,X        ; FF 00 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000100,X        ; FF 00 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000100,X        ; FF 00 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000100,X        ; FF 00 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000100,X        ; FF 00 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000100,X        ; FF 00 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000100,X        ; FF 00 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000100,X        ; FF 00 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000100,X        ; FF 00 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000100,X        ; FF 00 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000100,X        ; FF 00 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000100,X        ; FF 00 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000100,X        ; FF 00 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000100,X        ; FF 00 01 00
    BRK $FF              ; 00 FF
    COP $00              ; 02 00
    BRK $01              ; 00 01
    ORA $00              ; 01 00
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    ORA $00              ; 01 00
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    ORA $00              ; 01 00
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    ORA $00              ; 01 00
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    ORA $00              ; 01 00
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    ORA $00              ; 01 00
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    ORA $00              ; 01 00
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    ORA $00              ; 01 00
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    ORA $00              ; 01 00
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    ORA $00              ; 01 00
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    ORA $00              ; 01 00
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    ORA $00              ; 01 00
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    ORA $00              ; 01 00
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    ORA $00              ; 01 00
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    ORA $00              ; 01 00
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    ORA $00              ; 01 00
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    SBC $000200,X        ; FF 00 02 00
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    BRK $FF              ; 00 FF
    INC $0000,X          ; FE 00 00
    ORA $FF              ; 01 FF
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $FF              ; 01 FF
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $FF              ; 01 FF
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $FF              ; 01 FF
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $FF              ; 01 FF
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $FF              ; 01 FF
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $FF              ; 01 FF
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $FF              ; 01 FF
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $FF              ; 01 FF
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $FF              ; 01 FF
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $FF              ; 01 FF
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $FF              ; 01 FF
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $FF              ; 01 FF
    BRK $00              ; 00 00
    ORA $00              ; 01 00

;==============================================================================
; GeneralPurpose_0B
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_0B:
    BRK $00              ; 00 00 | Software interrupt
    ORA $FF              ; 01 FF | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $FF              ; 01 FF | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $FF              ; 01 FF | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $FF              ; 00 FF | Software interrupt
    BRK $FE              ; 00 FE | Software interrupt
    BRK $10              ; 00 10 | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    SBC $020002,X        ; FF 02 00 02 | Unknown operation
    BPL $0B27            ; 10 01 | Unknown operation
    BRK $FF              ; 00 FF | Software interrupt
    BRK $02              ; 00 02 | Software interrupt
    TSB $10              ; 04 10 | Unknown operation
    BRK $01              ; 00 01 | Software interrupt
    SBC $0600FE,X        ; FF FE 00 06 | Unknown operation
    BPL $0B33            ; 10 FF | Unknown operation
    BRK $FF              ; 00 FF | Software interrupt
    COP $FE              ; 02 FE | Unknown operation
    COP $10              ; 02 10 | Unknown operation
    ORA $FF              ; 01 FF | Logical OR with accumulator
    SBC $020202,X        ; FF 02 02 02 | Unknown operation
    BPL $0B43            ; 10 01 | Unknown operation
    ORA $FF              ; 01 FF | Logical OR with accumulator
    INC $0602,X          ; FE 02 06 | Unknown operation
    BPL $0B48            ; 10 FF | Unknown operation
    ORA $FF              ; 01 FF | Logical OR with accumulator
    INC $06FE,X          ; FE FE 06 | Unknown operation
    BPL $0B4F            ; 10 FF | Unknown operation
    SBC $FE00FF,X        ; FF FF 00 FE | Unknown operation
    BRK $08              ; 00 08 | Software interrupt
    BRK $FE              ; 00 FE | Software interrupt
    SBC $020002,X        ; FF 02 00 02 | Unknown operation
    PHP                  ; 08 | Push processor status to stack
    COP $00              ; 02 00 | Unknown operation
    SBC $040200,X        ; FF 00 02 04 | Unknown operation
    PHP                  ; 08 | Push processor status to stack
    BRK $02              ; 00 02 | Software interrupt
    SBC $0600FE,X        ; FF FE 00 06 | Unknown operation
    PHP                  ; 08 | Push processor status to stack
    INC $FF00,X          ; FE 00 FF | Unknown operation
    COP $FE              ; 02 FE | Unknown operation

    COP $FE              ; 02 FE
    COP $08              ; 02 08
    COP $FE              ; 02 FE
    SBC $020202,X        ; FF 02 02 02
    PHP                  ; 08
    COP $02              ; 02 02
    SBC $0602FE,X        ; FF FE 02 06
    PHP                  ; 08
    INC $FF02,X          ; FE 02 FF
    INC $06FE,X          ; FE FE 06
    PHP                  ; 08
    INC $FFFE,X          ; FE FE FF
    BRK $FE              ; 00 FE
    BRK $04              ; 00 04
    BRK $FC              ; 00 FC
    SBC $000002,X        ; FF 02 00 00
    TSB $04              ; 04 04
    BRK $FF              ; 00 FF
    BRK $02              ; 00 02
    BRK $04              ; 00 04
    BRK $04              ; 00 04
    SBC $0000FE,X        ; FF FE 00 00
    TSB $FC              ; 04 FC
    BRK $FF              ; 00 FF
    COP $FE              ; 02 FE
    BRK $04              ; 00 04
    TSB $FC              ; 04 FC
    SBC $000202,X        ; FF 02 02 00
    TSB $04              ; 04 04
    TSB $FF              ; 04 FF
    INC $0002,X          ; FE 02 00
    TSB $FC              ; 04 FC
    TSB $FF              ; 04 FF
    INC $00FE,X          ; FE FE 00
    TSB $FC              ; 04 FC
    JSR ($02FF,X)        ; FC FF 02
    JSR ($1000,X)        ; FC 00 10
    ORA $FE              ; 01 FE
    SBC $000204,X        ; FF 04 02 00
    BPL $0BD0            ; 10 02
    ORA $FF              ; 01 FF
    INC $0004,X          ; FE 04 00
    BPL $0BD4            ; 10 FF
    COP $FF              ; 02 FF
    JSR ($00FE,X)        ; FC FE 00
    BPL $0BDA            ; 10 FE
    SBC $FE04FF,X        ; FF FF 04 FE
    BRK $10              ; 00 10
    COP $FF              ; 02 FF
    SBC $000402,X        ; FF 02 04 00
    BPL $0BEB            ; 10 01
    COP $FF              ; 02 FF
    JSR ($0002,X)        ; FC 02 00
    BPL $0BEF            ; 10 FE
    ORA $FF              ; 01 FF
    INC $00FC,X          ; FE FC 00
    BPL $0BF7            ; 10 FF
    INC $00FF,X          ; FE FF 00
    JSR ($1000,X)        ; FC 00 10
    BRK $FE              ; 00 FE

;==============================================================================
; GeneralPurpose_0C
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_0C:
    SBC $010004,X        ; FF 04 00 01 | Unknown operation
    BPL $0C08            ; 10 02 | Unknown operation
    BRK $FF              ; 00 FF | Software interrupt
    BRK $04              ; 00 04 | Software interrupt
    COP $10              ; 02 10 | Unknown operation
    BRK $02              ; 00 02 | Software interrupt
    SBC $0300FC,X        ; FF FC 00 03 | Unknown operation
    BPL $0C12            ; 10 FE | Unknown operation
    BRK $FF              ; 00 FF | Software interrupt
    TSB $FC              ; 04 FC | Unknown operation
    BRK $10              ; 00 10 | Software interrupt
    COP $FE              ; 02 FE | Unknown operation
    SBC $010404,X        ; FF 04 04 01 | Unknown operation
    BPL $0C24            ; 10 02 | Unknown operation
    COP $FF              ; 02 FF | Unknown operation
    JSR ($0204,X)        ; FC 04 02 | Call local function
    BPL $0C27            ; 10 FE | Unknown operation
    COP $FF              ; 02 FF | Unknown operation
    JSR ($03FC,X)        ; FC FC 03 | Call local function
    BPL $0C2E            ; 10 FE | Unknown operation
    INC $00FF,X          ; FE FF 00 | Unknown operation
    ASL $1C00            ; 0E 00 1C | Arithmetic shift left
    BRK $04              ; 00 04 | Software interrupt
    SBC $00F200,X        ; FF 00 F2 00 | Unknown operation
    TRB $FC00            ; 1C 00 FC | Unknown operation
    SBC $001000,X        ; FF 00 10 00 | Unknown operation
    JSR $0400            ; 20 00 04 | Call local function
    SBC $02FF02,X        ; FF 02 FF 02 | Unknown operation
    ORA $00              ; 03 00 | Logical OR with accumulator
    ORA $03              ; 01 03 | Logical OR with accumulator
    ORA $00              ; 01 00 | Logical OR with accumulator
    SBC $0202,X          ; FD 02 02 | Unknown operation
    ORA $FD              ; 01 FD | Logical OR with accumulator
    COP $01              ; 02 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    COP $01              ; 02 01 | Unknown operation
    ORA $FD              ; 01 FD | Logical OR with accumulator
    COP $04              ; 02 04 | Unknown operation
    ORA $FE              ; 01 FE | Logical OR with accumulator
    ORA $01              ; 03 01 | Logical OR with accumulator
    ORA $01              ; 01 01 | Logical OR with accumulator
    COP $04              ; 02 04 | Unknown operation
    COP $02              ; 02 02 | Unknown operation
    ORA $03              ; 03 03 | Logical OR with accumulator
    BRK $01              ; 00 01 | Software interrupt
    COP $01              ; 02 01 | Unknown operation
    BRK $FD              ; 00 FD | Software interrupt
    SBC $0601FE,X        ; FF FE 01 06 | Unknown operation
    ORA $00              ; 03 00 | Logical OR with accumulator

    ORA $00              ; 03 00
    ORA $07              ; 01 07
    ORA $00              ; 01 00
    SBC $0306,X          ; FD 06 03
    SBC $0306FD,X        ; FF FD 06 03
    SBC $0107FE,X        ; FF FE 07 01
    SBC $0906FF,X        ; FF FF 06 09
    SBC $030602,X        ; FF 02 06 03
    BRK $02              ; 00 02
    ORA $03              ; 07 03
    BRK $01              ; 00 01
    ASL $01              ; 06 01
    BRK $FD              ; 00 FD
    SBC $06FFFE,X        ; FF FE FF 06
    ORA $00              ; 03 00
    ORA $07              ; 01 07
    ORA $00              ; 01 00
    SBC $0206,X          ; FD 06 02
    SBC $0106FD,X        ; FF FD 06 01
    BRK $00              ; 00 00
    ASL $01              ; 06 01
    SBC $0406FD,X        ; FF FD 06 04
    SBC $0107FE,X        ; FF FE 07 01
    SBC $040601,X        ; FF 01 06 04
    INC $0702,X          ; FE 02 07
    ORA $00              ; 03 00
    ORA $06              ; 01 06
    ORA $00              ; 01 00
    SBC $02FF,X          ; FD FF 02
    ORA $02              ; 01 02
    ORA $00              ; 03 00
    ORA $03              ; 01 03
    ORA $00              ; 01 00
    SBC $0302,X          ; FD 02 03
    ORA $FD              ; 01 FD
    COP $03              ; 02 03
    ORA $FE              ; 01 FE
    ORA $01              ; 03 01
    ORA $FF              ; 01 FF
    COP $09              ; 02 09
    ORA $02              ; 01 02
    COP $03              ; 02 03
    BRK $02              ; 00 02
    ORA $03              ; 03 03
    BRK $01              ; 00 01
    COP $01              ; 02 01
    BRK $FD              ; 00 FD
    SBC $00FF00,X        ; FF 00 FF 00
    TSB $00              ; 04 00
    SBC $0300,X          ; FD 00 03
    BRK $FE              ; 00 FE
    BRK $02              ; 00 02
    BRK $FF              ; 00 FF
    BRK $04              ; 00 04
    BRK $00              ; 00 00
    BRK $03              ; 00 03
    BRK $03              ; 00 03
    BRK $01              ; 00 01
    BRK $02              ; 00 02
    BRK $02              ; 00 02
    BRK $02              ; 00 02
    BRK $03              ; 00 03
    BRK $FF              ; 00 FF
    SBC $00FE00,X        ; FF 00 FE 00
    ASL $00              ; 06 00
    SBC $0300,X          ; FD 00 03
    BRK $FE              ; 00 FE
    BRK $02              ; 00 02
    BRK $FF              ; 00 FF
    BRK $04              ; 00 04
    BRK $00              ; 00 00
    BRK $02              ; 00 02
    BRK $03              ; 00 03
    BRK $02              ; 00 02
    BRK $02              ; 00 02
    BRK $02              ; 00 02
    BRK $01              ; 00 01
    BRK $02              ; 00 02
    BRK $FF              ; 00 FF
    SBC $000000,X        ; FF 00 00 00
    TSB $00              ; 04 00
    SBC $0300,X          ; FD 00 03
    BRK $FE              ; 00 FE
    BRK $02              ; 00 02
    BRK $FF              ; 00 FF
    BRK $04              ; 00 04
    BRK $00              ; 00 00
    BRK $03              ; 00 03
    BRK $03              ; 00 03
    BRK $03              ; 00 03
    BRK $02              ; 00 02
    BRK $03              ; 00 03
    BRK $02              ; 00 02
    BRK $02              ; 00 02
    BRK $01              ; 00 01
    BRK $03              ; 00 03
    BRK $FF              ; 00 FF
    SBC $000000,X        ; FF 00 00 00
    ORA $00              ; 03 00
    INC $0200,X          ; FE 00 02
    BRK $FF              ; 00 FF
    BRK $04              ; 00 04
    BRK $00              ; 00 00
    BRK $03              ; 00 03
    BRK $02              ; 00 02
    BRK $02              ; 00 02
    BRK $03              ; 00 03
    BRK $01              ; 00 01
    BRK $FE              ; 00 FE
    BRK $02              ; 00 02
    BRK $FF              ; 00 FF
    SBC $000000,X        ; FF 00 00 00
    TSB $00              ; 04 00
    SBC $0301,X          ; FD 01 03
    BRK $FE              ; 00 FE
    BRK $02              ; 00 02
    BRK $FF              ; 00 FF
    ORA $04              ; 01 04
    BRK $00              ; 00 00
    BRK $03              ; 00 03
    BRK $03              ; 00 03
    ORA $03              ; 01 03
    BRK $02              ; 00 02
    BRK $03              ; 00 03
    BRK $02              ; 00 02
    ORA $02              ; 01 02
    BRK $01              ; 00 01
    BRK $03              ; 00 03
    BRK $FF              ; 00 FF
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    SBC $000000,X        ; FF 00 00 00
    TSB $00              ; 04 00
    SBC $0300,X          ; FD 00 03
    BRK $FE              ; 00 FE
    BRK $02              ; 00 02
    BRK $FF              ; 00 FF
    ORA $05              ; 01 05
    BRK $00              ; 00 00
    ORA $03              ; 01 03
    BRK $03              ; 00 03
    BRK $03              ; 00 03
    BRK $02              ; 00 02
    BRK $03              ; 00 03
    BRK $01              ; 00 01
    ORA $02              ; 01 02
    BRK $01              ; 00 01
    SBC $020000,X        ; FF 00 00 02
    TSB $00              ; 04 00
    SBC $0302,X          ; FD 02 03
    BRK $FE              ; 00 FE
    COP $02              ; 02 02
    BRK $FF              ; 00 FF
    ORA $05              ; 03 05
    BRK $00              ; 00 00
    ORA $03              ; 03 03
    BRK $03              ; 00 03
    COP $03              ; 02 03
    BRK $02              ; 00 02
    COP $03              ; 02 03
    BRK $01              ; 00 01
    ORA $02              ; 03 02
    BRK $01              ; 00 01
    SBC $040000,X        ; FF 00 00 04
    TSB $00              ; 04 00
    SBC $0304,X          ; FD 04 03
    BRK $FE              ; 00 FE
    TSB $02              ; 04 02
    BRK $FF              ; 00 FF
    ORA $05              ; 05 05
    BRK $00              ; 00 00
    ORA $03              ; 05 03
    BRK $03              ; 00 03
    TSB $03              ; 04 03

;==============================================================================
; GeneralPurpose_0E
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_0E:
    BRK $02              ; 00 02 | Software interrupt
    TSB $03              ; 04 03 | Unknown operation
    BRK $01              ; 00 01 | Software interrupt
    ORA $02              ; 05 02 | Logical OR with accumulator
    BRK $01              ; 00 01 | Software interrupt
    SBC $060000,X        ; FF 00 00 06 | Unknown operation
    TSB $00              ; 04 00 | Unknown operation
    SBC $0306,X          ; FD 06 03 | Unknown operation
    BRK $FE              ; 00 FE | Software interrupt
    ASL $02              ; 06 02 | Arithmetic shift left
    BRK $FF              ; 00 FF | Software interrupt
    ORA $05              ; 07 05 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $03              ; 07 03 | Logical OR with accumulator
    BRK $03              ; 00 03 | Software interrupt
    ASL $03              ; 06 03 | Arithmetic shift left
    BRK $02              ; 00 02 | Software interrupt
    ASL $03              ; 06 03 | Arithmetic shift left
    BRK $01              ; 00 01 | Software interrupt
    ORA $02              ; 07 02 | Logical OR with accumulator
    BRK $01              ; 00 01 | Software interrupt
    SBC $000000,X        ; FF 00 00 00 | Unknown operation
    ORA $01              ; 01 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    SBC $000100,X        ; FF 00 01 00 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    ORA $00              ; 01 00 | Logical OR with accumulator
    ORA $FF              ; 01 FF | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $FF              ; 00 FF | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    COP $00              ; 02 00 | Unknown operation
    BRK $01              ; 00 01 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    INC $0000,X          ; FE 00 00 | Unknown operation
    ORA $00              ; 01 00 | Logical OR with accumulator
    SBC $000100,X        ; FF 00 01 00 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    ORA $01              ; 01 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    ORA $00              ; 01 00 | Logical OR with accumulator

    ORA $00              ; 01 00
    ORA $FF              ; 01 FF
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $0000FF,X        ; FF FF 00 00
    BRK $01              ; 00 01
    ORA $00              ; 03 00
    BRK $01              ; 00 01
    BRK $02              ; 00 02
    BRK $01              ; 00 01
    SBC $0000,X          ; FD 00 00
    ORA $00              ; 01 00
    INC $0100,X          ; FE 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    COP $00              ; 02 00
    BRK $01              ; 00 01
    BRK $02              ; 00 02
    BRK $01              ; 00 01
    INC $0000,X          ; FE 00 00
    ORA $00              ; 01 00
    INC $FDFF,X          ; FE FF FD
    SBC $000600          ; EF 00 06 00
    JSR ($0100,X)        ; FC 00 01
    SBC $0100FC,X        ; FF FC 00 01
    BRK $FC              ; 00 FC
    BRK $01              ; 00 01
    SBC $0100FC,X        ; FF FC 00 01
    BRK $FC              ; 00 FC
    BRK $01              ; 00 01
    SBC $0100FC,X        ; FF FC 00 01
    BRK $FC              ; 00 FC
    BRK $01              ; 00 01
    SBC $0100FC,X        ; FF FC 00 01
    BRK $FC              ; 00 FC
    BRK $01              ; 00 01
    SBC $0100FC,X        ; FF FC 00 01
    BRK $FC              ; 00 FC
    BRK $01              ; 00 01
    SBC $0100FC,X        ; FF FC 00 01
    BRK $FC              ; 00 FC
    BRK $01              ; 00 01
    SBC $0100FC,X        ; FF FC 00 01
    BRK $FC              ; 00 FC
    BRK $01              ; 00 01
    SBC $0100FC,X        ; FF FC 00 01
    BRK $FC              ; 00 FC
    BRK $01              ; 00 01
    SBC $0100FC,X        ; FF FC 00 01
    BRK $FC              ; 00 FC
    BRK $01              ; 00 01
    SBC $0100FC,X        ; FF FC 00 01
    BRK $FC              ; 00 FC
    BRK $06              ; 00 06
    SBC $0200FC,X        ; FF FC 00 02
    SBC $0100FC,X        ; FF FC 00 01
    PLX                  ; FA
    BRK $FF              ; 00 FF
    SBC $EE              ; F2 EE

;==============================================================================
; GeneralPurpose_0F
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_0F:
    BRK $01              ; 00 01 | Software interrupt
    BRK $FC              ; 00 FC | Software interrupt
    BRK $03              ; 00 03 | Software interrupt
    SBC $0600FC,X        ; FF FC 00 06 | Unknown operation
    INC $00FC,X          ; FE FC 00 | Unknown operation
    ORA $FD              ; 07 FD | Logical OR with accumulator
    JSR ($0F00,X)        ; FC 00 0F | Call local function
    JSR ($00FC,X)        ; FC FC 00 | Call local function
    TSB $FC              ; 04 FC | Unknown operation
    JSR ($08FF,X)        ; FC FF 08 | Call local function
    INC $0400            ; EE 00 04 | Unknown operation
    BRK $FC              ; 00 FC | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    ORA $FC              ; 01 FC | Logical OR with accumulator
    BRK $01              ; 00 01 | Software interrupt
    BRK $FC              ; 00 FC | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    ORA $FC              ; 01 FC | Logical OR with accumulator
    BRK $01              ; 00 01 | Software interrupt
    BRK $FC              ; 00 FC | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    ORA $FC              ; 01 FC | Logical OR with accumulator
    BRK $01              ; 00 01 | Software interrupt
    BRK $FC              ; 00 FC | Software interrupt
    BRK $08              ; 00 08 | Software interrupt
    ORA $FC              ; 01 FC | Logical OR with accumulator
    BRK $08              ; 00 08 | Software interrupt
    COP $FC              ; 02 FC | Unknown operation
    BRK $0A              ; 00 0A | Software interrupt
    ORA $FC              ; 03 FC | Logical OR with accumulator
    BRK $01              ; 00 01 | Software interrupt
    ORA $00              ; 07 00 | Logical OR with accumulator
    SBC $00F213,X        ; FF 13 F2 00 | Unknown operation
    COP $01              ; 02 01 | Unknown operation
    JSR ($0200,X)        ; FC 00 02 | Call local function
    COP $FC              ; 02 FC | Unknown operation
    BRK $06              ; 00 06 | Software interrupt
    ORA $FC              ; 03 FC | Logical OR with accumulator
    BRK $06              ; 00 06 | Software interrupt
    ORA $FD              ; 03 FD | Logical OR with accumulator
    BRK $06              ; 00 06 | Software interrupt
    TSB $FD              ; 04 FD | Unknown operation
    BRK $10              ; 00 10 | Software interrupt
    ORA $FE              ; 05 FE | Logical OR with accumulator
    BRK $01              ; 00 01 | Software interrupt
    ASL $FC              ; 06 FC | Arithmetic shift left
    SBC $040605,X        ; FF 05 06 04 | Unknown operation
    JSL $040101          ; 22 01 01 04 | Call external function
    ORA $00              ; 01 00 | Logical OR with accumulator

    ORA $00              ; 01 00
    ORA $04              ; 01 04
    ORA $01              ; 01 01
    ORA $04              ; 01 04
    ORA $00              ; 01 00
    ORA $04              ; 01 04
    ORA $01              ; 01 01
    ORA $04              ; 01 04
    ORA $00              ; 01 00
    ORA $04              ; 01 04
    ORA $01              ; 01 01
    ORA $04              ; 01 04
    ORA $00              ; 01 00
    ORA $04              ; 01 04
    ORA $01              ; 01 01
    ORA $04              ; 01 04
    ORA $00              ; 01 00
    ORA $04              ; 01 04
    ORA $01              ; 01 01
    ORA $04              ; 01 04
    ORA $00              ; 01 00
    ORA $04              ; 01 04
    ORA $01              ; 01 01
    ORA $04              ; 01 04
    PHP                  ; 08
    BRK $01              ; 00 01
    SBC $02F9FB,X        ; FF FB F9 02
    JSL $02FFFF          ; 22 FF FF 02
    ORA $00              ; 01 00
    SBC $FF0102,X        ; FF 02 01 FF
    SBC $000102,X        ; FF 02 01 00
    SBC $FF0102,X        ; FF 02 01 FF
    SBC $000102,X        ; FF 02 01 00
    SBC $FF0102,X        ; FF 02 01 FF
    SBC $000102,X        ; FF 02 01 00
    SBC $FF0102,X        ; FF 02 01 FF
    SBC $000102,X        ; FF 02 01 00
    SBC $FF0102,X        ; FF 02 01 FF
    SBC $000102,X        ; FF 02 01 00
    SBC $FF0102,X        ; FF 02 01 FF
    SBC $000802,X        ; FF 02 08 00
    SBC $0705FF,X        ; FF FF 05 07
    BRK $22              ; 00 22
    ORA $01              ; 01 01
    BRK $01              ; 00 01
    BRK $01              ; 00 01
    BRK $01              ; 00 01
    ORA $01              ; 01 01
    BRK $01              ; 00 01
    BRK $01              ; 00 01
    BRK $01              ; 00 01
    ORA $01              ; 01 01
    BRK $01              ; 00 01
    BRK $01              ; 00 01
    BRK $01              ; 00 01
    ORA $01              ; 01 01
    BRK $01              ; 00 01
    BRK $01              ; 00 01
    BRK $01              ; 00 01
    ORA $01              ; 01 01
    BRK $01              ; 00 01
    BRK $01              ; 00 01
    BRK $01              ; 00 01
    ORA $01              ; 01 01
    BRK $01              ; 00 01
    BRK $01              ; 00 01
    BRK $01              ; 00 01
    ORA $01              ; 01 01
    BRK $10              ; 00 10
    BRK $01              ; 00 01
    SBC $00F8FB,X        ; FF FB F8 00
    JSL $00FFFF          ; 22 FF FF 00
    ORA $00              ; 01 00
    SBC $FF0100,X        ; FF 00 01 FF
    SBC $000100,X        ; FF 00 01 00
    SBC $FF0100,X        ; FF 00 01 FF
    SBC $000100,X        ; FF 00 01 00
    SBC $FF0100,X        ; FF 00 01 FF
    SBC $000100,X        ; FF 00 01 00
    SBC $FF0100,X        ; FF 00 01 FF
    SBC $000100,X        ; FF 00 01 00
    SBC $FF0100,X        ; FF 00 01 FF
    SBC $000100,X        ; FF 00 01 00
    SBC $FF0100,X        ; FF 00 01 FF
    SBC $001000,X        ; FF 00 10 00
    SBC $F400FF,X        ; FF FF 00 F4
    BRK $5A              ; 00 5A
    BRK $FF              ; 00 FF
    SBC $000000,X        ; FF 00 00 00
    COP $00              ; 02 00
    BRK $FF              ; 00 FF
    BRK $F6              ; 00 F6
    BRK $06              ; 00 06
    BRK $FF              ; 00 FF
    ORA $0A              ; 03 0A
    BRK $FE              ; 00 FE
    BRK $0A              ; 00 0A
    BRK $FD              ; 00 FD
    ORA $06              ; 05 06
    BRK $FC              ; 00 FC
    SBC $000A00,X        ; FF 00 0A 00
    ASL $00              ; 06 00
    ORA $03              ; 01 03
    ASL                  ; 0A
    BRK $02              ; 00 02
    BRK $0A              ; 00 0A
    BRK $03              ; 00 03
    ORA $06              ; 05 06
    BRK $04              ; 00 04
    SBC $00FC0B,X        ; FF 0B FC 00
    TSB $01              ; 04 01
    SBC $020A02,X        ; FF 02 0A 02
    SBC $030807,X        ; FF 07 08 03
    SBC $040A03,X        ; FF 03 0A 04
    SBC $040BFF,X        ; FF FF 0B 04
    BRK $04              ; 00 04
    ORA $01              ; 01 01
    COP $0A              ; 02 0A
    COP $01              ; 02 01
    ORA $08              ; 07 08
    ORA $01              ; 03 01
    ORA $0A              ; 03 0A
    TSB $01              ; 04 01
    SBC $00FCF5,X        ; FF F5 FC 00
    TSB $FF              ; 04 FF
    SBC $FE0A02,X        ; FF 02 0A FE
    SBC $FD0807,X        ; FF 07 08 FD
    SBC $FC0A03,X        ; FF 03 0A FC
    SBC $04F5FF,X        ; FF FF F5 04
    BRK $04              ; 00 04
    SBC $0A0201,X        ; FF 01 02 0A
    INC $0701,X          ; FE 01 07
    PHP                  ; 08
    SBC $0301,X          ; FD 01 03
    ASL                  ; 0A
    JSR ($FF01,X)        ; FC 01 FF
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    BRK $01              ; 00 01
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $02              ; 00 02
    BRK $FD              ; 00 FD
    BRK $01              ; 00 01
    BRK $FE              ; 00 FE
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    BRK $01              ; 00 01
    BRK $02              ; 00 02
    BRK $03              ; 00 03
    SBC $000000,X        ; FF 00 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    ORA $00              ; 01 00
    SBC $0000FF,X        ; FF FF 00 00
    ORA $FF              ; 01 FF
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $FF              ; 00 FF
    SBC $0100FF,X        ; FF FF 00 01
    BRK $FF              ; 00 FF
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    BRK $FF              ; 00 FF
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    BRK $FF              ; 00 FF
    BRK $01              ; 00 01
    SBC $01FF00,X        ; FF 00 FF 01
    BRK $00              ; 00 00
    ORA $01              ; 03 01
    JSR ($0300,X)        ; FC 00 03
    ORA $FF              ; 01 FF
    BRK $03              ; 00 03
    ORA $01              ; 01 01
    BRK $03              ; 00 03
    ORA $02              ; 01 02
    BRK $03              ; 00 03
    ORA $03              ; 01 03
    SBC $00FD0D,X        ; FF 0D FD 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    ORA $00              ; 01 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    ORA $00              ; 01 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    ORA $00              ; 01 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    ORA $00              ; 01 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    ORA $00              ; 01 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    ORA $00              ; 01 00

;==============================================================================
; GeneralPurpose_12
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_12:
    ORA $01              ; 01 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $01              ; 01 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $01              ; 01 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $01              ; 01 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $01              ; 01 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $01              ; 01 01 | Logical OR with accumulator
    ORA $00              ; 01 00 | Logical OR with accumulator
    ORA $01              ; 01 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $01              ; 01 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $01              ; 01 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $01              ; 01 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    ORA $00              ; 01 00 | Logical OR with accumulator
    ORA $01              ; 01 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $01              ; 01 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $01              ; 01 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $01              ; 01 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $01              ; 01 01 | Logical OR with accumulator
    ORA $00              ; 01 00 | Logical OR with accumulator
    ORA $01              ; 01 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $01              ; 01 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $01              ; 01 01 | Logical OR with accumulator
    ORA $00              ; 01 00 | Logical OR with accumulator
    ORA $01              ; 01 01 | Logical OR with accumulator

    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    ORA $00              ; 01 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    ORA $00              ; 01 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    ORA $00              ; 01 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    ORA $00              ; 01 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    ORA $00              ; 01 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    ORA $00              ; 01 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    ORA $00              ; 01 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    ORA $00              ; 01 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    ORA $00              ; 01 00

;==============================================================================
; GeneralPurpose_13
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_13:
    ORA $01              ; 01 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $01              ; 01 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $01              ; 01 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $01              ; 01 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $01              ; 01 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    ORA $00              ; 01 00 | Logical OR with accumulator
    ORA $01              ; 01 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $01              ; 01 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $01              ; 01 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    SBC $010100,X        ; FF 00 01 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $01              ; 01 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $01              ; 01 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $01              ; 01 01 | Logical OR with accumulator
    SBC $010100,X        ; FF 00 01 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $01              ; 01 01 | Logical OR with accumulator
    SBC $000100,X        ; FF 00 01 00 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    ORA $01              ; 01 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    SBC $010100,X        ; FF 00 01 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    SBC $010100,X        ; FF 00 01 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    SBC $010100,X        ; FF 00 01 01 | Unknown operation

    SBC $010100,X        ; FF 00 01 01
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $010100,X        ; FF 00 01 01
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000100,X        ; FF 00 01 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    SBC $000100,X        ; FF 00 01 00
    SBC $000100,X        ; FF 00 01 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    SBC $000100,X        ; FF 00 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $010100,X        ; FF 00 01 01
    SBC $000100,X        ; FF 00 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000100,X        ; FF 00 01 00
    SBC $010100,X        ; FF 00 01 01
    SBC $000100,X        ; FF 00 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000100,X        ; FF 00 01 00
    SBC $000100,X        ; FF 00 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000100,X        ; FF 00 01 00
    SBC $010100,X        ; FF 00 01 01
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000100,X        ; FF 00 01 00
    SBC $000100,X        ; FF 00 01 00
    SBC $000100,X        ; FF 00 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000100,X        ; FF 00 01 00
    SBC $FF0100,X        ; FF 00 01 FF
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000100,X        ; FF 00 01 00
    SBC $000100,X        ; FF 00 01 00
    SBC $000100,X        ; FF 00 01 00
    SBC $000100,X        ; FF 00 01 00
    SBC $000100,X        ; FF 00 01 00
    SBC $FF0100,X        ; FF 00 01 FF
    SBC $000100,X        ; FF 00 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000100,X        ; FF 00 01 00
    SBC $FF0100,X        ; FF 00 01 FF
    SBC $000100,X        ; FF 00 01 00
    SBC $000100,X        ; FF 00 01 00
    SBC $FF0100,X        ; FF 00 01 FF
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000100,X        ; FF 00 01 00
    SBC $FF0100,X        ; FF 00 01 FF
    SBC $000100,X        ; FF 00 01 00
    SBC $000100,X        ; FF 00 01 00
    SBC $FF0100,X        ; FF 00 01 FF
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000100,X        ; FF 00 01 00
    SBC $FF0100,X        ; FF 00 01 FF
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000100,X        ; FF 00 01 00
    SBC $FF0100,X        ; FF 00 01 FF
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000100,X        ; FF 00 01 00
    SBC $01F5FF,X        ; FF FF F5 01
    BRK $30              ; 00 30
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    SBC $010000,X        ; FF 00 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    SBC $010000,X        ; FF 00 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    SBC $010000,X        ; FF 00 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    SBC $010000,X        ; FF 00 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    SBC $010000,X        ; FF 00 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    SBC $010000,X        ; FF 00 00 01
    BRK $01              ; 00 01
    BRK $01              ; 00 01
    SBC $010000,X        ; FF 00 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    SBC $010000,X        ; FF 00 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    SBC $010000,X        ; FF 00 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    SBC $010000,X        ; FF 00 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    SBC $010000,X        ; FF 00 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    BRK $01              ; 00 01
    BRK $01              ; 00 01
    SBC $010000,X        ; FF 00 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    SBC $010000,X        ; FF 00 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    SBC $010000,X        ; FF 00 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    SBC $010000,X        ; FF 00 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    SBC $010000,X        ; FF 00 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    SBC $010000,X        ; FF 00 00 01
    BRK $01              ; 00 01
    BRK $01              ; 00 01
    SBC $010000,X        ; FF 00 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01

;==============================================================================
; GeneralPurpose_15
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_15:
    SBC $010000,X        ; FF 00 00 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    SBC $010000,X        ; FF 00 00 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    SBC $010000,X        ; FF 00 00 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    SBC $010000,X        ; FF 00 00 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    SBC $010001,X        ; FF 01 00 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    SBC $010000,X        ; FF 00 00 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    SBC $010000,X        ; FF 00 00 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    SBC $010000,X        ; FF 00 00 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    SBC $010000,X        ; FF 00 00 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    SBC $010000,X        ; FF 00 00 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    SBC $010001,X        ; FF 01 00 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    SBC $010000,X        ; FF 00 00 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    SBC $010000,X        ; FF 00 00 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    SBC $010000,X        ; FF 00 00 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt

    BRK $00              ; 00 00
    BRK $01              ; 00 01
    SBC $010000,X        ; FF 00 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    SBC $010000,X        ; FF 00 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    SBC $010001,X        ; FF 01 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    SBC $010000,X        ; FF 00 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    SBC $010000,X        ; FF 00 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    SBC $010000,X        ; FF 00 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    SBC $010000,X        ; FF 00 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    SBC $010000,X        ; FF 00 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    SBC $010000,X        ; FF 00 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    SBC $010001,X        ; FF 01 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    SBC $010000,X        ; FF 00 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    SBC $010000,X        ; FF 00 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    SBC $010000,X        ; FF 00 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    SBC $010000,X        ; FF 00 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    SBC $010000,X        ; FF 00 00 01

;==============================================================================
; GeneralPurpose_16
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_16:
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    SBC $010000,X        ; FF 00 00 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    SBC $010001,X        ; FF 01 00 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    SBC $010000,X        ; FF 00 00 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    SBC $010000,X        ; FF 00 00 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    SBC $010000,X        ; FF 00 00 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    SBC $010000,X        ; FF 00 00 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    SBC $010000,X        ; FF 00 00 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    SBC $010000,X        ; FF 00 00 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    SBC $010000,X        ; FF 00 00 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    SBC $010000,X        ; FF 00 00 01 | Unknown operation
    BRK $01              ; 00 01 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    SBC $010000,X        ; FF 00 00 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    SBC $010000,X        ; FF 00 00 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    SBC $010000,X        ; FF 00 00 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt

    BRK $01              ; 00 01
    SBC $010000,X        ; FF 00 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    SBC $010000,X        ; FF 00 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    SBC $010000,X        ; FF 00 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    SBC $010000,X        ; FF 00 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    SBC $010000,X        ; FF 00 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    SBC $010000,X        ; FF 00 00 01
    BRK $01              ; 00 01
    BRK $01              ; 00 01
    SBC $010000,X        ; FF 00 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    SBC $010000,X        ; FF 00 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    SBC $010000,X        ; FF 00 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    SBC $010000,X        ; FF 00 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    SBC $010000,X        ; FF 00 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    SBC $010000,X        ; FF 00 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    SBC $010000,X        ; FF 00 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    SBC $010000,X        ; FF 00 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    SBC $010000,X        ; FF 00 00 01

;==============================================================================
; GeneralPurpose_17
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_17:
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    SBC $010000,X        ; FF 00 00 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    SBC $010000,X        ; FF 00 00 01 | Unknown operation
    BRK $01              ; 00 01 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    SBC $010000,X        ; FF 00 00 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    SBC $010000,X        ; FF 00 00 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    SBC $010000,X        ; FF 00 00 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    SBC $010000,X        ; FF 00 00 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    SBC $010000,X        ; FF 00 00 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    SBC $010000,X        ; FF 00 00 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    SBC $010000,X        ; FF 00 00 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    SBC $010000,X        ; FF 00 00 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    SBC $010000,X        ; FF 00 00 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    SBC $010000,X        ; FF 00 00 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    SBC $010000,X        ; FF 00 00 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $01              ; 00 01 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt

    BRK $01              ; 00 01
    ORA $00              ; 01 00
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    ORA $00              ; 01 00
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    ORA $00              ; 01 00
    SBC $00FF05,X        ; FF 05 FF 00
    ORA $01              ; 01 01
    SBC $000100,X        ; FF 00 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000100,X        ; FF 00 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000100,X        ; FF 00 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000100,X        ; FF 00 01 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000100,X        ; FF 00 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    SBC $000100,X        ; FF 00 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000100,X        ; FF 00 01 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000100,X        ; FF 00 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    SBC $000100,X        ; FF 00 01 00

;==============================================================================
; GeneralPurpose_18
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_18:
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    SBC $010100,X        ; FF 00 01 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    SBC $000100,X        ; FF 00 01 00 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    ORA $01              ; 01 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    SBC $000100,X        ; FF 00 01 00 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    ORA $01              ; 01 01 | Logical OR with accumulator
    SBC $000100,X        ; FF 00 01 00 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    SBC $010100,X        ; FF 00 01 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    SBC $010100,X        ; FF 00 01 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    SBC $010100,X        ; FF 00 01 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    SBC $000100,X        ; FF 00 01 00 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    ORA $01              ; 01 01 | Logical OR with accumulator
    SBC $000100,X        ; FF 00 01 00 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    ORA $01              ; 01 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    SBC $000100,X        ; FF 00 01 00 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    ORA $01              ; 01 01 | Logical OR with accumulator
    SBC $000100,X        ; FF 00 01 00 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    ORA $01              ; 01 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    SBC $010100,X        ; FF 00 01 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt

    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $000100,X        ; FF 00 01 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    SBC $000100,X        ; FF 00 01 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    SBC $010100,X        ; FF 00 01 01
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01

;==============================================================================
; GeneralPurpose_19
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_19:
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    ORA $00              ; 01 00 | Logical OR with accumulator
    ORA $01              ; 01 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    ORA $00              ; 01 00 | Logical OR with accumulator
    ORA $01              ; 01 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $01              ; 01 01 | Logical OR with accumulator
    ORA $00              ; 01 00 | Logical OR with accumulator
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $01              ; 01 01 | Logical OR with accumulator
    ORA $00              ; 01 00 | Logical OR with accumulator
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $01              ; 01 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    ORA $00              ; 01 00 | Logical OR with accumulator
    ORA $01              ; 01 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    ORA $00              ; 01 00 | Logical OR with accumulator
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $01              ; 01 01 | Logical OR with accumulator
    ORA $00              ; 01 00 | Logical OR with accumulator
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $01              ; 01 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    ORA $00              ; 01 00 | Logical OR with accumulator
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $01              ; 01 01 | Logical OR with accumulator
    ORA $00              ; 01 00 | Logical OR with accumulator
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $01              ; 01 01 | Logical OR with accumulator
    ORA $00              ; 01 00 | Logical OR with accumulator
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt

    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $FF              ; 01 FF
    BRK $00              ; 00 00
    ORA $00              ; 01 00

;==============================================================================
; GeneralPurpose_1A
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_1A:
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $FF              ; 01 FF | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $FF              ; 01 FF | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $FF              ; 01 FF | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $FF              ; 01 FF | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $FF              ; 01 FF | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $FF              ; 01 FF | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $FF              ; 01 FF | Logical OR with accumulator
    BRK $FF              ; 00 FF | Software interrupt
    COP $FD              ; 02 FD | Unknown operation
    BRK $01              ; 00 01 | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $01              ; 00 01 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $01              ; 00 01 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    ORA $FF              ; 01 FF | Logical OR with accumulator
    BRK $01              ; 00 01 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt

    BRK $01              ; 00 01
    ORA $00              ; 01 00
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    ORA $00              ; 01 00
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    ORA $FF              ; 01 FF
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    ORA $00              ; 01 00
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    BRK $FF              ; 00 FF
    BRK $01              ; 00 01
    ORA $00              ; 01 00
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    ORA $FF              ; 01 FF
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    ORA $FF              ; 01 FF
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    ORA $FF              ; 01 FF
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    BRK $FF              ; 00 FF
    BRK $01              ; 00 01
    ORA $00              ; 01 00
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    BRK $FF              ; 00 FF
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    ORA $FF              ; 01 FF
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    BRK $FF              ; 00 FF
    BRK $01              ; 00 01
;==============================================================================
; Function Index (14 functions)
;==============================================================================
; GeneralPurpose_00
; GeneralPurpose_01
; GeneralPurpose_0B
; GeneralPurpose_0C
; GeneralPurpose_0E
; GeneralPurpose_0F
; GeneralPurpose_12
; GeneralPurpose_13
; GeneralPurpose_15
; GeneralPurpose_16
; GeneralPurpose_17
; GeneralPurpose_18
; GeneralPurpose_19
; GeneralPurpose_1A
;==============================================================================