;==============================================================================
; Dragon Quest III - Bank $1E
; Type: Dma
; Purpose: DMA operations and data transfer
; Address Range: $CF0000-$CF7FFF
; Instructions: 7885
; Bytes: 32768
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_1E"

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_000
; Address: $CF8000
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_000:
    RTI                  ; 40 | Return from interrupt
    BEQ $0B              ; F0 0B | Branch if equal
    ORA ($85,X)          ; 01 85 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    STA $1A              ; 85 1A | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_001
; Address: $CF800C
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_001:
    JSR $8071            ; 20 71 80 | Jump to subroutine
    PLX                  ; FA | Pull X register from stack
    INX                  ; E8 | Increment X register
    CPX #$10             ; E0 10 | Compare X register (immediate)
    BCC $DC              ; 90 DC | Branch if carry clear
    PLY                  ; 7A | Pull Y register from stack
    INY                  ; C8 | Increment Y register
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    BCC $D1              ; 90 D1 | Branch if carry clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_002
; Address: $CF801E
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_002:
    LDY #$00             ; A0 00 | Load immediate value into Y register
    PHY                  ; 5A | Push Y register to stack
    LDX #$00             ; A2 00 | Load immediate value into X register
    PHX                  ; DA | Push X register to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF 51 80 C7 | Load from absolute long,X into accumulator
    AND $3660,Y          ; 39 60 36 | Logical AND with accumulator (absolute,Y)
    BEQ $0B              ; F0 0B | Branch if equal
    ORA ($85,X)          ; 01 85 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    STA $1A              ; 85 1A | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_003
; Address: $CF803F
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_003:
    JSR $8071            ; 20 71 80 | Jump to subroutine
    PLX                  ; FA | Pull X register from stack
    INX                  ; E8 | Increment X register
    CPX #$10             ; E0 10 | Compare X register (immediate)
    BCC $DC              ; 90 DC | Branch if carry clear
    PLY                  ; 7A | Pull Y register from stack
    INY                  ; C8 | Increment Y register
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    BCC $D1              ; 90 D1 | Branch if carry clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_004
; Address: $CF8051
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_004:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_005
; Address: $CF805B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_005:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_006
; Address: $CF806C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_006:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    BRA $A5              ; 80 A5 | Branch always
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_008
; Address: $CF8078
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_008:
    JSR $8098            ; 20 98 80 | Jump to subroutine
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    LDX #$01             ; A2 01 | Load immediate value into X register
    LDY $AD57            ; AC 57 AD | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_00A
; Address: $CF8089
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_00A:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLC                  ; 18 | Clear carry flag
    ADC #$40             ; 69 40 | Add with carry (immediate)
    JMP ($7FE3)          ; 6C E3 7F | Jump to address (absolute indirect)
    STA $967C            ; 8D 7C 96 | Store accumulator to absolute address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_00B
; Address: $CF8098
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_00B:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ADC #$30             ; 69 30 | Add with carry (immediate)
    STA $967E            ; 8D 7E 96 | Store accumulator to absolute address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_00C
; Address: $CF80A6
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_00C:
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    STA $AD61            ; 8D 61 AD | Store accumulator to absolute address
    STA $AD5F            ; 8D 5F AD | Store accumulator to absolute address
    LDX $99F7            ; AE F7 99 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_00D
; Address: $CF80B2
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_00D:
    JSL $C90572          ; 22 72 05 C9 | Jump to subroutine long
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    LDX $C8              ; A6 C8 | Load from zero page into X register
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $3C              ; F0 3C | Branch if equal
    LDA $99F9            ; AD F9 99 | Load from absolute address into accumulator
    CMP $AD55            ; CD 55 AD | Compare accumulator (absolute)
    BEQ $35              ; F0 35 | Branch if equal
    LDA $99FF            ; AD FF 99 | Load from absolute address into accumulator
    BNE $08              ; D0 08 | Branch if not equal
    LDA $3504            ; AD 04 35 | Load from absolute address into accumulator
    CMP $AD55            ; CD 55 AD | Compare accumulator (absolute)
    BEQ $38              ; F0 38 | Branch if equal
    LDX $99F7            ; AE F7 99 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_00E
; Address: $CF80DE
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_00E:
    JSL $C90572          ; 22 72 05 C9 | Jump to subroutine long
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    LDX $C8              ; A6 C8 | Load from zero page into X register
    TAX                  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_00F
; Address: $CF80EE
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_00F:
    JSL $C90572          ; 22 72 05 C9 | Jump to subroutine long
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    INY                  ; C8 | Increment Y register
    CMP $AD55            ; CD 55 AD | Compare accumulator (absolute)
    BEQ $1E              ; F0 1E | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_010
; Address: $CF8103
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_010:
    LDY $DAA5            ; AC A5 DA | Load from absolute address into Y register
    LDA $C725,Y          ; B9 25 C7 | Load from absolute,Y into accumulator
    STA $00              ; 85 00 | Store accumulator to zero page
    LDA $C765,Y          ; B9 65 C7 | Load from absolute,Y into accumulator
    STA $04              ; 85 04 | Store accumulator to zero page
    JMP $8142            ; 4C 42 81 | Jump to address
    LDA $3506            ; AD 06 35 | Load from absolute address into accumulator
    STA $00              ; 85 00 | Store accumulator to zero page
    LDA $3508            ; AD 08 35 | Load from absolute address into accumulator
    STA $04              ; 85 04 | Store accumulator to zero page
    JMP $8142            ; 4C 42 81 | Jump to address

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_011
; Address: $CF8120
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_011:
    JSL $C90572          ; 22 72 05 C9 | Jump to subroutine long
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    INY                  ; C8 | Increment Y register
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA $00              ; 85 00 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_012
; Address: $CF8131
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_012:
    JSL $C90572          ; 22 72 05 C9 | Jump to subroutine long
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    INY                  ; C8 | Increment Y register
    SED                  ; F8 | Set decimal mode flag
    STA $04              ; 85 04 | Store accumulator to zero page
    STZ $AD61            ; 9C 61 AD | Store zero to absolute
    LDA $00              ; A5 00 | Load from zero page into accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    CLC                  ; 18 | Clear carry flag
    ADC #$40             ; 69 40 | Add with carry (immediate)
    STA $00              ; 85 00 | Store accumulator to zero page
    LDA $04              ; A5 04 | Load from zero page into accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    CLC                  ; 18 | Clear carry flag
    ADC #$30             ; 69 30 | Add with carry (immediate)
    ROR $7FE3,X          ; 7E E3 7F | Rotate right (absolute,X)
    STA $04              ; 85 04 | Store accumulator to zero page
    LDA #$65             ; A9 65 | Load immediate value into accumulator
    ORA ($8D,X)          ; 01 8D | Logical OR with accumulator ((zero page,X))
    EOR $42              ; 45 42 | Hardware register operation
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    BMI $8D              ; 30 8D | Branch if negative
    EOR ($42,X)          ; 41 42 | Hardware register operation
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    STA $4243            ; 8D 43 42 | Hardware register operation
    LDA #$0C             ; A9 0C | Load immediate value into accumulator
    LDX $00              ; A6 00 | Load from zero page into X register
    LDY $04              ; A4 04 | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_013
; Address: $CF817A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_013:
    JSL $C79C43          ; 22 43 9C C7 | Jump to subroutine long
    STA $AD5F            ; 8D 5F AD | Store accumulator to absolute address
    TAX                  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_017
; Address: $CF818A
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_017:
    JSL $C024A7          ; 22 A7 24 C0 | Jump to subroutine long
    LDA $7F70            ; AD 70 7F | Load from absolute address into accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $D0              ; 10 D0 | Branch if positive
    ASL $AD              ; 06 AD | Arithmetic shift left (zero page)
    BVS $7F              ; 70 7F | Branch if overflow set
    BEQ $EB              ; F0 EB | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_018
; Address: $CF819C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_018:
    LDX $AD5F            ; AE 5F AD | Load from absolute address into X register
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BEQ $F7              ; F0 F7 | Branch if equal
    LDA $4332,X          ; BD 32 43 | Load from absolute,X into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $05              ; D0 05 | Branch if not equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_01A
; Address: $CF81B1
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_01A:
    JSL $C79F6B          ; 22 6B 9F C7 | Jump to subroutine long
    BRA $CF              ; 80 CF | Branch always
    LDA #$0A             ; A9 0A | Load immediate value into accumulator
    STA $4247            ; 8D 47 42 | Hardware register operation
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_01D
; Address: $CF81C7
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_01D:
    JSR $8DC3            ; 20 C3 8D | Jump to subroutine
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $0A              ; F0 0A | Branch if equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_01E
; Address: $CF81D2
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_01E:
    JSL $C44739          ; 22 39 47 C4 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    BCC $14              ; 90 14 | Branch if carry clear
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $EA              ; 90 EA | Branch if carry clear
    LDA $C107            ; AD 07 C1 | Load from absolute address into accumulator
    BEQ $0C              ; F0 0C | Branch if equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_01F
; Address: $CF81E8
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_01F:
    JSL $C45399          ; 22 99 53 C4 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_024
; Address: $CF81FB
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_024:
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $14              ; F0 14 | Branch if equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_025
; Address: $CF8203
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_025:
    JSL $C44DC0          ; 22 C0 4D C4 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    SBC $0A90,X          ; FD 90 0A | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_026
; Address: $CF820D
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_026:
    JSL $C4487F          ; 22 7F 48 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    SBC $9040,X          ; FD 40 90 | Subtract with carry (absolute,X)
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $E0              ; 90 E0 | Game work RAM access
    LDA $C107            ; AD 07 C1 | Load from absolute address into accumulator
    BEQ $13              ; F0 13 | Branch if equal
    LDA $18              ; A5 18 | Load from zero page into accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_028
; Address: $CF822A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_028:
    JSL $C453F7          ; 22 F7 53 C4 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_02C
; Address: $CF823A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_02C:
    JSR $8DC3            ; 20 C3 8D | Jump to subroutine
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $0A              ; F0 0A | Branch if equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_02D
; Address: $CF8245
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_02D:
    JSL $C44DC0          ; 22 C0 4D C4 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    SBC $16B0,X          ; FD B0 16 | Subtract with carry (absolute,X)
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $EA              ; 90 EA | Branch if carry clear
    LDA $C107            ; AD 07 C1 | Load from absolute address into accumulator
    BEQ $0E              ; F0 0E | Branch if equal
    LDA $18              ; A5 18 | Load from zero page into accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_02E
; Address: $CF825D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_02E:
    JSR $8D98            ; 20 98 8D | Jump to subroutine
    BCC $07              ; 90 07 | Branch if carry clear
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_032
; Address: $CF826D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_032:
    JSR $8DC3            ; 20 C3 8D | Jump to subroutine
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $24              ; F0 24 | Branch if equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_033
; Address: $CF8278
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_033:
    JSL $C44708          ; 22 08 47 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    SBC $D622,X          ; FD 22 D6 | Subtract with carry (absolute,X)
    LSR $C4              ; 46 C4 | Logical shift right (zero page)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    INC                  ; 1A | Increment accumulator
    DEC $1A              ; C6 1A | Decrement (zero page)
    BMI $12              ; 30 12 | Branch if negative
    LDA $0000,Y          ; B9 00 00 | Load from absolute,Y into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    INY                  ; C8 | Increment Y register
    CMP $18              ; C5 18 | Compare accumulator (zero page)
    BNE $F1              ; D0 F1 | Branch if not equal
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_035
; Address: $CF829C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_035:
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $D0              ; 90 D0 | Branch if carry clear
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_036
; Address: $CF82A5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_036:
    JSR $8DC3            ; 20 C3 8D | Jump to subroutine
    LDX #$00             ; A2 00 | Load immediate value into X register
    PHX                  ; DA | Push X register to stack
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $29              ; F0 29 | Branch if equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_037
; Address: $CF82B1
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_037:
    JSL $C44708          ; 22 08 47 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    SBC $00A2,X          ; FD A2 00 | Subtract with carry (absolute,X)
    PHX                  ; DA | Push X register to stack
    LDA $0000,Y          ; B9 00 00 | Load from absolute,Y into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $0B              ; F0 0B | Branch if equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_038
; Address: $CF82C7
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_038:
    JSL $C44FE2          ; 22 E2 4F C4 | Jump to subroutine long
    INC $00E0,X          ; FE E0 00 | Increment (absolute,X)
    BEQ $12              ; F0 12 | Branch if equal
    PLX                  ; FA | Pull X register from stack
    INY                  ; C8 | Increment Y register
    INX                  ; E8 | Increment X register
    CPX #$0C             ; E0 0C | Compare X register (immediate)
    BCC $E1              ; 90 E1 | Branch if carry clear
    PLX                  ; FA | Pull X register from stack
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_039
; Address: $CF82DD
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_039:
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $C9              ; 90 C9 | Branch if carry clear
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_03A
; Address: $CF82E4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_03A:
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    STA $C18F            ; 8D 8F C1 | Store accumulator to absolute address
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_03B
; Address: $CF82EC
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_03B:
    JSR $8D83            ; 20 83 8D | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_03C
; Address: $CF82F1
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_03C:
    JSR $8DC3            ; 20 C3 8D | Jump to subroutine
    LDX #$00             ; A2 00 | Load immediate value into X register
    PHX                  ; DA | Push X register to stack
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $42              ; F0 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_03D
; Address: $CF82FD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_03D:
    JSL $C446D6          ; 22 D6 46 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_03E
; Address: $CF8304
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_03E:
    JSL $C44708          ; 22 08 47 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    SBC $00A2,X          ; FD A2 00 | Subtract with carry (absolute,X)
    PHX                  ; DA | Push X register to stack
    LDA $0000,Y          ; B9 00 00 | Load from absolute,Y into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $1D              ; F0 1D | Branch if equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_040
; Address: $CF8321
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_040:
    JSL $C4508A          ; 22 8A 50 C4 | Jump to subroutine long
    BCC $04              ; 90 04 | Branch if carry clear
    CPX $18              ; E4 18 | Compare X register (zero page)
    BCC $0B              ; 90 0B | Branch if carry clear

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_041
; Address: $CF832C
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_041:
    JSL $C44FE2          ; 22 E2 4F C4 | Jump to subroutine long
    INC $00E0,X          ; FE E0 00 | Increment (absolute,X)
    BEQ $12              ; F0 12 | Branch if equal
    PLX                  ; FA | Pull X register from stack
    INY                  ; C8 | Increment Y register
    INX                  ; E8 | Increment X register
    CPX #$0C             ; E0 0C | Compare X register (immediate)
    BCC $CF              ; 90 CF | Branch if carry clear
    PLX                  ; FA | Pull X register from stack
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $B0              ; 90 B0 | Branch if carry clear
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_044
; Address: $CF8351
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_044:
    JSR $8D83            ; 20 83 8D | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_046
; Address: $CF8359
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_046:
    JSR $8DB8            ; 20 B8 8D | Jump to subroutine
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $20              ; F0 20 | Branch if equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_047
; Address: $CF8364
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_047:
    JSL $C43115          ; 22 15 31 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    INC                  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_048
; Address: $CF836B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_048:
    JSL $C43193          ; 22 93 31 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_049
; Address: $CF8373
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_049:
    JSL $C43115          ; 22 15 31 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    SEC                  ; 38 | Set carry flag
    SBC $1A              ; E5 1A | Subtract with carry (zero page)
    STA $C175            ; 8D 75 C1 | Store accumulator to absolute address
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_04A
; Address: $CF8381
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_04A:
    JSR $8D83            ; 20 83 8D | Jump to subroutine
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $D4              ; 90 D4 | Branch if carry clear
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_04C
; Address: $CF838F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_04C:
    JSR $8DB8            ; 20 B8 8D | Jump to subroutine
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $20              ; F0 20 | Branch if equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_04D
; Address: $CF839A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_04D:
    JSL $C43305          ; 22 05 33 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    INC                  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_04E
; Address: $CF83A1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_04E:
    JSL $C43376          ; 22 76 33 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_04F
; Address: $CF83A9
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_04F:
    JSL $C43305          ; 22 05 33 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    SEC                  ; 38 | Set carry flag
    SBC $1A              ; E5 1A | Subtract with carry (zero page)
    STA $C175            ; 8D 75 C1 | Store accumulator to absolute address
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_050
; Address: $CF83B7
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_050:
    JSR $8D83            ; 20 83 8D | Jump to subroutine
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_051
; Address: $CF83BC
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_051:
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $D4              ; 90 D4 | Branch if carry clear
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_053
; Address: $CF83C5
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_053:
    JSR $8DB8            ; 20 B8 8D | Jump to subroutine
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $20              ; F0 20 | Branch if equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_054
; Address: $CF83D0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_054:
    JSL $C43041          ; 22 41 30 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    INC                  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_055
; Address: $CF83D7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_055:
    JSL $C4307F          ; 22 7F 30 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_056
; Address: $CF83DF
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_056:
    JSL $C43041          ; 22 41 30 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    SEC                  ; 38 | Set carry flag
    SBC $1A              ; E5 1A | Subtract with carry (zero page)
    STA $C175            ; 8D 75 C1 | Store accumulator to absolute address
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_057
; Address: $CF83ED
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_057:
    JSR $8D83            ; 20 83 8D | Jump to subroutine
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $D4              ; 90 D4 | Branch if carry clear
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_059
; Address: $CF83FB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_059:
    JSR $8DB8            ; 20 B8 8D | Jump to subroutine
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $20              ; F0 20 | Branch if equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_05A
; Address: $CF8406
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_05A:
    JSL $C43231          ; 22 31 32 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    INC                  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_05B
; Address: $CF840D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_05B:
    JSL $C4326F          ; 22 6F 32 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_05C
; Address: $CF8415
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_05C:
    JSL $C43231          ; 22 31 32 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    SEC                  ; 38 | Set carry flag
    SBC $1A              ; E5 1A | Subtract with carry (zero page)
    STA $C175            ; 8D 75 C1 | Store accumulator to absolute address
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_05D
; Address: $CF8423
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_05D:
    JSR $8D83            ; 20 83 8D | Jump to subroutine
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $D4              ; 90 D4 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_060
; Address: $CF8431
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_060:
    JSR $8DB8            ; 20 B8 8D | Jump to subroutine
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $20              ; F0 20 | Branch if equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_061
; Address: $CF843C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_061:
    JSL $C43414          ; 22 14 34 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    INC                  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_062
; Address: $CF8443
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_062:
    JSL $C43468          ; 22 68 34 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_063
; Address: $CF844B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_063:
    JSL $C43414          ; 22 14 34 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    SEC                  ; 38 | Set carry flag
    SBC $1A              ; E5 1A | Subtract with carry (zero page)
    STA $C175            ; 8D 75 C1 | Store accumulator to absolute address
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_064
; Address: $CF8459
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_064:
    JSR $8D83            ; 20 83 8D | Jump to subroutine
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $D4              ; 90 D4 | Branch if carry clear
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_066
; Address: $CF8467
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_066:
    JSR $8DB8            ; 20 B8 8D | Jump to subroutine
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $20              ; F0 20 | Branch if equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_067
; Address: $CF8472
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_067:
    JSL $C43644          ; 22 44 36 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    INC                  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_068
; Address: $CF8479
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_068:
    JSL $C4371F          ; 22 1F 37 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_069
; Address: $CF8481
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_069:
    JSL $C43644          ; 22 44 36 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    SEC                  ; 38 | Set carry flag
    SBC $1A              ; E5 1A | Subtract with carry (zero page)
    STA $C175            ; 8D 75 C1 | Store accumulator to absolute address
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_06A
; Address: $CF848F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_06A:
    JSR $8D83            ; 20 83 8D | Jump to subroutine
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $D4              ; 90 D4 | Branch if carry clear
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_06C
; Address: $CF849D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_06C:
    JSR $8DB8            ; 20 B8 8D | Jump to subroutine
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $20              ; F0 20 | Branch if equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_06D
; Address: $CF84A8
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_06D:
    JSL $C4350C          ; 22 0C 35 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    INC                  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_06E
; Address: $CF84AF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_06E:
    JSL $C435A2          ; 22 A2 35 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_06F
; Address: $CF84B7
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_06F:
    JSL $C4350C          ; 22 0C 35 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    SEC                  ; 38 | Set carry flag
    SBC $1A              ; E5 1A | Subtract with carry (zero page)
    STA $C175            ; 8D 75 C1 | Store accumulator to absolute address
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_070
; Address: $CF84C5
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_070:
    JSR $8D83            ; 20 83 8D | Jump to subroutine
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $D4              ; 90 D4 | Branch if carry clear
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_072
; Address: $CF84D3
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_072:
    JSR $8DB8            ; 20 B8 8D | Jump to subroutine
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $20              ; F0 20 | Branch if equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_073
; Address: $CF84DE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_073:
    JSL $C437C1          ; 22 C1 37 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    INC                  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_074
; Address: $CF84E5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_074:
    JSL $C43859          ; 22 59 38 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_075
; Address: $CF84ED
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_075:
    JSL $C437C1          ; 22 C1 37 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    SEC                  ; 38 | Set carry flag
    SBC $1A              ; E5 1A | Subtract with carry (zero page)
    STA $C175            ; 8D 75 C1 | Store accumulator to absolute address
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_076
; Address: $CF84FB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_076:
    JSR $8D83            ; 20 83 8D | Jump to subroutine
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $D4              ; 90 D4 | Branch if carry clear
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_07A
; Address: $CF8514
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_07A:
    JSL $C438FB          ; 22 FB 38 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    INC                  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_07B
; Address: $CF851B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_07B:
    JSL $C439A0          ; 22 A0 39 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_07C
; Address: $CF8523
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_07C:
    JSL $C438FB          ; 22 FB 38 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    SEC                  ; 38 | Set carry flag
    SBC $1A              ; E5 1A | Subtract with carry (zero page)
    STA $C175            ; 8D 75 C1 | Store accumulator to absolute address
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_07D
; Address: $CF8531
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_07D:
    JSR $8D83            ; 20 83 8D | Jump to subroutine
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $D4              ; 90 D4 | Branch if carry clear
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_07F
; Address: $CF853F
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_07F:
    JSR $8DB8            ; 20 B8 8D | Jump to subroutine
    LDA $18              ; A5 18 | Load from zero page into accumulator
    STA $00              ; 85 00 | Store accumulator to zero page
    STZ $02              ; 64 02 | Store zero to zero page
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $18              ; F0 18 | Branch if equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_081
; Address: $CF8557
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_081:
    JSL $C43BA6          ; 22 A6 3B C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    PHA                  ; 48 | Push accumulator to stack
    LDA $00              ; A5 00 | Load from zero page into accumulator
    STA $C175            ; 8D 75 C1 | Store accumulator to absolute address
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_082
; Address: $CF8565
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_082:
    JSR $8D83            ; 20 83 8D | Jump to subroutine
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $DC              ; 90 DC | Branch if carry clear
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_084
; Address: $CF8573
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_084:
    JSR $8DB8            ; 20 B8 8D | Jump to subroutine
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $24              ; F0 24 | Branch if equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_087
; Address: $CF8585
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_087:
    JSL $C431D7          ; 22 D7 31 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_088
; Address: $CF858D
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_088:
    JSL $C43115          ; 22 15 31 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    PHA                  ; 48 | Push accumulator to stack
    LDA $1A              ; A5 1A | Load from zero page into accumulator
    SEC                  ; 38 | Set carry flag
    ORA ($8D,X)          ; 01 8D | Logical OR with accumulator ((zero page,X))
    CMP ($68,X)          ; C1 68 | Compare accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_089
; Address: $CF859F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_089:
    JSR $8D83            ; 20 83 8D | Jump to subroutine
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $D0              ; 90 D0 | Branch if carry clear
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_08B
; Address: $CF85AD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_08B:
    JSR $8DB8            ; 20 B8 8D | Jump to subroutine
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $24              ; F0 24 | Branch if equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_08C
; Address: $CF85B8
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_08C:
    JSL $C43305          ; 22 05 33 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    INC                  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_08D
; Address: $CF85BF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_08D:
    JSL $C433BA          ; 22 BA 33 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_08E
; Address: $CF85C7
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_08E:
    JSL $C43305          ; 22 05 33 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    PHA                  ; 48 | Push accumulator to stack
    LDA $1A              ; A5 1A | Load from zero page into accumulator
    SEC                  ; 38 | Set carry flag
    ORA ($8D,X)          ; 01 8D | Logical OR with accumulator ((zero page,X))
    CMP ($68,X)          ; C1 68 | Compare accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_08F
; Address: $CF85D9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_08F:
    JSR $8D83            ; 20 83 8D | Jump to subroutine
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $D0              ; 90 D0 | Branch if carry clear
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_091
; Address: $CF85E7
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_091:
    JSR $8DB8            ; 20 B8 8D | Jump to subroutine
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $24              ; F0 24 | Branch if equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_092
; Address: $CF85F2
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_092:
    JSL $C43231          ; 22 31 32 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    INC                  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_093
; Address: $CF85F9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_093:
    JSL $C432B3          ; 22 B3 32 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_094
; Address: $CF8601
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_094:
    JSL $C43231          ; 22 31 32 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    PHA                  ; 48 | Push accumulator to stack
    LDA $1A              ; A5 1A | Load from zero page into accumulator
    SEC                  ; 38 | Set carry flag
    ORA ($8D,X)          ; 01 8D | Logical OR with accumulator ((zero page,X))
    CMP ($68,X)          ; C1 68 | Compare accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_095
; Address: $CF8613
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_095:
    JSR $8D83            ; 20 83 8D | Jump to subroutine
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $D0              ; 90 D0 | Branch if carry clear
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_097
; Address: $CF8621
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_097:
    JSR $8DB8            ; 20 B8 8D | Jump to subroutine
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $24              ; F0 24 | Branch if equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_098
; Address: $CF862C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_098:
    JSL $C43414          ; 22 14 34 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    INC                  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_099
; Address: $CF8633
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_099:
    JSL $C434C8          ; 22 C8 34 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_09A
; Address: $CF863B
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_09A:
    JSL $C43414          ; 22 14 34 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    PHA                  ; 48 | Push accumulator to stack
    LDA $1A              ; A5 1A | Load from zero page into accumulator
    SEC                  ; 38 | Set carry flag
    ORA ($8D,X)          ; 01 8D | Logical OR with accumulator ((zero page,X))
    CMP ($68,X)          ; C1 68 | Compare accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_09B
; Address: $CF864D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_09B:
    JSR $8D83            ; 20 83 8D | Jump to subroutine
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $D0              ; 90 D0 | Branch if carry clear
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_09F
; Address: $CF8666
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_09F:
    JSL $C43644          ; 22 44 36 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    INC                  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0A0
; Address: $CF866D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0A0:
    JSL $C4377E          ; 22 7E 37 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0A1
; Address: $CF8675
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0A1:
    JSL $C43644          ; 22 44 36 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    PHA                  ; 48 | Push accumulator to stack
    LDA $1A              ; A5 1A | Load from zero page into accumulator
    SEC                  ; 38 | Set carry flag
    ORA ($8D,X)          ; 01 8D | Logical OR with accumulator ((zero page,X))
    CMP ($68,X)          ; C1 68 | Compare accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0A2
; Address: $CF8687
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0A2:
    JSR $8D83            ; 20 83 8D | Jump to subroutine
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $D0              ; 90 D0 | Branch if carry clear
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0A4
; Address: $CF8695
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0A4:
    JSR $8DB8            ; 20 B8 8D | Jump to subroutine
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $24              ; F0 24 | Branch if equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0A5
; Address: $CF86A0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0A5:
    JSL $C4350C          ; 22 0C 35 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    INC                  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0A6
; Address: $CF86A7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0A6:
    JSL $C43601          ; 22 01 36 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0A7
; Address: $CF86AF
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0A7:
    JSL $C4350C          ; 22 0C 35 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    PHA                  ; 48 | Push accumulator to stack
    LDA $1A              ; A5 1A | Load from zero page into accumulator
    SEC                  ; 38 | Set carry flag
    ORA ($8D,X)          ; 01 8D | Logical OR with accumulator ((zero page,X))
    CMP ($68,X)          ; C1 68 | Compare accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0A8
; Address: $CF86C1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0A8:
    JSR $8D83            ; 20 83 8D | Jump to subroutine
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $D0              ; 90 D0 | Branch if carry clear
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0AA
; Address: $CF86CF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0AA:
    JSR $8DB8            ; 20 B8 8D | Jump to subroutine
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $24              ; F0 24 | Branch if equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0AB
; Address: $CF86DA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0AB:
    JSL $C437C1          ; 22 C1 37 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    INC                  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0AC
; Address: $CF86E1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0AC:
    JSL $C438B8          ; 22 B8 38 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0AD
; Address: $CF86E9
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0AD:
    JSL $C437C1          ; 22 C1 37 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    PHA                  ; 48 | Push accumulator to stack
    LDA $1A              ; A5 1A | Load from zero page into accumulator
    SEC                  ; 38 | Set carry flag
    ORA ($8D,X)          ; 01 8D | Logical OR with accumulator ((zero page,X))
    CMP ($68,X)          ; C1 68 | Compare accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0AE
; Address: $CF86FB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0AE:
    JSR $8D83            ; 20 83 8D | Jump to subroutine
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $D0              ; 90 D0 | Branch if carry clear
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0B0
; Address: $CF8709
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0B0:
    JSR $8DB8            ; 20 B8 8D | Jump to subroutine
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $24              ; F0 24 | Branch if equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0B1
; Address: $CF8714
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0B1:
    JSL $C438FB          ; 22 FB 38 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    INC                  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0B2
; Address: $CF871B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0B2:
    JSL $C439FF          ; 22 FF 39 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0B3
; Address: $CF8723
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0B3:
    JSL $C438FB          ; 22 FB 38 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    PHA                  ; 48 | Push accumulator to stack
    LDA $1A              ; A5 1A | Load from zero page into accumulator
    SEC                  ; 38 | Set carry flag
    ORA ($8D,X)          ; 01 8D | Logical OR with accumulator ((zero page,X))
    CMP ($68,X)          ; C1 68 | Compare accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0B4
; Address: $CF8735
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0B4:
    JSR $8D83            ; 20 83 8D | Jump to subroutine
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $D0              ; 90 D0 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0B7
; Address: $CF8743
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0B7:
    JSR $8DB8            ; 20 B8 8D | Jump to subroutine
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $3C              ; F0 3C | Branch if equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0B8
; Address: $CF874E
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0B8:
    JSL $C43041          ; 22 41 30 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    INC                  ; 1A | Increment accumulator
    LDA $18              ; A5 18 | Load from zero page into accumulator
    STA $1C              ; 85 1C | Store accumulator to zero page
    LDA $1A              ; A5 1A | Load from zero page into accumulator
    BEQ $2D              ; F0 2D | Branch if equal
    CMP $18              ; C5 18 | Compare accumulator (zero page)
    BEQ $02              ; F0 02 | Branch if equal
    BCS $07              ; B0 07 | Branch if carry set
    LDA $1A              ; A5 1A | Load from zero page into accumulator
    DEC                  ; 3A | Decrement accumulator
    BEQ $22              ; F0 22 | Branch if equal
    STA $1C              ; 85 1C | Store accumulator to zero page
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0B9
; Address: $CF876D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0B9:
    JSL $C430C3          ; 22 C3 30 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0BA
; Address: $CF8775
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0BA:
    JSL $C43041          ; 22 41 30 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    PHA                  ; 48 | Push accumulator to stack
    LDA $1A              ; A5 1A | Load from zero page into accumulator
    SEC                  ; 38 | Set carry flag
    ORA ($8D,X)          ; 01 8D | Logical OR with accumulator ((zero page,X))
    CMP ($68,X)          ; C1 68 | Compare accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0BB
; Address: $CF8787
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0BB:
    JSR $8D83            ; 20 83 8D | Jump to subroutine
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $B8              ; 90 B8 | Branch if carry clear
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0BD
; Address: $CF8795
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0BD:
    JSR $8DB8            ; 20 B8 8D | Jump to subroutine
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $0F              ; F0 0F | Branch if equal
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0BE
; Address: $CF87A1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0BE:
    JSL $C43115          ; 22 15 31 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    STA $C17D            ; 8D 7D C1 | Store accumulator to absolute address
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0C0
; Address: $CF87B0
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0C0:
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $E5              ; 90 E5 | Branch if carry clear
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0C2
; Address: $CF87BA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0C2:
    JSR $8DB8            ; 20 B8 8D | Jump to subroutine
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $0F              ; F0 0F | Branch if equal
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0C3
; Address: $CF87C6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0C3:
    JSL $C43305          ; 22 05 33 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    STA $C17D            ; 8D 7D C1 | Store accumulator to absolute address
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0C4
; Address: $CF87D1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0C4:
    JSR $8D83            ; 20 83 8D | Jump to subroutine
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $E5              ; 90 E5 | Branch if carry clear
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0C6
; Address: $CF87DF
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0C6:
    JSR $8DB8            ; 20 B8 8D | Jump to subroutine
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $0F              ; F0 0F | Branch if equal
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0C7
; Address: $CF87EB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0C7:
    JSL $C43041          ; 22 41 30 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    STA $C17D            ; 8D 7D C1 | Store accumulator to absolute address
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0C8
; Address: $CF87F6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0C8:
    JSR $8D83            ; 20 83 8D | Jump to subroutine
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $E5              ; 90 E5 | Branch if carry clear
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0CA
; Address: $CF8804
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0CA:
    JSR $8DB8            ; 20 B8 8D | Jump to subroutine
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $0F              ; F0 0F | Branch if equal
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0CB
; Address: $CF8810
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0CB:
    JSL $C43231          ; 22 31 32 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    STA $C17D            ; 8D 7D C1 | Store accumulator to absolute address
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0CC
; Address: $CF881B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0CC:
    JSR $8D83            ; 20 83 8D | Jump to subroutine
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0CF
; Address: $CF8829
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0CF:
    JSR $8DB8            ; 20 B8 8D | Jump to subroutine
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $0F              ; F0 0F | Branch if equal
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0D0
; Address: $CF8835
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0D0:
    JSL $C43414          ; 22 14 34 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    STA $C17D            ; 8D 7D C1 | Store accumulator to absolute address
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0D1
; Address: $CF8840
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0D1:
    JSR $8D83            ; 20 83 8D | Jump to subroutine
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $E5              ; 90 E5 | Branch if carry clear
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0D3
; Address: $CF884E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0D3:
    JSR $8DB8            ; 20 B8 8D | Jump to subroutine
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $0F              ; F0 0F | Branch if equal
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0D4
; Address: $CF885A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0D4:
    JSL $C43644          ; 22 44 36 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    STA $C17D            ; 8D 7D C1 | Store accumulator to absolute address
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0D5
; Address: $CF8865
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0D5:
    JSR $8D83            ; 20 83 8D | Jump to subroutine
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $E5              ; 90 E5 | Branch if carry clear
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0D7
; Address: $CF8873
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0D7:
    JSR $8DB8            ; 20 B8 8D | Jump to subroutine
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $0F              ; F0 0F | Branch if equal
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0D8
; Address: $CF887F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0D8:
    JSL $C4350C          ; 22 0C 35 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    STA $C17D            ; 8D 7D C1 | Store accumulator to absolute address
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0D9
; Address: $CF888A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0D9:
    JSR $8D83            ; 20 83 8D | Jump to subroutine
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $E5              ; 90 E5 | Branch if carry clear
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0DB
; Address: $CF8898
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0DB:
    JSR $8DB8            ; 20 B8 8D | Jump to subroutine
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $0F              ; F0 0F | Branch if equal
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0DC
; Address: $CF88A4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0DC:
    JSL $C437C1          ; 22 C1 37 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    STA $C17D            ; 8D 7D C1 | Store accumulator to absolute address
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0DD
; Address: $CF88AF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0DD:
    JSR $8D83            ; 20 83 8D | Jump to subroutine
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $E5              ; 90 E5 | Branch if carry clear
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0DF
; Address: $CF88BD
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0DF:
    JSR $8DB8            ; 20 B8 8D | Jump to subroutine
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $0F              ; F0 0F | Branch if equal
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0E0
; Address: $CF88C9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0E0:
    JSL $C438FB          ; 22 FB 38 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    STA $C17D            ; 8D 7D C1 | Store accumulator to absolute address
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0E1
; Address: $CF88D4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0E1:
    JSR $8D83            ; 20 83 8D | Jump to subroutine
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $E5              ; 90 E5 | Branch if carry clear
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0E3
; Address: $CF88E5
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0E3:
    JSR $8DC3            ; 20 C3 8D | Jump to subroutine
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $0A              ; F0 0A | Branch if equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0E4
; Address: $CF88F0
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0E4:
    JSL $C42F5E          ; 22 5E 2F C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    STA $C161            ; 8D 61 C1 | Store accumulator to absolute address
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $EA              ; 90 EA | Branch if carry clear
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0E6
; Address: $CF8905
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0E6:
    JSR $8DC3            ; 20 C3 8D | Jump to subroutine
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0E7
; Address: $CF890E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0E7:
    BEQ $03              ; F0 03 | Branch if equal
    STA $C173            ; 8D 73 C1 | Store accumulator to absolute address
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $F1              ; 90 F1 | Branch if carry clear
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0E8
; Address: $CF891B
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0E8:
    STA $18              ; 85 18 | Store accumulator to zero page
    STZ $C17F            ; 9C 7F C1 | Store zero to absolute
    STZ $C181            ; 9C 81 C1 | Store zero to absolute
    STZ $C183            ; 9C 83 C1 | Store zero to absolute
    STZ $C185            ; 9C 85 C1 | Store zero to absolute
    LDA #$23             ; A9 23 | Load immediate value into accumulator
    STA $C161            ; 8D 61 C1 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0E9
; Address: $CF892F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0E9:
    JSR $8DC3            ; 20 C3 8D | Jump to subroutine
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $08              ; F0 08 | Branch if equal
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0EB
; Address: $CF893F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0EB:
    JSR $8D83            ; 20 83 8D | Jump to subroutine
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $EC              ; 90 EC | Branch if carry clear
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0EC
; Address: $CF894A
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0EC:
    JSL $C43F87          ; 22 87 3F C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    INC                  ; 1A | Increment accumulator
    LDA $18              ; A5 18 | Load from zero page into accumulator
    AND #$03             ; 29 03 | Logical AND with accumulator (immediate)
    BEQ $37              ; F0 37 | Branch if equal
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $18              ; F0 18 | Branch if equal
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $2D              ; D0 2D | Branch if not equal
    LDA $1A              ; A5 1A | Load from zero page into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $26              ; D0 26 | Branch if not equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0ED
; Address: $CF8969
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0ED:
    JSL $C43154          ; 22 54 31 C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    INC $C17F            ; EE 7F C1 | Increment (absolute)
    BRA $1A              ; 80 1A | Branch always
    LDA $1A              ; A5 1A | Load from zero page into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BEQ $13              ; F0 13 | Branch if equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0EE
; Address: $CF897C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0EE:
    JSL $C44045          ; 22 45 40 C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    LDA #$01             ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0EF
; Address: $CF8985
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0EF:
    JSL $C43154          ; 22 54 31 C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    INC $C17F            ; EE 7F C1 | Increment (absolute)
    LDA $18              ; A5 18 | Load from zero page into accumulator
    AND #$0C             ; 29 0C | Logical AND with accumulator (immediate)
    BEQ $2C              ; F0 2C | Branch if equal
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BEQ $17              ; F0 17 | Branch if equal
    CMP #$08             ; C9 08 | Compare accumulator (immediate)
    BNE $22              ; D0 22 | Branch if not equal
    LDA $1A              ; A5 1A | Load from zero page into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BEQ $1B              ; F0 1B | Branch if equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0F0
; Address: $CF89A7
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0F0:
    JSL $C440B0          ; 22 B0 40 C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    INC $C181            ; EE 81 C1 | Increment (absolute)
    BRA $10              ; 80 10 | Branch always
    LDA $1A              ; A5 1A | Load from zero page into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $09              ; D0 09 | Branch if not equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0F1
; Address: $CF89B9
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0F1:
    JSL $C44078          ; 22 78 40 C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    INC $C181            ; EE 81 C1 | Increment (absolute)
    LDA $18              ; A5 18 | Load from zero page into accumulator
    AND #$30             ; 29 30 | Logical AND with accumulator (immediate)
    BEQ $2C              ; F0 2C | Branch if equal
    CMP #$10             ; C9 10 | Compare accumulator (immediate)
    BEQ $17              ; F0 17 | Branch if equal
    CMP #$20             ; C9 20 | Compare accumulator (immediate)
    BNE $22              ; D0 22 | Branch if not equal
    LDA $1A              ; A5 1A | Load from zero page into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BEQ $1B              ; F0 1B | Branch if equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0F2
; Address: $CF89DA
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0F2:
    JSL $C44129          ; 22 29 41 C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    INC $C183            ; EE 83 C1 | Increment (absolute)
    BRA $10              ; 80 10 | Branch always
    LDA $1A              ; A5 1A | Load from zero page into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $09              ; D0 09 | Branch if not equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0F3
; Address: $CF89EC
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0F3:
    JSL $C440F1          ; 22 F1 40 C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    INC $C183            ; EE 83 C1 | Increment (absolute)
    LDA $18              ; A5 18 | Load from zero page into accumulator
    AND #$C0             ; 29 C0 | Logical AND with accumulator (immediate)
    BEQ $26              ; F0 26 | Branch if equal
    CMP #$40             ; C9 40 | Compare accumulator (immediate)
    BEQ $17              ; F0 17 | Branch if equal
    CMP #$80             ; C9 80 | Compare accumulator (immediate)
    BNE $1C              ; D0 1C | Branch if not equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0F4
; Address: $CF8A06
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0F4:
    LDA $1A              ; A5 1A | Load from zero page into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BEQ $15              ; F0 15 | Branch if equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0F5
; Address: $CF8A0D
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0F5:
    JSL $C44168          ; 22 68 41 C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    INC $C185            ; EE 85 C1 | Increment (absolute)
    BRA $0A              ; 80 0A | Branch always
    LDA $1A              ; A5 1A | Load from zero page into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    INC $C185            ; EE 85 C1 | Increment (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0F7
; Address: $CF8A25
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0F7:
    JSR $8DC3            ; 20 C3 8D | Jump to subroutine
    LDA $C0FD            ; AD FD C0 | Load from absolute address into accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ASL $F0              ; 06 F0 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0F8
; Address: $CF8A2F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0F8:
    JSR $1C64            ; 20 64 1C | Jump to subroutine
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $08              ; F0 08 | Branch if equal
    TAY                  ; A8 | Transfer accumulator to Y register
    INC $1C              ; E6 1C | Increment (zero page)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0F9
; Address: $CF8A3D
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0F9:
    JSR $8A67            ; 20 67 8A | Jump to subroutine
    BCC $0C              ; 90 0C | Branch if carry clear
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $EC              ; 90 EC | Branch if carry clear
    LDA $1C              ; A5 1C | Load from zero page into accumulator
    BEQ $01              ; F0 01 | Branch if equal
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0FB
; Address: $CF8A50
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0FB:
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $06              ; F0 06 | Branch if equal
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0FC
; Address: $CF8A59
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0FC:
    JSR $8A67            ; 20 67 8A | Jump to subroutine
    BCS $08              ; B0 08 | Branch if carry set
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $EE              ; 90 EE | Branch if carry clear
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0FD
; Address: $CF8A67
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0FD:
    JSL $C43F87          ; 22 87 3F C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    INC                  ; 1A | Increment accumulator
    LDA $18              ; A5 18 | Load from zero page into accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_0FE
; Address: $CF8A70
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_0FE:
    AND #$03             ; 29 03 | Logical AND with accumulator (immediate)
    BEQ $1A              ; F0 1A | Branch if equal
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $0E              ; F0 0E | Branch if equal
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $10              ; D0 10 | Branch if not equal
    LDA $1A              ; A5 1A | Load from zero page into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BEQ $4D              ; F0 4D | Branch if equal
    BRA $07              ; 80 07 | Branch always
    LDA $1A              ; A5 1A | Load from zero page into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $44              ; D0 44 | Branch if not equal
    LDA $18              ; A5 18 | Load from zero page into accumulator
    AND #$0C             ; 29 0C | Logical AND with accumulator (immediate)
    BEQ $1A              ; F0 1A | Branch if equal
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BEQ $0E              ; F0 0E | Branch if equal
    CMP #$08             ; C9 08 | Compare accumulator (immediate)
    BNE $10              ; D0 10 | Branch if not equal
    LDA $1A              ; A5 1A | Load from zero page into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $2C              ; D0 2C | Branch if not equal
    BRA $07              ; 80 07 | Branch always
    LDA $1A              ; A5 1A | Load from zero page into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BEQ $23              ; F0 23 | Branch if equal
    LDA $18              ; A5 18 | Load from zero page into accumulator
    AND #$30             ; 29 30 | Logical AND with accumulator (immediate)
    BEQ $1A              ; F0 1A | Branch if equal
    CMP #$10             ; C9 10 | Compare accumulator (immediate)
    BEQ $0E              ; F0 0E | Branch if equal
    CMP #$20             ; C9 20 | Compare accumulator (immediate)
    BNE $10              ; D0 10 | Branch if not equal
    LDA $1A              ; A5 1A | Load from zero page into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $0B              ; D0 0B | Branch if not equal
    BRA $07              ; 80 07 | Branch always
    LDA $1A              ; A5 1A | Load from zero page into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BEQ $02              ; F0 02 | Branch if equal
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_101
; Address: $CF8AD7
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_101:
    JSR $8DC3            ; 20 C3 8D | Jump to subroutine
    LDA $C0FD            ; AD FD C0 | Load from absolute address into accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ASL $F0              ; 06 F0 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_102
; Address: $CF8AE1
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_102:
    ROL $64              ; 26 64 | Rotate left (zero page)
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $0E              ; F0 0E | Branch if equal
    TAY                  ; A8 | Transfer accumulator to Y register
    INC $1C              ; E6 1C | Increment (zero page)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_103
; Address: $CF8AEF
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_103:
    JSL $C42DA1          ; 22 A1 2D C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    CMP $18              ; C5 18 | Compare accumulator (zero page)
    BNE $0C              ; D0 0C | Branch if not equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $E6              ; 90 E6 | Branch if carry clear
    LDA $1C              ; A5 1C | Load from zero page into accumulator
    BEQ $01              ; F0 01 | Branch if equal
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_105
; Address: $CF8B08
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_105:
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $0C              ; F0 0C | Branch if equal
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_106
; Address: $CF8B11
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_106:
    JSL $C42DA1          ; 22 A1 2D C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    CMP $18              ; C5 18 | Compare accumulator (zero page)
    BEQ $08              ; F0 08 | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $E8              ; 90 E8 | Branch if carry clear
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_108
; Address: $CF8B27
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_108:
    JSR $8DC3            ; 20 C3 8D | Jump to subroutine
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $04              ; F0 04 | Branch if equal
    CMP $18              ; C5 18 | Compare accumulator (zero page)
    BEQ $08              ; F0 08 | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $F0              ; 90 F0 | Branch if carry clear
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_10A
; Address: $CF8B41
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_10A:
    JSR $8DC3            ; 20 C3 8D | Jump to subroutine
    LDA $C0FD            ; AD FD C0 | Load from absolute address into accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_10B
; Address: $CF8B49
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_10B:
    ASL $F0              ; 06 F0 | Arithmetic shift left (zero page)
    ROL $64              ; 26 64 | Rotate left (zero page)
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $0E              ; F0 0E | Branch if equal
    TAY                  ; A8 | Transfer accumulator to Y register
    INC $1C              ; E6 1C | Increment (zero page)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_10C
; Address: $CF8B59
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_10C:
    JSL $C46951          ; 22 51 69 C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    CMP $18              ; C5 18 | Compare accumulator (zero page)
    BNE $0C              ; D0 0C | Branch if not equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $E6              ; 90 E6 | Branch if carry clear
    LDA $1C              ; A5 1C | Load from zero page into accumulator
    BEQ $01              ; F0 01 | Branch if equal
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_10E
; Address: $CF8B72
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_10E:
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $0C              ; F0 0C | Branch if equal
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_10F
; Address: $CF8B7B
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_10F:
    JSL $C46951          ; 22 51 69 C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    CMP $18              ; C5 18 | Compare accumulator (zero page)
    BEQ $09              ; F0 09 | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $E8              ; 90 E8 | Branch if carry clear
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_110
; Address: $CF8B8F
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_110:
    STY $C173            ; 8C 73 C1 | Store Y register to absolute address
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_111
; Address: $CF8B94
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_111:
    STA $18              ; 85 18 | Store accumulator to zero page
    LDA #$23             ; A9 23 | Load immediate value into accumulator
    STA $C161            ; 8D 61 C1 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_112
; Address: $CF8B9C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_112:
    JSR $8DC3            ; 20 C3 8D | Jump to subroutine
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $0A              ; F0 0A | Branch if equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_113
; Address: $CF8BA7
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_113:
    JSL $C42ED6          ; 22 D6 2E C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_114
; Address: $CF8BAE
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_114:
    JSR $8D83            ; 20 83 8D | Jump to subroutine
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_115
; Address: $CF8BB3
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_115:
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $EA              ; 90 EA | Branch if carry clear
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_117
; Address: $CF8BBB
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_117:
    JSR $8DC3            ; 20 C3 8D | Jump to subroutine
    LDA $C0FD            ; AD FD C0 | Load from absolute address into accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ASL $F0              ; 06 F0 | Arithmetic shift left (zero page)
    ROL $64              ; 26 64 | Rotate left (zero page)
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $0E              ; F0 0E | Branch if equal
    TAY                  ; A8 | Transfer accumulator to Y register
    INC $1C              ; E6 1C | Increment (zero page)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_118
; Address: $CF8BD3
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_118:
    JSL $C42E53          ; 22 53 2E C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    CMP $18              ; C5 18 | Compare accumulator (zero page)
    BNE $0C              ; D0 0C | Branch if not equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $E6              ; 90 E6 | Branch if carry clear
    LDA $1C              ; A5 1C | Load from zero page into accumulator
    BEQ $01              ; F0 01 | Branch if equal
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_11A
; Address: $CF8BEC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_11A:
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $0C              ; F0 0C | Branch if equal
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_11B
; Address: $CF8BF5
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_11B:
    JSL $C42E53          ; 22 53 2E C4 | Jump to subroutine long
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    CMP $18              ; C5 18 | Compare accumulator (zero page)
    BEQ $09              ; F0 09 | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $E8              ; 90 E8 | Branch if carry clear
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_11C
; Address: $CF8C09
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_11C:
    STY $C173            ; 8C 73 C1 | Store Y register to absolute address
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_11D
; Address: $CF8C0E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_11D:
    JSR $8DC3            ; 20 C3 8D | Jump to subroutine
    LDA #$23             ; A9 23 | Load immediate value into accumulator
    STA $C161            ; 8D 61 C1 | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $13              ; F0 13 | Branch if equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_11E
; Address: $CF8C1F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_11E:
    JSL $C42E53          ; 22 53 2E C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    STA $C195            ; 8D 95 C1 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_11F
; Address: $CF8C29
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_11F:
    JSL $C42F28          ; 22 28 2F C4 | Jump to subroutine long
    STA $C161            ; 8D 61 C1 | Store accumulator to absolute address
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $E1              ; 90 E1 | Branch if carry clear
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_120
; Address: $CF8C3A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_120:
    JSR $8DC3            ; 20 C3 8D | Jump to subroutine
    LDA #$23             ; A9 23 | Load immediate value into accumulator
    STA $C161            ; 8D 61 C1 | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $13              ; F0 13 | Branch if equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_121
; Address: $CF8C4B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_121:
    JSL $C42EA9          ; 22 A9 2E C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    STA $C195            ; 8D 95 C1 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_122
; Address: $CF8C55
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_122:
    JSL $C42F28          ; 22 28 2F C4 | Jump to subroutine long
    STA $C161            ; 8D 61 C1 | Store accumulator to absolute address
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $E1              ; 90 E1 | Branch if carry clear
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_124
; Address: $CF8C68
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_124:
    JSR $8DC3            ; 20 C3 8D | Jump to subroutine
    LDA $C0FD            ; AD FD C0 | Load from absolute address into accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ASL $F0              ; 06 F0 | Arithmetic shift left (zero page)
    STZ $1C              ; 64 1C | Store zero to zero page
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $1B              ; F0 1B | Branch if equal
    INC $1C              ; E6 1C | Increment (zero page)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_125
; Address: $CF8C7F
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_125:
    JSL $C455FD          ; 22 FD 55 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDA $40F7,Y          ; B9 F7 40 | Load from absolute,Y into accumulator
    CMP $18              ; C5 18 | Compare accumulator (zero page)
    BEQ $09              ; F0 09 | Branch if equal
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    CPY #$3C             ; C0 3C | Compare Y register (immediate)
    BCC $F2              ; 90 F2 | Branch if carry clear
    BRA $0C              ; 80 0C | Branch always
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_126
; Address: $CF8C9D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_126:
    BCC $D9              ; 90 D9 | Branch if carry clear
    LDA $1C              ; A5 1C | Load from zero page into accumulator
    BEQ $01              ; F0 01 | Branch if equal
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_128
; Address: $CF8CA6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_128:
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $17              ; F0 17 | Branch if equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_129
; Address: $CF8CAE
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_129:
    JSL $C455FD          ; 22 FD 55 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDA $40F7,Y          ; B9 F7 40 | Load from absolute,Y into accumulator
    CMP $18              ; C5 18 | Compare accumulator (zero page)
    BEQ $0F              ; F0 0F | Branch if equal
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    CPY #$3C             ; C0 3C | Compare Y register (immediate)
    BCC $F2              ; 90 F2 | Branch if carry clear
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $DD              ; 90 DD | Branch if carry clear
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_12A
; Address: $CF8CCE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_12A:
    STA $18              ; 85 18 | Store accumulator to zero page
    LDA #$23             ; A9 23 | Load immediate value into accumulator
    STA $C161            ; 8D 61 C1 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_12B
; Address: $CF8CD6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_12B:
    JSR $8DC3            ; 20 C3 8D | Jump to subroutine
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $C0FF,X          ; BD FF C0 | Load from absolute,X into accumulator
    BEQ $0A              ; F0 0A | Branch if equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_12C
; Address: $CF8CE1
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_12C:
    JSL $C457C1          ; 22 C1 57 C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_12D
; Address: $CF8CE8
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_12D:
    JSR $8D83            ; 20 83 8D | Jump to subroutine
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $EA              ; 90 EA | Branch if carry clear
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_12F
; Address: $CF8CF5
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_12F:
    JSL $C45AB0          ; 22 B0 5A C4 | Jump to subroutine long
    STA $C17B            ; 8D 7B C1 | Store accumulator to absolute address
    STX $C179            ; 8E 79 C1 | Store X register to absolute address
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_132
; Address: $CF8D0C
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_132:
    PHA                  ; 48 | Push accumulator to stack
    TXA                  ; 8A | Transfer X register to accumulator
    SEC                  ; 38 | Set carry flag
    SBC $C179            ; ED 79 C1 | Subtract with carry (absolute)
    STA $C179            ; 8D 79 C1 | Store accumulator to absolute address
    PLA                  ; 68 | Pull accumulator from stack
    SBC $C17B            ; ED 7B C1 | Subtract with carry (absolute)
    STA $C17B            ; 8D 7B C1 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_134
; Address: $CF8D1F
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_134:
    JSL $C45AB0          ; 22 B0 5A C4 | Jump to subroutine long
    STA $C17B            ; 8D 7B C1 | Store accumulator to absolute address
    STX $C179            ; 8E 79 C1 | Store X register to absolute address
    PHA                  ; 48 | Push accumulator to stack
    TXA                  ; 8A | Transfer X register to accumulator
    SEC                  ; 38 | Set carry flag
    PLA                  ; 68 | Pull accumulator from stack
    BCS $0A              ; B0 0A | Branch if carry set
    LDA $C179            ; AD 79 C1 | Load from absolute address into accumulator
    ORA ($AD,X)          ; 01 AD | Logical OR with accumulator ((zero page,X))
    CMP ($83,X)          ; C1 83 | Compare accumulator ((zero page,X))
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_136
; Address: $CF8D45
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_136:
    JSL $C45AB0          ; 22 B0 5A C4 | Jump to subroutine long
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    LDA $C179            ; AD 79 C1 | Load from absolute address into accumulator
    SEC                  ; 38 | Set carry flag
    ORA ($8D,X)          ; 01 8D | Logical OR with accumulator ((zero page,X))
    ADC $ADC1,Y          ; 79 C1 AD | Add with carry (absolute,Y)
    CMP ($E3,X)          ; C1 E3 | Compare accumulator ((zero page,X))
    STA $C17B            ; 8D 7B C1 | Store accumulator to absolute address
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_137
; Address: $CF8D60
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_137:
    STX $00              ; 86 00 | Store X register to zero page
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $02              ; 85 02 | Store accumulator to zero page
    STZ $06              ; 64 06 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_138
; Address: $CF8D69
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_138:
    JSL $C45AB0          ; 22 B0 5A C4 | Jump to subroutine long
    LDA $04              ; A5 04 | Load from zero page into accumulator
    SEC                  ; 38 | Set carry flag
    SBC $00              ; E5 00 | Subtract with carry (zero page)
    LDA $06              ; A5 06 | Load from zero page into accumulator
    SBC $02              ; E5 02 | Subtract with carry (zero page)
    BCC $02              ; 90 02 | Branch if carry clear
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_13B
; Address: $CF8D83
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_13B:
    XBA                  ; EB | Exchange accumulator bytes
    XBA                  ; EB | Exchange accumulator bytes
    BNE $05              ; D0 05 | Branch if not equal
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    BRA $07              ; 80 07 | Branch always

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_13C
; Address: $CF8D8C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_13C:
    JSL $C42F5E          ; 22 5E 2F C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    STA $C161            ; 8D 61 C1 | Store accumulator to absolute address
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_13D
; Address: $CF8D98
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_13D:
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    DEC                  ; 3A | Decrement accumulator
    BMI $17              ; 30 17 | Branch if negative
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_13E
; Address: $CF8D9E
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_13E:
    JSL $C45345          ; 22 45 53 C4 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    ORA ($AA,X)          ; 01 AA | Logical OR with accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack
    LDA $0000,X          ; BD 00 00 | Load from absolute,X into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    BEQ $04              ; F0 04 | Branch if equal
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_13F
; Address: $CF8DB4
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_13F:
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_140
; Address: $CF8DB8
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_140:
    STA $18              ; 85 18 | Store accumulator to zero page
    LDA #$23             ; A9 23 | Load immediate value into accumulator
    STA $C161            ; 8D 61 C1 | Store accumulator to absolute address
    JMP $8DC3            ; 4C C3 8D | Jump to address
    STX $C0FD            ; 8E FD C0 | Store X register to absolute address
    STZ $C0FF            ; 9C FF C0 | Store zero to absolute
    STZ $C101            ; 9C 01 C1 | Store zero to absolute
    STZ $C103            ; 9C 03 C1 | Store zero to absolute
    STZ $C105            ; 9C 05 C1 | Store zero to absolute
    STZ $C107            ; 9C 07 C1 | Store zero to absolute
    STZ $C173            ; 9C 73 C1 | Store zero to absolute
    LDA $C0FD            ; AD FD C0 | Load from absolute address into accumulator
    AND #$07             ; 29 07 | Logical AND with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    STA $FDAD            ; 8D AD FD | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_141
; Address: $CF8DE5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_141:
    CPY #$29             ; C0 29 | Compare Y register (immediate)
    ORA ($F0,X)          ; 01 F0 | Logical OR with accumulator ((zero page,X))
    INC $C107            ; EE 07 C1 | Increment (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_142
; Address: $CF8DF0
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_142:
    STA $8E00            ; 8D 00 8E | Store accumulator to absolute address
    EOR $848E,Y          ; 59 8E 84 | Exclusive OR with accumulator (absolute,Y)
    STX $8EC5            ; 8E C5 8E | Store X register to absolute address
    STX $8F06            ; 8E 06 8F | Store X register to absolute address
    EOR #$8F             ; 49 8F | Exclusive OR with accumulator (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_143
; Address: $CF8E00
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_143:
    JSL $C4297C          ; 22 7C 29 C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    TAX                  ; AA | Transfer accumulator to X register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C0FD            ; AD FD C0 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $22              ; D0 22 | Branch if not equal
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEX                  ; CA | Decrement X register
    BMI $42              ; 30 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_144
; Address: $CF8E16
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_144:
    JSL $C42DA1          ; 22 A1 2D C4 | Jump to subroutine long
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CMP $C109            ; CD 09 C1 | Compare accumulator (absolute)
    BNE $EF              ; D0 EF | Branch if not equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_146
; Address: $CF8E29
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_146:
    JSR $8F5E            ; 20 5E 8F | Jump to subroutine
    BCC $E3              ; 90 E3 | Branch if carry clear
    STA $C0FF,Y          ; 99 FF C0 | Store accumulator to absolute,Y
    BRA $DE              ; 80 DE | Branch always
    LDY #$FE             ; A0 FE | Load immediate value into Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    DEX                  ; CA | Decrement X register
    BMI $1D              ; 30 1D | Branch if negative

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_147
; Address: $CF8E3B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_147:
    JSL $C42DA1          ; 22 A1 2D C4 | Jump to subroutine long
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CMP $C109            ; CD 09 C1 | Compare accumulator (absolute)
    BNE $EF              ; D0 EF | Branch if not equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_149
; Address: $CF8E4E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_149:
    JSR $8F5E            ; 20 5E 8F | Jump to subroutine
    BCC $E3              ; 90 E3 | Branch if carry clear
    STA $C0FF,Y          ; 99 FF C0 | Store accumulator to absolute,Y
    BRA $DE              ; 80 DE | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_14B
; Address: $CF8E5D
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_14B:
    LDA $D765,Y          ; B9 65 D7 | Load from absolute,Y into accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    PLA                  ; 68 | Pull accumulator from stack
    TYA                  ; 98 | Transfer Y register to accumulator
    LDX #$00             ; A2 00 | Load immediate value into X register
    CMP $DAA5,X          ; DD A5 DA | Compare accumulator (absolute,X)
    BEQ $08              ; F0 08 | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$10             ; E0 10 | Compare X register (immediate)
    BCC $F4              ; 90 F4 | Branch if carry clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_14C
; Address: $CF8E73
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_14C:
    LDA $DAC7,X          ; BD C7 DA | Load from absolute,X into accumulator
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    BEQ $08              ; F0 08 | Branch if equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_14D
; Address: $CF8E7B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_14D:
    JSR $8F5E            ; 20 5E 8F | Jump to subroutine
    BCC $03              ; 90 03 | Branch if carry clear
    STA $C0FF            ; 8D FF C0 | Store accumulator to absolute address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_14E
; Address: $CF8E84
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_14E:
    JSL $C4297C          ; 22 7C 29 C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    DEC                  ; 3A | Decrement accumulator
    CMP $C10B            ; CD 0B C1 | Compare accumulator (absolute)
    BCC $12              ; 90 12 | Branch if carry clear
    LDX $C10B            ; AE 0B C1 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_150
; Address: $CF8E9A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_150:
    JSR $8F5E            ; 20 5E 8F | Jump to subroutine
    BCC $03              ; 90 03 | Branch if carry clear
    STA $C0FF            ; 8D FF C0 | Store accumulator to absolute address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_151
; Address: $CF8EA3
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_151:
    JSL $C4297C          ; 22 7C 29 C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    DEC                  ; 3A | Decrement accumulator
    CMP $C10B            ; CD 0B C1 | Compare accumulator (absolute)
    BCC $15              ; 90 15 | Branch if carry clear
    LDA $C10B            ; AD 0B C1 | Load from absolute address into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $DAC7,X          ; BD C7 DA | Load from absolute,X into accumulator
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    BEQ $08              ; F0 08 | Branch if equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_152
; Address: $CF8EBC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_152:
    JSR $8F5E            ; 20 5E 8F | Jump to subroutine
    BCC $03              ; 90 03 | Branch if carry clear
    STA $C0FF            ; 8D FF C0 | Store accumulator to absolute address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_153
; Address: $CF8EC5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_153:
    JSL $C4297C          ; 22 7C 29 C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    TAX                  ; AA | Transfer accumulator to X register
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_154
; Address: $CF8ECD
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_154:
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $C0FD            ; AD FD C0 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $16              ; D0 16 | Branch if not equal
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEX                  ; CA | Decrement X register
    BMI $2A              ; 30 2A | Branch if negative

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_156
; Address: $CF8EE2
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_156:
    JSR $8F5E            ; 20 5E 8F | Jump to subroutine
    BCC $EF              ; 90 EF | Branch if carry clear
    STA $C0FF,Y          ; 99 FF C0 | Store accumulator to absolute,Y
    BRA $EA              ; 80 EA | Branch always
    LDY #$FE             ; A0 FE | Load immediate value into Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    DEX                  ; CA | Decrement X register
    BMI $11              ; 30 11 | Branch if negative

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_158
; Address: $CF8EFB
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_158:
    JSR $8F5E            ; 20 5E 8F | Jump to subroutine
    BCC $EF              ; 90 EF | Branch if carry clear
    STA $C0FF,Y          ; 99 FF C0 | Store accumulator to absolute,Y
    BRA $EA              ; 80 EA | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_159
; Address: $CF8F06
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_159:
    LDA $C0FD            ; AD FD C0 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $1C              ; D0 1C | Branch if not equal
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDA $DAC7,Y          ; B9 C7 DA | Load from absolute,Y into accumulator
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    BEQ $08              ; F0 08 | Branch if equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_15A
; Address: $CF8F19
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_15A:
    JSR $8F5E            ; 20 5E 8F | Jump to subroutine
    BCC $03              ; 90 03 | Branch if carry clear
    STA $C0FF,Y          ; 99 FF C0 | Store accumulator to absolute,Y
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    CPY #$08             ; C0 08 | Compare Y register (immediate)
    BCC $E9              ; 90 E9 | Branch if carry clear
    BRA $1E              ; 80 1E | Branch always
    LDY #$08             ; A0 08 | Load immediate value into Y register
    LDX #$FE             ; A2 FE | Load immediate value into X register
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    BMI $12              ; 30 12 | Branch if negative
    LDA $DAC7,Y          ; B9 C7 DA | Load from absolute,Y into accumulator
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_15C
; Address: $CF8F3E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_15C:
    JSR $8F5E            ; 20 5E 8F | Jump to subroutine
    BCC $ED              ; 90 ED | Branch if carry clear
    STA $C0FF,X          ; 9D FF C0 | Store accumulator to absolute,X
    BRA $E8              ; 80 E8 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_15E
; Address: $CF8F4C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_15E:
    JSL $C42A12          ; 22 12 2A C4 | Jump to subroutine long
    RTI                  ; 40 | Return from interrupt
    BCS $08              ; B0 08 | Branch if carry set

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_15F
; Address: $CF8F55
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_15F:
    JSR $8F5E            ; 20 5E 8F | Jump to subroutine
    BCC $03              ; 90 03 | Branch if carry clear
    STA $C0FF            ; 8D FF C0 | Store accumulator to absolute address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_161
; Address: $CF8F5F
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_161:
    JSL $C43F87          ; 22 87 3F C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    BIT $FDAD            ; 2C AD FD | Test bits in accumulator (absolute)
    CPY #$29             ; C0 29 | Compare Y register (immediate)
    BMI $00              ; 30 00 | Branch if negative
    BEQ $1A              ; F0 1A | Branch if equal
    CMP #$10             ; C9 10 | Compare accumulator (immediate)
    BEQ $0E              ; F0 0E | Branch if equal
    CMP #$20             ; C9 20 | Compare accumulator (immediate)
    BNE $10              ; D0 10 | Branch if not equal
    LDA $2C              ; A5 2C | Load from zero page into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $09              ; D0 09 | Branch if not equal
    BRA $35              ; 80 35 | Branch always
    LDA $2C              ; A5 2C | Load from zero page into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $2E              ; D0 2E | Branch if not equal
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA $C42E,Y          ; 19 2E C4 | Logical OR with accumulator (absolute,Y)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    BIT $FDAD            ; 2C AD FD | Test bits in accumulator (absolute)
    CPY #$29             ; C0 29 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $1A              ; F0 1A | Branch if equal
    CMP #$40             ; C9 40 | Compare accumulator (immediate)
    BEQ $0E              ; F0 0E | Branch if equal
    CMP #$80             ; C9 80 | Compare accumulator (immediate)
    BNE $10              ; D0 10 | Branch if not equal
    LDA $2C              ; A5 2C | Load from zero page into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $09              ; F0 09 | Branch if equal
    BRA $0A              ; 80 0A | Branch always
    LDA $2C              ; A5 2C | Load from zero page into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_162
; Address: $CF8FB3
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_162:
    PLA                  ; 68 | Pull accumulator from stack
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_163
; Address: $CF8FB6
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_163:
    PLA                  ; 68 | Pull accumulator from stack
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_164
; Address: $CF8FB9
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_164:
    LDA $7E986C          ; AF 6C 98 7E | Load from absolute long address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BEQ $1C              ; F0 1C | Branch if equal
    PHA                  ; 48 | Push accumulator to stack
    LDY $7F2A            ; AC 2A 7F | Load from absolute address into Y register
    LDA $D765,Y          ; B9 65 D7 | Load from absolute,Y into accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    PLA                  ; 68 | Pull accumulator from stack
    LDA $C625,Y          ; B9 25 C6 | Load from absolute,Y into accumulator
    SEC                  ; 38 | Set carry flag
    SBC #$70             ; E9 70 | Subtract with carry (immediate)
    STA $C625,Y          ; 99 25 C6 | Store accumulator to absolute,Y
    LDA $C425,Y          ; B9 25 C4 | Load from absolute,Y into accumulator
    ORA #$04             ; 09 04 | Logical OR with accumulator (immediate)
    STA $C425,Y          ; 99 25 C4 | Store accumulator to absolute,Y
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_165
; Address: $CF8FDF
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_165:
    PHA                  ; 48 | Push accumulator to stack
    LDY $7F2A            ; AC 2A 7F | Load from absolute address into Y register
    LDA $D765,Y          ; B9 65 D7 | Load from absolute,Y into accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    PLA                  ; 68 | Pull accumulator from stack
    LDA $C425,Y          ; B9 25 C4 | Load from absolute,Y into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BEQ $2E              ; F0 2E | Branch if equal
    LDA $C425,Y          ; B9 25 C4 | Load from absolute,Y into accumulator
    AND #$FB             ; 29 FB | Logical AND with accumulator (immediate)
    STA $C425,Y          ; 99 25 C4 | Store accumulator to absolute,Y
    LDA $D1A5,Y          ; B9 A5 D1 | Load from absolute,Y into accumulator
    PHA                  ; 48 | Push accumulator to stack
    PHY                  ; 5A | Push Y register to stack
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    STA $D165,Y          ; 99 65 D1 | Store accumulator to absolute,Y

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_169
; Address: $CF9010
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_169:
    JSL $C76597          ; 22 97 65 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    BRA $F7              ; 80 F7 | Branch always
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_16C
; Address: $CF9026
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_16C:
    BNE $05              ; D0 05 | Branch if not equal
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))
    LDA #$18             ; A9 18 | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROL $C76D            ; 2E 6D C7 | Rotate left (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_16D
; Address: $CF9035
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_16D:
    PHA                  ; 48 | Push accumulator to stack
    LDY $7F2A            ; AC 2A 7F | Load from absolute address into Y register
    LDA $D765,Y          ; B9 65 D7 | Load from absolute,Y into accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    PLA                  ; 68 | Pull accumulator from stack
    LDA $C425,Y          ; B9 25 C4 | Load from absolute,Y into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BEQ $25              ; F0 25 | Branch if equal
    LDA $C425,Y          ; B9 25 C4 | Load from absolute,Y into accumulator
    AND #$FB             ; 29 FB | Logical AND with accumulator (immediate)
    STA $C425,Y          ; 99 25 C4 | Store accumulator to absolute,Y

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_16E
; Address: $CF904F
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_16E:
    JSL $C76105          ; 22 05 61 C7 | Jump to subroutine long
    LDA $C3A5,Y          ; B9 A5 C3 | Load from absolute,Y into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $C3A5,Y          ; 99 A5 C3 | Store accumulator to absolute,Y
    LDA $D165,Y          ; B9 65 D1 | Load from absolute,Y into accumulator
    CMP #$08             ; C9 08 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    BRA $E8              ; 80 E8 | Branch always

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_171
; Address: $CF906D
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_171:
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    LDX #$00             ; A2 00 | Load immediate value into X register
    STA $36A0,X          ; 9D A0 36 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$40             ; E0 40 | Compare X register (immediate)
    BCC $F6              ; 90 F6 | Branch if carry clear
    LDA #$5D             ; A9 5D | Load immediate value into accumulator
    STA $36E0            ; 8D E0 36 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_172
; Address: $CF9083
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_172:
    JSL $C790C3          ; 22 C3 90 C7 | Jump to subroutine long
    LDA #$5C             ; A9 5C | Load immediate value into accumulator
    STA $36E0            ; 8D E0 36 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_173
; Address: $CF908D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_173:
    JSL $C790C3          ; 22 C3 90 C7 | Jump to subroutine long
    LDA #$5B             ; A9 5B | Load immediate value into accumulator
    STA $36E0            ; 8D E0 36 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_175
; Address: $CF909C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_175:
    LDA $BE59            ; AD 59 BE | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $07              ; D0 07 | Branch if not equal
    LDA $BDDF            ; AD DF BD | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_179
; Address: $CF90B5
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_179:
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    STA $36E0            ; 8D E0 36 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_17A
; Address: $CF90C3
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_17A:
    LDA $36E0            ; AD E0 36 | Load from absolute address into accumulator
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    BEQ $1B              ; F0 1B | Branch if equal
    LDX #$3C             ; A2 3C | Load immediate value into X register
    LDA $36A0,X          ; BD A0 36 | Load from absolute,X into accumulator
    STA $36A2,X          ; 9D A2 36 | Store accumulator to absolute,X
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    BPL $F6              ; 10 F6 | Branch if positive
    LDA $36E0            ; AD E0 36 | Load from absolute address into accumulator
    STA $36A0            ; 8D A0 36 | Store accumulator to absolute address
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    STA $36E0            ; 8D E0 36 | Store accumulator to absolute address
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_17C
; Address: $CF90E8
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_17C:
    LDX #$00             ; A2 00 | Load immediate value into X register
    CMP $36A0,X          ; DD A0 36 | Compare accumulator (absolute,X)
    BEQ $09              ; F0 09 | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$40             ; E0 40 | Compare X register (immediate)
    BCC $F4              ; 90 F4 | Branch if carry clear
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_17D
; Address: $CF90F9
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_17D:
    LDA $36A2,X          ; BD A2 36 | Load from absolute,X into accumulator
    STA $36A0,X          ; 9D A0 36 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$40             ; E0 40 | Compare X register (immediate)
    BCC $F3              ; 90 F3 | Branch if carry clear
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    STA $369E,X          ; 9D 9E 36 | Store accumulator to absolute,X
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_17F
; Address: $CF9110
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_17F:
    TAY                  ; A8 | Transfer accumulator to Y register
    BEQ $3C              ; F0 3C | Branch if equal
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $36A0,X          ; BD A0 36 | Load from absolute,X into accumulator
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    BEQ $20              ; F0 20 | Branch if equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_181
; Address: $CF9122
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_181:
    JSR $9151            ; 20 51 91 | Jump to subroutine
    BCC $07              ; 90 07 | Branch if carry clear
    LDA #$50             ; A9 50 | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    TAX                  ; AA | Transfer accumulator to X register
    CMP ($E6,X)          ; C1 E6 | Compare accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    LDA $BDEB            ; AD EB BD | Load from absolute address into accumulator
    BNE $18              ; D0 18 | Branch if not equal
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    STA $36E0            ; 8D E0 36 | Store accumulator to absolute address
    DEY                  ; 88 | Decrement Y register
    BEQ $07              ; F0 07 | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$40             ; E0 40 | Compare X register (immediate)
    BCC $D1              ; 90 D1 | Branch if carry clear
    LDA $18              ; A5 18 | Load from zero page into accumulator
    BEQ $06              ; F0 06 | Branch if equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_182
; Address: $CF9149
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_182:
    JSL $C73824          ; 22 24 38 C7 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_184
; Address: $CF9151
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_184:
    PHX                  ; DA | Push X register to stack
    CPY #$01             ; C0 01 | Compare Y register (immediate)
    BEQ $1B              ; F0 1B | Branch if equal
    LDA $BDEB            ; AD EB BD | Load from absolute address into accumulator
    BNE $16              ; D0 16 | Branch if not equal
    LDA $BDE7            ; AD E7 BD | Load from absolute address into accumulator
    BNE $11              ; D0 11 | Branch if not equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$40             ; E0 40 | Compare X register (immediate)
    BCS $0A              ; B0 0A | Branch if carry set
    LDA $36A0,X          ; BD A0 36 | Load from absolute,X into accumulator
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    BNE $05              ; D0 05 | Branch if not equal
    BRA $EF              ; 80 EF | Branch always
    PLX                  ; FA | Pull X register from stack
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_187
; Address: $CF9178
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_187:
    LDA $99F7            ; AD F7 99 | Load from absolute address into accumulator
    CMP #$09             ; C9 09 | Compare accumulator (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    LDA $352C            ; AD 2C 35 | Load from absolute address into accumulator
    INC                  ; 1A | Increment accumulator
    CMP #$F0             ; C9 F0 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $352C            ; 8D 2C 35 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_188
; Address: $CF9190
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_188:
    PHA                  ; 48 | Push accumulator to stack
    LDA $352C            ; AD 2C 35 | Load from absolute address into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP #$90             ; C9 90 | Compare accumulator (immediate)
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_189
; Address: $CF919C
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_189:
    PHA                  ; 48 | Push accumulator to stack
    LDA $352C            ; AD 2C 35 | Load from absolute address into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP #$70             ; C9 70 | Compare accumulator (immediate)
    BCC $05              ; 90 05 | Branch if carry clear
    CMP #$90             ; C9 90 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    CLC                  ; 18 | Clear carry flag
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_18A
; Address: $CF91B0
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_18A:
    SEC                  ; 38 | Set carry flag
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_18B
; Address: $CF91B3
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_18B:
    JSL $C79190          ; 22 90 91 C7 | Jump to subroutine long
    BCC $05              ; 90 05 | Branch if carry clear
    LDA #$18             ; A9 18 | Load immediate value into accumulator
    BRA $03              ; 80 03 | Branch always
    LDA #$B0             ; A9 B0 | Load immediate value into accumulator
    STA $352C            ; 8D 2C 35 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_18C
; Address: $CF91C5
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_18C:
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $352C            ; 8D 2C 35 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_18D
; Address: $CF91CC
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_18D:
    LDA #$18             ; A9 18 | Load immediate value into accumulator
    STA $352C            ; 8D 2C 35 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_18E
; Address: $CF91D3
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_18E:
    LDA #$B0             ; A9 B0 | Load immediate value into accumulator
    STA $352C            ; 8D 2C 35 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_18F
; Address: $CF91DA
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_18F:
    LDA #$18             ; A9 18 | Load immediate value into accumulator
    STA $352C            ; 8D 2C 35 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_190
; Address: $CF91E1
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_190:
    LDA #$18             ; A9 18 | Load immediate value into accumulator
    STA $352C            ; 8D 2C 35 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_192
; Address: $CF91EC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_192:
    JSR $92AD            ; 20 AD 92 | Jump to subroutine
    LDA                  ; BF CD 93 C7 | Load from absolute long,X into accumulator
    TAX                  ; AA | Transfer accumulator to X register
    LDA $9977            ; AD 77 99 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_197
; Address: $CF920B
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_197:
    JSR $92DA            ; 20 DA 92 | Jump to subroutine
    BCS $03              ; B0 03 | Branch if carry set
    BRA $F8              ; 80 F8 | Branch always
    LDY #$10             ; A0 10 | Load immediate value into Y register
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    LDA                  ; BF F7 93 C7 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_198
; Address: $CF921C
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_198:
    JSR $931E            ; 20 1E 93 | Jump to subroutine
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF D7 94 C7 | Load from absolute long,X into accumulator
    STA $18              ; 85 18 | Store accumulator to zero page
    LDA                  ; BF B7 95 C7 | Load from absolute long,X into accumulator
    STA $1A              ; 85 1A | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_199
; Address: $CF922E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_199:
    JSR $932B            ; 20 2B 93 | Jump to subroutine
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    DEY                  ; 88 | Decrement Y register
    BNE $DD              ; D0 DD | Branch if not equal
    BRA $D0              ; 80 D0 | Branch always

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_19A
; Address: $CF923B
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_19A:
    JSR $92AD            ; 20 AD 92 | Jump to subroutine
    LDA                  ; BF DB 93 C7 | Load from absolute long,X into accumulator
    STA $18              ; 85 18 | Store accumulator to zero page
    LDA                  ; BF E9 93 C7 | Load from absolute long,X into accumulator
    STA $1A              ; 85 1A | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_19C
; Address: $CF924E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_19C:
    JSR $92AD            ; 20 AD 92 | Jump to subroutine
    LDA                  ; BF 97 96 C7 | Load from absolute long,X into accumulator
    PHX                  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_19D
; Address: $CF9256
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_19D:
    JSR $931E            ; 20 1E 93 | Jump to subroutine
    PLX                  ; FA | Pull X register from stack
    LDA                  ; BF DB 93 C7 | Load from absolute long,X into accumulator
    STA $18              ; 85 18 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1A0
; Address: $CF926A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1A0:
    JSR $92DA            ; 20 DA 92 | Jump to subroutine
    BCS $03              ; B0 03 | Branch if carry set
    BRA $F8              ; 80 F8 | Branch always
    LDY #$10             ; A0 10 | Load immediate value into Y register
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    LDA                  ; BF C1 96 C7 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1A1
; Address: $CF927B
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1A1:
    JSR $931E            ; 20 1E 93 | Jump to subroutine
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF A1 97 C7 | Load from absolute long,X into accumulator
    STA $18              ; 85 18 | Store accumulator to zero page
    LDA                  ; BF 81 98 C7 | Load from absolute long,X into accumulator
    STA $1A              ; 85 1A | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1A2
; Address: $CF928D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1A2:
    JSR $932B            ; 20 2B 93 | Jump to subroutine
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    DEY                  ; 88 | Decrement Y register
    BNE $DD              ; D0 DD | Branch if not equal
    BRA $D0              ; 80 D0 | Branch always

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1A3
; Address: $CF929A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1A3:
    JSR $92AD            ; 20 AD 92 | Jump to subroutine
    LDA                  ; BF A5 96 C7 | Load from absolute long,X into accumulator
    STA $18              ; 85 18 | Store accumulator to zero page
    LDA                  ; BF B3 96 C7 | Load from absolute long,X into accumulator
    STA $1A              ; 85 1A | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1A5
; Address: $CF92AD
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1A5:
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    LDX $352C            ; AE 2C 35 | Load from absolute address into X register
    CPX #$18             ; E0 18 | Compare X register (immediate)
    BCC $1F              ; 90 1F | Branch if carry clear
    INC                  ; 1A | Increment accumulator
    CPX #$50             ; E0 50 | Compare X register (immediate)
    BCC $19              ; 90 19 | Branch if carry clear
    INC                  ; 1A | Increment accumulator
    CPX #$70             ; E0 70 | Compare X register (immediate)
    BCC $13              ; 90 13 | Branch if carry clear
    INC                  ; 1A | Increment accumulator
    CPX #$90             ; E0 90 | Compare X register (immediate)
    BCC $0D              ; 90 0D | Branch if carry clear
    INC                  ; 1A | Increment accumulator
    CPX #$B0             ; E0 B0 | Compare X register (immediate)
    BCC $07              ; 90 07 | Branch if carry clear
    INC                  ; 1A | Increment accumulator
    CPX #$D0             ; E0 D0 | Compare X register (immediate)
    BCC $01              ; 90 01 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1A6
; Address: $CF92D6
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1A6:
    INC                  ; 1A | Increment accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1A7
; Address: $CF92DA
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1A7:
    LDY $DAA5            ; AC A5 DA | Load from absolute address into Y register
    LDA $C3E5,Y          ; B9 E5 C3 | Load from absolute,Y into accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BRA $F0              ; 80 F0 | Branch always
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    LDX $352C            ; AE 2C 35 | Load from absolute address into X register
    CPX #$17             ; E0 17 | Compare X register (immediate)
    BEQ $26              ; F0 26 | Branch if equal
    INC                  ; 1A | Increment accumulator
    CPX #$4F             ; E0 4F | Compare X register (immediate)
    BEQ $20              ; F0 20 | Branch if equal
    INC                  ; 1A | Increment accumulator
    CPX #$6F             ; E0 6F | Compare X register (immediate)
    BEQ $1A              ; F0 1A | Branch if equal
    INC                  ; 1A | Increment accumulator
    CPX #$8F             ; E0 8F | Compare X register (immediate)
    BEQ $14              ; F0 14 | Branch if equal
    INC                  ; 1A | Increment accumulator
    CPX #$AF             ; E0 AF | Compare X register (immediate)
    BEQ $0E              ; F0 0E | Branch if equal
    INC                  ; 1A | Increment accumulator
    CPX #$CF             ; E0 CF | Compare X register (immediate)
    BEQ $08              ; F0 08 | Branch if equal
    INC                  ; 1A | Increment accumulator
    CPX #$EF             ; E0 EF | Compare X register (immediate)
    BEQ $02              ; F0 02 | Branch if equal
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1A8
; Address: $CF9316
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1A8:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1AC
; Address: $CF932B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1AC:
    LDX $997F            ; AE 7F 99 | Load from absolute address into X register
    BMI $39              ; 30 39 | Branch if negative
    LDA $8AE2,X          ; BD E2 8A | Load from absolute,X into accumulator
    TAX                  ; AA | Transfer accumulator to X register
    LDA $8B9E,X          ; BD 9E 8B | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1AD
; Address: $CF9337
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1AD:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ADC #$FE             ; 69 FE | Add with carry (immediate)
    ADC $88FE            ; 6D FE 88 | Add with carry (absolute)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $8B7E,X          ; BD 7E 8B | Load from absolute,X into accumulator
    STA $00              ; 85 00 | Store accumulator to zero page
    LDA $8B8E,X          ; BD 8E 8B | Load from absolute,X into accumulator
    STA $02              ; 85 02 | Store accumulator to zero page
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $1C              ; 85 1C | Store accumulator to zero page
    LDA $18              ; A5 18 | Load from zero page into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1AE
; Address: $CF9359
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1AE:
    JSR $936A            ; 20 6A 93 | Jump to subroutine
    LDA $1C              ; A5 1C | Load from zero page into accumulator
    BMI $09              ; 30 09 | Branch if negative
    LDA $1A              ; A5 1A | Load from zero page into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1B0
; Address: $CF936A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1B0:
    TAX                  ; AA | Transfer accumulator to X register
    DEC $1C              ; C6 1C | Decrement (zero page)
    BMI $50              ; 30 50 | Branch if negative
    LDA                  ; BF 45 EB F5 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1B1
; Address: $CF9373
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1B1:
    JSR $93C0            ; 20 C0 93 | Jump to subroutine
    DEC $1C              ; C6 1C | Decrement (zero page)
    BMI $45              ; 30 45 | Branch if negative
    LDA                  ; BF 47 EB F5 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1B2
; Address: $CF937E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1B2:
    JSR $93C0            ; 20 C0 93 | Jump to subroutine
    DEC $1C              ; C6 1C | Decrement (zero page)
    BMI $3A              ; 30 3A | Branch if negative
    LDA                  ; BF 49 EB F5 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1B3
; Address: $CF9389
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1B3:
    JSR $93C0            ; 20 C0 93 | Jump to subroutine
    DEC $1C              ; C6 1C | Decrement (zero page)
    BMI $2F              ; 30 2F | Branch if negative
    LDA                  ; BF 4B EB F5 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1B4
; Address: $CF9394
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1B4:
    JSR $93C0            ; 20 C0 93 | Jump to subroutine
    DEC $1C              ; C6 1C | Decrement (zero page)
    BMI $24              ; 30 24 | Branch if negative
    LDA                  ; BF 4D EB F5 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1B7
; Address: $CF93AA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1B7:
    JSR $93C0            ; 20 C0 93 | Jump to subroutine
    DEC $1C              ; C6 1C | Decrement (zero page)
    BMI $0E              ; 30 0E | Branch if negative

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1B8
; Address: $CF93B1
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1B8:
    JSR $93C0            ; 20 C0 93 | Jump to subroutine
    DEC $1C              ; C6 1C | Decrement (zero page)
    BMI $07              ; 30 07 | Branch if negative
    LDA                  ; BF 53 EB F5 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1BB
; Address: $CF93C1
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1BB:
    JSL $C041E0          ; 22 E0 41 C0 | Jump to subroutine long
    TYA                  ; 98 | Transfer Y register to accumulator
    CLC                  ; 18 | Clear carry flag
    ADC #$20             ; 69 20 | Add with carry (immediate)
    TAY                  ; A8 | Transfer accumulator to Y register
    PLX                  ; FA | Pull X register from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1BC
; Address: $CF93E4
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1BC:
    ORA ($23,X)          ; 01 23 | Logical OR with accumulator ((zero page,X))
    ORA ($43,X)          ; 01 43 | Logical OR with accumulator ((zero page,X))
    ORA ($84,X)          ; 01 84 | Logical OR with accumulator ((zero page,X))
    LDY $00              ; A4 00 | Load from zero page into Y register
    CPY $00              ; C4 00 | Compare Y register (zero page)
    CPX $00              ; E4 00 | Compare X register (zero page)
    ORA ($24,X)          ; 01 24 | Logical OR with accumulator ((zero page,X))
    ORA ($44,X)          ; 01 44 | Logical OR with accumulator ((zero page,X))
    ORA ($14,X)          ; 01 14 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ORA $1A00,Y          ; 19 00 1A | Logical OR with accumulator (absolute,Y)
    ORA $1E00,X          ; 1D 00 1E | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1BE
; Address: $CF9413
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1BE:
    JSL $002300          ; 22 00 23 00 | Jump to subroutine long
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    ROL $00              ; 26 00 | Rotate left (zero page)
    PLP                  ; 28 | Pull processor status from stack
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ROL                  ; 2A | Rotate left (accumulator)
    BIT $2D00            ; 2C 00 2D | Test bits in accumulator (absolute)
    ROL $2F00            ; 2E 00 2F | Rotate left (absolute)
    BMI $00              ; 30 00 | Branch if negative
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    AND $3A00,Y          ; 39 00 3A | Logical AND with accumulator (absolute,Y)
    AND $3E00,X          ; 3D 00 3E | Logical AND with accumulator (absolute,X)
    RTI                  ; 40 | Return from interrupt
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    WDM #$00             ; 42 00 | Reserved instruction
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1BF
; Address: $CF945B
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1BF:
    LSR $00              ; 46 00 | Logical shift right (zero page)
    PHA                  ; 48 | Push accumulator to stack
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    LSR                  ; 4A | Logical shift right (accumulator)
    JMP $4D00            ; 4C 00 4D | Jump to address
    LSR $4F00            ; 4E 00 4F | Logical shift right (absolute)
    BVC $00              ; 50 00 | Branch if overflow clear
    EOR ($00),Y          ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
    CLI                  ; 58 | Clear interrupt disable flag
    EOR $5A00,Y          ; 59 00 5A | Exclusive OR with accumulator (absolute,Y)
    JMP $005D00          ; 5C 00 5D 00 | Jump to address long
    LSR $5F00,X          ; 5E 00 5F | Logical shift right (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1C0
; Address: $CF9491
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1C0:
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    STZ $00              ; 64 00 | Store zero to zero page
    ADC $00              ; 65 00 | Add with carry (zero page)
    ROR $00              ; 66 00 | Rotate right (zero page)
    PLA                  ; 68 | Pull accumulator from stack
    ADC #$00             ; 69 00 | Add with carry (immediate)
    ROR                  ; 6A | Rotate right (accumulator)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1C1
; Address: $CF94A7
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1C1:
    JMP ($6D00)          ; 6C 00 6D | Jump to address (absolute indirect)
    ROR $6F00            ; 6E 00 6F | Rotate right (absolute)
    BVS $00              ; 70 00 | Branch if overflow set
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    SEI                  ; 78 | Set interrupt disable flag
    ADC $7A00,Y          ; 79 00 7A | Add with carry (absolute,Y)
    ADC $7E00,X          ; 7D 00 7E | Add with carry (absolute,X)
    BRA $00              ; 80 00 | Branch always
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    STA $00              ; 85 00 | Store accumulator to zero page
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    PHB                  ; 8B | Push data bank register to stack
    STA $8F00            ; 8D 00 8F | Store accumulator to absolute address
    STA ($00),Y          ; 91 00 | Store accumulator to (zero page),Y
    STA $9B00,Y          ; 99 00 9B | Store accumulator to absolute,Y
    STA $9F00,X          ; 9D 00 9F | Store accumulator to absolute,X
    LDA ($00,X)          ; A1 00 | Load from (zero page,X) into accumulator
    LDA $00              ; A5 00 | Load from zero page into accumulator
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    PLB                  ; AB | Pull data bank register from stack
    LDA $AF00            ; AD 00 AF | Load from absolute address into accumulator
    LDA ($00),Y          ; B1 00 | Load from (zero page),Y into accumulator
    LDA $BB00,Y          ; B9 00 BB | Load from absolute,Y into accumulator
    LDA $BF00,X          ; BD 00 BF | Load from absolute,X into accumulator
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    CMP $00              ; C5 00 | Compare accumulator (zero page)
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    CMP $CF00            ; CD 00 CF | Compare accumulator (absolute)
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1C2
; Address: $CF952B
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1C2:
    CMP $DB00,Y          ; D9 00 DB | Compare accumulator (absolute,Y)
    CMP $DF00,X          ; DD 00 DF | Compare accumulator (absolute,X)
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    SBC $00              ; E5 00 | Subtract with carry (zero page)
    SBC #$00             ; E9 00 | Subtract with carry (immediate)
    XBA                  ; EB | Exchange accumulator bytes
    SBC $EF00            ; ED 00 EF | Subtract with carry (absolute)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    SBC $FB00,Y          ; F9 00 FB | Subtract with carry (absolute,Y)
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    ORA ($0B,X)          ; 01 0B | Logical OR with accumulator ((zero page,X))
    ORA ($0D,X)          ; 01 0D | Logical OR with accumulator ((zero page,X))
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ORA ($11,X)          ; 01 11 | Logical OR with accumulator ((zero page,X))
    ORA ($13,X)          ; 01 13 | Logical OR with accumulator ((zero page,X))
    ORA ($15,X)          ; 01 15 | Logical OR with accumulator ((zero page,X))
    ORA ($17,X)          ; 01 17 | Logical OR with accumulator ((zero page,X))
    ORA ($19,X)          ; 01 19 | Logical OR with accumulator ((zero page,X))
    ORA ($1B,X)          ; 01 1B | Logical OR with accumulator ((zero page,X))
    ORA ($1D,X)          ; 01 1D | Logical OR with accumulator ((zero page,X))
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    ORA ($21,X)          ; 01 21 | PPU graphics register access
    ORA ($23,X)          ; 01 23 | Logical OR with accumulator ((zero page,X))
    ORA ($25,X)          ; 01 25 | Logical OR with accumulator ((zero page,X))
    ORA ($27,X)          ; 01 27 | Logical OR with accumulator ((zero page,X))
    ORA ($29,X)          ; 01 29 | Logical OR with accumulator ((zero page,X))
    ORA ($2B,X)          ; 01 2B | Logical OR with accumulator ((zero page,X))
    ORA ($2D,X)          ; 01 2D | Logical OR with accumulator ((zero page,X))
    ORA ($2F,X)          ; 01 2F | Logical OR with accumulator ((zero page,X))
    ORA ($31,X)          ; 01 31 | Logical OR with accumulator ((zero page,X))
    ORA ($33,X)          ; 01 33 | Logical OR with accumulator ((zero page,X))
    ORA ($35,X)          ; 01 35 | Logical OR with accumulator ((zero page,X))
    ORA ($37,X)          ; 01 37 | Logical OR with accumulator ((zero page,X))
    ORA ($39,X)          ; 01 39 | Logical OR with accumulator ((zero page,X))
    ORA ($3B,X)          ; 01 3B | Logical OR with accumulator ((zero page,X))
    ORA ($3D,X)          ; 01 3D | Logical OR with accumulator ((zero page,X))
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    ORA ($41,X)          ; 01 41 | Logical OR with accumulator ((zero page,X))
    ORA ($43,X)          ; 01 43 | Logical OR with accumulator ((zero page,X))
    ORA ($45,X)          ; 01 45 | Logical OR with accumulator ((zero page,X))
    ORA ($47,X)          ; 01 47 | Logical OR with accumulator ((zero page,X))
    ORA ($49,X)          ; 01 49 | Logical OR with accumulator ((zero page,X))
    ORA ($4B,X)          ; 01 4B | Logical OR with accumulator ((zero page,X))
    ORA ($4D,X)          ; 01 4D | Logical OR with accumulator ((zero page,X))
    ORA ($4F,X)          ; 01 4F | Logical OR with accumulator ((zero page,X))
    ORA ($51,X)          ; 01 51 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1C3
; Address: $CF95A4
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1C3:
    ORA ($53,X)          ; 01 53 | Logical OR with accumulator ((zero page,X))
    ORA ($55,X)          ; 01 55 | Logical OR with accumulator ((zero page,X))
    ORA ($57,X)          ; 01 57 | Logical OR with accumulator ((zero page,X))
    ORA ($59,X)          ; 01 59 | Logical OR with accumulator ((zero page,X))
    ORA ($5B,X)          ; 01 5B | Logical OR with accumulator ((zero page,X))
    ORA ($5D,X)          ; 01 5D | Logical OR with accumulator ((zero page,X))
    ORA ($5F,X)          ; 01 5F | Logical OR with accumulator ((zero page,X))
    ORA ($61,X)          ; 01 61 | Logical OR with accumulator ((zero page,X))
    ORA ($83,X)          ; 01 83 | Logical OR with accumulator ((zero page,X))
    STX $00              ; 86 00 | Store X register to zero page
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    STY $8E00            ; 8C 00 8E | Store Y register to absolute address
    BCC $00              ; 90 00 | Branch if carry clear
    TYA                  ; 98 | Transfer Y register to accumulator
    TXS                  ; 9A | Transfer X register to stack pointer
    STZ $9E00            ; 9C 00 9E | Store zero to absolute
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY $00              ; A4 00 | Load from zero page into Y register
    LDX $00              ; A6 00 | Load from zero page into X register
    TAY                  ; A8 | Transfer accumulator to Y register
    TAX                  ; AA | Transfer accumulator to X register
    LDY $AE00            ; AC 00 AE | Load from absolute address into Y register
    BCS $00              ; B0 00 | Branch if carry set
    CLV                  ; B8 | Clear overflow flag
    TSX                  ; BA | Transfer stack pointer to X register
    LDY $BE00,X          ; BC 00 BE | Load from absolute,X into Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    REP #$00             ; C2 00 | Reset processor status bits
    CPY $00              ; C4 00 | Compare Y register (zero page)
    DEC $00              ; C6 00 | Decrement (zero page)
    INY                  ; C8 | Increment Y register
    DEX                  ; CA | Decrement X register
    CPY $CE00            ; CC 00 CE | Compare Y register (absolute)
    BNE $00              ; D0 00 | Branch if not equal
    CLD                  ; D8 | Clear decimal mode flag
    PHX                  ; DA | Push X register to stack
    DEC $E000,X          ; DE 00 E0 | Game work RAM access
    SEP #$00             ; E2 00 | Set processor status bits
    CPX $00              ; E4 00 | Compare X register (zero page)
    INC $00              ; E6 00 | Increment (zero page)
    INX                  ; E8 | Increment X register
    NOP                  ; EA | No operation
    CPX $EE00            ; EC 00 EE | Compare X register (absolute)
    BEQ $00              ; F0 00 | Branch if equal
    PEA #$F600           ; F4 00 F6 | Push effective address to stack
    SED                  ; F8 | Set decimal mode flag
    PLX                  ; FA | Pull X register from stack
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1C4
; Address: $CF9632
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1C4:
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    ORA ($12,X)          ; 01 12 | Logical OR with accumulator ((zero page,X))
    ORA ($14,X)          ; 01 14 | Logical OR with accumulator ((zero page,X))
    ORA ($16,X)          ; 01 16 | Logical OR with accumulator ((zero page,X))
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($1C,X)          ; 01 1C | Logical OR with accumulator ((zero page,X))
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA ($24,X)          ; 01 24 | Logical OR with accumulator ((zero page,X))
    ORA ($26,X)          ; 01 26 | Logical OR with accumulator ((zero page,X))
    ORA ($28,X)          ; 01 28 | Logical OR with accumulator ((zero page,X))
    ORA ($2A,X)          ; 01 2A | Logical OR with accumulator ((zero page,X))
    ORA ($2C,X)          ; 01 2C | Logical OR with accumulator ((zero page,X))
    ORA ($2E,X)          ; 01 2E | Logical OR with accumulator ((zero page,X))
    ORA ($30,X)          ; 01 30 | Logical OR with accumulator ((zero page,X))
    ORA ($32,X)          ; 01 32 | Logical OR with accumulator ((zero page,X))
    ORA ($34,X)          ; 01 34 | Logical OR with accumulator ((zero page,X))
    ORA ($36,X)          ; 01 36 | Logical OR with accumulator ((zero page,X))
    ORA ($38,X)          ; 01 38 | Logical OR with accumulator ((zero page,X))
    ORA ($3A,X)          ; 01 3A | Logical OR with accumulator ((zero page,X))
    ORA ($3C,X)          ; 01 3C | Logical OR with accumulator ((zero page,X))
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    ORA ($40,X)          ; 01 40 | Logical OR with accumulator ((zero page,X))
    ORA ($42,X)          ; 01 42 | Hardware register operation
    ORA ($44,X)          ; 01 44 | Logical OR with accumulator ((zero page,X))
    ORA ($46,X)          ; 01 46 | Logical OR with accumulator ((zero page,X))
    ORA ($48,X)          ; 01 48 | Logical OR with accumulator ((zero page,X))
    ORA ($4A,X)          ; 01 4A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    ORA ($4E,X)          ; 01 4E | Logical OR with accumulator ((zero page,X))
    ORA ($50,X)          ; 01 50 | Logical OR with accumulator ((zero page,X))
    ORA ($52,X)          ; 01 52 | Logical OR with accumulator ((zero page,X))
    ORA ($54,X)          ; 01 54 | Logical OR with accumulator ((zero page,X))
    ORA ($56,X)          ; 01 56 | Logical OR with accumulator ((zero page,X))
    ORA ($58,X)          ; 01 58 | Logical OR with accumulator ((zero page,X))
    ORA ($5A,X)          ; 01 5A | Logical OR with accumulator ((zero page,X))
    ORA ($5C,X)          ; 01 5C | Logical OR with accumulator ((zero page,X))
    ORA ($5E,X)          ; 01 5E | Logical OR with accumulator ((zero page,X))
    ORA ($60,X)          ; 01 60 | Logical OR with accumulator ((zero page,X))
    ORA ($62,X)          ; 01 62 | Logical OR with accumulator ((zero page,X))
    ORA ($84,X)          ; 01 84 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1C5
; Address: $CF9697
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1C5:
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA ($23,X)          ; 01 23 | Logical OR with accumulator ((zero page,X))
    ORA ($43,X)          ; 01 43 | Logical OR with accumulator ((zero page,X))
    ORA ($84,X)          ; 01 84 | Logical OR with accumulator ((zero page,X))
    LDY $00              ; A4 00 | Load from zero page into Y register
    CPY $00              ; C4 00 | Compare Y register (zero page)
    CPX $00              ; E4 00 | Compare X register (zero page)
    ORA ($24,X)          ; 01 24 | Logical OR with accumulator ((zero page,X))
    ORA ($44,X)          ; 01 44 | Logical OR with accumulator ((zero page,X))
    ORA ($14,X)          ; 01 14 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ORA $1A00,Y          ; 19 00 1A | Logical OR with accumulator (absolute,Y)
    ORA $1E00,X          ; 1D 00 1E | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1C7
; Address: $CF96DD
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1C7:
    JSL $002300          ; 22 00 23 00 | Jump to subroutine long
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    ROL $00              ; 26 00 | Rotate left (zero page)
    PLP                  ; 28 | Pull processor status from stack
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ROL                  ; 2A | Rotate left (accumulator)
    BIT $2D00            ; 2C 00 2D | Test bits in accumulator (absolute)
    ROL $2F00            ; 2E 00 2F | Rotate left (absolute)
    BMI $00              ; 30 00 | Branch if negative
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    AND $3A00,Y          ; 39 00 3A | Logical AND with accumulator (absolute,Y)
    AND $3E00,X          ; 3D 00 3E | Logical AND with accumulator (absolute,X)
    RTI                  ; 40 | Return from interrupt
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    WDM #$00             ; 42 00 | Reserved instruction
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    PHA                  ; 48 | Push accumulator to stack
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    LSR                  ; 4A | Logical shift right (accumulator)
    JMP $4D00            ; 4C 00 4D | Jump to address
    LSR $4F00            ; 4E 00 4F | Logical shift right (absolute)
    BVC $00              ; 50 00 | Branch if overflow clear
    EOR ($00),Y          ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
    CLI                  ; 58 | Clear interrupt disable flag
    EOR $5A00,Y          ; 59 00 5A | Exclusive OR with accumulator (absolute,Y)
    JMP $005D00          ; 5C 00 5D 00 | Jump to address long
    LSR $5F00,X          ; 5E 00 5F | Logical shift right (absolute,X)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1C9
; Address: $CF975B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1C9:
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    STZ $00              ; 64 00 | Store zero to zero page
    ADC $00              ; 65 00 | Add with carry (zero page)
    ROR $00              ; 66 00 | Rotate right (zero page)
    PLA                  ; 68 | Pull accumulator from stack
    ADC #$00             ; 69 00 | Add with carry (immediate)
    ROR                  ; 6A | Rotate right (accumulator)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1CA
; Address: $CF9771
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1CA:
    JMP ($6D00)          ; 6C 00 6D | Jump to address (absolute indirect)
    ROR $6F00            ; 6E 00 6F | Rotate right (absolute)
    BVS $00              ; 70 00 | Branch if overflow set
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    SEI                  ; 78 | Set interrupt disable flag
    ADC $7A00,Y          ; 79 00 7A | Add with carry (absolute,Y)
    ADC $7E00,X          ; 7D 00 7E | Add with carry (absolute,X)
    BRA $00              ; 80 00 | Branch always
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    STA $00              ; 85 00 | Store accumulator to zero page
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    PHB                  ; 8B | Push data bank register to stack
    STA $8F00            ; 8D 00 8F | Store accumulator to absolute address
    STA ($00),Y          ; 91 00 | Store accumulator to (zero page),Y
    STA $9B00,Y          ; 99 00 9B | Store accumulator to absolute,Y
    STA $9F00,X          ; 9D 00 9F | Store accumulator to absolute,X
    LDA ($00,X)          ; A1 00 | Load from (zero page,X) into accumulator
    LDA $00              ; A5 00 | Load from zero page into accumulator
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    PLB                  ; AB | Pull data bank register from stack
    LDA $AF00            ; AD 00 AF | Load from absolute address into accumulator
    LDA ($00),Y          ; B1 00 | Load from (zero page),Y into accumulator
    LDA $BB00,Y          ; B9 00 BB | Load from absolute,Y into accumulator
    LDA $BF00,X          ; BD 00 BF | Load from absolute,X into accumulator
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    CMP $00              ; C5 00 | Compare accumulator (zero page)
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    CMP $CF00            ; CD 00 CF | Compare accumulator (absolute)
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    CMP $DB00,Y          ; D9 00 DB | Compare accumulator (absolute,Y)
    CMP $DF00,X          ; DD 00 DF | Compare accumulator (absolute,X)
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    SBC $00              ; E5 00 | Subtract with carry (zero page)
    SBC #$00             ; E9 00 | Subtract with carry (immediate)
    XBA                  ; EB | Exchange accumulator bytes
    SBC $EF00            ; ED 00 EF | Subtract with carry (absolute)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    SBC $FB00,Y          ; F9 00 FB | Subtract with carry (absolute,Y)
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1CB
; Address: $CF9822
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1CB:
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    ORA ($0B,X)          ; 01 0B | Logical OR with accumulator ((zero page,X))
    ORA ($0D,X)          ; 01 0D | Logical OR with accumulator ((zero page,X))
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ORA ($11,X)          ; 01 11 | Logical OR with accumulator ((zero page,X))
    ORA ($13,X)          ; 01 13 | Logical OR with accumulator ((zero page,X))
    ORA ($15,X)          ; 01 15 | Logical OR with accumulator ((zero page,X))
    ORA ($17,X)          ; 01 17 | Logical OR with accumulator ((zero page,X))
    ORA ($19,X)          ; 01 19 | Logical OR with accumulator ((zero page,X))
    ORA ($1B,X)          ; 01 1B | Logical OR with accumulator ((zero page,X))
    ORA ($1D,X)          ; 01 1D | Logical OR with accumulator ((zero page,X))
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    ORA ($21,X)          ; 01 21 | PPU graphics register access
    ORA ($23,X)          ; 01 23 | Logical OR with accumulator ((zero page,X))
    ORA ($25,X)          ; 01 25 | Logical OR with accumulator ((zero page,X))
    ORA ($27,X)          ; 01 27 | Logical OR with accumulator ((zero page,X))
    ORA ($29,X)          ; 01 29 | Logical OR with accumulator ((zero page,X))
    ORA ($2B,X)          ; 01 2B | Logical OR with accumulator ((zero page,X))
    ORA ($2D,X)          ; 01 2D | Logical OR with accumulator ((zero page,X))
    ORA ($2F,X)          ; 01 2F | Logical OR with accumulator ((zero page,X))
    ORA ($31,X)          ; 01 31 | Logical OR with accumulator ((zero page,X))
    ORA ($33,X)          ; 01 33 | Logical OR with accumulator ((zero page,X))
    ORA ($35,X)          ; 01 35 | Logical OR with accumulator ((zero page,X))
    ORA ($37,X)          ; 01 37 | Logical OR with accumulator ((zero page,X))
    ORA ($39,X)          ; 01 39 | Logical OR with accumulator ((zero page,X))
    ORA ($3B,X)          ; 01 3B | Logical OR with accumulator ((zero page,X))
    ORA ($3D,X)          ; 01 3D | Logical OR with accumulator ((zero page,X))
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    ORA ($41,X)          ; 01 41 | Logical OR with accumulator ((zero page,X))
    ORA ($43,X)          ; 01 43 | Logical OR with accumulator ((zero page,X))
    ORA ($45,X)          ; 01 45 | Logical OR with accumulator ((zero page,X))
    ORA ($47,X)          ; 01 47 | Logical OR with accumulator ((zero page,X))
    ORA ($49,X)          ; 01 49 | Logical OR with accumulator ((zero page,X))
    ORA ($4B,X)          ; 01 4B | Logical OR with accumulator ((zero page,X))
    ORA ($4D,X)          ; 01 4D | Logical OR with accumulator ((zero page,X))
    ORA ($4F,X)          ; 01 4F | Logical OR with accumulator ((zero page,X))
    ORA ($51,X)          ; 01 51 | Logical OR with accumulator ((zero page,X))
    ORA ($53,X)          ; 01 53 | Logical OR with accumulator ((zero page,X))
    ORA ($55,X)          ; 01 55 | Logical OR with accumulator ((zero page,X))
    ORA ($57,X)          ; 01 57 | Logical OR with accumulator ((zero page,X))
    ORA ($59,X)          ; 01 59 | Logical OR with accumulator ((zero page,X))
    ORA ($5B,X)          ; 01 5B | Logical OR with accumulator ((zero page,X))
    ORA ($5D,X)          ; 01 5D | Logical OR with accumulator ((zero page,X))
    ORA ($5F,X)          ; 01 5F | Logical OR with accumulator ((zero page,X))
    ORA ($61,X)          ; 01 61 | Logical OR with accumulator ((zero page,X))
    ORA ($83,X)          ; 01 83 | Logical OR with accumulator ((zero page,X))
    STX $00              ; 86 00 | Store X register to zero page
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1CC
; Address: $CF9887
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1CC:
    STY $8E00            ; 8C 00 8E | Store Y register to absolute address
    BCC $00              ; 90 00 | Branch if carry clear
    TYA                  ; 98 | Transfer Y register to accumulator
    TXS                  ; 9A | Transfer X register to stack pointer
    STZ $9E00            ; 9C 00 9E | Store zero to absolute
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY $00              ; A4 00 | Load from zero page into Y register
    LDX $00              ; A6 00 | Load from zero page into X register
    TAY                  ; A8 | Transfer accumulator to Y register
    TAX                  ; AA | Transfer accumulator to X register
    LDY $AE00            ; AC 00 AE | Load from absolute address into Y register
    BCS $00              ; B0 00 | Branch if carry set
    CLV                  ; B8 | Clear overflow flag
    TSX                  ; BA | Transfer stack pointer to X register
    LDY $BE00,X          ; BC 00 BE | Load from absolute,X into Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    REP #$00             ; C2 00 | Reset processor status bits
    CPY $00              ; C4 00 | Compare Y register (zero page)
    DEC $00              ; C6 00 | Decrement (zero page)
    INY                  ; C8 | Increment Y register
    DEX                  ; CA | Decrement X register
    CPY $CE00            ; CC 00 CE | Compare Y register (absolute)
    BNE $00              ; D0 00 | Branch if not equal
    CLD                  ; D8 | Clear decimal mode flag
    PHX                  ; DA | Push X register to stack
    DEC $E000,X          ; DE 00 E0 | Game work RAM access
    SEP #$00             ; E2 00 | Set processor status bits
    CPX $00              ; E4 00 | Compare X register (zero page)
    INC $00              ; E6 00 | Increment (zero page)
    INX                  ; E8 | Increment X register
    NOP                  ; EA | No operation
    CPX $EE00            ; EC 00 EE | Compare X register (absolute)
    BEQ $00              ; F0 00 | Branch if equal
    PEA #$F600           ; F4 00 F6 | Push effective address to stack
    SED                  ; F8 | Set decimal mode flag
    PLX                  ; FA | Pull X register from stack
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    ORA ($12,X)          ; 01 12 | Logical OR with accumulator ((zero page,X))
    ORA ($14,X)          ; 01 14 | Logical OR with accumulator ((zero page,X))
    ORA ($16,X)          ; 01 16 | Logical OR with accumulator ((zero page,X))
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1CD
; Address: $CF9914
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1CD:
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($1C,X)          ; 01 1C | Logical OR with accumulator ((zero page,X))
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA ($24,X)          ; 01 24 | Logical OR with accumulator ((zero page,X))
    ORA ($26,X)          ; 01 26 | Logical OR with accumulator ((zero page,X))
    ORA ($28,X)          ; 01 28 | Logical OR with accumulator ((zero page,X))
    ORA ($2A,X)          ; 01 2A | Logical OR with accumulator ((zero page,X))
    ORA ($2C,X)          ; 01 2C | Logical OR with accumulator ((zero page,X))
    ORA ($2E,X)          ; 01 2E | Logical OR with accumulator ((zero page,X))
    ORA ($30,X)          ; 01 30 | Logical OR with accumulator ((zero page,X))
    ORA ($32,X)          ; 01 32 | Logical OR with accumulator ((zero page,X))
    ORA ($34,X)          ; 01 34 | Logical OR with accumulator ((zero page,X))
    ORA ($36,X)          ; 01 36 | Logical OR with accumulator ((zero page,X))
    ORA ($38,X)          ; 01 38 | Logical OR with accumulator ((zero page,X))
    ORA ($3A,X)          ; 01 3A | Logical OR with accumulator ((zero page,X))
    ORA ($3C,X)          ; 01 3C | Logical OR with accumulator ((zero page,X))
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    ORA ($40,X)          ; 01 40 | Logical OR with accumulator ((zero page,X))
    ORA ($42,X)          ; 01 42 | Hardware register operation
    ORA ($44,X)          ; 01 44 | Logical OR with accumulator ((zero page,X))
    ORA ($46,X)          ; 01 46 | Logical OR with accumulator ((zero page,X))
    ORA ($48,X)          ; 01 48 | Logical OR with accumulator ((zero page,X))
    ORA ($4A,X)          ; 01 4A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    ORA ($4E,X)          ; 01 4E | Logical OR with accumulator ((zero page,X))
    ORA ($50,X)          ; 01 50 | Logical OR with accumulator ((zero page,X))
    ORA ($52,X)          ; 01 52 | Logical OR with accumulator ((zero page,X))
    ORA ($54,X)          ; 01 54 | Logical OR with accumulator ((zero page,X))
    ORA ($56,X)          ; 01 56 | Logical OR with accumulator ((zero page,X))
    ORA ($58,X)          ; 01 58 | Logical OR with accumulator ((zero page,X))
    ORA ($5A,X)          ; 01 5A | Logical OR with accumulator ((zero page,X))
    ORA ($5C,X)          ; 01 5C | Logical OR with accumulator ((zero page,X))
    ORA ($5E,X)          ; 01 5E | Logical OR with accumulator ((zero page,X))
    ORA ($60,X)          ; 01 60 | Logical OR with accumulator ((zero page,X))
    ORA ($62,X)          ; 01 62 | Logical OR with accumulator ((zero page,X))
    ORA ($84,X)          ; 01 84 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1D0
; Address: $CF996B
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1D0:
    JMP $C3EC84          ; 5C 84 EC C3 | Jump to address long
    JMP $C3EFBE          ; 5C BE EF C3 | Jump to address long
    JMP $C3EE64          ; 5C 64 EE C3 | Jump to address long
    JMP $C68836          ; 5C 36 88 C6 | Jump to address long
    JMP $C3EF37          ; 5C 37 EF C3 | Jump to address long
    JMP $C3EF9D          ; 5C 9D EF C3 | Jump to address long
    JMP $C3EF9E          ; 5C 9E EF C3 | Jump to address long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1D9
; Address: $CF99AA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1D9:
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $DA65,X          ; BD 65 DA | Load from absolute,X into accumulator
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    BEQ $07              ; F0 07 | Branch if equal
    PHX                  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1DA
; Address: $CF99B6
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1DA:
    JSR $99CC            ; 20 CC 99 | Jump to subroutine
    PLX                  ; FA | Pull X register from stack
    BCS $09              ; B0 09 | Branch if carry set
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$40             ; E0 40 | Compare X register (immediate)
    BCC $EA              ; 90 EA | Branch if carry clear
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1DB
; Address: $CF99C5
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1DB:
    TXA                  ; 8A | Transfer X register to accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    STA $C193            ; 8D 93 C1 | Store accumulator to absolute address
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1DC
; Address: $CF99CC
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1DC:
    PHB                  ; 8B | Push data bank register to stack
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    LDY $7F2A            ; AC 2A 7F | Load from absolute address into Y register
    LDA $D765,Y          ; B9 65 D7 | Load from absolute,Y into accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    PLA                  ; 68 | Pull accumulator from stack
    LDA $CFA5,Y          ; B9 A5 CF | Load from absolute,Y into accumulator
    AND #$06             ; 29 06 | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF 20 9A C7 | Load from absolute long,X into accumulator
    PHA                  ; 48 | Push accumulator to stack
    TAX                  ; AA | Transfer accumulator to X register
    LDA $C725,X          ; BD 25 C7 | Load from absolute,X into accumulator
    SEC                  ; 38 | Set carry flag
    SBC $C725,Y          ; F9 25 C7 | Subtract with carry (absolute,Y)
    STA $18              ; 85 18 | Store accumulator to zero page
    LDA $C765,X          ; BD 65 C7 | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1DD
; Address: $CF99F2
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1DD:
    SEC                  ; 38 | Set carry flag
    SBC $C765,Y          ; F9 65 C7 | Subtract with carry (absolute,Y)
    STA $1A              ; 85 1A | Store accumulator to zero page
    ORA ($AA,X)          ; 01 AA | Logical OR with accumulator ((zero page,X))
    PLB                  ; AB | Pull data bank register from stack
    LDA $0000,X          ; BD 00 00 | Load from absolute,X into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BRA $F0              ; 80 F0 | Branch always
    ORA ($C5),Y          ; 11 C5 | Logical OR with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    BNE $07              ; D0 07 | Branch if not equal
    LDA $0002,X          ; BD 02 00 | Load from absolute,X into accumulator
    CMP $1A              ; C5 1A | Compare accumulator (zero page)
    BEQ $0B              ; F0 0B | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    BRA $E7              ; 80 E7 | Branch always
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLB                  ; AB | Pull data bank register from stack
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1DE
; Address: $CF9A1B
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1DE:
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLB                  ; AB | Pull data bank register from stack
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1DF
; Address: $CF9A20
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1DF:
    PLP                  ; 28 | Pull processor status from stack
    TXS                  ; 9A | Transfer X register to stack pointer
    TXS                  ; 9A | Transfer X register to stack pointer
    JMP $9A6A9A          ; 5C 9A 6A 9A | Jump to address long
    INC $00FF,X          ; FE FF 00 | Increment (absolute,X)
    SBC $00FF,X          ; FD FF 00 | Subtract with carry (absolute,X)
    BRA $02              ; 80 02 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    BRA $FE              ; 80 FE | Branch always
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    INC $01FF,X          ; FE FF 01 | Increment (absolute,X)
    SBC $00FF,X          ; FD FF 00 | Subtract with carry (absolute,X)
    SBC $FFFF,X          ; FD FF FF | Subtract with carry (absolute,X)
    SBC $01FF,X          ; FD FF 01 | Subtract with carry (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $F4              ; 80 F4 | Branch always
    SEC                  ; 38 | Set carry flag
    PEA #$3FC0           ; F4 C0 3F | Push effective address to stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1E2
; Address: $CF9A9F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1E2:
    JSL $C4297C          ; 22 7C 29 C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    DEC                  ; 3A | Decrement accumulator
    BMI $0C              ; 30 0C | Branch if negative

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1E3
; Address: $CF9AA8
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1E3:
    JSL $C44708          ; 22 08 47 C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SBC $CC20,X          ; FD 20 CC | Subtract with carry (absolute,X)
    TXS                  ; 9A | Transfer X register to stack pointer
    BRA $F1              ; 80 F1 | Branch always

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1E4
; Address: $CF9AB4
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1E4:
    JSL $C45345          ; 22 45 53 C4 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    ADC #$D0             ; 69 D0 | Add with carry (immediate)
    DEC                  ; 3A | Decrement accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $0000,Y          ; B9 00 00 | Load from absolute,Y into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    ADC $18              ; 65 18 | Add with carry (zero page)
    STA $C197            ; 8D 97 C1 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1E5
; Address: $CF9ACC
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1E5:
    LDX #$0C             ; A2 0C | Load immediate value into X register
    PHA                  ; 48 | Push accumulator to stack
    LDA $0000,Y          ; B9 00 00 | Load from absolute,Y into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP #$D0             ; C9 D0 | Compare accumulator (immediate)
    BNE $02              ; D0 02 | Branch if not equal
    INC $18              ; E6 18 | Increment (zero page)
    INY                  ; C8 | Increment Y register
    DEX                  ; CA | Decrement X register
    BNE $EF              ; D0 EF | Branch if not equal
    PLA                  ; 68 | Pull accumulator from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1F4
; Address: $CF9B19
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1F4:
    JSL $C028B4          ; 22 B4 28 C0 | Jump to subroutine long
    BRA $F5              ; 80 F5 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1F9
; Address: $CF9B30
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1F9:
    PHA                  ; 48 | Push accumulator to stack
    LDA $9836            ; AD 36 98 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $09              ; F0 09 | Branch if equal
    STZ $983C            ; 9C 3C 98 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1FA
; Address: $CF9B3C
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1FA:
    JSL $C02892          ; 22 92 28 C0 | Jump to subroutine long
    BRA $EF              ; 80 EF | Branch always
    PLA                  ; 68 | Pull accumulator from stack
    STA $9836            ; 8D 36 98 | Store accumulator to absolute address
    STY $9838            ; 8C 38 98 | Store Y register to absolute address
    STX $983A            ; 8E 3A 98 | Store X register to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1FB
; Address: $CF9B4D
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1FB:
    REP #$30             ; C2 30 | Reset processor status bits
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $9836            ; 8D 36 98 | Store accumulator to absolute address
    STZ $983C            ; 9C 3C 98 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1FE
; Address: $CF9B65
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1FE:
    JSL $C028B4          ; 22 B4 28 C0 | Jump to subroutine long
    BRA $F2              ; 80 F2 | Branch always
    LDA $9806            ; AD 06 98 | Load from absolute address into accumulator
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BNE $21              ; D0 21 | PPU graphics register access
    LDX $9836            ; AE 36 98 | Load from absolute address into X register
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $19              ; F0 19 | Branch if equal

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_1FF
; Address: $CF9B7B
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_1FF:
    JSL $C903EE          ; 22 EE 03 C9 | Jump to subroutine long
    LDY $C723,X          ; BC 23 C7 | Load from absolute,X into Y register
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP #$03             ; C9 03 | Compare accumulator (immediate)
    BCS $05              ; B0 05 | Branch if carry set
    STA $9834            ; 8D 34 98 | Store accumulator to absolute address
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_201
; Address: $CF9B94
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_201:
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $9836            ; 8D 36 98 | Store accumulator to absolute address
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_206
; Address: $CF9BB0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_206:
    JSL $C1DB88          ; 22 88 DB C1 | Jump to subroutine long
    BCC $10              ; 90 10 | Branch if carry clear
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_207
; Address: $CF9BB7
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_207:
    JSR $9C16            ; 20 16 9C | Jump to subroutine
    PLA                  ; 68 | Pull accumulator from stack
    LDX $9838            ; AE 38 98 | Load from absolute address into X register
    CPX #$06             ; E0 06 | Compare X register (immediate)
    BCS $03              ; B0 03 | Branch if carry set
    CMP $A99B            ; CD 9B A9 | Compare accumulator (absolute)
    STA $9836            ; 8D 36 98 | Store accumulator to absolute address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_20E
; Address: $CF9BEE
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_20E:
    PHA                  ; 48 | Push accumulator to stack
    LDA $9812            ; AD 12 98 | Load from absolute address into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $9818,X          ; BD 18 98 | Load from absolute,X into accumulator
    CMP $9814            ; CD 14 98 | Compare accumulator (absolute)
    BNE $0D              ; D0 0D | Branch if not equal
    PLA                  ; 68 | Pull accumulator from stack
    LDX $9812            ; AE 12 98 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_215
; Address: $CF9C19
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_215:
    STX $9812            ; 8E 12 98 | Store X register to absolute address
    LDA $9836            ; AD 36 98 | Load from absolute address into accumulator
    STA $9814            ; 8D 14 98 | Store accumulator to absolute address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_216
; Address: $CF9C23
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_216:
    PHP                  ; 08 | Push processor status to stack
    SEI                  ; 78 | Set interrupt disable flag
    REP #$30             ; C2 30 | Reset processor status bits
    PHB                  ; 8B | Push data bank register to stack
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDX #$1E             ; A2 1E | Load immediate value into X register
    STZ $4252,X          ; 9E 52 42 | Hardware register operation
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    BPL $F9              ; 10 F9 | Branch if positive
    STZ $423F            ; 9C 3F 42 | Hardware register operation
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_217
; Address: $CF9C43
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_217:
    PHP                  ; 08 | Push processor status to stack
    SEI                  ; 78 | Set interrupt disable flag
    REP #$30             ; C2 30 | Reset processor status bits
    PHB                  ; 8B | Push data bank register to stack
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $4252,X          ; BD 52 42 | Hardware register operation
    BEQ $0A              ; F0 0A | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BCC $F4              ; 90 F4 | Branch if carry clear
    PLA                  ; 68 | Pull accumulator from stack
    ORA ($8E,X)          ; 01 8E | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    LDA $4243            ; AD 43 42 | Hardware register operation
    STA $42B2,X          ; 9D B2 42 | Hardware register operation
    STA $42D2,X          ; 9D D2 42 | Hardware register operation
    ORA ($9D,X)          ; 01 9D | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_218
; Address: $CF9C74
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_218:
    WDM #$A3             ; 42 A3 | Reserved instruction
    ORA $9B              ; 05 9B | Logical OR with accumulator (zero page)
    TAX                  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_219
; Address: $CF9C79
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_219:
    JSL $C9050D          ; 22 0D 05 C9 | Jump to subroutine long
    ASL $A600            ; 0E 00 A6 | Arithmetic shift left (absolute)
    WDM #$C5             ; 42 C5 | Reserved instruction
    LSR                  ; 4A | Logical shift right (accumulator)
    LDA $4C              ; A5 4C | Load from zero page into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $4272,X          ; 9D 72 42 | Hardware register operation
    LDA $4A              ; A5 4A | Load from zero page into accumulator
    STA $4292,X          ; 9D 92 42 | Hardware register operation
    LDA $4241            ; AD 41 42 | Hardware register operation
    STA $4312,X          ; 9D 12 43 | Store accumulator to absolute,X
    LDY #$02             ; A0 02 | Load immediate value into Y register
    LSR                  ; 4A | Logical shift right (accumulator)
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $43B2,X          ; 9D B2 43 | Store accumulator to absolute,X
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LSR                  ; 4A | Logical shift right (accumulator)
    STA $43D2,X          ; 9D D2 43 | Store accumulator to absolute,X
    LDY #$05             ; A0 05 | Load immediate value into Y register
    LSR                  ; 4A | Logical shift right (accumulator)
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $4432,X          ; 9D 32 44 | Store accumulator to absolute,X
    LDY #$03             ; A0 03 | Load immediate value into Y register
    LSR                  ; 4A | Logical shift right (accumulator)
    STA $4452,X          ; 9D 52 44 | Store accumulator to absolute,X
    LDY #$06             ; A0 06 | Load immediate value into Y register
    LSR                  ; 4A | Logical shift right (accumulator)
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $44B2,X          ; 9D B2 44 | Store accumulator to absolute,X
    LDY #$09             ; A0 09 | Load immediate value into Y register
    LSR                  ; 4A | Logical shift right (accumulator)
    STA $44F2,X          ; 9D F2 44 | Store accumulator to absolute,X
    LDY #$07             ; A0 07 | Load immediate value into Y register
    LSR                  ; 4A | Logical shift right (accumulator)
    STA $4512,X          ; 9D 12 45 | Store accumulator to absolute,X
    LDY #$0B             ; A0 0B | Load immediate value into Y register
    LSR                  ; 4A | Logical shift right (accumulator)
    STA $45F2,X          ; 9D F2 45 | Store accumulator to absolute,X
    LDY #$0C             ; A0 0C | Load immediate value into Y register
    LSR                  ; 4A | Logical shift right (accumulator)
    BPL $05              ; 10 05 | Branch if positive
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    BRA $80              ; 80 80 | Branch always
    ORA $EB              ; 05 EB | Logical OR with accumulator (zero page)
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $4612,X          ; 9D 12 46 | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_21A
; Address: $CF9CF5
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_21A:
    LDA $4245            ; AD 45 42 | Hardware register operation
    STA $45B2,X          ; 9D B2 45 | Store accumulator to absolute,X
    LDA $4452,X          ; BD 52 44 | Load from absolute,X into accumulator
    STA $4A              ; 85 4A | Store accumulator to zero page
    LDA $4432,X          ; BD 32 44 | Load from absolute,X into accumulator
    STA $4C              ; 85 4C | Store accumulator to zero page
    LSR                  ; 4A | Logical shift right (accumulator)
    STA $4492,X          ; 9D 92 44 | Store accumulator to absolute,X
    LDY #$02             ; A0 02 | Load immediate value into Y register
    LSR                  ; 4A | Logical shift right (accumulator)
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $4472,X          ; 9D 72 44 | Store accumulator to absolute,X
    STZ $4332,X          ; 9E 32 43 | Store zero to absolute,X
    LDA $44B2,X          ; BD B2 44 | Load from absolute,X into accumulator
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    STX $BD00            ; 8E 00 BD | Store X register to absolute address
    STA $4C              ; 85 4C | Store accumulator to zero page
    LDA $4492,X          ; BD 92 44 | Load from absolute,X into accumulator
    STA $4A              ; 85 4A | Store accumulator to zero page
    ORA $A0              ; 05 A0 | Logical OR with accumulator (zero page)
    ASL $D900,X          ; 1E 00 D9 | Arithmetic shift left (absolute,X)
    WDM #$F0             ; 42 F0 | Reserved instruction
    ASL $88              ; 06 88 | Arithmetic shift left (zero page)
    DEY                  ; 88 | Decrement Y register
    BPL $F7              ; 10 F7 | Branch if positive
    BRA $0F              ; 80 0F | Branch always
    LDA $4552,Y          ; B9 52 45 | Load from absolute,Y into accumulator
    STA $4552,X          ; 9D 52 45 | Store accumulator to absolute,X
    LDA $4592,Y          ; B9 92 45 | Load from absolute,Y into accumulator
    STA $4592,X          ; 9D 92 45 | Store accumulator to absolute,X
    ADC $00              ; 65 00 | Add with carry (zero page)
    LDY #$02             ; A0 02 | Load immediate value into Y register
    LSR                  ; 4A | Logical shift right (accumulator)
    STA $40CD            ; 8D CD 40 | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_21B
; Address: $CF9D57
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_21B:
    JSR $9E6D            ; 20 6D 9E | Jump to subroutine
    LDX $40CB            ; AE CB 40 | Load from absolute address into X register
    LDA $40C7            ; AD C7 40 | Load from absolute address into accumulator
    STA $4592,X          ; 9D 92 45 | Store accumulator to absolute,X
    BCC $03              ; 90 03 | Branch if carry clear
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ADC $99E3            ; 6D E3 99 | Add with carry (absolute)
    STA $4552,X          ; 9D 52 45 | Store accumulator to absolute,X
    STA $40D7            ; 8D D7 40 | Store accumulator to absolute address
    LDA $4472,X          ; BD 72 44 | Load from absolute,X into accumulator
    STA $4C              ; 85 4C | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_21C
; Address: $CF9D7A
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_21C:
    LDA $4492,X          ; BD 92 44 | Load from absolute,X into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC #$04             ; 69 04 | Add with carry (immediate)
    BCC $02              ; 90 02 | Branch if carry clear
    INC $4C              ; E6 4C | Increment (zero page)
    STA $4A              ; 85 4A | Store accumulator to zero page
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    BPL $22              ; 10 22 | Branch if positive
    LDY #$8D             ; A0 8D | Load immediate value into Y register
    CPY #$B0             ; C0 B0 | Compare Y register (immediate)
    BMI $00              ; 30 00 | Branch if negative
    LDA $7DC8            ; AD C8 7D | Load from absolute address into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDA $7DCC            ; AD CC 7D | Load from absolute address into accumulator
    STA $40D3            ; 8D D3 40 | Store accumulator to absolute address
    LDA #$7E             ; A9 7E | Load immediate value into accumulator
    STA $40D5            ; 8D D5 40 | Store accumulator to absolute address
    LDA $40CD            ; AD CD 40 | Load from absolute address into accumulator
    LDX $7DCC            ; AE CC 7D | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_21E
; Address: $CF9DAD
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_21E:
    JSL $C08E1B          ; 22 1B 8E C0 | Jump to subroutine long
    ORA $AE              ; 05 AE | Logical OR with accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    STA $4252,X          ; 9D 52 42 | Hardware register operation
    TXA                  ; 8A | Transfer X register to accumulator
    ORA $7A              ; 05 7A | Logical OR with accumulator (zero page)
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_220
; Address: $CF9DC6
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_220:
    JSL $C79DD4          ; 22 D4 9D C7 | Jump to subroutine long
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLB                  ; AB | Pull data bank register from stack
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_221
; Address: $CF9DD4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_221:
    PHP                  ; 08 | Push processor status to stack
    SEI                  ; 78 | Set interrupt disable flag
    REP #$30             ; C2 30 | Reset processor status bits
    PHB                  ; 8B | Push data bank register to stack
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_222
; Address: $CF9DDC
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_222:
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BEQ $5C              ; F0 5C | Branch if equal
    LDY $4252,X          ; BC 52 42 | Hardware register operation
    STZ $4252,X          ; 9E 52 42 | Hardware register operation
    LDA $44B2,X          ; BD B2 44 | Load from absolute,X into accumulator
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BEQ $37              ; F0 37 | Branch if equal
    TYA                  ; 98 | Transfer Y register to accumulator
    LDY #$1E             ; A0 1E | Load immediate value into Y register
    CMP $4252,Y          ; D9 52 42 | Hardware register operation
    BEQ $26              ; F0 26 | Branch if equal
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    BPL $F7              ; 10 F7 | Branch if positive
    LDA $4432,X          ; BD 32 44 | Load from absolute,X into accumulator
    STA $4C              ; 85 4C | Store accumulator to zero page
    LDA $4452,X          ; BD 52 44 | Load from absolute,X into accumulator
    STA $4A              ; 85 4A | Store accumulator to zero page
    LSR                  ; 4A | Logical shift right (accumulator)
    STA $40              ; 85 40 | Store accumulator to zero page
    LDY #$02             ; A0 02 | Load immediate value into Y register
    LSR                  ; 4A | Logical shift right (accumulator)
    STA $42              ; 85 42 | Hardware register operation
    RTI                  ; 40 | Return from interrupt
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $4592,X          ; BD 92 45 | Load from absolute,X into accumulator
    BMI $05              ; 30 05 | Branch if negative
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_223
; Address: $CF9E20
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_223:
    JSR $9EC5            ; 20 C5 9E | Jump to subroutine
    TAX                  ; AA | Transfer accumulator to X register
    BVC $10              ; 50 10 | Branch if overflow clear
    LDA $4512,X          ; BD 12 45 | Load from absolute,X into accumulator
    BEQ $0B              ; F0 0B | Branch if equal
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $4572,X          ; BD 72 45 | Load from absolute,X into accumulator
    BMI $05              ; 30 05 | Branch if negative
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_225
; Address: $CF9E3E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_225:
    JSL $C79F6B          ; 22 6B 9F C7 | Jump to subroutine long
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_227
; Address: $CF9E48
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_227:
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $4252,X          ; BD 52 42 | Hardware register operation
    ORA ($F0,X)          ; 01 F0 | Logical OR with accumulator ((zero page,X))
    PHX                  ; DA | Push X register to stack
    TAX                  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_228
; Address: $CF9E56
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_228:
    JSL $C79DD4          ; 22 D4 9D C7 | Jump to subroutine long
    PLX                  ; FA | Pull X register from stack
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BCC $EB              ; 90 EB | Branch if carry clear
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_22A
; Address: $CF9E67
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_22A:
    JSR $9E6D            ; 20 6D 9E | Jump to subroutine
    PLY                  ; 7A | Pull Y register from stack
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_22B
; Address: $CF9E6D
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_22B:
    STA $40C5            ; 8D C5 40 | Store accumulator to absolute address
    LDA $DD89,X          ; BD 89 DD | Load from absolute,X into accumulator
    BPL $13              ; 10 13 | Branch if positive
    TXA                  ; 8A | Transfer X register to accumulator
    CLC                  ; 18 | Clear carry flag
    ADC #$40             ; 69 40 | Add with carry (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BCC $F0              ; 90 F0 | Branch if carry clear
    SEC                  ; 38 | Set carry flag
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    STA $40C7            ; 8D C7 40 | Store accumulator to absolute address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_22C
; Address: $CF9E88
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_22C:
    STX $40C7            ; 8E C7 40 | Store X register to absolute address
    TXA                  ; 8A | Transfer X register to accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    CLC                  ; 18 | Clear carry flag
    ADC $40C5            ; 6D C5 40 | Add with carry (absolute)
    STA $40C9            ; 8D C9 40 | Store accumulator to absolute address
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BCS $E7              ; B0 E7 | Branch if carry set
    LDY $40C5            ; AC C5 40 | Load from absolute address into Y register
    DEY                  ; 88 | Decrement Y register
    BEQ $0D              ; F0 0D | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA $DD89,X          ; BD 89 DD | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_22D
; Address: $CF9EA4
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_22D:
    BPL $F6              ; 10 F6 | Branch if positive
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$C0             ; 29 C0 | Logical AND with accumulator (immediate)
    BRA $CA              ; 80 CA | Branch always
    LDX $40C7            ; AE C7 40 | Load from absolute address into X register
    LDY $40C5            ; AC C5 40 | Load from absolute address into Y register
    LDA $DD89,X          ; BD 89 DD | Load from absolute,X into accumulator
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    BRA $9D              ; 80 9D | Branch always
    BIT #$DD             ; 89 DD | Test bits in accumulator (immediate)
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    DEY                  ; 88 | Decrement Y register
    BNE $F2              ; D0 F2 | Branch if not equal
    LSR $40C7            ; 4E C7 40 | Logical shift right (absolute)
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_22E
; Address: $CF9EC5
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_22E:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $08              ; F0 08 | Branch if equal
    STZ $DD89,X          ; 9E 89 DD | Store zero to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    DEY                  ; 88 | Decrement Y register
    BNE $F8              ; D0 F8 | Branch if not equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_22F
; Address: $CF9ED3
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_22F:
    PHP                  ; 08 | Push processor status to stack
    SEI                  ; 78 | Set interrupt disable flag
    REP #$30             ; C2 30 | Reset processor status bits
    PHB                  ; 8B | Push data bank register to stack
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    STX $40CB            ; 8E CB 40 | Store X register to absolute address
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    PLY                  ; 7A | Pull Y register from stack
    STA $4372,X          ; 9D 72 43 | Store accumulator to absolute,X
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $A8              ; 05 A8 | Logical OR with accumulator (zero page)
    LDA $43D2,X          ; BD D2 43 | Load from absolute,X into accumulator
    STA $4A              ; 85 4A | Store accumulator to zero page
    LDA $43B2,X          ; BD B2 43 | Load from absolute,X into accumulator
    STA $4C              ; 85 4C | Store accumulator to zero page
    LSR                  ; 4A | Logical shift right (accumulator)
    STA $4412,X          ; 9D 12 44 | Store accumulator to absolute,X
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_230
; Address: $CF9F04
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_230:
    LSR                  ; 4A | Logical shift right (accumulator)
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $43F2,X          ; 9D F2 43 | Store accumulator to absolute,X
    LDA $4332,X          ; BD 32 43 | Load from absolute,X into accumulator
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    BRA $9D              ; 80 9D | Branch always
    STZ $4352,X          ; 9E 52 43 | Store zero to absolute,X
    STZ $4392,X          ; 9E 92 43 | Store zero to absolute,X
    LDA $4332,X          ; BD 32 43 | Load from absolute,X into accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    BCS $41              ; B0 41 | Branch if carry set
    SEC                  ; 38 | Set carry flag
    ROL                  ; 2A | Rotate left (accumulator)
    STA $4332,X          ; 9D 32 43 | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_232
; Address: $CF9F2B
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_232:
    JSL $C0923F          ; 22 3F 92 C0 | Jump to subroutine long
    LDA $44B2,X          ; BD B2 44 | Load from absolute,X into accumulator
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $2A              ; D0 2A | Branch if not equal
    BVS $25              ; 70 25 | Branch if overflow set
    LDA $4332,X          ; BD 32 43 | Load from absolute,X into accumulator
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    STA $4332,X          ; 9D 32 43 | Store accumulator to absolute,X
    LDA $4512,X          ; BD 12 45 | Load from absolute,X into accumulator
    LDX #$40             ; A2 40 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_233
; Address: $CF9F4B
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_233:
    JSR $9E6D            ; 20 6D 9E | Jump to subroutine
    LDX $40CB            ; AE CB 40 | Load from absolute address into X register
    LDA $40C7            ; AD C7 40 | Load from absolute address into accumulator
    STA $4572,X          ; 9D 72 45 | Store accumulator to absolute,X
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ADC $99E3            ; 6D E3 99 | Add with carry (absolute)
    STA $4532,X          ; 9D 32 45 | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_234
; Address: $CF9F61
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_234:
    JSL $C7A040          ; 22 40 A0 C7 | Jump to subroutine long
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_235
; Address: $CF9F6B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_235:
    PHP                  ; 08 | Push processor status to stack
    SEI                  ; 78 | Set interrupt disable flag
    REP #$30             ; C2 30 | Reset processor status bits
    PHB                  ; 8B | Push data bank register to stack
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_236
; Address: $CF9F72
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_236:
    PHY                  ; 5A | Push Y register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    STX $40CB            ; 8E CB 40 | Store X register to absolute address
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BEQ $14              ; F0 14 | Branch if equal
    LDA $4332,X          ; BD 32 43 | Load from absolute,X into accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    BCC $0E              ; 90 0E | Branch if carry clear
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $4332,X          ; 9D 32 43 | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_238
; Address: $CF9F90
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_238:
    JSL $C092C4          ; 22 C4 92 C0 | Jump to subroutine long
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_239
; Address: $CF9F9A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_239:
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BEQ $0B              ; F0 0B | Branch if equal
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_23B
; Address: $CF9FAC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_23B:
    JSR $9FB5            ; 20 B5 9F | Jump to subroutine
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_23C
; Address: $CF9FB5
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_23C:
    PHX                  ; DA | Push X register to stack
    LDA $45B2,X          ; BD B2 45 | Load from absolute,X into accumulator
    LDX $4247            ; AE 47 42 | Hardware register operation
    ROL                  ; 2A | Rotate left (accumulator)
    LDY #$FA             ; A0 FA | Load immediate value into Y register
    BCS $03              ; B0 03 | Branch if carry set
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $45D2,X          ; 9D D2 45 | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_23D
; Address: $CF9FC8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_23D:
    JSL $C034EA          ; 22 EA 34 C0 | Jump to subroutine long
    LDA $4612,X          ; BD 12 46 | Load from absolute,X into accumulator
    BPL $24              ; 10 24 | Branch if positive

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_23E
; Address: $CF9FD1
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_23E:
    TXA                  ; 8A | Transfer X register to accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    STA $4A              ; 85 4A | Store accumulator to zero page
    LDA $0000,Y          ; B9 00 00 | Load from absolute,Y into accumulator
    BPL $05              ; 10 05 | Branch if positive
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    BRA $04              ; 80 04 | Branch always
    XBA                  ; EB | Exchange accumulator bytes
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ASL $329D            ; 0E 9D 32 | Arithmetic shift left (absolute)
    LSR $E8              ; 46 E8 | Logical shift right (zero page)
    INX                  ; E8 | Increment X register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    DEC $4A              ; C6 4A | Decrement (zero page)
    BNE $E7              ; D0 E7 | Branch if not equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_23F
; Address: $CF9FF5
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_23F:
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $4A              ; 85 4A | Store accumulator to zero page
    TYA                  ; 98 | Transfer Y register to accumulator
    CLC                  ; 18 | Clear carry flag
    ADC $4A              ; 65 4A | Add with carry (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $0000,Y          ; B9 00 00 | Load from absolute,Y into accumulator
    XBA                  ; EB | Exchange accumulator bytes
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ASL $4A05            ; 0E 05 4A | Arithmetic shift left (absolute)
    STA $4612,X          ; 9D 12 46 | Store accumulator to absolute,X
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_246
; Address: $CFA02B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_246:
    LDY #$11             ; A0 11 | Load immediate value into Y register
    LDY #$16             ; A0 16 | Load immediate value into Y register
    LDY #$1B             ; A0 1B | Load immediate value into Y register
    LDY #$20             ; A0 20 | Load immediate value into Y register
    LDY #$25             ; A0 25 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_249
; Address: $CFA040
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_249:
    PHP                  ; 08 | Push processor status to stack
    SEI                  ; 78 | Set interrupt disable flag
    REP #$30             ; C2 30 | Reset processor status bits
    PHB                  ; 8B | Push data bank register to stack
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    STX $40CB            ; 8E CB 40 | Store X register to absolute address
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    ADC $00              ; 65 00 | Add with carry (zero page)
    STZ $424B            ; 9C 4B 42 | Hardware register operation
    LDA $4412,X          ; BD 12 44 | Load from absolute,X into accumulator
    STA $00              ; 85 00 | Store accumulator to zero page
    LDA $43F2,X          ; BD F2 43 | Load from absolute,X into accumulator
    STA $02              ; 85 02 | Store accumulator to zero page
    LDA $4452,X          ; BD 52 44 | Load from absolute,X into accumulator
    STA $04              ; 85 04 | Store accumulator to zero page
    LDA $4432,X          ; BD 32 44 | Load from absolute,X into accumulator
    STA $06              ; 85 06 | Store accumulator to zero page
    LDA $4332,X          ; BD 32 43 | Load from absolute,X into accumulator
    BMI $1A              ; 30 1A | Branch if negative
    LDY $4392,X          ; BC 92 43 | Load from absolute,X into Y register
    INY                  ; C8 | Increment Y register
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    INC $424B            ; EE 4B 42 | Hardware register operation
    DEC                  ; 3A | Decrement accumulator
    CMP $4352,X          ; DD 52 43 | Compare accumulator (absolute,X)
    BCC $0E              ; 90 0E | Branch if carry clear
    EOR $2900            ; 4D 00 29 | Exclusive OR with accumulator (absolute)
    STA $4332,X          ; 9D 32 43 | Store accumulator to absolute,X
    LDA $4392,X          ; BD 92 43 | Load from absolute,X into accumulator
    BRA $0A              ; 80 0A | Branch always
    LDA $4392,X          ; BD 92 43 | Load from absolute,X into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC #$04             ; 69 04 | Add with carry (immediate)
    STA $4392,X          ; 9D 92 43 | Store accumulator to absolute,X
    STZ $4352,X          ; 9E 52 43 | Store zero to absolute,X
    TAY                  ; A8 | Transfer accumulator to Y register
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_24A
; Address: $CFA0AF
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_24A:
    BNE $13              ; D0 13 | Branch if not equal
    STZ $4392,X          ; 9E 92 43 | Store zero to absolute,X
    LDA $4332,X          ; BD 32 43 | Load from absolute,X into accumulator
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    BRA $9D              ; 80 9D | Branch always
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_24B
; Address: $CFA0C4
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_24B:
    STA $40D1            ; 8D D1 40 | Store accumulator to absolute address
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ADC $40D1            ; 6D D1 40 | Add with carry (absolute)
    TAY                  ; A8 | Transfer accumulator to Y register
    STA $4492,X          ; 9D 92 44 | Store accumulator to absolute,X
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $4472,X          ; 9D 72 44 | Store accumulator to absolute,X
    LDY $4392,X          ; BC 92 43 | Load from absolute,X into Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    SEP #$20             ; E2 20 | Set processor status bits
    LDA $4332,X          ; BD 32 43 | Load from absolute,X into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $0B              ; D0 0B | Branch if not equal
    REP #$20             ; C2 20 | Reset processor status bits
    BMI $13              ; 30 13 | Branch if negative
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    BRA $11              ; 80 11 | Branch always
    EOR #$FF             ; 49 FF | Exclusive OR with accumulator (immediate)
    INC                  ; 1A | Increment accumulator
    REP #$20             ; C2 20 | Reset processor status bits
    BMI $05              ; 30 05 | Branch if negative
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    BRA $03              ; 80 03 | Branch always
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    ADC $42D2,X          ; 7D D2 42 | Hardware register operation
    STA $42D2,X          ; 9D D2 42 | Hardware register operation
    SEP #$20             ; E2 20 | Set processor status bits
    INY                  ; C8 | Increment Y register
    REP #$20             ; C2 20 | Reset processor status bits
    BMI $05              ; 30 05 | Branch if negative
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    BRA $03              ; 80 03 | Branch always
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_24C
; Address: $CFA11E
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_24C:
    ADC $42F2,X          ; 7D F2 42 | Hardware register operation
    STA $42F2,X          ; 9D F2 42 | Hardware register operation
    LDA $44B2,X          ; BD B2 44 | Load from absolute,X into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $08              ; F0 08 | Branch if equal
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BEQ $55              ; F0 55 | Branch if equal
    SEP #$00             ; E2 00 | Set processor status bits
    BVS $08              ; 70 08 | Branch if overflow set
    LDA $40D1            ; AD D1 40 | Load from absolute address into accumulator
    BNE $0B              ; D0 0B | Branch if not equal
    LDA $40D1            ; AD D1 40 | Load from absolute address into accumulator
    BNE $40              ; D0 40 | Branch if not equal
    LDA $00              ; A5 00 | Load from zero page into accumulator
    LDA $4332,X          ; BD 32 43 | Load from absolute,X into accumulator
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    STA $4332,X          ; 9D 32 43 | Store accumulator to absolute,X
    LDA $4512,X          ; BD 12 45 | Load from absolute,X into accumulator
    LDX #$40             ; A2 40 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_24D
; Address: $CFA158
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_24D:
    JSR $9E6D            ; 20 6D 9E | Jump to subroutine
    LDX $40CB            ; AE CB 40 | Load from absolute address into X register
    LDA $40C7            ; AD C7 40 | Load from absolute address into accumulator
    STA $4572,X          ; 9D 72 45 | Store accumulator to absolute,X
    BPL $03              ; 10 03 | Branch if positive
    PHA                  ; 48 | Push accumulator to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ADC $99E3            ; 6D E3 99 | Add with carry (absolute)
    STA $4532,X          ; 9D 32 45 | Store accumulator to absolute,X
    BRA $16              ; 80 16 | Branch always
    LDA $4492,X          ; BD 92 44 | Load from absolute,X into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC #$04             ; 69 04 | Add with carry (immediate)
    STA $4492,X          ; 9D 92 44 | Store accumulator to absolute,X
    BCC $03              ; 90 03 | Branch if carry clear
    INC $4472,X          ; FE 72 44 | Increment (absolute,X)
    BRA $5E              ; 80 5E | Branch always
    LDA $4352,X          ; BD 52 43 | Load from absolute,X into accumulator
    BNE $59              ; D0 59 | Branch if not equal
    LDA $4532,X          ; BD 32 45 | Load from absolute,X into accumulator
    STA $40D7            ; 8D D7 40 | Store accumulator to absolute address
    LDA $4492,X          ; BD 92 44 | Load from absolute,X into accumulator
    STA $4A              ; 85 4A | Store accumulator to zero page
    LDA $4472,X          ; BD 72 44 | Load from absolute,X into accumulator
    STA $4C              ; 85 4C | Store accumulator to zero page
    LSR                  ; 4A | Logical shift right (accumulator)
    STA $40CF            ; 8D CF 40 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_24E
; Address: $CFA1A0
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_24E:
    LDY #$02             ; A0 02 | Load immediate value into Y register
    LSR                  ; 4A | Logical shift right (accumulator)
    STA $40CD            ; 8D CD 40 | Store accumulator to absolute address
    BEQ $CB              ; F0 CB | Branch if equal
    LDA $4472,X          ; BD 72 44 | Load from absolute,X into accumulator
    STA $4C              ; 85 4C | Store accumulator to zero page
    LDA $4492,X          ; BD 92 44 | Load from absolute,X into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC #$04             ; 69 04 | Add with carry (immediate)
    STA $4A              ; 85 4A | Store accumulator to zero page
    BCC $02              ; 90 02 | Branch if carry clear
    INC $4C              ; E6 4C | Increment (zero page)
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    BVS $18              ; 70 18 | Branch if overflow set
    ADC $7C40            ; 6D 40 7C | Add with carry (absolute)
    STA $40D3            ; 8D D3 40 | Store accumulator to absolute address
    LDA #$7E             ; A9 7E | Load immediate value into accumulator
    STA $40D5            ; 8D D5 40 | Store accumulator to absolute address
    LDA $40CD            ; AD CD 40 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_24F
; Address: $CFA1CF
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_24F:
    JSR $C163            ; 20 63 C1 | Jump to subroutine
    LDX $40CB            ; AE CB 40 | Load from absolute address into X register
    LDA $40CF            ; AD CF 40 | Load from absolute address into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC $4492,X          ; 7D 92 44 | Add with carry (absolute,X)
    BCC $03              ; 90 03 | Branch if carry clear
    INC $4472,X          ; FE 72 44 | Increment (absolute,X)
    STA $4492,X          ; 9D 92 44 | Store accumulator to absolute,X
    INC $4352,X          ; FE 52 43 | Increment (absolute,X)
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_250
; Address: $CFA1EE
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_250:
    LDA $4352,X          ; BD 52 43 | Load from absolute,X into accumulator
    BNE $F1              ; D0 F1 | Branch if not equal
    LDA $4392,X          ; BD 92 43 | Load from absolute,X into accumulator
    BNE $23              ; D0 23 | Branch if not equal
    BVC $19              ; 50 19 | Branch if overflow clear
    LDA $4332,X          ; BD 32 43 | Load from absolute,X into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    LDA                  ; BF 9D 32 43 | Load from absolute long,X into accumulator
    LDY $4512,X          ; BC 12 45 | Load from absolute,X into Y register
    LDA $4572,X          ; BD 72 45 | Load from absolute,X into accumulator
    BMI $05              ; 30 05 | Branch if negative
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_252
; Address: $CFA216
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_252:
    LDA $4352,X          ; BD 52 43 | Load from absolute,X into accumulator
    BNE $C9              ; D0 C9 | Branch if not equal
    LDA $4492,X          ; BD 92 44 | Load from absolute,X into accumulator
    STA $4A              ; 85 4A | Store accumulator to zero page
    LDA $4472,X          ; BD 72 44 | Load from absolute,X into accumulator
    STA $4C              ; 85 4C | Store accumulator to zero page
    LSR                  ; 4A | Logical shift right (accumulator)
    CLC                  ; 18 | Clear carry flag
    ADC $4492,X          ; 7D 92 44 | Add with carry (absolute,X)
    STA $4492,X          ; 9D 92 44 | Store accumulator to absolute,X
    BCC $03              ; 90 03 | Branch if carry clear
    INC $4472,X          ; FE 72 44 | Increment (absolute,X)
    BRA $AF              ; 80 AF | Branch always
    TAX                  ; AA | Transfer accumulator to X register
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BEQ $05              ; F0 05 | Branch if equal
    LDA $4252,X          ; BD 52 42 | Hardware register operation
    BNE $01              ; D0 01 | Branch if not equal
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_253
; Address: $CFA241
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_253:
    TXA                  ; 8A | Transfer X register to accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $1E              ; 85 1E | Store accumulator to zero page
    LDA $4492,X          ; BD 92 44 | Load from absolute,X into accumulator
    STA $00              ; 85 00 | Store accumulator to zero page
    LDA $4472,X          ; BD 72 44 | Load from absolute,X into accumulator
    STA $02              ; 85 02 | Store accumulator to zero page
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $04              ; 85 04 | Store accumulator to zero page
    STA $06              ; 85 06 | Store accumulator to zero page
    LDA $4612,X          ; BD 12 46 | Load from absolute,X into accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    STA $16              ; 85 16 | Store accumulator to zero page
    LDA $4312,X          ; BD 12 43 | Load from absolute,X into accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA $4592,X          ; 1D 92 45 | Logical OR with accumulator (absolute,X)
    STA $0C              ; 85 0C | Store accumulator to zero page
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA $4572,X          ; 1D 72 45 | Logical OR with accumulator (absolute,X)
    STA $0E              ; 85 0E | Store accumulator to zero page
    LDA $DD3F            ; AD 3F DD | Load from absolute address into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $10              ; 85 10 | Store accumulator to zero page
    STZ $20              ; 64 20 | Store zero to zero page
    LDA #$81             ; A9 81 | Load immediate value into accumulator
    AND $96A0            ; 2D A0 96 | Logical AND with accumulator (absolute)
    STA $1A              ; 85 1A | Store accumulator to zero page
    LDA $42B2,X          ; BD B2 42 | Hardware register operation
    TAX                  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_254
; Address: $CFA286
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_254:
    LDA $42D2,Y          ; B9 D2 42 | Hardware register operation
    SEC                  ; 38 | Set carry flag
    JMP ($7FE3)          ; 6C E3 7F | Jump to address (absolute indirect)
    AND $96A0            ; 2D A0 96 | Logical AND with accumulator (absolute)
    STA $08              ; 85 08 | Store accumulator to zero page
    CMP #$80             ; C9 80 | Compare accumulator (immediate)
    BCC $14              ; 90 14 | Branch if carry clear
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    ORA ($90,X)          ; 01 90 | Logical OR with accumulator ((zero page,X))
    CMP #$80             ; C9 80 | Compare accumulator (immediate)
    ORA ($90,X)          ; 01 90 | Logical OR with accumulator ((zero page,X))
    CMP $1A              ; C5 1A | Compare accumulator (zero page)
    BCC $03              ; 90 03 | Branch if carry clear
    STA                  ; 9F 00 82 E9 | Store accumulator to absolute long,X
    LDA $42F2,Y          ; B9 F2 42 | Hardware register operation
    SEC                  ; 38 | Set carry flag
    AND $96A0            ; 2D A0 96 | Logical AND with accumulator (absolute)
    STA $0A              ; 85 0A | Store accumulator to zero page
    CMP #$70             ; C9 70 | Compare accumulator (immediate)
    BCS $03              ; B0 03 | Branch if carry set
    CMP #$F0             ; C9 F0 | Compare accumulator (immediate)
    BCS $03              ; B0 03 | Branch if carry set
    STY $C902            ; 8C 02 C9 | Store Y register to absolute address
    BVS $01              ; 70 01 | Branch if overflow set
    BCS $03              ; B0 03 | Branch if carry set
    EOR $C904,Y          ; 59 04 C9 | Exclusive OR with accumulator (absolute,Y)
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    BCS $E8              ; B0 E8 | Branch if carry set
    CMP $1A              ; C5 1A | Compare accumulator (zero page)
    BCC $03              ; 90 03 | Branch if carry clear
    ASL $82              ; 06 82 | Arithmetic shift left (zero page)
    LDA $42F2,Y          ; B9 F2 42 | Hardware register operation
    SEC                  ; 38 | Set carry flag
    AND $96A0            ; 2D A0 96 | Logical AND with accumulator (absolute)
    STA $0A              ; 85 0A | Store accumulator to zero page
    CMP #$70             ; C9 70 | Compare accumulator (immediate)
    BCS $03              ; B0 03 | Branch if carry set
    CMP #$F0             ; C9 F0 | Compare accumulator (immediate)
    BCS $03              ; B0 03 | Branch if carry set
    STZ $09              ; 64 09 | Store zero to zero page
    CMP #$70             ; C9 70 | Compare accumulator (immediate)
    ORA ($B0,X)          ; 01 B0 | Logical OR with accumulator ((zero page,X))
    SBC ($0A),Y          ; F1 0A | Subtract with carry ((zero page),Y)
    CMP #$F1             ; C9 F1 | Compare accumulator (immediate)
    BCS $E8              ; B0 E8 | Branch if carry set
    CMP $1A              ; C5 1A | Compare accumulator (zero page)
    BCC $03              ; 90 03 | Branch if carry clear
    STA ($1B,X)          ; 81 1B | Store accumulator to (zero page,X)
    LDA $42F2,Y          ; B9 F2 42 | Hardware register operation
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_255
; Address: $CFA31C
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_255:
    AND $96A0            ; 2D A0 96 | Logical AND with accumulator (absolute)
    STA $0A              ; 85 0A | Store accumulator to zero page
    CMP #$70             ; C9 70 | Compare accumulator (immediate)
    BCS $03              ; B0 03 | Branch if carry set
    XBA                  ; EB | Exchange accumulator bytes
    ORA $F0C9            ; 0D C9 F0 | Logical OR with accumulator (absolute)
    BCS $03              ; B0 03 | Branch if carry set
    CMP #$70             ; C9 70 | Compare accumulator (immediate)
    ORA ($B0,X)          ; 01 B0 | Logical OR with accumulator ((zero page,X))
    SBC $C910,X          ; FD 10 C9 | Subtract with carry (absolute,X)
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    BCS $E8              ; B0 E8 | Branch if carry set
    CMP $1A              ; C5 1A | Compare accumulator (zero page)
    BCC $03              ; 90 03 | Branch if carry clear
    PLY                  ; 7A | Pull Y register from stack
    EOR $B91B            ; 4D 1B B9 | Exclusive OR with accumulator (absolute)
    WDM #$38             ; 42 38 | Reserved instruction
    AND $96A0            ; 2D A0 96 | Logical AND with accumulator (absolute)
    STA $0A              ; 85 0A | Store accumulator to zero page
    CMP #$70             ; C9 70 | Compare accumulator (immediate)
    BCS $03              ; B0 03 | Branch if carry set
    XBA                  ; EB | Exchange accumulator bytes
    CMP #$F0             ; C9 F0 | Compare accumulator (immediate)
    BCS $03              ; B0 03 | Branch if carry set
    LDY $C915,X          ; BC 15 C9 | Load from absolute,X into Y register
    BVS $01              ; 70 01 | Branch if overflow set
    BCS $03              ; B0 03 | Branch if carry set
    BIT #$17             ; 89 17 | Test bits in accumulator (immediate)
    CMP #$F1             ; C9 F1 | Compare accumulator (immediate)
    BCS $E8              ; B0 E8 | Branch if carry set
    CMP $1A              ; C5 1A | Compare accumulator (zero page)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $8219            ; 4C 19 82 | Jump to address
    ORA $A51B,Y          ; 19 1B A5 | Logical OR with accumulator (absolute,Y)
    BMI $03              ; 30 03 | Branch if negative
    LDY #$01             ; A0 01 | Load immediate value into Y register
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C7 C7 | Load from absolute long,X into accumulator
    STA $18              ; 85 18 | Store accumulator to zero page
    LDA                  ; BF 49 C5 C7 | Load from absolute long,X into accumulator
    STA $12              ; 85 12 | Store accumulator to zero page
    TAX                  ; AA | Transfer accumulator to X register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    SEP #$20             ; E2 20 | Set processor status bits
    XBA                  ; EB | Exchange accumulator bytes
    BPL $0C              ; 10 0C | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ADC $0A              ; 65 0A | Add with carry (zero page)
    BPL $0A              ; 10 0A | Branch if positive

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_256
; Address: $CFA3A3
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_256:
    CMP #$F0             ; C9 F0 | Compare accumulator (immediate)
    BCS $06              ; B0 06 | Branch if carry set
    TAY                  ; A8 | Transfer accumulator to Y register
    CLC                  ; 18 | Clear carry flag
    ADC $0A              ; 65 0A | Add with carry (zero page)
    XBA                  ; EB | Exchange accumulator bytes
    BPL $28              ; 10 28 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    BPL $26              ; 10 26 | Branch if positive
    CMP #$F1             ; C9 F1 | Compare accumulator (immediate)
    BCS $03              ; B0 03 | Branch if carry set
    REP #$20             ; C2 20 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    ORA #$A5             ; 09 A5 | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $18              ; 05 18 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_258
; Address: $CFA3D5
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_258:
    JSR $1580            ; 20 80 15 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    REP #$20             ; C2 20 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    ORA $A5              ; 05 A5 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_25A
; Address: $CFA3F0
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_25A:
    JSR $1ED0            ; 20 D0 1E | Jump to subroutine
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($85,X)          ; C1 85 | Compare accumulator ((zero page,X))
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ASL $18EB            ; 0E EB 18 | Arithmetic shift left (absolute)
    ADC $1E              ; 65 1E | Add with carry (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $4632,X          ; BD 32 46 | Load from absolute,X into accumulator
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ADC $0C              ; 65 0C | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_25B
; Address: $CFA40F
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_25B:
    BRA $1C              ; 80 1C | Branch always
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($85,X)          ; C1 85 | Compare accumulator ((zero page,X))
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ASL $18EB            ; 0E EB 18 | Arithmetic shift left (absolute)
    ADC $1E              ; 65 1E | Add with carry (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $4632,X          ; BD 32 46 | Load from absolute,X into accumulator
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ADC $0E              ; 65 0E | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    BPL $10              ; 10 10 | Branch if positive
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    STZ $20              ; 64 20 | Store zero to zero page
    LDX $10              ; A6 10 | Load from zero page into X register
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $18              ; F0 18 | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    STX $10              ; 86 10 | Store X register to zero page
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    REP #$30             ; C2 30 | Reset processor status bits
    DEC $06              ; C6 06 | Decrement (zero page)
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $03              ; F0 03 | Branch if equal
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    BEQ $10              ; F0 10 | Branch if equal
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    LDA $06              ; A5 06 | Load from zero page into accumulator
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_25C
; Address: $CFA47D
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_25C:
    ASL $01A0            ; 0E A0 01 | Arithmetic shift left (absolute)
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C7 C7 | Load from absolute long,X into accumulator
    STA $18              ; 85 18 | Store accumulator to zero page
    LDA                  ; BF 49 C5 C7 | Load from absolute long,X into accumulator
    STA $12              ; 85 12 | Store accumulator to zero page
    TAX                  ; AA | Transfer accumulator to X register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    SEP #$20             ; E2 20 | Set processor status bits
    XBA                  ; EB | Exchange accumulator bytes
    BPL $0C              ; 10 0C | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ADC $0A              ; 65 0A | Add with carry (zero page)
    BPL $0A              ; 10 0A | Branch if positive
    CMP #$F0             ; C9 F0 | Compare accumulator (immediate)
    BCS $06              ; B0 06 | Branch if carry set
    DEY                  ; 88 | Decrement Y register
    CLC                  ; 18 | Clear carry flag
    ADC $0A              ; 65 0A | Add with carry (zero page)
    XBA                  ; EB | Exchange accumulator bytes
    BPL $28              ; 10 28 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    BPL $26              ; 10 26 | Branch if positive
    CMP #$F1             ; C9 F1 | Compare accumulator (immediate)
    BCS $03              ; B0 03 | Branch if carry set
    REP #$20             ; C2 20 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    ORA #$A5             ; 09 A5 | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $18              ; 05 18 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_25E
; Address: $CFA4D0
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_25E:
    JSR $1580            ; 20 80 15 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    REP #$20             ; C2 20 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    ORA $A5              ; 05 A5 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_260
; Address: $CFA4EB
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_260:
    JSR $0ED0            ; 20 D0 0E | Jump to subroutine
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($18,X)          ; C1 18 | Compare accumulator ((zero page,X))
    ADC $0C              ; 65 0C | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    BRA $0C              ; 80 0C | Branch always
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($18,X)          ; C1 18 | Compare accumulator ((zero page,X))
    ADC $0E              ; 65 0E | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    BPL $10              ; 10 10 | Branch if positive
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    STZ $20              ; 64 20 | Store zero to zero page
    LDX $10              ; A6 10 | Load from zero page into X register
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $18              ; F0 18 | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    STX $10              ; 86 10 | Store X register to zero page
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    REP #$30             ; C2 30 | Reset processor status bits
    DEC $06              ; C6 06 | Decrement (zero page)
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $03              ; F0 03 | Branch if equal
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    BEQ $10              ; F0 10 | Branch if equal
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    LDA $06              ; A5 06 | Load from zero page into accumulator
    ORA $16A5,Y          ; 19 A5 16 | Logical OR with accumulator (absolute,Y)
    BMI $03              ; 30 03 | Branch if negative
    LDY #$01             ; A0 01 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_261
; Address: $CFA55F
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_261:
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C7 C7 | Load from absolute long,X into accumulator
    STA $18              ; 85 18 | Store accumulator to zero page
    LDA                  ; BF 49 C5 C7 | Load from absolute long,X into accumulator
    STA $12              ; 85 12 | Store accumulator to zero page
    TAX                  ; AA | Transfer accumulator to X register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    SEP #$20             ; E2 20 | Set processor status bits
    XBA                  ; EB | Exchange accumulator bytes
    BMI $0A              ; 30 0A | Branch if negative
    CLC                  ; 18 | Clear carry flag
    ADC $0A              ; 65 0A | Add with carry (zero page)
    CMP #$F0             ; C9 F0 | Compare accumulator (immediate)
    BMI $06              ; 30 06 | Branch if negative
    TAY                  ; A8 | Transfer accumulator to Y register
    CLC                  ; 18 | Clear carry flag
    ADC $0A              ; 65 0A | Add with carry (zero page)
    XBA                  ; EB | Exchange accumulator bytes
    BPL $28              ; 10 28 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    BPL $26              ; 10 26 | Branch if positive
    CMP #$F1             ; C9 F1 | Compare accumulator (immediate)
    BCS $03              ; B0 03 | Branch if carry set
    REP #$20             ; C2 20 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    ORA #$A5             ; 09 A5 | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $18              ; 05 18 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_263
; Address: $CFA5AC
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_263:
    JSR $1580            ; 20 80 15 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    REP #$20             ; C2 20 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    ORA $A5              ; 05 A5 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_266
; Address: $CFA5CB
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_266:
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($85,X)          ; C1 85 | Compare accumulator ((zero page,X))
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ASL $18EB            ; 0E EB 18 | Arithmetic shift left (absolute)
    ADC $1E              ; 65 1E | Add with carry (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $4632,X          ; BD 32 46 | Load from absolute,X into accumulator
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ADC $0C              ; 65 0C | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    BRA $1C              ; 80 1C | Branch always
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($85,X)          ; C1 85 | Compare accumulator ((zero page,X))
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ASL $18EB            ; 0E EB 18 | Arithmetic shift left (absolute)
    ADC $1E              ; 65 1E | Add with carry (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $4632,X          ; BD 32 46 | Load from absolute,X into accumulator
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ADC $0E              ; 65 0E | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    BPL $10              ; 10 10 | Branch if positive
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    STZ $20              ; 64 20 | Store zero to zero page
    LDX $10              ; A6 10 | Load from zero page into X register
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $18              ; F0 18 | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    STX $10              ; 86 10 | Store X register to zero page
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    SEC                  ; 38 | Set carry flag
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    REP #$30             ; C2 30 | Reset processor status bits
    DEC $06              ; C6 06 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_267
; Address: $CFA62F
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_267:
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $03              ; F0 03 | Branch if equal
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    BEQ $10              ; F0 10 | Branch if equal
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    LDA $06              ; A5 06 | Load from zero page into accumulator
    CLC                  ; 18 | Clear carry flag
    ASL $01A0            ; 0E A0 01 | Arithmetic shift left (absolute)
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C7 C7 | Load from absolute long,X into accumulator
    STA $18              ; 85 18 | Store accumulator to zero page
    LDA                  ; BF 49 C5 C7 | Load from absolute long,X into accumulator
    STA $12              ; 85 12 | Store accumulator to zero page
    TAX                  ; AA | Transfer accumulator to X register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    SEP #$20             ; E2 20 | Set processor status bits
    XBA                  ; EB | Exchange accumulator bytes
    BMI $0A              ; 30 0A | Branch if negative
    CLC                  ; 18 | Clear carry flag
    ADC $0A              ; 65 0A | Add with carry (zero page)
    CMP #$F0             ; C9 F0 | Compare accumulator (immediate)
    BMI $06              ; 30 06 | Branch if negative
    DEY                  ; 88 | Decrement Y register
    CLC                  ; 18 | Clear carry flag
    ADC $0A              ; 65 0A | Add with carry (zero page)
    XBA                  ; EB | Exchange accumulator bytes
    BPL $28              ; 10 28 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    BPL $26              ; 10 26 | Branch if positive
    CMP #$F1             ; C9 F1 | Compare accumulator (immediate)
    BCS $03              ; B0 03 | Branch if carry set
    REP #$20             ; C2 20 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    ORA #$A5             ; 09 A5 | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $18              ; 05 18 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_26A
; Address: $CFA6A5
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_26A:
    JSR $1580            ; 20 80 15 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    REP #$20             ; C2 20 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    ORA $A5              ; 05 A5 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_26C
; Address: $CFA6C0
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_26C:
    JSR $0ED0            ; 20 D0 0E | Jump to subroutine
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($18,X)          ; C1 18 | Compare accumulator ((zero page,X))
    ADC $0C              ; 65 0C | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    BRA $0C              ; 80 0C | Branch always
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($18,X)          ; C1 18 | Compare accumulator ((zero page,X))
    ADC $0E              ; 65 0E | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    BPL $10              ; 10 10 | Branch if positive
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    STZ $20              ; 64 20 | Store zero to zero page
    LDX $10              ; A6 10 | Load from zero page into X register
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $18              ; F0 18 | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    STX $10              ; 86 10 | Store X register to zero page
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    CLI                  ; 58 | Clear interrupt disable flag
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    REP #$30             ; C2 30 | Reset processor status bits
    DEC $06              ; C6 06 | Decrement (zero page)
    DEC $04              ; C6 04 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_26D
; Address: $CFA70A
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_26D:
    BEQ $03              ; F0 03 | Branch if equal
    EOR #$FF             ; 49 FF | Exclusive OR with accumulator (immediate)
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    BEQ $10              ; F0 10 | Branch if equal
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    LDA $06              ; A5 06 | Load from zero page into accumulator
    ROR                  ; 6A | Rotate right (accumulator)
    LDA $16              ; A5 16 | Load from zero page into accumulator
    BMI $03              ; 30 03 | Branch if negative
    LDY #$01             ; A0 01 | Load immediate value into Y register
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C7 C7 | Load from absolute long,X into accumulator
    STA $18              ; 85 18 | Store accumulator to zero page
    LDA                  ; BF 49 C5 C7 | Load from absolute long,X into accumulator
    STA $12              ; 85 12 | Store accumulator to zero page
    TAX                  ; AA | Transfer accumulator to X register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    SEP #$20             ; E2 20 | Set processor status bits
    XBA                  ; EB | Exchange accumulator bytes
    BPL $07              ; 10 07 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ADC $0A              ; 65 0A | Add with carry (zero page)
    CMP #$F0             ; C9 F0 | Compare accumulator (immediate)
    BMI $03              ; 30 03 | Branch if negative
    LDA $00              ; A5 00 | Load from zero page into accumulator
    XBA                  ; EB | Exchange accumulator bytes
    BPL $28              ; 10 28 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    BPL $26              ; 10 26 | Branch if positive
    CMP #$F1             ; C9 F1 | Compare accumulator (immediate)
    BCS $03              ; B0 03 | Branch if carry set
    REP #$20             ; C2 20 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    ORA #$A5             ; 09 A5 | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $18              ; 05 18 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_26F
; Address: $CFA77E
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_26F:
    JSR $1580            ; 20 80 15 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    REP #$20             ; C2 20 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    ORA $A5              ; 05 A5 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_271
; Address: $CFA799
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_271:
    JSR $1ED0            ; 20 D0 1E | Jump to subroutine
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($85,X)          ; C1 85 | Compare accumulator ((zero page,X))
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ASL $18EB            ; 0E EB 18 | Arithmetic shift left (absolute)
    ADC $1E              ; 65 1E | Add with carry (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $4632,X          ; BD 32 46 | Load from absolute,X into accumulator
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ADC $0C              ; 65 0C | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    BRA $1C              ; 80 1C | Branch always
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($85,X)          ; C1 85 | Compare accumulator ((zero page,X))
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ASL $18EB            ; 0E EB 18 | Arithmetic shift left (absolute)
    ADC $1E              ; 65 1E | Add with carry (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $4632,X          ; BD 32 46 | Load from absolute,X into accumulator
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ADC $0E              ; 65 0E | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    BPL $10              ; 10 10 | Branch if positive
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_272
; Address: $CFA7EA
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_272:
    STZ $20              ; 64 20 | Store zero to zero page
    LDX $10              ; A6 10 | Load from zero page into X register
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $18              ; F0 18 | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    STX $10              ; 86 10 | Store X register to zero page
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    REP #$30             ; C2 30 | Reset processor status bits
    DEC $06              ; C6 06 | Decrement (zero page)
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $03              ; F0 03 | Branch if equal
    BIT $A6FF            ; 2C FF A6 | Test bits in accumulator (absolute)
    BPL $A5              ; 10 A5 | Branch if positive

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_273
; Address: $CFA80B
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_273:
    JSR $10F0            ; 20 F0 10 | Jump to subroutine
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    LDA $06              ; A5 06 | Load from zero page into accumulator
    ADC ($16),Y          ; 71 16 | Add with carry ((zero page),Y)
    ASL $01A0            ; 0E A0 01 | Arithmetic shift left (absolute)
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C7 C7 | Load from absolute long,X into accumulator
    STA $18              ; 85 18 | Store accumulator to zero page
    LDA                  ; BF 49 C5 C7 | Load from absolute long,X into accumulator
    STA $12              ; 85 12 | Store accumulator to zero page
    TAX                  ; AA | Transfer accumulator to X register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    SEP #$20             ; E2 20 | Set processor status bits
    XBA                  ; EB | Exchange accumulator bytes
    BPL $07              ; 10 07 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ADC $0A              ; 65 0A | Add with carry (zero page)
    CMP #$F0             ; C9 F0 | Compare accumulator (immediate)
    BMI $03              ; 30 03 | Branch if negative
    STA $00              ; 85 00 | Store accumulator to zero page
    XBA                  ; EB | Exchange accumulator bytes
    BPL $28              ; 10 28 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    BPL $26              ; 10 26 | Branch if positive
    CMP #$F1             ; C9 F1 | Compare accumulator (immediate)
    BCS $03              ; B0 03 | Branch if carry set

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_274
; Address: $CFA85B
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_274:
    REP #$20             ; C2 20 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    ORA #$A5             ; 09 A5 | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $18              ; 05 18 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_276
; Address: $CFA874
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_276:
    JSR $1580            ; 20 80 15 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    REP #$20             ; C2 20 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    ORA $A5              ; 05 A5 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_278
; Address: $CFA88F
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_278:
    JSR $0ED0            ; 20 D0 0E | Jump to subroutine
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($18,X)          ; C1 18 | Compare accumulator ((zero page,X))
    ADC $0C              ; 65 0C | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    BRA $0C              ; 80 0C | Branch always
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($18,X)          ; C1 18 | Compare accumulator ((zero page,X))
    ADC $0E              ; 65 0E | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    BPL $10              ; 10 10 | Branch if positive
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    STZ $20              ; 64 20 | Store zero to zero page
    LDX $10              ; A6 10 | Load from zero page into X register
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $18              ; F0 18 | Branch if equal
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_279
; Address: $CFA8C9
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_279:
    INX                  ; E8 | Increment X register
    STX $10              ; 86 10 | Store X register to zero page
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    REP #$30             ; C2 30 | Reset processor status bits
    DEC $06              ; C6 06 | Decrement (zero page)
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $A6FF            ; 4C FF A6 | Jump to address
    BPL $A5              ; 10 A5 | Branch if positive

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_27A
; Address: $CFA8E1
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_27A:
    JSR $10F0            ; 20 F0 10 | Jump to subroutine
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    LDA $06              ; A5 06 | Load from zero page into accumulator
    LDA $16              ; A5 16 | Load from zero page into accumulator
    BMI $03              ; 30 03 | Branch if negative
    LDY #$01             ; A0 01 | Load immediate value into Y register
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C7 C7 | Load from absolute long,X into accumulator
    STA $18              ; 85 18 | Store accumulator to zero page
    LDA                  ; BF 49 C5 C7 | Load from absolute long,X into accumulator
    STA $12              ; 85 12 | Store accumulator to zero page
    TAX                  ; AA | Transfer accumulator to X register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    SEP #$20             ; E2 20 | Set processor status bits
    XBA                  ; EB | Exchange accumulator bytes
    BPL $03              ; 10 03 | Branch if positive
    LDY $1800            ; AC 00 18 | Load from absolute address into Y register
    ADC $0A              ; 65 0A | Add with carry (zero page)
    CMP #$F0             ; C9 F0 | Compare accumulator (immediate)
    BMI $F6              ; 30 F6 | Branch if negative
    XBA                  ; EB | Exchange accumulator bytes
    BPL $28              ; 10 28 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    BPL $26              ; 10 26 | Branch if positive
    CMP #$F1             ; C9 F1 | Compare accumulator (immediate)
    BCS $03              ; B0 03 | Branch if carry set
    REP #$20             ; C2 20 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $F0              ; 10 F0 | Branch if positive

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_27B
; Address: $CFA940
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_27B:
    ORA #$A5             ; 09 A5 | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $18              ; 05 18 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_27D
; Address: $CFA94D
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_27D:
    JSR $1580            ; 20 80 15 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    REP #$20             ; C2 20 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    ORA $A5              ; 05 A5 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_27F
; Address: $CFA968
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_27F:
    JSR $1ED0            ; 20 D0 1E | Jump to subroutine
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($85,X)          ; C1 85 | Compare accumulator ((zero page,X))
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ASL $18EB            ; 0E EB 18 | Arithmetic shift left (absolute)
    ADC $1E              ; 65 1E | Add with carry (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $4632,X          ; BD 32 46 | Load from absolute,X into accumulator
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ADC $0C              ; 65 0C | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    BRA $1C              ; 80 1C | Branch always
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($85,X)          ; C1 85 | Compare accumulator ((zero page,X))
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ASL $18EB            ; 0E EB 18 | Arithmetic shift left (absolute)
    ADC $1E              ; 65 1E | Add with carry (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $4632,X          ; BD 32 46 | Load from absolute,X into accumulator
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ADC $0E              ; 65 0E | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_280
; Address: $CFA9AB
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_280:
    BPL $10              ; 10 10 | Branch if positive
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    STZ $20              ; 64 20 | Store zero to zero page
    LDX $10              ; A6 10 | Load from zero page into X register
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $18              ; F0 18 | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    STX $10              ; 86 10 | Store X register to zero page
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    REP #$30             ; C2 30 | Reset processor status bits
    DEC $06              ; C6 06 | Decrement (zero page)
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $03              ; F0 03 | Branch if equal
    BIT $A6FF            ; 2C FF A6 | Test bits in accumulator (absolute)
    BPL $A5              ; 10 A5 | Branch if positive

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_281
; Address: $CFA9DA
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_281:
    JSR $10F0            ; 20 F0 10 | Jump to subroutine
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    LDA $06              ; A5 06 | Load from zero page into accumulator
    LDX #$14             ; A2 14 | Load immediate value into X register
    ASL $01A0            ; 0E A0 01 | Arithmetic shift left (absolute)
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C7 C7 | Load from absolute long,X into accumulator
    STA $18              ; 85 18 | Store accumulator to zero page
    LDA                  ; BF 49 C5 C7 | Load from absolute long,X into accumulator
    STA $12              ; 85 12 | Store accumulator to zero page
    TAX                  ; AA | Transfer accumulator to X register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    SEP #$20             ; E2 20 | Set processor status bits
    XBA                  ; EB | Exchange accumulator bytes
    BPL $03              ; 10 03 | Branch if positive
    STY $1800            ; 8C 00 18 | Store Y register to absolute address
    ADC $0A              ; 65 0A | Add with carry (zero page)
    CMP #$F0             ; C9 F0 | Compare accumulator (immediate)
    BMI $F6              ; 30 F6 | Branch if negative
    XBA                  ; EB | Exchange accumulator bytes
    BPL $28              ; 10 28 | Branch if positive

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_282
; Address: $CFAA1E
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_282:
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    BPL $26              ; 10 26 | Branch if positive
    CMP #$F1             ; C9 F1 | Compare accumulator (immediate)
    BCS $03              ; B0 03 | Branch if carry set
    REP #$20             ; C2 20 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    ORA #$A5             ; 09 A5 | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $18              ; 05 18 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_284
; Address: $CFAA43
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_284:
    JSR $1580            ; 20 80 15 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    REP #$20             ; C2 20 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    ORA $A5              ; 05 A5 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_286
; Address: $CFAA5E
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_286:
    JSR $0ED0            ; 20 D0 0E | Jump to subroutine
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($18,X)          ; C1 18 | Compare accumulator ((zero page,X))
    ADC $0C              ; 65 0C | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    BRA $0C              ; 80 0C | Branch always
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($18,X)          ; C1 18 | Compare accumulator ((zero page,X))
    ADC $0E              ; 65 0E | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    BPL $10              ; 10 10 | Branch if positive
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_287
; Address: $CFAA8F
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_287:
    STZ $20              ; 64 20 | Store zero to zero page
    LDX $10              ; A6 10 | Load from zero page into X register
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $18              ; F0 18 | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    STX $10              ; 86 10 | Store X register to zero page
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    REP #$30             ; C2 30 | Reset processor status bits
    DEC $06              ; C6 06 | Decrement (zero page)
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $A6FF            ; 4C FF A6 | Jump to address
    BPL $A5              ; 10 A5 | Branch if positive

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_288
; Address: $CFAAB0
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_288:
    JSR $10F0            ; 20 F0 10 | Jump to subroutine
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    LDA $06              ; A5 06 | Load from zero page into accumulator
    CPY $A513            ; CC 13 A5 | Compare Y register (absolute)
    BMI $03              ; 30 03 | Branch if negative
    LDY #$01             ; A0 01 | Load immediate value into Y register
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C7 C7 | Load from absolute long,X into accumulator
    STA $18              ; 85 18 | Store accumulator to zero page
    LDA                  ; BF 49 C5 C7 | Load from absolute long,X into accumulator
    STA $12              ; 85 12 | Store accumulator to zero page
    TAX                  ; AA | Transfer accumulator to X register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    SEP #$20             ; E2 20 | Set processor status bits
    XBA                  ; EB | Exchange accumulator bytes
    BPL $0C              ; 10 0C | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ADC $0A              ; 65 0A | Add with carry (zero page)
    BPL $0A              ; 10 0A | Branch if positive
    CMP #$F0             ; C9 F0 | Compare accumulator (immediate)
    BCS $06              ; B0 06 | Branch if carry set
    DEY                  ; 88 | Decrement Y register
    CLC                  ; 18 | Clear carry flag
    ADC $0A              ; 65 0A | Add with carry (zero page)
    XBA                  ; EB | Exchange accumulator bytes
    BMI $08              ; 30 08 | Branch if negative
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_289
; Address: $CFAAFD
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_289:
    ADC $08              ; 65 08 | Add with carry (zero page)
    BMI $06              ; 30 06 | Branch if negative
    PLY                  ; 7A | Pull Y register from stack
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    REP #$20             ; C2 20 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    ORA $A5              ; 05 A5 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_28B
; Address: $CFAB1C
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_28B:
    JSR $1ED0            ; 20 D0 1E | Jump to subroutine
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($85,X)          ; C1 85 | Compare accumulator ((zero page,X))
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ASL $18EB            ; 0E EB 18 | Arithmetic shift left (absolute)
    ADC $1E              ; 65 1E | Add with carry (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $4632,X          ; BD 32 46 | Load from absolute,X into accumulator
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ADC $0C              ; 65 0C | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    BRA $1C              ; 80 1C | Branch always
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($85,X)          ; C1 85 | Compare accumulator ((zero page,X))
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ASL $18EB            ; 0E EB 18 | Arithmetic shift left (absolute)
    ADC $1E              ; 65 1E | Add with carry (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $4632,X          ; BD 32 46 | Load from absolute,X into accumulator
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ADC $0E              ; 65 0E | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    BPL $10              ; 10 10 | Branch if positive
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_28C
; Address: $CFAB67
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_28C:
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    STZ $20              ; 64 20 | Store zero to zero page
    LDX $10              ; A6 10 | Load from zero page into X register
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $18              ; F0 18 | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    STX $10              ; 86 10 | Store X register to zero page
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    REP #$30             ; C2 30 | Reset processor status bits
    DEC $06              ; C6 06 | Decrement (zero page)
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $03              ; F0 03 | Branch if equal
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    BEQ $10              ; F0 10 | Branch if equal
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    LDA $06              ; A5 06 | Load from zero page into accumulator
    INC $0412            ; EE 12 04 | Increment (absolute)
    ASL $01A0            ; 0E A0 01 | Arithmetic shift left (absolute)
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C7 C7 | Load from absolute long,X into accumulator
    STA $18              ; 85 18 | Store accumulator to zero page
    LDA                  ; BF 49 C5 C7 | Load from absolute long,X into accumulator
    STA $12              ; 85 12 | Store accumulator to zero page
    TAX                  ; AA | Transfer accumulator to X register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    SEP #$20             ; E2 20 | Set processor status bits
    XBA                  ; EB | Exchange accumulator bytes
    BPL $0C              ; 10 0C | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ADC $0A              ; 65 0A | Add with carry (zero page)
    BPL $0A              ; 10 0A | Branch if positive
    CMP #$F0             ; C9 F0 | Compare accumulator (immediate)
    BCS $06              ; B0 06 | Branch if carry set
    PLA                  ; 68 | Pull accumulator from stack
    CLC                  ; 18 | Clear carry flag
    ADC $0A              ; 65 0A | Add with carry (zero page)
    XBA                  ; EB | Exchange accumulator bytes
    BMI $08              ; 30 08 | Branch if negative

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_28D
; Address: $CFABD7
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_28D:
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    BMI $06              ; 30 06 | Branch if negative
    PHY                  ; 5A | Push Y register to stack
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    REP #$20             ; C2 20 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    ORA $A5              ; 05 A5 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_28F
; Address: $CFABF7
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_28F:
    JSR $0ED0            ; 20 D0 0E | Jump to subroutine
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($18,X)          ; C1 18 | Compare accumulator ((zero page,X))
    ADC $0C              ; 65 0C | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    BRA $0C              ; 80 0C | Branch always
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($18,X)          ; C1 18 | Compare accumulator ((zero page,X))
    ADC $0E              ; 65 0E | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    BPL $10              ; 10 10 | Branch if positive
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    STZ $20              ; 64 20 | Store zero to zero page
    LDX $10              ; A6 10 | Load from zero page into X register
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $18              ; F0 18 | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    STX $10              ; 86 10 | Store X register to zero page
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    REP #$30             ; C2 30 | Reset processor status bits
    DEC $06              ; C6 06 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_290
; Address: $CFAC3F
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_290:
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $03              ; F0 03 | Branch if equal
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    BEQ $10              ; F0 10 | Branch if equal
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    LDA $06              ; A5 06 | Load from zero page into accumulator
    LDA $16              ; A5 16 | Load from zero page into accumulator
    BMI $03              ; 30 03 | Branch if negative
    LDY #$01             ; A0 01 | Load immediate value into Y register
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C7 C7 | Load from absolute long,X into accumulator
    STA $18              ; 85 18 | Store accumulator to zero page
    LDA                  ; BF 49 C5 C7 | Load from absolute long,X into accumulator
    STA $12              ; 85 12 | Store accumulator to zero page
    TAX                  ; AA | Transfer accumulator to X register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    SEP #$20             ; E2 20 | Set processor status bits
    XBA                  ; EB | Exchange accumulator bytes
    BMI $0A              ; 30 0A | Branch if negative
    CLC                  ; 18 | Clear carry flag
    ADC $0A              ; 65 0A | Add with carry (zero page)
    CMP #$F0             ; C9 F0 | Compare accumulator (immediate)
    BMI $06              ; 30 06 | Branch if negative
    DEY                  ; 88 | Decrement Y register
    CLC                  ; 18 | Clear carry flag
    ADC $0A              ; 65 0A | Add with carry (zero page)
    XBA                  ; EB | Exchange accumulator bytes
    BMI $08              ; 30 08 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    BMI $06              ; 30 06 | Branch if negative
    PLY                  ; 7A | Pull Y register from stack
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    REP #$20             ; C2 20 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    ORA $A5              ; 05 A5 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_292
; Address: $CFACB3
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_292:
    JSR $1ED0            ; 20 D0 1E | Jump to subroutine
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($85,X)          ; C1 85 | Compare accumulator ((zero page,X))
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ASL $18EB            ; 0E EB 18 | Arithmetic shift left (absolute)
    ADC $1E              ; 65 1E | Add with carry (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $4632,X          ; BD 32 46 | Load from absolute,X into accumulator
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ADC $0C              ; 65 0C | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    BRA $1C              ; 80 1C | Branch always
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($85,X)          ; C1 85 | Compare accumulator ((zero page,X))
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ASL $18EB            ; 0E EB 18 | Arithmetic shift left (absolute)
    ADC $1E              ; 65 1E | Add with carry (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $4632,X          ; BD 32 46 | Load from absolute,X into accumulator
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ADC $0E              ; 65 0E | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    BPL $10              ; 10 10 | Branch if positive
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    STZ $20              ; 64 20 | Store zero to zero page
    LDX $10              ; A6 10 | Load from zero page into X register
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $18              ; F0 18 | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    STX $10              ; 86 10 | Store X register to zero page
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    CLI                  ; 58 | Clear interrupt disable flag
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_293
; Address: $CFAD17
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_293:
    REP #$30             ; C2 30 | Reset processor status bits
    DEC $06              ; C6 06 | Decrement (zero page)
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $03              ; F0 03 | Branch if equal
    EOR #$FF             ; 49 FF | Exclusive OR with accumulator (immediate)
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    BEQ $10              ; F0 10 | Branch if equal
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    LDA $06              ; A5 06 | Load from zero page into accumulator
    ORA ($04),Y          ; 11 04 | Logical OR with accumulator ((zero page),Y)
    ASL $01A0            ; 0E A0 01 | Arithmetic shift left (absolute)
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C7 C7 | Load from absolute long,X into accumulator
    STA $18              ; 85 18 | Store accumulator to zero page
    LDA                  ; BF 49 C5 C7 | Load from absolute long,X into accumulator
    STA $12              ; 85 12 | Store accumulator to zero page
    TAX                  ; AA | Transfer accumulator to X register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    SEP #$20             ; E2 20 | Set processor status bits
    XBA                  ; EB | Exchange accumulator bytes
    BMI $0A              ; 30 0A | Branch if negative
    CLC                  ; 18 | Clear carry flag
    ADC $0A              ; 65 0A | Add with carry (zero page)
    CMP #$F0             ; C9 F0 | Compare accumulator (immediate)
    BMI $06              ; 30 06 | Branch if negative
    PLA                  ; 68 | Pull accumulator from stack
    CLC                  ; 18 | Clear carry flag
    ADC $0A              ; 65 0A | Add with carry (zero page)
    XBA                  ; EB | Exchange accumulator bytes
    BMI $08              ; 30 08 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    BMI $06              ; 30 06 | Branch if negative
    PHY                  ; 5A | Push Y register to stack
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    REP #$20             ; C2 20 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    ORA $A5              ; 05 A5 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_296
; Address: $CFAD8C
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_296:
    JSR $0ED0            ; 20 D0 0E | Jump to subroutine
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($18,X)          ; C1 18 | Compare accumulator ((zero page,X))
    ADC $0C              ; 65 0C | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    BRA $0C              ; 80 0C | Branch always
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($18,X)          ; C1 18 | Compare accumulator ((zero page,X))
    ADC $0E              ; 65 0E | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    BPL $10              ; 10 10 | Branch if positive
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    STZ $20              ; 64 20 | Store zero to zero page
    LDX $10              ; A6 10 | Load from zero page into X register
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $18              ; F0 18 | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    STX $10              ; 86 10 | Store X register to zero page
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    SEI                  ; 78 | Set interrupt disable flag
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    REP #$30             ; C2 30 | Reset processor status bits
    DEC $06              ; C6 06 | Decrement (zero page)
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $03              ; F0 03 | Branch if equal
    ADC #$FF             ; 69 FF | Add with carry (immediate)
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    BEQ $10              ; F0 10 | Branch if equal
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_297
; Address: $CFADF1
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_297:
    LDA $06              ; A5 06 | Load from zero page into accumulator
    STZ $A510,X          ; 9E 10 A5 | Store zero to absolute,X
    BMI $03              ; 30 03 | Branch if negative
    LDY #$01             ; A0 01 | Load immediate value into Y register
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C7 C7 | Load from absolute long,X into accumulator
    STA $18              ; 85 18 | Store accumulator to zero page
    LDA                  ; BF 49 C5 C7 | Load from absolute long,X into accumulator
    STA $12              ; 85 12 | Store accumulator to zero page
    TAX                  ; AA | Transfer accumulator to X register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    SEP #$20             ; E2 20 | Set processor status bits
    XBA                  ; EB | Exchange accumulator bytes
    BPL $07              ; 10 07 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ADC $0A              ; 65 0A | Add with carry (zero page)
    CMP #$F0             ; C9 F0 | Compare accumulator (immediate)
    BMI $03              ; 30 03 | Branch if negative
    STA $00              ; 85 00 | Store accumulator to zero page
    XBA                  ; EB | Exchange accumulator bytes
    BMI $08              ; 30 08 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    BMI $06              ; 30 06 | Branch if negative
    PLY                  ; 7A | Pull Y register from stack
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    REP #$20             ; C2 20 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    ORA $A5              ; 05 A5 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_299
; Address: $CFAE45
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_299:
    JSR $1ED0            ; 20 D0 1E | Jump to subroutine
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($85,X)          ; C1 85 | Compare accumulator ((zero page,X))
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ASL $18EB            ; 0E EB 18 | Arithmetic shift left (absolute)
    ADC $1E              ; 65 1E | Add with carry (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $4632,X          ; BD 32 46 | Load from absolute,X into accumulator
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ADC $0C              ; 65 0C | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_29A
; Address: $CFAE5F
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_29A:
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    BRA $1C              ; 80 1C | Branch always
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($85,X)          ; C1 85 | Compare accumulator ((zero page,X))
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ASL $18EB            ; 0E EB 18 | Arithmetic shift left (absolute)
    ADC $1E              ; 65 1E | Add with carry (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $4632,X          ; BD 32 46 | Load from absolute,X into accumulator
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ADC $0E              ; 65 0E | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    BPL $10              ; 10 10 | Branch if positive
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    STZ $20              ; 64 20 | Store zero to zero page
    LDX $10              ; A6 10 | Load from zero page into X register
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $18              ; F0 18 | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    STX $10              ; 86 10 | Store X register to zero page
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    REP #$30             ; C2 30 | Reset processor status bits
    DEC $06              ; C6 06 | Decrement (zero page)
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $A6FF            ; 4C FF A6 | Jump to address
    BPL $A5              ; 10 A5 | Branch if positive

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_29B
; Address: $CFAEB7
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_29B:
    JSR $10F0            ; 20 F0 10 | Jump to subroutine
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    LDA $06              ; A5 06 | Load from zero page into accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_29C
; Address: $CFAECD
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_29C:
    CMP $0F              ; C5 0F | Compare accumulator (zero page)
    ASL $01A0            ; 0E A0 01 | Arithmetic shift left (absolute)
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C7 C7 | Load from absolute long,X into accumulator
    STA $18              ; 85 18 | Store accumulator to zero page
    LDA                  ; BF 49 C5 C7 | Load from absolute long,X into accumulator
    STA $12              ; 85 12 | Store accumulator to zero page
    TAX                  ; AA | Transfer accumulator to X register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    SEP #$20             ; E2 20 | Set processor status bits
    XBA                  ; EB | Exchange accumulator bytes
    BPL $07              ; 10 07 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ADC $0A              ; 65 0A | Add with carry (zero page)
    CMP #$F0             ; C9 F0 | Compare accumulator (immediate)
    BMI $03              ; 30 03 | Branch if negative
    ADC $00              ; 65 00 | Add with carry (zero page)
    XBA                  ; EB | Exchange accumulator bytes
    BMI $08              ; 30 08 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    BMI $06              ; 30 06 | Branch if negative
    PHY                  ; 5A | Push Y register to stack
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    REP #$20             ; C2 20 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    ORA $A5              ; 05 A5 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_29E
; Address: $CFAF1B
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_29E:
    JSR $0ED0            ; 20 D0 0E | Jump to subroutine
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($18,X)          ; C1 18 | Compare accumulator ((zero page,X))
    ADC $0C              ; 65 0C | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    BRA $0C              ; 80 0C | Branch always
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($18,X)          ; C1 18 | Compare accumulator ((zero page,X))
    ADC $0E              ; 65 0E | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    LDX $10              ; A6 10 | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_29F
; Address: $CFAF3A
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_29F:
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    BPL $10              ; 10 10 | Branch if positive
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    STZ $20              ; 64 20 | Store zero to zero page
    LDX $10              ; A6 10 | Load from zero page into X register
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $18              ; F0 18 | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    STX $10              ; 86 10 | Store X register to zero page
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    REP #$30             ; C2 30 | Reset processor status bits
    DEC $06              ; C6 06 | Decrement (zero page)
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $03              ; F0 03 | Branch if equal
    JMP ($A6FF)          ; 6C FF A6 | Jump to address (absolute indirect)
    BPL $A5              ; 10 A5 | Branch if positive

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2A0
; Address: $CFAF6D
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2A0:
    JSR $10F0            ; 20 F0 10 | Jump to subroutine
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    LDA $06              ; A5 06 | Load from zero page into accumulator
    LDA $16              ; A5 16 | Load from zero page into accumulator
    BMI $03              ; 30 03 | Branch if negative
    LDY #$01             ; A0 01 | Load immediate value into Y register
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C7 C7 | Load from absolute long,X into accumulator
    STA $18              ; 85 18 | Store accumulator to zero page
    LDA                  ; BF 49 C5 C7 | Load from absolute long,X into accumulator
    STA $12              ; 85 12 | Store accumulator to zero page
    TAX                  ; AA | Transfer accumulator to X register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    SEP #$20             ; E2 20 | Set processor status bits
    XBA                  ; EB | Exchange accumulator bytes
    BPL $03              ; 10 03 | Branch if positive
    STY $1800            ; 8C 00 18 | Store Y register to absolute address
    ADC $0A              ; 65 0A | Add with carry (zero page)
    CMP #$F0             ; C9 F0 | Compare accumulator (immediate)
    BMI $F6              ; 30 F6 | Branch if negative

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2A1
; Address: $CFAFB1
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2A1:
    XBA                  ; EB | Exchange accumulator bytes
    BMI $08              ; 30 08 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    BMI $06              ; 30 06 | Branch if negative
    PLY                  ; 7A | Pull Y register from stack
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    REP #$20             ; C2 20 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    ORA $A5              ; 05 A5 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2A3
; Address: $CFAFD4
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2A3:
    JSR $1ED0            ; 20 D0 1E | Jump to subroutine
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($85,X)          ; C1 85 | Compare accumulator ((zero page,X))
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ASL $18EB            ; 0E EB 18 | Arithmetic shift left (absolute)
    ADC $1E              ; 65 1E | Add with carry (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $4632,X          ; BD 32 46 | Load from absolute,X into accumulator
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ADC $0C              ; 65 0C | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    BRA $1C              ; 80 1C | Branch always
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($85,X)          ; C1 85 | Compare accumulator ((zero page,X))
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ASL $18EB            ; 0E EB 18 | Arithmetic shift left (absolute)
    ADC $1E              ; 65 1E | Add with carry (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $4632,X          ; BD 32 46 | Load from absolute,X into accumulator
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ADC $0E              ; 65 0E | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    BPL $10              ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2A4
; Address: $CFB019
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2A4:
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    STZ $20              ; 64 20 | Store zero to zero page
    LDX $10              ; A6 10 | Load from zero page into X register
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $18              ; F0 18 | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    STX $10              ; 86 10 | Store X register to zero page
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    REP #$30             ; C2 30 | Reset processor status bits
    DEC $06              ; C6 06 | Decrement (zero page)
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $A6FF            ; 4C FF A6 | Jump to address
    BPL $A5              ; 10 A5 | Branch if positive

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2A5
; Address: $CFB046
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2A5:
    JSR $10F0            ; 20 F0 10 | Jump to subroutine
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    LDA $06              ; A5 06 | Load from zero page into accumulator
    ASL $0C04            ; 0E 04 0C | Arithmetic shift left (absolute)
    ASL $01A0            ; 0E A0 01 | Arithmetic shift left (absolute)
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C7 C7 | Load from absolute long,X into accumulator
    STA $18              ; 85 18 | Store accumulator to zero page
    LDA                  ; BF 49 C5 C7 | Load from absolute long,X into accumulator
    STA $12              ; 85 12 | Store accumulator to zero page
    TAX                  ; AA | Transfer accumulator to X register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    SEP #$20             ; E2 20 | Set processor status bits
    XBA                  ; EB | Exchange accumulator bytes
    BPL $03              ; 10 03 | Branch if positive
    JMP ($1800)          ; 6C 00 18 | Jump to address (absolute indirect)
    ADC $0A              ; 65 0A | Add with carry (zero page)
    CMP #$F0             ; C9 F0 | Compare accumulator (immediate)
    BMI $F6              ; 30 F6 | Branch if negative
    XBA                  ; EB | Exchange accumulator bytes
    BMI $08              ; 30 08 | Branch if negative
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2A6
; Address: $CFB08B
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2A6:
    ADC $08              ; 65 08 | Add with carry (zero page)
    BMI $06              ; 30 06 | Branch if negative
    PHY                  ; 5A | Push Y register to stack
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    REP #$20             ; C2 20 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    ORA $A5              ; 05 A5 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2A8
; Address: $CFB0AA
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2A8:
    JSR $0ED0            ; 20 D0 0E | Jump to subroutine
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($18,X)          ; C1 18 | Compare accumulator ((zero page,X))
    ADC $0C              ; 65 0C | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    BRA $0C              ; 80 0C | Branch always
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($18,X)          ; C1 18 | Compare accumulator ((zero page,X))
    ADC $0E              ; 65 0E | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    BPL $10              ; 10 10 | Branch if positive
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    STZ $20              ; 64 20 | Store zero to zero page
    LDX $10              ; A6 10 | Load from zero page into X register
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $18              ; F0 18 | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    STX $10              ; 86 10 | Store X register to zero page
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    REP #$30             ; C2 30 | Reset processor status bits
    DEC $06              ; C6 06 | Decrement (zero page)
    DEC $04              ; C6 04 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2A9
; Address: $CFB0F4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2A9:
    BEQ $03              ; F0 03 | Branch if equal
    JMP ($A6FF)          ; 6C FF A6 | Jump to address (absolute indirect)
    BPL $A5              ; 10 A5 | Branch if positive

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2AA
; Address: $CFB0FC
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2AA:
    JSR $10F0            ; 20 F0 10 | Jump to subroutine
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    LDA $06              ; A5 06 | Load from zero page into accumulator
    BRA $0D              ; 80 0D | Branch always
    LDA $16              ; A5 16 | Load from zero page into accumulator
    BMI $03              ; 30 03 | Branch if negative
    LDY #$01             ; A0 01 | Load immediate value into Y register
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C7 C7 | Load from absolute long,X into accumulator
    STA $18              ; 85 18 | Store accumulator to zero page
    LDA                  ; BF 49 C5 C7 | Load from absolute long,X into accumulator
    STA $12              ; 85 12 | Store accumulator to zero page
    TAX                  ; AA | Transfer accumulator to X register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    SEP #$20             ; E2 20 | Set processor status bits
    XBA                  ; EB | Exchange accumulator bytes
    BPL $0C              ; 10 0C | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ADC $0A              ; 65 0A | Add with carry (zero page)
    BPL $0A              ; 10 0A | Branch if positive
    CMP #$F0             ; C9 F0 | Compare accumulator (immediate)
    BCS $06              ; B0 06 | Branch if carry set
    STA $00              ; 85 00 | Store accumulator to zero page
    CLC                  ; 18 | Clear carry flag
    ADC $0A              ; 65 0A | Add with carry (zero page)
    XBA                  ; EB | Exchange accumulator bytes
    BPL $05              ; 10 05 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    BMI $03              ; 30 03 | Branch if negative
    REP #$20             ; C2 20 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    ORA $A5              ; 05 A5 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2AD
; Address: $CFB169
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2AD:
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($85,X)          ; C1 85 | Compare accumulator ((zero page,X))
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ASL $18EB            ; 0E EB 18 | Arithmetic shift left (absolute)
    ADC $1E              ; 65 1E | Add with carry (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $4632,X          ; BD 32 46 | Load from absolute,X into accumulator
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ADC $0C              ; 65 0C | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    BRA $1C              ; 80 1C | Branch always
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($85,X)          ; C1 85 | Compare accumulator ((zero page,X))
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ASL $18EB            ; 0E EB 18 | Arithmetic shift left (absolute)
    ADC $1E              ; 65 1E | Add with carry (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $4632,X          ; BD 32 46 | Load from absolute,X into accumulator
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ADC $0E              ; 65 0E | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    BPL $10              ; 10 10 | Branch if positive
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    STZ $20              ; 64 20 | Store zero to zero page
    LDX $10              ; A6 10 | Load from zero page into X register
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $18              ; F0 18 | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    STX $10              ; 86 10 | Store X register to zero page
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    EOR $C8FF,Y          ; 59 FF C8 | Exclusive OR with accumulator (absolute,Y)
    INY                  ; C8 | Increment Y register
    REP #$30             ; C2 30 | Reset processor status bits
    DEC $06              ; C6 06 | Decrement (zero page)
    DEC $04              ; C6 04 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2AE
; Address: $CFB1CF
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2AE:
    BEQ $03              ; F0 03 | Branch if equal
    LSR                  ; 4A | Logical shift right (accumulator)
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    BEQ $10              ; F0 10 | Branch if equal
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    LDA $06              ; A5 06 | Load from zero page into accumulator
    LDA $0C              ; A5 0C | Load from zero page into accumulator
    ASL $01A0            ; 0E A0 01 | Arithmetic shift left (absolute)
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C7 C7 | Load from absolute long,X into accumulator
    STA $18              ; 85 18 | Store accumulator to zero page
    LDA                  ; BF 49 C5 C7 | Load from absolute long,X into accumulator
    STA $12              ; 85 12 | Store accumulator to zero page
    TAX                  ; AA | Transfer accumulator to X register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    SEP #$20             ; E2 20 | Set processor status bits
    XBA                  ; EB | Exchange accumulator bytes
    BPL $0C              ; 10 0C | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ADC $0A              ; 65 0A | Add with carry (zero page)
    BPL $0A              ; 10 0A | Branch if positive
    CMP #$F0             ; C9 F0 | Compare accumulator (immediate)
    BCS $06              ; B0 06 | Branch if carry set
    ADC $00              ; 65 00 | Add with carry (zero page)
    CLC                  ; 18 | Clear carry flag
    ADC $0A              ; 65 0A | Add with carry (zero page)
    XBA                  ; EB | Exchange accumulator bytes
    BPL $05              ; 10 05 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    BMI $03              ; 30 03 | Branch if negative
    REP #$20             ; C2 20 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    ORA $A5              ; 05 A5 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2B0
; Address: $CFB23D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2B0:
    JSR $0ED0            ; 20 D0 0E | Jump to subroutine
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2B1
; Address: $CFB243
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2B1:
    CMP ($18,X)          ; C1 18 | Compare accumulator ((zero page,X))
    ADC $0C              ; 65 0C | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    BRA $0C              ; 80 0C | Branch always
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($18,X)          ; C1 18 | Compare accumulator ((zero page,X))
    ADC $0E              ; 65 0E | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    BPL $10              ; 10 10 | Branch if positive
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    STZ $20              ; 64 20 | Store zero to zero page
    LDX $10              ; A6 10 | Load from zero page into X register
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $18              ; F0 18 | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    STX $10              ; 86 10 | Store X register to zero page
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    ADC $C8FF,Y          ; 79 FF C8 | Add with carry (absolute,Y)
    INY                  ; C8 | Increment Y register
    REP #$30             ; C2 30 | Reset processor status bits
    DEC $06              ; C6 06 | Decrement (zero page)
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $03              ; F0 03 | Branch if equal
    ROR                  ; 6A | Rotate right (accumulator)
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    BEQ $10              ; F0 10 | Branch if equal
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    LDA $06              ; A5 06 | Load from zero page into accumulator
    SBC $A50B            ; ED 0B A5 | Subtract with carry (absolute)
    BMI $03              ; 30 03 | Branch if negative
    LDY #$01             ; A0 01 | Load immediate value into Y register
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C7 C7 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2B2
; Address: $CFB2B7
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2B2:
    STA $18              ; 85 18 | Store accumulator to zero page
    LDA                  ; BF 49 C5 C7 | Load from absolute long,X into accumulator
    STA $12              ; 85 12 | Store accumulator to zero page
    TAX                  ; AA | Transfer accumulator to X register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    SEP #$20             ; E2 20 | Set processor status bits
    XBA                  ; EB | Exchange accumulator bytes
    BMI $0A              ; 30 0A | Branch if negative
    CLC                  ; 18 | Clear carry flag
    ADC $0A              ; 65 0A | Add with carry (zero page)
    CMP #$F0             ; C9 F0 | Compare accumulator (immediate)
    BMI $06              ; 30 06 | Branch if negative
    STA $00              ; 85 00 | Store accumulator to zero page
    CLC                  ; 18 | Clear carry flag
    ADC $0A              ; 65 0A | Add with carry (zero page)
    XBA                  ; EB | Exchange accumulator bytes
    BPL $05              ; 10 05 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    BMI $03              ; 30 03 | Branch if negative
    REP #$20             ; C2 20 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    ORA $A5              ; 05 A5 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2B4
; Address: $CFB2F6
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2B4:
    JSR $1ED0            ; 20 D0 1E | Jump to subroutine
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($85,X)          ; C1 85 | Compare accumulator ((zero page,X))
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ASL $18EB            ; 0E EB 18 | Arithmetic shift left (absolute)
    ADC $1E              ; 65 1E | Add with carry (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $4632,X          ; BD 32 46 | Load from absolute,X into accumulator
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ADC $0C              ; 65 0C | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    BRA $1C              ; 80 1C | Branch always
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($85,X)          ; C1 85 | Compare accumulator ((zero page,X))
    TXA                  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2B5
; Address: $CFB31E
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2B5:
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ASL $18EB            ; 0E EB 18 | Arithmetic shift left (absolute)
    ADC $1E              ; 65 1E | Add with carry (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $4632,X          ; BD 32 46 | Load from absolute,X into accumulator
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ADC $0E              ; 65 0E | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    BPL $10              ; 10 10 | Branch if positive
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    STZ $20              ; 64 20 | Store zero to zero page
    LDX $10              ; A6 10 | Load from zero page into X register
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $18              ; F0 18 | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    STX $10              ; 86 10 | Store X register to zero page
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    REP #$30             ; C2 30 | Reset processor status bits
    DEC $06              ; C6 06 | Decrement (zero page)
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $A6FF            ; 4C FF A6 | Jump to address
    BPL $A5              ; 10 A5 | Branch if positive

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2B6
; Address: $CFB368
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2B6:
    JSR $10F0            ; 20 F0 10 | Jump to subroutine
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    LDA $06              ; A5 06 | Load from zero page into accumulator
    ASL $01A0            ; 0E A0 01 | Arithmetic shift left (absolute)
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C7 C7 | Load from absolute long,X into accumulator
    STA $18              ; 85 18 | Store accumulator to zero page
    LDA                  ; BF 49 C5 C7 | Load from absolute long,X into accumulator
    STA $12              ; 85 12 | Store accumulator to zero page
    TAX                  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2B7
; Address: $CFB398
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2B7:
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    SEP #$20             ; E2 20 | Set processor status bits
    XBA                  ; EB | Exchange accumulator bytes
    BMI $0A              ; 30 0A | Branch if negative
    CLC                  ; 18 | Clear carry flag
    ADC $0A              ; 65 0A | Add with carry (zero page)
    CMP #$F0             ; C9 F0 | Compare accumulator (immediate)
    BMI $06              ; 30 06 | Branch if negative
    ADC $00              ; 65 00 | Add with carry (zero page)
    CLC                  ; 18 | Clear carry flag
    ADC $0A              ; 65 0A | Add with carry (zero page)
    XBA                  ; EB | Exchange accumulator bytes
    BPL $05              ; 10 05 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    BMI $03              ; 30 03 | Branch if negative
    REP #$20             ; C2 20 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    ORA $A5              ; 05 A5 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2B9
; Address: $CFB3CC
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2B9:
    JSR $0ED0            ; 20 D0 0E | Jump to subroutine
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($18,X)          ; C1 18 | Compare accumulator ((zero page,X))
    ADC $0C              ; 65 0C | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    BRA $0C              ; 80 0C | Branch always
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($18,X)          ; C1 18 | Compare accumulator ((zero page,X))
    ADC $0E              ; 65 0E | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    BPL $10              ; 10 10 | Branch if positive
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    STZ $20              ; 64 20 | Store zero to zero page
    LDX $10              ; A6 10 | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2BA
; Address: $CFB401
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2BA:
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $18              ; F0 18 | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    STX $10              ; 86 10 | Store X register to zero page
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    REP #$30             ; C2 30 | Reset processor status bits
    DEC $06              ; C6 06 | Decrement (zero page)
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $03              ; F0 03 | Branch if equal
    JMP ($A6FF)          ; 6C FF A6 | Jump to address (absolute indirect)
    BPL $A5              ; 10 A5 | Branch if positive

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2BB
; Address: $CFB41E
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2BB:
    JSR $10F0            ; 20 F0 10 | Jump to subroutine
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    LDA $06              ; A5 06 | Load from zero page into accumulator
    LSR $A50A,X          ; 5E 0A A5 | Logical shift right (absolute,X)
    BMI $03              ; 30 03 | Branch if negative
    LDY #$01             ; A0 01 | Load immediate value into Y register
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C7 C7 | Load from absolute long,X into accumulator
    STA $18              ; 85 18 | Store accumulator to zero page
    LDA                  ; BF 49 C5 C7 | Load from absolute long,X into accumulator
    STA $12              ; 85 12 | Store accumulator to zero page
    TAX                  ; AA | Transfer accumulator to X register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    SEP #$20             ; E2 20 | Set processor status bits
    XBA                  ; EB | Exchange accumulator bytes
    BPL $07              ; 10 07 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ADC $0A              ; 65 0A | Add with carry (zero page)
    CMP #$F0             ; C9 F0 | Compare accumulator (immediate)
    BMI $03              ; 30 03 | Branch if negative
    XBA                  ; EB | Exchange accumulator bytes
    BPL $05              ; 10 05 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    BMI $03              ; 30 03 | Branch if negative
    REP #$20             ; C2 20 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2BC
; Address: $CFB477
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2BC:
    BPL $F0              ; 10 F0 | Branch if positive
    ORA $A5              ; 05 A5 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2BE
; Address: $CFB482
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2BE:
    JSR $1ED0            ; 20 D0 1E | Jump to subroutine
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($85,X)          ; C1 85 | Compare accumulator ((zero page,X))
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ASL $18EB            ; 0E EB 18 | Arithmetic shift left (absolute)
    ADC $1E              ; 65 1E | Add with carry (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $4632,X          ; BD 32 46 | Load from absolute,X into accumulator
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ADC $0C              ; 65 0C | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    BRA $1C              ; 80 1C | Branch always
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($85,X)          ; C1 85 | Compare accumulator ((zero page,X))
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ASL $18EB            ; 0E EB 18 | Arithmetic shift left (absolute)
    ADC $1E              ; 65 1E | Add with carry (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $4632,X          ; BD 32 46 | Load from absolute,X into accumulator
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ADC $0E              ; 65 0E | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    BPL $10              ; 10 10 | Branch if positive
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    STZ $20              ; 64 20 | Store zero to zero page
    LDX $10              ; A6 10 | Load from zero page into X register
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $18              ; F0 18 | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    STX $10              ; 86 10 | Store X register to zero page

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2BF
; Address: $CFB4DF
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2BF:
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LSR $C8FF,X          ; 5E FF C8 | Logical shift right (absolute,X)
    INY                  ; C8 | Increment Y register
    REP #$30             ; C2 30 | Reset processor status bits
    DEC $06              ; C6 06 | Decrement (zero page)
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $03              ; F0 03 | Branch if equal
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    BEQ $10              ; F0 10 | Branch if equal
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    LDA $06              ; A5 06 | Load from zero page into accumulator
    DEY                  ; 88 | Decrement Y register
    ORA #$04             ; 09 04 | Logical OR with accumulator (immediate)
    ASL $01A0            ; 0E A0 01 | Arithmetic shift left (absolute)
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C7 C7 | Load from absolute long,X into accumulator
    STA $18              ; 85 18 | Store accumulator to zero page
    LDA                  ; BF 49 C5 C7 | Load from absolute long,X into accumulator
    STA $12              ; 85 12 | Store accumulator to zero page
    TAX                  ; AA | Transfer accumulator to X register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    SEP #$20             ; E2 20 | Set processor status bits
    XBA                  ; EB | Exchange accumulator bytes
    BPL $07              ; 10 07 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ADC $0A              ; 65 0A | Add with carry (zero page)
    CMP #$F0             ; C9 F0 | Compare accumulator (immediate)
    BMI $03              ; 30 03 | Branch if negative
    XBA                  ; EB | Exchange accumulator bytes
    BPL $05              ; 10 05 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    BMI $03              ; 30 03 | Branch if negative
    REP #$20             ; C2 20 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    ORA $A5              ; 05 A5 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2C1
; Address: $CFB555
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2C1:
    JSR $0ED0            ; 20 D0 0E | Jump to subroutine
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($18,X)          ; C1 18 | Compare accumulator ((zero page,X))
    ADC $0C              ; 65 0C | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    BRA $0C              ; 80 0C | Branch always
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($18,X)          ; C1 18 | Compare accumulator ((zero page,X))
    ADC $0E              ; 65 0E | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    BPL $10              ; 10 10 | Branch if positive
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    STZ $20              ; 64 20 | Store zero to zero page
    LDX $10              ; A6 10 | Load from zero page into X register
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $18              ; F0 18 | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    STX $10              ; 86 10 | Store X register to zero page
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    ROR $C8FF,X          ; 7E FF C8 | Rotate right (absolute,X)
    INY                  ; C8 | Increment Y register
    REP #$30             ; C2 30 | Reset processor status bits
    DEC $06              ; C6 06 | Decrement (zero page)
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $03              ; F0 03 | Branch if equal
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    BEQ $10              ; F0 10 | Branch if equal
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    LDA $06              ; A5 06 | Load from zero page into accumulator
    PHP                  ; 08 | Push processor status to stack
    LDA $16              ; A5 16 | Load from zero page into accumulator
    BMI $03              ; 30 03 | Branch if negative

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2C2
; Address: $CFB5C6
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2C2:
    LDY #$01             ; A0 01 | Load immediate value into Y register
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C7 C7 | Load from absolute long,X into accumulator
    STA $18              ; 85 18 | Store accumulator to zero page
    LDA                  ; BF 49 C5 C7 | Load from absolute long,X into accumulator
    STA $12              ; 85 12 | Store accumulator to zero page
    TAX                  ; AA | Transfer accumulator to X register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    SEP #$20             ; E2 20 | Set processor status bits
    XBA                  ; EB | Exchange accumulator bytes
    BPL $03              ; 10 03 | Branch if positive
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    ADC $0A              ; 65 0A | Add with carry (zero page)
    CMP #$F0             ; C9 F0 | Compare accumulator (immediate)
    BMI $F6              ; 30 F6 | Branch if negative
    XBA                  ; EB | Exchange accumulator bytes
    BPL $05              ; 10 05 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    BMI $03              ; 30 03 | Branch if negative
    REP #$20             ; C2 20 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    ORA $A5              ; 05 A5 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2C4
; Address: $CFB60B
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2C4:
    JSR $1ED0            ; 20 D0 1E | Jump to subroutine
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($85,X)          ; C1 85 | Compare accumulator ((zero page,X))
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ASL $18EB            ; 0E EB 18 | Arithmetic shift left (absolute)
    ADC $1E              ; 65 1E | Add with carry (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $4632,X          ; BD 32 46 | Load from absolute,X into accumulator
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ADC $0C              ; 65 0C | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    BRA $1C              ; 80 1C | Branch always
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($85,X)          ; C1 85 | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2C5
; Address: $CFB632
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2C5:
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ASL $18EB            ; 0E EB 18 | Arithmetic shift left (absolute)
    ADC $1E              ; 65 1E | Add with carry (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $4632,X          ; BD 32 46 | Load from absolute,X into accumulator
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ADC $0E              ; 65 0E | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    BPL $10              ; 10 10 | Branch if positive
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    STZ $20              ; 64 20 | Store zero to zero page
    LDX $10              ; A6 10 | Load from zero page into X register
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $18              ; F0 18 | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    STX $10              ; 86 10 | Store X register to zero page
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LSR $C8FF,X          ; 5E FF C8 | Logical shift right (absolute,X)
    INY                  ; C8 | Increment Y register
    REP #$30             ; C2 30 | Reset processor status bits
    DEC $06              ; C6 06 | Decrement (zero page)
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $03              ; F0 03 | Branch if equal
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    BEQ $10              ; F0 10 | Branch if equal
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    LDA $06              ; A5 06 | Load from zero page into accumulator
    ASL $01A0            ; 0E A0 01 | Arithmetic shift left (absolute)
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C7 C7 | Load from absolute long,X into accumulator
    STA $18              ; 85 18 | Store accumulator to zero page
    LDA                  ; BF 49 C5 C7 | Load from absolute long,X into accumulator
    STA $12              ; 85 12 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2C6
; Address: $CFB6AA
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2C6:
    TAX                  ; AA | Transfer accumulator to X register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    SEP #$20             ; E2 20 | Set processor status bits
    XBA                  ; EB | Exchange accumulator bytes
    BPL $03              ; 10 03 | Branch if positive
    ADC #$00             ; 69 00 | Add with carry (immediate)
    CLC                  ; 18 | Clear carry flag
    ADC $0A              ; 65 0A | Add with carry (zero page)
    CMP #$F0             ; C9 F0 | Compare accumulator (immediate)
    BMI $F6              ; 30 F6 | Branch if negative
    XBA                  ; EB | Exchange accumulator bytes
    BPL $05              ; 10 05 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    BMI $03              ; 30 03 | Branch if negative
    REP #$20             ; C2 20 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    ORA $A5              ; 05 A5 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2C8
; Address: $CFB6DE
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2C8:
    JSR $0ED0            ; 20 D0 0E | Jump to subroutine
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($18,X)          ; C1 18 | Compare accumulator ((zero page,X))
    ADC $0C              ; 65 0C | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    BRA $0C              ; 80 0C | Branch always
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($18,X)          ; C1 18 | Compare accumulator ((zero page,X))
    ADC $0E              ; 65 0E | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    BPL $10              ; 10 10 | Branch if positive
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    STZ $20              ; 64 20 | Store zero to zero page
    LDX $10              ; A6 10 | Load from zero page into X register
    DEC $04              ; C6 04 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2C9
; Address: $CFB715
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2C9:
    BEQ $18              ; F0 18 | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    STX $10              ; 86 10 | Store X register to zero page
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    ROR $C8FF,X          ; 7E FF C8 | Rotate right (absolute,X)
    INY                  ; C8 | Increment Y register
    REP #$30             ; C2 30 | Reset processor status bits
    DEC $06              ; C6 06 | Decrement (zero page)
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $03              ; F0 03 | Branch if equal
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    BEQ $10              ; F0 10 | Branch if equal
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    LDA $06              ; A5 06 | Load from zero page into accumulator
    JMP $A507            ; 4C 07 A5 | Jump to address
    BMI $03              ; 30 03 | Branch if negative
    LDY #$01             ; A0 01 | Load immediate value into Y register
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C7 C7 | Load from absolute long,X into accumulator
    STA $18              ; 85 18 | Store accumulator to zero page
    LDA                  ; BF 49 C5 C7 | Load from absolute long,X into accumulator
    STA $12              ; 85 12 | Store accumulator to zero page
    TAX                  ; AA | Transfer accumulator to X register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    SEP #$20             ; E2 20 | Set processor status bits
    XBA                  ; EB | Exchange accumulator bytes
    BPL $0C              ; 10 0C | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ADC $0A              ; 65 0A | Add with carry (zero page)
    BPL $0A              ; 10 0A | Branch if positive
    CMP #$F0             ; C9 F0 | Compare accumulator (immediate)
    BCS $06              ; B0 06 | Branch if carry set
    TAY                  ; A8 | Transfer accumulator to Y register
    CLC                  ; 18 | Clear carry flag
    ADC $0A              ; 65 0A | Add with carry (zero page)
    XBA                  ; EB | Exchange accumulator bytes
    BPL $26              ; 10 26 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    CMP #$F1             ; C9 F1 | Compare accumulator (immediate)
    BCS $03              ; B0 03 | Branch if carry set

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2CA
; Address: $CFB784
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2CA:
    TYA                  ; 98 | Transfer Y register to accumulator
    REP #$20             ; C2 20 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    ORA #$A5             ; 09 A5 | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $18              ; 05 18 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2CC
; Address: $CFB79F
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2CC:
    JSR $1780            ; 20 80 17 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    BMI $D8              ; 30 D8 | Branch if negative
    REP #$30             ; C2 30 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    ORA $A5              ; 05 A5 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2CE
; Address: $CFB7BC
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2CE:
    JSR $1ED0            ; 20 D0 1E | Jump to subroutine
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($85,X)          ; C1 85 | Compare accumulator ((zero page,X))
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ASL $18EB            ; 0E EB 18 | Arithmetic shift left (absolute)
    ADC $1E              ; 65 1E | Add with carry (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $4632,X          ; BD 32 46 | Load from absolute,X into accumulator
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ADC $0C              ; 65 0C | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    BRA $1C              ; 80 1C | Branch always
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($85,X)          ; C1 85 | Compare accumulator ((zero page,X))
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ASL $18EB            ; 0E EB 18 | Arithmetic shift left (absolute)
    ADC $1E              ; 65 1E | Add with carry (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $4632,X          ; BD 32 46 | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2CF
; Address: $CFB7EF
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2CF:
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ADC $0E              ; 65 0E | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    BPL $10              ; 10 10 | Branch if positive
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    STZ $20              ; 64 20 | Store zero to zero page
    LDX $10              ; A6 10 | Load from zero page into X register
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $18              ; F0 18 | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    STX $10              ; 86 10 | Store X register to zero page
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    REP #$30             ; C2 30 | Reset processor status bits
    DEC $06              ; C6 06 | Decrement (zero page)
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $03              ; F0 03 | Branch if equal
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    BEQ $10              ; F0 10 | Branch if equal
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    LDA $06              ; A5 06 | Load from zero page into accumulator
    LSR $0406            ; 4E 06 04 | Logical shift right (absolute)
    ASL $01A0            ; 0E A0 01 | Arithmetic shift left (absolute)
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C7 C7 | Load from absolute long,X into accumulator
    STA $18              ; 85 18 | Store accumulator to zero page
    LDA                  ; BF 49 C5 C7 | Load from absolute long,X into accumulator
    STA $12              ; 85 12 | Store accumulator to zero page
    TAX                  ; AA | Transfer accumulator to X register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    SEP #$20             ; E2 20 | Set processor status bits
    XBA                  ; EB | Exchange accumulator bytes

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2D0
; Address: $CFB863
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2D0:
    BPL $0C              ; 10 0C | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ADC $0A              ; 65 0A | Add with carry (zero page)
    BPL $0A              ; 10 0A | Branch if positive
    CMP #$F0             ; C9 F0 | Compare accumulator (immediate)
    BCS $06              ; B0 06 | Branch if carry set
    DEY                  ; 88 | Decrement Y register
    CLC                  ; 18 | Clear carry flag
    ADC $0A              ; 65 0A | Add with carry (zero page)
    XBA                  ; EB | Exchange accumulator bytes
    BPL $26              ; 10 26 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    CMP #$F1             ; C9 F1 | Compare accumulator (immediate)
    BCS $03              ; B0 03 | Branch if carry set
    SEI                  ; 78 | Set interrupt disable flag
    REP #$20             ; C2 20 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    ORA #$A5             ; 09 A5 | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $18              ; 05 18 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2D2
; Address: $CFB89A
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2D2:
    JSR $1780            ; 20 80 17 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    BMI $D8              ; 30 D8 | Branch if negative
    REP #$30             ; C2 30 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    ORA $A5              ; 05 A5 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2D4
; Address: $CFB8B7
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2D4:
    JSR $0ED0            ; 20 D0 0E | Jump to subroutine
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($18,X)          ; C1 18 | Compare accumulator ((zero page,X))
    ADC $0C              ; 65 0C | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    BRA $0C              ; 80 0C | Branch always
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2D5
; Address: $CFB8CB
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2D5:
    CMP ($18,X)          ; C1 18 | Compare accumulator ((zero page,X))
    ADC $0E              ; 65 0E | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    BPL $10              ; 10 10 | Branch if positive
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    STZ $20              ; 64 20 | Store zero to zero page
    LDX $10              ; A6 10 | Load from zero page into X register
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $18              ; F0 18 | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    STX $10              ; 86 10 | Store X register to zero page
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    REP #$30             ; C2 30 | Reset processor status bits
    DEC $06              ; C6 06 | Decrement (zero page)
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $03              ; F0 03 | Branch if equal
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    BEQ $10              ; F0 10 | Branch if equal
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    LDA $06              ; A5 06 | Load from zero page into accumulator
    ORA $A5              ; 05 A5 | Logical OR with accumulator (zero page)
    BMI $03              ; 30 03 | Branch if negative
    LDY #$01             ; A0 01 | Load immediate value into Y register
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C7 C7 | Load from absolute long,X into accumulator
    STA $18              ; 85 18 | Store accumulator to zero page
    LDA                  ; BF 49 C5 C7 | Load from absolute long,X into accumulator
    STA $12              ; 85 12 | Store accumulator to zero page
    TAX                  ; AA | Transfer accumulator to X register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    SEP #$20             ; E2 20 | Set processor status bits
    XBA                  ; EB | Exchange accumulator bytes

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2D6
; Address: $CFB941
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2D6:
    BMI $0A              ; 30 0A | Branch if negative
    CLC                  ; 18 | Clear carry flag
    ADC $0A              ; 65 0A | Add with carry (zero page)
    CMP #$F0             ; C9 F0 | Compare accumulator (immediate)
    BMI $06              ; 30 06 | Branch if negative
    TAY                  ; A8 | Transfer accumulator to Y register
    CLC                  ; 18 | Clear carry flag
    ADC $0A              ; 65 0A | Add with carry (zero page)
    XBA                  ; EB | Exchange accumulator bytes
    BPL $26              ; 10 26 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    CMP #$F1             ; C9 F1 | Compare accumulator (immediate)
    BCS $03              ; B0 03 | Branch if carry set
    TYA                  ; 98 | Transfer Y register to accumulator
    REP #$20             ; C2 20 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    ORA #$A5             ; 09 A5 | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $18              ; 05 18 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2D8
; Address: $CFB976
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2D8:
    JSR $1780            ; 20 80 17 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    BMI $D8              ; 30 D8 | Branch if negative
    REP #$30             ; C2 30 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    ORA $A5              ; 05 A5 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2DA
; Address: $CFB993
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2DA:
    JSR $1ED0            ; 20 D0 1E | Jump to subroutine
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($85,X)          ; C1 85 | Compare accumulator ((zero page,X))
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ASL $18EB            ; 0E EB 18 | Arithmetic shift left (absolute)
    ADC $1E              ; 65 1E | Add with carry (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $4632,X          ; BD 32 46 | Load from absolute,X into accumulator
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2DB
; Address: $CFB9AA
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2DB:
    CLC                  ; 18 | Clear carry flag
    ADC $0C              ; 65 0C | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    BRA $1C              ; 80 1C | Branch always
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($85,X)          ; C1 85 | Compare accumulator ((zero page,X))
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ASL $18EB            ; 0E EB 18 | Arithmetic shift left (absolute)
    ADC $1E              ; 65 1E | Add with carry (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $4632,X          ; BD 32 46 | Load from absolute,X into accumulator
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ADC $0E              ; 65 0E | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    BPL $10              ; 10 10 | Branch if positive
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    STZ $20              ; 64 20 | Store zero to zero page
    LDX $10              ; A6 10 | Load from zero page into X register
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $18              ; F0 18 | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    STX $10              ; 86 10 | Store X register to zero page
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    SEC                  ; 38 | Set carry flag
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    REP #$30             ; C2 30 | Reset processor status bits
    DEC $06              ; C6 06 | Decrement (zero page)
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $03              ; F0 03 | Branch if equal
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    BEQ $10              ; F0 10 | Branch if equal
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2DC
; Address: $CFBA10
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2DC:
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    LDA $06              ; A5 06 | Load from zero page into accumulator
    ASL $01A0            ; 0E A0 01 | Arithmetic shift left (absolute)
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C7 C7 | Load from absolute long,X into accumulator
    STA $18              ; 85 18 | Store accumulator to zero page
    LDA                  ; BF 49 C5 C7 | Load from absolute long,X into accumulator
    STA $12              ; 85 12 | Store accumulator to zero page
    TAX                  ; AA | Transfer accumulator to X register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    SEP #$20             ; E2 20 | Set processor status bits
    XBA                  ; EB | Exchange accumulator bytes
    BMI $0A              ; 30 0A | Branch if negative
    CLC                  ; 18 | Clear carry flag
    ADC $0A              ; 65 0A | Add with carry (zero page)
    CMP #$F0             ; C9 F0 | Compare accumulator (immediate)
    BMI $06              ; 30 06 | Branch if negative
    DEY                  ; 88 | Decrement Y register
    CLC                  ; 18 | Clear carry flag
    ADC $0A              ; 65 0A | Add with carry (zero page)
    XBA                  ; EB | Exchange accumulator bytes
    BPL $26              ; 10 26 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    CMP #$F1             ; C9 F1 | Compare accumulator (immediate)
    BCS $03              ; B0 03 | Branch if carry set
    SEI                  ; 78 | Set interrupt disable flag
    REP #$20             ; C2 20 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    ORA #$A5             ; 09 A5 | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $18              ; 05 18 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2DE
; Address: $CFBA6F
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2DE:
    JSR $1780            ; 20 80 17 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    BMI $D8              ; 30 D8 | Branch if negative
    REP #$30             ; C2 30 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $F0              ; 10 F0 | Branch if positive

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2DF
; Address: $CFBA83
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2DF:
    ORA $A5              ; 05 A5 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2E1
; Address: $CFBA8C
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2E1:
    JSR $0ED0            ; 20 D0 0E | Jump to subroutine
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($18,X)          ; C1 18 | Compare accumulator ((zero page,X))
    ADC $0C              ; 65 0C | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    BRA $0C              ; 80 0C | Branch always
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($18,X)          ; C1 18 | Compare accumulator ((zero page,X))
    ADC $0E              ; 65 0E | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    BPL $10              ; 10 10 | Branch if positive
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    STZ $20              ; 64 20 | Store zero to zero page
    LDX $10              ; A6 10 | Load from zero page into X register
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $18              ; F0 18 | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    STX $10              ; 86 10 | Store X register to zero page
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    CLI                  ; 58 | Clear interrupt disable flag
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    REP #$30             ; C2 30 | Reset processor status bits
    DEC $06              ; C6 06 | Decrement (zero page)
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $03              ; F0 03 | Branch if equal
    EOR #$FF             ; 49 FF | Exclusive OR with accumulator (immediate)
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    BEQ $10              ; F0 10 | Branch if equal
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2E2
; Address: $CFBAEB
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2E2:
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    LDA $06              ; A5 06 | Load from zero page into accumulator
    STZ $A503,X          ; 9E 03 A5 | Store zero to absolute,X
    BMI $03              ; 30 03 | Branch if negative
    LDY #$01             ; A0 01 | Load immediate value into Y register
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C7 C7 | Load from absolute long,X into accumulator
    STA $18              ; 85 18 | Store accumulator to zero page
    LDA                  ; BF 49 C5 C7 | Load from absolute long,X into accumulator
    STA $12              ; 85 12 | Store accumulator to zero page
    TAX                  ; AA | Transfer accumulator to X register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    SEP #$20             ; E2 20 | Set processor status bits
    XBA                  ; EB | Exchange accumulator bytes
    BPL $07              ; 10 07 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ADC $0A              ; 65 0A | Add with carry (zero page)
    CMP #$F0             ; C9 F0 | Compare accumulator (immediate)
    BMI $03              ; 30 03 | Branch if negative
    LDA $00              ; A5 00 | Load from zero page into accumulator
    XBA                  ; EB | Exchange accumulator bytes
    BPL $26              ; 10 26 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    CMP #$F1             ; C9 F1 | Compare accumulator (immediate)
    BCS $03              ; B0 03 | Branch if carry set
    TYA                  ; 98 | Transfer Y register to accumulator
    REP #$20             ; C2 20 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    ORA #$A5             ; 09 A5 | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $18              ; 05 18 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2E4
; Address: $CFBB48
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2E4:
    JSR $1780            ; 20 80 17 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    BMI $D8              ; 30 D8 | Branch if negative
    REP #$30             ; C2 30 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    ORA $A5              ; 05 A5 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2E7
; Address: $CFBB65
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2E7:
    JSR $1ED0            ; 20 D0 1E | Jump to subroutine
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($85,X)          ; C1 85 | Compare accumulator ((zero page,X))
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ASL $18EB            ; 0E EB 18 | Arithmetic shift left (absolute)
    ADC $1E              ; 65 1E | Add with carry (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $4632,X          ; BD 32 46 | Load from absolute,X into accumulator
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ADC $0C              ; 65 0C | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    BRA $1C              ; 80 1C | Branch always
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($85,X)          ; C1 85 | Compare accumulator ((zero page,X))
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ASL $18EB            ; 0E EB 18 | Arithmetic shift left (absolute)
    ADC $1E              ; 65 1E | Add with carry (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $4632,X          ; BD 32 46 | Load from absolute,X into accumulator
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ADC $0E              ; 65 0E | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    BPL $10              ; 10 10 | Branch if positive
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    STZ $20              ; 64 20 | Store zero to zero page
    LDX $10              ; A6 10 | Load from zero page into X register
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $18              ; F0 18 | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    STX $10              ; 86 10 | Store X register to zero page
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2E8
; Address: $CFBBC7
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2E8:
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    REP #$30             ; C2 30 | Reset processor status bits
    DEC $06              ; C6 06 | Decrement (zero page)
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $03              ; F0 03 | Branch if equal
    BIT $A6FF            ; 2C FF A6 | Test bits in accumulator (absolute)
    BPL $A5              ; 10 A5 | Branch if positive

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2E9
; Address: $CFBBD7
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2E9:
    JSR $10F0            ; 20 F0 10 | Jump to subroutine
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    LDA $06              ; A5 06 | Load from zero page into accumulator
    LDA $02              ; A5 02 | Load from zero page into accumulator
    ASL $01A0            ; 0E A0 01 | Arithmetic shift left (absolute)
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C7 C7 | Load from absolute long,X into accumulator
    STA $18              ; 85 18 | Store accumulator to zero page
    LDA                  ; BF 49 C5 C7 | Load from absolute long,X into accumulator
    STA $12              ; 85 12 | Store accumulator to zero page
    TAX                  ; AA | Transfer accumulator to X register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    SEP #$20             ; E2 20 | Set processor status bits
    XBA                  ; EB | Exchange accumulator bytes
    BPL $07              ; 10 07 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ADC $0A              ; 65 0A | Add with carry (zero page)
    CMP #$F0             ; C9 F0 | Compare accumulator (immediate)
    BMI $03              ; 30 03 | Branch if negative
    STA $00              ; 85 00 | Store accumulator to zero page
    XBA                  ; EB | Exchange accumulator bytes
    BPL $26              ; 10 26 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    CMP #$F1             ; C9 F1 | Compare accumulator (immediate)
    BCS $03              ; B0 03 | Branch if carry set
    SEI                  ; 78 | Set interrupt disable flag
    REP #$20             ; C2 20 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    ORA #$A5             ; 09 A5 | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $18              ; 05 18 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2EB
; Address: $CFBC3E
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2EB:
    JSR $1780            ; 20 80 17 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    BMI $D8              ; 30 D8 | Branch if negative
    REP #$30             ; C2 30 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    ORA $A5              ; 05 A5 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2ED
; Address: $CFBC5B
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2ED:
    JSR $0ED0            ; 20 D0 0E | Jump to subroutine
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($18,X)          ; C1 18 | Compare accumulator ((zero page,X))
    ADC $0C              ; 65 0C | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    BRA $0C              ; 80 0C | Branch always
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($18,X)          ; C1 18 | Compare accumulator ((zero page,X))
    ADC $0E              ; 65 0E | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    BPL $10              ; 10 10 | Branch if positive
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    STZ $20              ; 64 20 | Store zero to zero page
    LDX $10              ; A6 10 | Load from zero page into X register
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $18              ; F0 18 | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    STX $10              ; 86 10 | Store X register to zero page
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    REP #$30             ; C2 30 | Reset processor status bits
    DEC $06              ; C6 06 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2EE
; Address: $CFBCA3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2EE:
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $A6FF            ; 4C FF A6 | Jump to address
    BPL $A5              ; 10 A5 | Branch if positive

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2EF
; Address: $CFBCAD
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2EF:
    JSR $10F0            ; 20 F0 10 | Jump to subroutine
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    LDA $06              ; A5 06 | Load from zero page into accumulator
    ORA ($A5,X)          ; 01 A5 | Logical OR with accumulator ((zero page,X))
    BMI $03              ; 30 03 | Branch if negative
    LDY #$01             ; A0 01 | Load immediate value into Y register
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C7 C7 | Load from absolute long,X into accumulator
    STA $18              ; 85 18 | Store accumulator to zero page
    LDA                  ; BF 49 C5 C7 | Load from absolute long,X into accumulator
    STA $12              ; 85 12 | Store accumulator to zero page
    TAX                  ; AA | Transfer accumulator to X register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    SEP #$20             ; E2 20 | Set processor status bits
    XBA                  ; EB | Exchange accumulator bytes
    BPL $03              ; 10 03 | Branch if positive
    LDY $1800            ; AC 00 18 | Load from absolute address into Y register
    ADC $0A              ; 65 0A | Add with carry (zero page)
    CMP #$F0             ; C9 F0 | Compare accumulator (immediate)
    BMI $F6              ; 30 F6 | Branch if negative
    XBA                  ; EB | Exchange accumulator bytes
    BPL $26              ; 10 26 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    CMP #$F1             ; C9 F1 | Compare accumulator (immediate)
    BCS $03              ; B0 03 | Branch if carry set
    TYA                  ; 98 | Transfer Y register to accumulator
    REP #$20             ; C2 20 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    ORA #$A5             ; 09 A5 | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $18              ; 05 18 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2F2
; Address: $CFBD1B
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2F2:
    ADC $08              ; 65 08 | Add with carry (zero page)
    BMI $D8              ; 30 D8 | Branch if negative
    REP #$30             ; C2 30 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    ORA $A5              ; 05 A5 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2F4
; Address: $CFBD34
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2F4:
    JSR $1ED0            ; 20 D0 1E | Jump to subroutine
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($85,X)          ; C1 85 | Compare accumulator ((zero page,X))
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ASL $18EB            ; 0E EB 18 | Arithmetic shift left (absolute)
    ADC $1E              ; 65 1E | Add with carry (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $4632,X          ; BD 32 46 | Load from absolute,X into accumulator
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ADC $0C              ; 65 0C | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    BRA $1C              ; 80 1C | Branch always
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($85,X)          ; C1 85 | Compare accumulator ((zero page,X))
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ASL $18EB            ; 0E EB 18 | Arithmetic shift left (absolute)
    ADC $1E              ; 65 1E | Add with carry (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $4632,X          ; BD 32 46 | Load from absolute,X into accumulator
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ADC $0E              ; 65 0E | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    BPL $10              ; 10 10 | Branch if positive
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    STZ $20              ; 64 20 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2F5
; Address: $CFBD87
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2F5:
    LDX $10              ; A6 10 | Load from zero page into X register
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $18              ; F0 18 | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    STX $10              ; 86 10 | Store X register to zero page
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    REP #$30             ; C2 30 | Reset processor status bits
    DEC $06              ; C6 06 | Decrement (zero page)
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $03              ; F0 03 | Branch if equal
    BIT $A6FF            ; 2C FF A6 | Test bits in accumulator (absolute)
    BPL $A5              ; 10 A5 | Branch if positive

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2F6
; Address: $CFBDA6
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2F6:
    JSR $10F0            ; 20 F0 10 | Jump to subroutine
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    LDA $06              ; A5 06 | Load from zero page into accumulator
    ASL $01A0            ; 0E A0 01 | Arithmetic shift left (absolute)
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C7 C7 | Load from absolute long,X into accumulator
    STA $18              ; 85 18 | Store accumulator to zero page
    LDA                  ; BF 49 C5 C7 | Load from absolute long,X into accumulator
    STA $12              ; 85 12 | Store accumulator to zero page
    TAX                  ; AA | Transfer accumulator to X register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    SEP #$20             ; E2 20 | Set processor status bits
    XBA                  ; EB | Exchange accumulator bytes
    BPL $03              ; 10 03 | Branch if positive
    STY $1800            ; 8C 00 18 | Store Y register to absolute address
    ADC $0A              ; 65 0A | Add with carry (zero page)
    CMP #$F0             ; C9 F0 | Compare accumulator (immediate)
    BMI $F6              ; 30 F6 | Branch if negative
    XBA                  ; EB | Exchange accumulator bytes
    BPL $26              ; 10 26 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    CMP #$F1             ; C9 F1 | Compare accumulator (immediate)
    BCS $03              ; B0 03 | Branch if carry set
    SEI                  ; 78 | Set interrupt disable flag
    REP #$20             ; C2 20 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2F7
; Address: $CFBDFC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2F7:
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    ORA #$A5             ; 09 A5 | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $18              ; 05 18 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2F9
; Address: $CFBE0D
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2F9:
    JSR $1780            ; 20 80 17 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    BMI $D8              ; 30 D8 | Branch if negative
    REP #$30             ; C2 30 | Reset processor status bits
    STA $DB1F,X          ; 9D 1F DB | Store accumulator to absolute,X
    TAX                  ; AA | Transfer accumulator to X register
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    ORA $A5              ; 05 A5 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2FB
; Address: $CFBE2A
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2FB:
    JSR $0ED0            ; 20 D0 0E | Jump to subroutine
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($18,X)          ; C1 18 | Compare accumulator ((zero page,X))
    ADC $0C              ; 65 0C | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    BRA $0C              ; 80 0C | Branch always
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP ($18,X)          ; C1 18 | Compare accumulator ((zero page,X))
    ADC $0E              ; 65 0E | Add with carry (zero page)
    LDX $12              ; A6 12 | Load from zero page into X register
    STA $DB21,X          ; 9D 21 DB | Store accumulator to absolute,X
    LDX $10              ; A6 10 | Load from zero page into X register
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    BPL $10              ; 10 10 | Branch if positive
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    STZ $20              ; 64 20 | Store zero to zero page
    LDX $10              ; A6 10 | Load from zero page into X register
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $18              ; F0 18 | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    STX $10              ; 86 10 | Store X register to zero page

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2FC
; Address: $CFBE67
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2FC:
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    REP #$30             ; C2 30 | Reset processor status bits
    DEC $06              ; C6 06 | Decrement (zero page)
    DEC $04              ; C6 04 | Decrement (zero page)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $A6FF            ; 4C FF A6 | Jump to address
    BPL $A5              ; 10 A5 | Branch if positive

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2FD
; Address: $CFBE7C
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2FD:
    JSR $10F0            ; 20 F0 10 | Jump to subroutine
    LDA                  ; BF 49 C6 C7 | Load from absolute long,X into accumulator
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $20              ; A5 20 | Load from zero page into accumulator
    ORA $DD1F,X          ; 1D 1F DD | Logical OR with accumulator (absolute,X)
    STA $DD1F,X          ; 9D 1F DD | Store accumulator to absolute,X
    LDA $06              ; A5 06 | Load from zero page into accumulator
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2FE
; Address: $CFBE95
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2FE:
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    SBC $01FF,Y          ; F9 FF 01 | Subtract with carry (absolute,Y)
    BPL $40              ; 10 40 | Branch if positive
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_2FF
; Address: $CFBEA1
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_2FF:
    JSR $0180            ; 20 80 01 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    BPL $20              ; 10 20 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $0E00            ; 0D 00 0E | Logical OR with accumulator (absolute)
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    ORA $1A00,Y          ; 19 00 1A | Logical OR with accumulator (absolute,Y)
    ORA $1E00,X          ; 1D 00 1E | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_301
; Address: $CFBEEF
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_301:
    JSL $002300          ; 22 00 23 00 | Jump to subroutine long
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    ROL $00              ; 26 00 | Rotate left (zero page)
    PLP                  ; 28 | Pull processor status from stack
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ROL                  ; 2A | Rotate left (accumulator)
    BIT $2D00            ; 2C 00 2D | Test bits in accumulator (absolute)
    ROL $2F00            ; 2E 00 2F | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_302
; Address: $CFBF0B
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_302:
    BMI $00              ; 30 00 | Branch if negative
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    AND $3A00,Y          ; 39 00 3A | Logical AND with accumulator (absolute,Y)
    AND $3E00,X          ; 3D 00 3E | Logical AND with accumulator (absolute,X)
    RTI                  ; 40 | Return from interrupt
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    WDM #$00             ; 42 00 | Reserved instruction
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    PHA                  ; 48 | Push accumulator to stack
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    LSR                  ; 4A | Logical shift right (accumulator)
    JMP $4D00            ; 4C 00 4D | Jump to address
    LSR $4F00            ; 4E 00 4F | Logical shift right (absolute)
    BVC $00              ; 50 00 | Branch if overflow clear
    EOR ($00),Y          ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
    CLI                  ; 58 | Clear interrupt disable flag
    EOR $5A00,Y          ; 59 00 5A | Exclusive OR with accumulator (absolute,Y)
    JMP $005D00          ; 5C 00 5D 00 | Jump to address long
    LSR $5F00,X          ; 5E 00 5F | Logical shift right (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_303
; Address: $CFBF6D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_303:
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    STZ $00              ; 64 00 | Store zero to zero page
    ADC $00              ; 65 00 | Add with carry (zero page)
    ROR $00              ; 66 00 | Rotate right (zero page)
    PLA                  ; 68 | Pull accumulator from stack
    ADC #$00             ; 69 00 | Add with carry (immediate)
    ROR                  ; 6A | Rotate right (accumulator)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_304
; Address: $CFBF83
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_304:
    JMP ($6D00)          ; 6C 00 6D | Jump to address (absolute indirect)
    ROR $6F00            ; 6E 00 6F | Rotate right (absolute)
    BVS $00              ; 70 00 | Branch if overflow set
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    SEI                  ; 78 | Set interrupt disable flag
    ADC $7A00,Y          ; 79 00 7A | Add with carry (absolute,Y)
    ADC $7E00,X          ; 7D 00 7E | Add with carry (absolute,X)
    BRA $FF              ; 80 FF | Branch always
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    STY $FF              ; 84 FF | Store Y register to zero page
    STA $FF              ; 85 FF | Store accumulator to zero page
    STX $FF              ; 86 FF | Store X register to zero page
    DEY                  ; 88 | Decrement Y register
    BIT #$FF             ; 89 FF | Test bits in accumulator (immediate)
    TXA                  ; 8A | Transfer X register to accumulator
    PHB                  ; 8B | Push data bank register to stack
    STY $8DFF            ; 8C FF 8D | Store Y register to absolute address
    STX $8FFF            ; 8E FF 8F | Store X register to absolute address
    BCC $FF              ; 90 FF | Branch if carry clear
    STA ($FF),Y          ; 91 FF | Store accumulator to (zero page),Y

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_305
; Address: $CFBFDB
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_305:
    TYA                  ; 98 | Transfer Y register to accumulator
    STA $9AFF,Y          ; 99 FF 9A | Store accumulator to absolute,Y
    STZ $9DFF            ; 9C FF 9D | Store zero to absolute
    STZ $9FFF,X          ; 9E FF 9F | Store zero to absolute,X
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    LDA ($FF,X)          ; A1 FF | Load from (zero page,X) into accumulator
    LDX #$FF             ; A2 FF | Load immediate value into X register
    LDY $FF              ; A4 FF | Load from zero page into Y register
    LDA $FF              ; A5 FF | Load from zero page into accumulator
    LDX $FF              ; A6 FF | Load from zero page into X register
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    TAX                  ; AA | Transfer accumulator to X register
    PLB                  ; AB | Pull data bank register from stack
    LDY $ADFF            ; AC FF AD | Load from absolute address into Y register
    LDX $AFFF            ; AE FF AF | Load from absolute address into X register
    BCS $FF              ; B0 FF | Branch if carry set
    LDA ($FF),Y          ; B1 FF | Load from (zero page),Y into accumulator
    CLV                  ; B8 | Clear overflow flag
    LDA $BAFF,Y          ; B9 FF BA | Load from absolute,Y into accumulator
    LDY $BDFF,X          ; BC FF BD | Load from absolute,X into Y register
    LDX $BFFF,Y          ; BE FF BF | Load from absolute,Y into X register
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    REP #$FF             ; C2 FF | Reset processor status bits
    CPY $FF              ; C4 FF | Compare Y register (zero page)
    CMP $FF              ; C5 FF | Compare accumulator (zero page)
    DEC $FF              ; C6 FF | Decrement (zero page)
    INY                  ; C8 | Increment Y register
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    DEX                  ; CA | Decrement X register
    CPY $CDFF            ; CC FF CD | Compare Y register (absolute)
    DEC $CFFF            ; CE FF CF | Decrement (absolute)
    BNE $FF              ; D0 FF | Branch if not equal
    CMP ($FF),Y          ; D1 FF | Compare accumulator ((zero page),Y)
    CLD                  ; D8 | Clear decimal mode flag
    CMP $DAFF,Y          ; D9 FF DA | Compare accumulator (absolute,Y)
    CMP $DEFF,X          ; DD FF DE | Compare accumulator (absolute,X)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    SEP #$FF             ; E2 FF | Set processor status bits
    CPX $FF              ; E4 FF | Compare X register (zero page)
    SBC $FF              ; E5 FF | Subtract with carry (zero page)
    INC $FF              ; E6 FF | Increment (zero page)
    INX                  ; E8 | Increment X register
    SBC #$FF             ; E9 FF | Subtract with carry (immediate)
    NOP                  ; EA | No operation
    XBA                  ; EB | Exchange accumulator bytes
    CPX $EDFF            ; EC FF ED | Compare X register (absolute)
    INC $EFFF            ; EE FF EF | Increment (absolute)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_306
; Address: $CFC08B
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_306:
    BEQ $FF              ; F0 FF | Branch if equal
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    PEA #$F5FF           ; F4 FF F5 | Push effective address to stack
    SED                  ; F8 | Set decimal mode flag
    SBC $FAFF,Y          ; F9 FF FA | Subtract with carry (absolute,Y)
    SBC $FEFF,X          ; FD FF FE | Subtract with carry (absolute,X)
    STA $40DB            ; 8D DB 40 | Store accumulator to absolute address
    STX $40E1            ; 8E E1 40 | Store X register to absolute address
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    STA $40              ; 85 40 | Store accumulator to zero page
    LDA #$CE             ; A9 CE | Load immediate value into accumulator
    STA $42              ; 85 42 | Hardware register operation
    STZ $40DF            ; 9C DF 40 | Store zero to absolute
    LDA $40DB            ; AD DB 40 | Load from absolute address into accumulator
    CMP #$81             ; C9 81 | Compare accumulator (immediate)
    BCC $0C              ; 90 0C | Branch if carry clear
    SEC                  ; 38 | Set carry flag
    SBC #$80             ; E9 80 | Subtract with carry (immediate)
    STA $40DB            ; 8D DB 40 | Store accumulator to absolute address
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    BRA $03              ; 80 03 | Branch always
    STZ $40DB            ; 9C DB 40 | Store zero to absolute
    STA $40DD            ; 8D DD 40 | Store accumulator to absolute address
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $40D9            ; 8D D9 40 | Store accumulator to absolute address
    LDX $40E1            ; AE E1 40 | Load from absolute address into X register
    LDY $40DF            ; AC DF 40 | Load from absolute address into Y register
    LSR                  ; 4A | Logical shift right (accumulator)
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BCS $59              ; B0 59 | Branch if carry set
    STZ $46              ; 64 46 | Store zero to zero page
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ROL $46              ; 26 46 | Rotate left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ROL $46              ; 26 46 | Rotate left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ROL $46              ; 26 46 | Rotate left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ROL $46              ; 26 46 | Rotate left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ROL $46              ; 26 46 | Rotate left (zero page)
    CLC                  ; 18 | Clear carry flag
    ADC $40              ; 65 40 | Add with carry (zero page)
    STA $44              ; 85 44 | Store accumulator to zero page
    LDA $42              ; A5 42 | Hardware register operation
    ADC $46              ; 65 46 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_307
; Address: $CFC107
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_307:
    STA $46              ; 85 46 | Store accumulator to zero page
    LDY #$00             ; A0 00 | Load immediate value into Y register
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    BCC $F2              ; 90 F2 | Branch if carry clear
    LDA $40DF            ; AD DF 40 | Load from absolute address into accumulator
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    STA $40DF            ; 8D DF 40 | Store accumulator to absolute address
    DEC $40DD            ; CE DD 40 | Decrement (absolute)
    BNE $BC              ; D0 BC | Branch if not equal
    LDY #$D3             ; A0 D3 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_309
; Address: $CFC12E
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_309:
    JSL $C02892          ; 22 92 28 C0 | Jump to subroutine long
    LDA $40D9            ; AD D9 40 | Load from absolute address into accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    CLC                  ; 18 | Clear carry flag
    ADC $40D7            ; 6D D7 40 | Add with carry (absolute)
    STA $40D7            ; 8D D7 40 | Store accumulator to absolute address
    LDA $40DB            ; AD DB 40 | Load from absolute address into accumulator
    BEQ $03              ; F0 03 | Branch if equal
    ADC $60FF,Y          ; 79 FF 60 | Add with carry (absolute,Y)
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $44              ; 85 44 | Store accumulator to zero page
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $46              ; 85 46 | Store accumulator to zero page
    TXA                  ; 8A | Transfer X register to accumulator
    CLC                  ; 18 | Clear carry flag
    ADC $46              ; 65 46 | Add with carry (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $40DD            ; AD DD 40 | Load from absolute address into accumulator
    INC                  ; 1A | Increment accumulator
    SEC                  ; 38 | Set carry flag
    SBC $44              ; E5 44 | Subtract with carry (zero page)
    STA $40DD            ; 8D DD 40 | Store accumulator to absolute address
    BRA $B7              ; 80 B7 | Branch always
    PHA                  ; 48 | Push accumulator to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $48              ; 85 48 | Store accumulator to zero page
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_30A
; Address: $CFC169
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_30A:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ADC $7C40            ; 6D 40 7C | Add with carry (absolute)
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BCC $0F              ; 90 0F | Branch if carry clear
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    SBC $7C40            ; ED 40 7C | Subtract with carry (absolute)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    STA $48              ; 85 48 | Store accumulator to zero page
    LSR                  ; 4A | Logical shift right (accumulator)
    ORA ($AE,X)          ; 01 AE | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    STA $40              ; 85 40 | Store accumulator to zero page
    LDA #$CE             ; A9 CE | Load immediate value into accumulator
    STA $42              ; 85 42 | Hardware register operation
    PHB                  ; 8B | Push data bank register to stack
    LDY #$00             ; A0 00 | Load immediate value into Y register
    STY $44              ; 84 44 | Store Y register to zero page
    LSR                  ; 4A | Logical shift right (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    XBA                  ; EB | Exchange accumulator bytes
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    STA $46              ; 85 46 | Store accumulator to zero page
    TYA                  ; 98 | Transfer Y register to accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLC                  ; 18 | Clear carry flag
    ADC $40              ; 65 40 | Add with carry (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register
    SEP #$20             ; E2 20 | Set processor status bits
    LDA $42              ; A5 42 | Hardware register operation
    ADC $46              ; 65 46 | Add with carry (zero page)
    PHA                  ; 48 | Push accumulator to stack
    PLB                  ; AB | Pull data bank register from stack
    REP #$20             ; C2 20 | Reset processor status bits
    LDA $0000,Y          ; B9 00 00 | Load from absolute,Y into accumulator
    STA                  ; 9F 40 70 7E | Store accumulator to absolute long,X
    LDA $0002,Y          ; B9 02 00 | Load from absolute,Y into accumulator
    STA                  ; 9F 42 70 7E | Store accumulator to absolute long,X
    LDA $0004,Y          ; B9 04 00 | Load from absolute,Y into accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_30B
; Address: $CFC1C6
; Size: 127 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_30B:
    STA                  ; 9F 44 70 7E | Store accumulator to absolute long,X
    LDA $0006,Y          ; B9 06 00 | Load from absolute,Y into accumulator
    STA                  ; 9F 46 70 7E | Store accumulator to absolute long,X
    LDA $0008,Y          ; B9 08 00 | Load from absolute,Y into accumulator
    STA                  ; 9F 48 70 7E | Store accumulator to absolute long,X
    LDA $000A,Y          ; B9 0A 00 | Load from absolute,Y into accumulator
    STA                  ; 9F 4A 70 7E | Store accumulator to absolute long,X
    LDA $000C,Y          ; B9 0C 00 | Load from absolute,Y into accumulator
    STA                  ; 9F 4C 70 7E | Store accumulator to absolute long,X
    LDA $000E,Y          ; B9 0E 00 | Load from absolute,Y into accumulator
    STA                  ; 9F 4E 70 7E | Store accumulator to absolute long,X
    LDA $0010,Y          ; B9 10 00 | Load from absolute,Y into accumulator
    STA                  ; 9F 50 70 7E | Store accumulator to absolute long,X
    LDA $0012,Y          ; B9 12 00 | Load from absolute,Y into accumulator
    STA                  ; 9F 52 70 7E | Store accumulator to absolute long,X
    LDA $0014,Y          ; B9 14 00 | Load from absolute,Y into accumulator
    STA                  ; 9F 54 70 7E | Store accumulator to absolute long,X
    LDA $0016,Y          ; B9 16 00 | Load from absolute,Y into accumulator
    STA                  ; 9F 56 70 7E | Store accumulator to absolute long,X
    LDA $0018,Y          ; B9 18 00 | Load from absolute,Y into accumulator
    STA                  ; 9F 58 70 7E | Store accumulator to absolute long,X
    LDA $001A,Y          ; B9 1A 00 | Load from absolute,Y into accumulator
    STA                  ; 9F 5A 70 7E | Store accumulator to absolute long,X
    LDA $001C,Y          ; B9 1C 00 | Load from absolute,Y into accumulator
    STA                  ; 9F 5C 70 7E | Store accumulator to absolute long,X
    LDA $001E,Y          ; B9 1E 00 | Load from absolute,Y into accumulator
    STA                  ; 9F 5E 70 7E | Store accumulator to absolute long,X
    LDY $44              ; A4 44 | Load from zero page into Y register
    TXA                  ; 8A | Transfer X register to accumulator
    CLC                  ; 18 | Clear carry flag
    ADC #$20             ; 69 20 | Add with carry (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    CPY $48              ; C4 48 | Compare Y register (zero page)
    BCS $28              ; B0 28 | Branch if carry set
    LSR                  ; 4A | Logical shift right (accumulator)
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BCS $05              ; B0 05 | Branch if carry set
    STY $44              ; 84 44 | Store Y register to zero page
    CLI                  ; 58 | Clear interrupt disable flag
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHA                  ; 48 | Push accumulator to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $46              ; 85 46 | Store accumulator to zero page
    TXA                  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_30C
; Address: $CFC24B
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_30C:
    CLC                  ; 18 | Clear carry flag
    ADC $46              ; 65 46 | Add with carry (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    SEC                  ; 38 | Set carry flag
    LDA $48              ; A5 48 | Load from zero page into accumulator
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    ORA ($85,X)          ; 01 85 | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    PLA                  ; 68 | Pull accumulator from stack
    BRA $D2              ; 80 D2 | Branch always
    PLB                  ; AB | Pull data bank register from stack
    STX $7C40            ; 8E 40 7C | Store X register to absolute address
    PLA                  ; 68 | Pull accumulator from stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $40D9            ; 8D D9 40 | Store accumulator to absolute address
    LDY #$D3             ; A0 D3 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_30E
; Address: $CFC270
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_30E:
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BEQ $16              ; F0 16 | Branch if equal
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $4392,X          ; 9D 92 43 | Store accumulator to absolute,X
    LDA $4332,X          ; BD 32 43 | Load from absolute,X into accumulator
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    BRA $9D              ; 80 9D | Branch always
    LDA $44B2,X          ; BD B2 44 | Load from absolute,X into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $04              ; F0 04 | Branch if equal
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_30F
; Address: $CFC293
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_30F:
    ORA $F0              ; 05 F0 | Logical OR with accumulator (zero page)
    SED                  ; F8 | Set decimal mode flag
    BVS $F3              ; 70 F3 | Branch if overflow set
    LDA $4332,X          ; BD 32 43 | Load from absolute,X into accumulator
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    STA $4332,X          ; 9D 32 43 | Store accumulator to absolute,X
    LDA $4512,X          ; BD 12 45 | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_311
; Address: $CFC2AA
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_311:
    JSR $9E6D            ; 20 6D 9E | Jump to subroutine
    TAX                  ; AA | Transfer accumulator to X register
    LDA $40C7            ; AD C7 40 | Load from absolute address into accumulator
    STA $4572,X          ; 9D 72 45 | Store accumulator to absolute,X
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ADC $99E3            ; 6D E3 99 | Add with carry (absolute)
    STA $4532,X          ; 9D 32 45 | Store accumulator to absolute,X
    BRA $CC              ; 80 CC | Branch always
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BEQ $20              ; F0 20 | Branch if equal
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CMP $4392,X          ; DD 92 43 | Compare accumulator (absolute,X)
    BNE $1E              ; D0 1E | Branch if not equal
    LDA $4412,X          ; BD 12 44 | Load from absolute,X into accumulator
    STA $4A              ; 85 4A | Store accumulator to zero page
    LDA $43F2,X          ; BD F2 43 | Load from absolute,X into accumulator
    STA $4C              ; 85 4C | Store accumulator to zero page
    LDY $4392,X          ; BC 92 43 | Load from absolute,X into Y register
    INY                  ; C8 | Increment Y register
    LSR                  ; 4A | Logical shift right (accumulator)
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    DEC                  ; 3A | Decrement accumulator
    CMP $4352,X          ; DD 52 43 | Compare accumulator (absolute,X)
    BCS $05              ; B0 05 | Branch if carry set
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_312
; Address: $CFC2EF
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_312:
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_313
; Address: $CFC2F4
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_313:
    PHA                  ; 48 | Push accumulator to stack
    PHY                  ; 5A | Push Y register to stack
    STA $4372,X          ; 9D 72 43 | Store accumulator to absolute,X
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ADC $4372,X          ; 7D 72 43 | Add with carry (absolute,X)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $43D2,X          ; BD D2 43 | Load from absolute,X into accumulator
    STA $4A              ; 85 4A | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_314
; Address: $CFC303
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_314:
    LDA $43B2,X          ; BD B2 43 | Load from absolute,X into accumulator
    STA $4C              ; 85 4C | Store accumulator to zero page
    LSR                  ; 4A | Logical shift right (accumulator)
    STA $4412,X          ; 9D 12 44 | Store accumulator to absolute,X
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LSR                  ; 4A | Logical shift right (accumulator)
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $43F2,X          ; 9D F2 43 | Store accumulator to absolute,X
    PLY                  ; 7A | Pull Y register from stack
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_315
; Address: $CFC31A
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_315:
    PHP                  ; 08 | Push processor status to stack
    SEI                  ; 78 | Set interrupt disable flag
    REP #$30             ; C2 30 | Reset processor status bits
    PHB                  ; 8B | Push data bank register to stack
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDX #$52             ; A2 52 | Load immediate value into X register
    WDM #$A0             ; 42 A0 | Reserved instruction
    RTI                  ; 40 | Return from interrupt
    EOR #$A9             ; 49 A9 | Exclusive OR with accumulator (immediate)
    ROR $227E,X          ; 7E 7E 22 | Rotate right (absolute,X)
    STZ $7AC7            ; 9C C7 7A | Store zero to absolute
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_316
; Address: $CFC33D
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_316:
    PHP                  ; 08 | Push processor status to stack
    SEI                  ; 78 | Set interrupt disable flag
    REP #$30             ; C2 30 | Reset processor status bits
    PHB                  ; 8B | Push data bank register to stack
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    STZ $423F            ; 9C 3F 42 | Hardware register operation
    LDY #$52             ; A0 52 | Load immediate value into Y register
    WDM #$A2             ; 42 A2 | Reserved instruction
    RTI                  ; 40 | Return from interrupt
    EOR #$A9             ; 49 A9 | Exclusive OR with accumulator (immediate)
    ROR $A27E,X          ; 7E 7E A2 | Rotate right (absolute,X)
    LDA $4252,X          ; BD 52 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_31A
; Address: $CFC369
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_31A:
    JSR $C421            ; 20 21 C4 | Jump to subroutine
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BCC $E9              ; 90 E9 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_31B
; Address: $CFC373
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_31B:
    JSL $C02892          ; 22 92 28 C0 | Jump to subroutine long
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_31C
; Address: $CFC37D
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_31C:
    PHX                  ; DA | Push X register to stack
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    BMI $07              ; 30 07 | Branch if negative
    CMP $4252,X          ; DD 52 42 | Hardware register operation
    BEQ $05              ; F0 05 | Branch if equal
    BRA $F5              ; 80 F5 | Branch always
    PLX                  ; FA | Pull X register from stack
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_31D
; Address: $CFC38C
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_31D:
    PHA                  ; 48 | Push accumulator to stack
    PHY                  ; 5A | Push Y register to stack
    ORA $A8              ; 05 A8 | Logical OR with accumulator (zero page)
    LDA $4552,X          ; BD 52 45 | Load from absolute,X into accumulator
    STA $4552,Y          ; 99 52 45 | Store accumulator to absolute,Y
    LDA $4592,X          ; BD 92 45 | Load from absolute,X into accumulator
    STA $4592,Y          ; 99 92 45 | Store accumulator to absolute,Y
    PLY                  ; 7A | Pull Y register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLX                  ; FA | Pull X register from stack
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_31E
; Address: $CFC3A2
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_31E:
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    STX $40CB            ; 8E CB 40 | Store X register to absolute address
    LDA $44B2,X          ; BD B2 44 | Load from absolute,X into accumulator
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    ROR                  ; 6A | Rotate right (accumulator)
    LDA $4452,X          ; BD 52 44 | Load from absolute,X into accumulator
    STA $40              ; 85 40 | Store accumulator to zero page
    LDA $4432,X          ; BD 32 44 | Load from absolute,X into accumulator
    STA $42              ; 85 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_31F
; Address: $CFC3BE
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_31F:
    RTI                  ; 40 | Return from interrupt
    STA $4A              ; 85 4A | Store accumulator to zero page
    LDY #$02             ; A0 02 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    STA $4C              ; 85 4C | Store accumulator to zero page
    LDY #$02             ; A0 02 | Load immediate value into Y register
    LSR                  ; 4A | Logical shift right (accumulator)
    STA $40CD            ; 8D CD 40 | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_320
; Address: $CFC3D3
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_320:
    JSR $9E6D            ; 20 6D 9E | Jump to subroutine
    LDX $40CB            ; AE CB 40 | Load from absolute address into X register
    LDA $40C7            ; AD C7 40 | Load from absolute address into accumulator
    STA $4592,X          ; 9D 92 45 | Store accumulator to absolute,X
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ADC $99E3            ; 6D E3 99 | Add with carry (absolute)
    STA $4552,X          ; 9D 52 45 | Store accumulator to absolute,X
    STA $40D7            ; 8D D7 40 | Store accumulator to absolute address
    LDA $4A              ; A5 4A | Load from zero page into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC #$04             ; 69 04 | Add with carry (immediate)
    BCC $02              ; 90 02 | Branch if carry clear
    INC $4C              ; E6 4C | Increment (zero page)
    STA $4A              ; 85 4A | Store accumulator to zero page
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    BPL $22              ; 10 22 | Branch if positive
    LDY #$8D             ; A0 8D | Load immediate value into Y register
    CPY #$AD             ; C0 AD | Compare Y register (immediate)
    INY                  ; C8 | Increment Y register
    ADC $AD48,X          ; 7D 48 AD | Add with carry (absolute,X)
    CPY $8D7D            ; CC 7D 8D | Compare Y register (absolute)
    RTI                  ; 40 | Return from interrupt
    LDA #$7E             ; A9 7E | Load immediate value into accumulator
    STA $40D5            ; 8D D5 40 | Store accumulator to absolute address
    LDA $40CD            ; AD CD 40 | Load from absolute address into accumulator
    LDX $7DCC            ; AE CC 7D | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_322
; Address: $CFC419
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_322:
    JSL $C08E1B          ; 22 1B 8E C0 | Jump to subroutine long
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_323
; Address: $CFC421
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_323:
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    STX $40CB            ; 8E CB 40 | Store X register to absolute address
    LDA $44B2,X          ; BD B2 44 | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_324
; Address: $CFC42A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_324:
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $EE              ; F0 EE | Branch if equal
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BEQ $05              ; F0 05 | Branch if equal
    BVC $E4              ; 50 E4 | Branch if overflow clear
    LDA $4512,X          ; BD 12 45 | Load from absolute,X into accumulator
    LDX #$40             ; A2 40 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_325
; Address: $CFC43F
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_325:
    JSR $9E6D            ; 20 6D 9E | Jump to subroutine
    LDX $40CB            ; AE CB 40 | Load from absolute address into X register
    LDA $40C7            ; AD C7 40 | Load from absolute address into accumulator
    STA $4572,X          ; 9D 72 45 | Store accumulator to absolute,X
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ADC $99E3            ; 6D E3 99 | Add with carry (absolute)
    STA $4532,X          ; 9D 32 45 | Store accumulator to absolute,X
    LDA $44B2,X          ; BD B2 44 | Load from absolute,X into accumulator
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BEQ $14              ; F0 14 | Branch if equal
    LDA $43F2,X          ; BD F2 43 | Load from absolute,X into accumulator
    STA $42              ; 85 42 | Hardware register operation
    LDA $4412,X          ; BD 12 44 | Load from absolute,X into accumulator
    STA $40              ; 85 40 | Store accumulator to zero page
    LDY $4392,X          ; BC 92 43 | Load from absolute,X into Y register
    RTI                  ; 40 | Return from interrupt
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    BEQ $AC              ; F0 AC | Branch if equal
    LDA $4532,X          ; BD 32 45 | Load from absolute,X into accumulator
    STA $40D7            ; 8D D7 40 | Store accumulator to absolute address
    LDA $4452,X          ; BD 52 44 | Load from absolute,X into accumulator
    STA $40              ; 85 40 | Store accumulator to zero page
    LDA $4432,X          ; BD 32 44 | Load from absolute,X into accumulator
    STA $42              ; 85 42 | Hardware register operation
    LDA $4412,X          ; BD 12 44 | Load from absolute,X into accumulator
    STA $4A              ; 85 4A | Store accumulator to zero page
    LDA $43F2,X          ; BD F2 43 | Load from absolute,X into accumulator
    STA $4C              ; 85 4C | Store accumulator to zero page
    LDY $4392,X          ; BC 92 43 | Load from absolute,X into Y register
    LSR                  ; 4A | Logical shift right (accumulator)
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $4A              ; 85 4A | Store accumulator to zero page
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ADC $4A              ; 65 4A | Add with carry (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register
    RTI                  ; 40 | Return from interrupt
    STA $4A              ; 85 4A | Store accumulator to zero page
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_326
; Address: $CFC4A1
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_326:
    STA $4C              ; 85 4C | Store accumulator to zero page
    LDY #$02             ; A0 02 | Load immediate value into Y register
    LSR                  ; 4A | Logical shift right (accumulator)
    BEQ $06              ; F0 06 | Branch if equal
    STA $40CD            ; 8D CD 40 | Store accumulator to absolute address
    ROR                  ; 6A | Rotate right (accumulator)
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    STX $40E5            ; 8E E5 40 | Store X register to absolute address
    STY $40E7            ; 8C E7 40 | Store Y register to absolute address
    TAX                  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_327
; Address: $CFC4C4
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_327:
    JSL $C9050D          ; 22 0D 05 C9 | Jump to subroutine long
    ASL $A600            ; 0E 00 A6 | Arithmetic shift left (absolute)
    WDM #$C5             ; 42 C5 | Reserved instruction
    LSR                  ; 4A | Logical shift right (accumulator)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LSR                  ; 4A | Logical shift right (accumulator)
    STA $00              ; 85 00 | Store accumulator to zero page
    INY                  ; C8 | Increment Y register
    LSR                  ; 4A | Logical shift right (accumulator)
    STA $01              ; 85 01 | Store accumulator to zero page
    LDA $4249            ; AD 49 42 | Hardware register operation
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ADC $4249            ; 6D 49 42 | Hardware register operation
    TAY                  ; A8 | Transfer accumulator to Y register
    STA $4A              ; 85 4A | Store accumulator to zero page
    INY                  ; C8 | Increment Y register
    STA $4B              ; 85 4B | Store accumulator to zero page
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LSR                  ; 4A | Logical shift right (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    BEQ $45              ; F0 45 | Branch if equal
    TXA                  ; 8A | Transfer X register to accumulator
    XBA                  ; EB | Exchange accumulator bytes
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $00              ; 85 00 | Store accumulator to zero page
    STA $02              ; 85 02 | Store accumulator to zero page
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LSR                  ; 4A | Logical shift right (accumulator)
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_329
; Address: $CFC513
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_329:
    JSL $C011E1          ; 22 E1 11 C0 | Jump to subroutine long
    LDA $40E5            ; AD E5 40 | Load from absolute address into accumulator
    SEC                  ; 38 | Set carry flag
    SBC $02              ; E5 02 | Subtract with carry (zero page)
    STA $40E5            ; 8D E5 40 | Store accumulator to absolute address
    INY                  ; C8 | Increment Y register
    LSR                  ; 4A | Logical shift right (accumulator)
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF AB BE C7 | Load from absolute long,X into accumulator
    LDX #$00             ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_32A
; Address: $CFC52F
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_32A:
    JSL $C011E1          ; 22 E1 11 C0 | Jump to subroutine long
    LDA $40E7            ; AD E7 40 | Load from absolute address into accumulator
    SEC                  ; 38 | Set carry flag
    SBC $00              ; E5 00 | Subtract with carry (zero page)
    STA $40E7            ; 8D E7 40 | Store accumulator to absolute address
    INY                  ; C8 | Increment Y register
    BRA $B0              ; 80 B0 | Branch always
    LDX $40E5            ; AE E5 40 | Load from absolute address into X register
    LDY $40E7            ; AC E7 40 | Load from absolute address into Y register
    PLA                  ; 68 | Pull accumulator from stack
    PLB                  ; AB | Pull data bank register from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_32B
; Address: $CFC54D
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_32B:
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_32C
; Address: $CFC559
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_32C:
    JSR $2400            ; 20 00 24 | Jump to subroutine
    PLP                  ; 28 | Pull processor status from stack
    BIT $3000            ; 2C 00 30 | Test bits in accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    RTI                  ; 40 | Return from interrupt
    PHA                  ; 48 | Push accumulator to stack
    JMP $5000            ; 4C 00 50 | Jump to address
    CLI                  ; 58 | Clear interrupt disable flag
    JMP $006000          ; 5C 00 60 00 | Jump to address long
    STZ $00              ; 64 00 | Store zero to zero page
    PLA                  ; 68 | Pull accumulator from stack
    JMP ($7000)          ; 6C 00 70 | Jump to address (absolute indirect)
    SEI                  ; 78 | Set interrupt disable flag
    BRA $00              ; 80 00 | Branch always
    STY $00              ; 84 00 | Store Y register to zero page
    DEY                  ; 88 | Decrement Y register
    STY $9000            ; 8C 00 90 | Store Y register to absolute address
    TYA                  ; 98 | Transfer Y register to accumulator
    STZ $A000            ; 9C 00 A0 | Store zero to absolute
    LDY $00              ; A4 00 | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_32D
; Address: $CFC59D
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_32D:
    TAY                  ; A8 | Transfer accumulator to Y register
    LDY $B000            ; AC 00 B0 | Load from absolute address into Y register
    CLV                  ; B8 | Clear overflow flag
    LDY $C000,X          ; BC 00 C0 | Load from absolute,X into Y register
    CPY $00              ; C4 00 | Compare Y register (zero page)
    INY                  ; C8 | Increment Y register
    CPY $D000            ; CC 00 D0 | Compare Y register (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX $00              ; E4 00 | Compare X register (zero page)
    INX                  ; E8 | Increment X register
    CPX $F000            ; EC 00 F0 | Compare X register (absolute)
    PEA #$F800           ; F4 00 F8 | Push effective address to stack
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    ORA ($14,X)          ; 01 14 | Logical OR with accumulator ((zero page,X))
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))
    ORA ($1C,X)          ; 01 1C | Logical OR with accumulator ((zero page,X))
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    ORA ($24,X)          ; 01 24 | Logical OR with accumulator ((zero page,X))
    ORA ($28,X)          ; 01 28 | Logical OR with accumulator ((zero page,X))
    ORA ($2C,X)          ; 01 2C | Logical OR with accumulator ((zero page,X))
    ORA ($30,X)          ; 01 30 | Logical OR with accumulator ((zero page,X))
    ORA ($34,X)          ; 01 34 | Logical OR with accumulator ((zero page,X))
    ORA ($38,X)          ; 01 38 | Logical OR with accumulator ((zero page,X))
    ORA ($3C,X)          ; 01 3C | Logical OR with accumulator ((zero page,X))
    ORA ($40,X)          ; 01 40 | Logical OR with accumulator ((zero page,X))
    ORA ($44,X)          ; 01 44 | Logical OR with accumulator ((zero page,X))
    ORA ($48,X)          ; 01 48 | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    ORA ($50,X)          ; 01 50 | Logical OR with accumulator ((zero page,X))
    ORA ($54,X)          ; 01 54 | Logical OR with accumulator ((zero page,X))
    ORA ($58,X)          ; 01 58 | Logical OR with accumulator ((zero page,X))
    ORA ($5C,X)          ; 01 5C | Logical OR with accumulator ((zero page,X))
    ORA ($60,X)          ; 01 60 | Logical OR with accumulator ((zero page,X))
    ORA ($64,X)          ; 01 64 | Logical OR with accumulator ((zero page,X))
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))
    ORA ($6C,X)          ; 01 6C | Logical OR with accumulator ((zero page,X))
    ORA ($70,X)          ; 01 70 | Logical OR with accumulator ((zero page,X))
    ORA ($74,X)          ; 01 74 | Logical OR with accumulator ((zero page,X))
    ORA ($78,X)          ; 01 78 | Logical OR with accumulator ((zero page,X))
    ORA ($7C,X)          ; 01 7C | Logical OR with accumulator ((zero page,X))
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))
    ORA ($84,X)          ; 01 84 | Logical OR with accumulator ((zero page,X))
    ORA ($88,X)          ; 01 88 | Logical OR with accumulator ((zero page,X))
    ORA ($8C,X)          ; 01 8C | Logical OR with accumulator ((zero page,X))
    ORA ($90,X)          ; 01 90 | Logical OR with accumulator ((zero page,X))
    ORA ($94,X)          ; 01 94 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_32E
; Address: $CFC614
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_32E:
    ORA ($98,X)          ; 01 98 | Logical OR with accumulator ((zero page,X))
    ORA ($9C,X)          ; 01 9C | Logical OR with accumulator ((zero page,X))
    ORA ($A0,X)          ; 01 A0 | Logical OR with accumulator ((zero page,X))
    ORA ($A4,X)          ; 01 A4 | Logical OR with accumulator ((zero page,X))
    ORA ($A8,X)          ; 01 A8 | Logical OR with accumulator ((zero page,X))
    ORA ($AC,X)          ; 01 AC | Logical OR with accumulator ((zero page,X))
    ORA ($B0,X)          ; 01 B0 | Logical OR with accumulator ((zero page,X))
    ORA ($B4,X)          ; 01 B4 | Logical OR with accumulator ((zero page,X))
    ORA ($B8,X)          ; 01 B8 | Logical OR with accumulator ((zero page,X))
    ORA ($BC,X)          ; 01 BC | Logical OR with accumulator ((zero page,X))
    ORA ($C0,X)          ; 01 C0 | Logical OR with accumulator ((zero page,X))
    ORA ($C4,X)          ; 01 C4 | Logical OR with accumulator ((zero page,X))
    ORA ($C8,X)          ; 01 C8 | Logical OR with accumulator ((zero page,X))
    ORA ($CC,X)          ; 01 CC | Logical OR with accumulator ((zero page,X))
    ORA ($D0,X)          ; 01 D0 | Logical OR with accumulator ((zero page,X))
    ORA ($D4,X)          ; 01 D4 | Logical OR with accumulator ((zero page,X))
    ORA ($D8,X)          ; 01 D8 | Logical OR with accumulator ((zero page,X))
    ORA ($DC,X)          ; 01 DC | Logical OR with accumulator ((zero page,X))
    ORA ($E0,X)          ; 01 E0 | Game work RAM access
    ORA ($E4,X)          ; 01 E4 | Logical OR with accumulator ((zero page,X))
    ORA ($E8,X)          ; 01 E8 | Logical OR with accumulator ((zero page,X))
    ORA ($EC,X)          ; 01 EC | Logical OR with accumulator ((zero page,X))
    ORA ($F0,X)          ; 01 F0 | Logical OR with accumulator ((zero page,X))
    ORA ($F4,X)          ; 01 F4 | Logical OR with accumulator ((zero page,X))
    ORA ($F8,X)          ; 01 F8 | Logical OR with accumulator ((zero page,X))
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $02              ; 80 02 | Branch always
    BRA $04              ; 80 04 | Branch always
    BRA $06              ; 80 06 | Branch always
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $80              ; 06 80 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BRA $0A              ; 80 0A | Branch always
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_32F
; Address: $CFC6A3
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_32F:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BRA $0C              ; 80 0C | Branch always
    BRA $0E              ; 80 0E | Branch always
    ASL $0E00            ; 0E 00 0E | Arithmetic shift left (absolute)
    ASL $0E00            ; 0E 00 0E | Arithmetic shift left (absolute)
    ASL $0E00            ; 0E 00 0E | Arithmetic shift left (absolute)
    ASL $1080            ; 0E 80 10 | Arithmetic shift left (absolute)
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $80              ; 10 80 | Branch if positive
    BRA $14              ; 80 14 | Branch always
    BRA $16              ; 80 16 | Branch always
    BRA $18              ; 80 18 | Branch always
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BRA $1A              ; 80 1A | Branch always
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    BRA $1C              ; 80 1C | Branch always
    BRA $1E              ; 80 1E | Branch always
    ASL $1E00,X          ; 1E 00 1E | Arithmetic shift left (absolute,X)
    ASL $1E00,X          ; 1E 00 1E | Arithmetic shift left (absolute,X)
    ASL $1E00,X          ; 1E 00 1E | Arithmetic shift left (absolute,X)
    ASL $0180,X          ; 1E 80 01 | Arithmetic shift left (absolute,X)
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_330
; Address: $CFC768
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_330:
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1E_DmaFunction_331
; Address: $CFC7ED
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank1E_DmaFunction_331:
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
